public class GameField {
  
   float w;
   int size = 30;
   ArrayList<GamePiece> deadPieces = new ArrayList<GamePiece>();
   
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
     for(int i = 0; i < deadPieces.size(); i++) {
       GamePiece piece = deadPieces.get(i);
       fill(piece.r, piece.g, piece.b);
       piece.print();
     }
   }
   
   void addPiece(GamePiece piece) {
     piece.changeStatus();
     deadPieces.add(piece);
   }
}
