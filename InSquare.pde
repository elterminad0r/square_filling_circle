import static java.lang.Math.sqrt;

class InSquare {
  InSquare child1, child2;
  float r, //radius of the circle
    a, b, // centre of the circle
    c, d; //centre of InSquare
  float intercept;
  boolean draw_lines, rotate;
  int state;

  InSquare(float r, float a, float b, float c, float d, boolean draw_lines, boolean rotate) {
    this.r = r;
    this.a = a;
    this.b = b;
    this.c = c;
    this.d = d;
    this.draw_lines = draw_lines;
    this.rotate = rotate;

    //the work of satan
    intercept = 0.5 * (sqrt(-a * a + 2 * a * (b + c - d) - b * b - 2 * b * c + 2 * b * d - c * c + 2 * c * d - d * d + 2 * r * r) + a + b + c - d) - c;
    if (rotate) {
      rect(c, d, intercept, intercept, 4);
    } else {
      rect(c, d, intercept, intercept);
    }
  }

  void next() {
    if (intercept > 1) {
      state ++;
      if (child1 == null) {
        child1 = new InSquare(r, a, b, c + intercept, d, draw_lines, rotate);

        if (draw_lines) {
          stroke(255);
          if (rotate) {
            line(c + intercept / 2, d + intercept / 2, child1.c + child1.intercept / 2, child1.d + child1.intercept / 2, 4);
          } else {
            line(c + intercept / 2, d + intercept / 2, child1.c + child1.intercept / 2, child1.d + child1.intercept / 2);
          }
          noStroke();
        }
      } else if (child2 == null) {
        child2 = new InSquare(r, a, b, c, d + intercept, draw_lines, rotate);
        if (draw_lines) {
          stroke(255);
          if (rotate) {
            line(c + intercept / 2, d + intercept / 2, child2.c + child2.intercept / 2, child2.d + child2.intercept / 2, 4);
          } else {
            line(c + intercept / 2, d + intercept / 2, child2.c + child2.intercept / 2, child2.d + child2.intercept / 2);
          }
          noStroke();
        }
      } else {
        if (child1.intercept > child2.intercept) {
          child1.next();          
          intercept = child1.intercept;
        } else {
          child2.next();
          intercept = child2.intercept;
        }
      }
    }
  }
}
