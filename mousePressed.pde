//===========================================================================================

void mousePressed() {
  // Level Select Screen
  if (mainmenu&&mouseX>((width/2)-90)&&mouseX<((width/2)+90)&&mouseY>(280-90)&&mouseY<(280+90)&&!levelselect&&!stats&&!tutorial) {
    //print("Level");
    levelselect = true;
    selectlvl=false;
    levelSelectMenu.skip(-levelSelectMenu.length());
    levelSelectMenu.play();
    lvlbg=0;
  }
  // Stats Screen
  if (mainmenu&&mouseX>((width/4)-60)&&mouseX<((width/4)+60)&&mouseY>(280-60)&&mouseY<(280+60)&&!levelselect&&!stats&&!tutorial) {
    //print("stats");
    stats=true;
    levelSelectMenu.skip(-levelSelectMenu.length());
    levelSelectMenu.play();
  }
  // Tutorial Screen
  if (mainmenu&&mouseX>((width-(width/4))-60)&&mouseX<((width-(width/4))+60)&&mouseY>(280-60)&&mouseY<(280+60)&&!levelselect&&!stats&&!tutorial) {
    //print("Tutorial");
    tutorial=true;
    levelSelectMenu.skip(-levelSelectMenu.length());
    levelSelectMenu.play();
  }

  //===========================================================================================

  // Exit button on all screens
  if (levelselect&&mouseX>(700-25)&&mouseX<(700+25)&&mouseY>(83-25)&&mouseY<(83+25)&&!stats&&!tutorial) {
    levelselect=false;
    selectlvl=false;
    levelSelectMenu.skip(-levelSelectMenu.length());
    levelSelectMenu.play();
  }
  if (tutorial&&mouseX>(700-25)&&mouseX<(700+25)&&mouseY>(83-25)&&mouseY<(83+25)&&!stats&&!levelselect) {
    tutorial=false;
    levelSelectMenu.skip(-levelSelectMenu.length());
    levelSelectMenu.play();
  }
  if (stats&&mouseX>(700-25)&&mouseX<(700+25)&&mouseY>(83-25)&&mouseY<(83+25)&&!tutorial&&!levelselect) {
    stats=false;
    levelSelectMenu.skip(-levelSelectMenu.length());
    levelSelectMenu.play();
  }

  //===========================================================================================

  // LEVELS
  // TAKE MY HAND
  if (selectlvl&&levelselect&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(170-50)&&mouseY<(170+50)&&!stats&&!tutorial) {
    //print("Take My Hand");
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    mainmenu=false;
    levelselect=false;
    winTrigger=true;
    failTrigger=true;
    bgmusic.pause();
    resetCircles();
    background(0);
    lvl1=true;
    levelpoints=0;
    ingame=true;
    levelFrame=0;
    lastClick=0;
    takemyhand.skip(-takemyhand.length());
    takemyhand.play();
  }
  // PAUSE: RESUME
  if (ingame&&lvl1&&paused&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(190-25)&&mouseY<(190+25)) {
    paused=false;
    stopCounting=false;
  }
  // PAUSE: RESTART
  if (ingame&&lvl1&&paused&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(250-25)&&mouseY<(250+25)) {
    paused=false;
    stopCounting=false;
    winTrigger=true;
    failTrigger=true;
    resetCircles();
    levelFrame=0;
    levelpoints=0;
    background(0);
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    takemyhand.skip(-takemyhand.length());
    takemyhand.play();
  }
  // PAUSE: MAIN MENU
  if (ingame&&lvl1&&paused&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(310-25)&&mouseY<(310+25)) {
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    ingame=false;
    lvl1=false;
    paused=false;
    stopCounting=false;
    resetCircles();
    takemyhand.pause();
    selectlvl=false;
    mainMenu();
  }
  // FAILED: RESTART
  if (ingame&&lvl1&&failed&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(250-25)&&mouseY<(250+25)) {
    failed=false;
    stopCounting=false;
    winTrigger=true;
    failTrigger=true;
    resetCircles();
    levelFrame=0;
    levelpoints=0;
    background(0);
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    takemyhand.skip(-takemyhand.length());
    takemyhand.play();
  }
  // FAILED: MAIN MENU
  if (ingame&&lvl1&&failed&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(310-25)&&mouseY<(310+25)) {
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    ingame=false;
    lvl1=false;
    failed=false;
    stopCounting=false;
    resetCircles();
    takemyhand.pause();
    selectlvl=false;
    mainMenu();
  }

  // WON: RESTART
  if (ingame&&lvl1&&won&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(250-25)&&mouseY<(250+25)) {
    won=false;
    stopCounting=false;
    winTrigger=true;
    failTrigger=true;
    resetCircles();
    levelFrame=0;
    levelpoints=0;
    background(0);
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    takemyhand.skip(-takemyhand.length());
    takemyhand.play();
  }
  // WON: MAIN MENU
  if (ingame&&lvl1&&won&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(310-25)&&mouseY<(310+25)) {
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    ingame=false;
    lvl1=false;
    won=false;
    stopCounting=false;
    resetCircles();
    takemyhand.pause();
    selectlvl=false;
    mainMenu();
  }

  //===========================================================================================

  // COLORBLIND
  if (selectlvl&&levelselect&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(280-50)&&mouseY<(280+50)&&!stats&&!tutorial) {
    //print("Colorblind");
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    mainmenu=false;
    levelselect=false;
    winTrigger=true;
    failTrigger=true;
    bgmusic.pause();
    resetCircles();
    background(0);
    lvl2=true;
    levelpoints=0;
    ingame=true;
    levelFrame=0;
    lastClick=0;
    colorblind.skip(-colorblind.length());
    colorblind.play();
  }
  // PAUSE: RESUME
  if (ingame&&lvl2&&paused&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(190-25)&&mouseY<(190+25)) {
    paused=false;
    stopCounting=false;
  }
  // PAUSE: RESTART
  if (ingame&&lvl2&&paused&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(250-25)&&mouseY<(250+25)) {
    paused=false;
    stopCounting=false;
    winTrigger=true;
    failTrigger=true;
    resetCircles();
    levelFrame=0;
    levelpoints=0;
    background(0);
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    colorblind.skip(-colorblind.length());
    colorblind.play();
  }
  // PAUSE: MAIN MENU
  if (ingame&&lvl2&&paused&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(310-25)&&mouseY<(310+25)) {
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    ingame=false;
    lvl2=false;
    paused=false;
    stopCounting=false;
    resetCircles();
    colorblind.pause();
    selectlvl=false;
    mainMenu();
  }
  // FAILED: RESTART
  if (ingame&&lvl2&&failed&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(250-25)&&mouseY<(250+25)) {
    failed=false;
    stopCounting=false;
    winTrigger=true;
    failTrigger=true;
    resetCircles();
    levelFrame=0;
    levelpoints=0;
    background(0);
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    colorblind.skip(-colorblind.length());
    colorblind.play();
  }
  // FAILED: MAIN MENU
  if (ingame&&lvl2&&failed&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(310-25)&&mouseY<(310+25)) {
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    ingame=false;
    lvl2=false;
    failed=false;
    stopCounting=false;
    resetCircles();
    colorblind.pause();
    selectlvl=false;
    mainMenu();
  }
  // WON: RESTART
  if (ingame&&lvl2&&won&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(250-25)&&mouseY<(250+25)) {
    won=false;
    stopCounting=false;
    winTrigger=true;
    failTrigger=true;
    resetCircles();
    levelFrame=0;
    levelpoints=0;
    background(0);
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    colorblind.skip(-colorblind.length());
    colorblind.play();
  }
  // WON: MAIN MENU
  if (ingame&&lvl2&&won&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(310-25)&&mouseY<(310+25)) {
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    ingame=false;
    lvl2=false;
    won=false;
    stopCounting=false;
    resetCircles();
    colorblind.pause();
    selectlvl=false;
    mainMenu();
  }

  //===========================================================================================

  // HIGHSCORE
  if (selectlvl&&levelselect&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(390-50)&&mouseY<(390+50)&&!stats&&!tutorial) {
    //print("highscore");
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    mainmenu=false;
    levelselect=false;
    winTrigger=true;
    failTrigger=true;
    bgmusic.pause();
    resetCircles();
    background(0);
    lvl3=true;
    levelpoints=0;
    ingame=true;
    levelFrame=0;
    lastClick=0;
    highscore.skip(-highscore.length());
    highscore.play();
  }
  // PAUSE: RESUME
  if (ingame&&lvl3&&paused&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(190-25)&&mouseY<(190+25)) {
    paused=false;
    stopCounting=false;
  }
  // PAUSE: RESTART
  if (ingame&&lvl3&&paused&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(250-25)&&mouseY<(250+25)) {
    paused=false;
    stopCounting=false;
    winTrigger=true;
    failTrigger=true;
    resetCircles();
    lvlbg=0;
    levelFrame=0;
    levelpoints=0;
    background(0);
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    highscore.skip(-highscore.length());
    highscore.play();
  }
  // PAUSE: MAIN MENU
  if (ingame&&lvl3&&paused&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(310-25)&&mouseY<(310+25)) {
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    ingame=false;
    lvl3=false;
    paused=false;
    stopCounting=false;
    resetCircles();
    highscore.pause();
    selectlvl=false;
    mainMenu();
  }
  // FAILED: RESTART
  if (ingame&&lvl3&&failed&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(250-25)&&mouseY<(250+25)) {
    failed=false;
    stopCounting=false;
    winTrigger=true;
    failTrigger=true;
    resetCircles();
    lvlbg=0;
    levelFrame=0;
    levelpoints=0;
    background(0);
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    highscore.skip(-highscore.length());
    highscore.play();
  }
  // FAILED: MAIN MENU
  if (ingame&&lvl3&&failed&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(310-25)&&mouseY<(310+25)) {
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    ingame=false;
    lvl3=false;
    failed=false;
    stopCounting=false;
    resetCircles();
    highscore.pause();
    selectlvl=false;
    mainMenu();
  }

  // WON: RESTART
  if (ingame&&lvl3&&won&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(250-25)&&mouseY<(250+25)) {
    won=false;
    stopCounting=false;
    winTrigger=true;
    failTrigger=true;
    resetCircles();
    levelFrame=0;
    levelpoints=0;
    background(0);
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    highscore.skip(-highscore.length());
    highscore.play();
  }
  // WON: MAIN MENU
  if (ingame&&lvl3&&won&&mouseX>((width/2)-(630/2))&&mouseX<((width/2)+(630/2))&&mouseY>(310-25)&&mouseY<(310+25)) {
    levelSelect.skip(-levelSelect.length());
    levelSelect.play();
    ingame=false;
    lvl3=false;
    won=false;
    stopCounting=false;
    resetCircles();
    highscore.pause();
    selectlvl=false;
    mainMenu();
  }
}

//===========================================================================================
//
//                        You've reached the end of the entire code.
//
//===========================================================================================
