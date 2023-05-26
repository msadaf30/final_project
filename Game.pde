// variables
GameField grid;
GamePiece piece;
int gameSpd = 20;
PVector down = new PVector (0,1);
PVector dir = new PVector (0,0);

int size = 30;
boolean rotate;

void setup() {
  size(720, 720);
  grid = new GameField();
  newPiece();
}
  
void draw() {
  background(0);
  strokeWeight(3);
  grid.print();
  drawPiece();
  updatePiece();
  collisionCheck();
  
  if(frameCount % gameSpd == 0) {
    //moveDown();
    //collisionCheck();
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
  
  //// original code before refactor (doesn't include collision with deadBlocks)
  //for (int i = 0; i < piece.shape.length; i++) {
  //  if (piece.shape[i].square.x == 0 && dir.equals(new PVector(-1, 0))) {  // if shape is at x = 0 and LEFT is pressed
  //    dir = new PVector(0,0);                                       // nullifies the left dir
  //  }
    
  //  if (piece.shape[i].square.x == 11 && dir.equals(new PVector(1, 0))) {  // if shape is at x = 11 and RIGHT is pressed
  //    dir = new PVector (0,0);                                      // nullifies the right dir
  //  }
  //}
  
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

void reset() {}

void keyPressed() {
  if (key == CODED) {
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
    if (keyCode == UP) {
      rotate = true;
    }
  }
}
  
