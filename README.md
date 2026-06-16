# UAT_Kebakaran — Kuesioner UAT Modul Fire Safety

Kuesioner **User Acceptance Testing** untuk modul pembelajaran gamifikasi keselamatan kebakaran berbasis web.

**Live App:** https://fire-safety-module.vercel.app

---

## File dalam Repository

| File | Deskripsi |
|------|-----------|
| `index.html` | Halaman kuesioner UAT interaktif (HTML + Supabase) |
| `KUESIONER_UAT_FIRE_SAFETY.md` | Versi markdown kuesioner + panduan skoring |
| `SUPABASE_SETUP.sql` | SQL untuk membuat tabel database di Supabase |
| `config.js` | File konfigurasi Supabase |

---

## Cara Setup Supabase

### 1. Buat Project Supabase

1. Buka https://supabase.com → Login → **New Project**
2. Isi:
   - **Name:** `uat-kebakaran` (atau bebas)
   - **Database Password:** simpan!
   - **Region:** pilih yang terdekat (Singapore)
3. Tunggu sampai selesai (~2 menit)

### 2. Buat Tabel Database

1. Di Supabase Dashboard → **SQL Editor**
2. Paste isi file `SUPABASE_SETUP.sql`
3. Klik **Run** — tabel `uat_responses` akan terbuat

### 3. Hubungkan ke HTML

1. Di Supabase Dashboard → **Project Settings** → **API**
2. Copy **Project URL** dan **Anon Public Key**
3. Buka file `index.html` → cari bagian `SUPABASE_URL` dan `SUPABASE_ANON_KEY` — isi dengan credentials tersebut

### 4. Deploy (GitHub Pages)

1. Push semua file ke GitHub
2. Buka repo → **Settings** → **Pages**
3. Source: **Deploy from branch** → `main` → `/ (root)`
4. URL akan aktif di `https://raharjoo91.github.io/UAT_Kebakaran/`

---

## Cara Export Data ke Excel

1. Supabase Dashboard → **Table Editor** → pilih `uat_responses`
2. Klik **Export** → **Download as CSV**
3. Buka file CSV di Microsoft Excel
4. **Save As** → pilih `.xlsx`

Atau langsung dari Excel:
- Excel → **Data** → **Get Data** → **From Database** → **From PostgreSQL Database**
- Masukkan credentials Supabase

---

## Struktur Tabel Database

| Kolom | Tipe | Deskripsi |
|-------|------|-----------|
| `id` | BIGINT | Primary key (auto increment) |
| `created_at` | TIMESTAMPTZ | Waktu pengisian |
| `kelas`, `jenis_kelamin`, `pengalaman_simulasi` | TEXT | Data responden |
| `B1`–`B6` | INT | Kualitas Sistem (1-5) |
| `C1`–`C6` | INT | Kualitas Informasi (1-5) |
| `D1`–`D6` | INT | Kualitas Antarmuka (1-5) |
| `E1`–`E6` | INT | Kepuasan Pengguna (1-5) |
| `F1`, `F2`, `F3` | TEXT | Umpan balik terbuka |
