# Recap Prototype

## Prediksi Awal Kesehatan Daun Tomat Berbasis Citra Digital

## 1. Gambaran Umum Prototype

Prototype ini merupakan sistem Machine Learning berbasis Computer Vision untuk melakukan prediksi awal kondisi kesehatan daun tomat berdasarkan gambar daun.

Sistem ini dibuat dengan alur end-to-end, mulai dari pengambilan dataset, persiapan data, training model, evaluasi hasil, visualisasi performa, hingga deployment ke web app menggunakan Streamlit.

Prototype ini tidak digunakan sebagai diagnosis final, tetapi sebagai alat bantu screening awal berdasarkan ciri visual pada daun.

---

## 2. Tujuan Prototype

Tujuan dari prototype ini adalah:

1. Membuat model Machine Learning yang dapat mengenali kondisi daun tomat.
2. Mengklasifikasikan gambar daun tomat ke dalam lima kelas.
3. Menampilkan hasil prediksi dalam bentuk aplikasi web sederhana.
4. Memberikan pengalaman praktik Machine Learning secara lengkap dari dataset sampai deployment.
5. Menunjukkan bahwa model memiliki batasan dan hanya valid untuk data yang sesuai dengan kelas yang dilatih.

---

## 3. Dataset yang Digunakan

Dataset yang digunakan berasal dari Kaggle melalui KaggleHub:

```python
vipoooool/new-plant-diseases-dataset
```

Dataset awal memiliki banyak kelas penyakit tanaman. Namun, prototype difokuskan hanya pada 5 kelas daun tomat agar sesuai dengan kebutuhan sistem.

---

## 4. Kelas yang Digunakan

Prototype menggunakan 5 kelas kondisi daun tomat:

```text
Bacterial Spot
Early Blight
Late Blight
Leaf Mold
Healthy
```

Mapping folder dataset ke output model:

```text
Tomato___Bacterial_spot  -> Bacterial Spot
Tomato___Early_blight    -> Early Blight
Tomato___Late_blight     -> Late Blight
Tomato___Leaf_Mold       -> Leaf Mold
Tomato___healthy         -> Healthy
```

Dengan keputusan ini, prototype hanya valid untuk prediksi awal pada daun tomat, bukan untuk semua tanaman.

---

## 5. Tools dan Library

Tools utama yang digunakan:

```text
Google Colab / Kaggle Notebook
KaggleHub
PyTorch
Torchvision
Matplotlib
Pandas
NumPy
PIL
Streamlit
Ngrok
```

Library utama:

```python
torch
torch.nn
torchvision.transforms
torchvision.datasets.ImageFolder
torch.utils.data.DataLoader
matplotlib.pyplot
pandas
numpy
PIL.Image
streamlit
pyngrok
```

---

## 6. Alur Prototype

Prototype dibagi menjadi beberapa fase:

```text
FASE 1: Data Loading
FASE 2: Persiapan Environment
FASE 3: Exploratory Data Analysis
FASE 4: Data Preparation
FASE 5: Modeling dan Training
FASE 6: Visualisasi Hasil
FASE 7: Deployment ke Web App Streamlit
```

---

## 7. FASE 1: Data Loading

Pada fase ini, dataset diunduh menggunakan KaggleHub.

Langkah utama:

1. Mengunduh dataset dari Kaggle.
2. Menyimpan lokasi dataset ke variabel `dataset_path`.
3. Mengecek isi folder utama dataset.
4. Memastikan folder training dan validation tersedia.

Output utama fase ini adalah path dataset yang akan digunakan pada fase berikutnya.

---

## 8. FASE 2: Persiapan Environment

Pada fase ini, semua library yang dibutuhkan diimport.

Tujuannya agar notebook siap digunakan untuk proses:

```text
pengolahan file
analisis data
visualisasi gambar
pembuatan dataset
training model
evaluasi model
deployment aplikasi
```

---

## 9. FASE 3: Exploratory Data Analysis

Pada fase EDA, dilakukan pengecekan awal terhadap dataset.

Hal yang dilakukan:

