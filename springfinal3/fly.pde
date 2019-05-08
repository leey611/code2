class Fly {
  //position data
    float t=random(width);
    float x;
    float y;
    float z;
    float k=255;
    float kk=-7;
   
    
  
    Fly (float x, float y, float z){
      this.x = random(width); 
      this.y = random(height); 
      this.z = random(width);
       
    }
    

   void display() {
     stroke(255,k);
   
     
     
     //if(k>255){
     //  kk=-kk;
     //}else{
     //  k=k+kk;
     //}
     noFill();
     
    for (int i=0; i<10; i++) {
      beginShape();
      vertex(x1(t+i) + x, y1(t+i) + y, z1(t+i));
      vertex(x2(t+i) + x, y2(t+i)+ y, z2(t+i));

      vertex(x3(t+i) + x, y3(t+i)+y, z3(t+i));

      vertex((x4(t+i)+ x), y4(t+i)+y,z4(t+i));
      endShape(CLOSE);
      
      if(r){
        t=random(width);
      }
    }
    t++;
  }
  
  void ochange(){
      k=k+kk;
     //if(k>255||k<0){
     //  kk=-kk;
     //}
  }
  
  boolean isAlive(){
    if(k>0){
      return true;
    }else{
      return false;
    }
  }

  float x1(float t) {
    return sin(t/10)*25+sin(t)*2;
  }

  float y1(float t) {
    return cos(t/10)*25;
  }
  
  float z1(float t){
    return sin(t/15)*30+sin(t)*2;
  }

  float x2(float t) {
    return sin(t/10)*25+sin(t)*2;
  }

  float y2(float t) {
    return cos(t/20)*25+cos(t/12)*20;
  }
  
  float z2(float t){
    return sin(t/6)*20+sin(t)*3;
  }

  float x3(float t) {
    return sin(t/25)*25+sin(t/15)*10;
  }

  float y3(float t) {
    return cos(t/20)*25+cos(t)*40;
  }
  
  float z3(float t){
    return cos(t/10)*25+cos(t)*20;
  }

  float x4(float t) {
    return sin(t/10)*37+sin(t)*15;
  }

  float y4(float t) {
    return cos(t/20)*37+cos(t/10)*10;
  }
  
  float z4(float t){
    return sin(t/15)+sin(t)*12;
  }
  
}
