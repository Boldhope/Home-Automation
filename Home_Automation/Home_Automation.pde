// Parent applet

import g4p_controls.*;
import java.awt.Font;

P300_Character_Display speller;
PApplet parentApplet;
char[] characters = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};  
// maybe dumb place/way to do this ^
// will also go out of index if row x column > 26

void settings(){
  size(1200, 768);
}
void setup()
{
  parentApplet = this;
  String[] args = {"--location=0,0", "P300_Character_Display"};
  speller = new P300_Character_Display(parentApplet, 800, 600);
  setupUI();
}
void draw() 
{
  background(200);
  ellipse(50, 50, 10, 10);
}

void setupUI() {
  String txt_ToggleSpeller = "Show/Hide P300 Speller";
  btn_ToggleSpeller = new GButton(this, 0, 0, 500, 50, txt_ToggleSpeller);
  btn_ToggleSpeller.setFont(new Font("Dialog", Font.PLAIN, 24));
  btn_ToggleSpeller.addEventHandler(this, "btn_ToggleSpeller_click");
}

// X Button ignored/disabled. Instead of closing window, we toggle its visibility.
GButton btn_ToggleSpeller;
public void btn_ToggleSpeller_click(GButton source, GEvent event) {
  //println("ToggleSpeller");
  speller.toggleVisible();
}

public void handleButtonEvents(GButton button, GEvent event) {
  
}