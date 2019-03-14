int state=0;

void setup(){
  size(500,500);
  textAlign(CENTER);
  background(255);
}

void draw(){
  switch(state){
    case 0:
      scene0();
      break;
    case 1:
      scene1();
      break;
      
    case 2:
      scene2();
      break;
    case 3:
      scene3();
      break;
    case 4:
      state=0;
      break;
  }
}

void keyPressed(){
  state++;
}

void scene0(){
  background(255);
  fill(0);
  text("scene1",width/2, height/2);
}

void scene1(){
  background(255);
    fill(0);
  text("scene2",width/2, height/2);
}

void scene2(){
  background(255);
    fill(0);
  text("scene3",width/2, height/2);
}

void scene3(){
  background(255);
    fill(0);
  text("scene4",width/2, height/2);
}
