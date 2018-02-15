/*
 Lerions
 Ping Pong Game using the arrows
 */


float spieler1;
float spieler2;
float ball_x;
float ball_y;
float ball_speed_x; 
float ball_speed_y; 
int round; // game round
float controlerleft;
float controlerright;
float initial_ball_x = 300;
float initial_ball_y = 300;
float initial_ball_speed_x = -4;
float initial_ball_speed_y = -1;


public void setup () {
  size (600, 600);
  rectMode (CENTER);
  spieler1 = 50;
  spieler2 = 50;
  resetBall(0);
  round = 0; 

  /* control = ControlIO.getInstance(this);
   // Find a device that matches the configuration file
   gpad = control.getMatchedDevice("controler"); // the pdf has to be corrected with the configurator 
   if (gpad == null) {
   println("No suitable device configured");
   System.exit(-1); // End the program NOW! 
   }*/
}

void resetBall(int player){
  ball_x = initial_ball_x;
  ball_y = initial_ball_y;
  ball_speed_x = initial_ball_speed_x;
  ball_speed_y = initial_ball_speed_y;
  round = 0;
  if (player == 1){
     fill (255, 0, 0); // color
     rect (5, 300, 10, height); // gamer 1
  }
    if (player == 2){
     fill (255, 0, 0); // color
     rect (595, 300, 10, height); // gamer 1
  }

}

public void draw () {
  background (0); 
  fill (100, 250, 255); // color
  rect (30, spieler1, 20, 90); // gamer 1
  rect (570, spieler2, 20, 90); // gamer 2
  noStroke ();
  fill (250, 250, 250);
  ellipse (ball_x, ball_y, 18, 18);

  // spieler funktion durch map ersetzen 

  // Gamers Settings
  if (keyPressed) {
    if (keyCode == LEFT) { // moves the left player down
      if (spieler1  < 550) {
        spieler1 = spieler1 + 10;
      }
    } 
    if (keyCode == UP) { // moves the left player up
      if (spieler1  > 45) {
        spieler1 = spieler1 - 10;
      }
    }
  }

  if (keyPressed) {
    if (keyCode == DOWN) { // moves the right player down
      if (spieler2  < 550) {
        spieler2 = spieler2 + 10;
      }
    } 
    if (keyCode == RIGHT) { // moves the right player up
      if (spieler2  > 45) {
        spieler2 = spieler2 - 10;
      }
    }
  }

  ball_x += ball_speed_x;
  ball_y += ball_speed_y;

  //Game 
  if (ball_x < 50) { // check if ball goes out left
    if (ball_y < (spieler1 + 55) && ball_y > (spieler1 - 55)) {
      ball_speed_x = (-ball_speed_x) +1;
      ball_speed_y = ball_speed_y - (spieler1 - ball_y) * 0.1;
      round = round +1;
    } 
  }
  if (ball_x < 10) {
    resetBall(1);
  }
   
  
    if (ball_x >552) { // check if ball goes out right
      if (ball_y < (spieler2 + 55) && ball_y > (spieler2 - 55)) {
        ball_speed_x = (-ball_speed_x) +1;
        ball_speed_y = ball_speed_y - (spieler2 - ball_y) * 0.1;
        round = round +1;
        }
      }
     if (ball_x > 590) {
        resetBall(2);
      }

  
  if (ball_y > 600 || ball_y < 5) {
    ball_speed_y = - ball_speed_y;
  }

  fill (250, 250, 250);
  text ("Round: " + round, 600, 20);
} 