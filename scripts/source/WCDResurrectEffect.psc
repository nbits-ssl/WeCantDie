Scriptname WCDResurrectEffect extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	; debug.trace("[wcd] OnEffectStart")
	if (Game.GetModByName("SSLYACR.esp") < 255)
		Quest SSLYACR = Game.GetFormFromFile(0x00000D62, "SSLYACR.esp") as Quest
		ReferenceAlias YACRPlayerAlias = (SSLYACR as YACRUtil).PlayerAlias
		YACRPlayer ypScript = (YACRPlayerAlias as YACRPlayer)
		if (ypScript.ValidateDeathSex())
			; debug.trace("[wcd] detect YACR, deathBleedOut")
			ypScript.deathBleedOut()
		else
			; debug.trace("[wcd] detect YACR, non-valid")
			WCDMainScript.ExecuteDeath(akCaster)
		endif
	else
		WCDMainScript.ExecuteDeath(akCaster)
	endif
EndEvent

WeCantDieMain Property WCDMainScript Auto
