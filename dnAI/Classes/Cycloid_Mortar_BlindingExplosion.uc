/*******************************************************************************
 * Cycloid_Mortar_BlindingExplosion generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Cycloid_Mortar_BlindingExplosion extends dnNukeExplosion;

defaultproperties
{
	Nuke_DebrisClass=none
	Nuke_MushroomCap_BaseClass=none
	Nuke_MushroomCap_MidClass=none
	Nuke_MushroomCap_FireClass=none
	Nuke_MushroomCap_CloudsShaftClass=none
	Nuke_LightClass='dnExplosionLight_CycloidMortar'
	EffectDuration=0.15
	DoViewShakes=false
	DoMotionBlur=false
	DamageRadius=0
}