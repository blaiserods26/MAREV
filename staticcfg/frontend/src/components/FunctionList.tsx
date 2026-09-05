import React, { useState, useMemo } from 'react';
import { FunctionSummary } from '../types/cfg';
import { Search, Filter, Cpu, Layers } from 'lucide-react';

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
  const [hidePlt, setHidePlt] = useState(false);
  const [hideCold, setHideCold] = useState(false);

  const filteredFunctions = useMemo(() => {
    return functions.filter((fn) => {
      if (selectedSection !== 'ALL' && fn.section !== selectedSection) {
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
        if (!matchesName && !matchesAddr) return false;
      }
      return true;
    });
  }, [functions, query, selectedSection, hidePlt, hideCold]);

  return (
    <div
      style={{
        width: '300px',
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
            placeholder="Search function or 0xaddr..."
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

        {/* Filters */}
        <div style={{ display: 'flex', gap: '6px', alignItems: 'center' }}>
          <Layers size={12} color="var(--text-muted)" />
          <select
            value={selectedSection}
            onChange={(e) => setSelectedSection(e.target.value)}
            style={{
              backgroundColor: 'var(--bg-dark)',
              color: 'var(--text-main)',
              border: '1px solid var(--border-color)',
              borderRadius: '3px',
              padding: '2px 6px',
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
