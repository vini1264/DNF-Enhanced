/*******************************************************************************
 * TriggerConstrain generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerConstrain extends Triggers
	collapsecategories
	notplaceable
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

struct SConstrainedActor
{
	var() KarmaActor A;
	var() KConstraint C;
};

var() noexport deprecated KarmaActor Parent "The actor we want to constrain to.  If none, will attempt to find using ParentTag.";
var() noexport deprecated name ParentTag "The tag of the KarmaActor we want to constraint to.  Ignored if Parent is not None.";
var() noexport name ParentConstraintBoneName "The name of the bone to constrain to on Parent.";
var() noexport deprecated name TagLookup "If set, KarmaActors must have this Tag will be elligible for constraining.";
var() noexport deprecated Actor TouchingLookup "If set, KarmaActors must touch this Actor will be elligible for constraining.  If none, will attempt to find using TouchingLookupTag.";
var() noexport deprecated name TouchingLookupTag "Tag of the Actor to use for TouchingLookup.  Ignored if TouchingLookup is not None.";
var() noexport name ConstraintBoneName "Name of the bone to constrain on the KarmaActors we constrain to parent.";
var() noexport deprecated name ForceConstrainTag "Trigger this event to constrain all elligible KarmaActors.";
var() noexport deprecated name ForceUnConstrainTag "Trigger this event to unconstraint all constrained KarmaActors.";
var() noexport class<KConstraint> ConstraintType "Type of constraint to use.";
var array<SConstrainedActor> ConstrainedActors;

event PreBeginPlay()
{
	__NFUN_718__('ConstrainActors', ForceConstrainTag);
	__NFUN_718__('UnConstrainActors', ForceUnConstrainTag);
	return;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
	super(Actor).Trigger(Other, EventInstigator);
	// End:0x25
	if(__NFUN_170__(string(ConstrainedActors), 0))
	{
		TriggerFunc_UnConstrainActors();		
	}
	else
	{
		TriggerFunc_ConstrainActors();
	}
	return;
}

final simulated function TriggerFunc_ConstrainActors()
{
	local KarmaActor A;
	local int i;

	// End:0x12
	if(__NFUN_170__(string(ConstrainedActors), 0))
	{
		TriggerFunc_UnConstrainActors();
	}
	// End:0x72
	if(__NFUN_339__(ConstraintType, none))
	{
		Warn(__NFUN_302__(string(self), ":TriggerFunc_ConstrainActors - Failed because ConstraintType is None."));
		return;
	}
	// End:0x9D
	if(__NFUN_342__(ParentTag, 'None'))
	{
		Parent = KarmaActor(FindAnyActor(class'KarmaActor', ParentTag));
	}
	// End:0xC7
	if(__NFUN_148__(__NFUN_340__(Parent, none), __NFUN_145__(Parent.bBlockKarma)))
	{
		Parent = none;
	}
	// End:0x11F
	if(__NFUN_339__(Parent, none))
	{
		Warn(__NFUN_302__(string(self), ":TriggerFunc_ConstrainActors - Failed because Parent is None."));
		return;
	}
	// End:0x14F
	if(__NFUN_148__(__NFUN_342__(TouchingLookupTag, 'None'), __NFUN_339__(TouchingLookup, none)))
	{
		TouchingLookup = FindAnyActor(, TouchingLookupTag);
	}
	// End:0x1D6
	if(__NFUN_340__(TouchingLookup, none))
	{
		// End:0x1D2
		foreach TouchingLookup.__NFUN_749__(class'KarmaActor', A)
		{
			// End:0x1D1
			if(__NFUN_173__(int(A.Physics), int(18)))
			{
				// End:0x1D1
				if(__NFUN_150__(__NFUN_341__(TagLookup, 'None'), __NFUN_341__(A.Tag, TagLookup)))
				{
					ConstrainedActors[ConstrainedActors.Add(1)].A = A;
				}
			}			
		}				
	}
	else
	{
		// End:0x22D
		if(__NFUN_342__(TagLookup, 'None'))
		{
			// End:0x22C
			foreach __NFUN_747__(class'KarmaActor', A, TagLookup)
			{
				// End:0x22B
				if(__NFUN_173__(int(A.Physics), int(18)))
				{
					ConstrainedActors[ConstrainedActors.Add(1)].A = A;
				}				
			}			
		}
	}
	i = 0;
	J0x234:

	// End:0x35C [Loop If]
	if(__NFUN_169__(i, string(ConstrainedActors)))
	{
		ConstrainedActors[i].C = __NFUN_615__(ConstraintType,,, ConstrainedActors[i].A.Location, ConstrainedActors[i].A.Rotation);
		ConstrainedActors[i].C.__NFUN_642__(0);
		ConstrainedActors[i].C.KConstraintActor1 = ConstrainedActors[i].A;
		ConstrainedActors[i].C.KConstraintActor2 = Parent;
		ConstrainedActors[i].C.KConstraintActor1Bone = ConstraintBoneName;
		ConstrainedActors[i].C.KConstraintActor2Bone = ParentConstraintBoneName;
		ConstrainedActors[i].C.__NFUN_642__(18);
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x234;
	}
	return;
}

final simulated function TriggerFunc_UnConstrainActors()
{
	J0x00:
	// End:0x54 [Loop If]
	if(__NFUN_170__(string(ConstrainedActors), 0))
	{
		// End:0x49
		if(__NFUN_340__(ConstrainedActors[0].C, none))
		{
			ConstrainedActors[0].C.__NFUN_642__(0);
			ConstrainedActors[0].C.__NFUN_614__();
		}
		ConstrainedActors.Remove(0, 1);
		// [Loop Continue]
		goto J0x00;
	}
	return;
}

defaultproperties
{
	ConstraintType='KFixed'
}