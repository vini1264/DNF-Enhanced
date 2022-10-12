class IceSceneVideoOptions extends UDukeSceneVideoOptions;

function NotifyFromControl(UWindowDialogControl C, byte E)
{
	if(C == AdvancedButton && E == 2)
	{
		NavigateForward(class'IceSceneVideoAdvancedOptions');
		return;
	}

	super.NotifyFromControl(C, E);
}

defaultproperties
{
	DisplayModes16x9(0)="960x540"
	DisplayModes16x9(1)="1024x576"
	DisplayModes16x9(2)="1280x720"
	DisplayModes16x9(3)="1360x768"
	DisplayModes16x9(4)="1366x768"
	DisplayModes16x9(5)="1440x810"
	DisplayModes16x9(6)="1600x900"
	DisplayModes16x9(7)="1920x1080"
	DisplayModes16x9(8)="2560x1600"
}
