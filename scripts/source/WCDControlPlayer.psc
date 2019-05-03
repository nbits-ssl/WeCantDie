Scriptname WCDControlPlayer extends ReferenceAlias  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	WeCantDieControl xscript = (self.GetOwningQuest() as WeCantDieControl)
	if (akNewLoc == None)
		xscript.RespawnPoint.MoveTo(self.GetRef())
	endif
EndEvent