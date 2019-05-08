PShape sun, planet1, planet2;
PImage sunText, planet1Text, planet2Text;

Star[] stars=new Star[100];

void setup(){
  fullScreen(P3D, 2);
  noStroke();
  
  
  sunText = loadImage("sun.png");
  planet1Text = loadImage("earth.jpg");
  planet2Text = loadImage("jupiter.png");
  
  fill(255);
  
  sun = createShape(SPHERE, 150);
  sun.setTexture(sunText);
  
  planet1 = createShape(SPHERE, 200);
  planet1.setTexture(planet1Text);
  
  planet2 = createShape(SPHERE, 100);
  planet2.setTexture(planet2Text);
  
  for(int i=0; i<stars.length;i++){
    //stars[i].update();
    stars[i]=new Star();
  }
  
}

void draw(){
  background(0);
  for(int i=0; i<stars.length;i++){
    //stars[i].update();
    stars[i].show();
  }
  pushMatrix();
  translate(width/2, height/2, -250);
    pushMatrix(); //set s new coordinate system for our canvas
    rotateY(PI * frameCount/500);
    shape(sun);
    popMatrix();
    

    rotateY(PI * frameCount/300);
    translate(0,0,500);
    
    shape(planet2);
  popMatrix();
}
