float scaleFactor = 1;
float xPan = 0;
float yPan = 0;
float rotationAngle = 0;
int pergeseran = 3;

boolean zoomIn = false;
boolean zoomOut = false;
boolean panUp = false;
boolean panDown = false;
boolean panLeft = false;
boolean panRight = false;
boolean rotateLeft = false;
boolean rotateRight = false;
boolean mirrorHorizontal = false;
boolean mirrorVertical = false;

void setup() {
  size(1280, 720, P2D);
}

void draw() {
  background(0);
  
  // Terapkan transformasi
  translate(width / 2, height / 2);
  scale(scaleFactor);
  translate(-xPan, -yPan);
  
  if (rotateLeft) {
    rotationAngle += radians(pergeseran);
  }
  if (rotateRight) {
    rotationAngle -= radians(pergeseran);
  }

  // Terapkan rotasi
  rotate(rotationAngle);

  // Terapkan pencerminan
  if (mirrorHorizontal) {
    scale(-1, 1); // Cermin horizontal
  }
  if (mirrorVertical) {
    scale(1, -1); // Cermin vertikal
  }

  // Gambar huruf "A"
  drawLetterA(100, 0);  // Posisi yang disesuaikan untuk memberi ruang untuk "M"
  
  // Gambar huruf "M"
  drawLetterM(-200, 0);  // Posisi di sebelah kiri "A"
  
  // Tangani interaksi
  if (zoomIn) {
    scaleFactor *= 1.01;
  }
  if (zoomOut) {
    scaleFactor /= 1.01;
  }
  if (panUp) {
    yPan -= 5;
  }
  if (panDown) {
    yPan += 5;
  }
  if (panLeft) {
    xPan -= 5;
  }
  if (panRight) {
    xPan += 5;
  }
}

void drawLetterA(float x, float y) {
  pushMatrix();
  translate(x, y);
  noStroke();
  fill(#FFC100);
  
  // Bar diagonal kiri
  pushMatrix();
  rotate(PI / 9.0);
  rect(-70, -150, 40, 300, 200);
  popMatrix();

  // Bar diagonal kanan
  pushMatrix();
  rotate(-PI / 9.0);
  rect(30, -150, 40, 300, 200);
  popMatrix();

  // Bar horizontal
  pushMatrix();
  rect(-100, 50, 200, 40, 200);
  popMatrix();
  popMatrix();
}

void drawLetterM(float x, float y) {
  pushMatrix();
  translate(x, y);
  noStroke();
  fill(#FFC100);
  
  // Bar vertikal kiri
  pushMatrix();
  rect(-90, -180, 40, 300, 200);
  popMatrix();

  // Bar diagonal tengah kiri
  pushMatrix();
  rotate(PI / 6.0);
  rect(-40, -200, 40, 180, 200);
  popMatrix();
  
  // Bar diagonal tengah kanan
  pushMatrix();
  rotate(-PI / 6.0);
  rect(-0, -200, 40, 180, 200);
  popMatrix();
  
  // Bar vertikal kanan
  pushMatrix();
  rect(50, -180, 40, 300, 200);
  popMatrix();
  popMatrix();
}

void keyPressed() {
  if (keyCode == UP) {
    zoomIn = true;
  }
  if (keyCode == DOWN) {
    zoomOut = true;
  }
  if (key == 's') {
    panUp = true;
  }
  if (key == 'w') {
    panDown = true;
  }
  if (key == 'd') {
    panLeft = true;
  }
  if (key == 'a') {
    panRight = true;
  }
  if (key == 'q') {
    rotateLeft = true;
  }
  if (key == 'e') {
    rotateRight = true;
  }
  if (key == 'h') {
    mirrorHorizontal = !mirrorHorizontal;
  }
  if (key == 'v') {
    mirrorVertical = !mirrorVertical;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    zoomIn = false;
  }
  if (keyCode == DOWN) {
    zoomOut = false;
  }
  if (key == 's') {
    panUp = false;
  }
  if (key == 'w') {
    panDown = false;
  }
  if (key == 'd') {
    panLeft = false;
  }
  if (key == 'a') {
    panRight = false;
  }
  if (key == 'q') {
    rotateLeft = false;
  }
  if (key == 'e') {
    rotateRight = false;
  }
}
