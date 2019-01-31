String text[]={"inspirational quotes","so inspirational", "don't you feel so inspired", "motivating quotes are so motivating"};
int r=110;
float position[]=new float[4];
int index;

void setup(){
  //background(255);
  size(600,600);
}

void draw(){
  background(255);
  float spacing = width/4;
  for(int i=0; i<4; i++){
    position[i]=i*spacing +r*.75;
  fill(0);
  ellipse(position[i], 100, r, r);
    if(dist(mouseX,mouseY,position[i],100)<r/2 && mousePressed){
      index=i;
      fill(255);
      ellipse(position[i], 100, r, r);
    }
   
   // background(255);
     fill(0);
    displayText(text[index]);
  }
  
  
  }
  
void displayText(String text){
  for(int i=0; i<position.length; i++){
   fill(0);
   textSize(25);
   textAlign(CENTER);
  text(text, width/2, height/2);
  }
}
