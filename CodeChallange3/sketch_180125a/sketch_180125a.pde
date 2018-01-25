import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
ArrayList<PVector> points = new ArrayList<PVector>();
float wait = 240;

void setup(){
 size(800, 800, P3D); 
 colorMode(HSB);
 cam = new PeasyCam(this, 500);
 for(int x = 1; x <= 101; x += 10)
   for(int y = 1; y <= 101; y += 10)
     for(int z = 1; z <= 101; z += 10)
       points.add(new PVector(x,y,z));
 
}

float sig = 10;
float r = 28;
float beta = 8f/3f;

float dt = 0.005f;
void draw(){
  background(0);
 
  if(wait <= 0)
  {for(PVector p : points){
      float dx = sig * (p.y - p.x) * dt;
      float dy = (r*p.x - p.y - p.x*p.z) * dt;
      float dz = (p.x * p.y - beta*p.z) * dt;
      p.x += dx;
      p.y += dy;
      p.z += dz;
      
    }
  }else
    wait--;
    
    translate(0,0,-80);
    scale(5);
    float hu = 0;
    for(PVector p : points){
      stroke(hu, 255,255);
      PVector offset = PVector.random3D();
      offset.mult(0.1f);
      p.x += offset.x;
      p.y += offset.y;
      p.z += offset.z;
      point(p.x, p.y, p.z);
      hu++;
      if(hu > 255)
        hu = 0;
    }
    
  
  
  
}