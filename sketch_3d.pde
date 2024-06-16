float angleX = 0;
float angleY = 0;
float angleZ = 0;

void setup() {
  size(1280, 720, P3D);
}

void draw() {
  background(255);
  lights();
  translate(width / 2, height / 2, 0);

  // Menggerakkan huruf menggunakan huruf "p", "y", dan "r" pada keyboard
  if (keyPressed) {
    if (key == 'p') {
      angleX += 0.05;
    } else if (key == 'y') {
      angleY += 0.05;
    } else if (key == 'r') {
      angleZ += 0.05;
    }
  }

  // Menggambar huruf A berwarna kuning
  pushMatrix();
  rotateX(angleX);
  rotateY(angleY);
  rotateZ(angleZ);
  fill(#FFC100); // Warna kuning
  drawA3D(100, 0, 0); // Sesuaikan posisi untuk memberi ruang untuk "M"
  popMatrix();
  
  // Menggambar huruf M berwarna kuning
  pushMatrix();
  rotateX(angleX);
  rotateY(angleY);
  rotateZ(angleZ);
  fill(#FFC100); // Warna kuning
  drawM3D(-200, 0, 0); // Posisi di sebelah kiri "A"
  popMatrix();
}

// Fungsi untuk menggambar huruf A dalam 3D
void drawA3D(float x, float y, float z) {
  pushMatrix();
  translate(x, y, z);
  noStroke();

  // Batang diagonal kiri
  pushMatrix();
  translate(-50, -50, 0);
  rotateZ(PI / 9);
  box(40, 300, 40);
  popMatrix();

  // Batang diagonal kanan
  pushMatrix();
  translate(50, -50, 0);
  rotateZ(-PI / 9);
  box(40, 300, 40);
  popMatrix();

  // Batang horizontal
  pushMatrix();
  translate(0, 0, 0);
  box(200, 40, 40);
  popMatrix();
  
  // Konektor atas untuk memastikan sambungan halus (jika diperlukan)
  pushMatrix();
  translate(0, -200, 0);
  box(35, 20, 40); // Kotak kecil untuk menghubungkan bagian atas dengan halus (opsional)
  popMatrix();

  popMatrix();
}

// Fungsi untuk menggambar huruf M dalam 3D
void drawM3D(float x, float y, float z) {
  pushMatrix();
  translate(x, y, z);
  noStroke();

  // Batang vertikal kiri
  pushMatrix();
  translate(-90, -30, 0);
  box(40, 300, 40);
  popMatrix();

  // Batang diagonal tengah kiri
  pushMatrix();
  translate(-45, -100, 0);
  rotateZ(-PI / 6.0);  // Ubah rotasi ke arah yang benar
  box(40, 200, 40);
  popMatrix();
  
  // Batang diagonal tengah kanan
  pushMatrix();
  translate(45, -100, 0);
  rotateZ(PI / 6.0);  // Ubah rotasi ke arah yang benar
  box(40, 200, 40);
  popMatrix();
  
  // Batang vertikal kanan
  pushMatrix();
  translate(90, -30, 0);
  box(40, 300, 40);
  popMatrix();
  
  popMatrix();
}

// Fungsi untuk mendeteksi penekanan tombol
void keyPressed() {
  if (key == 'p' || key == 'y' || key == 'r') {
    redraw();
  }
}
