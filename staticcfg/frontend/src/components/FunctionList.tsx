import React, { useState, useMemo } from 'react';
import { FunctionSummary } from '../types/cfg';
import { Search, Filter, Cpu, Layers, Sparkles, Tag } from 'lucide-react';

interface FunctionListProps {
  functions: FunctionSummary[];
  sections: string[];
  selectedFunction: string | null;
  onSelectFunction: (name: string) => void;
  isLoading: boolean;
}

export const FunctionList: React.FC<FunctionListProps> = ({
  functions,
  sections,
  selectedFunction,
  onSelectFunction,
  isLoading,
}) => {
  const [query, setQuery] = useState('');
  const [selectedSection, setSelectedSection] = useState<string>('ALL');
  const [selectedCategory, setSelectedCategory] = useState<string>('ALL');
  const [hidePlt, setHidePlt] = useState(false);
  const [hideCold, setHideCold] = useState(false);

  const categories = useMemo(() => {
    const set = new Set<string>();
    functions.forEach((fn) => {
      if (fn.semantic_category && fn.semantic_category !== 'UNKNOWN') {
        set.add(fn.semantic_category);
      }
    });
    return Array.from(set).sort();
  }, [functions]);

  const filteredFunctions = useMemo(() => {
    return functions.filter((fn) => {
      if (selectedSection !== 'ALL' && fn.section !== selectedSection) {
        return false;
      }
      if (selectedCategory !== 'ALL' && fn.semantic_category !== selectedCategory) {
        return false;
      }
      if (hidePlt && (fn.section === '.plt' || fn.name === '.plt')) {
        return false;
      }
      if (hideCold && fn.name.includes('.cold')) {
        return false;
      }
      if (query.trim()) {
        const q = query.toLowerCase().trim();
        const matchesName = fn.name.toLowerCase().includes(q);
        const matchesAddr = fn.address.toLowerCase().includes(q);
        const matchesPred = Boolean(fn.predicted_name && fn.predicted_name.toLowerCase().includes(q));
        const matchesCat = Boolean(fn.semantic_category && fn.semantic_category.toLowerCase().includes(q));
        if (!matchesName && !matchesAddr && !matchesPred && !matchesCat) return false;
      }
      return true;
    });
  }, [functions, query, selectedSection, selectedCategory, hidePlt, hideCold]);

  return (
    <div
      style={{
        width: '320px',
        height: '100%',
        backgroundColor: 'var(--bg-sidebar)',
        borderRight: '1px solid var(--border-color)',
        display: 'flex',
        flexDirection: 'column',
        userSelect: 'none',
      }}
    >
      {/* Search Header */}
      <div style={{ padding: '10px 12px', borderBottom: '1px solid var(--border-color)', display: 'flex', flexDirection: 'column', gap: '8px' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <span style={{ fontWeight: 700, color: 'var(--text-bright)', fontSize: '12px', textTransform: 'uppercase', letterSpacing: '0.5px', display: 'flex', alignItems: 'center', gap: '6px' }}>
            <Cpu size={14} color="var(--color-accent)" /> Functions ({filteredFunctions.length})
          </span>
          <span style={{ fontSize: '10px', color: 'var(--text-muted)' }}>
            Total: {functions.length}
          </span>
        </div>

        {/* Search Input */}
        <div
          style={{
            display: 'flex',
            alignItems: 'center',
            backgroundColor: 'var(--bg-dark)',
            border: '1px solid var(--border-color)',
            borderRadius: '4px',
            padding: '4px 8px',
            gap: '6px',
          }}
        >
          <Search size={13} color="var(--text-muted)" />
          <input
            type="text"
            placeholder="Search function, 0xaddr, or predicted name..."
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            style={{
              background: 'transparent',
              border: 'none',
              outline: 'none',
              color: 'var(--text-bright)',
              fontSize: '11px',
              fontFamily: 'var(--font-mono)',
              width: '100%',
            }}
          />
        </div>

        {/* Section & Category Filters */}
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '6px' }}>
          <div style={{ display: 'flex', gap: '4px', alignItems: 'center' }}>
            <Layers size={11} color="var(--text-muted)" />
            <select
              value={selectedSection}
              onChange={(e) => setSelectedSection(e.target.value)}
              style={{
                backgroundColor: 'var(--bg-dark)',
                color: 'var(--text-main)',
                border: '1px solid var(--border-color)',
                borderRadius: '3px',
                padding: '2px 4px',
                fontSize: '10px',
                outline: 'none',
                width: '100%',
              }}
            >
              <option value="ALL">All Sections</option>
              {sections.map((sec) => (
                <option key={sec} value={sec}>
                  {sec}
                </option>
              ))}
            </select>
          </div>

          <div style={{ display: 'flex', gap: '4px', alignItems: 'center' }}>
            <Tag size={11} color="var(--text-muted)" />
            <select
              value={selectedCategory}
              onChange={(e) => setSelectedCategory(e.target.value)}
              style={{
                backgroundColor: 'var(--bg-dark)',
                color: 'var(--text-main)',
                border: '1px solid var(--border-color)',
                borderRadius: '3px',
                padding: '2px 4px',
                fontSize: '10px',
                outline: 'none',
                width: '100%',
              }}
            >
              <option value="ALL">All Categories</option>
              {categories.map((cat) => (
                <option key={cat} value={cat}>
                  {cat}
                </option>
              ))}
            </select>
          </div>
        </div>

        {/* Checkbox Toggles */}
        <div style={{ display: 'flex', gap: '12px', fontSize: '10px', color: 'var(--text-muted)' }}>
          <label style={{ display: 'flex', alignItems: 'center', gap: '4px', cursor: 'pointer' }}>
            <input
              type="checkbox"
              checked={hidePlt}
              onChange={(e) => setHidePlt(e.target.checked)}
              style={{ accentColor: 'var(--color-accent)' }}
            />
            Hide PLT
          </label>
          <label style={{ display: 'flex', alignItems: 'center', gap: '4px', cursor: 'pointer' }}>
            <input
              type="checkbox"
              checked={hideCold}
              onChange={(e) => setHideCold(e.target.checked)}
              style={{ accentColor: 'var(--color-accent)' }}
            />
            Hide Cold
          </label>
        </div>
      </div>

      {/* Function List Scroll Container */}
      <div style={{ flex: 1, overflowY: 'auto' }}>
        {isLoading ? (
          <div style={{ padding: '20px', textAlign: 'center', color: 'var(--text-muted)', fontSize: '11px' }}>
            Loading functions...
          </div>
        ) : filteredFunctions.length === 0 ? (
          <div style={{ padding: '20px', textAlign: 'center', color: 'var(--text-muted)', fontSize: '11px' }}>
            No matching functions found.
          </div>
        ) : (
          filteredFunctions.map((fn) => {
            const isSelected = selectedFunction === fn.name;
            const hasPrediction = Boolean(fn.predicted_name && fn.predicted_name !== fn.name);

            return (
              <div
                key={`${fn.name}-${fn.start_address}`}
                onClick={() => onSelectFunction(fn.name)}
                style={{
                  padding: '7px 12px',
                  borderBottom: '1px solid #21262d',
                  backgroundColor: isSelected ? '#1f2937' : 'transparent',
                  borderLeft: isSelected ? '3px solid var(--color-accent)' : '3px solid transparent',
                  cursor: 'pointer',
                  display: 'flex',
                  flexDirection: 'column',
                  gap: '3px',
                  transition: 'background-color 0.1s ease',
                }}
              >
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <span
                    style={{
                      fontFamily: 'var(--font-mono)',
                      fontWeight: isSelected ? 700 : 500,
                      fontSize: '11px',
                      color: isSelected ? 'var(--text-bright)' : 'var(--text-main)',
                      overflow: 'hidden',
                      textOverflow: 'ellipsis',
                      whiteSpace: 'nowrap',
                      maxWidth: '180px',
                    }}
                    title={fn.name}
                  >
                    {fn.name}
                  </span>
                  <div style={{ display: 'flex', gap: '4px', alignItems: 'center' }}>
                    {fn.semantic_category && fn.semantic_category !== 'UNKNOWN' && (
                      <span
                        style={{
                          fontSize: '8px',
                          padding: '1px 3px',
                          borderRadius: '2px',
                          backgroundColor: '#23863633',
                          color: '#3fb950',
                          border: '1px solid #23863655',
                          fontFamily: 'var(--font-mono)',
                          textTransform: 'uppercase',
                        }}
                      >
                        {fn.semantic_category.replace('_', ' ').slice(0, 10)}
                      </span>
                    )}
                    <span
                      style={{
                        fontSize: '9px',
                        padding: '1px 4px',
                        borderRadius: '2px',
                        backgroundColor: fn.section === '.text' ? '#1c2d3d' : '#2d211c',
                        color: fn.section === '.text' ? '#58a6ff' : '#d29922',
                        fontFamily: 'var(--font-mono)',
                      }}
                    >
                      {fn.section || '.text'}
                    </span>
                  </div>
                </div>

                {/* Predicted Identity Pill (if stripped or identified) */}
                {hasPrediction && (
                  <div style={{ display: 'flex', alignItems: 'center', gap: '4px', marginTop: '1px' }}>
                    <Sparkles size={11} color="#58a6ff" />
                    <span
                      style={{
                        fontSize: '10px',
                        color: '#58a6ff',
                        fontFamily: 'var(--font-mono)',
                        fontWeight: 600,
                        overflow: 'hidden',
                        textOverflow: 'ellipsis',
                        whiteSpace: 'nowrap',
                        maxWidth: '210px',
                      }}
                      title={`Predicted: ${fn.predicted_name} (${Math.round((fn.confidence || 0) * 100)}%)`}
                    >
                      {fn.predicted_name}
                    </span>
                    {fn.confidence !== undefined && fn.confidence !== null && (
                      <span style={{ fontSize: '9px', color: '#7ee787', fontFamily: 'var(--font-mono)' }}>
                        {Math.round(fn.confidence * 100)}%
                      </span>
                    )}
                  </div>
                )}

                <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '10px', color: 'var(--text-muted)', fontFamily: 'var(--font-mono)' }}>
                  <span>{fn.address}</span>
                  <span>{fn.instruction_count} insts</span>
                </div>
              </div>
            );
          })
        )}
      </div>
    </div>
  );
};
