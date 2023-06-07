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
    {210, 210, 0},     //square
    {100, 250, 250},     //bar
    {150, 0, 150}, //tBone
    {0, 100, 200},   //leftL
    {250, 150, 50},  //rightL
    {250, 50, 250},   //leftS
    {0, 200, 100}  //rightS
  };
  
  // array of blocks
  Block[] shape = new Block[4];
  Block[] originalShape = new Block[4];
  
  public GamePiece() {
    int rand = (int) random(7);
    PVector[] blocks = allPieces[1];
    int r = colors[rand][0];
    int g = colors[rand][1];
    int b = colors[rand][2];
    
    for (int i = 0; i < shape.length; i++) {
      shape[i] = new Block(blocks[i], r, g, b);
    } 
    originalShape = shape;
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
    int diffCoord = centerY - centerX;
    
 
    for (int i = 0; i < shape.length; i++) {
      int x = (int) shape[i].square.x;
      int y = (int) shape[i].square.y;
      
      int newX = y - diffCoord;
      int newY = -x + sumCoord;
      shape[i].square = new PVector(newX, newY);
    }
  }
  
  void print() {
    for (int i = 0; i < shape.length; i++) {
      shape[i].print();
    }
  }
  
}
