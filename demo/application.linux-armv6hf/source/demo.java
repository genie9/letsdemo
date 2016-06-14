import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import moonlander.library.*; 
import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*; 
import ddf.minim.signals.*; 
import ddf.minim.spi.*; 
import ddf.minim.ugens.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class demo extends PApplet {










float x, y, z;
int n = 1500;
float rad;
float r;
float a2 = 0;
float a = 0, b = 0, pos_x = 0;
int pic = 0;
PShape s; PShape s2; PShape noppa;
PImage kppg; PImage gppg; PImage sppg;
PImage bg;


Moonlander moonlander;

int xp[] = new int[n];
int yp[] = new int[n];
PVector v[] = new PVector[n];
PVector l[] = new PVector[n];
PVector k[] = new PVector[n];
PVector d[] = new PVector[n];

public void setup() {
    moonlander = Moonlander.initWithSoundtrack(this, "../data/Himatsu.mp3", 92, 8);
      
    
    x = width/2;
    y = height/2;
    z = 0;
    
    rad = sqrt(pow(width*2,2)+pow(width*2,2));
    frameRate(60);
    
   
    s = createOwnObj("../data/ratas.obj",1);
    s2 = createOwnObj("../data/pallo2.obj",2);
    noppa = createOwnObj("../data/ppg.obj",3);
    kppg = loadImage("../data/k.png");
    gppg = loadImage("../data/g.png");
    sppg = loadImage("../data/s.png");
    bg = loadImage("../data/testibg.png");

    
    int j = 0;
    while(j < n){
        xp[j] = (int)random(-rad, rad);
        yp[j] = (int)random(-rad, rad);
        v[j] = new PVector((float)xp[j], (float)yp[j]);
        k[j] = new PVector (random(0,width), random(0,height));

        if(mag(v[j].x, v[j].y) < rad) {
            l[j] = new PVector((float)xp[j], (float)yp[j]);
            d[j] = new PVector((float)xp[j], (float)yp[j]);
            j++;                 
        }
    }
        moonlander.start();
}

public void draw() {
  
    moonlander.update();
    double moon = moonlander.getIntValue("genie");
    double f_sel = moonlander.getValue("function_select");
    double value = moonlander.getValue("my_track");
      
    int m = millis();
    background(0);
  
    if(f_sel >= 1 && f_sel < 1.5f) { 
        slideWords("GRAFFATHON 2016", 255, 255, 255, 72, -135, 450);
    }
 
 //s(String words, int col_r, int col_g, int col_b, float text_size, float pos_y, int curve)
 //slideWords(String words, int col_r, int col_g, int col_b, float text_size, float pos_y) 
 
  //if(f_sel >= 1.5  && f_sel < 2){
      
    if(f_sel >= 1 && f_sel < 2) {
        flyingHeads();
        if(value >= 1){
            makeWords("Power Puff", 255, 255, 255, 87, 100, 100, 0); 
        }
        if(value >= 2) {
            makeWords("Let's demo!", 255, 255, 255, 100, 700, 50, 1);
        }
    }
  
    if(f_sel >= 2 && f_sel < 3) {
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
  
    if(f_sel >= 3 && f_sel < 4) {
        lighting();
        points2();
        testiObj((float)value*0.5f,(float)value);
    } 
  
    if(f_sel >= 4 && f_sel < 5) {
        mid_rec(m, 0, 0, 1, 255);
        side_rec(m);
        points(v, 0.992f);
        if(moon >= 1){
            lines(l, moon, 255, 255, 255, 0.992f);
            mid_rec(m, 0, 0, 3, 0);
        }
    }
  
    if(f_sel >= 5 && f_sel < 6) {
        points(l, 0.997f);
  
        if(f_sel >= 5 && f_sel < 5.5f) {
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
  
        if(f_sel >= 5.5f && f_sel < 6) {
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
  
  if(f_sel >= 6 && f_sel < 6.5f) {
    setBg(250);
    testiObj((float)value*0.5f,(float)value);
  }
  
  if(f_sel >=6.5f && f_sel < 7) {
     mid_rec(m, -500, -350, 1, 255);
     mid_rec(m, -750, 0, 1, 255);
     mid_rec(m, -500, 350, 1, 255);
     mid_rec(m, 500, -350, 1, 255);
     mid_rec(m, 750, 0, 1, 255);
     mid_rec(m, 500, 350, 1, 255);

    if(moon >= 1) {
      setBg(250);
      lines(d, moon, 252, 222, 98, 0.5f);  
    }
  }
  
  if(f_sel >= 7 && f_sel < 8){

    if(value >=  1 && value < 2){
      if(abs((float)value - 1.0f) < 0.01f) {a =0;}
      slideWords("I haven't let the fact that I have no idea what I'm doing slow me down one bit. - Jim Wells", 255, 255, 255, 26, 100, 850);
    }
    
    if(value >= 2 && value < 4){
      if(abs((float)value - 2.0f) < 0.01f) {a = 0;}
      slideWords("coDe && grAphiCs:", 255, 255, 255, 50, -400, 750);
      slideWords("kielo || Silphid || geniE ", 255, 255, 255, 55, 0, 850);
      //slideWords("Silphid", 255, 255, 255, 26, -200, 650);
      //slideWords("geniE", 255, 255, 255, 26, -100, 650);
    }

    if(value >= 4 && value < 5){
      if(abs((float)value - 4.0f) < 0.01f) {a = 0; }
      slideWords("MuSiC:", 255, 255, 255, 50, -200, 750);
      slideWords("A Himitsu", 255, 255, 255, 55, 0, 750);
    }
    if(value >= 5 && value < 6){
      if(abs((float)value - 5.0f) < 0.01f) {a = 0; }
      slideWords("THANKS TO:", 255, 255, 255, 56, -200, 700);
      slideWords("DOT", 255, 255, 255, 80, 200, 750);
    }
    if(value >= 6 && value < 7){
      if(abs((float)value - 6.0f) < 0.01f) {a = 0; }
      slideWords("DEMOSCENE WORLD WIDE!!!", 255, 255, 255, 50, 10, 700);
    }
    if(value >= 7 && value < 8){
      if(abs((float)value - 7.0f) < 0.01f) { a = 0; }
        flyingHeads();
    }
  }
  if(f_sel > 8.0f){
    exit();
  }
}


public void mid_rec(int m, int dx, int dy, int sw, int col) {
    pushMatrix(); 
    translate(x+dx, y+dy, z);
    noFill();
    stroke(col);
    strokeWeight(sw);
    rotate(m*35);
    rect(-75, -75, 150, 150);
    popMatrix();
}

public void side_rec(int m) {
    pushMatrix();
    translate(x,y,z);  
    noFill();
    stroke(255);
    rotate(m*100);
    rect(-300,-300,150,150);
    popMatrix(); 
}

public void points(PVector v[], float vel) {
    pushMatrix();
    translate(x,y,z);
    stroke(255);
    for(int p = 0; p < n; p++) {
        v[p].mult(vel);
        point(v[p].x, v[p].y);
    }   
    popMatrix(); 
}

public void points2() {
    pushMatrix();
    translate(x,y,z);
    for(int p = 0; p < n; p++){
       stroke(255);
       point(v[p].x*0.992f, v[p].y*0.992f);
    }   
    popMatrix();
}

public void lines(PVector v[], double m, int col_r, int col_g, int col_b, float vel) {
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

public void drawBoxes(float aa) {
    rotate(radians(+frameCount-70));
    drawBox(0,0, 255);
    drawBox(aa,50, 34);
}

public void drawBox2(float xx, float yy) {
    rotate(radians(+frameCount+70));
    pushMatrix();
    translate(xx, yy, 0);
    drawBox(500,radians(frameCount), 255);
    popMatrix();
}

public void drawBox(float xx, float r, float s) {
    pushMatrix();
    noFill();
    stroke(s,s-30,s+49);
    rotateY(radians(frameCount+ r)+PI/3);
    rotateX(radians(frameCount+r)+PI/6);
    if(pic == 0){
      box(50+xx/10);
    } else {
      shape(noppa, 0, 0);
    }
    popMatrix();
}

public void makeWords(String words, int col_r, int col_g, int col_b, float text_size, float pos_y, int curve, int math)  {
    pushMatrix();
    a += 2;
    if(math == 0){
        pos_x = pos_x + 1.5f;
        b = curve +sin(frameCount/10.0f)*60; 
    }
    if(math == 1){
        pos_x = pos_x + 2;
        b = curve + cos(frameCount/10.0f)*60; 
    }

    if (pos_x > 1400){ pos_x = 0; }
    translate(pos_x, b, 0);
    textSize(text_size); 
    fill(col_r, col_g, col_b);  
    text(words, 12, pos_y);
    popMatrix();
}

public void slideWords(String words, int col_r, int col_g, int col_b, float text_size, float pos_y, float start)  {
    pushMatrix();
    translate(x, y, z);
    textSize(text_size);
    fill(col_r, col_g, col_b); 
    a += 2; 
    text(words, a - start, pos_y);
    popMatrix();
}

public void testiObj(float xin, double y) {
    float x;
    float temp=50;
    
    if(y < 50) { x=exp(xin/5.0f);
    } else {
        x=exp(temp/5.0f-xin/5.0f);
    }
  
    if(y < 50) {
        s2.setVisible(false);
        s.setVisible(true);
        pushMatrix();
        translate(560.0f+2.5f*x, 540.0f, 0);
        scale(min(1.0f, (2.0f/x+0.03f)));
        rotateX(x);
        
        if(y > 40) { rotateY(x); }
        shape(s,0,0);
        popMatrix();
    
        pushMatrix();
        translate(1360.0f-2.5f*x, 540.0f, 0);
        scale(min(1.0f, (2.0f/x+0.03f)));
        rotateX(x);
        
        if(y > 40) { rotateY(x); }
        shape(s, 0, 0);
        popMatrix();
    } else {
        s.setVisible(false);
        s2.setVisible(true);
        pushMatrix();
        translate(950.0f, 540.0f, 0);
        scale(5.0f);
        scale(min(1.0f, (2.0f/x+0.03f)));
        rotateX(x);
  
        shape(s2, 0, 0);
        popMatrix();
    }
}

public void lighting() {
    float fov = PI/3.0f;
    float cameraZ = (height/2.0f) / tan(fov/2.0f);
    perspective(fov, PApplet.parseFloat(width)/PApplet.parseFloat(height), 
            cameraZ/10.0f, cameraZ*10.0f);
    ambientLight(50,50,100);
  //spotLight(0, 255, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
    directionalLight(255, 255, 100, 0, -1, 0);
}

public PShape createOwnObj(String filename,int index) {
    PShape s = loadShape(filename);
    s.scale(80.0f);
    if(index==1) { s.rotateX(145); }
    else { s.rotateY(45); }
    return s;
}

public void flyingHeads() {
    float b1 = 5000+sin(frameCount/10.0f)*300;
    float b2 = 5000+sin(frameCount/10.0f+30)*300;
    float b3 = 5000+sin(frameCount/10.0f+60)*300;
    a2 += 10;
    if (a > 1400) { a = 0; }
    
    pushMatrix();
    scale(0.1f);
    translate(a2, b1, 0);
    if(12.56f < a*0.0135f && a*0.0135f < 18.8f)
    rotateZ(a*0.0135f);
    image(kppg,0,0);
    popMatrix();
      
    pushMatrix();
    scale(0.1f);
    translate(a2+1000, b2, 0);
    if(6.28f < a*0.0135f && a*0.0135f < 12.56f)
    rotateZ(a*0.0135f);
    image(sppg,0,0);
    popMatrix();
      
    pushMatrix();
    scale(0.1f);
    translate(a2+2000, b3, 0);
    if(0 < a*0.0135f && a*0.0135f < 6.28f) { rotateZ(a*0.0135f); }
    image(gppg,0,0);
    popMatrix();
}

public void setBg(double x) {
    for (int j = 0; j< n; j++) {
        pushMatrix();
        strokeWeight(1);
        point(k[j].x+random(-1.0f,1.0f), k[j].y+random(-1.0f,1.0f));
      //scale(0.01);
      //image(star,0,0);
        popMatrix();
    }
}

public void moveStars(float xin, float yin) {
    for (int j = 0; j< n; j++) {
        float r2 = pow((k[j].x-xin),2.0f)+pow((k[j].y-yin),2.0f);
        float r = sqrt(r2);
        float move = (30/r2*0.5f*pow(0.1f,2.0f)+0.1f)/r;
        
        if(move>1) {
            k[j].x=xin;
            k[j].y=yin;
        } else {
            k[j].x = k[j].x+(k[j].x-xin)*move;
            k[j].y = k[j].y+(k[j].y-yin)*move;
        }
        pushMatrix();
        fill(150*(0.5f+random(0.0f,0.5f))-(float)x, 150*(0.5f+0.5f)-(float)x, 0);
        ellipse(k[j].x+random(-1.0f,1.0f), k[j].y+random(-1.0f,1.0f), 5, 5);
      //scale(0.01);
      //image(star,0,0);
        popMatrix();
    }
} 

public void fractal(int xsize, int ysize,float kerroin) {
    PImage temp = loadImage("../data/testi.png");
    temp.loadPixels();
    float x0;
    float y0;
    for (int xi=0; xi < xsize; xi++) {
        for (int yi=0; yi<ysize; yi++) {
            x0 = (float)-2.5f + kerroin*1.5f + (3.5f-3.0f*kerroin)*((float)xi) / ((float)xsize);
            y0 = (float)-1.0f + kerroin + (2.5f-2*kerroin)*((float)yi) / ((float)ysize);
            float x = 0.0f;
            float y = 0.0f;
            float iteration = 0;
            int max_iteration = 1000;
            
            while (x*x + y*y < 2*2  &&  (iteration < max_iteration)) {
                float xtemp = x*x - y*y + x0;
                y = 2*x*y + y0;
                x = xtemp;
                iteration = iteration + 1.0f;
            }
            if ( iteration < max_iteration ) {
            // sqrt of inner term removed using log simplification rules.
                float log_zn = log( x*x + y*y ) / 2;
                float nu = log( log_zn / log(2) ) / log(2);
                iteration = iteration + 1 - nu;
            }
            
            float color1 = log(floor(iteration))/log(1000)*255;
            float color2 = log(floor(iteration) + 1)/log(1000)*225;
            float colorC = (color1+color2)*0.5f;
            temp.pixels[xi+xsize*yi] = color(colorC);
        }
    }
    temp.updatePixels();
    background(temp);
}
  public void settings() {  size(1920, 1080, P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "demo" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
