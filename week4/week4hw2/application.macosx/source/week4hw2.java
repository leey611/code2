import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class week4hw2 extends PApplet {

//ArrayList<Particle> particles;
ArrayList<Particlesystem> ps;

int w = 50;
int h = 25;
int cols, rows;
//int live=3;
int score=0;


int time;
int maxTime = 30;
int live;



Ball b;
Paddle p;
Bricks myBricks[][];

public void setup(){
  //rectMode(CENTER);
  
  cols = PApplet.parseInt(width/w);
  rows = PApplet.parseInt(height*.5f/h);
  noStroke();
  //particles = new ArrayList<Particle>();
  
  //for(int i=0; i <10; i++){
  //  particles.add(new Particle());
  //}
  b= new Ball(width/2, height/2, random(3,5), random(-5,-4));
  p= new Paddle();
  myBricks = new Bricks[cols][rows];
  
  ps = new ArrayList<Particlesystem>();
  
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      myBricks[i][j]=new Bricks(i*w+5, j*h+5, w-10, h-10);
    }
  }
  
  time = millis()/1000;
  
  live=3;
  
  
}

public void draw(){
  background(0);
  
  b.display();
  b.move();
  
  p.display();
  p.reset();
  
  //if(b.pos.x<= b.size/2 || b.pos.x>= width-b.size/2){
    b.bounceSide(); 
  //}
  //if(b.pos.y<=b.size/2 || b.pos.y>= height-b.size/2){
    b.bounceTop(); 
  //}
  
  if(b.pos.x+b.size/2 >p.x && b.pos.x-b.size/2 < p.x+p.w && b.pos.y+b.size/2>p.y && b.pos.y-b.size/2<p.y+p.h){
    b.paddleBounce();
  }
  
  if (b.pos.x > p.x && b.pos.x < p.x + p.w) {
    if ((p.y - b.pos.y < b.size/2 && p.y - b.pos.y > dist(0, b.size/2, 0, p.h))){
     b.vel.y=-b.vel.y;
    }
  }   
  
  
  
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      float bl = map(i,0,cols,100,255);
      float g = map(j,0,rows,150,255);
      myBricks[i][j].display(color(50,g,bl));
      
      //if(b.pos.x<= (myBricks[i][j].x + myBricks[i][j].w) && b.pos.x>= (myBricks[i][j].x) 
      //  && b.pos.y<= (myBricks[i][j].y + myBricks[i][j].h) && b.pos.y>= (myBricks[i][j].y)){
      //  myBricks[i][j].o=0;
       
      //}
      
      if(b.pos.x<= (myBricks[i][j].x + myBricks[i][j].w) && b.pos.x>= (myBricks[i][j].x) 
        && b.pos.y<= (myBricks[i][j].y + myBricks[i][j].h) && b.pos.y>= (myBricks[i][j].y)&& myBricks[i][j].o==255){
        b.brickBounce();
        score=score+1;
        println(score);
        myBricks[i][j].o=0;
        ps.add(new Particlesystem(new PVector (myBricks[i][j].x, myBricks[i][j].y)));
        
        //ps.addParticle();
       // ps.run();
       
       //particle.update();
       //particle.display();
       //Particle particle = particle.get(0);
       //for(int k =particles.size()-1; k>=0; k--){
       //  Particle particle = particles.get(k);
       //  particle.update();
       //  particle.display();
       //  if(particle.isDead()){
       //    particles.remove(k);
       //  }
       //}
       
      
       
      }
      
      
        
      }
      
    }
    
    for(int i=0; i<ps.size(); i++){
      Particlesystem p = ps.get(i);
      p.addParticle();
      p.run();
    }
  
  
  
  fill(255);
  /*
  text(60-second(),20,480);
  if(60-second()==1){
    b.vel.x=0;
    b.vel.y=0;
  }
  */
  //live=3;
  if(b.pos.y+b.size/2 >= height){
    live=live-1;
    //print(b.pos.y+b.size/2 == height);
  }
  
  if(live==0){
    b.vel.x=0;
    b.vel.y=0;
    b.pos.y=width/2;
    live=0;
  }
  
  text("Live:"+ live, width/2, 480);
  
  int elapsedTime = (millis()/1000) - time;
  int timeLeft = maxTime - elapsedTime;
  if(timeLeft <0||live==0){
    timeLeft = 0;
    b.vel.x=0;
    b.vel.y=0;
  }
  text (timeLeft, 20, 480);
  text (score,width-20,480);
  
  
  
  if(keyPressed){
    if(key==CODED){
      if(keyCode==LEFT){
        p.moveLeft();
      }
      
      if(keyCode==RIGHT){
        p.moveRight();
      }
    }
  }
  
  
  
}
class Ball{
  PVector pos;
  PVector vel;
  
  int size = 20;
  
  Ball(float x, float y, float xSpeed, float ySpeed){
    pos = new PVector(x,y);
    vel = new PVector(xSpeed, ySpeed);
  }
  
  public void bounceSide(){
    if(pos.x<= size/2 || pos.x>= width-size/2){
     vel.x = -vel.x;
  }
    
  }
  
  public void bounceTop(){
    if(pos.y<b.size/2 || pos.y> height-size/2){
    vel.y = -vel.y;
  }
    
  }
  
  public void paddleBounce(){
    //vel = vel.mult(-1);
    
    vel.y = -vel.y;
  }
  
  public void brickBounce(){
    vel.y=-vel.y;
  }
  
  public void move(){
    pos.add(vel);
  }
  
  //void reset(){
  //  if(pos.y+size/2==height){
  //    pos.y=0;
  //  }
  //}
  
  public void display(){
    fill(255);
    ellipse(pos.x, pos.y, size, size);
  }
  
}
//position
//size
//color + opacity
class Bricks{
  float x, y;
  float w, h;
  int o=255;
  
  Bricks(float x, float y, int w, int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void display(int c){
    fill(c,o);
    rect(x,y,w,h);
  }
}
class Paddle{
  int w=100;
  int h=25;
  float x,y;
  
  Paddle(){
    x = width/2;
    y = height*.75f;
  }
  
  public void display(){
    fill(255,255,0);
    rect(x,y,w,h);
  }
  
  public void moveLeft(){
    x-=10;
  }
  
  public void moveRight(){
    x+=10;
  }
  
  public void reset(){
    if(x>=width+w/2){
      x=0;
    }
    
    if(x<=(-w/2)){
      x=width;
    }
  }
  
}
class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan=255;

  
  Particle(PVector location){
    acceleration = new PVector(0,0.05f);
    velocity = new PVector(random(-1,1), random(-1,1));
    this.location = location;   
}


public void update(){
  velocity.add(acceleration);
  location.add(velocity);
  
  lifespan-=2;
  }
  
  public boolean isDead(){
    if(lifespan<=0){
      return true;
    } else{
      return false;
    }
  }

public void display(){
  noStroke();
  fill(255,0,0,lifespan);
  ellipse(location.x, location.y, 10, 10);
  }
}
class Particlesystem{
  ArrayList<Particle> particles;
  
  PVector origin;
  
  Particlesystem(PVector origin){
    particles = new ArrayList<Particle>();
    this.origin= origin;
  }
  
  public void addParticle(){
    for(int i=0; i<5; i++){
    particles.add(new Particle(origin));
    }
  }
  
  public void run(){
           for(int k =particles.size()-1; k>=0; k--){
         Particle particle = particles.get(k);
         particle.update();
         particle.display();
         if(particle.isDead()){
           particles.remove(k);
         }
       }
    
  }
  
 
}
  public void settings() {  size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "week4hw2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
