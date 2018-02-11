/* Owne/ Lerions 2018
 Program description / The following sketch is very simple.
 Depedning where the coursor is, the color and saturation of the cirlces will change. 
 */

float trans;
color col; 

void setup () {
  size (600, 600);
  noStroke ();
}

void draw () {

  // this is our variable that controls transparency
  trans = mouseX/2; 

  // this is our variable that controls color 
  col = mouseY/2;

  background (col, 100, col); 
  fill (col, 200, 30, trans);
  ellipse (300, 300, 400, 400);
  fill (100, col, 100, trans);
  ellipse (300, 300, 300, 300);
  fill (30, 40, col, trans);
  ellipse (300, 300, 200, 200);

  // here we just see the values that change
  println ("transparency " + trans);
  println(mouseX);
}