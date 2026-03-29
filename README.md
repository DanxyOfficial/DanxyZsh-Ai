# ⚡ Style Termux Intregrasi AI DanxyZsh-AI 2026

**DanxyZsh-AI** adalah environment ZSH khusus untuk Termux yang menggabungkan **tampilan modern, efisiensi CLI, dan integrasi AI** dalam satu sistem.

Dibuat untuk meningkatkan produktivitas pengguna Termux tanpa mengorbankan kenyamanan visual.

---

## 📌 Overview

DanxyZsh-AI mengubah terminal biasa menjadi workspace yang:
- Lebih cepat digunakan
- Lebih informatif
- Lebih rapi secara visual
- Siap digunakan untuk aktivitas development maupun daily usage
- Tidak perlu bolak belik ke aplikasi AI untuk menanyakan error

---

## ✨ Key Features

### 1. 🔥 Smart Path Rendering
Menampilkan path secara dinamis dengan hanya menampilkan bagian penting.

**Contoh:**
```
/folder1/folder2/folder3
↓
.../folder2/folder3
```

**Manfaat:**
- Menghindari path terlalu panjang
- Fokus ke direktori aktif
- Tampilan lebih clean

---

### 2. 🎨 Structured Prompt Interface
Prompt dirancang dengan struktur jelas dan informatif.

**Komponen:**
- Username & Host
- Current Directory (Smart Path)
- Indicator
- Exit Status Command

**Contoh:**
```
┌─[YourName@localhost]─[.../TOOLS]
├─[✓]─[0]
└──╼ ❯❯❯
```

**Keterangan:**
- `[0]` = command sebelumnya berhasil
- `[1]` atau selain 0 = error

---

### 3. ⚡ Built-in ZSH Enhancements

#### ✔ zsh-autosuggestions
- Menampilkan saran command berdasarkan history
- Mempercepat pengetikan

#### ✔ zsh-syntax-highlighting
- Command valid → warna hijau
- Command error → warna merah
- Membantu deteksi kesalahan sebelum dijalankan

---

### 4. 🤖 AI CLI Integration

Akses AI langsung dari terminal.

**Contoh penggunaan:**
```
ai cara install nodejs di termux
ai perbaiki error bash script
```

**Fungsi:**
- Bantuan coding
- Debugging
- Penjelasan konsep
- Automasi kerja

---

### 5. ⌨️ Custom Termux Key Layout

Extra keys sudah dikonfigurasi untuk meningkatkan efisiensi.

**Fitur:**
- Navigasi cepat (↑ ↓ ← →)
- Akses tombol penting (CTRL, ALT, TAB)
- Shortcut tambahan

**Manfaat:**
- Mengurangi ketergantungan keyboard eksternal
- Akses cepat ke fungsi terminal

---

### 6. ⚙️ Productivity Aliases

Alias bawaan untuk mempercepat workflow:

| Command | Fungsi |
|--------|--------|
| `l` | List file |
| `ll` | List detail |
| `la` | List semua (termasuk hidden) |
| `c` | Clear terminal |
| `pkgup` | Update & upgrade package |
| `pkgin` | Install package |
| `h` | History |

---

### 7. 🧠 Intelligent Shell Behavior

- History tidak duplikat
- Navigasi history berbasis pencarian
- Custom error message untuk command tidak dikenal
- Struktur environment lebih rapi

---

## 🚀 Installation

Ikuti langkah berikut:

```bash
git clone https://github.com/DanxyOfficial/DanxyZsh-Ai
cd DanxyZsh-Ai
make run
```

## TUTORIAL VIDEO:
---

## ⚙️ Post Installation

Setelah instalasi:

```bash
zsh
```

Atau restart Termux.

---

## 🧩 Basic Usage

Beberapa command utama:

```
ai pertanyaan_kamu
setname
pkgup
l / ll / la
```

---

## 🛠 Requirements

- Termux (versi terbaru)
- Koneksi internet saat instalasi
- Storage permission (jika menggunakan /sdcard)

---

## 🎯 Project Goals

DanxyZsh-AI dibuat untuk:

- Meningkatkan produktivitas pengguna Termux
- Menyederhanakan workflow CLI
- Menggabungkan UI + fungsi + AI dalam satu environment
- Memberikan pengalaman terminal yang modern dan efisien

---

## ⚠️ Notes

- Jangan ubah file konfigurasi tanpa memahami strukturnya
- Beberapa fitur bergantung pada koneksi internet
- Direkomendasikan untuk penggunaan personal / development

---

## 👑 Author

Danxy Official

---

## 📣 Support

Jika project ini membantu:

- ⭐ Beri star pada repository
- 🔁 Bagikan ke pengguna lain
- 💡 Gunakan dan kembangkan sesuai kebutuhan

---

## 📜 License

Project ini dibuat untuk penggunaan bebas dengan tetap menghargai author.

---

> "ANTI BACKDOR DANXY OFFICIAL AMANAH! MENGUTAMAKAN KEPUASAN PENGGUNA DAN FUNGSI STYLE TERMUX."
