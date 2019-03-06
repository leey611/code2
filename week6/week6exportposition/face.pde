class Face {
  int state;
  float x;
  float y;
  float s;
  float c;
  
  Face(float tempx, float tempy, float temps){
    x=tempx;
    y=tempy;
    s=temps;
    c=5;
  }
  
  void display(){
    //switch (state){
      //case 0:
        noStroke();
        fill(244, 241, 66);
        ellipse(x,y,s,s);
        fill(0);
        ellipse(x-30,y-20,s/5,s/5);
        ellipse(x+30,y-20,s/5,s/5);
      //break;
      //case 1:
        //fill(244, 241, 66);
        //ellipse(x,y,s,s);
      //break;
      //case 2:
        //state=0;
      
    //}
  }
  
  void sizechange(){
    s=s+c;
    if(s+c>width||s+c>height||s+c<100){
      c=-c;
    }
  }
}
