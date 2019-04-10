float col;
float row;
float s=30;
float t=0;
void setup(){
  size(600,600);
  
}

void draw(){
  background(255);
  col=width/s;
  row=height/s;
  
  t=t+0.1;
  s=noise(t);
  s=map(s,0,1,0,20);
  
  fill(0);
  noStroke();
  for(int i=0; i<col; i++){
    for(int j=0; j<row; j++){
      rect(i*40+15,j*40+10,s,s);
    }
  }
}
