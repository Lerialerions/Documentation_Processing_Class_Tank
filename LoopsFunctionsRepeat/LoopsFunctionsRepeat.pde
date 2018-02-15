boolean moving = true; 
int counter = 0; // counter is a number that gets bigger every frame
float hue = 0; // HSB Hue—The color type, ranges from 0 to 255 by default. 
// Saturation—The vibrancy of the color, 0 to 255 by default.
// Brightness—The, well, brightness of the color, 0 to 255 by default.

int[] circleSizes = {90,70,60,50,40,30,20}; // decide which sizes the circles have
int distance = 20; // sets the distance between two circles
int speed = 5; // sets the movement speed of the circles
// creating an array in which I can store my circles and call them using just a number
circle[] myCircles = new circle[circleSizes.length]; 
circle[] myCircles2 = new circle[circleSizes.length]; 

// defining the class cicle as having a size and a position (in x direction)
class circle{ 
  int size;
  int position;
  circle (int initialSize,int initialPosition){
    size = initialSize;
    position = initialPosition;
  }
}

void setup () {
  size (1000, 600);
  //frameRate (50);
  colorMode(HSB, 255, 255, 255);
  // create the circles with initial size and position. 
  // Also makes sure, that the circles always have the same distance between their outer boundaries and not between their centers
   for (int i = 0; i < circleSizes.length; i++){ 
     if (i==0){
       myCircles[i] = new circle(circleSizes[i],-circleSizes[0]/2);
       myCircles2[i] = new circle(circleSizes[i],-circleSizes[0]/2-width);
     }else{
       myCircles[i] = new circle(circleSizes[i], myCircles[i-1].position-(distance+circleSizes[i-1]/2+circleSizes[i]/2));
       myCircles2[i] = new circle(circleSizes[i], myCircles2[i-1].position-(distance+circleSizes[i-1]/2+circleSizes[i]/2));
     }
   } 
   
}

void draw () {
  background (0, 0, 0); 
  stroke (140, 255, 255);

  //lines
  strokeWeight(2);
  line (1000, 0, 0, 600); // line from top right to bottom left
  strokeWeight(19);
  line (0, 0, 1000, 900); // (x1,y1,x2,y2) use this line
  strokeWeight(5);
  line (400, 0, 400, 600);
  strokeWeight(10);
  line (0, 350, 1000, 350); // this is the middle horizontal line


  // every frame i draw the circles and I change the value of their position at which they will be drawn in the next frame 
  for (int i=0; i<=circleSizes.length-1; i++){
    drawCircle (myCircles[i].size,myCircles[i].position);
    move(myCircles[i], speed);
    checkReset(myCircles[i]);
    
    drawCircle (myCircles2[i].size,myCircles2[i].position);
    move(myCircles2[i], speed);
    checkReset(myCircles2[i]);
  }
  colorUpdate();
}

// this method draws a circle using a certain color position size
void drawCircle (int size, int pos) { 
  fill(hue, 255, 255); 
  noStroke();
  ellipse (pos, 350, size, size);
}

// Here the circle move from left to right and appear again
void move (circle oneCircle, int increment) {
  if (moving) {
    oneCircle.position += increment;
  }
}
// this method changed the color of the circles every so many frames
void colorUpdate(){
  if (moving) {  
    counter++;
    if (counter % 25 == 0) {
      hue = random(0, 255); // HSB random
    }
  }
}

void checkReset(circle oneCircle){
  if (oneCircle.position > width*1.5){
    oneCircle.position = oneCircle.position -width*2;
  }
}


void mousePressed () {
  moving = !moving; // flip flop between 1 and 0. True and False, when mouse pressed in stops of moves again.
}

//flip flop between 1 and 0. True and False, when mouse pressed in stops of moves again.