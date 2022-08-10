/*******************************************************************************
 * dnGrenade_BattleLord generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnGrenade_BattleLord extends dnRocket_RPG_HeatSeek
	collapsecategories;

defaultproperties
{
	ReseekDelay=0.1
	SeekTimeLimit=0.75
	SeekDistance=10000
	MaxRotationSpeed=8
	Speed=900
	MaxSpeed=1600
	AccelerationScaler=10
	Damage=20
	DamageRadius=100
	ExplosionClass='p_Creatures.Battlelord_Grenade.Battlelord_GrenadeExp_Spawner'
}