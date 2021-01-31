int numBalls = 10;
Ball[] balls = new Ball[numBalls];
float friction = -0.9;

void setup() {
  fullScreen();
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), i, balls);
  }
  
  background(0);
  
}

void draw() {
  background(0);
  //textSize(32);
  //fill(255);
  //text("Stay Distant. Stay Connected", 10, 30); 
  
  for (Ball ball : balls) {
    ball.move();
    ball.display();  
  }
  drawLine(balls);
}

void drawLine(Ball[] balls){
  for (int i = 0; i < numBalls; i++) {
    for (int j = i+1; j < numBalls; j++) {
      line(balls[i].x, balls[i].y, balls[j].x, balls[j].y);
      stroke(255);
    }
  }
}

class Ball {
  
  float x, y, randx, randy;
  float diameter;
  int id;
  Ball[] others;
  color c;
  
 
  Ball(float xin, float yin, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    randx = random(-20,20);
    randy = random(-20,20);
    diameter = random(40,70);
    id = idin;
    others = oin;
    c = color(random(256), random(256), random(256));
  } 
  
  void move() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = others[i].x - x;
      float dy = others[i].y - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = 200 + diameter + others[i].diameter;
      if (distance <= minDist) { 
           float angle = atan2(dy, dx);
           float targetX = x + cos(angle) * minDist;
           float targetY = y + sin(angle) * minDist;
           float ax = (targetX - others[i].x) * 0.1;
           float ay = (targetY - others[i].y) * 0.1;
           randx -= ax;
           randy -= ay;
           others[i].randx += ax;
           others[i].randy += ay;
      }
    } 
    
    x+=randx;
    y+=randy;
     
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      randx *= friction; 
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      randx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      randy *= friction; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      randy *= friction;
    }
    
  }
  
  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, diameter, diameter);
  }
}
