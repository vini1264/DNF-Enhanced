class IceDifficulty extends UDukeSceneSinglePlayerDifficulty;

function Paint(Canvas C, float X, float Y)
{
	Diff1Button.Alpha = FadeAlpha;
	Diff1Button.WinWidth = float(ButtonWidth);
	Diff1Button.WinHeight = float(ButtonHeight);
	Diff1Button.WinLeft = float(ButtonLeft);
	Diff1Button.WinTop = float(ControlStart);

	Diff2Button.Alpha = FadeAlpha;
	Diff2Button.WinWidth = float(ButtonWidth);
	Diff2Button.WinHeight = float(ButtonHeight);
	Diff2Button.WinLeft = float(ButtonLeft);
	Diff2Button.WinTop = Diff1Button.WinTop + Diff1Button.WinHeight;

	Diff3Button.Alpha = FadeAlpha;
	Diff3Button.WinWidth = float(ButtonWidth);
	Diff3Button.WinHeight = float(ButtonHeight);
	Diff3Button.WinLeft = float(ButtonLeft);
	Diff3Button.WinTop = Diff2Button.WinTop + Diff2Button.WinHeight;

	Diff4Button.Alpha = FadeAlpha;
	Diff4Button.WinWidth = float(ButtonWidth);
	Diff4Button.WinHeight = float(ButtonHeight);
	Diff4Button.WinLeft = float(ButtonLeft);
	Diff4Button.WinTop = Diff3Button.WinTop + Diff3Button.WinHeight;
	super(UWindowScene).Paint(C, X, Y);
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	if(C == Diff1Button && E == 2)
	{
		GetPlayerOwner().ClientTravel("map00_ice?NewGame?Game=dnModIce.IceGame?Difficulty=0", TRAVEL_Relative, false);
		Difficulty = 0;
		bResetEgo = true;
		return;
	}
	if(C == Diff2Button && E == 2)
	{
		GetPlayerOwner().ClientTravel("map00_ice?NewGame?Game=dnModIce.IceGame?Difficulty=1", TRAVEL_Relative, false);
		Difficulty = 1;
		bResetEgo = true;
		return;
	}
	if(C == Diff3Button && E == 2)
	{
		GetPlayerOwner().ClientTravel("map00_ice?NewGame?Game=dnModIce.IceGame?Difficulty=2", TRAVEL_Relative, false);
		Difficulty = 2;
		bResetEgo = true;
		return;
	}
	if(C == Diff4Button && E == 2)
	{
		GetPlayerOwner().ClientTravel("map00_ice?NewGame?Game=dnModIce.IceGame?Difficulty=3", TRAVEL_Relative, false);
		Difficulty = 3;
		bResetEgo = true;
		return;
	}
}