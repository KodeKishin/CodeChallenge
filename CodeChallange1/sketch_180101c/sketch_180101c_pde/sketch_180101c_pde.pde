class Star{
  
  float x,y,z, pZ;
  float speed = 10;
 Star(){
   x = random(-width, width);
   y = random(-height, height);
   z = random(width);
   pZ = z;
 }
 
 
 void update(){
   z -= speed;
   speed = map(mouseX, 0, width, 0, 20);
   if(z < 1){
     z = width;
     x = random(-width, width);
   y = random(-height, height);
   pZ = z;
   }
 }
 
 void show(){
   fill(255);
   noStroke();
   
   float sX = map(x / z, 0, 1, 0, width);
   float sY = map(y / z, 0, 1, 0, height);
   
   float r = map(z, 0, width, 16, 0);
   
   ellipse(sX, sY, r,r);
   
   float pX = map(x / pZ, 0, 1, 0, width);
   float pY = map(y / pZ, 0, 1, 0, height);
   pZ = z;
   
   stroke(255);
   line(pX, pY, sX, sY);
   
   
 }
}

Star[] stars = new Star[400];

void setup(){
 size(800,800);
 for(int i = 0; i < stars.length; i++)
   stars[i] = new Star();

}

void draw(){
  background(0);
  translate(width/2, height/2);
  for(int i = 0; i < stars.length; i++){
    stars[i].update();
    stars[i].show();
  }
}