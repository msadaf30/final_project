// variables
GameField grid;
GamePiece piece;
int gameSpd = 10;
PVector down = new PVector (0,1);
PVector dir = new PVector (0,0);

int size = 30;
boolean rotate;
boolean canLeft;
boolean canRight;

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
  updatePiece();
  
  if(frameCount % gameSpd == 0) {
    //moveDown();
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

void moveDown() {
  // move piece down
  for (int i = 0; i < piece.shape.length; i++) {
    piece.shape[i].add(down);
  }
}

void updatePiece() {
  if (dir.equals(new PVector(-1, 0))) {  // if left move is tried
    canLeft = true;
    
    for (int i = 0; i < piece.shape.length; i++) { // checks if left move is possible and updates canLeft accordingly
      if (piece.shape[i].x == 0) {
        canLeft = false;
        break;
      }
    }
    
    if (canLeft == true) {
      for (int j = 0; j < piece.shape.length; j++) {
        piece.shape[j].add(dir);
      }
    }
  }
  
  if (dir.equals(new PVector(1, 0))) {  // if right move is tried
    canRight = true;
    
    for (int i = 0; i < piece.shape.length; i++) { // checks if right move is possible and updates canRight accordingly
      if (piece.shape[i].x == 11) {
        canRight = false;
        break;
      }
    }
    
    if (canRight == true) {
      for (int j = 0; j < piece.shape.length; j++) {
        piece.shape[j].add(dir);
      }
    }
  }
  
  // reset dir
  dir = new PVector(0,0);
  
  // rotate if possible
  if (rotate == true) {
  }
  
  // reset rotate
  rotate = false;
  
}

void colli {}

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
  
