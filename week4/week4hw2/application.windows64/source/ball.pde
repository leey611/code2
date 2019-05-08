class Ball{
  PVector pos;
  PVector vel;
  
  int size = 20;
  
  Ball(float x, float y, float xSpeed, float ySpeed){
    pos = new PVector(x,y);
    vel = new PVector(xSpeed, ySpeed);
  }
  
  void bounceSide(){
    if(pos.x<= size/2 || pos.x>= width-size/2){
     vel.x = -vel.x;
  }
    
  }
  
  void bounceTop(){
    if(pos.y<b.size/2 || pos.y> height-size/2){
    vel.y = -vel.y;
  }
    
  }
  
  void paddleBounce(){
    //vel = vel.mult(-1);
    
    vel.y = -vel.y;
  }
  
  void brickBounce(){
    vel.y=-vel.y;
  }
  
  void move(){
    pos.add(vel);
  }
  
  //void reset(){
  //  if(pos.y+size/2==height){
  //    pos.y=0;
  //  }
  //}
  
  void display(){
    fill(255);
    ellipse(pos.x, pos.y, size, size);
  }
  
}
