Object myObject; 

void setup(){
  size(600, 600); 
  
  myObject = new Object(); 
}

void draw(){
  background(255); 
  myObject.move(); 
  myObject.checkBoundaries(); 
  myObject.display(); 
}


class Object{
  PVector pos, vel, accel; 
  
  Object(){
    pos = new PVector(width/2, height/2); 
    vel = new PVector(0, 0); 
    
  }
  
  void move(){
    PVector mouse = new PVector(mouseX,mouseY);
    accel = PVector.sub(mouse,pos);
    
    //normalize your accel vector here
    accel.normalize();
    
    vel.limit(4); 
    
    //basic movement vector addition here...
    pos.add(vel);
    vel.add(accel);
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(pos.x,pos.y,30,30);
  }
  
  void checkBoundaries(){
    if(pos.x+15>width){
      pos.x=15;
    }
    
    if(pos.x-15<0){
      pos.x=width-15;
    }
    
    if(pos.y+15>height){
      pos.y=15;
    }
    
    if(pos.y-15<0){
      pos.y=height-15;
    }
    //add logic here so when the ellipse gets to the edge of the 
    //it is positioned on the opposite side
  }
}
