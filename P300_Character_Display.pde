final int MAX_ROW = 3;
final int MAX_COLUMN = 3;
final int w = 1200;
final int h = 768;
void setup()
{
  size(1200,768);
  background(255);
 /*//Draw rectangles according to size of program.
  for (int i = 0; i < MAX_ROW; i++) {
    for (int j = 0; j < MAX_COLUMN; j++) 
    rect((w/MAX_ROW)*j, (h/MAX_COLUMN)*i, (w/MAX_ROW), (h/MAX_COLUMN));
  }*/  
  //Write out text in each.
  //Make into a function with two parameters: roworcolumn and position # of the row/column
  //Give the function default parameters
  //Make somewhat random?
      /*x is basically the column position. If we wanted to fix specific x values, we can 
      have:
      if (roworcolumn){ where we mess with rows
        switch (row #, the y value we want to specifically mess with)
        case 1: Each case should determine the row # that we should make blink
        case 2:
        case 3:
        all the way to case of MAX_ROW
      }
      else if (roworcolumn) { Mess with columns
         switch (column # = the x value we want to mess with)
         case 1: Each case should determine the column # that we should make blink
         case 2:
         case 3:
         all the way to case of MAX_COLUMN
      }*/
}
void draw() 
{
  
}
void producerandc(int rowcolumn, int position) {
  int y = 0;
  int x = 0;
  background(0); //Initialize the screen to black
  for (int i = 65; i < (65 + MAX_ROW*MAX_COLUMN);) {
    for (int j = i; j < (i + MAX_COLUMN); j++) {
      char f = char(j);
      /*x is basically the column position. If we wanted to fix specific x values, we can 
      have:
      if (roworcolumn){ where we mess with rows
        switch (row #, the y value we want to specifically mess with)
        case 1: Each case should determine the row # that we should make blink
        case 2:
        case 3:
        all the way to case of MAX_ROW
      }
      else if (roworcolumn) { Mess with columns
         switch (column # = the x value we want to mess with)
         case 1: Each case should determine the column # that we should make blink
         case 2:
         case 3:
         all the way to case of MAX_COLUMN
      }*/
      
      fill(0); //Default text color will be black and hidden 
      textSize(32); //Font will be 32
      //If this is a column and the position is equal to x, then enter and proceed with case statement
      if ((rowcolumn == 1) && (position == x)) {
         /*For now, limited up to 5 cases, but some of these cases will never be reached
         because of how the position is generated with respect to the MAX_COLUMN/MAX_ROW*/
        fill(255);
      }
      //If this is a row and position is equal to y, then only for this, will it enter the switch statement
      else if ((rowcolumn == 2) && (position == y)) {
        fill(255);
      }
      int p = (x*(w/MAX_COLUMN) + (x+1)*(w/MAX_COLUMN))/2;
      int g = ((h/MAX_ROW)*(y) + (h/MAX_ROW)*(y+1))/2;
      println("Printing at (x,y) of (" + p + "," + g + ")");
      x++;
      text(f,p,g); 
    }
    i += MAX_COLUMN;
    y++;
    x=0;
  }
}
void drawLines() {
 //Draw out the horizontal lines.
  for (int i = 0; i < MAX_ROW; i++) {
    line(0,(h/MAX_ROW)*(i), w, (h/MAX_ROW)*(i));
    println("line " + i + " with (x1,y1) equal to (" + 0 + "," + h/MAX_ROW + ")" + " with (x2,y2) equal to (" + w + "," + h/MAX_ROW + ")" );
  }
  for (int i = 0; i <MAX_COLUMN; i++) {
    line((w/MAX_COLUMN)*(i), 0,(w/MAX_COLUMN)*(i), h);
     println("line " + i + " with (x1,y1) equal to (" + 0 + "," + h/MAX_ROW + ")" + " with (x2,y2) equal to (" + w + "," + h/MAX_ROW + ")" );
  }
}