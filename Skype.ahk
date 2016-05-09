#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

scrolllockfirstwas := 0


scrolllock::
  if !scrolllockfirstwas
  {
      setTimer, scrolllockwaited, 300
      scrolllockfirstwas := 1
  }
  else
  {
    settimer, scrolllockwaited, off
    scrolllockfirstwas := 0
	; show/hide skype
	send, !^+{f9}
  }
return

scrolllockwaited:
 
  
	
    settitlematchmode 1
	detecthiddenwindows on
	if !winactive("Skype") {
	  ; if there is an incoming call, answer it.
	  send, !^+{f7}
	  sleep 500
	  if winactive("Skype") {
	    callactive := 1
	  } else {
	    ; hang on
	    send, !^+{f8}
	    callactive := 0
	  }
	} else {
	  if (!callactive) {
	    ; answer incoming call
	    send, !^+{f7}
	    ; or call current user
	    send, !^r
		callactive := 1
	  } else {
	    ; hang on
	    send, !^+{f8}
		callactive := 0
	  }
	  
	  
	}
	
	
	
  scrolllockfirstwas := 0
  setTimer, scrolllockwaited, off
return
    
