int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float bikeX, bikeY, bikewidth, bikehight;
PImage picBackground;
//
size( 500, 100 ); //Landscape
appWidth = width;
appHeight = height;
//
//Population
backgroundImageX = appWidth*0;
backgroundImageY = appHeight*0;
backgroundImageWidth = appWidth-1;
backgroundImageHeight = appHeight-1;
picBackground = loadImage("NHL-logo.jpg");
//
//DIVs
rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
//
//Draw Image One Time, for testing
image( picBackground, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
