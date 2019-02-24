class Particlesystem{
  ArrayList<Particle> particles;
  
  PVector origin;
  
  Particlesystem(PVector origin){
    particles = new ArrayList<Particle>();
    this.origin= origin;
  }
  
  void addParticle(){
    for(int i=0; i<5; i++){
    particles.add(new Particle(origin));
    }
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
