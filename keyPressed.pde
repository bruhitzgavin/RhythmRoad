//===========================================================================================

// These variables are used to clear game save files.
int F10press=0, F10waittime=0;
boolean F10wait=false;

//===========================================================================================

void keyPressed() {
  if (key == ESC) {
    key = 0; // Disable default processing exit program
    // Use escape to exit menus
    if (!paused&&ingame&&!failed&&!won) {
      paused=true;
      stopCounting=true;
    }
    if (levelselect) {
      levelselect=false;
    }
    if (stats) {
      stats=false;
    }
    if (tutorial) {
      tutorial=false;
    }
  }
  if (key == CODED) {
    if (keyCode==116) {
      if (nofail) {
        nofail=false;
      } else {
        nofail=true;
      }
    }
    // This is the code used to reset save files.
    if (keyCode==121) {
      if (stats) {
        F10press++;
        if (F10press>=10) {
          points=0;
          statWins=0;
          statFails=0;
          statClicks=0;
          statHighscore=0;
          autoSave();
          F10wait=true;
        }
      }
    }
  }
}

//===========================================================================================
//
//                          You've reached the end of this tab.
//
//===========================================================================================
