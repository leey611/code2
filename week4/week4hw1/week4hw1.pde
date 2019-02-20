//Ball[] myBalls = {new Ball(100, 100, random(40, 80)), new Ball(400, 400, random(20, 30))}; 
Ball[] myBalls= new Ball[5];
void setup(){
  size(600, 600); 
  
  for(int i = 0; i<5; i++){
    myBalls[i] = new Ball(random(width), random(height), random(20, 30));
  }
}

void draw(){
  background(185,255,250); 
  
  for(int i = 0; i<myBalls.length;i++){//loops through the objects in the myBalls array
    myBalls[i].update(); 
    myBalls[i].display(); 
    myBalls[i].checkBoundaries();
    
      
    
  }
  myBalls[0].checkCollision(myBalls[1]); 
}
