/*******************************************************************************
 * ShotgunDamage generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ShotgunDamage extends BulletDamage
	abstract;

defaultproperties
{
	DamageName="<?int?dnGame.ShotgunDamage.DamageName?>"
	DeathMessage="<?int?dnGame.ShotgunDamage.DeathMessage?>"
	SuicideDeathMessage="<?int?dnGame.ShotgunDamage.SuicideDeathMessage?>"
	MomentumTransfer=300
	Icon="dt_hud.ingame_hud.kill_shotgun"
	FrameDamageLerp=0
	DeathMomentumScale=20
	DeathLiftScale=0.2
	NearMissChance=0
}