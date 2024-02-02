//=========================================================================================== //<>//
//
//                                              ▄
//     ▄▄▄██▄▄     ▄▄▄▄   ▄█▄█ ▄▄    ▄██▌▄▄██████████▌  ▄▄▄    ▄█▄▌   ▄▄▄       ▄█▄
//    █████▀████  ████▌   ████▐██▄  ▐██▌ ▀▀▀▀████▀▀▀▀  ████   ▐███▌  █████    █████
//    ▀███   ▐███ ████   ████  ▀██▄ ███     ████      ▐███▌   ████  ▐█████▌  █████▌
//    ███▌  ▄██▀▐████████████▌  ██████▀    ▐███▌     ▄████████████  ██████▌ ██████
//   ▐████████▀ ▐███▌▀▀ ████     ████▀     ████      ▐███▀▀  ████  ▐███▌██████ ███
//   ██████▌    ████    ███▌     ███▀      ███▌      ████   ▐███   ████ ▐████ ▐██▌
//  ▐███ ▀██▄   ███▌ ████████▄  ████▄▄▄▄  ████    ▄▄▄███   ▄████▄ ▐███   ███  ███
//   ▀▐▌  ▀███    █  █████ ▀███ ███████████▀█   ▐█████   ██████████▀          ▀██
//          ▀██▄    ▐███▀▌  ███▄███▀   ▀████    ██████   ████▌ ▀████
//                 ████▄▄███▀▐██▌       ███   ███████   ████   ▐███
//                 ▐██████▀▀  ▐██▌      ▐███  ███▀ ███  ▐███▌   ████
//                 ███████    ▐███▄   ▄███▀ ▄█████████▌ ████  ▄████
//                ▐███  ███▄   ▀█████████▀  ███▀▀▀ ▐██▌██████████▀
//                ▀██▌   ▀██▌    ▀███▀▀     ███     ███▀███▀▀▀▀
//                         ██▀                      ▀▀▀
//
//                             Developed by Gavin
//                         Intro to Programming Final
//                               January 2024
//                                   Enjoy!
//
//                              Special Controls:
//                             F5 - Toggle Failing
//                 Spam F10 in stats menu 10 times - Reset stats
//
//===========================================================================================

// Minim is the library I used for sound
import ddf.minim.*;
Minim minim;
AudioPlayer takemyhand;
AudioPlayer colorblind;
AudioPlayer bgmusic;
AudioPlayer levelSelect;
AudioPlayer levelSelectMenu;
AudioPlayer highscore;
AudioPlayer win;
AudioPlayer fail;

//===========================================================================================

circle circle0, circle1, circle2, circle3, circle4, circle5, circle6, circle7, circle8, circle9; // Define circle objects
PFont Redhawk; // Load custom font
color lvlbg; // This is the variable used for changing the background color in levels.
PImage mml, bg, credit; // These are the images used. mml=Main Menu Logo. bg=Main Menu Background. credit=Made by Gavin picture.
String[] beats, beats2, beats3, lvlbg3; // These are the arrays for the song data files.
String[] pointsFile, winsFile, failsFile, clicksFile, highscoreFile; // These are the arrays for the save file data.
int levelFrame, lastClick, timer, levelpoints, points; // These corresspond with how wthe game works.
int mmlX, mmlW, mmlL; // These are variables for the loading screen image.
int mmlTextTS, mmlRectTS, bgTS; // These are variables for the loading screen.
int statWins, statFails, statClicks, statHighscore; // These are the variables in which your stats are saved in.
int allow=0; // Used to fix a bug in the level select screen.
float mmlT, mmlY, mmlX1, mmlY1; // These are variables for the loading screen image.
float easing = 0.05; // Used for some smooth transitions.
float accuracyNumber, beatCount; // Used for calculating your accuracy in levels.
String accuracy; // Used for calculating your accuracy in levels.

// These variables are all booleans used in the game. They are mostly used to change what appears on screen.
boolean selectlvl=false, mmlShow = false, mmlMove1 = false, mainmenu=false, levelselect=false, starting=true, mainmenu1=false, stats=false, tutorial=false, paused=false, ingame=false, failed=false, stopCounting = false, won = false, winTrigger=true, failTrigger=true;
boolean lvl1=false, lvl2=false, lvl3=false;
boolean ring0=false, ring1=false, ring2=false, ring3=false, ring4=false, ring5=false, ring6=false, ring7=false, ring8=false, ring9=false;
boolean nofail=false;

//===========================================================================================

