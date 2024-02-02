//===========================================================================================

// Move circles out of bounds to immitate the circles disappearing.
void resetCircles() {
  circle0.move(-200, -200);
  circle1.move(-200, -200);
  circle2.move(-200, -200);
  circle3.move(-200, -200);
  circle4.move(-200, -200);
  circle5.move(-200, -200);
  circle6.move(-200, -200);
  circle7.move(-200, -200);
  circle8.move(-200, -200);
  circle9.move(-200, -200);
  lastClick=0;
  beatCount=0;
  accuracyNumber=0;
  accuracy="0.0";
}

//===========================================================================================

class circle {
  int x;
  int y;
  int size;
  color c;
  int ringSize;
  int trans;
  int rtrans;

  circle(int tempx, int tempy) {
    x = tempx;
    y = tempy;
    size = 50;
    if (!lvl3) {
      ringSize=150;
    } else {
      ringSize=120;
    }
    trans=255;
    rtrans=255;
    c = color(random(0, 255), random(0, 255), random(0, 255));
  }

  // Sets the position of the circle.
  void move(int tempx2, int tempy2) {
    if (!failed&&!paused&&!won) {
      x=tempx2;
      y=tempy2;
      size=50;
      lastClick++;
      beatCount++;
    }
  }
  // Checks if circle is clicked.
  void check() {
    if (!paused&&!failed&&!won) {
      if (mousePressed&&trans>10) {
        if (mouseX>(x-(size/2))&&mouseX<(x+(size/2))&&mouseY>(y-(size/2))&&mouseY<(y+(size/2))) {
          lastClick=0;
          x=-100;
          y=-100;
          size=0;
          levelpoints++;
          statClicks++;
        }
      }
      if (keyPressed&&trans>10) {
        if (key==' '&&mouseX>(x-(size/2))&&mouseX<(x+(size/2))&&mouseY>(y-(size/2))&&mouseY<(y+(size/2))) {
          lastClick=0;
          x=-100;
          y=-100;
          size=0;
          levelpoints++;
          statClicks++;
        }
      }
    }
  }

  // Displays circles.
  void display() {
    ringSize=constrain(ringSize, 0, 150);
    noFill();
    stroke(255, rtrans);
    strokeWeight(3);
    ellipse(x, y, ringSize, ringSize);
    noStroke();
    fill(c, trans);
    ellipse(x, y, size, size);
  }
}

//===========================================================================================
//
//                          You've reached the end of this tab.
//
//===========================================================================================
