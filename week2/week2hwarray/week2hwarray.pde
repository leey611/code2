Square s;
ArrayList <Square> mySquare;

void setup(){
  size(600,600);
  s=new Square(random(width),random(height));
  mySquare=new ArrayList<Square>();
}

void draw(){
  background(0);
  s.display();
  s.colorchange();
  
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
  
  
}
