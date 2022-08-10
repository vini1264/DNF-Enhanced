/*******************************************************************************
 * Electronics_Generic_ATM generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_ATM extends Electronics_Generic
	collapsecategories;

const CashSpitterName = 'CASH_SPITTER';

var() noexport float TimeBeforeBoot "Time in seconds that ATM will wait before booting.. after the effects of an EMP blast have worn off";
var() noexport int UsesBeforeCatMessage "Number of times this has to be used before displaying 'stray cat' easter egg message.";
var SoftParticleSystem CashSpitter;
var bool bBooting;
var int EasterEggCounter;

event PostVerifySelf()
{
	super(dnDecoration).PostVerifySelf();
	CashSpitter = SoftParticleSystem(FindMountedActor('CASH_SPITTER'));
	return;
}

function HitByEMP(optional float Duration, optional Pawn Instigator)
{
	super.HitByEMP(Duration, Instigator);
	bPoweredBeforeEMP = true;
	return;
}

function ForcePowerOn()
{
	super.ForcePowerOn();
	bBooting = true;
	__NFUN_607__(TimeBeforeBoot, false, 'PlayBootSound');
	return;
}

final function PlayBootSound()
{
	FindAndPlaySound('ATM_BootUp', 1);
	bBooting = false;
	return;
}

simulated function bool CanBeUsedBy(Pawn User)
{
	// End:0x2D
	if(__NFUN_148__(__NFUN_148__(super(InteractiveActor).CanBeUsedBy(User), __NFUN_145__(bEMPulsed)), __NFUN_145__(bBooting)))
	{
		return true;		
	}
	else
	{
		return false;
	}
	return;
}

event Used(Actor Other, Pawn EventInstigator)
{
	super(dnDecoration).Used(Other, EventInstigator);
	// End:0x29
	if(__NFUN_340__(CashSpitter, none))
	{
		CashSpitter.__NFUN_1055__();
	}
	FindAndPlaySound('ATM_Error', 1);
	DecoActivity(0, 'ActivateATM');
	__NFUN_184__(EasterEggCounter);
	// End:0x66
	if(__NFUN_173__(EasterEggCounter, UsesBeforeCatMessage))
	{
		DecoActivity(0, 'ShowKitty');
	}
	return;
}

function StopSpitting()
{
	// End:0x19
	if(__NFUN_340__(CashSpitter, none))
	{
		CashSpitter.__NFUN_1054__();
	}
	DecoActivity(0, 'ResetATM');
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'ATM_BootUp');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'ATM_Error');
	return;
}

defaultproperties
{
	TimeBeforeBoot=0.5
	UsesBeforeCatMessage=2
}