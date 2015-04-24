int[][] lineArray;
byte x, y, player;
int hRatio, wRatio;
boolean playerTurn, gameFinish;

void setup() {
  size(600, 600);
  strokeWeight(3);
  noFill();
  
  hRatio = height/3;
  wRatio = width/3;
  
  gameSetup();
}

void draw() {
  // Nothing is needed here.
  // You need this to draw shapes.
}

void mousePressed() {
  // Check if the match has been won by a player
  if(gameFinish) {
    gameSetup();
    return;
  }
  
  // Check values of columns and assign to x || y
  x = lineCheck(mouseX);
  y = lineCheck(mouseY);
  
  // Check if a player has already used coordinates
  if(lineArray[x][y]>0) {
    println("A player has already taken this spot.");
  } else {
    // Assign values to player and change coordinate to player integer
    player = playerCheck(playerTurn);
    lineArray[x][y] = player;
    
    // Draw shape of player (X = Player 1, O = Player 2)
    drawCross(playerTurn, x, y);
  
    // Debug Information for testing
    println("mouseClicked: " + mouseX + " " + mouseY);
    println("lineCheck: " + x + " " + y);
    println("Player: " + player);

    for(byte i=0; i<3; i++) {
      println(lineArray[0][i] + " "
            + lineArray[1][i] + " "
            + lineArray[2][i]);
    }
  
    // Check if the game is finished and swap player
    if(!drawCheck())
      checkWin();
      
    playerTurn = !playerTurn;
  }
}

void gameSetup() {
  // Set intial values to 0.
  lineArray = new int[3][3];
  gameFinish = false;
  
  background(3);
  stroke(255);
  strokeWeight(3);
  
  // Lines on the x axis
  line(width/3, 0, width/3, height);
  line(width-width/3, 0, width-width/3, height);
  
  // Lines on the y axis
  line(0, height/3, width, height/3);
  line(0, height-height/3, width, height-height/3);
}

void drawCross(boolean isCross, int xValue, int yValue) {
  // Set initial values
  strokeWeight(10);
  
  //Check shape and draw
  if(isCross) {
    stroke(255,75,75); // Cross = Red
    line(width/12+xValue * wRatio, height/12+yValue * hRatio,
         width/4+xValue * wRatio, height/4+yValue * hRatio);
         
    line(width/12+xValue * wRatio, height/4+yValue * hRatio,
         width/4+xValue * wRatio, height/12+yValue * hRatio);
  } else {
    stroke(75,75,255); // Ellipse = Blue
    ellipse(width/6+xValue * wRatio, height/6+yValue * hRatio, width/4, height/4);
  }
  
  // Revert initial values;
  strokeWeight(3);
}

void checkWin() {
  // Lists all possible win combinations
  int[][][] wins = {
    {{0,0}, {0,1}, {0,2}},
    {{1,0}, {1,1}, {1,2}},
    {{2,0}, {2,1}, {2,2}},
    {{0,0}, {1,0}, {2,0}},
    {{0,1}, {1,1}, {2,1}},
    {{0,2}, {1,2}, {2,2}},
    {{0,0}, {1,1}, {2,2}},
    {{2,0}, {1,1}, {0,2}}};
  
  // Splits up the 'wins' array and checks if a player has won
  for(int[][] winList : wins) {    
    checkWinLine(winList[0], winList[1], winList[2]);
  }
}

void checkWinLine(int[] a1, int[] a2, int[] a3) {
  int v1 = lineArray[a1[0]][a1[1]];
  int v2 = lineArray[a2[0]][a2[1]];
  int v3 = lineArray[a3[0]][a3[1]];
  
  if(v1 == v2 && v1 == v3 && v1 != 0) {
    println("Player " + playerCheck(playerTurn) + " wins!!");
    
    // Set line settings
    stroke(255);
    strokeWeight(10);
    
    // Draw line through winning coordinates, inverse gameFinish
    line(width/6 + a1[0] * wRatio, width/6 + a1[1] * hRatio,
         width/6 + a3[0] * wRatio, width/6 + a3[1] * hRatio);
    gameFinish = true;
  }
}

boolean drawCheck() {
  for(byte a=0; a<3; a++) {
    for(byte b=0; b<3; b++) {
      if(lineArray[a][b]==0) {
        // Allows players to contiue playing
        return false;
      }
    }
  }
  
  // Finish the game and return true
  gameFinish = true;
  println("The game is a draw.");
  return true;
}

byte lineCheck (int coordValue) {  
  // Using coordintes passed into the program
  // return a value of which column and row the cursor is in.
  if(coordValue < wRatio && coordValue < hRatio) {
    return 0;
  } else if(coordValue < 2*wRatio && coordValue < 2*hRatio) {
    return 1;
  } else {
    return 2;
  }
}

byte playerCheck(boolean playerTurn) {
  // Return Player's respective number (Player1 = 1, Player2 = 2)
  return playerTurn ? byte(1) : byte(2);
}
