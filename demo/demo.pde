import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import moonlander.library.*;

Moonlander moonlander;

float x,y,z;
float r;
float a=0;
float b=0;

void setup() {
   size(1920, 1080, P3D);//noStroke();
   smooth();
   moonlander = Moonlander.initWithSoundtrack(this, "Oxygen.mp3", 174, 4);
   moonlander.start();
}

void draw() {
  moonlander.update();
  clear();
  background(0);
  stroke(255);
 makeWords();
  
  translate(width/2, height/2);
  rotate(-radians(frameCount));
  drawBoxes(900);
  
  drawBox2(200,200);
  drawBox2(-100,-100);
  drawBox2(150,300);
  drawBox2(-100,-200);
  drawBox2(-278,-59);
}

void drawBoxes(float aa) {
  rotate(radians(+frameCount-70));
  drawBox(0,0, 255);
  drawBox(aa,50, 34);
}

void drawBox2(float xx, float yy) {
  rotate(radians(+frameCount+70));
  pushMatrix();
  translate(xx,yy,0);
  drawBox(500,radians(frameCount), 255);
  popMatrix();
}

void drawBox(float xx, float r, float s) {
 // lights();
  pushMatrix();
    noFill();
    stroke(s,s-30,s+49);
//    translate(x+xx,y+yy,30);
    rotateY(radians(frameCount+ r)+PI/3);
    rotateX(radians(frameCount+r)+PI/6);
    box(50+xx/10);
  popMatrix();
}

void makeWords() {
  pushMatrix();
  a = a+2;
  b = 100+sin(frameCount/10.0)*60;
  if (a>1400){a=0;}
  translate(a,b,0);
  String words = "I haven't let the fact that I have no idea what I'm doing slow me down one bit. - Jim Wells";
  textSize(26);
  fill(234,0,0);
  text(words, 12, 60);
  popMatrix();
}