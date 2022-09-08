class IcePistolWeaponConfig extends WeaponConfig;

defaultproperties
{
    AmmoClass=Class'PistolAmmo'
    AdditionalPickupAmmoMin=44
    AdditionalPickupAmmoRnd=20
    ReloadCount=16
    ReloadClipAmmo=16
    TraceDamageType=Class'PistolDamage'
    TracerBeamSystemClass=Class'dnTracerFX_BeamSegment'
    TracerBubblesClass=Class'p_Weapons.Generic.WaterBubblesTracer'
    HorizShotError=0.01
    VertShotError=0.01
    RumbleKicks(0)=(RumbleName=Pistol_Rumble,RumbleDuration=0.15,RumbleLeftMagnitude=0.2,RumbleRightMagnitude=0.75,FalloffActor=none,FalloffDistance=0)
    MuzzleInfo(0)=(MuzzleFireStartAnim=FireStart,MuzzleFireAnim=Fire,MuzzleFireStopAnim=FireStop,MuzzleFlashClass=Class'p_Weapons.Pistol_MuzzleFlash.Pistol_MuzzleFlash_Spawner',MuzzleBoneName=mount_muzzle,MuzzleMountAngles=(Pitch=0,Yaw=0,Roll=0),ShellEjectionBoneName=mount_eject,ShellEjectionDir=(X=1.5,Y=1.5,Z=1),ShellEjectionVariance=(X=0,Y=0,Z=0),ShellEjectionForce=200)
    MuzzleLightClass=Class'Weapon_LightEx_Pistol'
    NumMeleeAttacks=2
    MeleeDamageType=Class'MeleeDamage'
    bFireInterruptFiring=true
    AmmoWarnPCT=0.10
    LockoutFireTime=0.10
    WeaponHeatAttackRate=0.10
    WeaponAnimName=Pistol
}