import moonlander.library.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


float x,y,z;
int n = 1000;
float rad;
float r;
float a=0;
float b=0;
PShape s;PShape s2;

Moonlander moonlander;

int xp[] = new int[n];
int yp[] = new int[n];
PVector v[] = new PVector[n];
PVector l[] = new PVector[n];

void setup() {
    moonlander = Moonlander.initWithSoundtrack(this, "../data/Daft.mp3", 120 , 8);
    size(1920, 1080, P3D);  
    
    x = width/2;
    y = height/2;
    z = 0;
    
    rad = sqrt(pow(width*2,2)+pow(width*2,2));
    frameRate(60);
    smooth();
   
    s=createOwnObj("testi2.obj");
    s2=createOwnObj("pallo2.obj");
    
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
        moonlander.start();
}

void draw() {
  
  moonlander.update();
  double moon = moonlander.getIntValue("calue");
  double f_sel = moonlander.getValue("function_select");
  
  int m = millis();
  //translate(x,y,z);
  //int col = color(128*(sin((float)moon/8.0)));
  background(0);
  //rotate(m);
 // mid_rec(m, 0, 0);
  //side_rec(m);
  //mid_rec(m, -150, -150);
  //mid_rec(m, -150, 150);
  //mid_rec(m, 150, -150);
  //mid_rec(m, 150, 150);
  //points(v);
  //lines(l, m);
  
  
  
  if(f_sel>=1 && f_sel<2)
  {
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
  if(f_sel<3)
  {
    double value = moonlander.getValue("my_track");
    float kerroin = 0.9999*log((float)value)/log(100.0);
    fractal(200, 200, kerroin);
  }
  if((f_sel > 3 && f_sel<4))
  {
    double value = moonlander.getValue("my_track");
    lighting();
    testiObj((float)value*0.5,(float)value);
  } 
}


void mid_rec(int m, int dx, int dy) {
 pushMatrix(); 
    translate(x+dx,y+dy,z);
    noFill();
    stroke(255);
    rotate(m*30);
   //scale();
    rect(-50,-50,100,100);
  popMatrix();
}

void side_rec(int m) {
 pushMatrix();
    translate(x,y,z);
    if (frameCount >= 90 && frameCount <= 450){  
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
    translate(x,y,z);
    stroke(255);
    for(int p = 0; p < n/2; p++) {
      v[p].setMag(m/70);
      v[p].div(0.992);
      line(0, 0, v[p].x*-1, v[p].y*-1);
    }
  popMatrix();
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

void testiObj(float xin,double y)
{
  float xj;
  float xi;
  float x;
  float temp=100.0*0.5;
   if(y<50)
  {
    xj=4.0*xin;
    xi=pow(1.02,xin);
    x=xj*xi;
  }
    else
   {
     xj=(temp-xin)*4.0;
     xi=pow(1.02,temp-xin);
     x=xj*xi;
     
   }
  
  //testiBox(x*y);
  
  if(y<50)
  {
    s2.setVisible(false);
    s.setVisible(true);
    pushMatrix();
    //translate(200.0+(i*x*20.0,200.0+j*x*20.0,0);
    translate(200.0,200.0,0);
    scale(min(1.0,2.0/x));
    rotateX(x);
    if(y>20)
      rotateY(x);
    shape(s,0,0);
    popMatrix();

  }
  else
  {
  s.setVisible(false);
  s2.setVisible(true);
  pushMatrix();
  translate(200.0,200.0,0);
  scale(5.0);
  scale(min(1.0,2.0/x));
  rotateX(x);
  
  shape(s2,0,0);
  popMatrix();
  }
  
}

void lighting()
{
    float fov = PI/3.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), 
            cameraZ/10.0, cameraZ*10.0);
  ambientLight(50,50,100);
  //spotLight(0, 255, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
  directionalLight(255, 255, 100, 0, -1, 0);
}

PShape createOwnObj(String filename)
{
  PShape s = loadShape(filename);
  s.scale(30.0);
  s.rotateX(45);
  return s;
  
}

void fractal(int xsize, int ysize,float kerroin)
{
  PImage temp=loadImage("testi.png");
  temp.loadPixels();
  float x0;
  float y0;
  for (int xi=0; xi < xsize; xi++)
  {
    for (int yi=0; yi<ysize; yi++)
    {
      x0= (float)-2.5+kerroin*1.5 +(3.5-3.0*kerroin)*((float)xi)/((float)xsize);
      y0= (float)-1.0+kerroin +(2.5-2*kerroin)*((float)yi)/((float)ysize);
      float x = 0.0;
      float y = 0.0;
      float iteration = 0;
      int max_iteration = 1000;
      while (x*x + y*y < 2*2  &&  (iteration < max_iteration)) {
        float xtemp = x*x - y*y + x0;
        y = 2*x*y + y0;
        x = xtemp;
        iteration = iteration + 1.0;
      }
      if ( iteration < max_iteration ) {
      // sqrt of inner term removed using log simplification rules.
        float log_zn = log( x*x + y*y ) / 2;
        float nu = log( log_zn / log(2) ) / log(2);
        iteration = iteration + 1 - nu;
      }
      float color1 = log(floor(iteration))/log(1000)*255;
      float color2= log(floor(iteration) + 1)/log(1000)*225;
      float colorC=(color1+color2)*0.5;
      temp.pixels[xi+xsize*yi] = color(colorC);
  }
  }
  temp.updatePixels();
  background(temp);
}