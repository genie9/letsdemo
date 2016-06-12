import moonlander.library.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


float x,y,z;
int n = 1500;
float rad;
float r;
float a2=0;
float a = 0;
float b = 0;
int pic=0;
PShape s;PShape s2; PShape noppa;
PImage kppg; PImage gppg; PImage sppg;
PImage bg;


Moonlander moonlander;

int xp[] = new int[n];
int yp[] = new int[n];
PVector v[] = new PVector[n];
PVector l[] = new PVector[n];
PVector k[] = new PVector[n];
PVector d[] = new PVector[n];

void setup() {
    moonlander = Moonlander.initWithSoundtrack(this, "../data/Himatsu.mp3", 92, 8);
    size(1920, 1080, P3D);  
    
    x = width/2;
    y = height/2;
    z = 0;
    
    rad = sqrt(pow(width*2,2)+pow(width*2,2));
    frameRate(60);
    smooth();
   
    s=createOwnObj("testi2.obj",1);
    s2=createOwnObj("pallo2.obj",2);
   noppa=createOwnObj("ppg.obj",3);
   kppg = loadImage("k.png");
   gppg = loadImage("g.png");
   sppg = loadImage("s.png");
   bg = loadImage("testibg.png");

    
    int j = 0;
    while(j < n){
      xp[j] = (int)random(-rad, rad);
      yp[j] = (int)random(-rad, rad);
      v[j] = new PVector((float)xp[j], (float)yp[j]);
      //k[j] =new PVector (random(0,width), random(0,height));
      if(mag(v[j].x, v[j].y) < rad){
        l[j] = new PVector((float)xp[j], (float)yp[j]);
        d[j] = new PVector((float)xp[j], (float)yp[j]);
        j++;                 
      }
    }
        moonlander.start();
}

