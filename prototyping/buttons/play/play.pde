import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//
//Global Variables
Minim minim;
int numberOfSongs = 8; //Able to Autodetect based on Pathway
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;  //beginning current song as ZERO
//
int appWidth, appHeight;
//CAUTION: IF Statement Variable Population
float musicButtonDIV_X=0.0, musicButtonDIV_Y=0.0, musicButtonDIV_Width=0.0, musicButtonDIV_Height=0.0;
float musicButtonSquareX=0.0, musicButtonSquareY=0.0, musicButtonSquareWidth=0.0, musicButtonSquareHeight=0.0;
float stopX=0.0, stopY=0.0, stopWidth=0.0, stopHeight=0.0;
float playButton1X, playButton1Y, playButton2X, playButton2Y, playButton3X, playButton3Y;
//
color purple=#DB05FF, yellow=#FAFF00, white=#FFFFFF, black=#000000, orange=#C61429, blue=#03CCFC, lightblue=#17D18E;
color dayForeground=lightblue, dayHoverover=blue, dayBackground=white;
color darkForeground=yellow, darkHoverover=orange, darkBackground=black;
color nightForeground=lightblue, nightHoverover=yellow, nightBackground=black;
color appColorForeground, appColorHoverover, appColorBackground;
color stopButtonHoverOver;
//
Boolean colorNightMode=true;
//
void setup()
{
  size(1000, 800);
  appWidth = width;
  appHeight = height;
  //Variables for any music button
  musicButtonDIV_Width = appWidth*1/2;
  musicButtonDIV_Height = appHeight*1/2;
  musicButtonDIV_X = musicButtonDIV_Width - musicButtonDIV_Width*1/2;
  musicButtonDIV_Y = musicButtonDIV_Height- musicButtonDIV_Height*1/2;
  //Use if statement to change, introduce ternary operator
  //
  //Population (Variables)
  //Work out a case Study:
  if ( musicButtonDIV_Width >= musicButtonDIV_Height ) { // Landscape //error: square does not go in the middle
    // musicButtonWidth needs to change
    musicButtonSquareWidth = musicButtonDIV_Height ;
    musicButtonSquareHeight = musicButtonDIV_Height ;
    float padding1 = musicButtonDIV_Width - musicButtonDIV_Height; //working out value needed, with formulae
    float padding2 = padding1*1/2; ////working out value needed, with formulae
    musicButtonSquareX = musicButtonDIV_X + padding2 ; //note: minus moves it the wrong way, difficult to see
    musicButtonSquareY = musicButtonDIV_Y;
    println( musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height );
    println ( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
    println ( padding1 );
  } else { //Portrait
    // musicButtonHeight needs to change
    musicButtonSquareWidth = musicButtonDIV_Width ;
    musicButtonSquareHeight = musicButtonDIV_Width;
    float padding1 = musicButtonDIV_Height - musicButtonDIV_Width; //working out value needed, with formulae
    float padding2 = padding1*1/2; ////working out value needed, with formulae
    musicButtonSquareX = musicButtonDIV_X; //note: minus moves it the wrong way, difficult to see
    musicButtonSquareY = musicButtonDIV_Y + padding2;
    println( musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height );
    println ( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
    println ( padding1 );
  }
  stopWidth = musicButtonSquareWidth*3/5;
  stopHeight = stopWidth;
  stopX = musicButtonSquareX + musicButtonSquareX*1/4;
  stopY = musicButtonSquareY + musicButtonSquareY*2/5;
  println( stopX, stopY, stopWidth, stopHeight );
  playButton1X = musicButtonSquareX + musicButtonSquareWidth*1/4;
  playButton1Y = musicButtonSquareY + musicButtonSquareHeight*1/4;
  playButton2X = musicButtonSquareX + musicButtonSquareWidth*3/4;
  playButton2Y = musicButtonSquareY + musicButtonSquareHeight*1/2;
  playButton3X = musicButtonSquareX + musicButtonSquareWidth*1/4;
  playButton3Y = musicButtonSquareY + musicButtonSquareHeight*3/4;

  //
  /* Music Button Square Formulae for IF Statement Above
   // Use Paper Folding and Case Study
   float padding = 1.0/5.0;
   float stopButtonSize = musicButtonSquareWidth*3/5;
   stopWidth = stopButtonSize;
   stopHeight = stopButtonSize;
   stopX = musicButtonSquareX + musicButtonSquareX*padding;
   stopY = musicButtonSquareY + musicButtonSquareY*padding;
   */
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder
  //
  // Load Music
  String musicPathway = "music/";
  String mp3FileName = ".mp3";
  //Alphebetical order, same as OS ordering files
  String beatYourCompetition = "Beat_Your_Competition";
  String groove = "groove";
  String eureka = "Eureka";
  //
  //Add Reading into Array
  String directory = "../../../" + musicPathway;
  String file = directory + groove + mp3FileName;
  song[currentSong] = minim.loadFile( file );
  file = directory + beatYourCompetition + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  file = directory + groove + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  file = directory + eureka + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  //
  currentSong = 0;
  //
  song[currentSong].play();
  //Use play(timeStart) & loop(numberOfLoops)
  //Purpose is 2D Shapes
  //Introduce keyPressed as keyboard shortcuts
  //Introduce mousePressed as interaction
  //
  //DIVs
  //rect() based on variables; variables change with program (introduces parameters of a function and TABS)
  //rect( X, Y, Width, Height );
  //rect( musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height );
  //
  if ( hour()<=7 || hour ()>=17 ) {
    //Night Mode
    appColorForeground = nightForeground;
    appColorHoverover = nightHoverover;
    appColorBackground = nightBackground;
  } else if ( colorNightMode==false && ( hour()>7 || hour ()>17 ) ) {
    //Day Mode
    appColorForeground = dayForeground;
    appColorHoverover = dayHoverover;
    appColorBackground = dayBackground;
  } else {
    //Dark Mode
    appColorForeground = darkForeground;
    appColorHoverover = darkHoverover;
    appColorBackground = darkBackground;
  }
  //
} //End setup
//
void draw() {
  background(0); // Gray Scale: 0-255
  rect( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
    stopButtonHoverOver = appColorHoverover; // See SetUp;
  } else {
    stopButtonHoverOver = appColorForeground; // See SetUp;
  }
  fill(stopButtonHoverOver);
  noStroke(); //Colour
  triangle(playButton1X, playButton1Y, playButton2X, playButton2Y, playButton3X, playButton3Y);
  fill(255); //noFill();
  stroke(1); //Reset default
} //End draw
//
void mousePressed() {
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
    song[currentSong].loop(0); //Simple Play, double tap possible
  }
} //End mousePressed
//
void keyPressed() {
  //if ( key=='P' || key=='p' ) song[currentSong].loop(); //Simple Play, no double tap possible
  if ( key=='P' || key=='p' ) song[currentSong].play(); //Simple Play, no double tap possible
  //if ( key=='s' || key=='S' ) song[currentSong].pause(); //Simple Play, no double tap possible
  if ( key=='S' | key=='s' ) {
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause(); //single tap
    } else {
      song[currentSong].rewind(); //double tap
    }
  }
  if ( key=='L' || key=='l' ) song[currentSong].loop(1); // Loop ONCE: PLays, then again, then stops & rewinds
  if ( key=='K' || key=='k' ) song[currentSong].loop(); // Loop  Infinitely //Parameter: BLANK or -1
  if ( key=='F' || key=='f' ) song[currentSong].skip( 10*1000 ); // Fast Forward, Rewind, & Play Again //Parameter MILISECONDS
  if ( key=='R' || key=='r' ) song[currentSong].skip( -10*1000 ); // Fast Reverse
  if ( key=='M' || key=='m' ) { // MUTE
    //
    if ( song[currentSong].isMuted()  ) {
      song[currentSong].unmute();
    } else {
      song[currentSong].mute();
    }
  }
  if ( key=='O' || key=='o' ) { // Pause
    //
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else {
      song[currentSong].play();
    }
  }
  if ( key==CODED || key==ESC ) exit(); // QUIT //UP
  if ( key=='Q' || key=='q' ) exit(); // QUIT
  //
  if ( key=='N' || key=='n' ) { // NEXT //See .txt for starter hint
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      //
       if ( currentSong==3) {
      currentSong = 0;
       } else {
         currentSong++;
       }
      println("The current song is", currentSong);
      song[currentSong].play();
    } else {
      //
      println("The current song is", currentSong);
      song[currentSong].rewind();
      //
       if ( currentSong==3) {
         currentSong = 0;
       } else {
         currentSong++;
       }
      println("The current song is", currentSong);
      //song[currentSong].play();
    }
  }
  //if ( key=='' || key=='' ) ; // Shuffle - PLAY (Random)
  //if ( key=='' || key=='' ) ; // Play-Pause-STOP
} //End KeyPressed
//
// End Main Program