void setup() {
  // Load custom font
  Redhawk = createFont("data/assets/fonts/Redhawk.otf", 128);

  // Set needed settings
  frameRate(60);
  size(800, 500);
  background(0);
  minim = new Minim(this);

  // Load Level 1 Assets
  beats = loadStrings("data/songs/takemyhand/easy.txt");
  takemyhand = minim.loadFile("data/songs/takemyhand/song.mp3"); // 178 Seconds

  // Load Level 2 Assets
  beats2 = loadStrings("data/songs/colorblind/new.txt");
  colorblind = minim.loadFile("data/songs/colorblind/song.mp3"); // 103 Seconds

  // Load Level 3 Assets
  beats3 = loadStrings("data/songs/highscore/beats.txt");
  lvlbg3 = loadStrings("data/songs/highscore/bg.txt");
  highscore = minim.loadFile("data/songs/highscore/song.mp3"); // 239 Seconds

  // Load Sound Effects
  win = minim.loadFile("data/assets/audio/win.wav");
  fail = minim.loadFile("data/assets/audio/fail.wav");
  levelSelect = minim.loadFile("data/assets/audio/levelSelect.wav");
  levelSelectMenu = minim.loadFile("data/assets/audio/levelSelectMenu.wav");

  // Load Images
  mml = loadImage("data/assets/img/logo.png");
  bg = loadImage("data/assets/img/bg.png");
  credit = loadImage("data/assets/img/gavin.png");

  // Define some variables
  mmlT=0;
  mmlX=width/2;
  mmlY=height/2;
  mmlW=402;
  mmlL=212;
  mmlTextTS = 0;
  mmlRectTS = 0;
  bgTS = 0;
  accuracyNumber=0;
  levelpoints=0;
  beatCount=0;

  // Load Game Circles
  circle0 = new circle(-200, -200);
  circle1 = new circle(-200, -200);
  circle2 = new circle(-200, -200);
  circle3 = new circle(-200, -200);
  circle4 = new circle(-200, -200);
  circle5 = new circle(-200, -200);
  circle6 = new circle(-200, -200);
  circle7 = new circle(-200, -200);
  circle8 = new circle(-200, -200);
  circle9 = new circle(-200, -200);

  // Load and Play Menu Music
  bgmusic = minim.loadFile("data/assets/audio/bgmusic.mp3");
  bgmusic.play();
  bgmusic.loop();

  // Save File Stuff
  pointsFile = loadStrings("data/user/points.txt");
  points=int(pointsFile[0]);
  winsFile = loadStrings("data/user/wins.txt");
  statWins=int(winsFile[0]);
  failsFile = loadStrings("data/user/fails.txt");
  statFails=int(failsFile[0]);
  clicksFile = loadStrings("data/user/clicks.txt");
  statClicks=int(clicksFile[0]);
  highscoreFile = loadStrings("data/user/highscore.txt");
  statHighscore=int(highscoreFile[0]);
  surface.setTitle("Rhythm Road - Loading..");
}

