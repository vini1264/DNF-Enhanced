/*******************************************************************************
 * Cycloid_EyeBeam generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Cycloid_EyeBeam extends BeamSystem
	collapsecategories
	hidecategories(Filter,HeatVision,Interactivity,Karma,KarmaObject,KarmaOverride,Lighting,Networking,ParticleSystemBase,ParticleTextureInfo,SoftParticleSystem,Sound,SpawnOnDestroyed);

var cycloid MyCycloid;
var Vector LastHitLocation;

simulated function PostVerifySelf()
{
	local Actor A;

	// End:0x14
	if(__NFUN_169__(string(BeamSegments), 1))
	{
		string(BeamSegments) = 1;
	}
	BeamSegments[0].Actor1 = self;
	super(RenderActor).PostVerifySelf();
	__NFUN_361__('Tick');
	return;
}

final function ActivateBeam()
{
	TickStyle = 2;
	bNoNativeTick = false;
	Enabled = true;
	return;
}

final function DeactivateBeam()
{
	Enabled = false;
	TickStyle = 0;
	return;
}

event HandleHit(Vector HitLocation, Actor HitActor, float DeltaSeconds)
{
	super.HandleHit(HitLocation, HitActor, DeltaSeconds);
	LastHitLocation = HitLocation;
	// End:0x59
	if(__NFUN_148__(__NFUN_340__(HitActor, none), HitActor.bIsPlayerPawn))
	{
		MyCycloid.NotifyEyeHitPawn(HitActor);		
	}
	else
	{
		MyCycloid.NotifyEyeHit(HitLocation);
	}
	return;
}

defaultproperties
{
	Enabled=false
	BeamStartWidth=2
	BeamEndWidth=2
	DynamicBeamPoints=100024
	BeamTexture='dt_Effects2.Beams.BlueBeam03_FBM'
	BeamTextureScaleX=0.025
	BeamTexturePanX=64
	BeamTextureRotate=90
	BeamSegments=/* Array type was not detected. */
	Cond=/* Unknown default property type! */
	GotoNearTarget=/* Unknown default property type! */
	acBugball_WallSocket=/* Unknown default property type! */
}