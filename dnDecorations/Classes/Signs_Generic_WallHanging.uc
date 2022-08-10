/*******************************************************************************
 * Signs_Generic_WallHanging generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Signs_Generic_WallHanging extends Signs_Generic
	collapsecategories;

var() noexport int MaxSwingAngle "Maximum angle for the angular joint limit.";
var() noexport Vector HingeOffset "Offset from center of object where the hinge will be placed.  If zero, code will attempt to approximate a reasonable position.";
var() noexport bool bShouldSwing "If true, sign will be PHYS_Meqon and swing on a hinge.  If false, sign will be PHYS_None.";
var KAngularJointLimit Limit;
var KHinge Hinge;

simulated event PostBeginPlay()
{
	local Box CollisionBox;
	local Vector Center, HingeLoc;
	local int R;

	super(dnDecoration).PostBeginPlay();
	// End:0x68
	if(__NFUN_145__(bShouldSwing))
	{
		// End:0x39
		if(__NFUN_340__(Hinge, none))
		{
			Hinge.__NFUN_642__(0);
			Hinge.__NFUN_614__();
		}
		// End:0x61
		if(__NFUN_340__(Limit, none))
		{
			Limit.__NFUN_642__(0);
			Limit.__NFUN_614__();
		}
		__NFUN_642__(0);
		return;
	}
	// End:0xB3
	if(__NFUN_150__(__NFUN_339__(Hinge, none), __NFUN_339__(Limit, none)))
	{
		Warn("couldn't find hinge or limit constraint");
		return;
	}
	// End:0x2B7
	if(__NFUN_242__(HingeOffset, __NFUN_232__(0, 0, 0)))
	{
		CollisionBox = __NFUN_626__(true);
		// End:0x125
		if(__NFUN_173__(int(CollisionBox.IsValid), 0))
		{
			Warn("couldn't generate collision bounds from primitive");			
		}
		else
		{
			R = __NFUN_175__(Rotation.Roll, 65535);
			// End:0x217
			if(__NFUN_150__(__NFUN_150__(__NFUN_169__(R, 8192), __NFUN_148__(__NFUN_170__(R, 24576), __NFUN_169__(R, 40960))), __NFUN_170__(R, 57344)))
			{
				HingeOffset.X = CollisionBox.Min.X;
				HingeOffset.Y = __NFUN_198__(CollisionBox.Min.Y, __NFUN_195__(0.5, __NFUN_199__(CollisionBox.Max.Y, CollisionBox.Min.Y)));
				HingeOffset.Z = __NFUN_198__(CollisionBox.Min.Z, __NFUN_195__(0.833, __NFUN_199__(CollisionBox.Max.Z, CollisionBox.Min.Z)));				
			}
			else
			{
				HingeOffset.X = CollisionBox.Min.X;
				HingeOffset.Z = __NFUN_198__(CollisionBox.Min.Y, __NFUN_195__(0.833, __NFUN_199__(CollisionBox.Max.Y, CollisionBox.Min.Y)));
				HingeOffset.Y = __NFUN_198__(CollisionBox.Min.Z, __NFUN_195__(0.5, __NFUN_199__(CollisionBox.Max.Z, CollisionBox.Min.Z)));
			}
		}
	}
	HingeLoc = __NFUN_238__(Location, __NFUN_241__(HingeOffset, __NFUN_265__(0, Rotation.Yaw, 0)));
	Hinge.__NFUN_642__(0);
	Limit.__NFUN_642__(0);
	Hinge.__NFUN_645__(HingeLoc);
	Limit.__NFUN_645__(HingeLoc);
	Hinge.__NFUN_642__(18);
	Limit.__NFUN_642__(18);
	return;
}

function KarmaSetConstraintProperties(KConstraint ConstraintActor)
{
	local KAngularJointLimit LocalLimit;
	local KHinge LocalHinge;

	LocalLimit = KAngularJointLimit(ConstraintActor);
	LocalHinge = KHinge(ConstraintActor);
	// End:0x4C
	if(__NFUN_340__(LocalLimit, none))
	{
		Limit = LocalLimit;
		Limit.__NFUN_1106__(MaxSwingAngle);		
	}
	else
	{
		// End:0x63
		if(__NFUN_340__(LocalHinge, none))
		{
			Hinge = LocalHinge;
		}
	}
	return;
}

defaultproperties
{
	MaxSwingAngle=8192
	bShouldSwing=true
}