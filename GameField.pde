public class GameField {
  
   private float w;
   
   public GameField(){
       w = width/24;
   }
   
   void print(){
     stroke(155);
     for(int i = 0; i < 13; i++){
       line(i*w, 0, i*w, height); //vertical lines
       line(0, i*w, width / 2, i*w); //horizontal lines (top half);
       line(0, (13+i)*w, width / 2, (13+i)*w);
     }
   }
}
