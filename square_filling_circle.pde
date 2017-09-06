InSquare sq;

boolean draw_circle = true;
boolean fast = false;
boolean draw_lines = false;
boolean rotate = false;

void line(float a, float b, float c, float d, float f) {
  for (int i = 0; i < 4; i++) {
    rotate(TWO_PI / f);
    line(a, b, c, d);
  }
}

void rect(float a, float b, float c, float d, float f) {
  for (int i = 0; i < 4; i++) {
    rotate(TWO_PI / f);
    rect(a, b, c, d);
  }
}

void setup() {
  size(1000, 1000);
  resetMatrix();
  if (rotate) {
    translate(500, 500);
  }
  background(255, 0, 0);

  stroke(255);
  fill(255);
  if (draw_circle) {
    if (rotate) {
      arc(0, 0, height, height, 0, TWO_PI);
    } else {
      arc(0, 0, height * 2, height * 2, 0, TWO_PI);
    }
  }
  fill(0);
  if (rotate) {
    sq = new InSquare(height / 2, 0, 0, 0, 0, draw_lines, rotate);
    if (draw_lines) {
      stroke(255);
      line(0, 0, sq.intercept / 2, sq.intercept / 2, 4);
      noStroke();
    }
  } else {
    sq = new InSquare(height, 0, 0, 0, 0, draw_lines, rotate);
    if (draw_lines) {
      stroke(255);
      line(0, 0, sq.intercept / 2, sq.intercept / 2);
      noStroke();
    }
  }
  if (!fast) {
    frameRate(3);
  } else {
    frameRate(60);
  }
}

void draw() {
  if (rotate) {
    translate(500, 500);
  }
  sq.next();
}

void keyPressed() {
  switch(keyCode) {
  case 'C':
    draw_circle = !draw_circle;
    break;
  case 'L':
    draw_lines = !draw_lines;
    break;
  case 'R':
    rotate = !rotate;
    break;
  case 'F':
    fast = !fast;
    break;
  }
  setup();
}