//===========================================================================================

// Level Beat Click Accuracy Calculation
String accuracy(int levelpoints, float beatCount) {
  if (beatCount>0) {
    accuracyNumber = (levelpoints/beatCount)*100;
    accuracy=nf(accuracyNumber, 0, 1);
  } else {
    accuracy="0.0";
  }
  return accuracy;
}

//===========================================================================================

// Main Menu Function
void mainMenu() {
  mainmenu=true;
  lvl1=false;
  takemyhand.skip(-takemyhand.length());
  takemyhand.pause();
  colorblind.skip(-colorblind.length());
  colorblind.pause();
  highscore.skip(-highscore.length());
  highscore.pause();
  bgmusic.skip(-bgmusic.length());
  bgmusic.play();
}

//===========================================================================================

// Saving mechanism
void autoSave() {
  pointsFile[0] = str(points);
  winsFile[0] = str(statWins);
  failsFile[0] = str(statFails);
  clicksFile[0] = str(statClicks);
  highscoreFile[0] = str(statHighscore);
  saveStrings("data/user/points.txt", pointsFile);
  saveStrings("data/user/wins.txt", winsFile);
  saveStrings("data/user/fails.txt", failsFile);
  saveStrings("data/user/clicks.txt", clicksFile);
  saveStrings("data/user/highscore.txt", highscoreFile);
}

//===========================================================================================

// Play fail sound
void failSound() {
  fail.skip(-fail.length());
  fail.play();
}

//===========================================================================================

// Play win sound
void winSound() {
  win.skip(-win.length());
  win.play();
}

//===========================================================================================
//
//                          You've reached the end of this tab.
//
//===========================================================================================
