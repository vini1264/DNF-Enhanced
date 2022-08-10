/*******************************************************************************
 * LevelUpIndicator generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class LevelUpIndicator extends RenderActor
	collapsecategories;

var SoftParticleSystem LevelUpParticle;
var int CurrentTargetState;
var float DrawScaleOverrride;
var class<SoftParticleSystem> LevelUpParticleClass;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x6B
	if(__NFUN_148__(__NFUN_339__(LevelUpParticle, none), __NFUN_340__(LevelUpParticleClass, none)))
	{
		LevelUpParticleClass.default.TriggerType = 0;
		LevelUpParticle = __NFUN_615__(LevelUpParticleClass,,, Location);
		LevelUpParticle.RemoteRole = ROLE_None;
		LevelUpParticle.Enabled = false;
	}
	return;
}

simulated function Destroyed()
{
	LevelUpParticle.__NFUN_614__();
	super.Destroyed();
	return;
}

simulated function BeginEffect()
{
	CurrentTargetState = 0;
	__NFUN_646__(CurrentTargetState);
	return;
}

simulated function EnableEffect()
{
	LevelUpParticle.__NFUN_645__(Location);
	LevelUpParticle.Enabled = true;
	LevelUpParticle.DisableTickWhenEmpty = false;
	LevelUpParticle.TickStyle = LevelUpParticle.default.TickStyle;
	return;
}

simulated function DisableEffect()
{
	LevelUpParticle.DisableTickWhenEmpty = true;
	LevelUpParticle.Enabled = false;
	return;
}

simulated function Explode()
{
	EnableEffect();
	CurrentTargetState = 1;
	__NFUN_646__(CurrentTargetState);
	return;
}

simulated function FinishedEffect()
{
	CurrentTargetState = -1;
	DisableEffect();
	DrawScaleOverrride = default.DrawScale;
	__NFUN_591__(DrawScaleOverrride);
	return;
}

simulated event Tick(float DeltaSeconds)
{
	// End:0x26
	if(__NFUN_173__(CurrentTargetState, 0))
	{
		__NFUN_209__(DrawScaleOverrride, __NFUN_196__(DeltaSeconds, 20));
		__NFUN_591__(DrawScaleOverrride);
	}
	super(Actor).Tick(DeltaSeconds);
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(Actor).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1266__(LevelUpParticleClass);
	return;
}

defaultproperties
{
	CurrentTargetState=-1
	LevelUpParticleClass='p_multiplayer.levelup.levelup_star'
	RotationRate=(Pitch=8741,Yaw=572915712,Roll=24000)
	DesiredLocation=/* Array type was not detected. */
}