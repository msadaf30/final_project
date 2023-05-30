public class GamePiece {
  
  // 7 game shapes exist: bar, square, tBone, leftL, rightL, leftS, and rightS
  private final PVector[] square = new PVector[] {new PVector(5,0), new PVector(5,1), new PVector(6, 0), new PVector(6,1)};
  private final PVector[] bar = new PVector[] {new PVector(4,0), new PVector(5,0), new PVector(6,0), new PVector(7,0)};
  private final PVector[] tBone = new PVector[] {new PVector(4,0), new PVector(5,0), new PVector(6,0), new PVector(5,1)};
  private final PVector[] leftL = new PVector[] {new PVector(5,0), new PVector(6,0), new PVector(7, 0), new PVector(7,1)};
  private final PVector[] rightL = new PVector[] {new PVector(5,0), new PVector(6,0), new PVector(7, 0), new PVector(5,1)};
  private final PVector[] leftS = new PVector[] {new PVector(5,0), new PVector(6,0), new PVector(6, 1), new PVector(7,1)};
  private final PVector[] rightS = new PVector[] {new PVector(6,0), new PVector(7,0), new PVector(5, 1), new PVector(6, 1)};
  
  // Array of all 7 shapes, from which one will be randomly selected
  private final PVector[][] allPieces = new PVector[][] {square, bar, tBone, leftL, rightL, leftS, rightS};
  
  // Array of colors (each shape has its own designated color)
  private final int[][] colors = 
  {
    {250, 0, 0},     //square
    {0, 200, 0},     //bar
    {100, 180, 100}, //tBone
    {250, 155, 0},   //leftL
    {250, 80, 205},  //rightL
    {155, 0, 155},   //leftS
    {175, 205, 100}  //rightS
  };
  
  // int indicates how many times the piece has rotated;
  private int rotCount;
  
  // array of blocks
  Block[] shape = new Block[4];
  Block[] originalShape = new Block[4];
  
  public GamePiece() {
    int rand = (int) random(7);
    PVector[] blocks = allPieces[rand];
    int r = colors[rand][0];
    int g = colors[rand][1];
    int b = colors[rand][2];
    
    for (int i = 0; i < shape.length; i++) {
      shape[i] = new Block(blocks[i], r, g, b);
    } 
    originalShape = shape;
    rotCount = 0;
  }
  
  void movePiece(PVector dir) {
    for (int i = 0; i < shape.length; i++) {
      shape[i].square.add(dir);
    }
  }
  
  void rotate() {
    PVector center = shape[1].square.copy();
    int centerX = (int) center.x;
    int centerY = (int) center.y;
    int sumCoord = centerX + centerY;
    int diffCoord = Math.abs(centerY - centerX);
    
 
    for (int i = 0; i < shape.length; i++) {
      int x = (int) originalShape[i].square.x;
      int y = (int) originalShape[i].square.y;
      
      int newX = y - diffCoord;
      int newY = -x + sumCoord;
      shape[i].square = new PVector(newX, newY);
    }
    
  //  if (rotCount % 4 == 0) {
  //    for (int i = 0; i < shape.length; i++) {
  //      int x = (int) originalShape[i].square.x;
  //      int y = (int) originalShape[i].square.y;
        
  //      int newX = y - diffCoord;
  //      int newY = -x + sumCoord;
  //      shape[i].square = new PVector(newX, newY);
  //    }
  //  }
  //  else if (rotCount % 4 == 1) {
  //    for (int i = 0; i < shape.length; i++) {
  //      int x = (int) originalShape[i].square.x;
  //      int y = (int) originalShape[i].square.y;
        
  //      int newX = -x;
  //      int newY = -y + sumCoord;
  //      shape[i].square = new PVector(newX, newY);
  //    }
  //  }
  //  else if (rotCount % 4 == 2) {
  //    for (int i = 0; i < shape.length; i++) {
  //      int x = (int) originalShape[i].square.x;
  //      int y = (int) originalShape[i].square.y;
        
  //      int newX = y - centerX;
  //      int newY = x - centerY;
  //      shape[i].square = new PVector(newX, newY);
  //    }
  //  }
  //  else if (rotCount % 4 == 3) {
  //    for (int i = 0; i < shape.length; i++) {
  //      int x = (int) originalShape[i].square.x;
  //      int y = (int) originalShape[i].square.y;
        
  //      int newX = x - centerX;
  //      int newY = y - centerY;
  //      shape[i].square = new PVector(newX, newY);
  //    }
  //  }
  //  rotCount++;
  }
  
  void print() {
    for (int i = 0; i < shape.length; i++) {
      shape[i].print();
    }
  }
  
}
