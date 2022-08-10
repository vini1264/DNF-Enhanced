/*******************************************************************************
 * dnExplosionLight_Rocket_Gunship generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnExplosionLight_Rocket_Gunship extends dnExplosionLight
	hidecategories(Collision,Filter,HeatVision,Interactivity,Karma,KarmaObject,KarmaOverride,Networking,SpawnOnDestroyed);

defaultproperties
{
	LightRadius=752
	LightIntensity=11.5
	LightColor=(B=121,G=2,R=1,A=96)
	LightCubeMap='dt_cubemaps.Lights.Blast01_Cube'
	AttenuationMap=none
	bCastStencilShadows=false
	bStaticShadows=true
}