public class GameField {
  
   float w;
   int size = 30;
   ArrayList<Block> deadBlocks = new ArrayList<Block>();
   
   public GameField(){
       w = width/24;
   }
   
   void print(){
     // draw grid lines
     stroke(155);
     for(int i = 0; i < 13; i++){
       line(i*w, 0, i*w, height); //vertical lines
       line(0, i*w, width / 2, i*w); //horizontal lines (top half);
       line(0, (13+i)*w, width / 2, (13+i)*w);
     }
     
     // draws unmoving pieces
     for(int i = 0; i < deadBlocks.size(); i++) {
       Block block = deadBlocks.get(i);
       fill(block.r, block.g, block.b);
       block.print();
     }
   }
   
   void addPiece(GamePiece piece) {
     for (int i = 0; i < piece.shape.length; i++) {
       deadBlocks.add(piece.shape[i]);
     }
   }
   
   boolean checkRowFull(int row) {
     int rowMembers = 0;
     for (int i = 0; i < deadBlocks.size(); i++) {
       if (deadBlocks.get(i).square.y == row) {
         rowMembers++;
       }
     }
     if (rowMembers == 12) return true;
     else return false;
   }
}
