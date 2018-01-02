class Box{
  
  
  float pX,pY,pZ,r;
  
   Box(float x, float y, float z, float scale){
     pX = x;
     pY = y;
     pZ = z;
     r = scale;
   }
   
   ArrayList<Box> generate(){
      ArrayList<Box> kids = new ArrayList<Box>();
      for(int x = -1; x < 2; x++){
        for(int y = -1; y < 2; y++){
          for(int z = -1; z < 2; z++){
               if(abs(x) + abs(y) + abs(z) <= 1){
                float newR = r/3;
                float nX = pX + x * newR;
                float nY = pY + y * newR;
                 float nZ = pZ + z * newR;
                 kids.add(new Box(nX, nY, nZ, newR));
               }
          }
        }
      }
      return kids;
     
   }
   
   
   
   void show(){
    pushMatrix();
    translate(pX, pY, pZ);
    fill(255); 
    noStroke();
     box(r);
     popMatrix();
   }
}

Box b = new Box(0,0,0,200);
ArrayList<Box> boxes = new ArrayList<Box>();
float a = 0;

void setup(){
  size(800,800, P3D);
  boxes.add(b);
  
}


void mousePressed(){
  ArrayList<Box> next = new ArrayList<Box>();
  for(Box box : boxes)
    next.addAll(box.generate());
  
  boxes = next;
  
  
}


void draw(){
  background(10);
  translate(width/2, height/2);
  lights();
  rotateX(a);
  rotateY(a);
  rotateZ(a);
  a += 0.01f;
  for(Box box : boxes)
    box.show();
  
  
}