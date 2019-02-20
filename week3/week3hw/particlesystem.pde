class Particlesystem{
  ArrayList<Particle> particles;
  
  PVector origin;
  
  Particlesystem(PVector origin){
    particles = new ArrayList<Particle>();
    origin= new PVector(b.pos.x,b.pos.y);
  }
  
  void addParticle(){
    particles.add(new Particle());
  }
  
  void run(){
           for(int k =particles.size()-1; k>=0; k--){
         Particle particle = particles.get(k);
         particle.update();
         particle.display();
         if(particle.isDead()){
           particles.remove(k);
         }
       }
    
  }
  
 
}
