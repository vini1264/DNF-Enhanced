/*******************************************************************************
 * Biology_Generic_AnusDoorFanged generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Biology_Generic_AnusDoorFanged extends Biology_Generic
	collapsecategories;

enum EAnusDoorState
{
	ANUS_Closed,
	ANUS_Opening,
	ANUS_Open,
	ANUS_Closing,
	ANUS_Locking,
	ANUS_Locked,
	ANUS_Unlocking
};

var() noexport bool bAutoOpenForAI "When true, the door will automatically open when AI get near.";
var() noexport float DamagedCloseDelay "Minimum amount of time to stay open after being damaged.";
var() noexport float CloseDelay "Minimum amount of time to stay open.";
var() noexport name OpenTag "Trigger this event to force the anus to open.";
var() noexport name CloseTag "Trigger this event to force the anus to close.";
var() noexport name PortalSurfaceTag "Tag of the AreaPortal to turn on/off when door opens/closes.";
var() noexport deprecated name OpenedEvent "Event to trigger when door has opened.";
var() bool bOpenedEventOnlyOnce;
var() noexport deprecated name ClosedEvent "Event to trigger when door begins closed.";
var() bool bClosedEventOnlyOnce;
var() noexport name LockTag "Trigger this event to lock the anus.";
var() noexport name UnlockTag "Trigger this event to unlock the anus.";
var() bool bLocked;
var Biology_Generic_AnusDoorFanged.EAnusDoorState AnusState;
var bool bInitialized;
var bool bWantsToBeOpen;
var bool SavedbUsable;
var Biology_Generic_AnusDoor_CollisionSheet CollisionSheet;

function PostVerifySelf()
{
	local int i;

	super(dnDecoration).PostVerifySelf();
	CollisionSheet = Biology_Generic_AnusDoor_CollisionSheet(FindMountedActor(, class'Biology_Generic_AnusDoor_CollisionSheet'));
	SavedbUsable = bUsable;
	// End:0x4B
	if(bLocked)
	{
		AnusState = 0;
		DecoActivity(0, 'AnusLockIdle');		
	}
	else
	{
		DecoActivity(0, 'AnusUnlockIdleClose');
		AnusState = 5;
	}
	DoorClosed();
	__NFUN_718__('OpenAnus', OpenTag);
	__NFUN_718__('CloseAnus', CloseTag);
	__NFUN_718__('UnlockAnus', UnlockTag);
	__NFUN_718__('LockAnus', LockTag);
	bInitialized = true;
	return;
}

final function TriggerFunc_LockAnus()
{
	// End:0x1E
	if(__NFUN_145__(bLocked))
	{
		FindAndPlaySound('AnusDoor_Lock', 3);
		TryPerformLock();
	}
	return;
}

final function TriggerFunc_UnlockAnus()
{
	// End:0x1C
	if(bLocked)
	{
		FindAndPlaySound('AnusDoor_UnLock', 3);
		TryPerformUnlock();
	}
	return;
}

function PlayDoorLocked()
{
	// End:0x10
	if(__NFUN_173__(int(AnusState), int(6)))
	{
		return;
	}
	FindAndPlaySound('AnusDoor_Locked', 3);
	DecoActivity(0, 'AnusLockDeny');
	return;
}

final function TriggerFunc_OpenAnus()
{
	// End:0x12
	if(bLocked)
	{
		PlayDoorLocked();		
	}
	else
	{
		TryPerformOpen(CloseDelay);
	}
	return;
}

final function TriggerFunc_CloseAnus()
{
	TryPerformClose();
	return;
}

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	super(dnDecoration).TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	// End:0x5D
	if(__NFUN_148__(__NFUN_148__(__NFUN_201__(Damage, 0), __NFUN_145__(bLocked)), __NFUN_357__(DamageType, class'MeleeDamage')))
	{
		TriggerFunc_OpenAnus();
	}
	return;
}

simulated function bool CanBeUsedBy(Pawn User)
{
	// End:0x3C
	if(__NFUN_148__(__NFUN_340__(User.Weapon, none), __NFUN_173__(int(User.Weapon.WeaponState), int(10))))
	{
		return false;
	}
	return super(InteractiveActor).CanBeUsedBy(User);
	return;
}

event Used(Actor Other, Pawn EventInstigator)
{
	super(dnDecoration).Used(Other, EventInstigator);
	// End:0x2C
	if(__NFUN_342__(EventInstigator.LastQuickAction, 'None'))
	{
		return;
	}
	// End:0x5D
	if(__NFUN_145__(bLocked))
	{
		EventInstigator.HandQuickAction('HandQuickAction_TickleAnusDoor');
		__NFUN_605__(0.5, false, 'TriggerFunc_OpenAnus');		
	}
	else
	{
		// End:0x8E
		if(__NFUN_174__(int(AnusState), int(6)))
		{
			EventInstigator.HandQuickAction('HandQuickAction_TickleAnusDoor');
			__NFUN_605__(0.5, false, 'PlayDoorLocked');
		}
	}
	return;
}

event bool ShouldDrawHUDInfoUsePhrase(Pawn TestPawn)
{
	// End:0x2B
	if(__NFUN_150__(__NFUN_150__(bLocked, __NFUN_173__(int(AnusState), int(5))), __NFUN_173__(int(AnusState), int(4))))
	{
		return false;
	}
	return super(InteractiveActor).ShouldDrawHUDInfoUsePhrase(TestPawn);
	return;
}

event Touch(Actor Other)
{
	super(dnDecoration).Touch(Other);
	// End:0x53
	if(__NFUN_148__(__NFUN_148__(__NFUN_148__(bAutoOpenForAI, Other.bIsPawn), __NFUN_145__(Other.bIsPlayerPawn)), __NFUN_145__(bLocked)))
	{
		TriggerFunc_OpenAnus();
	}
	return;
}

event UnTouch(Actor Other)
{
	super(dnDecoration).UnTouch(Other);
	// End:0x53
	if(__NFUN_148__(__NFUN_148__(__NFUN_148__(bAutoOpenForAI, Other.bIsPawn), __NFUN_145__(Other.bIsPlayerPawn)), __NFUN_145__(bLocked)))
	{
		TryPerformClose();
	}
	return;
}

final function ReAttemptOpen()
{
	TryPerformOpen(CloseDelay);
	return;
}

k2call simulated function DoorOpen()
{
	CollisionSheet.DecoActivity(0, 'UnBlockAnus');
	CollisionSheet.bBlockCamera = false;
	GlobalTrigger(OpenedEvent);
	// End:0x48
	if(bOpenedEventOnlyOnce)
	{
		OpenedEvent = 'None';
	}
	SavedbUsable = bUsable;
	bUsable = false;
	return;
}

k2call simulated function DoorClosed()
{
	CollisionSheet.DecoActivity(0, 'BlockAnus');
	CollisionSheet.bBlockCamera = true;
	// End:0x42
	if(__NFUN_342__(PortalSurfaceTag, 'None'))
	{
		__NFUN_739__(PortalSurfaceTag, false);
	}
	GlobalTrigger(ClosedEvent);
	// End:0x61
	if(bClosedEventOnlyOnce)
	{
		ClosedEvent = 'None';
	}
	bUsable = SavedbUsable;
	return;
}

final function TryPerformLock()
{
	// End:0x20
	if(__NFUN_150__(__NFUN_173__(int(AnusState), int(5)), __NFUN_173__(int(AnusState), int(4))))
	{
		return;
	}
	// End:0x44
	if(__NFUN_148__(__NFUN_174__(int(AnusState), int(0)), __NFUN_174__(int(AnusState), int(3))))
	{
		TryPerformClose();
	}
	// End:0x7D
	if(__NFUN_150__(__NFUN_150__(__NFUN_145__(bInitialized), __NFUN_170__(string(Touching), 0)), __NFUN_174__(int(AnusState), int(0))))
	{
		__NFUN_605__(0.25, false, 'TryPerformLock');
		return;
	}
	AnusState = 4;
	DecoActivity(0, 'LockAnus');
	__NFUN_606__('TryPerformLock');
	return;
}

final function TryPerformUnlock()
{
	// End:0x1E
	if(bLocked)
	{
		AnusState = 6;
		DecoActivity(0, 'UnlockAnus');
	}
	return;
}

final function TryPerformOpen(float StayOpenTime)
{
	bWantsToBeOpen = true;
	// End:0x33
	if(__NFUN_150__(__NFUN_145__(bInitialized), __NFUN_174__(int(AnusState), int(0))))
	{
		__NFUN_605__(0.25, false, 'ReAttemptOpen');
		return;
	}
	bDrawUsePhrase = false;
	AnusState = 1;
	DecoActivity(0, 'OpenUnlockAnus');
	// End:0x69
	if(__NFUN_342__(PortalSurfaceTag, 'None'))
	{
		__NFUN_739__(PortalSurfaceTag, true);
	}
	return;
}

final function TryPerformClose()
{
	bWantsToBeOpen = false;
	__NFUN_606__('ReAttemptOpen');
	// End:0x49
	if(__NFUN_150__(__NFUN_150__(__NFUN_145__(bInitialized), __NFUN_174__(int(AnusState), int(2))), __NFUN_170__(string(Touching), 0)))
	{
		__NFUN_605__(0.25, false, 'TryPerformClose');
		return;
	}
	CollisionSheet.DecoActivity(0, 'BlockAnus');
	CollisionSheet.bBlockCamera = true;
	AnusState = 3;
	DecoActivity(0, 'CloseUnlockAnus');
	__NFUN_606__('TryPerformClose');
	return;
}

simulated event AnimEndEx(SAnimEndInfo AnimEndInfo)
{
	super(dnDecoration).AnimEndEx(AnimEndInfo);
	// End:0x80
	if(__NFUN_150__(__NFUN_341__(AnimEndInfo.AnimName, 'unlocked_close'), __NFUN_341__(AnimEndInfo.AnimName, 'locked_to_unlocked')))
	{
		// End:0x54
		if(__NFUN_341__(AnimEndInfo.AnimName, 'locked_to_unlocked'))
		{
			bLocked = false;
		}
		AnusState = 0;
		DecoActivity(0, 'AnusUnlockIdleClose');
		// End:0x7D
		if(bWantsToBeOpen)
		{
			TryPerformOpen(CloseDelay);
		}		
	}
	else
	{
		// End:0xCB
		if(__NFUN_341__(AnimEndInfo.AnimName, 'unlocked_open'))
		{
			AnusState = 2;
			DecoActivity(0, 'AnusUnlockIdleOpen');
			bDrawUsePhrase = default.bDrawUsePhrase;
			// End:0xC8
			if(__NFUN_145__(bWantsToBeOpen))
			{
				TryPerformClose();
			}			
		}
		else
		{
			// End:0x100
			if(__NFUN_341__(AnimEndInfo.AnimName, 'unlocked_to_locked'))
			{
				AnusState = 5;
				DecoActivity(0, 'AnusLockIdle');
				bLocked = true;				
			}
			else
			{
				// End:0x122
				if(__NFUN_341__(AnimEndInfo.AnimName, 'locked_closed_deny'))
				{
					DecoActivity(0, 'AnusLockIdle');
				}
			}
		}
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1277__(VoicePack, 'AnusDoor_Fang');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'AnusDoor_Lock');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'AnusDoor_Locked');
	PrecacheIndex.__NFUN_1277__(VoicePack, 'AnusDoor_UnLock');
	PrecacheIndex.__NFUN_1281__('HandQuickAction_TickleAnusDoor');
	PrecacheIndex.__NFUN_1277__(class'VoicePack_Duke', 'ST_Getup_StandShift');
	return;
}

defaultproperties
{
	DamagedCloseDelay=5
	CloseDelay=2
	bLocked=true
	DecoActivities_Default=/* Array type was not detected. */
}