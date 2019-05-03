Scriptname WCDResurrectEffect extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if (Game.GetModByName("SSLYACR.esp") < 255)
		Quest SSLYACR = Game.GetFormFromFile(0x00000D62, "SSLYACR.esp") as Quest
		ReferenceAlias YACRPlayerAlias = (SSLYACR as YACRUtil).PlayerAlias
		YACRPlayer ypScript = (YACRPlayerAlias as YACRPlayer)
		if (ypScript.ValidateDeathSex())
			ypScript.deathBleedOut()
		endif
	else
		WCDMainScript.ExecuteDeath(akCaster)
	endif
EndEvent

WeCantDieMain Property WCDMainScript Auto
