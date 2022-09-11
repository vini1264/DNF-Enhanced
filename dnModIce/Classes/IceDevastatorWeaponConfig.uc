class IceDevastatorWeaponConfig extends WeaponConfig;

defaultproperties
{
    AmmoClass=Class'DevastatorAmmo'
    AdditionalPickupAmmoMin=99
    AdditionalPickupAmmoRnd=30
    MaxTraceDistance=0
    ProjectileClass=Class'IceRocket_Devastator'
    RumbleKicks(0)=(RumbleName=Devastator_Rumble,RumbleDuration=0.17,RumbleLeftMagnitude=0.4,RumbleRightMagnitude=0.22,FalloffActor=none,FalloffDistance=0)
    MuzzleInfo(0)=(MuzzleFireStartAnim=StartFireLeft,MuzzleFireAnim=FireLeft,MuzzleFireStopAnim=StopFireLeft,MuzzleFlashClass=Class'p_Weapons.Devastator_MuzzleFlash.Devastator_MuzzleFlash_Spawner',MuzzleBoneName=mount_muzzle_left_down,MuzzleMountAngles=(Pitch=0,Yaw=32768,Roll=0),ShellEjectionBoneName=mount_eject,ShellEjectionDir=(X=0,Y=0,Z=0),ShellEjectionVariance=(X=0,Y=0,Z=0),ShellEjectionForce=0)
    MuzzleInfo(1)=(MuzzleFireStartAnim=StartFireLeft,MuzzleFireAnim=FireLeft,MuzzleFireStopAnim=StopFireLeft,MuzzleFlashClass=Class'p_Weapons.Devastator_MuzzleFlash.Devastator_MuzzleFlash_Spawner',MuzzleBoneName=mount_muzzle_left_up,MuzzleMountAngles=(Pitch=0,Yaw=32768,Roll=0),ShellEjectionBoneName=None,ShellEjectionDir=(X=0,Y=0,Z=0),ShellEjectionVariance=(X=0,Y=0,Z=0),ShellEjectionForce=0)
    MuzzleInfo(2)=(MuzzleFireStartAnim=StartFireRight,MuzzleFireAnim=FireRight,MuzzleFireStopAnim=StopFireRight,MuzzleFlashClass=Class'p_Weapons.Devastator_MuzzleFlash.Devastator_MuzzleFlash_Spawner',MuzzleBoneName=mount_muzzle_right_down,MuzzleMountAngles=(Pitch=0,Yaw=32768,Roll=0),ShellEjectionBoneName=None,ShellEjectionDir=(X=0,Y=0,Z=0),ShellEjectionVariance=(X=0,Y=0,Z=0),ShellEjectionForce=0)
    MuzzleInfo(3)=(MuzzleFireStartAnim=StartFireRight,MuzzleFireAnim=FireRight,MuzzleFireStopAnim=StopFireRight,MuzzleFlashClass=Class'p_Weapons.Devastator_MuzzleFlash.Devastator_MuzzleFlash_Spawner',MuzzleBoneName=mount_muzzle_right_up,MuzzleMountAngles=(Pitch=0,Yaw=32768,Roll=0),ShellEjectionBoneName=None,ShellEjectionDir=(X=0,Y=0,Z=0),ShellEjectionVariance=(X=0,Y=0,Z=0),ShellEjectionForce=0)
    MuzzleLightClass=Class'Weapon_LightEx_Devastator'
    MuzzleLightBoneName=mount_muzzle_left_down
    MeleeDamageType=Class'MeleeDamage'
    bHasFireStart=true
    bHasLoopingFire=true
    bHasFireStop=true
    AmmoWarnPCT=0.14
    WeaponHeatAttackRate=0.5
    WeaponHeatDecayRate=0.125
    WeaponAnimName=Devastator
}