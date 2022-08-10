/*******************************************************************************
 * Industrial_Generic_Fan_Mounted generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Industrial_Generic_Fan_Mounted extends Industrial_Generic
	abstract
	collapsecategories;

var bool bCurrentlyOn;
var float FanSpeed;
var float FanDesiredSpeed;
var float FanRampRate;

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	super(dnDecoration).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	// End:0x65
	if(__NFUN_340__(Owner, none))
	{
		Owner.TakeDamage(Instigator, __NFUN_195__(Damage, 0.75), DamageOrigin, DamageDirection, DamageType);
	}
	return;
}

final function TurnOn(float NewSpeed, float NewRampRate, Sound NewSound)
{
	// End:0x0B
	if(bCurrentlyOn)
	{
		return;
	}
	FanDesiredSpeed = NewSpeed;
	FanRampRate = NewRampRate;
	bCurrentlyOn = true;
	FindAndPlaySound('FanMount_On');
	return;
}

final function TurnOff(float NewSpeed, float NewRampRate, Sound NewSound)
{
	// End:0x0D
	if(__NFUN_145__(bCurrentlyOn))
	{
		return;
	}
	FanDesiredSpeed = NewSpeed;
	FanRampRate = NewRampRate;
	bCurrentlyOn = false;
	__NFUN_701__(none);
	FindAndPlaySound('FanMount_Off');
	return;
}

simulated event Tick(float DeltaTime)
{
	super(Actor).Tick(DeltaTime);
	// End:0x3D
	if(__NFUN_200__(FanSpeed, FanDesiredSpeed))
	{
		FanSpeed = __NFUN_224__(__NFUN_198__(FanSpeed, __NFUN_195__(FanRampRate, DeltaTime)), FanDesiredSpeed);		
	}
	else
	{
		// End:0x6C
		if(__NFUN_201__(FanSpeed, FanDesiredSpeed))
		{
			FanSpeed = __NFUN_225__(__NFUN_199__(FanSpeed, __NFUN_195__(FanRampRate, DeltaTime)), FanDesiredSpeed);
		}
	}
	__NFUN_653__(__NFUN_265__(0, 0, int(FanSpeed)), 0);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'FanMount_On');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'FanMount_Off');
	return;
}

defaultproperties
{
	HealthPrefab=0
	Physics=9
	bBlockKarma=false
	CollisionRadius=20
	CollisionHeight=22
}