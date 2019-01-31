//2D
//color
//size
//some conditional to see fi we're mousePressed
//boolean 2d array

int num = 10; //refer to the number of rows & cols
color c[][];
boolean clicked[][];
int size;

void setup(){
  size(600,600);
  noStroke();
  size = width/num;
  
  c= new color[num][num];
  clicked= new boolean[num][num];
  
  for(int i=0; i<num; i++){
    for(int j=0; j<num; j++){
       c[i][j]=color(random(0,255),random(0,255),random(0,255));
      clicked[i][j] = false;
    }
  }
  
}

void draw(){
  for(int i=0; i<num; i++){
    for(int j=0; j<num; j++){
      if(mouseX>size*i && mouseX<size*(i+1)
      && (mouseY>j*size && mouseY< (j+1)*size)
      && mousePressed){
        clicked[i][j]=true;
      }
      if(clicked[i][j] == true){
       // c[i][j]=color(random(0,255),random(0,255),random(0,255));
       fill(c[i][j]);
     }else{
         fill(255);
      }
      
      rect(i*size, j*size, size, size);
    }
  }
}
