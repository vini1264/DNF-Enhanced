/*******************************************************************************
 * MP_MachineGunWeaponConfig generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class MP_MachineGunWeaponConfig extends MP_WeaponConfig;

defaultproperties
{
	AmmoClass='MachineGunAmmo'
	AdditionalPickupAmmoMin=140
	AdditionalPickupAmmoRnd=60
	ReloadCount=50
	ReloadClipAmmo=50
	TraceDamageType='MachineGunDamage'
	TracerBeamSystemClass='dnTracerFX_BeamSegment'
	TracerBubblesClass='p_Weapons.Generic.WaterBubblesTracer'
	HorizShotError=0.05
	VertShotError=0.05
	ViewKicks=/* Array type was not detected. */
	RandomSeed=none
}