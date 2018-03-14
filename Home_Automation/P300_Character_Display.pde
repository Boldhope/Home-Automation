// P300_Character_Display.pde
// P300 Speller Window

import processing.core.*;
import g4p_controls.*;
import java.awt.Font;
 
public class P300_Character_Display {
 
  private final int w, h;
  private PApplet parent;
  private GWindow window;
  
  private final int MAX_ROW = 4;
  private final int MAX_COLUMN = 3;
 
  public P300_Character_Display() {
    w = 200;
    h = 200;
    parent = parentApplet;
  }
 
  public P300_Character_Display(PApplet p, int w, int h) {
    this.w = w;
    this.h = h;
    this.parent = p;
    createGUI();
  }
  
  public void show() {
    window.setVisible(true);
  }
  
  public void hide() {
    window.setVisible(false);
  }
  
  public void toggleVisible() {
    if(window.isVisible())
      hide();
    else
      show();
  }
  
  private void createGUI() {
    window =  GWindow.getWindow(parent, "P300 Speller", 100, 50, w, h, JAVA2D);
    window.addDrawHandler(this, "windowDraw");  // this is a reference to window (which extends PApplet), apparently?
    window.setActionOnClose(G4P.CLOSE_WINDOW);
    window.setAlwaysOnTop(true);
    window.setVisible(false);
  }
  
  /**
 * public abstract void setActionOnClose(int action);
 * This sets what happens when the users attempts to close the window.
 * There are 3 possible actions depending on the value passed.
 * G4P.KEEP_OPEN - ignore attempt to close window (default action)
 * G4P.CLOSE_WINDOW - close this window
 * G4P.EXIT_APP - exit the app, this will cause all windows to close.
 * @param action the required close action
  */
  
  // runs in a loop ~60FPS, I think
  // Draw using applet.<usual PApplet methods>(<args>)
  public void windowDraw(PApplet applet, GWinData windata) {
    
    // START -- Drawing character boxes
    int charXOffset, charYOffset;
    charXOffset = (w/MAX_ROW) / 2;
    charYOffset = (h/MAX_COLUMN) / 2;
    for (int i = 0; i < MAX_ROW; i++) {
      float xpos = (w/MAX_ROW)*i;
      for (int j = 0; j < MAX_COLUMN; j++) {
        float ypos = (h/MAX_COLUMN)*j;
       
        // to-do: generate random row and column and light up accordingly
        // to-do: check if rectangle should be lit, if so, fill with color other than black
        applet.fill(0f);
        applet.stroke(255f);
        applet.rect(xpos, ypos, (w/MAX_ROW), (h/MAX_COLUMN));
        applet.textSize(32);
        applet.fill(255f, 255f, 255f);
        applet.text(characters[(i+(j*MAX_ROW))], xpos + charXOffset, ypos + charYOffset);
      }
      //applet.line(0,(h/MAX_ROW)*(i), w, (h/MAX_ROW)*(i));
      //println("line " + i + " with (x1,y1) equal to (" + 0 + "," + h/MAX_ROW + ")" + " with (x2,y2) equal to (" + w + "," + h/MAX_ROW + ")" );
    }
    for (int i = 0; i <MAX_COLUMN; i++) {
      // may not need this anymore
    }
    // END -- Drawing character boxes
    
  }
  
  // From old P300_Character_Display
  // we won't need the old setup function here anymore
  /*
  void setup()
  {
    size(1200,768);
    background(255);
   //Draw rectangles according to size of program.
    for (int i = 0; i < MAX_ROW; i++) {
      for (int j = 0; j < MAX_COLUMN; j++) 
      rect((w/MAX_ROW)*j, (h/MAX_COLUMN)*i, (w/MAX_ROW), (h/MAX_COLUMN));
    } 
    //Write out text in each.
    //Make into a function with two parameters: roworcolumn and position # of the row/column
    //Give the function default parameters
    //Make somewhat random?
        //x is basically the column position. If we wanted to fix specific x values, we can 
        //have:
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
        }
  }

  void producerandc(int rowcolumn, int position) {
    int y = 0;
    int x = 0;
    background(0); //Initialize the screen to black
    for (int i = 65; i < (65 + MAX_ROW*MAX_COLUMN);) {
      for (int j = i; j < (i + MAX_COLUMN); j++) {
        char f = char(j);
        //x is basically the column position. If we wanted to fix specific x values, we can 
        //have:
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
        }
        
        fill(0); //Default text color will be black and hidden 
        textSize(32); //Font will be 32
        //If this is a column and the position is equal to x, then enter and proceed with case statement
        if ((rowcolumn == 1) && (position == x)) {
           //For now, limited up to 5 cases, but some of these cases will never be reached
           //because of how the position is generated with respect to the MAX_COLUMN/MAX_ROW
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
  */
}