void draw() {
  
  moonlander.update();
  double moon = moonlander.getIntValue("genie");
  double f_sel = moonlander.getValue("function_select");
  double value = moonlander.getValue("my_track");
  
  int m = millis();
  background(0);
  

if(f_sel >= 1 && f_sel < 1.5){ 
    slideWords("GRAFFATHON 2016", 255, 255, 255, 64, -135);
  }
 
 //s(String words, int col_r, int col_g, int col_b, float text_size, float pos_y, int curve)
 //slideWords(String words, int col_r, int col_g, int col_b, float text_size, float pos_y) 
 
  //if(f_sel >= 1.5  && f_sel < 2){
      
  if(f_sel >=1 && f_sel<2)
  {
    flyingHeads();
    if(value >= 1){
        makeWords("Power Puff", 255, 255, 255, 87, 100, 100, 0); 
      }
    if(value >= 2){
      makeWords("Let's demo!", 255, 255, 255, 100, 700, 50, 1);
    }
  }
  
  if(f_sel >= 2 && f_sel < 3)
  {
    stroke(255);
    translate(width/2, height/2);
    rotate(-radians(frameCount)); 
    drawBoxes(900);
  
    drawBox2(200,200);
    drawBox2(-100,-100);
    drawBox2(150,300);
    drawBox2(-100,-200);
    drawBox2(-278,-59);
  }
  
  if(f_sel >= 3 && f_sel < 4)
  {
    lighting();
    points2();
    testiObj((float)value*0.5,(float)value);
  } 
  
  if(f_sel >= 4 && f_sel < 5) {
    mid_rec(m, 0, 0, 1, 255);
    side_rec(m);
    points(v, 0.992);
    if(moon >= 1){
      lines(l, moon, 255, 255, 255, 0.992);
      mid_rec(m, 0, 0, 3, 0);
    }
  }
  
  if(f_sel >= 5 && f_sel < 6) {
    points(l, 0.997);
  
    if(f_sel >= 5 && f_sel < 5.5) {
      pushMatrix();
      stroke(255);
      translate(width/2, height/2);
      rotate(-radians(frameCount));
    
      drawBox2(200,200);
      drawBox2(-100,-100);
      drawBox2(150,300);
      drawBox2(-100,-200);
      drawBox2(-278,-59);
      popMatrix();
    }
  
    if(f_sel >= 5.5 && f_sel < 6) {
      stroke(255);
      translate(width/2, height/2);
      rotate(-radians(frameCount));
      pic = 1;
      drawBox2(200,200);
      drawBox2(-100,-100);
      drawBox2(150,300);
      drawBox2(-100,-200);
      drawBox2(-278,-59);
      //points(l);
    }
  }
  
  if(f_sel >= 6 && f_sel < 6.5) {
    background(bg);
    testiObj((float)value*0.5,(float)value);
  }
  
  if(f_sel >=6.5 && f_sel < 7) {
     mid_rec(m, -500, -350, 1, 255);
     mid_rec(m, -750, 0, 1, 255);
     mid_rec(m, -500, 350, 1, 255);
     mid_rec(m, 500, -350, 1, 255);
     mid_rec(m, 750, 0, 1, 255);
     mid_rec(m, 500, 350, 1, 255);

    if(moon >= 1) {
      lines(d, moon, 252, 222, 98, 0.5);  
    }
  }
  
  
  /*if(f_sel<-1)
  {
    double value = moonlander.getValue("my_track");
    float kerroin = 0.9999*log((float)value)/log(100.0);
    fractal(width, height, kerroin);
  }*/
  
  
  
  if(f_sel >= 7 && f_sel < 8){
    if(value >=  1 && value < 2){
      makeWords("I haven't let the fact that I have no idea what I'm doing slow me down one bit. - Jim Wells", 255, 255, 255, 26, 100, 100, 0);
    }
    if(value >= 2 && value < 4){
      makeWords("coDe && grAphIcs", 255, 255, 255, 26, 100, 100, 0);
    }
    if(value >= 4 && value < 5){
      slideWords("MuSiC:", 255, 255, 255, 26, 100);
      slideWords("A Himitsu", 255, 255, 255, 26, 500);
    }
    if(value >= 5 && value < 6){
      slideWords("THANKS TO:", 255, 255, 255, 26, 100);
      slideWords("DOT", 255, 255, 255, 26, 100);
    }
    if(value >= 6 && value < 7){
      if(abs((float)value-6.0)<0.01){a=0;}
      pushMatrix();
      slideWords("DEMOSCENE", 255, 255, 255, 26, 100);
      popMatrix();
      pushMatrix();
      slideWords("WORLD WIDE!!!", 255, 255, 255, 26, 500);
      popMatrix();
    }
    //slideWords(String words, int col_r, int col_g, int col_b, float text_size, float pos_y)
  }
}
//s(String words, int col_r, int col_g, int col_b, float text_size, float pos_y, int curve)
void mid_rec(int m, int dx, int dy, int sw, int col) {
 pushMatrix(); 
    translate(x+dx,y+dy,z);
    noFill();
    stroke(col);
    strokeWeight(sw);
    rotate(m*35);
    rect(-75,-75,150,150);
  popMatrix();
}

void side_rec(int m) {
 pushMatrix();
    translate(x,y,z);  
      noFill();
      stroke(255);
      rotate(m*100);
      rect(-300,-300,150,150);
  popMatrix(); 
}

void points(PVector v[], float vel){
  pushMatrix();
    translate(x,y,z);
    stroke(255);
    for(int p = 0; p < n; p++){
      v[p].mult(vel);
      point(v[p].x, v[p].y);
    }   
  popMatrix(); 
}

void points2(){
  pushMatrix();
  translate(x,y,z);
    for(int p = 0; p < n; p++){
       stroke(255);
       point(v[p].x*0.992, v[p].y*0.992);
    }   
    popMatrix();
}


