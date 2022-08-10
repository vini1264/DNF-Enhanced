/*******************************************************************************
 * Electronics_Generic_MagneticFuse generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_MagneticFuse extends Electronics_Generic
	collapsecategories;

var() noexport bool bCanTurnOn "If true, the fuse can turned on by being damaged or pushed into position.";
var() noexport float OnTargetRequiredTime "Amount of time we have to be within a certain threshold of the target to be considered on target.";
var() noexport name OnTargetEvent "Event to trigger when the magnet gets aligned.";
var() noexport name OffTargetEvent "Event to trigger when the magnet gets unaligned.";
var bool bPowerOn;
var bool bHasTargetRotation;
var Rotator TargetRotation;
var float OnTargetTime;
var Rotator InitialRotation;
var float LastDamageTime;
var KAngularSpringDamper Spring;

event PostVerifySelf()
{
	local Actor Parent;
	local Rotator Helper;

	super(dnDecoration).PostVerifySelf();
	InitialRotation = Rotation;
	SetTargetRotation(InitialRotation);
	bHasTargetRotation = false;
	__NFUN_642__(0);
	__NFUN_652__(TargetRotation);
	FindAndPlaySound('MagneticFuse_Ambient');
	return;
}

function StartSelfOff()
{
	super(dnDecoration).StartSelfOff();
	TurnPowerOff();
	return;
}

final simulated function SetTargetRotation(Rotator NewTargetRotation)
{
	bHasTargetRotation = true;
	TargetRotation = NewTargetRotation;
	// End:0x98
	if(__NFUN_340__(Spring, none))
	{
		Spring.__NFUN_642__(0);
		Spring.__NFUN_645__(Location);
		Spring.__NFUN_652__(Rotation);
		Spring.__NFUN_1101__(true, NewTargetRotation);
		Spring.__NFUN_1099__(10000);
		Spring.__NFUN_1098__(2000000);
		Spring.__NFUN_642__(18);
	}
	__NFUN_817__();
	return;
}

final simulated function TurnPowerOn(optional bool bFlipped)
{
	// End:0x18
	if(__NFUN_150__(bPowerOn, __NFUN_145__(bCanTurnOn)))
	{
		return;
	}
	bPowerOn = true;
	// End:0x42
	if(bFlipped)
	{
		SetTargetRotation(__NFUN_269__(__NFUN_265__(32768, 0, 0), InitialRotation));		
	}
	else
	{
		SetTargetRotation(InitialRotation);
	}
	return;
}

final simulated function TurnPowerOff(optional bool bUseCurrentRotation)
{
	local Rotator Offset;

	// End:0x0D
	if(__NFUN_145__(bPowerOn))
	{
		return;
	}
	GlobalTrigger(OffTargetEvent, Instigator, self);
	FindAndPlaySound('MagneticFuse_TurnOff', 1);
	__NFUN_701__(none);
	bPowerOn = false;
	// End:0x4E
	if(bUseCurrentRotation)
	{
		SetTargetRotation(Rotation);		
	}
	else
	{
		Offset.Pitch = __NFUN_190__(16384, 2048);
		// End:0x84
		if(__NFUN_200__(__NFUN_222__(), 0.5))
		{
			Offset.Pitch = __NFUN_161__(Offset.Pitch);
		}
		SetTargetRotation(__NFUN_269__(Offset, InitialRotation));
	}
	return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	// End:0x69
	if(__NFUN_203__(Level.GameTimeSeconds, __NFUN_198__(LastDamageTime, 0.25)))
	{
		LastDamageTime = Level.GameTimeSeconds;
		// End:0x48
		if(__NFUN_174__(int(Physics), int(18)))
		{
			__NFUN_642__(18);
		}
		// End:0x5A
		if(bPowerOn)
		{
			TurnPowerOff();			
		}
		else
		{
			// End:0x69
			if(bCanTurnOn)
			{
				TurnPowerOn();
			}
		}
	}
	super(dnDecoration).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	return;
}

simulated event Tick(float DeltaTime)
{
	local Rotator RelativeRotation, BaseRot, TargetRot;
	local bool bNowOnTarget;
	local Vector RotVector, AngularVel, DesiredAngularVel;
	local float AngleOffset, PowerScale, Alpha;

	super(Actor).Tick(DeltaTime);
	// End:0x1C
	if(__NFUN_202__(DeltaTime, 0))
	{
		return;
	}
	RelativeRotation = Rotation;
	// End:0x114
	if(bHasTargetRotation)
	{
		RotVector = __NFUN_240__(__NFUN_799__(RelativeRotation, TargetRotation), RelativeRotation);
		AngleOffset = __NFUN_211__(RotVector.Y);
		// End:0x103
		if(__NFUN_202__(AngleOffset, 0.1))
		{
			__NFUN_209__(OnTargetTime, DeltaTime);
			// End:0x100
			if(__NFUN_203__(OnTargetTime, OnTargetRequiredTime))
			{
				bHasTargetRotation = false;
				// End:0xD0
				if(bPowerOn)
				{
					GlobalTrigger(OnTargetEvent, Instigator, self);
					FindAndPlaySound('MagneticFuse_TurnOn', 1);
					FindAndPlaySound('MagneticFuse_Ambient');
					__NFUN_642__(0);
					__NFUN_652__(TargetRotation);					
				}
				else
				{
					// End:0x100
					if(__NFUN_340__(Spring, none))
					{
						Spring.__NFUN_1099__(10000);
						Spring.__NFUN_1098__(0);
					}
				}
			}			
		}
		else
		{
			OnTargetTime = 0;
		}
		__NFUN_817__();		
	}
	else
	{
		// End:0x1AB
		if(__NFUN_148__(bCanTurnOn, __NFUN_203__(Level.GameTimeSeconds, __NFUN_198__(LastDamageTime, 1))))
		{
			RotVector = __NFUN_240__(__NFUN_799__(RelativeRotation, InitialRotation), RelativeRotation);
			AngleOffset = __NFUN_211__(RotVector.Y);
			OnTargetTime = 0;
			// End:0x18E
			if(__NFUN_200__(AngleOffset, 0.3))
			{
				TurnPowerOn();				
			}
			else
			{
				// End:0x1AB
				if(__NFUN_201__(AngleOffset, __NFUN_199__(3.141593, 0.3)))
				{
					TurnPowerOn(true);
				}
			}
		}
	}
	return;
}

function KarmaSetConstraintProperties(KConstraint Constraint)
{
	super(KarmaActor).KarmaSetConstraintProperties(Constraint);
	// End:0x27
	if(__NFUN_339__(Spring, none))
	{
		Spring = KAngularSpringDamper(Constraint);
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'MagneticFuse_Ambient');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'MagneticFuse_TurnOff');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'MagneticFuse_TurnOn');
	return;
}

defaultproperties
{
	OnTargetRequiredTime=0.25
	bPowerOn=true
}