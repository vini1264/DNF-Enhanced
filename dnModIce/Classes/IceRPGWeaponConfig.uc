class IceRPGWeaponConfig extends WeaponConfig;

defaultproperties
{
    AmmoClass=Class'RPGAmmo'
    AdditionalPickupAmmoMin=3
    AdditionalPickupAmmoRnd=2
    MaxTraceDistance=0
    ProjectileClass=Class'IceRocket'
    bCheatMuzzleBlockage=true
    ViewKicks(0)=(bNoLerp=false,bToggleSign=false,Style=0,Function=4,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.1,ShakeFrequency=0.2,ShakeMagnitude=900,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=RPG_ViewKick_0)
    RumbleKicks(0)=(RumbleName=RPG_Rumble,RumbleDuration=0.31,RumbleLeftMagnitude=0.8,RumbleRightMagnitude=0.33,FalloffActor=none,FalloffDistance=0)
    MuzzleInfo(0)=(MuzzleFireStartAnim=FireStart,MuzzleFireAnim=Fire,MuzzleFireStopAnim=FireStop,MuzzleFlashClass=Class'p_Weapons.RPG_MuzzleFlash.RPG_MuzzleFlash_Spawner',MuzzleBoneName=mount_muzzle,MuzzleMountAngles=(Pitch=0,Yaw=0,Roll=0),ShellEjectionBoneName=mount_eject,ShellEjectionDir=(X=0,Y=0,Z=0),ShellEjectionVariance=(X=0,Y=0,Z=0),ShellEjectionForce=0)
    MuzzleLightClass=Class'Weapon_LightEx_RPG'
    MeleeDamageType=Class'MeleeDamage'
    AmmoWarnPCT=0.1
    WeaponHeatAttackRate=0.5
    WeaponHeatDecayRate=0.125
    WeaponAnimName=RPG
}