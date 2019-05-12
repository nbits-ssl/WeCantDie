Scriptname WeCantDieConfig extends SKI_ConfigBase  

bool Property modEnabled = true Auto

int modEnabledID

int Function GetVersion()
	return 20190501
EndFunction 

Event OnVersionUpdate(int a_version)
	if (CurrentVersion == 0) ; new game
		;
	elseif (a_version != CurrentVersion)
		OnConfigInit()
		; MainQuest.Reboot()
	endif
EndEvent

Event OnConfigInit()
	Pages = new string[1]
	Pages[0] = "Config"
EndEvent

Event OnPageReset(string page)
	if (page == "" || page == "Config")
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		
		modEnabledID = AddToggleOption("Install/Uninstall", modEnabled)
	endif
EndEvent

Event OnOptionSelect(int option)
	if (option == modEnabledID)
		modEnabled = !modEnabled
		SetToggleOptionValue(option, modEnabled)
		ShowMessage("Close MCM menu and look notification.", false)
		Utility.Wait(0.1)
		
		if (modEnabled)
			WCDControlScript.Reboot()
			debug.notification("We Can't Die enabled")
		else
			WCDControlScript.Stop()
			debug.notification("We Can't Die disabled")
		endif
	endif
EndEvent

Event OnOptionHighlight(int option)
EndEvent

WeCantDieControl Property WCDControlScript Auto
