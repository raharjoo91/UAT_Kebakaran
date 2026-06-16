// ============================================================
// KONFIGURASI SUPABASE
// ============================================================
// Isi credentials berikut setelah membuat project Supabase.
// CARA DAPATKAN:
// 1. Buka https://supabase.com → New Project
// 2. Project Settings → API → Copy URL & Anon Key
// 3. Paste di bawah ini
// ============================================================

const SUPABASE_CONFIG = {
    url: '',  // Contoh: https://abcdefghijklm.supabase.co
    anonKey: '' // Contoh: eyJhbGciOiJIUzI1NiIs...
};

// Jangan ubah bagian ini
if (typeof module !== 'undefined' && module.exports) {
    module.exports = SUPABASE_CONFIG;
}
