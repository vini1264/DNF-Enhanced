class IceRootWindow extends UDukeRootWindow;

function MoveMouse(float X, float Y)
{
	if(DukeConsole(Console).bShowConsole)
		return;

	super.MoveMouse(X, Y);
}

function ShowUWindowSystem(UWindowRootWindow.EUWindowMode NewWindowMode)
{
	if(DukeConsole(Console).bShowConsole)
	{
		NavigateBack();
		return;
	}

	super.ShowUWindowSystem(NewWindowMode);
}

function FixUpUWindow()
{
	super.FixUpUWindow();
}