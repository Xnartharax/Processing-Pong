int ballX;
int ballY;
int speedX;
int speedY; 
int paddleRight;
int paddleLeft;
int pointsRight = 0;
int pointsLeft = 0;
void setup() {
  size(1000, 700);
  ballX = width/2;
  ballY = height/2;
  paddleRight = height/2;
  paddleLeft = height/2;
  speedY = -2;
  speedX = -1;
}

void draw() {
  background(100, 150, 200);
  fill(0, 250, 0);
  rect(10, paddleLeft, 10, 100);
  rect(width-20, paddleRight, 10, 100);
  ballX += speedX; // genau das gleiche wie ballX = ballX + 3;
  ballY += speedY;
  if(ballY <= 0){
    speedY = -speedY;
  }
  if(ballY >= height){
    speedY = -speedY;
  }
  fill(255, 255, 255);
  for(int i = 0; i<10; i++){
    rect(width/2-2, height/10*i+10, 4, height/10-20);
  }
  fill(200, 0, 0);
  circle(ballX,ballY, 10);
  
  if(ballY >= paddleLeft && ballY <= paddleLeft+100 && ballX <= 20){
    speedX = -speedX;
  }
  if(ballY >= paddleRight && ballY <= paddleRight+100 && ballX >= width-20){
    speedX = -speedX;
  }
  if(ballX <= 10){
    pointsRight ++;
    ballX = width/2;
  }
  if(ballX >= width-10){
    pointsLeft++;
    ballX = width/2;
  }
  textSize(40);
  text("Links: "+ pointsLeft, 100, 100);
  text("Rechts: "+ pointsRight, width-200, 100);
}

void keyPressed(){
  if(key == 'w'){
    paddleLeft -= 5;
  }
  if(key == 's'){
    paddleLeft += 5;
  }
  if(key == 'u'){
    paddleRight -= 5;
  }
  if(key == 'j'){
    paddleRight += 5;
  }
}
