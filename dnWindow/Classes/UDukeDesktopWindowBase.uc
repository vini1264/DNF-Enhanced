/*******************************************************************************
 * UDukeDesktopWindowBase generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeDesktopWindowBase extends UWindowListControl
	abstract;

var UWindowMessageBox ConfirmQuit;
var UWindowMessageBox ConfirmNewGame;

function MessageBoxDone(UWindowMessageBox W, UWindow.UWindowBase.MessageBoxResult Result)
{
	// End:0x7A
	if(__NFUN_173__(int(Result), int(1)))
	{
		// End:0x31
		if(__NFUN_339__(W, ConfirmQuit))
		{
			Root.QuitGame();			
		}
		else
		{
			// End:0x7A
			if(__NFUN_339__(W, ConfirmNewGame))
			{
				Close();
				GetPlayerOwner().__NFUN_782__(2, 0);
				GetPlayerOwner().ClientTravel("map00?noauto", 0, false);
			}
		}
	}
	return;
}

function Close(optional bool bByParent)
{
	Root.Console.CloseUWindow();
	return;
}