Scriptname WeCantDieControl extends Quest  

Event OnInit()
	if !(WCDMain.IsRunning())
		WCDMain.Start()
	endif
	; self.Stop()
	; this is the initializer AND Quest Reload Manager
EndEvent

Function Reboot()
	if (WCDMain.IsRunning())
		WCDMain.Stop()
	endif
	WCDMain.Start()
EndFunction

Function Stop()
	if (WCDMain.IsRunning())
		WCDMain.Stop()
	endif
EndFunction

Quest Property WCDMain  Auto  
