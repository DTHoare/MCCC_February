//colours:
color cDarkPurple = #331940;
color cPurple = #5E366A;
color cDarkGreen = #0CCA98;
color cGreen = #00FFCC;

//globals:
int fps = 460;
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
  step = 500 - (frameCount%480);
  step = 26 + frameCount%100;
  init = frameCount%width;
  for(int i = init; i <width * height; i+=26) {
    n = (i + 500) % (width*height); 
    //if(pixels[n] == cPurple){
    //    pixelTemp[i] = cPurple;
    //    pixelTemp[n] = cGreen;
    //}
    
    //if(pixels[n] == cGreen){
    //    pixelTemp[i] = cGreen;
    //    pixelTemp[n] = cPurple;
    //}
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
  
  if(frameCount % 48 ==0) {
    saveFrame("image_########.png");
  }
}