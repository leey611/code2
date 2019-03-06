class Square{
  float x;
  float y;
  float c;
  float o=255;
  float cc=random(2,4);
  float size;
  int r=int(random(2));
  
  
  Square(float tempX, float tempY){
    x=tempX;
    y=tempY;
    
    c=int(random(50,255));
    size=random(20,40);
    
  }
  
  void display(){
    noStroke();
    fill(c,100,255,o);
    
    //rect(x,y , size, size);
    if(r==0){
      rect(x,y , size, size);
    }
    if(r==1){
      rotate(90);
      rect(x,y , size, size);
    }
  }
  
  void colorchange(){
    c=c+cc;
    if(c>255||c<0){
      cc=-cc;
    }
  }
  
  void ochange(){
    o--;
  }
  
}
