String [] lines;
int index=0;

void setup(){
  size(500,500);
  background(255);
  
  lines = loadStrings("lines.txt");
  noSmooth();
}

void draw(){
  fill(0,0,255);
  stroke(0);
  if(index <lines.length){
    String[] pieces = split(lines[index], "\t");
    
    if(pieces.length==3){
      float px = float(pieces[0]);
      float py = float(pieces[1]);
      float ps = float(pieces[2]);
      //stroke(0);
      line(ps,0,ps, ps);
      //ellipse(px,py,ps,ps);
    }
    index++;
  }
  
  
}
