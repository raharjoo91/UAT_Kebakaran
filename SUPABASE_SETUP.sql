-- ============================================================
-- SUPABASE SETUP: Table untuk menyimpan hasil kuesioner UAT
-- ============================================================
-- Jalankan SQL ini di Supabase SQL Editor:
-- 1. Buka https://supabase.com  →  project kamu → SQL Editor
-- 2. Paste & Run
-- ============================================================

-- Buat tabel uat_responses (hapus dulu jika sudah ada versi lama)
DROP TABLE IF EXISTS uat_responses;

CREATE TABLE uat_responses (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    created_at TIMESTAMPTZ DEFAULT NOW(),

    -- Bagian A: Identitas
    kelas TEXT,
    jenis_kelamin TEXT,
    pengalaman_simulasi TEXT,

    -- Bagian B: System Quality / Kualitas Sistem (1-5)
    B1 INT, B2 INT, B3 INT, B4 INT, B5 INT,

    -- Bagian C: Ease of Use / Kemudahan Penggunaan (1-5)
    C1 INT, C2 INT, C3 INT, C4 INT, C5 INT,

    -- Bagian D: Information Quality / Kualitas Informasi (1-5)
    D1 INT, D2 INT, D3 INT, D4 INT, D5 INT,

    -- Bagian E: Interface Quality / Kualitas Antarmuka (1-5)
    E1 INT, E2 INT, E3 INT, E4 INT, E5 INT,

    -- Bagian F: Satisfaction & Acceptance / Kepuasan & Penerimaan (1-5)
    F1 INT, F2 INT, F3 INT, F4 INT, F5 INT,

    -- Bagian G: Umpan Balik Terbuka
    G1 TEXT,
    G2 TEXT,
    G3 TEXT
);

-- Aktifkan Row Level Security (boleh public insert)
ALTER TABLE uat_responses ENABLE ROW LEVEL SECURITY;

-- Beri izin dasar INSERT untuk role anon (wajib untuk RLS)
GRANT INSERT ON public.uat_responses TO anon;

-- Policy: siapa pun boleh insert (untuk kuesioner)
CREATE POLICY "public_insert_uat" ON uat_responses
    FOR INSERT TO anon
    WITH CHECK (true);

-- Policy: hanya admin yang bisa lihat data
CREATE POLICY "admin_select_uat" ON uat_responses
    FOR SELECT TO authenticated
    USING (true);

-- ============================================================
-- EXPORT DATA KE EXCEL
-- ============================================================
-- Di Supabase Dashboard:
-- Table Editor → pilih uat_responses → Export → Download as CSV
-- Buka CSV di Excel, Save As .xlsx
-- ============================================================
