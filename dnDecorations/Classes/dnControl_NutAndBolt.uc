/*******************************************************************************
 * dnControl_NutAndBolt generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnControl_NutAndBolt extends dnControl
	collapsecategories;

var int NutIndex;
var dnControlHelper_NutAndBolt_Nut Nut;

function PostBeginPlay()
{
	super(dnUsableSomething).PostBeginPlay();
	Nut = dnControlHelper_NutAndBolt_Nut(FindMountedActor('Nut'));
	// End:0x66
	if(__NFUN_340__(Nut, none))
	{
		Nut.bTraceUsable = false;
		Nut.bDoOverlayEffect = bDoOverlayEffect;
		Nut.OverlayMaterial = OverlayMaterial;
	}
	return;
}

simulated function AttachPawnSuccess(Pawn Attachee, optional bool bForced)
{
	super.AttachPawnSuccess(Attachee, bForced);
	// End:0x37
	if(__NFUN_340__(Nut, none))
	{
		Nut.FadeOverlayEffect(0, 1);
	}
	return;
}

simulated function DetachComplete()
{
	super.DetachComplete();
	// End:0x2C
	if(__NFUN_340__(Nut, none))
	{
		Nut.FadeOverlayEffect(1, 1);
	}
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1281__('NutAndBolt_Deactivate1');
	PrecacheIndex.__NFUN_1281__('NutAndBolt_Deactivate2');
	PrecacheIndex.__NFUN_1281__('NutAndBolt_Deactivate3');
	return;
}

state() Useable
{
	simulated function bool CanBeUsedBy(Pawn User)
	{
		return __NFUN_146__(Nut.bHidden, false);
		return;
	}
	stop;
}

state() AttachUser
{
	event BeginState()
	{
		ControlEvent(, __NFUN_343__(__NFUN_302__(string('State'), string(NutIndex))));
		super(Object).BeginState();
		return;
	}
	stop;
}

state() AttachUser1
{	stop;
}

state() AttachUser2
{	stop;
}

state() AttachUser3
{	stop;
}

state() DetachUser
{
	event BeginState()
	{
		States[CurrentStateIndex].UserAnimName = __NFUN_343__(__NFUN_302__(string('NutAndBolt_Deactivate'), string(NutIndex)));
		super(Object).BeginState();
		return;
	}
	stop;
}

state IdleBase
{
	simulated function PlayMyAnim()
	{
		// End:0x24
		if(__NFUN_340__(Nut, none))
		{
			Nut.PlayIdle(__NFUN_166__(NutIndex, 1));
		}
		return;
	}

	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		SetHUDKeyInfoState(HUD, 2, true, 7);
		SetHUDKeyInfoState(HUD, 3, true, 8);
		return;
	}
	stop;
}

state() idle
{
	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		SetHUDKeyInfoState(HUD, 2, true, 7);
		SetHUDKeyInfoState(HUD, 3, true, 8);
		return;
	}

	event BeginState()
	{
		ControlEvent(, __NFUN_343__(__NFUN_302__(string('State'), string(NutIndex))));
		return;
	}
	stop;
}

state() Idle1 extends IdleBase
{	stop;
}

state() Idle2 extends IdleBase
{	stop;
}

state() Idle3 extends IdleBase
{	stop;
}

state TurnLeftBase
{
	simulated function PlayMyAnim()
	{
		// End:0x24
		if(__NFUN_340__(Nut, none))
		{
			Nut.PlayTurnLeft(__NFUN_166__(NutIndex, 1));
		}
		return;
	}

	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

state() TurnLeft1 extends TurnLeftBase
{
	event EndState()
	{
		NutIndex = 2;
		return;
	}
	stop;
}

state() TurnLeft2 extends TurnLeftBase
{
	event EndState()
	{
		NutIndex = 3;
		return;
	}
	stop;
}

state() TurnLeft3 extends TurnLeftBase
{
	event BeginState()
	{
		super(Object).BeginState();
		DetachPawnSuccess(false);
		return;
	}

	event EndState()
	{
		local dnDecoration NewNut;

		SetUseable(false);
		// End:0x114
		if(__NFUN_340__(Nut, none))
		{
			NewNut = __NFUN_615__(class'dnControlHelper_NutAndBolt_Nut');
			NewNut.__NFUN_645__(Nut.MeshInstance.__NFUN_533__('Root', true));
			NewNut.__NFUN_620__(__NFUN_195__(Nut.DrawScale, NewNut.default.CollisionRadius), __NFUN_195__(Nut.DrawScale, NewNut.default.CollisionHeight));
			NewNut.__NFUN_591__(Nut.DrawScale);
			NewNut.__NFUN_621__(true, false, false, true, true);
			NewNut.__NFUN_642__(18);
			NewNut.bNoNativeTick = false;
			NewNut.TickStyle = 2;
			NewNut.__NFUN_817__();
			Nut.__NFUN_590__(true);
		}
		return;
	}
	stop;
}

state TurnRightBase
{
	simulated function PlayMyAnim()
	{
		// End:0x24
		if(__NFUN_340__(Nut, none))
		{
			Nut.PlayTurnRight(__NFUN_166__(NutIndex, 1));
		}
		return;
	}

	simulated function UsableSomethingQueryInteractKeyInfoState(HUD HUD)
	{
		return;
	}
	stop;
}

state() TurnRight1 extends TurnRightBase
{	stop;
}

state() TurnRight2 extends TurnRightBase
{
	event EndState()
	{
		NutIndex = 1;
		return;
	}
	stop;
}

state() TurnRight3 extends TurnRightBase
{
	event EndState()
	{
		NutIndex = 2;
		return;
	}
	stop;
}

defaultproperties
{
	NutIndex=1
	States=/* Array type was not detected. */
}