/*******************************************************************************
 * Vehicles_Deco_Car_Standard_Base generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Vehicles_Deco_Car_Standard_Base extends Vehicles_Deco_Bodies
	collapsecategories;

var() Vehicles_Deco_Bodies.ECarColor CarColor;
var() bool bUseDamagedSkins;
var() float ExplosionLift;
var() Vector ExplosionOffset;
var() float ExplosionRadius;
var() float ExplosionDamage;
var() float ExplosionFalloffStart;
var() float ExplosionDelay;
var() float ExplosionDelayVariance;
var() class<SoftParticleSystem> ExplosionParticleClass;
var() class<SoftParticleSystem> GlassExplosionParticleClass;
var() float ExplosionPlayerDamageScale;
var() int IgnitionHealthThreshhold;
var int SingleHitDamageThreshhold;
var bool bIgnited;
var float ImpactVelocityThreshhold;
var Vector ExplosionHingeLocations[4];
var Rotator ExplosionHingeMountAngles[4];
var Rotator ExplosionLimitMountAngles[4];
var Rotator ExplosionLimitSecondaryAxes[4];
var() bool bConstrained;
var bool bHasBeenStruck;
var() class<SoftParticleSystem> FireParticleClass;
var SoftParticleSystem Fire;
var SoftParticleSystem fire2;
var() Vector FireOffset;
var() Vector FireOffset2;
var() class<SoftParticleSystem> SmokeParticleClass;
var SoftParticleSystem Smoke;
var() Vector SmokeOffset;
var() float SmokeDuration;
var() float SmokeDurationVar;
var dnFriendFX_Spawners ExplosionParticle;
var dnFriendFX_Spawners GlassParticle;

simulated function Destroyed()
{
	super(dnDecoration).Destroyed();
	__NFUN_608__('Boom');
	// End:0x1F
	if(__NFUN_145__(bSilentDestroy))
	{
		Explode();
	}
	return;
}

simulated function bool CanHurtRadiusOther(Actor Other)
{
	// End:0x28
	if(__NFUN_150__(__NFUN_340__(Vehicles_Deco_Car_Standard_Base(Other), none), Other.bIsVehicle))
	{
		return false;
	}
	return super(Actor).CanHurtRadiusOther(Other);
	return;
}

function Boom()
{
	CriticalDamage();
	return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	local int i;
	local bool bFoundMatch;

	super.TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	// End:0x84
	if(__NFUN_170__(string(DamageTypesAcceptedOnly), 0))
	{
		i = 0;
		J0x3C:

		// End:0x77 [Loop If]
		if(__NFUN_169__(i, string(DamageTypesAcceptedOnly)))
		{
			// End:0x6D
			if(__NFUN_357__(DamageType, DamageTypesAcceptedOnly[i]))
			{
				bFoundMatch = true;
				// [Explicit Break]
				goto J0x77;
			}
			__NFUN_184__(i);
			// [Loop Continue]
			goto J0x3C;
		}
		J0x77:

		// End:0x84
		if(__NFUN_145__(bFoundMatch))
		{
			return;
		}
	}
	i = 0;
	J0x8B:

	// End:0xBD [Loop If]
	if(__NFUN_169__(i, string(DamageTypesIgnored)))
	{
		// End:0xB3
		if(__NFUN_339__(DamageType, DamageTypesIgnored[i]))
		{
			return;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x8B;
	}
	// End:0xE2
	if(__NFUN_148__(__NFUN_203__(Damage, float(SingleHitDamageThreshhold)), __NFUN_145__(bHasBeenStruck)))
	{
		CriticalDamage();
		return;
	}
	// End:0x112
	if(__NFUN_148__(__NFUN_148__(__NFUN_202__(Health, float(IgnitionHealthThreshhold)), __NFUN_145__(bIgnited)), __NFUN_145__(bHasBeenStruck)))
	{
		StartUnstable();
	}
	return;
}

event bool TakePhysicsImpactDamage(float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, Pawn Instigator, KarmaActor DamageActor)
{
	local float velMag, ImpulseMag, SideScale;
	local Vector Impulse, spin, Right, Up;

	// End:0x3A
	if(__NFUN_145__(DamageActor.bIsVehicle))
	{
		return super(dnDecoration).TakePhysicsImpactDamage(Damage, DamageOrigin, DamageDirection, DamageType, Instigator, DamageActor);
	}
	bHasBeenStruck = true;
	velMag = __NFUN_251__(DamageActor.Velocity);
	// End:0x206
	if(__NFUN_148__(__NFUN_148__(__NFUN_203__(velMag, ImpactVelocityThreshhold), __NFUN_145__(DecorationIsDead())), __NFUN_145__(bConstrained)))
	{
		__NFUN_812__(1);
		DamageActor.__NFUN_794__(Impulse);
		__NFUN_246__(Impulse, __NFUN_198__(1, __NFUN_198__(0.1, __NFUN_195__(__NFUN_222__(), 0.1))));
		Up = __NFUN_233__(__NFUN_253__(__NFUN_640__()));
		__NFUN_250__(Impulse, __NFUN_235__(__NFUN_198__(0.6, __NFUN_195__(__NFUN_222__(), 0.1)), __NFUN_640__()));
		ImpulseMag = __NFUN_251__(Impulse);
		// End:0x10F
		if(__NFUN_201__(ImpulseMag, 0))
		{
			__NFUN_246__(Impulse, __NFUN_196__(1, ImpulseMag));
		}
		Right = __NFUN_245__(Up, Impulse);
		SideScale = __NFUN_244__(__NFUN_253__(__NFUN_239__(Location, DamageOrigin)), Right);
		// End:0x17A
		if(__NFUN_201__(SideScale, 0))
		{
			Impulse = __NFUN_262__(Impulse, Up, int(__NFUN_198__(float(1024), __NFUN_195__(__NFUN_199__(1, SideScale), float(1024)))));			
		}
		else
		{
			Impulse = __NFUN_262__(Impulse, Up, int(__NFUN_198__(float(-1024), __NFUN_195__(__NFUN_198__(1, SideScale), float(-1024)))));
		}
		__NFUN_790__(__NFUN_235__(ImpulseMag, Impulse), 1);
		__NFUN_821__(__NFUN_263__(__NFUN_235__(1000, __NFUN_256__(__NFUN_232__(1875, 1875, 1875), __NFUN_232__(500, 500, 500))), Rotation));
		CriticalDamage();
		__NFUN_607__(3, false, 'SwitchInteraction');
	}
	return super(dnDecoration).TakePhysicsImpactDamage(Damage, DamageOrigin, DamageDirection, DamageType, Instigator, DamageActor);
	return;
}

function SwitchInteraction()
{
	__NFUN_812__(0);
	return;
}

function StartUnstable()
{
	__NFUN_607__(__NFUN_226__(ExplosionDelay, ExplosionDelayVariance), false, 'Boom');
	FindAndPlaySound('OnFire', 1);
	bIgnited = true;
	Fire = __NFUN_615__(FireParticleClass,,, __NFUN_238__(__NFUN_241__(FireOffset, Rotation), Location));
	Fire.MountType = 0;
	Fire.__NFUN_635__(self, false, false, true);
	fire2 = __NFUN_615__(FireParticleClass,,, __NFUN_238__(__NFUN_241__(FireOffset2, Rotation), Location));
	fire2.MountType = 0;
	fire2.__NFUN_635__(self, false, false, true);
	return;
}

function Explode()
{
	local dnFriendFX_Spawners FriendSpawner;
	local KHinge ExplosionHinge;
	local KAngularJointLimit ExplosionLimit;
	local int Index, i, j;

	// End:0x5D
	if(__NFUN_340__(ExplosionParticle, none))
	{
		ExplosionParticle.SystemSizeScale = __NFUN_195__(DrawScale, 2);
		ExplosionParticle.__NFUN_645__(Location);
		ExplosionParticle.__NFUN_652__(Rotation);
		ExplosionParticle.ExecuteEffect(true);
	}
	// End:0xB3
	if(__NFUN_340__(GlassParticle, none))
	{
		GlassParticle.SystemSizeScale = DrawScale;
		GlassParticle.__NFUN_645__(Location);
		GlassParticle.__NFUN_652__(Rotation);
		GlassParticle.ExecuteEffect(true);
	}
	// End:0xC7
	if(__NFUN_340__(BurntMesh, none))
	{
		__NFUN_595__(BurntMesh);
	}
	__NFUN_642__(18);
	// End:0x1CC
	if(bConstrained)
	{
		Index = __NFUN_187__(4);
		ExplosionHinge = __NFUN_615__(class'KHinge', self,, __NFUN_238__(__NFUN_241__(ExplosionHingeLocations[Index], Rotation), Location), __NFUN_269__(ExplosionHingeMountAngles[Index], Rotation));
		// End:0x147
		if(__NFUN_340__(ExplosionHinge, none))
		{
			ExplosionHinge.KConstraintActor1 = self;
			ExplosionHinge.__NFUN_642__(18);
		}
		ExplosionLimit = __NFUN_615__(class'KAngularJointLimit', self,, Location, __NFUN_269__(ExplosionLimitMountAngles[Index], Rotation));
		// End:0x1CC
		if(__NFUN_340__(ExplosionLimit, none))
		{
			ExplosionLimit.KConstraintActor1 = self;
			ExplosionLimit.__NFUN_1106__(6000);
			ExplosionLimit.__NFUN_1107__(true, __NFUN_269__(ExplosionLimitSecondaryAxes[Index], Rotation));
			ExplosionLimit.__NFUN_642__(18);
		}
	}
	j = 1;
	i = __NFUN_166__(string(VehicleParts), 1);
	J0x1E2:

	// End:0x248 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x23E
		if(__NFUN_340__(VehicleParts[i].VehiclePartActor, none))
		{
			VehicleParts[i].VehiclePartActor.ScheduleExplode(j);
			__NFUN_184__(j);
			// End:0x23E
			if(__NFUN_170__(j, 6))
			{
				j = 1;
			}
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x1E2;
	}
	__NFUN_820__(__NFUN_232__(0, 0, ExplosionLift), __NFUN_238__(__NFUN_241__(ExplosionOffset, Rotation), Location));
	FindAndPlaySound('Veh_Explosion');
	__NFUN_701__(none);
	// End:0x2A4
	if(__NFUN_340__(Fire, none))
	{
		Fire.__NFUN_1054__();
		Fire.__NFUN_614__();
	}
	// End:0x2CA
	if(__NFUN_340__(fire2, none))
	{
		fire2.__NFUN_1054__();
		fire2.__NFUN_614__();
	}
	Smoke = __NFUN_615__(SmokeParticleClass,,, __NFUN_238__(__NFUN_241__(SmokeOffset, Rotation), Location));
	Smoke.MountType = 0;
	Smoke.__NFUN_635__(self, false, false, true);
	__NFUN_607__(__NFUN_226__(SmokeDuration, SmokeDurationVar), false, 'TurnOffSmoke');
	HurtRadius(ExplosionDamage, Location, ExplosionRadius, ExplosionFalloffStart,, Location, ExplosionPlayerDamageScale);
	return;
}

function TurnOffSmoke()
{
	Smoke.__NFUN_1054__();
	return;
}

function TurnOffPartPhysics(Vehicles_Deco_Parts Part)
{
	// End:0x18
	if(bConstrained)
	{
		Part.__NFUN_642__(0);
	}
	return;
}

function PostVerifySelf()
{
	local name DecoActName;
	local int i;
	local string DecoActString;
	local StaticMesh Mesh;

	super.PostVerifySelf();
	Mesh = StaticMesh(__NFUN_596__());
	__NFUN_595__(BurntMesh);
	__NFUN_595__(Mesh);
	// End:0x32
	if(bConstrained)
	{
		__NFUN_642__(0);
	}
	ExplosionParticle = FindFriendSpawner(class<dnFriendFX_Spawners>(ExplosionParticleClass));
	// End:0x97
	if(__NFUN_340__(ExplosionParticle, none))
	{
		ExplosionParticle.SystemSizeScale = __NFUN_195__(DrawScale, 2);
		ExplosionParticle.__NFUN_645__(Location);
		ExplosionParticle.__NFUN_652__(Rotation);		
	}
	else
	{
		ExplosionParticle = dnFriendFX_Spawners(__NFUN_615__(ExplosionParticleClass,,, Location));
		ExplosionParticle.SystemSizeScale = __NFUN_195__(DrawScale, 2);
	}
	GlassParticle = FindFriendSpawner(class<dnFriendFX_Spawners>(GlassExplosionParticleClass));
	// End:0x12B
	if(__NFUN_340__(GlassParticle, none))
	{
		GlassParticle.SystemSizeScale = DrawScale;
		GlassParticle.__NFUN_645__(Location);
		GlassParticle.__NFUN_652__(Rotation);		
	}
	else
	{
		GlassParticle = dnFriendFX_Spawners(__NFUN_615__(GlassExplosionParticleClass,,, Location));
	}
	// End:0x185
	if(__NFUN_148__(__NFUN_148__(__NFUN_148__(__NFUN_174__(int(CarColor), int(6)), __NFUN_174__(int(CarColor), int(5))), __NFUN_174__(int(CarColor), int(7))), __NFUN_174__(int(CarColor), int(8))))
	{
		return;
	}
	DecoActString = __NFUN_302__(string(__NFUN_365__(Enum'ECarColor', int(CarColor))), "_Deco");
	// End:0x1C1
	if(bUseDamagedSkins)
	{
		DecoActString = __NFUN_302__(DecoActString, "_Dmg");
	}
	DecoActName = __NFUN_343__(DecoActString);
	DecoActivity(0, DecoActName);
	i = __NFUN_166__(string(VehicleParts), 1);
	J0x1EB:

	// End:0x239 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x22F
		if(__NFUN_340__(VehicleParts[i].VehiclePartActor, none))
		{
			VehicleParts[i].VehiclePartActor.DecoActivity(0, DecoActName);
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x1EB;
	}
	return;
}

function DestroyMountedActors(bool bSkipSpawnOnDestroyed, bool bSilentDestroy)
{
	local int i;

	i = __NFUN_166__(string(VehicleParts), 1);
	J0x0F:

	// End:0xC6 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0xBC
		if(__NFUN_340__(VehicleParts[i].VehiclePartActor, none))
		{
			VehicleParts[i].VehiclePartActor.DestroyMountedActors(bSkipSpawnOnDestroyed, bSilentDestroy);
			// End:0x7E
			if(bSkipSpawnOnDestroyed)
			{
				VehicleParts[i].VehiclePartActor.bSpawnOnDestroyed = false;
			}
			// End:0xA4
			if(bSilentDestroy)
			{
				VehicleParts[i].VehiclePartActor.bSilentDestroy = true;
			}
			VehicleParts[i].VehiclePartActor.__NFUN_614__();
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x0F;
	}
	super(Actor).DestroyMountedActors(bSkipSpawnOnDestroyed, bSilentDestroy);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'OnFire');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'Veh_Explosion');
	PrecacheIndex.__NFUN_1266__(FireParticleClass);
	PrecacheIndex.__NFUN_1266__(ExplosionParticleClass);
	PrecacheIndex.__NFUN_1266__(GlassExplosionParticleClass);
	PrecacheIndex.__NFUN_1266__(SmokeParticleClass);
	return;
}

defaultproperties
{
	ExplosionLift=800000
	ExplosionRadius=246
	ExplosionDamage=100
	ExplosionFalloffStart=200
	ExplosionDelay=5
	ExplosionDelayVariance=2
	ExplosionParticleClass='p_Decorations.Car_Explosion.Car_Explosion_Spawner'
	GlassExplosionParticleClass='p_Decorations.Car_Explode_GlassShatter.Car_Explode_GlassShatter_Spawner'
	ExplosionPlayerDamageScale=0.5
	IgnitionHealthThreshhold=120
	SingleHitDamageThreshhold=100
	ImpactVelocityThreshhold=800
	ExplosionHingeLocations[0]=(X=0.07721712,Y=2.802818E-17,Z=44.70543)
	ExplosionHingeLocations[1]=(X=0.07721712,Y=2.802819E-17,Z=-46.79457)
	ExplosionHingeLocations[2]=(X=-1.106969E-09,Y=2.813732E-17,Z=-0.461239)
	ExplosionHingeLocations[3]=(X=-4.972152E-15,Y=2.802923E-17,Z=0.970137)
	ExplosionHingeMountAngles[2]=(Pitch=8709,Yaw=571080704,Roll=-16384)
	ExplosionHingeMountAngles[3]=(Pitch=8709,Yaw=571080704,Roll=-16384)
	ExplosionLimitMountAngles[0]=(Pitch=8709,Yaw=571080704,Roll=-16384)
	ExplosionLimitMountAngles[1]=(Pitch=8709,Yaw=571080704,Roll=16384)
	ExplosionLimitMountAngles[3]=(Pitch=8709,Yaw=571080704,Roll=32768)
	ExplosionLimitSecondaryAxes[0]=(Pitch=393224709,Yaw=571080704,Roll=-16384)
	ExplosionLimitSecondaryAxes[1]=(Pitch=393224709,Yaw=571080704,Roll=16384)
	ExplosionLimitSecondaryAxes[2]=(Pitch=393224709,Yaw=571080704,Roll=0)
	ExplosionLimitSecondaryAxes[3]=(Pitch=393224709,Yaw=571080704,Roll=32768)
	bConstrained=true
	FireParticleClass='p_Decorations.Car_Fire.Car_Fire_Main'
	FireOffset=(X=1.291717E-41,Y=2.802908E-17,Z=-6)
	FireOffset2=(X=1.291717E-41,Y=2.802898E-17,Z=20)
	SmokeParticleClass='p_Vehicles.Deco_Vehicle.DestroyedVehSmoke'
	SmokeOffset=(X=1.291717E-41,Y=2.802908E-17,Z=0)
	SmokeDuration=8
	SmokeDurationVar=2
	bStartupOff=true
	bSurviveDeath=true
	HealthPrefab=5
	DamageTypesAcceptedOnly=/* Array type was not detected. */
	Z=180
	HealthCap=180
	bTickOnlyWhenPhysicsAwake=true
	ImpactSoundRadius=16384
	ImpactSoundInnerRadius=512
	PhysicsEntityGroup=VehiclesDecoGroup
	PhysicsSoundOverrides=/* Array type was not detected. */
}