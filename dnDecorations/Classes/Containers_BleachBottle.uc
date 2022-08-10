/*******************************************************************************
 * Containers_BleachBottle generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Containers_BleachBottle extends Containers_Generic
	collapsecategories;

var bool bBroken;
var bool bPostNetInit;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		bBroken;
}

simulated function NU_Broken(bool broken)
{
	// End:0x27
	if(__NFUN_148__(__NFUN_148__(__NFUN_145__(bBroken), broken), bPostNetInit))
	{
		Destroyed();
	}
	return;
}

simulated function PostNetInitial()
{
	bPostNetInit = true;
	super(dnDecoration).PostNetInitial();
	return;
}

simulated event Destroyed()
{
	super(dnDecoration).Destroyed();
	// End:0x63
	if(__NFUN_148__(__NFUN_145__(bBroken), __NFUN_174__(int(Level.NetMode), int(NM_Standalone))))
	{
		TickStyle = 1;
		LifeSpan = 6;
		LifeSpanVariance = 2;
		LifeSpan = __NFUN_226__(LifeSpan, LifeSpanVariance);
		bSpawnOnDestroyed = false;
	}
	bBroken = true;
	return;
}

defaultproperties
{
	bSurviveDeath=true
	DestroyedActivities=/* Array type was not detected. */
}