void draw() {
  // Starting Animation
  if (mmlShow == false) {
    mmlT=constrain(mmlT, 0, 255);
    mmlT+=0.5;
    // Logo
    tint(255, mmlT);
    imageMode(CENTER);
    image(mml, mmlX, mmlY, mmlW, mmlL);
  }
  if (millis() > 4000) {
    mmlShow = true;
    mmlY=constrain(mmlY, (height/2)-60, (height/2));
    mmlY-=2;
  }


  float targetY = (height/2)-60;
  float dy = targetY - mmlY;
  mmlY += dy * easing;
  if (millis()>1200&&millis()<7000) {
    mmlTextTS=constrain(mmlTextTS, 0, 255);
    mmlTextTS++;
    textFont(Redhawk);
    textSize(25);
    textAlign(CENTER);
    fill(255, mmlTextTS);
    text("LOADING..", width/2, height-(height/4));
  }

  if (millis()>5000&&millis()<6500) {
    rectMode(CENTER);
    fill(0, mmlRectTS);
    mmlRectTS=constrain(mmlRectTS, 0, 255);
    mmlRectTS++;
    mmlTextTS-=5;
    rect(width/2, height/2, width, height);
    starting=false;
    mainmenu=true;
  }

  // MAIN MENU
  while (millis()>6000 && mainmenu) {
    while (!stats&&!levelselect&&!tutorial) {
      surface.setTitle("Rhythm Road");
      break;
    }
    tint(255, bgTS);
    bg.resize(width, height);
    image(bg, width/2, height/2);
    bgTS=constrain(bgTS, 0, 255);
    bgTS+=6;
    image(mml, width/2, 100, mmlW/1.2, mmlL/1.2);
    ellipseMode(CENTER);
    fill(255, bgTS);
    stroke(0, bgTS);
    strokeWeight(4);
    ellipse(width/2, 280, 180, 180);
    fill(200, bgTS);
    ellipse(width/4, 280, 120, 120);
    ellipse(width-(width/4), 280, 120, 120);
    textFont(Redhawk);
    textSize(37);
    textAlign(CENTER);
    fill(0, bgTS);
    text("LEVEL", width/2, 270);
    text("SELECT", width/2, 310);
    textSize(18);
    text("STATS", width/4, 285);
    text("HOW TO", width-(width/4), 275);
    text("PLAY", width-(width/4), 295);
    credit.resize(362/2, 198/2);
    image(credit, width/2, 450);
    break;
  }

  // Level Select Screen
  while (levelselect) {
    surface.setTitle("Rhythm Road - Level Select");
    allow++;
    if (allow>15) {
      selectlvl=true;
    } else {
      selectlvl=false;
    }
    rectMode(CENTER);
    fill(0, 150);
    rect(width/2, height/2, width, height);
    strokeWeight(1);
    fill(200, 255);
    rect(width/2, height/2, width-100, height-100);
    fill(255);
    textSize(40);
    fill(0);
    text("LEVEL SELECT", width/2, 100);
    /////////////////////////////////////
    fill(#3DB6E7);
    rect(width/2, 170, 630, 100);
    fill(255);
    textSize(15);
    textAlign(LEFT);
    text("LEVEL 1 - EASY - 178s", 92, 136);
    textAlign(CENTER);
    textSize(30);
    text("Take My Hand", width/2, 165);
    textSize(20);
    text("Panda Eyes", width/2, 190);
    /////////////////////////////////////
    /////////////////////////////////////
    fill(#3DE7C3);
    rect(width/2, 170+110, 630, 100);
    fill(255);
    textSize(15);
    textAlign(LEFT);
    text("LEVEL 2 - HARD - 103s", 92, 136+110);
    textAlign(CENTER);
    textSize(30);
    text("Colorblind", width/2, 165+110);
    textSize(20);
    text("Panda Eyes", width/2, 190+110);
    /////////////////////////////////////
    /// LEVEL 3 /////////////////
    fill(#A42020);
    rect(width/2, 390, 630, 100);
    fill(255);
    textSize(15);
    textAlign(LEFT);
    text("LEVEL 3 - EXTREME - 260s", 92, 390-34);
    textAlign(CENTER);
    textSize(30);
    text("Highscore", width/2, 390-5);
    textSize(20);
    text("Panda Eyes", width/2, 390+20);
    /////////////////////////////////////
    rectMode(CENTER);
    fill(0);
    rect(700, 83, 50, 50);
    fill(255);
    text("X", 700, 90);
    winTrigger=true;
    failTrigger=true;
    levelpoints=0;
    break;
  }

  // Tutorial Screen
  while (tutorial) {
    surface.setTitle("Rhythm Road - Tutorial");
    rectMode(CENTER);
    fill(0, 150);
    rect(width/2, height/2, width, height);
    strokeWeight(1);
    fill(200, 255);
    rect(width/2, height/2, width-100, height-100);
    fill(255);
    textSize(40);
    fill(0);
    text("Instructions", width/2, 100);
    fill(#3DB6E7);
    rect(width/2, height/2, 650, 250);
    fill(255);
    textAlign(CENTER);
    textSize(22);
    text("Circles appear to the beat." + "\n" + "When they appear, click them to score points!" + "\n" + "(you can use left click or spacebar)" + "\n" + "\n" + "Be careful! You will fail if you miss five beats." + "\n" + "\n" + "Tip: Click escape to enter the in-game pause menu.", width/2, 165+10);
    fill(255, 80);
    text("Press F5 to toggle failing.", width/2, 360);
    rectMode(CENTER);
    fill(0);
    rect(700, 83, 50, 50);
    fill(255);
    text("X", 700, 90);
    break;
  }

  // Stats Screen
  while (stats) {
    if (!F10wait) {
      surface.setTitle("Rhythm Road - Stats");
    }
    rectMode(CENTER);
    fill(0, 150);
    rect(width/2, height/2, width, height);
    strokeWeight(1);
    fill(200, 255);
    rect(width/2, height/2, width-100, height-100);
    fill(255);
    textSize(40);
    fill(0);
    text("Your Stats", width/2, 100);
    fill(#3DB6E7);
    rect(width/2, height/2, 650, 250);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("Points: " + points + "\n" + "Wins: " + statWins + "\n" + "Fails: " + statFails + "\n" + "Beat Clicks: " + statClicks + "\n" + "Highscore: " + statHighscore, width/2, 165+15); // Wins, Fails, Beat Clicks, Highscore
    fill(0);
    textSize(22);
    text("Your stats automatically save every 10 seconds.", width/2, ((height/2)+(250/2))+40);
    rectMode(CENTER);
    fill(0);
    rect(700, 83, 50, 50);
    fill(255);
    text("X", 700, 90);
    break;
  }

  // Use Accuracy Function
  if (!paused) {
    accuracy(levelpoints, beatCount);
  }
  //===========================================================================================
  // LEVEL 1 CODE
  while (lvl1) {
    background(0);
    circle0.display();
    circle0.check();
    circle1.display();
    circle1.check();
    circle2.display();
    circle2.check();
    circle3.display();
    circle3.check();
    circle4.display();
    circle4.check();
    circle5.display();
    circle5.check();
    circle6.display();
    circle6.check();
    circle7.display();
    circle7.check();
    circle8.display();
    circle8.check();
    circle9.display();
    circle9.check();
    if (!stopCounting) {
      levelFrame++;
    }
    surface.setTitle("Rhythm Road - Take My Hand");

    // Check current frame for beat
    for (int i = 0; i<beats.length; i++) {
      if (beats[i].contains("'"+levelFrame+"'")) {
        if (!paused&&!failed&&!won) {
          String a = str(i);
          int b = a.length();
          String ca = str(a.charAt(b-1));
          int c = int(ca);
          if (c==0) {
            circle0.move(int(random(30, width-30)), int(random(30, height-30)));
            circle0.trans=255;
            circle0.rtrans=255;
            circle0.ringSize=150;
            ring0=true;
          }
          if (c==1) {
            circle1.move(int(random(30, width-30)), int(random(30, height-30)));
            circle1.trans=255;
            circle1.rtrans=255;
            circle1.ringSize=150;
            ring1=true;
          }
          if (c==2) {
            circle2.move(int(random(30, width-30)), int(random(30, height-30)));
            circle2.trans=255;
            circle2.rtrans=255;
            circle2.ringSize=150;
            ring2=true;
          }
          if (c==3) {
            circle3.move(int(random(30, width-30)), int(random(30, height-30)));
            circle3.trans=255;
            circle3.rtrans=255;
            circle3.ringSize=150;
            ring3=true;
          }
          if (c==4) {
            circle4.move(int(random(30, width-30)), int(random(30, height-30)));
            circle4.trans=255;
            circle4.rtrans=255;
            circle4.ringSize=150;
            ring4=true;
          }
          if (c==5) {
            circle5.move(int(random(30, width-30)), int(random(30, height-30)));
            circle5.trans=255;
            circle5.rtrans=255;
            circle5.ringSize=150;
            ring5=true;
          }
          if (c==6) {
            circle6.move(int(random(30, width-30)), int(random(30, height-30)));
            circle6.trans=255;
            circle6.rtrans=255;
            circle6.ringSize=150;
            ring6=true;
          }
          if (c==7) {
            circle7.move(int(random(30, width-30)), int(random(30, height-30)));
            circle7.trans=255;
            circle7.rtrans=255;
            circle7.ringSize=150;
            ring7=true;
          }
          if (c==8) {
            circle8.move(int(random(30, width-30)), int(random(30, height-30)));
            circle8.trans=255;
            circle8.rtrans=255;
            circle8.ringSize=150;
            ring8=true;
          }
          if (c==9) {
            circle9.move(int(random(30, width-30)), int(random(30, height-30)));
            circle9.trans=255;
            circle9.rtrans=255;
            circle9.ringSize=150;
            ring9=true;
          }
        }
        break;
      }
    }

    // Pause Screen
    while (paused) {
      takemyhand.pause();
      rectMode(CENTER);
      strokeWeight(1);
      fill(#3DE780);
      rect(width/2, height/2, width-100, height-290);
      fill(255);
      textSize(40);
      text("Level Paused", width/2, 130);
      fill(#3DB6E7);
      rect(width/2, 190, 630, 50);
      fill(#3D66E7);
      rect(width/2, 250, 630, 50);
      fill(#E73D3D);
      rect(width/2, 310, 630, 50);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("Resume", width/2, 200);
      text("Restart", width/2, 260);
      text("Main Menu", width/2, 320);
      break;
    }
    while (!paused&&!failed) {
      takemyhand.play();
      break;
    }

    // Fail code
    if (!nofail) {
      if (lastClick>4) {
        failed=true;
        stopCounting=true;
      }
      if (lastClick>4&&failTrigger) {
        statFails++;
        failTrigger=false;
        failSound();
        lastClick=0;
      }
    }

    // Fail Screen
    while (failed) {
      takemyhand.pause();
      resetCircles();
      rectMode(CENTER);
      lastClick=0;
      strokeWeight(1);
      fill(#3DE780);
      rect(width/2, height/2, width-100, height-290);
      fill(255);
      textSize(40);
      text("You Failed!", width/2, 130);
      fill(#3D66E7);
      rect(width/2, 250, 630, 50);
      fill(#E73D3D);
      rect(width/2, 310, 630, 50);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("Your Score: "+levelpoints, width/2, 200);
      text("Restart", width/2, 260);
      text("Main Menu", width/2, 320);
      break;
    }

    // Win Screen
    while (won) {
      rectMode(CENTER);
      lastClick=0;
      strokeWeight(1);
      fill(#3DE780);
      rect(width/2, height/2, width-100, height-290);
      fill(255);
      textSize(40);
      textAlign(CENTER);
      text("Level Completed", width/2, 130);
      fill(#3D66E7);
      rect(width/2, 250, 630, 50);
      fill(#E73D3D);
      rect(width/2, 310, 630, 50);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("Your Score: "+levelpoints, width/2, 200);
      text("Restart", width/2, 260);
      text("Main Menu", width/2, 320);
      break;
    }

    // WINNING CODE
    if (levelFrame>10680&&winTrigger) {
      won=true;
      points+=levelpoints;
      statWins++;
      if (levelpoints>statHighscore) {
        statHighscore=levelpoints;
      }
      winSound();
      winTrigger=false;
    }

    break;
  }

  //===========================================================================================
  // LEVEL 2 CODE
  while (lvl2) {
    background(0);
    circle0.display();
    circle0.check();
    circle1.display();
    circle1.check();
    circle2.display();
    circle2.check();
    circle3.display();
    circle3.check();
    circle4.display();
    circle4.check();
    circle5.display();
    circle5.check();
    circle6.display();
    circle6.check();
    circle7.display();
    circle7.check();
    circle8.display();
    circle8.check();
    circle9.display();
    circle9.check();
    if (!stopCounting) {
      levelFrame++;
    }
    surface.setTitle("Rhythm Road - Colorblind");

    // Check current frame for beat
    for (int i = 0; i<beats2.length; i++) {
      if (beats2[i].contains("'"+levelFrame+"'")) {
        if (!paused&&!failed&&!won) {
          String a = str(i);
          int b = a.length();
          String ca = str(a.charAt(b-1));
          int c = int(ca);
          if (c==0) {
            circle0.move(int(random(30, width-30)), int(random(30, height-30)));
            circle0.trans=255;
            circle0.rtrans=255;
            circle0.ringSize=150;
            ring0=true;
          }
          if (c==1) {
            circle1.move(int(random(30, width-30)), int(random(30, height-30)));
            circle1.trans=255;
            circle1.rtrans=255;
            circle1.ringSize=150;
            ring1=true;
          }
          if (c==2) {
            circle2.move(int(random(30, width-30)), int(random(30, height-30)));
            circle2.trans=255;
            circle2.rtrans=255;
            circle2.ringSize=150;
            ring2=true;
          }
          if (c==3) {
            circle3.move(int(random(30, width-30)), int(random(30, height-30)));
            circle3.trans=255;
            circle3.rtrans=255;
            circle3.ringSize=150;
            ring3=true;
          }
          if (c==4) {
            circle4.move(int(random(30, width-30)), int(random(30, height-30)));
            circle4.trans=255;
            circle4.rtrans=255;
            circle4.ringSize=150;
            ring4=true;
          }
          if (c==5) {
            circle5.move(int(random(30, width-30)), int(random(30, height-30)));
            circle5.trans=255;
            circle5.rtrans=255;
            circle5.ringSize=150;
            ring5=true;
          }
          if (c==6) {
            circle6.move(int(random(30, width-30)), int(random(30, height-30)));
            circle6.trans=255;
            circle6.rtrans=255;
            circle6.ringSize=150;
            ring6=true;
          }
          if (c==7) {
            circle7.move(int(random(30, width-30)), int(random(30, height-30)));
            circle7.trans=255;
            circle7.rtrans=255;
            circle7.ringSize=150;
            ring7=true;
          }
          if (c==8) {
            circle8.move(int(random(30, width-30)), int(random(30, height-30)));
            circle8.trans=255;
            circle8.rtrans=255;
            circle8.ringSize=150;
            ring8=true;
          }
          if (c==9) {
            circle9.move(int(random(30, width-30)), int(random(30, height-30)));
            circle9.trans=255;
            circle9.rtrans=255;
            circle9.ringSize=150;
            ring9=true;
          }
        }
        break;
      }
    }
    // Pause screen
    while (paused) {
      colorblind.pause();
      rectMode(CENTER);
      strokeWeight(1);
      fill(#3DE780);
      rect(width/2, height/2, width-100, height-290);
      fill(255);
      textSize(40);
      text("Level Paused", width/2, 130);
      fill(#3DB6E7);
      rect(width/2, 190, 630, 50);
      fill(#3D66E7);
      rect(width/2, 250, 630, 50);
      fill(#E73D3D);
      rect(width/2, 310, 630, 50);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("Resume", width/2, 200);
      text("Restart", width/2, 260);
      text("Main Menu", width/2, 320);
      break;
    }
    while (!paused&&!failed) {
      colorblind.play();
      break;
    }

    // Fail check
    if (!nofail) {
      if (lastClick>4) {
        failed=true;
        stopCounting=true;
      }
      if (lastClick>4&&failTrigger) {
        statFails++;
        failTrigger=false;
        failSound();
        lastClick=0;
      }
    }

    // Fail screen
    while (failed) {
      colorblind.pause();
      resetCircles();
      rectMode(CENTER);
      lastClick=0;
      strokeWeight(1);
      fill(#3DE780);
      rect(width/2, height/2, width-100, height-290);
      fill(255);
      textSize(40);
      text("You Failed!", width/2, 130);
      fill(#3D66E7);
      rect(width/2, 250, 630, 50);
      fill(#E73D3D);
      rect(width/2, 310, 630, 50);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("Your Score: "+levelpoints, width/2, 200);
      text("Restart", width/2, 260);
      text("Main Menu", width/2, 320);
      break;
    }

    // Win screen
    while (won) {
      rectMode(CENTER);
      lastClick=0;
      strokeWeight(1);
      fill(#3DE780);
      rect(width/2, height/2, width-100, height-290);
      fill(255);
      textSize(40);
      text("Level Completed", width/2, 130);
      fill(#3D66E7);
      rect(width/2, 250, 630, 50);
      fill(#E73D3D);
      rect(width/2, 310, 630, 50);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("Your Score: "+levelpoints, width/2, 200);
      text("Restart", width/2, 260);
      text("Main Menu", width/2, 320);
      break;
    }

    // WINNING CODE
    if (levelFrame>6180&&winTrigger) {
      won=true;
      points+=levelpoints;
      statWins++;
      if (levelpoints>statHighscore) {
        statHighscore=levelpoints;
      }
      winSound();
      winTrigger=false;
    }

    break;
  }
  //===========================================================================================
  // LEVEL 3 CODE
  while (lvl3) {
    background(lvlbg);
    textSize(30);
    while (levelFrame<=250) {
      fill(255);
      textSize(30);
      textAlign(CENTER);
      text("Welcome to the final level."+"\n"+"\n"+"In this level, you will be allowed"+"\n"+"15 misses instead of 4."+"\n"+"\n"+"Good luck, and have fun!!"+"\n"+"[ Minor Flash Warning! ]", (width/2), (height/2)-(height/4)+5);
      break;
    }
    circle0.display();
    circle0.check();
    circle1.display();
    circle1.check();
    circle2.display();
    circle2.check();
    circle3.display();
    circle3.check();
    circle4.display();
    circle4.check();
    circle5.display();
    circle5.check();
    circle6.display();
    circle6.check();
    circle7.display();
    circle7.check();
    circle8.display();
    circle8.check();
    circle9.display();
    circle9.check();
    if (!stopCounting) {
      levelFrame++;
    }
    surface.setTitle("Rhythm Road - Highscore");

    // Check current frame for beat
    for (int i = 0; i<beats3.length; i++) {
      if (beats3[i].contains("'"+levelFrame+"'")) {
        if (!paused&&!failed&&!won) {
          String a = str(i);
          int b = a.length();
          String ca = str(a.charAt(b-1));
          int c = int(ca);
          if (c==0) {
            circle0.move(int(random(30, width-30)), int(random(30, height-30)));
            circle0.trans=255;
            circle0.rtrans=255;
            circle0.ringSize=120;
            ring0=true;
          }
          if (c==1) {
            circle1.move(int(random(30, width-30)), int(random(30, height-30)));
            circle1.trans=255;
            circle1.rtrans=255;
            circle1.ringSize=120;
            ring1=true;
          }
          if (c==2) {
            circle2.move(int(random(30, width-30)), int(random(30, height-30)));
            circle2.trans=255;
            circle2.rtrans=255;
            circle2.ringSize=120;
            ring2=true;
          }
          if (c==3) {
            circle3.move(int(random(30, width-30)), int(random(30, height-30)));
            circle3.trans=255;
            circle3.rtrans=255;
            circle3.ringSize=120;
            ring3=true;
          }
          if (c==4) {
            circle4.move(int(random(30, width-30)), int(random(30, height-30)));
            circle4.trans=255;
            circle4.rtrans=255;
            circle4.ringSize=120;
            ring4=true;
          }
          if (c==5) {
            circle5.move(int(random(30, width-30)), int(random(30, height-30)));
            circle5.trans=255;
            circle5.rtrans=255;
            circle5.ringSize=120;
            ring5=true;
          }
          if (c==6) {
            circle6.move(int(random(30, width-30)), int(random(30, height-30)));
            circle6.trans=255;
            circle6.rtrans=255;
            circle6.ringSize=120;
            ring6=true;
          }
          if (c==7) {
            circle7.move(int(random(30, width-30)), int(random(30, height-30)));
            circle7.trans=255;
            circle7.rtrans=255;
            circle7.ringSize=120;
            ring7=true;
          }
          if (c==8) {
            circle8.move(int(random(30, width-30)), int(random(30, height-30)));
            circle8.trans=255;
            circle8.rtrans=255;
            circle8.ringSize=120;
            ring8=true;
          }
          if (c==9) {
            circle9.move(int(random(30, width-30)), int(random(30, height-30)));
            circle9.trans=255;
            circle9.rtrans=255;
            circle9.ringSize=120;
            ring9=true;
          }
        }
        break;
      }
    }

    // Check current frame for backgrond check
    for (int i = 0; i<lvlbg3.length; i++) {
      if (lvlbg3[i].contains("'"+levelFrame+"'")) {
        if (!paused&&!failed&&!won) {
          lvlbg = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
        }
      }
    }

    // Pause screen
    while (paused) {
      highscore.pause();
      rectMode(CENTER);
      strokeWeight(1);
      fill(#3DE780);
      rect(width/2, height/2, width-100, height-290);
      fill(255);
      textSize(40);
      text("Level Paused", width/2, 130);
      fill(#3DB6E7);
      rect(width/2, 190, 630, 50);
      fill(#3D66E7);
      rect(width/2, 250, 630, 50);
      fill(#E73D3D);
      rect(width/2, 310, 630, 50);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("Resume", width/2, 200);
      text("Restart", width/2, 260);
      text("Main Menu", width/2, 320);
      break;
    }
    while (!paused&&!failed) {
      highscore.play();
      break;
    }

    // Fail check
    if (!nofail) {
      if (lastClick>15) {
        failed=true;
        stopCounting=true;
      }
      if (lastClick>15&&failTrigger) {
        statFails++;
        failTrigger=false;
        failSound();
        lastClick=0;
      }
    }

    // Fail screen
    while (failed) {
      highscore.pause();
      resetCircles();
      rectMode(CENTER);
      lastClick=0;
      strokeWeight(1);
      fill(#3DE780);
      rect(width/2, height/2, width-100, height-290);
      fill(255);
      textSize(40);
      text("You Failed!", width/2, 130);
      fill(#3D66E7);
      rect(width/2, 250, 630, 50);
      fill(#E73D3D);
      rect(width/2, 310, 630, 50);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("Your Score: "+levelpoints, width/2, 200);
      text("Restart", width/2, 260);
      text("Main Menu", width/2, 320);
      break;
    }

    // Win screen
    while (won) {
      rectMode(CENTER);
      lastClick=0;
      strokeWeight(1);
      fill(#3DE780);
      rect(width/2, height/2, width-100, height-290);
      fill(255);
      textSize(40);
      text("Level Completed", width/2, 130);
      fill(#3D66E7);
      rect(width/2, 250, 630, 50);
      fill(#E73D3D);
      rect(width/2, 310, 630, 50);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("Your Score: "+levelpoints, width/2, 200);
      text("Restart", width/2, 260);
      text("Main Menu", width/2, 320);
      break;
    }

    // WINNING CODE
    if (levelFrame>(60*(260))&&winTrigger) {
      won=true;
      points+=levelpoints;
      statWins++;
      if (levelpoints>statHighscore) {
        statHighscore=levelpoints;
      }
      winSound();
      winTrigger=false;
    }

    break;
  }

  //===========================================================================================

  // Autosave every 10 seconds
  if (millis() - timer >= 10000) {
    autoSave();
    timer = millis();
  }

  // Ingame top-left text
  if (ingame&&!paused) {
    fill(0);
    rectMode(CORNER);
    fill(255);
    textSize(20);
    textAlign(LEFT);
    if (lvl1) {
      text("Time Elapsed: "+takemyhand.position()/1000 + " seconds"+"\n"+"Score: "+levelpoints+"\n"+"Accuracy: "+accuracy+"%", 15, 25);
    }
    if (lvl2) {
      text("Time Elapsed: "+colorblind.position()/1000 + " seconds"+"\n"+"Score: "+levelpoints+"\n"+"Accuracy: "+accuracy+"%", 15, 25);
    }
    if (lvl3) {
      text("Time Elapsed: "+highscore.position()/1000 + " seconds"+"\n"+"Score: "+levelpoints+"\n"+"Accuracy: "+accuracy+"%", 15, 25);
    }
    textAlign(CENTER);
  }

  //===========================================================================================

  // Make circle rings decrase size
  if (!paused&&!failed&&!won) {
    while (ring0) {
      circle0.ringSize--;
      if (circle0.ringSize<=circle0.size-8) {
        circle0.trans-=20;
        circle0.rtrans=0;
      }
      break;
    }
    while (ring1) {
      circle1.ringSize--;
      if (circle1.ringSize<=circle1.size-8) {
        circle1.trans-=20;
        circle1.rtrans=0;
      }
      break;
    }
    while (ring2) {
      circle2.ringSize--;
      if (circle2.ringSize<=circle2.size-8) {
        circle2.trans-=20;
        circle2.rtrans=0;
      }
      break;
    }
    while (ring3) {
      circle3.ringSize--;
      if (circle3.ringSize<=circle3.size-8) {
        circle3.trans-=20;
        circle3.rtrans=0;
      }
      break;
    }
    while (ring4) {
      circle4.ringSize--;
      if (circle4.ringSize<=circle4.size-8) {
        circle4.trans-=20;
        circle4.rtrans=0;
      }
      break;
    }
    while (ring5) {
      circle5.ringSize--;
      if (circle5.ringSize<=circle5.size-8) {
        circle5.trans-=20;
        circle5.rtrans=0;
      }
      break;
    }
    while (ring6) {
      circle6.ringSize--;
      if (circle6.ringSize<=circle6.size-8) {
        circle6.trans-=20;
        circle6.rtrans=0;
      }
      break;
    }
    while (ring7) {
      circle7.ringSize--;
      if (circle7.ringSize<=circle7.size-8) {
        circle7.trans-=20;
        circle7.rtrans=0;
      }
      break;
    }
    while (ring8) {
      circle8.ringSize--;
      if (circle8.ringSize<=circle8.size-8) {
        circle8.trans-=20;
        circle8.rtrans=0;
      }
      break;
    }
    while (ring9) {
      circle9.ringSize--;
      if (circle9.ringSize<=circle9.size-8) {
        circle9.trans-=20;
        circle9.rtrans=0;
      }
      break;
    }

    //===========================================================================================

    // No fail mode
    while (ingame) {
      if (nofail) {
        textSize(20);
        textAlign(RIGHT);
        fill(#A42020);
        text("No Fail Enabled", width-15, 25);
        fill(255);
        textAlign(CENTER);
      }
      break;
    }

    // Function used to clear save data
    while (F10wait) {
      bgmusic.pause();
      background(0);
      textSize(20);
      textAlign(CENTER);
      surface.setTitle("Rhythm Road");
      text("Your save data has been cleared."+"\n"+"The game will resume in a moment.", width/2, height/2);
      F10waittime++;
      if (F10waittime>(60*5)) {
        F10wait=false;
        stats=false;
        mainMenu();
        F10press=0;
        F10waittime=0;
      }
      break;
    }
  }

  // When window is not active, pause game
  while (!focused&&ingame&&!failed&&!won&&!paused) {
    paused=true;
    stopCounting=true;
    break;
  }
}

//===========================================================================================
//
//                          You've reached the end of this tab.
//
//===========================================================================================
