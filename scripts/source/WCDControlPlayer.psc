Scriptname WCDControlPlayer extends ReferenceAlias  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	WeCantDieMain xscript = (WCDMain as WeCantDieMain)
	if (akNewLoc == None)
		xscript.RespawnPoint.MoveTo(self.GetRef())
	endif
EndEvent

Quest Property WCDMain  Auto  
