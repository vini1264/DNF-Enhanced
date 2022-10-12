class IceExtras extends UWindowScene;

var UDukeMenuButton ConceptArtButton;
var UDukeMenuButton ScreenshotButton;
var UDukeMenuButton MovieButton;
var UDukeMenuButton TriptychButton;
var UDukeMenuButton TimelineButton;
var UDukeMenuButton SoundBoardButton;

function Created()
{
	super(UWindowScene).Created();
	ConceptArtButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton',,,,, self));
	ConceptArtButton.SetText("Concept Arts");
	ConceptArtButton.Register(self);

	ScreenshotButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton',,,,, self));
	ScreenshotButton.SetText("Screenshots");
	ScreenshotButton.Register(self);

	MovieButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton',,,,, self));
	MovieButton.SetText("Movies");
	MovieButton.Register(self);
	
	TriptychButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton',,,,, self));
	TriptychButton.SetText("Triptych Office Photos");
	TriptychButton.Register(self);

	TimelineButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton',,,,, self));
	TimelineButton.SetText("Development Timeline");
	TimelineButton.Register(self);

	SoundBoardButton = UDukeMenuButton(CreateWindow(class'UDukeMenuButton',,,,, self));
	SoundBoardButton.SetText("Duke Sound Board");
	SoundBoardButton.Register(self);

	FirstControlToFocus = ConceptArtButton;
	ConceptArtButton.NavUp = SoundBoardButton;
    ScreenshotButton.NavUp = ConceptArtButton;
	MovieButton.NavUp = ScreenshotButton;
	TriptychButton.NavUp = MovieButton;
    TimelineButton.NavUp = TriptychButton;
    SoundBoardButton.NavUp = TimelineButton;
    ConceptArtButton.NavDown = ScreenshotButton;
    ScreenshotButton.NavDown = MovieButton;
	MovieButton.NavDown = TriptychButton;
	TriptychButton.NavDown = TimelineButton;
    TimelineButton.NavDown = SoundBoardButton;
	SoundBoardButton.NavDown = ConceptArtButton;
}

function Paint(Canvas C, float X, float Y)
{
	ConceptArtButton.Alpha = FadeAlpha;
	ConceptArtButton.WinWidth = float(ButtonWidth);
	ConceptArtButton.WinHeight = float(ButtonHeight);
	ConceptArtButton.WinLeft = float(ButtonLeft);
	ConceptArtButton.WinTop = float(ControlStart);

	ScreenshotButton.Alpha = FadeAlpha;
	ScreenshotButton.WinWidth = float(ButtonWidth);
	ScreenshotButton.WinHeight = float(ButtonHeight);
	ScreenshotButton.WinLeft = float(ButtonLeft);
	ScreenshotButton.WinTop = ConceptArtButton.WinTop + ConceptArtButton.WinHeight;

	MovieButton.Alpha = FadeAlpha;
	MovieButton.WinWidth = float(ButtonWidth);
	MovieButton.WinHeight = float(ButtonHeight);
	MovieButton.WinLeft = float(ButtonLeft);
	MovieButton.WinTop = ScreenshotButton.WinTop + ScreenshotButton.WinHeight;
	
	TriptychButton.Alpha = FadeAlpha;
	TriptychButton.WinWidth = float(ButtonWidth);
	TriptychButton.WinHeight = float(ButtonHeight);
	TriptychButton.WinLeft = float(ButtonLeft);
	TriptychButton.WinTop = MovieButton.WinTop + MovieButton.WinHeight;
	
	TimelineButton.Alpha = FadeAlpha;
	TimelineButton.WinWidth = float(ButtonWidth);
	TimelineButton.WinHeight = float(ButtonHeight);
	TimelineButton.WinLeft = float(ButtonLeft);
	TimelineButton.WinTop = TriptychButton.WinTop + TriptychButton.WinHeight;
	
	SoundBoardButton.Alpha = FadeAlpha;
	SoundBoardButton.WinWidth = float(ButtonWidth);
	SoundBoardButton.WinHeight = float(ButtonHeight);
	SoundBoardButton.WinLeft = float(ButtonLeft);
	SoundBoardButton.WinTop = TimelineButton.WinTop + TimelineButton.WinHeight;
	
	super(UWindowScene).Paint(C, X, Y);
}

function NotifyFromControl(UWindowDialogControl C, byte E)
{	
	if(C == ConceptArtButton && E == 2)
	{
		NavigateForward(class'UDukeSceneConceptArt');
		return;
	}
	
	if(C == ScreenshotButton && E == 2)
	{
		NavigateForward(class'UDukeSceneScreenShots');
		return;
	}
	
	if(C == MovieButton && E == 2)
	{
		NavigateForward(class'UDukeSceneExtrasMovies');
		return;
	}
	
	if(C == TriptychButton && E == 2)
	{
		NavigateForward(class'UDukeSceneOfficePhotos');
		return;
	}
	
	if(C == TimelineButton && E == 2)
	{
		NavigateForward(class'UDukeSceneTimeline');
		return;
	}
	
	if(C == SoundBoardButton && E == 2)
	{
		NavigateForward(class'UDukeSceneSoundBoard');
		return;
	}
}	

defaultproperties
{
	TitleText="<?int?dnModIce.IceExtras.TitleText?>"
}