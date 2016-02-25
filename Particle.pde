class Particle {
  PVector pos;
  int type;
  color colour;
  float size = 5;
  
  Particle(PVector pos_, int type_) {
    pos = pos_;
    type = type_;
    
    if(type == 0){
      colour = cDarkPurple;
    }
    else{
      colour = cDarkGreen;
    }
  }
  
  void display(){
    fill(colour);
    ellipse(pos.x, pos.y, size, size);
  }
  
}