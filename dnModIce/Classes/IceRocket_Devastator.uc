class IceRocket_Devastator extends dnRocket_Devastator;

defaultproperties
{
    Speed=2000
    MaxSpeed=2200
    Damage=30
    DamageRadius=100
    DamageClass=Class'DevastatorDamage'
    ShakeScalar=3
    ShakeInfo(0)=(bNoLerp=false,bToggleSign=false,Style=3,Function=0,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.7,ShakeFrequency=0.05,ShakeMagnitude=450,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=dnRocket_Devastator_Shake)
    RumbleInfo(0)=(RumbleName=dnRocket_Devastator_Rumble,RumbleDuration=1,RumbleLeftMagnitude=0.6,RumbleRightMagnitude=0,FalloffActor=none,FalloffDistance=0)
    bTelekineticableSingleOnly=true
    DrawType=8
    SoundVolume=96
    SoundPitch=128
    SoundRadius=1000
    SoundInnerRadius=500
}