void lines(PVector v[], double m, int col_r, int col_g, int col_b, float vel){
  pushMatrix();
    translate(x,y,z);
    stroke(col_r, col_g, col_b);
    strokeWeight(1);
    for(int p = 0; p < n/4  ; p++) {
      v[p].setMag((int)m*400/70);
      v[p].div(vel);
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
    if(pic == 0){
      box(50+xx/10);
    }else{
      shape(noppa, 0, 0);
    }
  popMatrix();
}

void makeWords(String words, int col_r, int col_g, int col_b, float text_size, float pos_y, int curve, int math)  {
  pushMatrix();
  a += 2;
  if(math == 0){
    pos_x = pos_x + 1.5;
    b = curve +sin(frameCount/10.0)*60; //pos_y = 100,
  }
  if(math == 1){
    pos_x = pos_x + 2;
    b = curve + cos(frameCount/10.0)*60; //pos_y = 100,
  }
  
  if (pos_x > 1400){ pos_x = 0; }
  translate(pos_x, b, 0);
  textSize(text_size); // 26
  fill(col_r, col_g, col_b);  
  text(words, 12, pos_y); // 60
  popMatrix();
}

float pos_x = 0;

void slideWords(String words, int col_r, int col_g, int col_b, float text_size, float pos_y)  {
  //while(a < 1400){
  pushMatrix();
    translate(x, y, z);
    if (a > 1000){ a = 0; }
    textSize(text_size);
    fill(col_r, col_g, col_b); 
    a += 2; 
    text(words, a - 450, pos_y);
  popMatrix();
  //}
}
void testiObj(float xin,double y)
{
  float y2;
  float x;
  float temp=50;
   if(y<50)
  {
    x=exp(xin/5.0);
  }
    else
   {
     x=exp(temp/5.0-xin/5.0);
     
   }
  
  if(y<50)
  {
    s2.setVisible(false);
    s.setVisible(true);
    pushMatrix();
    //translate(200.0+(i*x*20.0,200.0+j*x*20.0,0);
    translate(560.0+2.5*x, 540.0,0);
    scale(min(1.0,(2.0/x+0.03)));
    rotateX(x);
    if(y>40)
      rotateY(x);
    shape(s,0,0);
    popMatrix();
    
    pushMatrix();
    translate(1360.0-2.5*x, 540.0,0);
    scale(min(1.0,(2.0/x+0.03)));
    rotateX(x);
    if(y>40)
      rotateY(x);
    shape(s,0,0);
    popMatrix();

  }
  else
  {
  s.setVisible(false);
  s2.setVisible(true);
  pushMatrix();
  translate(950.0, 540.0,0);
  scale(5.0);
  scale(min(1.0,(2.0/x+0.03)));
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

PShape createOwnObj(String filename,int index)
{
  PShape s = loadShape(filename);
  s.scale(80.0);
  if(index==1)
    s.rotateX(145);
    else
    {
      s.rotateY(45);
    }
    
    
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

void a(String s){  
  char c_array[] = new char[s.length()];
 


  for(int i = 0; i < s.length(); i++){
   c_array[i] = s.charAt(i); 
  }
}
  
void flyingHeads()
{
  float b1=5000+sin(frameCount/10.0)*300;
  float b2=5000+sin(frameCount/10.0+30)*300;
  float b3=5000+sin(frameCount/10.0+60)*300;
  a2+=10;
  if (a>1400){a=0;}
  pushMatrix();
    scale(0.1);
  translate(a2,b1,0);
   if(12.56<a*0.0135 && a*0.0135<18.8)
    rotateZ(a*0.0135);
  image(kppg,0,0);
  popMatrix();
  
  pushMatrix();
  scale(0.1);
  translate(a2+1000,b2,0);
    if(6.28<a*0.0135 && a*0.0135<12.56)
    rotateZ(a*0.0135);
  image(sppg,0,0);
  popMatrix();
  
  pushMatrix();
  scale(0.1);
  translate(a2+2000,b3,0);
  if(0<a*0.0135 && a*0.0135<6.28)
    rotateZ(a*0.0135);
  image(gppg,0,0);
  popMatrix();
}

void setBg(double x)
{

  for (int j = 0; j< n; j++)
  {
      pushMatrix();
      fill(150*(0.5+random(0.0,0.5))-(float)x,150*(0.5+0.5)-(float)x,0);
      ellipse(k[j].x+random(-1.0,1.0), k[j].y+random(-1.0,1.0), 5, 5);
      //scale(0.01);
      //image(star,0,0);
      popMatrix();
  }
}

void moveStars(float xin, float yin)
{
    for (int j = 0; j< n; j++)
  {
      float r2 = pow((k[j].x-xin),2.0)+pow((k[j].y-yin),2.0);
      float r = sqrt(r2);
      float move = (30/r2*0.5*pow(0.1,2.0)+0.1)/r;
      if(move>1)
      {
        k[j].x=xin;
        k[j].y=yin;
      }
      else
      {
      k[j].x=k[j].x+(k[j].x-xin)*move;
      k[j].y=k[j].y+(k[j].y-yin)*move;
      }
      
      pushMatrix();
      fill(150*(0.5+random(0.0,0.5))-(float)x,150*(0.5+0.5)-(float)x,0);
      ellipse(k[j].x+random(-1.0,1.0), k[j].y+random(-1.0,1.0), 5, 5);
      //scale(0.01);
      //image(star,0,0);
      popMatrix();
  }
} 