/*******************************************************************************
 * dnDecoration_Gibs generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class dnDecoration_Gibs extends dnDecoration
	abstract
	collapsecategories;

struct SGibProperties
{
	var() noexport Object RenderObject "Objects to select from for our display property. (StaticMesh, Mesh, Texture)";
	var() noexport bool bForcedOnly "Means this gib isn't available for random selection. Can only show up with ForcedIndex";
};

var(dnGibbing) noexport array<SGibProperties> Gibs "The list of available gibs and their individual properties.";
var(dnGibbing) noexport bool bPermanent "If true, then this gib won't set the timer to remove itself from the level.";
var(dnGibbing) noexport float SurvivalTime "Default survival time before trying to remove itself. Time of 0 never removes itself.";
var(dnGibbing) noexport float SurvivalTimeVariance "Amount of time to vary the survival time by.";
var(dnGibbing) noexport int ForcedIndex "If this is >= 0 then it will force the gib to use the Object specified in this index instead of picking randomly.";
var float CollisionChance;

function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x2E
	if(__NFUN_201__(CollisionChance, 0))
	{
		// End:0x29
		if(__NFUN_201__(__NFUN_222__(), CollisionChance))
		{
			__NFUN_812__(2);			
		}
		else
		{
			__NFUN_812__(8);
		}
	}
	return;
}

simulated event PostSpawnDestroyedActorPool()
{
	// End:0x1A
	if(IsDestroyedActorPool())
	{
		Level.NoteSpawnedGib(self);
	}
	return;
}

function bool VerifySelf()
{
	local int i, Index;

	i = __NFUN_166__(string(Gibs), 1);
	J0x0F:

	// End:0x47 [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x3D
		if(__NFUN_339__(Gibs[i].RenderObject, none))
		{
			Gibs.Remove(i, 1);
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x0F;
	}
	// End:0xA5
	if(__NFUN_171__(string(Gibs), 0))
	{
		InvalidAlert(__NFUN_302__(__NFUN_302__("Gib:", string(self)), " was destroyed because it had no Gib RenderObjects to set."));
		return false;
	}
	// End:0xBE
	if(__NFUN_172__(ForcedIndex, 0))
	{
		Index = ForcedIndex;		
	}
	else
	{
		Index = GetRandomGib();
	}
	// End:0x153
	if(__NFUN_150__(__NFUN_169__(Index, 0), __NFUN_172__(Index, string(Gibs))))
	{
		InvalidAlert(__NFUN_302__(__NFUN_302__("Gib:", string(self)), " was destroyed because couldn't find a valid Index in the list of Gib RenderObjects."));
		return false;
	}
	__NFUN_595__(Gibs[Index].RenderObject);
	Gibs.Remove(0, string(Gibs));
	// End:0x19E
	if(__NFUN_145__(IsDestroyedActorPool()))
	{
		// End:0x19E
		if(__NFUN_145__(bPermanent))
		{
			__NFUN_607__(__NFUN_226__(SurvivalTime, SurvivalTimeVariance), true, 'CheckRemoval');
		}
	}
	return super(Actor).VerifySelf();
	return;
}

simulated event ResumeCallbackTimerDestroyedActorPool()
{
	// End:0x29
	if(IsDestroyedActorPool())
	{
		// End:0x29
		if(__NFUN_145__(bPermanent))
		{
			__NFUN_607__(__NFUN_226__(SurvivalTime, SurvivalTimeVariance), true, 'CheckRemoval');
		}
	}
	return;
}

final function int GetRandomGib()
{
	local int i, TestIndex, Result;

	i = 0;
	Result = -1;
	TestIndex = __NFUN_187__(string(Gibs));
	J0x20:

	// End:0x89 [Loop If]
	if(__NFUN_148__(__NFUN_169__(i, string(Gibs)), __NFUN_169__(Result, 0)))
	{
		// End:0x61
		if(__NFUN_145__(Gibs[TestIndex].bForcedOnly))
		{
			Result = TestIndex;			
		}
		else
		{
			__NFUN_184__(i);
			__NFUN_184__(TestIndex);
			// End:0x86
			if(__NFUN_172__(TestIndex, string(Gibs)))
			{
				TestIndex = 0;
			}
		}
		// [Loop Continue]
		goto J0x20;
	}
	return Result;
	return;
}

final function CheckRemoval()
{
	// End:0x0B
	if(__NFUN_145__(__NFUN_724__()))
	{
		__NFUN_614__();
	}
	return;
}

event PhysicsChange(optional Engine.Object.EPhysics PreviousPhysics)
{
	super(KarmaActor).PhysicsChange(PreviousPhysics);
	bNoNativeTick = default.bNoNativeTick;
	return;
}

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	local int i;

	super.RegisterPrecacheComponents(PrecacheIndex);
	// End:0x76
	if(__NFUN_169__(ForcedIndex, 0))
	{
		i = __NFUN_166__(string(Gibs), 1);
		J0x25:

		// End:0x73 [Loop If]
		if(__NFUN_172__(i, 0))
		{
			// End:0x69
			if(__NFUN_145__(Gibs[i].bForcedOnly))
			{
				PrecacheIndex.__NFUN_1267__(Primitive(Gibs[i].RenderObject), self);
			}
			__NFUN_185__(i);
			// [Loop Continue]
			goto J0x25;
		}		
	}
	else
	{
		// End:0xA9
		if(__NFUN_169__(ForcedIndex, string(Gibs)))
		{
			PrecacheIndex.__NFUN_1267__(Primitive(Gibs[ForcedIndex].RenderObject), self);
		}
	}
	return;
}

defaultproperties
{
	SurvivalTime=20
	SurvivalTimeVariance=10
	ForcedIndex=-1
	HealthPrefab=0
	bDrawHUDInfo=false
	bNoUseKeyInfo=true
	bIgnoreVehicles=true
	bTickOnlyWhenPhysicsAwake=true
	DynamicInteractionClassification=2
	bCollisionAssumeValid=true
	bBlockPlayers=false
	bIsDestroyedActorPool=true
	bGibActor=true
	bNoNativeTick=true
	bTickOnlyRecent=false
	CollisionRadius=1
	CollisionHeight=1
	RemoteRole=0
}