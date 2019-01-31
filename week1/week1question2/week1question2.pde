
float r;
float g;

void setup(){
  size(600,600);
  //float r=map(mouseX,0,width,0,255);
  //float g=map(mouseY,0,height,0,255);
  ////background(map(mouseX,0,width,0,255));
  //background(r,g,175);
}

void draw(){
  
   //background(r,g,175);
   //size(600,600);
  //float r=map(mouseX,0,width,0,255);
  //float g=map(mouseY,0,height,0,255);
  //background(map(mouseX,0,width,0,255));

  for(int i=0; i<width; i++){
    for(int j=0; j<height; j++){
      float distX=dist(i,0,mouseX,0);
      float distY=dist(0,j,0,mouseY);
      float r=map(distX,0,width,0,255);
      float g=map(distY,0,height,0,255);
      fill(r,g,175);
      noStroke();
      rect(i,j,10,10);
    }
  }
  //background(r,g,175);
  
}
