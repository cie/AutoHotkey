#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

pausefirstwas := 0

pause::
  if !pausefirstwas
  {
    setTimer, pausewaited, 300
    pausefirstwas := 1
  }
  else
  {
    settimer, pausewaited, off
    pausefirstwas := 0
    send, !^+{f10}
  }
return

pausewaited:
  send, !^+{f11}
  pausefirstwas := 0
  setTimer, pausewaited, off
return
    	

