String textOut = "";

void setup() {
  size(800,600);
  background(3);
  stroke(255);
}

void draw() {
  
}

void keyPressed() {
  background(30);
  
  if(key=='\b' && textOut.length()>0)
    // Erase text if backspace key is pressed
    textOut = textOut.substring(0, textOut.length()-1);
  else
    // Add letter or number to string
    textOut = textOut + key;
    
  // Output textOut string
  text(textOut, 5, 15);
}
