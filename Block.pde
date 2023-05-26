public class Block {
  int size = 30;
  PVector square;
  int r, g, b;
  
  public Block(PVector block, int r, int g, int b) {
    this.square = block.copy();
    this.r = r;
    this.g = g;
    this.b = b;
  }
  
  void print() {
    fill(r, g, b);
    rect(square.x * size, square.y * size, size, size);
  }
  
}
