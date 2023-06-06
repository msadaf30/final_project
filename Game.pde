// variables
GameField grid;
GamePiece piece;
GamePiece nextPiece;

int gameSpd = 20;
PVector down = new PVector (0,1);
PVector dir = new PVector (0,0);
int size = 30;
int score = 0;
int highScore = 0;

boolean rotate;
boolean mainMenu;


void setup() {
  size(720, 720);
  grid = new GameField();
  newPiece();
  mainMenu = true;
}
  
void draw() {
  background(0);
  strokeWeight(3);
  grid.print();
  if (mainMenu) mainMenu();
  else {
    showScore();
    
    if(frameCount % gameSpd == 0) {
      moveDown();
      collisionCheck();
    }
    
    drawPiece();
    updatePiece();
    collisionCheck();
    clearAndScore();
  }
}

void newPiece() {
  piece = new GamePiece();
}

void drawPiece() {
  piece.print();
}

void moveDown() {
    piece.movePiece(down);
}

void updatePiece() {
  // if left, checks that piece is not touching left border
  if (dir.equals(new PVector(-1, 0))) {
    for (int i = 0; i < piece.shape.length; i++) {
      if (piece.shape[i].square.x == 0) {
        dir = new PVector(0,0);                                       
      }
    }
  }
  
  // if right, checks that piece is not touching right border
  if (dir.equals(new PVector(1, 0))) {
    for (int i = 0; i < piece.shape.length; i++) {
      if (piece.shape[i].square.x == 11 && dir.equals(new PVector(1, 0))) {  // if shape is at x = 11 and RIGHT is pressed
        dir = new PVector (0,0);                                      // nullifies the right dir
      }
    }
  }
  
  // checks if block is bordering any blocks (checks both left and right cases)
  for (int i = 0; i < grid.deadBlocks.size(); i++) {
    Block dead = grid.deadBlocks.get(i);
      
    for (int j = 0; j < piece.shape.length; j++) {
      Block block = piece.shape[j];
      boolean cantLeft = (block.square.x == 0 || (block.square.x == dead.square.x + 1 && block.square.y == dead.square.y));
      boolean cantRight = (block.square.x == 11 || (block.square.x == dead.square.x - 1 && block.square.y == dead.square.y));
      
      if (cantLeft && dir.equals( new PVector (-1, 0))) {
          dir = new PVector(0, 0);
      }
      
      if (cantRight && dir.equals( new PVector(1, 0))) {
        dir = new PVector(0, 0);
      }
    }
  } 
  
  // add dir
  piece.movePiece(dir);
  
  // reset dir after each press
  dir = new PVector(0,0);
  
  // rotate if possible
  if (rotate == true) {
    piece.rotate();
  }
  
  // reset rotate
  rotate = false;
}

void collisionCheck() {
  boolean result = false;
  
  for (int i = 0; i < grid.deadBlocks.size(); i++) {
    Block dead = grid.deadBlocks.get(i);
    for (int j = 0; j < piece.shape.length; j++) {
      if (piece.shape[j].square.x == dead.square.x && piece.shape[j].square.y == dead.square.y - 1) {
        result = true;
        break;
      }
    }
  }
  
  for (int i = 0; i < piece.shape.length; i++) {
    if (piece.shape[i].square.y == 23) {
      result = true;
      break;
    }
  }
  
  if (result == true) {
    grid.addPiece(piece);
    newPiece();
  }
}

void clearAndScore() {
  int rowCount = 0;
  
  for (int i = 0; i < 24; i++) {
    if (grid.checkRowFull(i)) {
      rowCount++;
      
      for (int j = 0; j < grid.deadBlocks.size(); j++) {
        if (grid.deadBlocks.get(j).square.y == i) {
          grid.deadBlocks.remove(j);
          j--;
        }
      }
      
      for (int k = 0; k < grid.deadBlocks.size(); k++) {
        if (grid.deadBlocks.get(k).square.y < i) {
          grid.deadBlocks.get(k).square.add(down);
        }
      }
    }
  }
  if (rowCount > 4) rowCount = 4;
  
  if (rowCount == 1) score += 40;
  else if (rowCount == 2) score += 100;
  else if (rowCount == 3) score += 300;
  else if (rowCount == 4) score += 1000;
}

void showScore() {
  textSize(64);
  fill(200,200,200);
  text("Score: " + score, 400, 100);
}

void mainMenu() {
  textSize(100);
  fill(200, 200, 200);
  text("TETRIS", 400, 150);
  textSize(48);
  text("Choose your", 420, 250);
  text("difficulty", 450, 300);
  
  rect(420, 350, 240, 60);
  rect(420, 460, 240, 60);
  rect(420, 570, 240, 60);
  
  fill(0,0,0);
  text("Slow", 490, 400);
  text("Normal", 465, 510);
  text("Hard", 490, 620);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      rotate = true;
    }
    if (keyCode == LEFT) {
      dir = new PVector(-1, 0);
    }
    if (keyCode == RIGHT) {
      dir = new PVector(1, 0);
    }
    if (keyCode == DOWN) {
      dir = new PVector(0, 1);
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    
  }
}

void mouseClicked() {
  mainMenu = false;
}
  
