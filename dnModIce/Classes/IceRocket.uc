class IceRocket extends dnRocket_RPG;

defaultproperties
{
    bWaterEnterSlowdown=true
    bWaterExitSpeedup=true
    bWaterSplash=true
    Speed=1300
    MaxSpeed=2000
    AccelerationScaler=50
    Damage=125
    DamageRadius=260
	ShakeScalar=2.25
    ShakeInfo(0)=(bNoLerp=false,bToggleSign=false,Style=3,Function=0,FalloffActor=none,FalloffDistance=0,ShakeDuration=0.55,ShakeFrequency=0.05,ShakeMagnitude=800,ShakeFullMagnitude=0,ShakeFullMagnitudeTime=0,ShakeName=dnRocket_RPG_Shake)
    RumbleInfo(0)=(RumbleName=dnRocket_RPG_Rumble,RumbleDuration=0.5,RumbleLeftMagnitude=0.8,RumbleRightMagnitude=0,FalloffActor=none,FalloffDistance=0)
    DamageClass=Class'RocketDamage'
    WaterScaler=0.6
    DeferredExplosionTimer=0
    DeferredExplosionTimerVariance=0
    bUseCylinderCollision=true
    LifeSpan=6
    SoundVolume=128
    SoundRadius=1600
    SoundInnerRadius=800
}