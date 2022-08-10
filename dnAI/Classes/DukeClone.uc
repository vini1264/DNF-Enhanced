/*******************************************************************************
 * DukeClone generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class DukeClone extends DukeClone_Base
	config
	collapsecategories;

event NotifyOpStarted(Engine.BaseAI.EAIOp NewOp, Engine.BaseAI.EAIOp OldOp)
{
	super(AIActor).NotifyOpStarted(NewOp, OldOp);
	// End:0x3B
	if(__NFUN_148__(__NFUN_173__(int(NewOp), int(105)), __NFUN_173__(int(AnimCtrl.m_eController), int(1))))
	{
		SetAnimController(5);
	}
	return;
}

defaultproperties
{
	HasLookTargetEvaluator=true
	LookTargetEvalInfo=(MyOwner=none,EvalInterval=0.5,Suspended=false,bSuspendedWithNoTarget=false,Evaluator=2,ForceUpdate=false,MustBePawn=true,MustBeSighted=false,MustBeReachable=false,CanTargetProjectiles=false,CanAvoidTargetableProjectiles=false,LastTarget=none,LastTargetEndTime=0)
	HeadTrackRate=120
	HasWeaponManager=true
	WeaponConfig='WeaponCfg_DukeClone'
	Weapons(0)=class'C'
}