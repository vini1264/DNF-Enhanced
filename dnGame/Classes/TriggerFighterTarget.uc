/*******************************************************************************
 * TriggerFighterTarget generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerFighterTarget extends Trigger
	collapsecategories
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

var() name NewTarget;

function TriggerTarget(Actor Other)
{
	local dnFlybyPlane_Fighter fighter;

	super.TriggerTarget(Other);
	fighter = dnFlybyPlane_Fighter(Other);
	// End:0x3C
	if(__NFUN_340__(fighter, none))
	{
		fighter.AssignTarget(NewTarget);
	}
	return;
}

defaultproperties
{
	TriggerType=2
	ClassProximityType='dnFlybyPlane_Fighter'
	CollisionRadius=256
	CollisionHeight=256
}