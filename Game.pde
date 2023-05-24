// variables
GameField grid;
GamePiece piece;
int gameSpd = 20;
PVector down = new PVector (0,1);
PVector dir = new PVector (0,0);

int size = 30;
boolean rotate;
boolean canLeft;
boolean canRight;

void setup() {
  size(720, 720);
  grid = new GameField();
  newPiece();
}
  
void draw() {
  background(0);
  strokeWeight(3);
  grid.print();
  updatePiece();
  drawPiece();
  collisionCheck();
  
  if(frameCount % gameSpd == 0) {
    moveDown();
  }
}

void newPiece() {
  piece = new GamePiece();
}

void drawPiece() {
  fill(piece.r, piece.g, piece.b);
  piece.print();
}

void moveDown() {
  for (int i = 0; i < piece.shape.length; i++) {
    piece.shape[i].add(down);
  }
}

void updatePiece() {
  
  //if (dir.equals(new PVector(-1,0) {
  //  for (int i = 0; i < grid.deadPieces.size(); i++) {
  //    GamePiece dead = grid.deadPieces.get(i);
  //    for (int j = 0; j < dead.shape.length; j++) {
  //      for (int k = 0; k < piece.shape.length; k++) {
  //        if (piece.shape[k] == 0 || piece.shape.length[k].x == dead.shape[j].x - 1) {
  //          dir = new PVector(0,0);
  //        }
  //      }
  //    }
  //  }
  //}
  
  //if (dir.equals(new PVector(1, 0) {}
  
  for (int i = 0; i < piece.shape.length; i++) {
    if (piece.shape[i].x == 0 && dir.equals(new PVector(-1, 0))) {  // if shape is at x = 0 and LEFT is pressed
      dir = new PVector(0,0);                                       // nullifies the left dir
    }
    
    if (piece.shape[i].x == 11 && dir.equals(new PVector(1, 0))) {  // if shape is at x = 11 and RIGHT is pressed
      dir = new PVector (0,0);                                      // nullifies the right dir
    }
  }
  
  // add dir
  for (int j = 0; j < piece.shape.length; j++) {
    piece.shape[j].add(dir);
  }
  
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
  
  for (int i = 0; i < grid.deadPieces.size(); i++) {
    GamePiece dead = grid.deadPieces.get(i);
    for (int j = 0; j < dead.shape.length; j++) {
      for (int k = 0; k < piece.shape.length; k++) {
        if (piece.shape[k].x == dead.shape[j].x && piece.shape[k].y == dead.shape[j].y - 1) {
          result = true;
          break;
        }
      }
    }
  }
  
  for (int i = 0; i < piece.shape.length; i++) {
    if (piece.shape[i].y == 23) {
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
  
