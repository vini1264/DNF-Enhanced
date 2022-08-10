/*******************************************************************************
 * Vents_Generic_BreakableGrate generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Vents_Generic_BreakableGrate extends Vents_Generic
	abstract
	collapsecategories;

var bool bBroken;
var bool bPostNetInit;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		bBroken;
}

simulated function PostNetInitial()
{
	bPostNetInit = true;
	super(dnDecoration).PostNetInitial();
	return;
}

simulated function NU_Broken(bool broken)
{
	// End:0x36
	if(__NFUN_148__(__NFUN_148__(__NFUN_145__(bBroken), broken), bPostNetInit))
	{
		bBroken = true;
		__NFUN_621__(,,, false);
		Destroyed();
	}
	return;
}

simulated function Destroyed()
{
	local LaserMine MIne;
	local MP_LaserMine MPMine;
	local int i;

	bBroken = true;
	i = __NFUN_166__(string(MountedActorList), 1);
	J0x17:

	// End:0x9D [Loop If]
	if(__NFUN_172__(i, 0))
	{
		MIne = LaserMine(MountedActorList[i].MountedActor);
		MPMine = MP_LaserMine(MountedActorList[i].MountedActor);
		// End:0x77
		if(__NFUN_340__(MIne, none))
		{
			MIne.AutoDetonate();
			// [Explicit Continue]
			goto J0x93;
		}
		// End:0x93
		if(__NFUN_340__(MPMine, none))
		{
			MPMine.AutoDetonate();
		}
		J0x93:

		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x17;
	}
	__NFUN_812__(7);
	super(dnDecoration).Destroyed();
	return;
}

defaultproperties
{
	bSurviveDeath=true
	DestroyedActivities=/* Array type was not detected. */
	GetTotalWeight="u"
}