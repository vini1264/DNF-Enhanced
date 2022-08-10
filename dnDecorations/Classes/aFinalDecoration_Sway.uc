/*******************************************************************************
 * aFinalDecoration_Sway generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class aFinalDecoration_Sway extends aFinalDecoration
	abstract
	collapsecategories;

var float swayPct;
var float swayDir;
var Vector swayDest;
var Vector swayHome;
var Vector swayPos;
var name idleGridName;
var() noexport float swayResetSpeed "Speed at which the plant will sway back to rest at (must be negative)";
var() noexport float swayMaxSpeed "Maximum speed the plant will sway at";
var() noexport float swayTouchSpeedFactor "Magic number for speed of sway based on touch. High number means faster sway";
var() noexport float swayTouchDistFactor "Magic number for distnace of sway based on touch. High number means farther sway";
var() noexport float swayDamageSpeedFactor "Magic number for speed of sway based on damage. High number means faster sway";
var() noexport float swayDamageDistFactor "Magic number for distance of sway based on damage. High number means farther sway";

function VSetGridState(Vector V)
{
	// End:0x35
	if(__NFUN_340__(AnimationController, none))
	{
		AnimationController.SetAnimGridState(idleGridName, V.X, V.Y);
	}
	return;
}

event Tick(float DeltaTime)
{
	super(Actor).Tick(DeltaTime);
	// End:0x1C
	if(__NFUN_204__(swayDir, 0))
	{
		return;
	}
	__NFUN_209__(swayPct, __NFUN_195__(DeltaTime, swayDir));
	// End:0x66
	if(__NFUN_203__(swayPct, 1))
	{
		swayPct = 1;
		swayDir = swayResetSpeed;
		swayHome = __NFUN_232__(0, 0);
	}
	// End:0x8B
	if(__NFUN_202__(swayPct, 0))
	{
		swayPct = 0;
		swayDir = 0;
	}
	swayPos = __NFUN_258__(swayPct, swayHome, swayDest);
	VSetGridState(swayPos);
	return;
}

final function Sway(Vector Dir, float distMag, float speedMag)
{
	local Rotator invRot;
	local Vector Dirt;

	invRot.Yaw = __NFUN_161__(Rotation.Yaw);
	Dir = __NFUN_263__(Dir, invRot);
	Dirt.X = __NFUN_194__(__NFUN_227__(Dir.Y, -1, 1));
	Dirt.Y = __NFUN_194__(__NFUN_227__(Dir.X, -1, 1));
	swayPct = 0;
	swayHome = swayPos;
	swayDest = __NFUN_238__(swayPos, __NFUN_234__(Dirt, distMag));
	swayDest.X = __NFUN_227__(swayDest.X, -1, 1);
	swayDest.Y = __NFUN_227__(swayDest.Y, -1, 1);
	swayDir = __NFUN_224__(__NFUN_195__(2, speedMag), swayMaxSpeed);
	return;
}

event Touch(Actor Other)
{
	super(dnDecoration).Touch(Other);
	Sway(Other.Velocity, __NFUN_195__(swayTouchDistFactor, __NFUN_252__(Other.Velocity)), __NFUN_195__(swayTouchSpeedFactor, __NFUN_252__(Other.Velocity)));
	return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	super(dnDecoration).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	Sway(DamageDirection, __NFUN_195__(swayDamageDistFactor, ThisFrameDamage.Damage), __NFUN_195__(swayDamageSpeedFactor, ThisFrameDamage.Damage));
	return;
}

event Bump(Actor Other)
{
	super(dnDecoration).Bump(Other);
	Sway(Other.Velocity, __NFUN_195__(swayTouchDistFactor, __NFUN_252__(Other.Velocity)), __NFUN_195__(swayTouchSpeedFactor, __NFUN_252__(Other.Velocity)));
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1283__(idleGridName, AnimationControllerClass, Mesh);
	return;
}

defaultproperties
{
	swayResetSpeed=-0.15
	swayMaxSpeed=150
	swayTouchSpeedFactor=4E-05
	swayTouchDistFactor=1.75E-05
	swayDamageSpeedFactor=0.375
	swayDamageDistFactor=0.075
}