1. Menentukan lokasi folder dataset.
2. Menghitung total gambar.
3. Menampilkan contoh gambar.
4. Mengidentifikasi daftar kelas dataset.
5. Memisahkan kelas penyakit dan kelas sehat.
6. Mengidentifikasi data yang akan digunakan.
7. Membuat tabel jumlah data training dan validation.
8. Membuat visualisasi distribusi data.

Hasil dari fase ini memastikan bahwa 5 kelas daun tomat tersedia dan dapat digunakan untuk training model.

---

## 10. FASE 4: Data Preparation

Pada fase ini, dataset disiapkan agar bisa digunakan oleh model.

Langkah utama:

1. Menentukan 5 kelas target.
2. Membuat subset dataset khusus daun tomat.
3. Membuat folder training dan validation untuk subset.
4. Melakukan transformasi gambar.
5. Membuat dataset dengan `ImageFolder`.
6. Mengecek bentuk data gambar dan label.
7. Menentukan batch size.
8. Membuat DataLoader.
9. Menampilkan batch gambar training.

Transformasi gambar:

```text
Resize gambar menjadi 256 x 256
RandomHorizontalFlip
RandomRotation
ToTensor
```

Tujuan transformasi adalah membuat gambar siap diproses oleh model CNN.

---

## 11. FASE 5: Modeling dan Training

Model yang digunakan adalah ResNet9 custom berbasis PyTorch.

Komponen utama model:

```text
Convolution Block
Batch Normalization
ReLU
Max Pooling
Residual Connection
Linear Classifier
```

Input model:

```text
Ukuran gambar: 3 x 256 x 256
Channel: RGB
```

Output model:

```text
5 kelas kondisi daun tomat
```

Arsitektur akhir model menghasilkan output:

```text
Linear(512 -> 5)
```

Artinya model sudah sesuai dengan jumlah kelas yang digunakan.

---

## 12. Hyperparameter Training

Konfigurasi training yang digunakan:

```python
epochs = 2
max_lr = 0.01
grad_clip = 0.1
weight_decay = 1e-4
opt_func = torch.optim.Adam
```

Training menggunakan strategi One Cycle Learning Rate.

Tujuan penggunaan One Cycle Learning Rate adalah agar model dapat belajar lebih cepat pada awal proses training dan lebih stabil pada akhir training.

---

## 13. Hasil Training

Hasil evaluasi awal sebelum training:

```text
val_loss      = 1.6088
val_accuracy  = 20.85%
```

Hasil setelah epoch pertama:

```text
train_loss    = 0.7356
val_loss      = 0.6828
val_accuracy  = 79.24%
```

Hasil setelah epoch kedua:

```text
train_loss    = 0.2753
val_loss      = 0.0942
val_accuracy  = 96.70%
```

Ringkasan hasil:

| Tahap            | Train Loss | Validation Loss | Validation Accuracy |
| ---------------- | ---------: | --------------: | ------------------: |
| Sebelum Training |          - |          1.6088 |              20.85% |
| Epoch 0          |     0.7356 |          0.6828 |              79.24% |
| Epoch 1          |     0.2753 |          0.0942 |              96.70% |

---

## 14. Analisis Hasil Training

Hasil training menunjukkan bahwa model berhasil belajar dengan baik.

Indikator keberhasilan:

1. Validation accuracy meningkat dari 20.85% menjadi 96.70%.
2. Train loss turun dari 0.7356 menjadi 0.2753.
3. Validation loss turun dari 0.6828 menjadi 0.0942.
4. Model mampu mengenali pola visual pada gambar daun tomat.
5. Proses training berjalan stabil dengan One Cycle Learning Rate.

Nilai akurasi awal sekitar 20% wajar karena model belum belajar dan dataset memiliki 5 kelas. Setelah training, akurasi meningkat signifikan karena model mulai mengenali pola visual dari setiap kelas.

---

## 15. FASE 6: Visualisasi Hasil

Visualisasi yang dibuat:

```text
6.1 Ringkasan history training
6.2 Grafik akurasi validation
6.3 Grafik train loss dan validation loss
6.4 Grafik learning rate
6.5 Confusion matrix
6.6 Contoh hasil prediksi gambar validation
6.7 Classification report
```

