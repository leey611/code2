float angle = 0;
float offset = 300;
float scalar = 300;
float speed = 0.01;
int r=100;
boolean clicked;
boolean notclicked=true;
float x;
//float y;

void setup(){
  size(600,600);
}

void draw(){
  background(255);
  
  if(notclicked == true){
    x=offset+sin(angle)*scalar;
    ellipse(x,height/2,r,r);
    angle += speed;
    }
  
  if(dist(mouseX,mouseY,x, height/2)<r/2 && mousePressed){
      notclicked =false;
      clicked = true;
    }
  if(clicked == true){
      float y=offset+sin(angle)*scalar;
      ellipse(width/2,y,r,r);
      angle +=speed;
      }
    
}
