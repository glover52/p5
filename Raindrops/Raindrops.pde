final float g = 9.81f/105;
float x, y, s = 5;
int quantity = 50;

// Create an array to specificy current positions for each drop
Drop[] dropletArray = dropletArray(quantity);

Drop droplet;

void setup() {
 // Pass arguments to 'Drop' constructor
 droplet = new Drop(s, x, y);
 size(400,600);
}

void draw() {
 background(3);
 
 // Update location of each drop and draw it with its new location
 for(int i=0; i<quantity; i++) {
  dropletArray[i].update();
  dropletArray[i].draw();
 }
}

Drop[] dropletArray(int quantity) {
 int xValue;
 int yValue;
 
 Drop[] dropletArray = new Drop[quantity];
 
 // Specificy start x andy values for each drop.
 for(int i=0; i<quantity; i++) {
   xValue = (int) Math.ceil(Math.random()*400);
   yValue = (int) Math.ceil(Math.random()*-1200);
   dropletArray[i] = new Drop(s,xValue,yValue);
 }
 
 return dropletArray;
}
