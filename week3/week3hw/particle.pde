class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan=255;
  //PVector origin;
  
  Particle(){
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1), random(-1,1));
    location = new PVector(b.pos.x,b.pos.y);
  }


void update(){
  velocity.add(acceleration);
  location.add(velocity);
  
  lifespan-=2;
  }
  
  boolean isDead(){
    if(lifespan<=0){
      return true;
    } else{
      return false;
    }
  }

void display(){
  noStroke();
  fill(255,0,0,lifespan);
  ellipse(location.x, location.y, 10, 10);
  }
}
