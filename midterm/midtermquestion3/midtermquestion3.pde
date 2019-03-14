Object myObject;  
ArrayList<Object> o;


void setup(){
  size(600, 600); 
  
  myObject = new Object(width/2, height/2); 
  o=new ArrayList<Object>();
  

}

void draw(){
  background(255); 
  
    for(int i=0;i<o.size();i++){
    Object obj=o.get(i);
    
     PVector gravity = new PVector(0, .1*myObject.mass); 
     PVector wind = new PVector(0.1, 0); 
      
        obj.move();
        obj.checkBoundaries();
        obj.display();
        obj.addForce(gravity);
        obj.addForce(wind);
  }
  
  
 
  
    

  



   
}

void mousePressed(){

  o.add(new Object(mouseX,mouseY));
}


class Object{
  PVector pos, vel, accel; 
  float mass; 
  
  Object(float x, float y){
    pos = new PVector(x, y); 
    vel = new PVector(0, 0); 
    accel = new PVector(0, 0); 
    
    mass = random(5, 20); 
  }
  
  void move(){
    vel.add(accel); 
    pos.add(vel); 
    
    accel.mult(0); 
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(pos.x,pos.y,mass*3,mass*3);
  }
  
  void checkBoundaries() {
    if (pos.x > width) {
      pos.x = width;
      vel.x *= -1;
    } else if (pos.x < 0) {
      vel.x *= -1;
      pos.x = 0;
    }
 
    if (pos.y > height) {
      vel.y *= -1;
      pos.y = height;
    }
  } 
  
  void addForce(PVector force){
    force.div(mass);
    accel.add(force);
  }
}
