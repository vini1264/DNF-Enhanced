/*******************************************************************************
 * dnRocket_RPG_HeatSeek_AI generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnRocket_RPG_HeatSeek_AI extends dnRocket_RPG_HeatSeek
	collapsecategories;

simulated function InitializeMotion()
{
	super.InitializeMotion();
	FlyInRandomDir();
	return;
}

event Tick(float DeltaTime)
{
	super.Tick(DeltaTime);
	// End:0x22
	if(__NFUN_145__(bEngaged))
	{
		FollowTarget(none, DeltaTime);
	}
	return;
}

defaultproperties
{
	EngageDelay=0.6
	SeekTimeLimit=1.6
	Damage=5
}