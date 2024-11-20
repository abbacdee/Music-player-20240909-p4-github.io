//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float NHLX, NHLY, NHLWidth, NHLHeight;
PImage picBackground, picNHL;
int picNHLWidth, picNHLHeight;
float NHLX_Changed, NHLY_Changed;
float picNHLWidthChanged, picNHLHeightChanged;
//
void setup() {
  size( 500, 600 ); //Landscape
  appWidth = width;
  appHeight = height;
  //
  //Population
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  picBackground = loadImage("MapleLeaf.jpg");
  NHLX_Changed = NHLX = appWidth * 1/4;
  NHLY_Changed = NHLY = appHeight * 1/4;
  NHLWidth = appWidth * 1/2;
  NHLHeight = appHeight * 1/2;
  picNHL = loadImage("NHL-logo.jpg");
  picNHLWidthChanged = picNHLWidth = 860;
  picNHLHeightChanged = picNHLHeight = 529;
  //
  //Image Compression
  float biggerSide = ( picNHLWidth > picNHLHeight ) ? picNHLWidth : picNHLHeight ;
  float smallerSide = ( picNHLHeight < picNHLWidth ) ? picNHLHeight : picNHLWidth ;
  float ratio = biggerSide / smallerSide; //Ratio bigger than one, divide means smaller side, multiply means larger side
  println( "Big Side:", biggerSide, "\tSmall Side:", smallerSide, "\tRatio:", ratio );
  /* Algorithm
  - Establish Landscape or Portrait of DIV
  - Note: I always fill smaller side of DIV, then calculate larger side of DIV
  - Hardcode if ratio will be >1 or <1 ... influences * or /
  - In the image, decide if calculating the larger side or the smaller side
  */
  if ( NHLWidth > NHLHeight ) { //DIV Landscape, find larger side
    picNHLHeightChanged = NHLHeight;
    picNHLWidthChanged = ( picNHLWidth > picNHLHeight ) ? picNHLWidthChanged / ratio : picNHLWidthChanged * ratio;
    println( "Inside If-true:", picNHLWidthChanged );
  } else { //DIV Portrait
    picNHLWidthChanged = NHLWidth;
    picNHLHeightChanged = ( picNHLWidth > picNHLHeight ) ? picNHLWidthChanged / ratio : picNHLWidthChanged * ratio;
    println( "Inside If-false:", picNHLHeightChanged );
  }
  println( "Changed Width:", picNHLWidthChanged, "\tChanged Height:", picNHLHeightChanged );
  //
  //DIVs
  rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  rect( NHLX, NHLY, NHLWidth, NHLHeight );
}
//
void draw() {
  //Draw Image One Time, for testing
  image( picBackground, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  image( picNHL, NHLX_Changed, NHLY_Changed, picNHLWidthChanged, picNHLHeightChanged );
}
//
void mousePressed() {
}
//
void keyPressed() {
}
//
//End MAIN
