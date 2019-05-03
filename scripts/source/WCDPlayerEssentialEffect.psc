Scriptname WCDPlayerEssentialEffect extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akCaster.StartDeferredKill()
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	bool xessential = akCaster.IsEssential()
	ActorBase PlayerBase = akCaster.GetActorBase()
	
	PlayerBase.SetEssential(true)
	Utility.Wait(0.1)
	akCaster.EndDeferredKill()
	Utility.Wait(0.1)
	akCaster.DamageActorValue("health", 9001)
	Utility.Wait(0.1)
	akCaster.RestoreActorValue("health", 10000)

	if (!xessential)
		PlayerBase.SetEssential(false)
	endif
EndEvent