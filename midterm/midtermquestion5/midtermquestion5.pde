float r; 
color bgColor; 

int [] colornumber = new int[0];
String [] backgrounds;

void setup(){
  size(600, 600); 
  backgrounds=loadStrings("colordata.txt");

}

void draw(){
  background(bgColor); 
  text("back ground # : " + bgColor, 100, 100); 
}

void mousePressed(){
  bgColor = color(random(0,255), random(0,255), random(0,255)); 
  ellipse(mouseX, mouseY, 50, 50); 
  
  colornumber=append(colornumber,bgColor);
  
}

void keyPressed(){
  if(key=='s'){
    String[] lines = new String[colornumber.length];
    for(int i =0; i<colornumber.length;i++){
      lines[i]=colornumber[i]+"\t";
      backgrounds=append(backgrounds, lines[i]);
    }
    saveStrings("colordata.txt", backgrounds);
    exit();
  }
}
