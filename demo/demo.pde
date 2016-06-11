import moonlander.library.*;
import ddf.minim.*; 

float x,y,z;
int n = 1000;
float rad;

Moonlander moonlander;

int xp[] = new int[n];
int yp[] = new int[n];
PVector v[] = new PVector[n];
PVector l[] = new PVector[n];

void setup() {
    moonlander = Moonlander.initWithSoundtrack(this, "../data/Daft.mp3", 120 , 8);
    size(600, 600, P3D);  
    x = width/2;
    y = height/2;
    z = 0;
    rad = sqrt(pow(width*2,2)+pow(width*2,2));
    frameRate(30);
    moonlander.start();
    
    int j = 0;
    while(j < n){
      xp[j] = (int)random(-rad, rad);
      yp[j] = (int)random(-rad, rad);
      v[j] = new PVector((float)xp[j], (float)yp[j]);
      if(mag(v[j].x, v[j].y) < rad){
        l[j] = new PVector((float)xp[j], (float)yp[j]);
        j++;                 
      }
    }
}

void draw() {
  
  moonlander.update();
  double moon = moonlander.getIntValue("calue");
  int m = millis();
  
  //int col = color(128*(sin((float)moon/8.0)));
  background(0);
  
  mid_rec(m);
  side_rec(m);
  points(v);
  lines(l, m);
}

void mid_rec(int m) {
 pushMatrix(); 
    translate(x,y,z);
    //float i = 0.3;
    noFill();
    stroke(255);
  //rectMode(CENTER);
    rotate(m*30);
   //scale();
    rect(-50,-50,100,100);
  popMatrix(); 
}

void side_rec(int m) {
 pushMatrix();
    translate(x,y,z);
    if (frameCount >= 90 && frameCount <= 250){  
      noFill();
      stroke(255);
      rotate(m*100);
      rect(-200,-200,100,100);
    }
  popMatrix(); 
}

void points(PVector v[]){
  pushMatrix();
    translate(x,y,z);
    stroke(255);
    for(int p = 0; p < n; p++){
      v[p].mult(0.992);
      point(v[p].x, v[p].y);
    }   
  popMatrix(); 
}

void lines(PVector v[], int m){
  pushMatrix();
    //translate(x,y,z);
    stroke(255);
    for(int p = 0; p < n/2; p++) {
      //v[p].setMag(m/70);
      //v[p].div(0.992);
      line(0,0, v[p].x*-1, v[p].y*-1);
    }
  popMatrix();
}