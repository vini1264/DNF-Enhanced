/*******************************************************************************
 * Details_Generic_Flag generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_Flag extends Details_Generic
	collapsecategories;

function CopyOwnerProperties()
{
	super(Actor).CopyOwnerProperties();
	bIgnoreBList = Owner.bIgnoreBList;
	TickSelfRecentTime = Owner.TickSelfRecentTime;
	TickZoneRecentTime = Owner.TickZoneRecentTime;
	TickNearbyRadius = Owner.TickNearbyRadius;
	bTickOnlyRecent = Owner.bTickOnlyRecent;
	bTickOnlyZoneRecent = Owner.bTickOnlyZoneRecent;
	bTickOnlyNearby = Owner.bTickOnlyNearby;
	return;
}

defaultproperties
{
	IdleActivities=/* Array type was not detected. */
	X=false
}