import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//global varis
Minim minim;
int numberOfSongs = 3;
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;

String musicPath = "../../../../music/";
String mp3FileName = ".mp3";
String[] musicNames = {
  "Beat_Your_Competition",
  "Eureka",
  "groove"
};

int appWidth, appHeight;
//CAUTION: IF Statement Variable Population
float musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height;
float musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight;
float stopX, stopY, stopWidth, stopHeight;

color purple=#4E04C6, white=#FFFFFF, black=#000000, pink=#DE02AB;
color dayForeground=pink, dayHoverover=white, dayBackground=purple;
color darkForeground=black, darkHoverover=pink, darkBackground=purple;
color nightForeground=black, nightHoverover=white, nightBackground=black;
color appColorForeground, appColorHoverover, appColorBackground;
color stopButtonHoverOver;

Boolean colorDayMode=false, colorDarkMode=true, colorNightMode=false;

// Global Variables
void setup() {
  size(1000, 800);
  appWidth = width;
  appHeight = height;
  //Variables for any music button
  musicButtonDIV_Width = appWidth*1/2;
  musicButtonDIV_Height = appHeight*1/2;
  musicButtonDIV_X = musicButtonDIV_Width - musicButtonDIV_Width*1/2;
  musicButtonDIV_Y = musicButtonDIV_Height- musicButtonDIV_Height*1/2;

  minim = new Minim(this);

  if ( musicButtonDIV_Width >= musicButtonDIV_Height ) { // Landscape //error: square does not go in the middle
    // musicButtonWidth needs to change
    musicButtonSquareWidth = musicButtonDIV_Height ;
    musicButtonSquareHeight = musicButtonDIV_Height ;
    float padding1 = musicButtonDIV_Width - musicButtonDIV_Height; //working out value needed, with formulae
    float padding2 = padding1*1/2; ////working out value needed, with formulae
    musicButtonSquareX = musicButtonDIV_X + padding2 ; //note: minus moves it the wrong way, difficult to see
    musicButtonSquareY = musicButtonDIV_Y;
  } else { //Portrait
    // musicButtonHeight needs to change
    musicButtonSquareWidth = musicButtonDIV_Width ;
    musicButtonSquareHeight = musicButtonDIV_Width;
    float padding1 = musicButtonDIV_Height - musicButtonDIV_Width; //working out value needed, with formulae
    float padding2 = padding1*1/2; ////working out value needed, with formulae
    musicButtonSquareX = musicButtonDIV_X; //note: minus moves it the wrong way, difficult to see
    musicButtonSquareY = musicButtonDIV_Y + padding2;
  }

  stopWidth = musicButtonSquareWidth*1/2;
  stopHeight = musicButtonSquareHeight*1/2;
  stopX = musicButtonSquareX + musicButtonSquareWidth*1/4;
  stopY = musicButtonSquareY + musicButtonSquareHeight*1/4;

  String file = musicPath + musicNames[0] + mp3FileName;
  song[currentSong] = minim.loadFile(file);
  file = musicPath + musicNames[1] + mp3FileName;
  song[currentSong+=1] = minim.loadFile(file);
  file = musicPath + musicNames[2] + mp3FileName;
  song[currentSong+=1] = minim.loadFile(file);

  // Load Music
  song[currentSong].play();

  if (hour()<=7 || hour()>17 || colorNightMode == true) {
    //nightmode
    appColorForeground = nightForeground;
    appColorHoverover = nightHoverover;
    appColorBackground = nightBackground;
  } else if (hour()>7 || hour()<17 || colorDayMode == true) {
    //daymode
    appColorForeground = dayForeground;
    appColorHoverover = dayHoverover;
    appColorBackground = dayBackground;
  } else {
    //darkmode
    appColorForeground = darkForeground;
    appColorHoverover = darkHoverover;
    appColorBackground = darkBackground;
  }
} // End Setup

void draw() {
  background(appColorBackground);
  fill(0);
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
    fill(appColorForeground);
  } else {
    fill(appColorHoverover);
  }
  rect( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
  fill(appColorBackground);
  textSize(32);
  rect( stopX, stopY, stopWidth, stopHeight );
  fill(255);

  // image(playbutton, 50, height/ 2 - 100);
  // image(pausebutton, width / 2 + 200, height/ 2 - 120);
} // End draw

void mousePressed() {
} // End mousePressed

void keyPressed() {
  //song skip below
  if (key == 'P' || key == 'p') {
    if (song[currentSong].isPlaying()) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong==numberOfSongs-1 ) {
        currentSong = 0;
      } else {
        currentSong++;
      }
      song[currentSong].play();
    } else {
      //
      song[currentSong].rewind();
      //
      if ( currentSong==numberOfSongs-1 ) {
        currentSong = 0;
      } else {
        currentSong++;
      }
      //end song skip
    }
  } // End keyPressed
}
