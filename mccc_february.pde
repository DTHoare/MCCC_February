//colours:
color cDarkPurple = #331940;
color cPurple = #5E366A;
color cDarkGreen = #0CCA98;
color cGreen = #00FFCC;

//globals:
int fps = 46000;
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
  for(int i = 0; i < width * height /2; i++) {
    pixels[i] = cGreen;
  }
  for(int i = width * height /2; i < width * height; i++) {
    pixels[i] = cPurple;
  }
  updatePixels(); //<>//
}

void draw() {
  loadPixels();
  pixelTemp = pixels;
  //changing step changes effects
  step = 1 + frameCount%20;
  init = frameCount%width;
  //loop condition for swaps
  for(int i = init; i <width * height; i+=step) {
    n = (i + 500) % (width*height); 
    
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
  
  if(frameCount % 460 ==0 & frameCount > 86000) {
    //saveFrame("image_########.png");
  }
}