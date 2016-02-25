//draw an isocolese triangle using the line of symmetry and width
void symmTriangle(float x1, float y1, float angle, float height_, float width_){
  //x1 and y1 are base points
  
  //create variables for the two base corners left and right positions
  float xl, xr, yl, yr;
  
  //create variables for peak position
  float xp, yp;
  
  //calculate peak position
  xp = x1 + height_ * cos(angle);
  yp = y1 + height_ * sin(angle);
  
  //calculate left corner
  xl = x1 + width_/2 * cos(angle - PI/2);
  yl = y1 + width_/2 * sin(angle - PI/2);
  
  //calculate right corner
  xr = x1 + width_/2 * cos(angle + PI/2);
  yr = y1 + width_/2 * sin(angle + PI/2);
  
  triangle(xl, yl, xr, yr, xp, yp);
}

void saveLoop(float frames){
  //save frame number of frames
  if (frameCount < frames) {
    saveFrame("frame-###.gif");
  }
}

//this is a magical function that I once sat down with pen and paper and worked out
//alas I cannot remember what I did
//it transitions smoothly from 0 to magnitude as a sigmoid
//higher transitionSpeed increases the speed from 0 to magnitude
//period is the time between jumps
float periodicSigmoid(float magnitude, float transitionSpeed, float period) {
  float x;
  x = magnitude;
  x /= (1+exp(-transitionSpeed*((frameCount%period)-period/2)));
  return x;
}