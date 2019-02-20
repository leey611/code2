//ArrayList<Particle> particles;
Particlesystem ps;

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

void setup(){
  //rectMode(CENTER);
  size(500,500);
  cols = int(width/w);
  rows = int(height*.5/h);
  noStroke();
  //particles = new ArrayList<Particle>();
  
  //for(int i=0; i <10; i++){
  //  particles.add(new Particle());
  //}
  b= new Ball(width/2, height/2, random(3,5), random(-5,-4));
  p= new Paddle();
  myBricks = new Bricks[cols][rows];
  
  ps = new Particlesystem(b.pos);
  
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      myBricks[i][j]=new Bricks(i*w+5, j*h+5, w-10, h-10);
    }
  }
  
  time = millis()/1000;
  
  live=3;
  
  
}

void draw(){
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
        ps.addParticle();
        ps.run();
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
