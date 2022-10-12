class IceConsole extends DukeConsole
	transient
	config;

var bool inGameConsoleState;

function HideConsole(optional bool bNoCloseAnim)
{
	if(!inGameConsoleState)
	{
		super.HideConsole(bNoCloseAnim);
		return;
	}

	CloseUWindow();
	inGameConsoleState = false;
	bShowConsole = false;
}

event bool KeyEvent(EInputKey Key, EInputAction Action, float Delta)
{
	if(Action == 1 && Key == 192)
	{
		Log("!!Showing console!!");
		TypedStr="";
		bLocked=false;	
		inGameConsoleState=true;				
		super.ShowConsole();
		super.LaunchUWindow();	

		return true;
	}

	return super.KeyEvent(Key, Action, Delta);
}

// ZOMBIE BEGIN
exec function Summon(string ClassName)
{
    Root.GetPlayerOwner().Summon(ClassName);
}

exec function GiveItem(string ItemName, optional int Charge)
{
    DukePlayer(Root.GetPlayerOwner()).GiveItem(ItemName, Charge);
}

exec function God()
{
    Root.GetPlayerOwner().God();
}

exec function AllAmmo()
{
    DukePlayer(Root.GetPlayerOwner()).AllAmmo("");
}

exec function Ghost()
{
    Root.GetPlayerOwner().Ghost();
}

exec function Fly()
{
    Root.GetPlayerOwner().Fly();
}

exec function Walk()
{
    Root.GetPlayerOwner().Walk();
}

exec function Invisible()
{
    Root.GetPlayerOwner().Invisible();
}

exec function dnIronLung()
{
    Root.GetPlayerOwner().dnIronLung();
}

exec function DebugHUD()
{
    DukeHUD(DukePlayer(Root.GetPlayerOwner()).MyHUD).DebugHUD();
}
// ZOMBIE END 

defaultproperties
{
	bLocked=false
	inGameConsoleState=false
	RootWindow="dnModIce.IceRootWindow"
}
