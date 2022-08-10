/*******************************************************************************
 * UDukeScenePressStart generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeScenePressStart extends UWindowScene;

var localized string PressStartText;
var localized string PressStartTextPC;
var localized string ESRBText;
var localized string CopyrightText;
var float PressStartY;
var float ESRBY;
var float CopyrightY;
var float GlowColor;
var bool bGlowRising;
var float GlowRate;
var bool bSignInShown;
var bool bWaitForSignIn;
var bool bDontTick;
var bool bReturned;
var UDukeMessageBox UserChangedMB;
var localized string UserChangedMBTitle;
var localized string UserChangedMBText;
var int iInputDelay;

function Created()
{
	super.Created();
	KeyButtons[0].HideWindow();
	KeyButtons[1].HideWindow();
	KeyButtons[2].HideWindow();
	KeyButtons[3].HideWindow();
	UserChangedMB = UDukeMessageBox(CreateWindow(class'UDukeMessageBox',,,,, self));
	UserChangedMB.SetupMessageBox(UserChangedMBTitle, UserChangedMBText, "", class'DukeDialogBoxManager'.default.OKStr);
	UserChangedMB.HideWindow();
	bSignInShown = false;
	bWaitForSignIn = false;
	bDontTick = false;
	bReturned = false;
	// End:0xFF
	if(Root.Console.bReturnToMultiplayerMenu)
	{
		Root.Console.bReturnToMultiplayerMenu = false;
	}
	iInputDelay = 20;
	return;
}

function NavigateBack()
{
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local float XL, YL, CenterX, FontScale, PressStartTextPosX;

	super.Paint(C, X, Y);
	CenterX = __NFUN_198__(LogoLeft, __NFUN_196__(LogoWidth, float(2)));
	PressStartY = __NFUN_195__(534, WinScaleY);
	ESRBY = __NFUN_195__(594, WinScaleY);
	CopyrightY = __NFUN_195__(620, WinScaleY);
	C.DrawColor = GetPlayerOwner().NewColorBytes(byte(GlowColor), byte(GlowColor), byte(GlowColor));
	FontScale = TTFontScale;
	C.Font = C.TallFont;
	// End:0x14F
	if(GetPlayerOwner().__NFUN_994__())
	{
		TextSize(C, PressStartText, XL, YL);
		PressStartTextPosX = __NFUN_199__(CenterX, __NFUN_196__(XL, float(2)));
		// End:0x129
		if(__NFUN_200__(PressStartTextPosX, __NFUN_195__(WinWidth, 0.15)))
		{
			PressStartTextPosX = __NFUN_195__(WinWidth, 0.15);
		}
		ClipText(C, PressStartTextPosX, PressStartY, PressStartText,,,,, 2);		
	}
	else
	{
		TextSize(C, PressStartTextPC, XL, YL);
		PressStartTextPosX = __NFUN_199__(CenterX, __NFUN_196__(XL, float(2)));
		// End:0x1A8
		if(__NFUN_200__(PressStartTextPosX, __NFUN_195__(WinWidth, 0.15)))
		{
			PressStartTextPosX = __NFUN_195__(WinWidth, 0.15);
		}
		ClipText(C, PressStartTextPosX, PressStartY, PressStartTextPC,,,,, 2);
	}
	FontScale = __NFUN_195__(0.75, TTFontScale);
	C.DrawColor = GetPlayerOwner().NewColorBytes(139, 139, 139);
	TextSize(C, CopyrightText, XL, YL, FontScale, FontScale);
	ClipText(C, __NFUN_199__(CenterX, __NFUN_196__(XL, float(2))), CopyrightY, CopyrightText,, FontScale, FontScale,, 2);
	return;
}

function LMouseUp(float X, float Y)
{
	super(UWindowWindow).LMouseUp(X, Y);
	PressedStart();
	return;
}

function WindowEvent(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
	// End:0x44
	if(__NFUN_173__(int(msg), int(7)))
	{
		// End:0x44
		if(__NFUN_173__(Key, int(Root.Console.27)))
		{
			KeyDown(Key, X, Y);
		}
	}
	super.WindowEvent(msg, C, X, Y, Key);
	return;
}

function KeyDown(int Key, float X, float Y)
{
	local PlayerPawn P;

	P = Root.GetPlayerOwner();
	// End:0x6E
	if(__NFUN_145__(__NFUN_414__()))
	{
		// End:0x65
		if(P.__NFUN_994__())
		{
			switch(Key)
			{
				// End:0x46
				case int(P.210):
				// End:0x5F
				case int(P.204):
					PressedStart();
					// End:0x62
					break;
				// End:0xFFFF
				default:
					break;
			}			
		}
		else
		{
			PressedStart();
		}		
	}
	else
	{
		// End:0xE4
		if(__NFUN_402__())
		{
			// End:0xE1
			if(__NFUN_150__(__NFUN_150__(__NFUN_173__(Key, int(Root.Console.13)), __NFUN_173__(Key, int(Root.Console.210))), __NFUN_173__(Key, int(Root.Console.204))))
			{
				PressedStart();
			}			
		}
		else
		{
			// End:0x141
			if(__NFUN_401__())
			{
				// End:0x141
				if(__NFUN_150__(__NFUN_148__(__NFUN_145__(bWaitForSignIn), __NFUN_173__(Key, int(P.204))), __NFUN_173__(Key, int(P.210))))
				{
					// End:0x141
					if(GetPlayerOwner().__NFUN_995__(false))
					{
						bWaitForSignIn = true;
					}
				}
			}
		}
	}
	return;
}

function PressedStart(optional bool bSkipInputDelay)
{
	// End:0x1C
	if(__NFUN_402__())
	{
		// End:0x1C
		if(__NFUN_145__(GetPlayerOwner().__NFUN_995__(false)))
		{
			return;
		}
	}
	// End:0x36
	if(__NFUN_148__(__NFUN_145__(bSkipInputDelay), __NFUN_170__(iInputDelay, 0)))
	{
		return;
	}
	GetPlayerOwner().__NFUN_977__(false);
	GetPlayerOwner().__NFUN_997__();
	NavigateForward(class'UDukeSceneMainMenu');
	bReturned = false;
	bDontTick = true;
	return;
}

function Tick(float Delta)
{
	// End:0x0B
	if(bDontTick)
	{
		return;
	}
	// End:0x50
	if(bGlowRising)
	{
		GlowColor = __NFUN_198__(GlowColor, __NFUN_195__(GlowRate, Delta));
		// End:0x4D
		if(__NFUN_201__(GlowColor, float(255)))
		{
			bGlowRising = false;
			GlowColor = 255;
		}		
	}
	else
	{
		GlowColor = __NFUN_199__(GlowColor, __NFUN_195__(GlowRate, Delta));
		// End:0x8B
		if(__NFUN_200__(GlowColor, default.GlowColor))
		{
			bGlowRising = true;
			GlowColor = default.GlowColor;
		}
	}
	// End:0xA1
	if(__NFUN_170__(iInputDelay, 0))
	{
		__NFUN_181__(iInputDelay, 1);		
	}
	else
	{
		// End:0xFF
		if(__NFUN_145__(__NFUN_414__()))
		{
			// End:0xFC
			if(__NFUN_148__(__NFUN_339__(ModalWindow, none), GetPlayerOwner().__NFUN_995__(__NFUN_145__(bSignInShown))))
			{
				// End:0xF4
				if(__NFUN_150__(bSignInShown, GetPlayerOwner().__NFUN_970__(false)))
				{
					PressedStart(true);
				}
				bSignInShown = true;
			}			
		}
		else
		{
			// End:0x129
			if(__NFUN_401__())
			{
				// End:0x126
				if(bWaitForSignIn)
				{
					// End:0x126
					if(GetPlayerOwner().__NFUN_978__())
					{
						PressedStart(true);
					}
				}				
			}
			else
			{
				// End:0x194
				if(__NFUN_402__())
				{
					// End:0x194
					if(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_339__(ModalWindow, none), GetPlayerOwner().__NFUN_995__(false)), __NFUN_145__(bReturned)), __NFUN_173__(string(DukeConsole(Root.Console).DialogMgr.DialogStack), 0)))
					{
						PressedStart(true);
					}
				}
			}
		}
	}
	super.Tick(Delta);
	return;
}

function CheckAutoPressStart()
{
	// End:0x33
	if(__NFUN_401__())
	{
		// End:0x30
		if(GetPlayerOwner().__NFUN_978__())
		{
			// End:0x30
			if(GetPlayerOwner().__NFUN_995__(false))
			{
				PressedStart(true);
			}
		}		
	}
	else
	{
		// End:0x52
		if(__NFUN_402__())
		{
			// End:0x52
			if(GetPlayerOwner().__NFUN_995__(false))
			{
				PressedStart(true);
			}
		}
	}
	return;
}

function OnNavForward()
{
	bSignInShown = false;
	bWaitForSignIn = false;
	bDontTick = false;
	GetPlayerOwner().__NFUN_977__(true);
	// End:0x45
	if(__NFUN_401__())
	{
		UDukeRootWindow(Root).SelectBackgroundMovie();		
	}
	else
	{
		// End:0x69
		if(__NFUN_402__())
		{
			bReturned = false;
			iInputDelay = 20;
			GetPlayerOwner().__NFUN_996__();
		}
	}
	super.OnNavForward();
	return;
}

function OnNavReturn()
{
	// End:0x3D
	if(__NFUN_402__())
	{
		bSignInShown = false;
		bWaitForSignIn = false;
		bDontTick = false;
		GetPlayerOwner().__NFUN_977__(true);
		bReturned = true;
		iInputDelay = 20;
	}
	super.OnNavReturn();
	return;
}

function bool AllowAttractVideo()
{
	return true;
	return;
}

defaultproperties
{
	PressStartText="<?int?dnWindow.UDukeScenePressStart.PressStartText?>"
	PressStartTextPC="<?int?dnWindow.UDukeScenePressStart.PressStartTextPC?>"
	ESRBText="<?int?dnWindow.UDukeScenePressStart.ESRBText?>"
	CopyrightText="<?int?dnWindow.UDukeScenePressStart.CopyrightText?>"
	GlowColor=64
	GlowRate=100
	UserChangedMBTitle="<?int?dnWindow.UDukeScenePressStart.UserChangedMBTitle?>"
	UserChangedMBText="<?int?dnWindow.UDukeScenePressStart.UserChangedMBText?>"
	bNoLines=true
	SoundNavigateForwardInfo=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=/* Array type was not detected. */,Y=/* Unknown default property type! */,SlotPriority=0,VolumePrefab=0,Slots=/* Array type was not detected. */,Y=/* Unknown default property type! */,Volume=0.5,VolumeVariance=0,InnerRadius=0,InnerRadiusVariance=0,Radius=0,RadiusVariance=0,Pitch=0,PitchVariance=0,Flags=(bNoOverride=false,bMenuSound=true,bNoFilter=true,bNoOcclude=true,bNoAIHear=true,bNoScale=true,bSpoken=false,bPlayThroughListener=false,bNoDoppler=true,bDialogSound=false,bNoReverb=false,bEnableVis=false,bSkipFlangePrevention=false,bSkipSoundRadiusTest=false,bIgnoreTimeDilation=true),SoundLocationOverride=(bMakeRelativeForLocalPlayer=false,bMakeAbsoluteForActor=false,OverrideType=1,Location3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0),Velocity3D=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
}