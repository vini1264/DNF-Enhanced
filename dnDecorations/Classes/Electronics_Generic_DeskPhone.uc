/*******************************************************************************
 * Electronics_Generic_DeskPhone generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_DeskPhone extends Electronics_Generic
	collapsecategories;

var() noexport array<name> Messages "Array of VoicePack entries to play when Duke presses use.";
var() noexport deprecated name StartPlayingMessagesEvent "This event will be triggered when you start playing messages.";
var int CurrentMessage;
var bool bPlayingMessages;
var bool bPlayingBeep;
var name NoNewMessages;
var name EndOfMessages;
var name OffTheHook;
var name Beep;

function Destroyed()
{
	super(dnDecoration).Destroyed();
	__NFUN_608__('Reenable');
	bUsable = false;
	FindAndPlaySound(OffTheHook);
	__NFUN_607__(10, false, 'StopTone');
	StopPlayingMessages();
	__NFUN_695__(5);
	return;
}

function StopTone()
{
	FindAndStopSound(OffTheHook);
	return;
}

event Used(Actor Other, Pawn EventInstigator)
{
	super(dnDecoration).Used(Other, EventInstigator);
	// End:0x39
	if(__NFUN_170__(string(Messages), 0))
	{
		// End:0x30
		if(__NFUN_145__(bPlayingMessages))
		{
			StartPlayingMessages();			
		}
		else
		{
			StopPlayingMessages();
		}		
	}
	else
	{
		FindAndPlaySound(NoNewMessages);
	}
	__NFUN_607__(1, false, 'Reenable');
	bUsable = false;
	return;
}

function Reenable()
{
	bUsable = true;
	return;
}

function StartPlayingMessages()
{
	GlobalTrigger(StartPlayingMessagesEvent);
	bPlayingMessages = true;
	CurrentMessage = 0;
	PlayBeep();
	return;
}

function StopPlayingMessages()
{
	bPlayingMessages = false;
	bPlayingBeep = true;
	// End:0x24
	if(bUsable)
	{
		FindAndPlaySound(Beep);
	}
	__NFUN_608__('PlayBeep');
	__NFUN_608__('PlayNextMessage');
	__NFUN_608__('DonePlayingMessages');
	return;
}

function PlayBeep()
{
	local float Delay;

	bPlayingBeep = true;
	Delay = __NFUN_198__(FindAndPlaySound(Beep), 0.1);
	__NFUN_607__(Delay, false, 'PlayNextMessage');
	return;
}

function PlayNextMessage()
{
	local float Delay;

	bPlayingBeep = false;
	Delay = __NFUN_198__(FindAndPlaySound(Messages[__NFUN_184__(CurrentMessage)]), 0.1);
	// End:0x49
	if(__NFUN_172__(CurrentMessage, string(Messages)))
	{
		__NFUN_607__(Delay, false, 'PlayEndOfMessages');		
	}
	else
	{
		__NFUN_607__(Delay, false, 'PlayBeep');
	}
	return;
}

function PlayEndOfMessages()
{
	local float Delay;

	bPlayingBeep = true;
	Delay = FindAndPlaySound(EndOfMessages);
	__NFUN_607__(Delay, false, 'DonePlayingMessages');
	return;
}

function DonePlayingMessages()
{
	bPlayingMessages = false;
	bPlayingBeep = false;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local int i;

	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	i = __NFUN_166__(string(Messages), 1);
	J0x1A:

	// End:0x4C [Loop If]
	if(__NFUN_172__(i, 0))
	{
		PrecacheIndex.__NFUN_1277__(VoicePack, Messages[i]);
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x1A;
	}
	PrecacheIndex.__NFUN_1277__(VoicePack, OffTheHook);
	PrecacheIndex.__NFUN_1277__(VoicePack, EndOfMessages);
	PrecacheIndex.__NFUN_1277__(VoicePack, Beep);
	PrecacheIndex.__NFUN_1277__(VoicePack, NoNewMessages);
	return;
}

defaultproperties
{
	NoNewMessages=Phone_NoMSG
	EndOfMessages=Phone_EndMSG
	OffTheHook=Phone_OffHook
	Beep=Phone_Beep
}