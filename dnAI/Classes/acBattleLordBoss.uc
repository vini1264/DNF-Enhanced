/*******************************************************************************
 * acBattleLordBoss generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class acBattleLordBoss extends AIAnimationControllerEx
	dependson(BattleLord_Boss);

function bool GetPainAnimName(Engine.Object.EPawnBodyPart Part, class<DamageType> DamageType, int Damage, Vector Dir, out name AnimName, out Engine.BaseAI.EAIAnimController NextAnimCtrl, out Engine.Object.EPawnBodyPart WoundedPart, out Engine.BaseAI.EAIArcSector WoundSector)
{
	// End:0x51
	if(__NFUN_150__(__NFUN_357__(DamageType, class'RocketDamage'), __NFUN_357__(DamageType, class'ExplosionDamage')))
	{
		return super.GetPainAnimName(Part, DamageType, Damage, Dir, AnimName, NextAnimCtrl, WoundedPart, WoundSector);
	}
	return false;
	return;
}

event bool ShouldPlayBigPain(Engine.Object.EPawnBodyPart Part, class<DamageType> DamageType, int Damage, Vector Dir)
{
	return true;
	return;
}

function bool GetDeathAnimName(Engine.Object.EPawnBodyPart Part, int Damage, Vector Dir, out name AnimName, out name FinishMeAnimName, out name FinishMeReviveAnimName, out float FinishMeTimeout, out int UseExactAnimName)
{
	local BattleLord_Boss bl;

	bl = BattleLord_Boss(RenderOwner);
	// End:0x130
	if(__NFUN_148__(__NFUN_340__(bl, none), bl.bAllowFinishMove))
	{
		// End:0x106
		if(__NFUN_340__(bl.FinishMeControlType, none))
		{
			bl.Level.FinishingMoveGate = bl.Level.GameTimeSeconds;
			// End:0xCD
			if(__NFUN_339__(bl.FinishMeControlType, class'dnControl_BattleLord_FinishingMove'))
			{
				AnimName = 'BattleLord_Finish_StartIdle';
				FinishMeAnimName = 'BattleLord_Finish_Idle';
				FinishMeReviveAnimName = 'None';
				FinishMeTimeout = bl.HumilitationInitiateTimeout;				
			}
			else
			{
				AnimName = 'BattleLord_Battle_DropToKnees';
				FinishMeAnimName = 'BattleLord_Battle_KneeIdle';
				FinishMeReviveAnimName = 'BattleLord_Battle_Recover';
				FinishMeTimeout = bl.StrengthTapInitiateTimeout;
			}			
		}
		else
		{
			AnimName = 'BattleLord_Finish_Death';
			FinishMeAnimName = 'None';
			FinishMeReviveAnimName = 'None';
		}
		UseExactAnimName = 1;
		return true;
	}
	return super.GetDeathAnimName(Part, Damage, Dir, AnimName, FinishMeAnimName, FinishMeReviveAnimName, FinishMeTimeout, UseExactAnimName);
	return;
}

defaultproperties
{
	bUseSimplePain=true
	MuzzleAimerContraints=(MinViewPitchOffset=-80000,MaxViewPitchOffset=120000,IgnoreThresholdPitch=34200,MinViewYawOffset=-111920,MaxViewYawOffset=111920,IgnoreThresholdYaw=18200,SmerpOn=0,SmerpOff=0,Acceleration=0.5,AccelerationReset=0.1,Velocity=5000,VelocityReset=2500)
	WeaponAimerContraints=(MinViewPitchOffset=0,MaxViewPitchOffset=0,IgnoreThresholdPitch=342000,MinViewYawOffset=-11192,MaxViewYawOffset=11192,IgnoreThresholdYaw=1820,SmerpOn=0,SmerpOff=0,Acceleration=0.5,AccelerationReset=0.1,Velocity=5000,VelocityReset=2500)
}