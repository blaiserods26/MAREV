import React, { useState } from 'react';
import { Upload, X, FileText, CheckCircle2, AlertCircle, FileCode } from 'lucide-react';
import { uploadASMFile } from '../services/api';
import { AnalysisResponse } from '../types/cfg';

interface UploadPanelProps {
  isOpen: boolean;
  onClose: () => void;
  onUploadSuccess: (res: AnalysisResponse) => void;
}

export const UploadPanel: React.FC<UploadPanelProps> = ({
  isOpen,
  onClose,
  onUploadSuccess,
}) => {
  const [file, setFile] = useState<File | null>(null);
  const [isUploading, setIsUploading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  if (!isOpen) return null;

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files[0]) {
      setFile(e.target.files[0]);
      setError(null);
    }
  };

  const handleDrop = (e: React.DragEvent<HTMLDivElement>) => {
    e.preventDefault();
    if (e.dataTransfer.files && e.dataTransfer.files[0]) {
      setFile(e.dataTransfer.files[0]);
      setError(null);
    }
  };

  const handleSubmit = async () => {
    if (!file) {
      setError('Please select an assembly file (.asm / .s) to upload.');
      return;
    }

    setIsUploading(true);
    setError(null);

    try {
      const result = await uploadASMFile(file);
      onUploadSuccess(result);
      onClose();
    } catch (err: any) {
      const msg = err.response?.data?.detail || err.message || 'Failed to upload and parse assembly file.';
      setError(msg);
    } finally {
      setIsUploading(false);
    }
  };

  return (
    <div
      style={{
        position: 'fixed',
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        backgroundColor: 'rgba(0, 0, 0, 0.75)',
        backdropFilter: 'blur(3px)',
        zIndex: 1000,
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
      }}
    >
      <div
        style={{
          width: '460px',
          backgroundColor: 'var(--bg-panel)',
          border: '1px solid var(--border-color)',
          borderRadius: '8px',
          boxShadow: '0 8px 32px rgba(0, 0, 0, 0.6)',
          display: 'flex',
          flexDirection: 'column',
          overflow: 'hidden',
        }}
      >
        {/* Header */}
        <div
          style={{
            padding: '12px 16px',
            backgroundColor: 'var(--bg-header)',
            borderBottom: '1px solid var(--border-color)',
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
          }}
        >
          <span style={{ fontWeight: 700, fontSize: '13px', color: 'var(--text-bright)', display: 'flex', alignItems: 'center', gap: '8px' }}>
            <Upload size={16} color="var(--color-accent)" /> Upload x86-64 Assembly (.asm)
          </span>
          <button
            onClick={onClose}
            style={{ background: 'transparent', border: 'none', color: 'var(--text-muted)', cursor: 'pointer' }}
          >
            <X size={16} />
          </button>
        </div>

        {/* Body */}
        <div style={{ padding: '20px', display: 'flex', flexDirection: 'column', gap: '16px' }}>
          <div
            onDragOver={(e) => e.preventDefault()}
            onDrop={handleDrop}
            style={{
              border: '2px dashed var(--border-color)',
              borderRadius: '6px',
              padding: '30px 20px',
              display: 'flex',
              flexDirection: 'column',
              alignItems: 'center',
              justifyContent: 'center',
              gap: '10px',
              backgroundColor: 'var(--bg-dark)',
              cursor: 'pointer',
            }}
            onClick={() => document.getElementById('asm-file-input')?.click()}
          >
            <FileCode size={36} color="var(--color-accent)" />
            <div style={{ textAlign: 'center' }}>
              <div style={{ fontWeight: 600, color: 'var(--text-bright)', fontSize: '12px' }}>
                {file ? file.name : 'Click to select or drag & drop objdump .asm file'}
              </div>
              <div style={{ fontSize: '10px', color: 'var(--text-muted)', marginTop: '4px' }}>
                Supports objdump elf64-x86-64 disassembly output files
              </div>
            </div>
            <input
              id="asm-file-input"
              type="file"
              accept=".asm,.s,.txt"
              onChange={handleFileChange}
              style={{ display: 'none' }}
            />
          </div>

          {error && (
            <div
              style={{
                backgroundColor: '#381616',
                border: '1px solid #f85149',
                color: '#f85149',
                padding: '8px 12px',
                borderRadius: '4px',
                fontSize: '11px',
                display: 'flex',
                alignItems: 'center',
                gap: '8px',
              }}
            >
              <AlertCircle size={14} /> {error}
            </div>
          )}

          {/* Footer Buttons */}
          <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '8px', marginTop: '10px' }}>
            <button
              onClick={onClose}
              style={{
                backgroundColor: 'var(--bg-card)',
                border: '1px solid var(--border-color)',
                color: 'var(--text-main)',
                padding: '6px 14px',
                borderRadius: '4px',
                fontSize: '11px',
                cursor: 'pointer',
              }}
            >
              Cancel
            </button>
            <button
              onClick={handleSubmit}
              disabled={isUploading || !file}
              style={{
                backgroundColor: isUploading || !file ? '#21262d' : '#238636',
                border: '1px solid #2ea043',
                color: '#ffffff',
                padding: '6px 16px',
                borderRadius: '4px',
                fontSize: '11px',
                fontWeight: 600,
                cursor: isUploading || !file ? 'not-allowed' : 'pointer',
                opacity: isUploading || !file ? 0.6 : 1,
              }}
            >
              {isUploading ? 'Parsing Static Analysis...' : 'Analyze Assembly'}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};
