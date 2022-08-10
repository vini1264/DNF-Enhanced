/*******************************************************************************
 * Electronics_Generic_TV generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Electronics_Generic_TV extends Electronics_Generic
	abstract
	collapsecategories
	dependson(DecoGlass_TV_FlatScreen);

var() noexport bool bUnBreakable "If true, this TV cannot be broken.";
var() noexport array<SChannelInfo> Channels "List of channels available to this TV.";
var() noexport int CurrentChannel "Channel the TV is currently showing.";
var() noexport MaterialEx OffTex "Texture to use for when the TV is in the off state.";
var() noexport MaterialEx BrokenTex "Texture to use for the glass when it's broken.";
var() noexport name TVLightTag "Tag of the LightEx to use for light coming from this TV.";
var() noexport SChannelInfo NoReceptionInfo "Settings for a channel with no reception.";
var DecoGlass_TV_FlatScreen GlassActor;
var LightEx LightActor;
var Color OffGlassColor;
var int LastChannel;

function PostVerifySelf()
{
	local int i;
	local SmackerTexture ShowSmack;

	// End:0x13
	if(__NFUN_170__(string(Channels), 0))
	{
		__NFUN_184__(CurrentChannel);
	}
	Channels.Insert(0, 1);
	Channels[0] = NoReceptionInfo;
	// End:0x39
	if(bUnBreakable)
	{
		HealthPrefab = 0;
	}
	i = __NFUN_166__(string(Channels), 1);
	J0x48:

	// End:0xF7 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		ShowSmack = SmackerTexture(Channels[i].ShowSmack);
		// End:0x8B
		if(__NFUN_340__(ShowSmack, none))
		{
			ShowSmack.SetLoop(true);
		}
		// End:0xBB
		if(__NFUN_204__(Channels[i].StationFOV, 0))
		{
			Channels[i].StationFOV = CameraFOV;
		}
		// End:0xED
		if(__NFUN_204__(__NFUN_252__(Channels[i].RenderTargetNormal), 0))
		{
			Channels[i].RenderTargetNormal = MirrorNormal;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x48;
	}
	i = Channels.Add(1);
	Channels[i].ShowSmack = OffTex;
	super(dnDecoration).PostVerifySelf();
	i = __NFUN_166__(string(Channels), 1);
	J0x12F:

	// End:0x188 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x17E
		if(__NFUN_342__(Channels[i].StationTag, 'None'))
		{
			Channels[i].StationSpecialEventID = __NFUN_718__('ChangeChannel', Channels[i].StationTag);
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x12F;
	}
	GlassActor = DecoGlass_TV_FlatScreen(FindMountedActor('Glass'));
	// End:0x215
	if(__NFUN_340__(GlassActor, none))
	{
		GlassActor.bUnBreakable = bUnBreakable;
		GlassActor.TVActor = self;
		// End:0x215
		if(__NFUN_340__(BrokenTex, none))
		{
			GlassActor.__NFUN_741__(1, BrokenTex);
			GlassActor.__NFUN_741__(2, BrokenTex);
			GlassActor.RecalculateRenderBox();
		}
	}
	LightActor = LightEx(FindActor(class'LightEx', TVLightTag));
	// End:0x2D9
	if(__NFUN_340__(LightActor, none))
	{
		i = __NFUN_166__(string(Channels), 2);
		J0x24C:

		// End:0x2D9 [Loop If]
		if(__NFUN_172__(i, 0))
		{
			// End:0x2CF
			if(__NFUN_148__(__NFUN_148__(__NFUN_173__(int(Channels[i].ShowColor.R), 0), __NFUN_173__(int(Channels[i].ShowColor.G), 0)), __NFUN_173__(int(Channels[i].ShowColor.B), 0)))
			{
				Channels[i].ShowColor = LightActor.LightColor;
			}
			__NFUN_185__(i);
			// [Loop Continue]
			goto J0x24C;
		}
	}
	// End:0x2EB
	if(bStartupDestroyed)
	{
		Destroyed();		
	}
	else
	{
		UpdateChannel();
	}
	return;
}

function StartSelfOff()
{
	CurrentChannel = __NFUN_166__(string(Channels), 1);
	UpdateChannel();
	return;
}

function ForcePowerOff()
{
	super.ForcePowerOff();
	LastChannel = CurrentChannel;
	CurrentChannel = __NFUN_166__(string(Channels), 1);
	UpdateChannel();
	return;
}

function ForcePowerOn()
{
	super.ForcePowerOn();
	// End:0x1B
	if(__NFUN_174__(CurrentChannel, __NFUN_166__(string(Channels), 1)))
	{
		return;
	}
	LastChannel = CurrentChannel;
	CurrentChannel = 0;
	UpdateChannel();
	return;
}

final simulated function TriggerFunc_ChangeChannel()
{
	local Actor Other;
	local Pawn EventInstigator;
	local int i, SpecialEventID;

	// End:0x0D
	if(__NFUN_145__(CanTrigger()))
	{
		return;
	}
	__NFUN_720__(Other, EventInstigator, SpecialEventID);
	i = __NFUN_166__(string(Channels), 1);
	J0x2E:

	// End:0x7B [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x71
		if(__NFUN_173__(Channels[i].StationSpecialEventID, SpecialEventID))
		{
			LastChannel = CurrentChannel;
			CurrentChannel = i;
			UpdateChannel();
			return;
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x2E;
	}
	return;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
	local int i;

	super(dnDecoration).Trigger(Other, EventInstigator);
	// End:0x1D
	if(__NFUN_145__(CanTrigger()))
	{
		return;
	}
	ChangeChannel();
	return;
}

final function ChangeChannel()
{
	// End:0x0E
	if(__NFUN_171__(string(Channels), 0))
	{
		return;
	}
	LastChannel = CurrentChannel;
	__NFUN_184__(CurrentChannel);
	// End:0x37
	if(__NFUN_172__(CurrentChannel, string(Channels)))
	{
		CurrentChannel = 0;
	}
	UpdateChannel();
	return;
}

final function UpdateChannel()
{
	local int CurrentFrame, Offset;

	DecoActivity(0, 'ChangeChannel');
	// End:0x155
	if(__NFUN_340__(GlassActor, none))
	{
		// End:0x51
		if(__NFUN_340__(Channels[CurrentChannel].ShowSmack, none))
		{
			GlassActor.__NFUN_741__(0, Channels[CurrentChannel].ShowSmack);			
		}
		else
		{
			GlassActor.__NFUN_741__(0, Channels[CurrentChannel].ShowOffTex);
		}
		// End:0x9D
		if(__NFUN_339__(GlassActor.__NFUN_740__(0), OffTex))
		{
			GlassActor.bUnlit = false;			
		}
		else
		{
			GlassActor.bUnlit = true;
		}
		__NFUN_701__(none);
		StopSoundInfo(Channels[LastChannel].ShowSound);
		StopSoundInfo(Channels[LastChannel].ShowOffSound);
		// End:0x127
		if(__NFUN_340__(Channels[CurrentChannel].ShowSmack, none))
		{
			PlaySoundInfo(1, Channels[CurrentChannel].ShowSound);
			PlayAmbientSoundInfo(Channels[CurrentChannel].ShowSoundAmbient);			
		}
		else
		{
			PlaySoundInfo(1, Channels[CurrentChannel].ShowOffSound);
			PlayAmbientSoundInfo(Channels[CurrentChannel].ShowOffSoundAmbient);
		}
	}
	// End:0x1BB
	if(__NFUN_340__(LightActor, none))
	{
		// End:0x19B
		if(__NFUN_340__(Channels[CurrentChannel].ShowSmack, none))
		{
			LightActor.LightColor = Channels[CurrentChannel].ShowColor;			
		}
		else
		{
			LightActor.LightColor = Channels[CurrentChannel].ShowOffColor;
		}
	}
	CameraActor = Channels[CurrentChannel].StationCamera;
	CameraFOV = Channels[CurrentChannel].StationFOV;
	MirrorRenderTarget = Channels[CurrentChannel].RenderTargetTexture;
	MirrorNormal = Channels[CurrentChannel].RenderTargetNormal;
	GlobalTrigger(Channels[CurrentChannel].StationEvent);
	return;
}

final function ModifyChannel(int ChannelIndex, optional SChannelInfo NewChannelInfo, optional bool bNoReception)
{
	// End:0x1F
	if(__NFUN_150__(__NFUN_169__(ChannelIndex, 0), __NFUN_172__(ChannelIndex, string(Channels))))
	{
		return;
	}
	// End:0x3C
	if(bNoReception)
	{
		Channels[ChannelIndex] = NoReceptionInfo;		
	}
	else
	{
		Channels[ChannelIndex] = NewChannelInfo;
	}
	UpdateChannel();
	return;
}

final function GlassDamaged()
{
	// End:0x1E
	if(__NFUN_340__(GlassActor, none))
	{
		GlassActor.bUnlit = false;
	}
	CriticalDamage();
	return;
}

function Destroyed()
{
	Channels.Empty();
	__NFUN_701__(none);
	// End:0x34
	if(__NFUN_340__(GlassActor, none))
	{
		GlassActor.CrackSelf();
		GlassActor.__NFUN_822__(self);
	}
	// End:0x4D
	if(__NFUN_340__(LightActor, none))
	{
		LightActor.__NFUN_614__();
	}
	super(dnDecoration).Destroyed();
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local int i;

	super(dnDecoration).RegisterPrecacheComponents(PrecacheIndex);
	RegisterChannelInfoPrecacheComponents(PrecacheIndex, NoReceptionInfo);
	i = __NFUN_166__(string(Channels), 1);
	J0x2A:

	// End:0x55 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		RegisterChannelInfoPrecacheComponents(PrecacheIndex, Channels[i]);
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x2A;
	}
	return;
}

defaultproperties
{
	OffTex='dt_masking.Glass_Materials.glassdirty1bc_dif'
	BrokenTex='dt_masking.Glass_Materials.glassdirty1bc_dif'
	NoReceptionInfo=(ShowSmack='dt_effects.tv_static',ShowSound=(bAllowRepeats=false,bPlayAsAmbient=false,MixerGroupOverride=None,SimpleSingleSound=none,Sounds=/* Array type was not detected. */),SlotPriority=0,VolumePrefab=0,Slots=/* Array type was not detected. */)
	DecoActivities_Default=/* Array type was not detected. */
	X=/* Unknown default property type! */
	
/* Exception thrown while deserializing Engine
System.ArgumentOutOfRangeException: Length cannot be less than zero.
Parameter name: length
   at System.String.Substring(Int32 startIndex, Int32 length)
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 578 */
}