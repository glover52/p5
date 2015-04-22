public class Drop {
  float v = 0; 
  float s, x, y;
  
  Drop(float s, float x, float y) {
    this.s = s;
    this.x = x;
    this.y = y;
  }
  
  void update() {
     if(y>625) {
       y = (int) Math.ceil(Math.random()*-1200);
       x = (int) Math.ceil(Math.random()*400);
       v = 0;
     }
    
     v += g;
     y += v;
  }
  
  void draw() {
   for(int i=0; i<10; i++)
     rainDrop(); 
  }
  
  void rainDrop() {
    // Setup shapes 
    noStroke();
    translate(x, y);
    
    // Draw shapes
    triangle(s/-2, 0, s/2, 0, 0, -s*v/1.5);
    ellipse(0, 0, s, s);
    
    // Translate shapes back to original pos
    translate(-x, -y);
  }
}
