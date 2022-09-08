class IceShotgun extends Shotgun;

defaultproperties
{
    BaseDamagePerShot=10
    HighBaseDamagePerShot=15
    DamageFalloffStart=0
    DamageFalloffEnd=0
    WeaponConfig=Class'IceShotgunWeaponConfig'
    AmmoLoaded=7
    HUDAmmoClipIcon=3
    DOFWeapDist=7.5
    DOFWeapDistDelta=1
    CommandAlias="UseWeapon dnModIce.IceShotgun"
    PickupClass=Class'IceShotgunPickup'
    SoundVolume=255
    SoundRadius=3200
    SoundInnerRadius=1600
}