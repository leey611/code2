class Snowflakes{
  //position
  //color
  //opacity
  float x, y;
  color c;
  int o=255;
  float gravity;
  float size;
  
  Snowflakes(float tempX, float tempY){
    x=tempX;
    y=tempY;
    
    gravity=random(1,3);
    size=random(5,15);
  }
  
  void display(){
    noStroke();
    fill(255,o);
    ellipse(x,y,size,size);
  }
  
  void fall(){
   y+=gravity;
   o--;
  }
  
  boolean isAlive(){
    if(y<height){
      return true;
    }else{
      return false;
    }
  }
}
