import React, { useCallback, useMemo, useEffect } from 'react';
import {
  ReactFlow,
  Background,
  Controls,
  useNodesState,
  useEdgesState,
  Node,
  Edge,
  MarkerType,
  Panel,
  useReactFlow
} from '@xyflow/react';
import '@xyflow/react/dist/style.css';
import dagre from 'dagre';
import { CFG, BasicBlock, CFGEdgeType } from '../types/cfg';
import { CFGNode } from './CFGNode';
import { Maximize2, RefreshCw, ZoomIn, ZoomOut } from 'lucide-react';

interface CFGCanvasProps {
  cfg: CFG | null;
  selectedBlockId: string | null;
  onSelectBlock: (block: BasicBlock | null) => void;
  showUnreachable: boolean;
}

const nodeTypes = {
  cfgNode: CFGNode,
};

const EDGE_COLORS: Record<CFGEdgeType, string> = {
  true: '#3fb950',
  false: '#f85149',
  jump: '#38bdf8',
  fallthrough: '#8b949e',
  return: '#d29922',
  indirect: '#a371f7',
  call: '#38bdf8',
  unknown: '#ff7b72',
};

function getDagreLayout(nodes: Node[], edges: Edge[], rankdir = 'TB') {
  const dagreGraph = new dagre.graphlib.Graph();
  dagreGraph.setDefaultEdgeLabel(() => ({}));
  dagreGraph.setGraph({ rankdir, nodesep: 60, ranksep: 80 });

  nodes.forEach((node) => {
    // Estimate height based on instruction count
    const block = (node.data as any)?.block as BasicBlock;
    const instCount = block?.instructions?.length || 1;
    const height = Math.min(240, 40 + Math.min(8, instCount) * 20 + 20);
    dagreGraph.setNode(node.id, { width: 260, height });
  });

  edges.forEach((edge) => {
    dagreGraph.setEdge(edge.source, edge.target);
  });

  dagre.layout(dagreGraph);

  const layoutedNodes = nodes.map((node) => {
    const nodeWithPosition = dagreGraph.node(node.id);
    const block = (node.data as any)?.block as BasicBlock;
    const instCount = block?.instructions?.length || 1;
    const height = Math.min(240, 40 + Math.min(8, instCount) * 20 + 20);

    return {
      ...node,
      position: {
        x: nodeWithPosition.x - 130,
        y: nodeWithPosition.y - height / 2,
      },
    };
  });

  return { nodes: layoutedNodes, edges };
}

export const CFGCanvas: React.FC<CFGCanvasProps> = ({
  cfg,
  selectedBlockId,
  onSelectBlock,
  showUnreachable,
}) => {
  const [nodes, setNodes, onNodesChange] = useNodesState<Node>([]);
  const [edges, setEdges, onEdgesChange] = useEdgesState<Edge>([]);
  const { fitView, zoomIn, zoomOut } = useReactFlow();

  // Convert CFG to React Flow nodes and edges with Dagre layout
  useEffect(() => {
    if (!cfg) {
      setNodes([]);
      setEdges([]);
      return;
    }

    const unreachableSet = new Set(cfg.unreachable_blocks);

    const initialNodes: Node[] = cfg.nodes.map((block) => ({
      id: block.id,
      type: 'cfgNode',
      data: {
        block,
        isSelected: block.id === selectedBlockId,
        isUnreachable: showUnreachable && unreachableSet.has(block.id),
      },
      position: { x: 0, y: 0 },
    }));

    const initialEdges: Edge[] = cfg.edges.map((e, idx) => {
      const color = EDGE_COLORS[e.type as CFGEdgeType] || '#8b949e';
      return {
        id: `e-${e.source}-${e.target}-${idx}`,
        source: e.source,
        target: e.target,
        label: e.type,
        type: 'smoothstep',
        animated: e.type === 'true' || e.type === 'jump',
        style: { stroke: color, strokeWidth: 2 },
        markerEnd: {
          type: MarkerType.ArrowClosed,
          color,
          width: 14,
          height: 14,
        },
        labelStyle: { fill: color, fontWeight: 600, fontSize: 11 },
        labelBgStyle: { fill: '#161b22', fillOpacity: 0.9, rx: 4, ry: 4 },
        labelBgPadding: [4, 2] as [number, number],
      };
    });

    const layouted = getDagreLayout(initialNodes, initialEdges, 'TB');
    setNodes(layouted.nodes);
    setEdges(layouted.edges);

    setTimeout(() => {
      fitView({ padding: 0.2, duration: 250 });
    }, 50);
  }, [cfg, selectedBlockId, showUnreachable, setNodes, setEdges, fitView]);

  const onNodeClick = useCallback(
    (_: React.MouseEvent, node: Node) => {
      const block = (node.data as any)?.block as BasicBlock;
      onSelectBlock(block || null);
    },
    [onSelectBlock]
  );

  const handleResetLayout = () => {
    if (nodes.length > 0) {
      const layouted = getDagreLayout(nodes, edges, 'TB');
      setNodes(layouted.nodes);
      fitView({ padding: 0.2, duration: 300 });
    }
  };

  if (!cfg) {
    return (
      <div
        style={{
          width: '100%',
          height: '100%',
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          justifyContent: 'center',
          backgroundColor: 'var(--bg-dark)',
          color: 'var(--text-muted)',
          gap: '12px',
        }}
      >
        <div style={{ fontSize: '15px', fontWeight: 600, color: 'var(--text-main)' }}>
          No Function Selected
        </div>
        <div style={{ fontSize: '12px' }}>
          Select a function from the sidebar to view its Control Flow Graph.
        </div>
      </div>
    );
  }

  return (
    <div style={{ width: '100%', height: '100%', position: 'relative' }}>
      <ReactFlow
        nodes={nodes}
        edges={edges}
        nodeTypes={nodeTypes}
        onNodesChange={onNodesChange}
        onEdgesChange={onEdgesChange}
        onNodeClick={onNodeClick}
        fitView
        minZoom={0.1}
        maxZoom={2.5}
        defaultEdgeOptions={{ type: 'smoothstep' }}
      >
        <Background color="#21262d" gap={16} size={1} />
        <Controls showInteractive={false} />

        <Panel position="top-right" style={{ display: 'flex', gap: '6px' }}>
          <button
            onClick={() => fitView({ duration: 200 })}
            title="Fit View"
            style={{
              background: 'var(--bg-panel)',
              border: '1px solid var(--border-color)',
              color: 'var(--text-main)',
              padding: '6px 10px',
              borderRadius: '4px',
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              gap: '6px',
              fontSize: '11px',
              fontWeight: 500,
            }}
          >
            <Maximize2 size={13} /> Fit View
          </button>
          <button
            onClick={handleResetLayout}
            title="Reset Auto Layout"
            style={{
              background: 'var(--bg-panel)',
              border: '1px solid var(--border-color)',
              color: 'var(--text-main)',
              padding: '6px 10px',
              borderRadius: '4px',
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              gap: '6px',
              fontSize: '11px',
              fontWeight: 500,
            }}
          >
            <RefreshCw size={13} /> Reset Layout
          </button>
        </Panel>
      </ReactFlow>
    </div>
  );
};
