/*******************************************************************************
 * AutoUseWeaponPickup generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class AutoUseWeaponPickup extends WeaponPickup
	abstract
	collapsecategories
	notplaceable;

var() int NumPickups;
var int PickupsRemaining;

event PostLoadMap()
{
	super(Pickup).PostLoadMap();
	PickupsRemaining = NumPickups;
	return;
}

simulated function bool CanBeUsedBy(Pawn User)
{
	// End:0x4C
	if(__NFUN_148__(__NFUN_148__(__NFUN_340__(User, none), __NFUN_340__(User.Weapon, none)), __NFUN_339__(User.Weapon.Class, InventoryType)))
	{
		return false;
	}
	return true;
	return;
}

event FinishPickup(Pawn Other)
{
	local Weapon Weap;

	Weap = Weapon(Other.__NFUN_917__(InventoryType));
	// End:0x3E
	if(__NFUN_340__(Weap, none))
	{
		Other.ChangeToWeapon(Weap);
	}
	super(Pickup).FinishPickup(Other);
	return;
}

function HandleRespawn()
{
	// End:0x13
	if(__NFUN_171__(__NFUN_183__(PickupsRemaining), 0))
	{
		super(Pickup).HandleRespawn();
	}
	return;
}

defaultproperties
{
	bAllowTouchPickup=false
}