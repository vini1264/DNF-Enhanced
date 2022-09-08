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
	DisplayModes16x9(0)="1280x720"
	DisplayModes16x9(1)="1360x768"
	DisplayModes16x9(2)="1366x768"
	DisplayModes16x9(3)="1440x810"
	DisplayModes16x9(4)="1600x900"
	DisplayModes16x9(5)="1920x1080"
	DisplayModes16x9(6)="2560x1600"
}
