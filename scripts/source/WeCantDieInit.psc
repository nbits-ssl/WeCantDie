Scriptname WeCantDieInit extends Quest  

Event OnInit()
	if !(WCDControl.IsRunning())
		WCDControl.Start()
	endif
	self.Stop()
EndEvent

Quest Property WCDControl  Auto  
