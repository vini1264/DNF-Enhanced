class IceNewGame extends UDukeSceneSinglePlayer;

function Paint(Canvas C, float X, float Y)
{
	NewGameButton.Alpha = FadeAlpha;
	NewGameButton.WinWidth = float(ButtonWidth);
	NewGameButton.WinHeight = float(ButtonHeight);
	NewGameButton.WinLeft = float(ButtonLeft);
	NewGameButton.WinTop = float(ControlStart);

	ContinueGameButton.Alpha = FadeAlpha;
	ContinueGameButton.WinWidth = float(ButtonWidth);
	ContinueGameButton.WinHeight = float(ButtonHeight);
	ContinueGameButton.WinLeft = float(ButtonLeft);
	ContinueGameButton.WinTop = NewGameButton.WinTop + NewGameButton.WinHeight;

	ChapterSelectButton.Alpha = FadeAlpha;
	ChapterSelectButton.WinWidth = float(ButtonWidth);
	ChapterSelectButton.WinHeight = float(ButtonHeight);
	ChapterSelectButton.WinLeft = float(ButtonLeft);
	ChapterSelectButton.WinTop = ContinueGameButton.WinTop + ContinueGameButton.WinHeight;
	super(UWindowScene).Paint(C, X, Y);
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{	
	if(C == ChapterSelectButton && E == 2)
	{
		NavigateForward(class'IceChapterSelect');
		return;
	}
	
	super.NotifyFromControl(C, E);
}