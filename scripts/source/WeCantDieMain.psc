Scriptname WeCantDieMain extends Quest  

Event OnInit()
	RegisterForModEvent("WeCantDieDeath", "OnWeCantDieDeath")
EndEvent

Event OnWeCantDieDeath(string eventName, string strArg, float numArg, Form sender)
	self.ExecuteDeath(Game.GetPlayer())
EndEvent

Function ExecuteDeath(Actor act)
	act.StopCombat()
	act.StopCombatAlarm()
	WCDPacifySpell.Cast(act, act)
	
	Game.DisablePlayerControls(false, false, false, false, false, true, true, true, 0)
	act.SetActorValue("Paralysis", 1)
	act.PushActorAway(act, 0)
	FadeToBlackImod.Apply()
	Utility.Wait(2)
	FadeToBlackImod.PopTo(FadeToBlackHoldImod)
	
	CombatMusic.Remove()
	act.DispelAllSpells()
	self.RemoveItems()
	act.MoveTo(RespawnPoint)
	
	act.SetActorValue("Paralysis", 0)
	act.ResetHealthAndLimbs() ; cause runtime error?
	if (act.IsWeaponDrawn())
		act.SheatheWeapon()
	endif
	
	Utility.Wait(2)
	FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
	FadeToBlackHoldImod.Remove()
	Utility.Wait(3)
	FadeToBlackBackImod.Remove()
	Game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
EndFunction

Function RemoveItems()
	if (WCDFollowers.IsRunning())
		WCDFollowers.Stop()
	endif
	WCDFollowers.Start()
	
	Actor player = Game.GetPlayer()
	player.RemoveAllItems()
	Utility.Wait(0.1)
	
	Actor act
	int len = WCDFollowerList.Length
	while (len > 0)
		len -= 1
		act = WCDFollowerList[len].GetActorRef()
		if (act)
			act.RemoveAllItems()
			Utility.Wait(0.1)
		endif
	endwhile
	
	WCDFollowers.Stop()
EndFunction

ImageSpaceModifier Property FadeToBlackImod Auto
ImageSpaceModifier Property FadeToBlackBackImod Auto
ImageSpaceModifier Property FadeToBlackHoldImod Auto

ObjectReference Property RespawnPoint  Auto  

Quest Property WCDFollowers  Auto  
ReferenceAlias[] Property WCDFollowerList  Auto  
Spell Property WCDPacifySpell Auto
MusicType Property CombatMusic Auto
