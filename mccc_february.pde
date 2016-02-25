//colours:
color cDarkPurple = #331940;
color cPurple = #5E366A;
color cDarkGreen = #0CCA98;
color cGreen = #00FFCC;

//globals:
int fps = 460000;
float revs = 2 * PI / fps;

//object lists
color[] pixelTemp;
int n;
int step;
int init;

void setup(){
  size(500,500);
  frameRate(fps);
  noStroke();
  ellipseMode(CENTER);
  
  //setup colour
  loadPixels();
  for(int i = 0; i < width * height ; i++) {
    if( (i%width) < width/2) {
      pixels[i] = cGreen;
    }
    else {
      pixels[i] = cPurple;
    }
  }
  updatePixels(); //<>//
}

void draw() {
  loadPixels();
  pixelTemp = pixels;
  //changing step changes effects
  step = 499 ;
  init = frameCount%(width*height);
  //loop condition for swaps
  for(int i = init; i <width * height; i+=step) {
    n = (init + i) % (width*height); 
    
    //swap opposite colours
    if(pixels[i] == cGreen & pixels[n] == cPurple) {
      pixelTemp[i] = cPurple;
      pixelTemp[n] = cGreen;
    }
    if(pixels[n] == cGreen & pixels[i] == cPurple) {
      pixelTemp[n] = cPurple;
      pixelTemp[i] = cGreen;
    }
  }
  pixels = pixelTemp;
  updatePixels();
  
  if(frameCount <10000 & frameCount % 200 ==0) {
    saveFrame("image_###########.png");
  }
  else if(frameCount >10000 & frameCount <250000 & frameCount % 10000 ==0) {
    saveFrame("image_###########.png");
  }
  else if(frameCount >250000 & frameCount <261000 & frameCount % 200 ==0) {
    saveFrame("image_###########.png");
  }
}