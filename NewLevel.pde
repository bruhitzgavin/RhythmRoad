//=========================================================================================== //<>// //<>//
//
//   Ignore this tab. I use this when implementing new levels to ease the process.
//
//===========================================================================================

/*
////////// PLACEHOLDERS
[LEVELNAME] - level code in all lowercase
  [LVLNAME] - level name but correct
  [AUTHOR] - song author
  [LEVELNUM] - level number order
  [DIFFICULTY] - difficulty
  [DURATION] - duration in seconds
  [RECTY] - the Y-POS of the select rectangle


  ////////// FOR BEGINNING
  /// LEVEL [LEVELNUM]
  AudioPlayer [LEVELNAME];
boolean lvl[LEVELNUM]=false;

////////// FOR VOID SETUP
/// LEVEL [LEVELNUM]
beats[LEVELNUM] = loadStrings("data/songs/[LEVELNAME]/beats.txt");
[LEVELNAME] = minim.loadFile("data/songs/[LEVELNAME]/song.mp3"); // 103 Seconds

////////// FOR VOID DRAW
/// LEVEL [LEVELNUM] /////////////////
fill(#3DE7C3);
rect(width/2, [RECTY], 630, 100);
fill(255);
textSize(15);
textAlign(LEFT);
text("LEVEL [LEVELNUM] - [DIFFICULTY] - [DURATION]s", 92, [RECTY]-34);
textAlign(CENTER);
textSize(30);
text("[LVLNAME]", width/2, [RECTY]-5);
textSize(20);
text("[AUTHOR]", width/2, [RECTY]+20);
/////////////////////////////////////

while (lvl[LEVELNUM]) {
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
  surface.setTitle("Rhythm Road - [LVLNAME]");
  for (int i = 0; i<beats2.length; i++) {
    if (beats2[i].contains("'"+levelFrame+"'")) {
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
      break;
    }
  }
  while (paused) {
    [LEVELNAME].pause();
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
    [LEVELNAME].play();
    break;
  }
  if (lastClick>4) {
    failed=true;
    stopCounting=true;
  }
  if (lastClick>4&&failTrigger) {
    statFails++;
    failTrigger=false;
    lastClick=0;
  }
  while (failed) {
    [LEVELNAME].pause();
    resetCircles();
    rectMode(CENTER);
    lastClick=0;
    strokeWeight(1);
    fill(#3DE780);
    rect(width/2, height/2, width-100, height-290);
    fill(255);
    textSize(40);
    text("You Failed!", width/2, 130);
    //fill(#3DB6E7);
    //rect(width/2, 190, 630, 50);
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
  while (won) {
    rectMode(CENTER);
    lastClick=0;
    strokeWeight(1);
    fill(#3DE780);
    rect(width/2, height/2, width-100, height-290);
    fill(255);
    textSize(40);
    text("Level Completed", width/2, 130);
    //fill(#3DB6E7);
    //rect(width/2, 190, 630, 50);
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
  if (levelFrame>(60*([DURATION]+1))&&winTrigger) {
    won=true;
    points+=levelpoints;
    statWins++;
    if (levelpoints>statHighscore) {
      statHighscore=levelpoints;
    }
    winTrigger=false;
  }

  break;

  ////////// FOR VOID MOUSE PRESSED
  // [LEVELNAME]
  if (selectlvl&&levelselect&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>([RECTY]-50)&&mouseY<([RECTY]+50)&&!stats&&!tutorial) {
    //print("[LEVELNAME]");
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    mainmenu=false;
    levelselect=false;
    bgmusic.pause();
    background(0);
    lvl[LEVELNUM]=true;
    levelpoints=0;
    ingame=true;
    levelFrame=0;
    lastClick=0;
    [LEVELNAME].skip(-[LEVELNAME].length());
    [LEVELNAME].play();
  }
  // PAUSE: RESUME
  if (ingame&&lvl[LEVELNUM]&&paused&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(190-25)&&mouseY<(190+25)) {
    paused=false;
    stopCounting=false;
    background(0);
  }
  // PAUSE: RESTART
  if (ingame&&lvl[LEVELNUM]&&paused&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(250-25)&&mouseY<(250+25)) {
    paused=false;
    stopCounting=false;
    resetCircles();
    levelFrame=0;
    levelpoints=0;
    background(0);
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    [LEVELNAME].skip(-[LEVELNAME].length());
    [LEVELNAME].play();
  }
  // PAUSE: MAIN MENU
  if (ingame&&lvl[LEVELNUM]&&paused&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(310-25)&&mouseY<(310+25)) {
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    ingame=false;
    lvl[LEVELNUM]=false;
    paused=false;
    stopCounting=false;
    resetCircles();
    [LEVELNAME].pause();
    selectlvl=false;
    mainMenu();
  }
  // FAILED: RESTART
  if (ingame&&lvl[LEVELNUM]&&failed&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(250-25)&&mouseY<(250+25)) {
    failed=false;
    stopCounting=false;
    resetCircles();
    levelFrame=0;
    levelpoints=0;
    background(0);
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    [LEVELNAME].skip(-[LEVELNAME].length());
    [LEVELNAME].play();
  }
  // FAILED: MAIN MENU
  if (ingame&&lvl[LEVELNUM]&&failed&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(310-25)&&mouseY<(310+25)) {
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    ingame=false;
    lvl[LEVELNUM]=false;
    failed=false;
    stopCounting=false;
    resetCircles();
    [LEVELNAME].pause();
    selectlvl=false;
    mainMenu();
  }

  // WON: RESTART
  if (ingame&&lvl[LEVELNUM]&&won&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(250-25)&&mouseY<(250+25)) {
    won=false;
    stopCounting=false;
    resetCircles();
    levelFrame=0;
    levelpoints=0;
    background(0);
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    [LEVELNAME].skip(-[LEVELNAME].length());
    [LEVELNAME].play();
  }
  // WON: MAIN MENU
  if (ingame&&lvl[LEVELNUM]&&won&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(310-25)&&mouseY<(310+25)) {
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    ingame=false;
    lvl[LEVELNUM]=false;
    won=false;
    stopCounting=false;
    resetCircles();
    [LEVELNAME].pause();
    selectlvl=false;
    mainMenu();
  }
*/
