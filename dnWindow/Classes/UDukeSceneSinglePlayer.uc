/*******************************************************************************
 * UDukeSceneSinglePlayer generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeSceneSinglePlayer extends UWindowScene;

var UDukeMenuButton NewGameButton;
var localized string NewGameText;
var localized string NewGameHelp;
var localized string DemoTitleText;
var localized string NewDemoText;
var localized string NewDemoHelp;
var bool bContinueGameVisible;
var UDukeMenuButton ContinueGameButton;
var localized string ContinueGameText;
var localized string ContinueGameHelp;
var localized string ContinueDemoText;
var localized string ContinueDemoHelp;
var bool bChapterSelectVisible;
var UDukeMenuButton ChapterSelectButton;
var localized string ChapterSelectText;
var localized string ChapterSelectHelp;
var UDukeMessageBox ConfirmNewGame;
var localized string ConfirmNewGameTitle;
var localized string ConfirmNewGameText;
var int TravelFade;
var int bSaveGameMapFound;
var int SaveDataStatus;

function Created()
{
	super.Created();
	NewGameButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton'));
	NewGameButton.SetText(NewGameText);
	NewGameButton.SetHelpText(NewGameHelp);
	ContinueGameButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton'));
	ContinueGameButton.SetText(ContinueGameText);
	ContinueGameButton.SetHelpText(ContinueGameHelp);
	ChapterSelectButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton'));
	ChapterSelectButton.SetText(ChapterSelectText);
	ChapterSelectButton.SetHelpText(ChapterSelectHelp);
	ConfirmNewGame = UDukeMessageBox(CreateWindow(class'UDukeMessageBox',,,,, self));
	ConfirmNewGame.SetupMessageBox(ConfirmNewGameTitle, ConfirmNewGameText, class'DukeDialogBoxManager'.default.YesStr, class'DukeDialogBoxManager'.default.NoStr);
	ConfirmNewGame.HideWindow();
	NewGameButton.NavUp = ChapterSelectButton;
	ContinueGameButton.NavUp = NewGameButton;
	ChapterSelectButton.NavUp = ContinueGameButton;
	NewGameButton.NavDown = ContinueGameButton;
	ContinueGameButton.NavDown = ChapterSelectButton;
	ChapterSelectButton.NavDown = NewGameButton;
	NewGameButton.Register(self);
	ContinueGameButton.Register(self);
	ChapterSelectButton.Register(self);
	FirstControlToFocus = NewGameButton;
	UDukeRootWindow(Root).__NotifyScreenInviteAcepted__Delegate = NotifyScreenInviteAcepted;
	return;
}

function bool ShouldShowContinueGame()
{
	// End:0x1F
	if(__NFUN_145__(GetPlayerOwner().__NFUN_787__(bSaveGameMapFound, SaveDataStatus)))
	{
		return false;
	}
	// End:0x41
	if(__NFUN_174__(__NFUN_315__(GetPlayerOwner().__NFUN_789__(), "DLC"), -1))
	{
		return false;
	}
	return true;
	return;
}

function UpdateProgressFlags()
{
	local int OutValue;

	bFadeAll = false;
	TravelFade = 0;
	FadeAlpha = 1;
	FadeAlphaTarget = 1;
	bContinueGameVisible = ShouldShowContinueGame();
	__NFUN_378__("ChapterSelect", "Available", OutValue, "progress.ini");
	bChapterSelectVisible = __NFUN_174__(OutValue, 0);
	__NFUN_355__(__NFUN_303__("OnNavForward:bContineGameVisible:", string(bContinueGameVisible)));
	__NFUN_355__(__NFUN_303__("OnNavForward:bChapterSelectVisible:", string(bChapterSelectVisible)));
	return;
}

function OnNavForward()
{
	super.OnNavForward();
	UpdateProgressFlags();
	// End:0x2D
	if(__NFUN_148__(__NFUN_145__(bContinueGameVisible), __NFUN_145__(bChapterSelectVisible)))
	{
		NewGamePushed();		
	}
	else
	{
		// End:0x41
		if(bContinueGameVisible)
		{
			ChildInFocus = ContinueGameButton;
		}
	}
	return;
}

function OnNavReturn()
{
	super.OnNavReturn();
	UpdateProgressFlags();
	// End:0x2A
	if(__NFUN_148__(__NFUN_145__(bContinueGameVisible), __NFUN_145__(bChapterSelectVisible)))
	{
		NavigateBack();
	}
	return;
}

function NavigateBack()
{
	// End:0x0D
	if(__NFUN_170__(TravelFade, 0))
	{
		return;
	}
	super.NavigateBack();
	return;
}

function DukeSuperMessageBoxDone(int Result, Engine.Object.EConsole_Dialog id)
{
	// End:0x81
	if(__NFUN_402__())
	{
		// End:0x81
		if(__NFUN_173__(int(id), int(13)))
		{
			// End:0x28
			if(__NFUN_173__(Result, 1))
			{
				NewGamePushed();				
			}
			else
			{
				Root.Console.PS3MsgDialog(__NFUN_356__("DukeDialogBoxManager", "CorruptSaveNoOverwriteText", "dnwindow"));
			}
		}
	}
	return;
}

function Paint(Canvas C, float X, float Y)
{
	C.Style = 1;
	C.__NFUN_1250__(0, 0);
	C.__NFUN_1234__(class'BlackTexture', float(C.SizeX), float(C.SizeY), 0, 0, 1, 1,,,, false, 1);
	// End:0x8F
	if(bContinueGameVisible)
	{
		ShowChildWindow(ContinueGameButton);		
	}
	else
	{
		HideChildWindow(ContinueGameButton);
	}
	// End:0xB1
	if(bChapterSelectVisible)
	{
		ShowChildWindow(ChapterSelectButton);		
	}
	else
	{
		HideChildWindow(ChapterSelectButton);
	}
	super.Paint(C, X, Y);
	NewGameButton.Alpha = FadeAlpha;
	ContinueGameButton.Alpha = FadeAlpha;
	ChapterSelectButton.Alpha = FadeAlpha;
	NewGameButton.WinWidth = float(ButtonWidth);
	NewGameButton.WinHeight = float(ButtonHeight);
	ContinueGameButton.WinWidth = float(ButtonWidth);
	ContinueGameButton.WinHeight = float(ButtonHeight);
	ChapterSelectButton.WinWidth = float(ButtonWidth);
	ChapterSelectButton.WinHeight = float(ButtonHeight);
	NewGameButton.WinLeft = float(ButtonLeft);
	NewGameButton.WinTop = float(ControlStart);
	ContinueGameButton.WinLeft = float(ButtonLeft);
	ContinueGameButton.WinTop = __NFUN_198__(__NFUN_198__(NewGameButton.WinTop, NewGameButton.WinHeight), float(ControlBuffer));
	ChapterSelectButton.WinLeft = float(ButtonLeft);
	// End:0x268
	if(bContinueGameVisible)
	{
		ChapterSelectButton.WinTop = __NFUN_198__(__NFUN_198__(ContinueGameButton.WinTop, ContinueGameButton.WinHeight), float(ControlBuffer));		
	}
	else
	{
		ChapterSelectButton.WinTop = __NFUN_198__(__NFUN_198__(NewGameButton.WinTop, NewGameButton.WinHeight), float(ControlBuffer));
	}
	return;
}

function NewGamePushed()
{
	local UDukeSceneSinglePlayerDifficulty NewScene;

	NavigateForward(class'UDukeSceneSinglePlayerDifficulty');
	NewScene = UDukeSceneSinglePlayerDifficulty(UDukeRootWindow(Root).Scenes[__NFUN_166__(string(UDukeRootWindow(Root).Scenes), 1)]);
	NewScene.TitleText = NewGameText;
	NewScene.TravelURL = "map00?NewGame?Game=dnGame.dnSinglePlayer";
	NewScene.bResetEgo = true;
	return;
}

function ContinueGamePushed()
{
	bFadeAll = true;
	FadeAlphaTarget = 0.01;
	TravelFade = 1;
	Root.CaptureMouse(ContinueGameButton);
	Root.Console.bDontDrawMouse = true;
	GetPlayerOwner().PlaySoundInfo(0, SoundNavigateForwardInfo);
	// End:0x78
	if(__NFUN_401__())
	{
		GetPlayerOwner().__NFUN_979__(true);
	}
	return;
}

function ChapterSelectPushed()
{
	NavigateForward(class'UDukeSceneChapterSelect');
	return;
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	// End:0x0D
	if(__NFUN_170__(TravelFade, 0))
	{
		return;
	}
	super.NotifyFromControl(C, E);
	// End:0x128
	if(__NFUN_173__(int(E), 2))
	{
		// End:0x69
		if(__NFUN_339__(C, NewGameButton))
		{
			// End:0x60
			if(UDukeRootWindow(Root).bSaveExists)
			{
				ShowModal(ConfirmNewGame);				
			}
			else
			{
				NewGamePushed();
			}			
		}
		else
		{
			// End:0x112
			if(__NFUN_339__(C, ContinueGameButton))
			{
				// End:0x10F
				if(bContinueGameVisible)
				{
					// End:0xD6
					if(__NFUN_173__(SaveDataStatus, int(0)))
					{
						// End:0xA3
						if(__NFUN_173__(bSaveGameMapFound, 1))
						{
							ContinueGamePushed();							
						}
						else
						{
							DukeConsole(UDukeRootWindow(Root).Console).DialogMgr.ShowDialogBox(68);
						}						
					}
					else
					{
						// End:0x10F
						if(__NFUN_173__(SaveDataStatus, int(3)))
						{
							DukeConsole(Root.Console).DialogMgr.ShowDialogBox(13, self);
						}
					}
				}				
			}
			else
			{
				// End:0x128
				if(__NFUN_339__(C, ChapterSelectButton))
				{
					ChapterSelectPushed();
				}
			}
		}
	}
	return;
}

function DukeMessageBoxDone(UWindowWindow W, int iResult)
{
	super(UWindowWindow).DukeMessageBoxDone(W, iResult);
	// End:0x31
	if(__NFUN_170__(iResult, 0))
	{
		// End:0x31
		if(__NFUN_339__(W, ConfirmNewGame))
		{
			NewGamePushed();
		}
	}
	return;
}

function Tick(float Delta)
{
	local int Difficulty;

	super.Tick(Delta);
	// End:0xC3
	if(__NFUN_148__(__NFUN_173__(TravelFade, 1), __NFUN_204__(FadeAlpha, 0.01)))
	{
		TravelFade = 2;
		Root.CancelCapture();
		Root.Console.bDontDrawMouse = false;
		Root.Console.CloseUWindow();
		__NFUN_375__("Difficulty", "CurrentDifficulty", Difficulty, "Progress.ini");
		GetPlayerOwner().LoadGame(2, 0, Difficulty);
	}
	// End:0x113
	if(__NFUN_148__(__NFUN_148__(__NFUN_401__(), UDukeRootWindow(Root).bSaveExists), GetPlayerOwner().__NFUN_972__()))
	{
		UDukeRootWindow(Root).bSaveExists = false;
		UpdateProgressFlags();
	}
	return;
}

function bool PropagateKey(UWindow.UWindowWindow.WinMessage msg, Canvas C, float X, float Y, int Key)
{
	// End:0x0D
	if(__NFUN_170__(TravelFade, 0))
	{
		return false;
	}
	return super(UWindowWindow).PropagateKey(msg, C, X, Y, Key);
	return;
}

function NotifyScreenInviteAcepted()
{
	ConfirmNewGame.HideWindow();
	DukeMessageBoxDone(ConfirmNewGame, -1);
	return;
}

defaultproperties
{
	NewGameText="<?int?dnWindow.UDukeSceneSinglePlayer.NewGameText?>"
	NewGameHelp="<?int?dnWindow.UDukeSceneSinglePlayer.NewGameHelp?>"
	DemoTitleText="<?int?dnWindow.UDukeSceneSinglePlayer.DemoTitleText?>"
	NewDemoText="<?int?dnWindow.UDukeSceneSinglePlayer.NewDemoText?>"
	NewDemoHelp="<?int?dnWindow.UDukeSceneSinglePlayer.NewDemoHelp?>"
	ContinueGameText="<?int?dnWindow.UDukeSceneSinglePlayer.ContinueGameText?>"
	ContinueGameHelp="<?int?dnWindow.UDukeSceneSinglePlayer.ContinueGameHelp?>"
	ContinueDemoText="<?int?dnWindow.UDukeSceneSinglePlayer.ContinueDemoText?>"
	ContinueDemoHelp="<?int?dnWindow.UDukeSceneSinglePlayer.ContinueDemoHelp?>"
	ChapterSelectText="<?int?dnWindow.UDukeSceneSinglePlayer.ChapterSelectText?>"
	ChapterSelectHelp="<?int?dnWindow.UDukeSceneSinglePlayer.ChapterSelectHelp?>"
	ConfirmNewGameTitle="<?int?dnWindow.UDukeSceneSinglePlayer.ConfirmNewGameTitle?>"
	ConfirmNewGameText="<?int?dnWindow.UDukeSceneSinglePlayer.ConfirmNewGameText?>"
	TitleText="<?int?dnWindow.UDukeSceneSinglePlayer.TitleText?>"
}