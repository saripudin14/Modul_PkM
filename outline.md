# Outline Modul Praktikum
## Prediksi Awal Kesehatan Daun Tomat Berbasis Citra Digital

---

## 📄 Bagian Awal (Frontmatter)

### Halaman Cover
- Judul modul
- Program studi
- Institusi pendidikan
- Tahun
- Status: **✅ Sudah ada** (`chapter/00_cover.tex`)

### Kata Pengantar
- Ucapan syukur
- Penjelasan singkat modul
- Harapan dan kritik/saran
- Status: **✅ Sudah ada** (`chapter/00_kata_pengantar.tex`)

### Daftar Isi
- Auto-generated oleh LaTeX (`\tableofcontents`)

### Daftar Gambar
- Auto-generated oleh LaTeX (`\listoffigures`)

---

## 📖 Bagian Isi (Mainmatter)

### Bab 1 — Pendahuluan
**Status: ✅ Sudah ada** (`chapter/01_pendahuluan.tex`)

Sub-bab:
1.1 Gambaran Umum
1.2 Tujuan Praktikum
1.3 Batasan Sistem
1.4 Persiapan Lingkungan Praktikum

---

### Bab 2 — Persiapan dan Eksplorasi Data
**Status: ❌ Belum dibuat**

Sub-bab:
2.1 Data Loading dengan KaggleHub
   - Mengunduh dataset dari Kaggle
   - Menyimpan path dataset
   - Memeriksa struktur folder dataset
2.2 Persiapan Environment
   - Import library (PyTorch, Torchvision, Matplotlib, dll)
2.3 Exploratory Data Analysis (EDA)
   - Menghitung total gambar
   - Menampilkan contoh gambar
   - Identifikasi daftar kelas
   - Memisahkan kelas penyakit dan kelas sehat
   - Tabel jumlah data training dan validation
   - Visualisasi distribusi data

---

### Bab 3 — Persiapan Data untuk Pemodelan
**Status: ❌ Belum dibuat**

Sub-bab:
3.1 Seleksi 5 Kelas Target
   - Bacterial Spot, Early Blight, Late Blight, Leaf Mold, Healthy
3.2 Membuat Subset Dataset Daun Tomat
3.3 Transformasi Gambar
   - Resize (256×256)
   - RandomHorizontalFlip
   - RandomRotation
   - ToTensor
3.4 Membuat Dataset dengan ImageFolder
3.5 Membuat DataLoader
3.6 Menampilkan Batch Gambar Training

---

### Bab 4 — Pemodelan dan Pelatihan
**Status: ❌ Belum dibuat**

Sub-bab:
4.1 Arsitektur ResNet9
   - Convolution Block
   - Batch Normalization
   - ReLU Activation
   - Max Pooling
   - Residual Connection
   - Linear Classifier
4.2 Konfigurasi Hyperparameter
   - Epochs, Max LR, Grad Clip, Weight Decay
   - Optimizer: Adam
   - One Cycle Learning Rate Strategy
4.3 Proses Training
4.4 Hasil Training
   - Sebelum Training: val_loss 1.6088, val_acc 20.85%
   - Epoch 1: train_loss 0.7356, val_loss 0.6828, val_acc 79.24%
   - Epoch 2: train_loss 0.2753, val_loss 0.0942, val_acc 96.70%
4.5 Analisis Hasil Training

---

### Bab 5 — Visualisasi dan Evaluasi Model
**Status: ❌ Belum dibuat**

Sub-bab:
5.1 Ringkasan History Training
5.2 Grafik Akurasi Validation
5.3 Grafik Train Loss dan Validation Loss
5.4 Grafik Learning Rate
5.5 Confusion Matrix
5.6 Contoh Hasil Prediksi Gambar Validation
5.7 Classification Report (Precision, Recall, F1-Score)

---

### Bab 6 — Deployment Aplikasi Web
**Status: ❌ Belum dibuat**

Sub-bab:
6.1 Menyimpan Model Hasil Training
   - Format `.pth`
6.2 Menyimpan Class Names (`class_names.json`)
6.3 Membangun Aplikasi dengan Streamlit
   - Upload gambar daun
   - Input gambar melalui kamera
   - Preprocessing gambar
   - Menjalankan prediksi
   - Menampilkan hasil dan confidence score
   - Catatan batasan sistem
6.4 Menjalankan Aplikasi dengan Ngrok
   - Tunneling ke publik
6.5 Uji Coba Web App

---

### Bab 7 — Penutup
**Status: ❌ Belum dibuat**

Sub-bab:
7.1 Keterbatasan Sistem
   - Hanya valid untuk daun tomat
   - Hanya 5 kelas
   - Tidak bisa menolak gambar non-daun
   - Akurasi tinggi hanya pada data sejenis
   - Bukan diagnosis final
7.2 Saran Pengembangan
   - Kelas Unknown/Non Leaf
   - Confidence threshold
   - Dataset lebih banyak
   - Epoch lebih banyak
   - Perbandingan arsitektur lain
   - Deployment permanen ke Streamlit Cloud
7.3 Kesimpulan

---

## 📚 Bagian Akhir (Backmatter)

### Daftar Pustaka
**Status: ❌ Belum dibuat**
- Referensi dataset Kaggle
- Dokumentasi PyTorch, Streamlit, dll

### Lampiran (Opsional)
**Status: ❌ Belum dibuat**
- Full kode program
- Panduan instalasi tambahan

---

## 📊 Ringkasan Progress

| Bagian | File | Status |
|--------|------|--------|
| Cover | `chapter/00_cover.tex` | ✅ Selesai |
| Kata Pengantar | `chapter/00_kata_pengantar.tex` | ✅ Selesai |
| Bab 1 Pendahuluan | `chapter/01_pendahuluan.tex` | ✅ Selesai |
| **Bab 2 Persiapan Data** | `chapter/02_persiapan_data.tex` | ❌ |
| **Bab 3 Persiapan Pemodelan** | `chapter/03_persiapan_pemodelan.tex` | ❌ |
| **Bab 4 Pemodelan & Training** | `chapter/04_pemodelan.tex` | ❌ |
| **Bab 5 Visualisasi & Evaluasi** | `chapter/05_visualisasi.tex` | ❌ |
| **Bab 6 Deployment** | `chapter/06_deployment.tex` | ❌ |
| **Bab 7 Penutup** | `chapter/07_penutup.tex` | ❌ |
| **Daftar Pustaka** | - | ❌ |
| **Lampiran** | - | ❌ |

---

> **Catatan:** Setiap bab akan mengacu pada konten teknis yang sudah ada di `prototype.md` sebagai bahan dasar penulisan.
