final float g = 9.81f/105;
float s = 5;
int quantity = 100;

float x;
float y;

Drop[] dropletArray = dropletArray(quantity);

Drop droplet;

void setup() {
 droplet = new Drop(s, x, y);
 size(400,600);
}

void draw() {
 background(3);
 for(int i=0; i<quantity; i++) {
  dropletArray[i].update();
  dropletArray[i].draw();
 }
}

Drop[] dropletArray(int quantity) {
 int xValue;
 int yValue;
 
 Drop[] dropletArray = new Drop[quantity];
 
 for(int i=0; i<quantity; i++) {
   xValue = (int) Math.ceil(Math.random()*400);
   yValue = (int) Math.ceil(Math.random()*-1200);
   dropletArray[i] = new Drop(s,xValue,yValue);
 }
 
 return dropletArray;
}
