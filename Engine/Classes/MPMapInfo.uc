/*******************************************************************************
 * MPMapInfo generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MPMapInfo extends Info
	native
	config(Maps)
	collapsecategories
	notplaceable
	hidecategories(movement,Collision,Lighting,LightColor,movement,Collision,Lighting,LightColor);

var config array<PlayListEntry> Playlist;
var config array<AvailableMaps> MapList;
var config array<AvailableGameTypes> GameTypes;
var config array<AvailableMutators> MutatorTypes;

event GetMapsForGameType(string GameType, out array<AvailableMaps> mapnames)
{
	local int i, j;
	local string GTPackageName, GTGroupName, GTDLCPackage, PackageName, GroupName, DLCPackage;

	__NFUN_396__(GameType, GTPackageName, GTGroupName, GTDLCPackage);
	mapnames.Empty();
	i = 0;
	J0x24:

	// End:0xCA [Loop If]
	if(__NFUN_169__(i, string(MapList)))
	{
		j = 0;
		J0x3B:

		// End:0xC0 [Loop If]
		if(__NFUN_169__(j, string(MapList[i].SupportedGameTypes)))
		{
			__NFUN_396__(MapList[i].SupportedGameTypes[j], PackageName, GroupName, DLCPackage);
			// End:0xB6
			if(__NFUN_308__(GTGroupName, GroupName))
			{
				mapnames.Insert(string(mapnames), 1);
				mapnames[__NFUN_166__(string(mapnames), 1)] = MapList[i];
			}
			__NFUN_182__(j);
			// [Loop Continue]
			goto J0x3B;
		}
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x24;
	}
	return;
}

event bool GetOptionsForGameType(string GameType, out AvailableGameTypes out_AvailableGameTypes)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x4F [Loop If]
	if(__NFUN_169__(i, string(GameTypes)))
	{
		// End:0x45
		if(__NFUN_308__(GameTypes[i].EntryName, GameType))
		{
			out_AvailableGameTypes = GameTypes[i];
			return true;
		}
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x07;
	}
	return false;
	return;
}

event GetMapPackageSwap(string GameType, string inMapName, out string SwappedPackage)
{
	local string GTPackageName, GTGroupName, GTDLCPackage, PackageName, GroupName, DLCPackage;

	local int i, j;

	__NFUN_396__(GameType, GTPackageName, GTGroupName, GTDLCPackage);
	i = 0;
	J0x1E:

	// End:0xD5 [Loop If]
	if(__NFUN_169__(i, string(MapList)))
	{
		// End:0xCB
		if(__NFUN_308__(MapList[i].MapName, inMapName))
		{
			j = 0;
			J0x50:

			// End:0xCB [Loop If]
			if(__NFUN_169__(j, string(MapList[i].SupportedGameTypes)))
			{
				__NFUN_396__(MapList[i].SupportedGameTypes[j], PackageName, GroupName, DLCPackage);
				// End:0xC1
				if(__NFUN_308__(GTGroupName, GroupName))
				{
					SwappedPackage = MapList[i].SupportedGameTypes[j];
					return;
				}
				__NFUN_182__(j);
				// [Loop Continue]
				goto J0x50;
			}
		}
		__NFUN_182__(i);
		// [Loop Continue]
		goto J0x1E;
	}
	SwappedPackage = GameType;
	return;
}