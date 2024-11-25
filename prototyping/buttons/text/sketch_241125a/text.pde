/* Static Text
 - Testing for Aspect Ratio
 - introduce single and mutliple executed code
 - activity: do another rectangle with text in it
 - copy and paste to dynamic program
 */
// Global Variables
int appWidth, appHeight;
float titleX, titleY, titleWidth, titleHeight;
float abdulTextX, abdulTextY, abdulTextWidth, abdulTextHeight;
float footerX, footerY, footerWidth, footerHeight;
PFont titleFont, footerFont, phraseFont;
color ink, Red=#FFC1C1, Black=#000000, white=#FFFFFF, resetDefaultInk=white; //Not Night Mode Friendly
int size;
String title = "WHAT", footer="SHOT!", phrase="A CRAZY";
Boolean randomColour=false;
//
//Display
void setup() {
size( 500, 700 ); //Portrait CANVAS
appWidth = width;
appHeight = height;
//
//Text: Single Executed Code
//Fonts from OS (Operating System)
//String[] fontList = PFont.list(); //To list all fonts available on OS
//printArray(fontList); //For listing all possible fonts to choose from, then createFont
// Tools / Create Font / Find Font / Do not press "OK", known bug
titleFont = createFont("Comic Sans MS", 55); //Verify the font exists in Processing.Java
footerFont = createFont("Arial", 55);
phraseFont = createFont("Courier New", 55);
//
/* Population
- using 10's
- Could be 100s or percent
- Able to use decimals to dial in the values
*/
titleX = appWidth*1/10;
titleY = appHeight*1/10;
titleWidth = appWidth*8/10;
titleHeight = appHeight*1/10;
abdulTextX = titleX; //Best Practice: change on formula
abdulTextY = appHeight*4.5/10; //Ratio done last. How is this Centered Vertically?
abdulTextWidth = titleWidth; //Best Practice
abdulTextHeight = titleHeight; //Best Practice
footerX = titleX; //Best Practice
footerY = appHeight*8/10;
footerWidth = titleWidth; //Best Practice
footerHeight = titleHeight; //Best Practice
//DIVs
fill(Black);
rect( titleX, titleY, titleWidth, titleHeight ); //Title Font
rect( abdulTextX, abdulTextY, abdulTextWidth, abdulTextHeight ); // Testing Aspect Ratio of Fonts
rect( footerX, footerY, footerWidth, footerHeight ); //Different Font
}
//
//Drawing Text
void draw() {
fill(Red); //Ink, hexidecimal copied from Color Selector
textAlign(CENTER, CENTER); //Align X&Y, see Processing.org / Reference
ink = color( random(0, 256), random(256), random(256) );
fill(ink);
size = 45; //Change the number until it fits
textFont( titleFont, size ); 
text( title, titleX, titleY, titleWidth, titleHeight );
ink = color( random(0, 256), random(256), random(256) );
fill(ink);
size = 75; //Change the number until it fits
textFont( footerFont, size ); 
text( footer, footerX, footerY, footerWidth, footerHeight );
ink = color( random(0, 256), random(256), random(256) );
fill(ink);
size = 65; //Change the number until it fits
textFont( phraseFont, size ); 
text( phrase, abdulTextX, abdulTextY, abdulTextWidth, abdulTextHeight );
}
