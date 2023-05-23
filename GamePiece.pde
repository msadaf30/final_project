public class GamePiece {
  
  // 7 game shapes exist: bar, square, tBone, leftL, rightL, leftS, and rightS
  PVector[] square = new PVector[] {new PVector(5,0), new PVector(5,1), new PVector(6, 0), new PVector(6,1)};
  PVector[] bar = new PVector[] {new PVector(4,0), new PVector(5,0), new PVector(6,0), new PVector(7,0)};
  PVector[] tBone = new PVector[] {new PVector(4,0), new PVector(5,0), new PVector(6,0), new PVector(5,1)};
  PVector[] leftL = new PVector[] {new PVector(5,0), new PVector(6,0), new PVector(7, 0), new PVector(7,1)};
  PVector[] rightL = new PVector[] {new PVector(5,0), new PVector(6,0), new PVector(7, 0), new PVector(5,1)};
  PVector[] leftS = new PVector[] {new PVector(5,0), new PVector(6,0), new PVector(6, 1), new PVector(7,1)};
  PVector[] rightS = new PVector[] {new PVector(6,0), new PVector(7,0), new PVector(5, 1), new PVector(6, 1)};
  
  // Array of all 7 shapes, from which one will be randomly selected
  PVector[][] allPieces = new PVector[][] {square, bar, tBone, leftL, rightL, leftS, rightS};
  PVector[] shape;
  
  // Array of colors (each shape has its own designated color)
  int[][] colors = 
  {
    {250, 0, 0},     //square
    {0, 200, 0},     //bar
    {100, 180, 100}, //tBone
    {250, 155, 0},   //leftL
    {250, 80, 205},  //rightL
    {155, 0, 155},   //leftS
    {175, 205, 100}  //rightS
  };
  int r,g,b;
  
  // boolean dicates whether the piece is still moving or has been set in place
  boolean isActive;
  
  public GamePiece() {
    int rand = (int) random(7);
    shape = allPieces[rand];
    r = colors[rand][0];
    g = colors[rand][1];
    b = colors[rand][2];
    isActive = true;
  }
  
  void changeStatus() {
    isActive = false;
  }
  
}
