
import ddf.minim.*;

int stateColor;
PImage sample, fish1, fish2, marmaid1, marmaid2, background1, background2;
color c1, c2;
int FfishBehave;
int fishLength = 20;
int bubbleLength = 40;
floatBubble[] Bubble = new floatBubble[bubbleLength];
moveFish[] Fish = new moveFish[fishLength];

Minim minim;
AudioPlayer sea1;
AudioPlayer bgm;
AudioPlayer SE;

void setup() {
  size(900, 600);
  stateColor=0;
  minim = new Minim( this );
  sea1 = minim.loadFile( "sea1.mp3");
  bgm = minim.loadFile("bgm.mp3");
  SE = minim.loadFile("change.mp3");
  Image();
  frameRate(10);
  substituteFish();
  substituteBubble();
  sea1.loop();
  bgm.loop();
}

void draw() {
  changeGradation();
  drawImage();
  for (int i=0; i<bubbleLength; i++) {
    Bubble[i].surfaceBubble();
    Bubble[i].drawBubble();
  }
  for(int i=0; i<fishLength; i++){
    Fish[i].moveFish();
  }
}

//what is that?
void stop() {
  sea1.close();
  bgm.close();
  minim.stop();
  super.stop();
}

//functions

//load Images
void Image() {
  fish1 = loadImage("fish.png");
  fish2 = loadImage("fish2.png");
  marmaid1 = loadImage("marmaid1.png");
  marmaid2 = loadImage("marmaid2.png");
  background1 = loadImage("background1.png");
  background2 = loadImage("background2.png");
}



//substitute 
void substituteFish() {
  for (int i=0; i<fishLength; i++) {
    Fish[i] = new moveFish(
    random(width), random(height), 
    0, 0, 
    random(0.003, 0.01),
    0,0
    );
  }
}

void substituteBubble() {
  for (int i=0; i<bubbleLength; i++) {
    Bubble[i] = new floatBubble(
    random(width), 600, 
    random(1, 7)
      );
  }
}



// change gradation
void changeGradation() {
  if (stateColor == 1) {
    c1 = color(#555555);
    c2 = color(#cccccc);
    gradation(c1, c2);
  }
  else if (stateColor == 0) {
    c1 = color(#00FFF0);
    c2 = color(#4040FF);
    gradation(c1, c2);
  }
}



//write gradation
void gradation(color g1, color g2) {
  int sx = width;
  int sy = height;

  float dr = (red(g2) - red(g1))/sy;
  float dg = (green(g2) - green(g1))/sy;
  float db = (blue(g2) - blue(g1))/sy;

  for (int ly=0; ly<sy; ly++) {
    color pc = color(
    (red(g1) + ly*dr), 
    (green(g1) + ly*dg), 
    (blue(g1) + ly*db)
      );
    for (int lx=0; lx<sx; lx++) {
      set(lx, ly, pc);
    }
  }
}



//background images and marmaids 
void drawImage() {
  imageMode(CENTER); 
  if (stateColor == 0) {
    image(background1, 500, 300);
    image(marmaid1, 280, 400);
  }
  else {
    image(background2, 500, 300);
    image(marmaid2, 280, 400);
  }
}



//mousebutton trick
void mousePressed() {
  if (mouseButton == LEFT) {
    stateColor = stateColor+1;
    playSE();
  }

  if (stateColor > 1) {
    stateColor = 0;
    playSE();
  }
}



void playSE() {
  if (mouseButton == LEFT) {
    SE.play();
    SE.rewind();
  }
  else {
    SE.close();
  }
}