Tujuan visualisasi:

1. Melihat perkembangan akurasi model.
2. Melihat penurunan loss.
3. Memastikan pola learning rate berjalan.
4. Menganalisis kesalahan prediksi antar kelas.
5. Melihat contoh hasil prediksi secara visual.
6. Mengevaluasi precision, recall, dan F1-score setiap kelas.

---

## 16. FASE 7: Deployment ke Web App Streamlit

Pada fase ini, model yang sudah dilatih disimpan dan digunakan pada aplikasi web berbasis Streamlit.

File yang disiapkan:

```text
plant-disease-model.pth
class_names.json
app.py
```

Fungsi setiap file:

```text
plant-disease-model.pth  -> menyimpan bobot model hasil training
class_names.json         -> menyimpan daftar nama kelas
app.py                   -> file utama aplikasi Streamlit
```

---

## 17. Fitur Web App

Fitur aplikasi Streamlit:

1. Upload gambar daun.
2. Input gambar melalui kamera.
3. Menampilkan gambar yang dipilih.
4. Melakukan preprocessing gambar.
5. Menjalankan prediksi menggunakan model.
6. Menampilkan hasil prediksi.
7. Menampilkan tingkat keyakinan model.
8. Memberikan catatan bahwa hasil hanya screening awal.

Kelas yang didukung aplikasi:

```text
Bacterial Spot
Early Blight
Healthy
Late Blight
Leaf Mold
```

---

## 18. Uji Coba Web App

Web app berhasil dijalankan menggunakan Streamlit dan Ngrok.

Alur deployment:

```text
Model hasil training
        ↓
Simpan model .pth
        ↓
Buat class_names.json
        ↓
Buat app.py
        ↓
Jalankan Streamlit
        ↓
Buat link publik menggunakan Ngrok
        ↓
Aplikasi bisa dibuka melalui browser
```

---

## 19. Keterbatasan Prototype

Keterbatasan prototype:

1. Model hanya valid untuk gambar daun tomat.
2. Model hanya dapat memprediksi 5 kelas.
3. Model belum bisa menolak gambar yang bukan daun.
4. Model belum memiliki kelas `Unknown` atau `Non Leaf`.
5. Akurasi tinggi hanya berlaku pada data validation yang sejenis dengan data training.
6. Hasil prediksi tidak boleh dianggap sebagai diagnosis final.
7. Kualitas gambar input dapat memengaruhi hasil prediksi.

---

## 20. Solusi Pengembangan

Beberapa pengembangan yang dapat dilakukan:

1. Menambahkan kelas baru `Unknown` atau `Non Leaf`.
2. Menambahkan dataset gambar selain daun.
3. Menambahkan validasi confidence threshold.
4. Menambahkan informasi batasan model pada web app.
5. Melatih model dengan jumlah epoch lebih banyak.
6. Menguji model dengan gambar daun tomat dari kamera langsung.
7. Membandingkan performa dengan arsitektur model lain.
8. Melakukan deployment permanen ke Streamlit Cloud.

---

## 22. Kesimpulan Prototype

Prototype berhasil dibuat dengan alur lengkap dari dataset sampai web app.

Prototype sudah mencakup:

```text
Data loading
EDA
Data preparation
Training model
Evaluasi model
Visualisasi hasil
Deployment Streamlit
Uji coba prediksi
```

Model berhasil mencapai validation accuracy sebesar 96.70% pada dataset validation daun tomat 5 kelas.

Prototype ini layak digunakan sebagai bahan dasar praktikum Machine Learning untuk siswa SMK karena alurnya jelas, berbasis proyek, dan menghasilkan aplikasi web sederhana yang dapat diuji langsung oleh pengguna.

Namun, prototype tetap memiliki batasan. Model hanya dapat digunakan untuk prediksi awal pada gambar daun tomat dan belum dapat mengenali gambar di luar domain seperti benda, manusia, atau tanaman lain.

Oleh karena itu, hasil prediksi harus dipahami sebagai screening awal, bukan diagnosis final.
