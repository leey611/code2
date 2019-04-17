String current = "A";
int len=100;
float theta=radians(30);

int count = 0;
 
void setup() {
  size(600,600);
  noFill();
  println("Generation " + count + ": " + current);
  
}
 
void draw() {
  translate(width/2,height*2/3);
}
 
void mousePressed() {
  String next = "";
  //len*=0.7;

  for (int i = 0; i < current.length(); i++) {
    char c = current.charAt(i);
    if (c == 'A') {
      rotate(theta);
     line(0,0,0,-len);
     
     //rotate(theta);
     translate(0,-len);
     
      next += "AB";
    }  else if (c == 'B') {
      rotate(-theta);
      line(0,0,0,-len);
      
      //rotate(-theta);
      translate(0,-len);
      
       
      next += "A";
    }
  }
  current = next;
  count++;
  println("Generation " + count + ": " + current);
}
