RocketBlastBubbles[] bob = new RocketBlastBubbles[100];//first call to new
int rocketX, rocketY;
int myY;

void setup() {
  frameRate(15);
  size(700, 700);
  background(112, 128, 144);

  rocketX = 350;
  rocketY = 350;

  for (int i = 0; i < bob.length; i++) {
    bob[i] = new RocketBlastBubbles(); //second call to new
  }
}


void draw() {
  background(112, 128, 144);
  rocketShip();

  for (int i = 0; i < bob.length; i++) {
    bob[i].move();
    bob[i].show();
  }

  if (myY > 300) {

    myY = rocketY + 140;
  }

  fill(255, 255, 0);
  ellipse(600, 70, 70, 70);

  fill(112, 128, 144);
  noStroke();
  ellipse(620, 65, 70, 70);

  stroke(1);
  stars(150, 150, 25);

  stars(170, 170, 15);
} //end of draw()

void mouseMoved() { 

  if (rocketX < 700 && rocketX > 0) {


    rocketX = mouseX;
  }

  loop();
  if (rocketY + 65 < 700 && rocketY > 0) {

    rocketY = mouseY + 150;
    
  } else {

    rocketY = 600;
  }
}


void rocketShip() {

  fill(57, 67, 97);
  noStroke();
  triangle(rocketX, rocketY - 100, rocketX - 25, rocketY - 50, rocketX + 25, rocketY - 50); //top triangle
  triangle(rocketX, rocketY + 50, rocketX - 40, rocketY + 110, rocketX + 40, rocketY + 110); //bottom triangle
  ellipse(rocketX, rocketY, 70, 140); //main shape

  fill(112, 128, 144);
  ellipse (rocketX, rocketY - 15, 40, 40);

  fill(255);
  ellipse (rocketX, rocketY - 15, 30, 30);

  //ellipse(rocketX - 10, rocketY + 120, 20, 10);
}


class RocketBlastBubbles {
  int myX, myColor, mySize; //member variables

  RocketBlastBubbles() { //constructor

    myX = rocketX;
    myY = height/2;

    //myX = rocketX;
    //myY = rocketY + 130;
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    mySize = (int)(Math.random()*15 + 10);
  }

  void show() {
    stroke(1);
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }


  void move() { //for moving the bubbles


    //myY = myY + (int)(Math.random()*3)-1;

    myY = myY + (int)(Math.random()*50)-13;

    //    myX = myX + (int)(Math.random()*9)-8;

    // myX = rocketX + (int)(Math.random()*3)-1 + rocketX/myY;

    myX = rocketX + (int)(Math.random()*((myY-300)*1.1))-(int)((myY-300)*1.1)/2 + rocketX/myY;
    //first part centers the bubbles, second part spreads them out more and more as the Y grows,
    //and the third part 
  }
}


void stars(int x, int y, int mySize) {

  noStroke();
  fill(255, 255, 0);

  triangle(x, y + 20, x - 5, y, x + 5, y);
  triangle(x, y - 20, x - 5, y, x + 5, y);

  triangle(x - 10, y, x - 5, y-5, x-5, y + 5);

  triangle(x + 10, y, x + 5, y-5, x+5, y + 5);
  ellipse(x, y, mySize - 15, mySize - 15);
}
