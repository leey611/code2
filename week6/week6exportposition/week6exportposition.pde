float [] px=new float[0];
float [] py=new float[0];
float [] ps=new float[0];



Face f;
ArrayList <Snowflakes> mySnow;
ArrayList <Square> mySquare;
int sceneNumber=0;

void setup(){
  size(500,500);
  mySnow = new ArrayList<Snowflakes>();
  mySquare=new ArrayList<Square>();
  f=new Face(width/2,height/2,140);
}

void draw(){
  switch(sceneNumber){
    case 0:
      scene0();
      break;
    case 1:
      scene1();
      break;
    case 2:
      sceneNumber=0;
  }
  
  px=append(px, f.x);
  py=append(py, f.y);
  ps=append(ps, f.s);
  
  
  
}

void mousePressed(){
  sceneNumber++;
}

void scene0(){
  background(81,123,155);
  
     for(int i=0; i<mySnow.size(); i++){
    Snowflakes s = mySnow.get(i);
    s.display();
    s.fall();
    
    if(s.isAlive()==false){
      mySnow.remove(i);
    }
  }
  
  if(frameCount % 10 == 0){
    mySnow.add(new Snowflakes(random(0,width),0));
  }
  
  f.display();
}

void scene1(){
  background(0);
  
   for(int i=0; i<mySquare.size(); i++){
    Square s = mySquare.get(i);
    s.display();
    s.colorchange();
    
    if(mousePressed){
      s.ochange();
    }
  }
  
  if(frameCount % 5 ==0){
    mySquare.add(new Square(random(width),random(height)));
  }
  
  f.display();
  f.sizechange();
}

void keyPressed(){
  if(key == 's'){
    String[] lines = new String[px.length];
    for(int i=0; i<px.length; i++){
      lines[i]=px[i]+ "\t" + py[i]+ "\t" + ps[i];
    }
    saveStrings("lines.txt", lines);
    exit();
  }
}
