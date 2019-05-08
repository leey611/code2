Fly f;
ArrayList <Fly> myFlies;

import peasy.*;
PeasyCam cam;

int n=50;

float t;

float frame=20;

boolean r= false;
boolean easycam = false;

void keyPressed(){
  r=!r;
  easycam=!easycam;
}

Fly [] flies = new Fly[n]; 

void setup(){
  size(1000,800, P3D);
  background(10);
  //if(easycam){
  //  cam = new PeasyCam(this,width*2);
  //}
 
  //for(int i = 0; i<n; i++){
  //  flies[i] = new Fly(random(width),random(height),random(width)); 
  //}
  f=new Fly(random(width),random(height),random(width));
  myFlies = new ArrayList<Fly>();
}

void draw(){
   frame=map(mouseX,0,width,1, 100);
  frameRate(frame);
  println(frame);
  
  background(10);
  

  //strokeWeight(random(3));
  //stroke(255);
  //noFill();
  f.display();
  
  for(int i=0; i<myFlies.size(); i++){
    Fly f = myFlies.get(i);
    f.display();
    
    if(mousePressed){
      f.ochange();
      
      if(f.isAlive()==false){
        myFlies.remove(i);
    }
    }
  }
  
  if(frameCount % 5 ==0){
    myFlies.add(new Fly(random(width),random(height),random(width)));
  }
  
  // for(int i = 0; i<n; i++){
  //  //flies[i] = new Fly(); 
 
  //  //translate(10*i, 100*i); 
  //  flies[i].display();

  //}
  
  
  //translate(width/2,height/2);
  //triangle(x1(t), y1(t), x2(t), y2(t), x3(t), y3(t));

  
  
  }
