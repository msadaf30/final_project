// variables
GameField grid;
GamePiece piece;
int gameSpd = 10;
PVector down = new PVector (0,1);
PVector dir = new PVector (0,0);

int size = 30;
boolean rotate;

void setup() {
  size(720, 720);
  grid = new GameField();
  piece = new GamePiece();
}
  
void draw() {
  background(0);
  strokeWeight(3);
  grid.print();
  drawPiece();
  
  
  if(frameCount % gameSpd == 0) {
    updatePiece();
  }
}

void newPiece() {}

void drawPiece() {
  fill(piece.r, piece.g, piece.b);
  for(int i = 0; i < piece.shape.length; i++) {
    PVector block = piece.shape[i];
    rect(block.x * size, block.y * size, size, size); 
  }
}

void updatePiece() {
  // add keypress direction
  for (int i = 0; i < piece.shape.length; i++) {
    piece.shape[i].add(dir);
  }
  
  // reset dir
  dir = new PVector(0,0);
  
  // rotate if possible
  if (rotate == true) {
    for (int i = 0; i < piece.shape.length; i++) {
      PVector original = piece.shape[i].copy();
      piece.shape[i] = new PVector(original.y, original.x);
    }
  }
  
  // reset rotate
  rotate = false;
  
  //// move piece down
  //for (int i = 0; i < piece.shape.length; i++) {
  //  piece.shape[i].add(down);
  //}
  
}

void checkRowFull() {}

void reset() {}

void emptyGrid() {}

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
  
