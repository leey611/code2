float radius;
int scale = 5; 
String printText;

void setup(){
  size(500, 500); 
}

void draw(){
  background(0);
  
  radius=radius+scale;
  if(radius>width||radius<0){
    scale=-scale;
  }
  
  
  text(printText(), width*.1, height*.1); 
  ellipse(width/2, height/2, radius, radius);  
}

String printText(){
  if(scale>0){
    printText="GROW";
  } else {
    printText="SHRINK";
  }
   return printText;
}
