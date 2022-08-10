/*******************************************************************************
 * LevelInfo generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class LevelInfo extends ZoneInfo
	native
	config
	collapsecategories
	notplaceable
	dependson(CorpseBase)
	dependson(BinkTexture)
	dependson(Canvas)
	dependson(HUD)
	dependson(SmackerTexture)
	dependson(GameInfo)
	dependson(MapList)
	hidecategories(Lighting,LightColor,Filter,Interactivity,Karma,Networking,Sound);

cpptext
{
// Stripped
}

enum ELevelAction
{
	LEVACT_None,
	LEVACT_Loading,
	LEVACT_LoadingNoLogo,
	LEVACT_Saving,
	LEVACT_Connecting,
	LEVACT_Precaching,
	LEVACT_Failure
};

enum ENetMode
{
	NM_Standalone,
	NM_DedicatedServer,
	NM_ListenServer,
	NM_Client
};

enum EPhysicsProximityDetection
{
	PHYSPROX_None,
	PHYSPROX_AABB_Deprecated,
	PHYSPROX_Sphere_Deprecated,
	PHYSPROX_SweepPrune_Deprecated,
	PHYSPROX_ShockAndAwe,
	PHYSPROX_Default
};

enum EAISoundInfoType
{
	EAISOUNDINFO_Alert,
	EAISOUNDINFO_AmbientIdle
};

struct SLevelInfoAIPathInfo
{
	var() noexport class<BaseAI> ActorClass "If not null, we will look at this actors default collision width and height, along with draw scale and path ID set below, to generate pathing size, If NULL we use the info in StandardPathInfo to generate pathing.";
	var() noexport float ActorDrawScale "If ActorClass is not NULL we will use this draw scale to calculate pathing size. If ActorClassis NULL this will be ignored. Use this if you are scaling or shrinking the ";
	var() noexport name ActorPathID "If ActorClass is not NULL we will use this PathID. If ActorID is NULL we will use the PathID inside StandardPathInfo.";
	var() noexport SAIPathInfo StandardPathInfo "If ActorClass is NULL we will use the path info filled out here for your additional path systems.";
};

struct SPathPerfInfo
{
	var float Path_PreStaticPath;
	var float Path_PostStaticPath;
	var float Path_GenerateStaticPath;
	var float Path_FinalizeNextPathPos;
	var int Cycles;
};

struct SAIGateInfo
{
	var() name GateName;
	var() float GateTime;
	var() float GateMinInterval;
	var() Actor LastInstigator;
};

struct SLevelTransitionInfo
{
	var string LevelName;
	var int NumSaves;
	var int NumLoads;
	var string GameState;
};

struct SAISoundInfo
{
	var() LevelInfo.EAISoundInfoType SoundType;
	var() float MinInterval;
	var float Gate;
};

struct SAITeamDialogInfoEntry
{
	var() noexport name SoundName "VoicePack entry to play for this team dialog entry.";
	var() noexport float MinInterval "Frequency of sound.";
	var float Gate;
};

struct SAITeamDialogInfo
{
	var() noexport array<SAITeamDialogInfoEntry> Entries "List of team dialog entries.  One for each EDialog type in pawn.";
};

struct SAudioMixerOverride
{
	var() name id;
	var() float Volume;
	var() float Time;
	var() float StartVolume;
	var() float TargetVolume;
	var() float TransitionTime;
	var() float AutoRestoreTime;
	var() float AutoRestoreTransitionTime;
};

struct SAudioMixerGroup
{
	var() name Name;
	var() float Volume;
	var() array<int> ActiveSamples;
	var() array<int> ActiveStreams;
	var() array<SAudioMixerOverride> Overrides;
};

struct SAudioMixerGroupAutoDuck
{
	var() noexport name Name "Group name to auto duck.";
	var() noexport float DuckVolume "Volume to duck to.";
	var() noexport float DuckTime "Time it takes to duck.";
	var() noexport float UnDuckTime "Time it takes to unduck.  If <= 0.0, will use DuckTime";
};

struct SAudioMixerAutoDuckRule
{
	var() noexport name id "Used as OverrideID when ducking.  Must be set or the auto duck will not function.";
	var bool bDucking;
	var() noexport array<name> TestGroups "List of MixerGroups to check for sounds within.  As long as there is at least 1 sound active in 1 of the TestGroups, the auto duck is active.";
	var() noexport array<SAudioMixerGroupAutoDuck> DuckGroups "List of MixerGroups to automatically duck.. and information about how to duck them.";
};

struct DelayedHurtRadius
{
	var Actor Victim;
	var Actor DamageInstigator;
	var float DamageAmount;
	var Vector RelativeDamageOrigin;
	var float DamageRadius;
	var float DamageFalloffStart;
	var class<DamageType> DamageType;
	var Vector DamageStart;
	var bool bIgnoreDrawScale;
	var float RelativeScale;
	var int DamageTime;
};

struct DelayedTraceFireDamage
{
	var CorpseBase Corpse;
	var Actor SourceActor;
	var class<TraceDamageType> TraceDamageType;
	var Vector SourceTraceOrigin;
	var Vector HitLocation;
	var Vector HitNormal;
	var name HitBoneName;
	var bool bExtentTrace;
	var int DamageTime;
};

struct SCleanupActorEntry
{
	var Actor Actor;
	var float SpawnTime;
	var float Weight;
};

struct OverridePlayerClassMapping
{
	var() class<PlayerPawn> OriginalClass;
	var() class<PlayerPawn> NewClass;
};

var Level XLevel;
var() float TimeDilation;
var const int LevelTickStamp;
var float TimeSeconds;
var float TimeDeltaSeconds;
var float GameTimeSeconds;
var float TotalGameTimeSeconds;
var float SessionSeconds;
var float TotalTimeSeconds;
var transient int Year;
var transient int Month;
var transient int Day;
var transient int DayOfWeek;
var transient int Hour;
var transient int Minute;
var transient int Second;
var transient int Millisecond;
var() localized string Title;
var string MapFileName;
var() string Author;
var() localized string IdealPlayerCount;
var() int RecommendedEnemies;
var() int RecommendedTeammates;
var() localized string LocationName;
var() localized string LevelEnterText;
var() string LocalizedPkg;
var() noexport name DefaultGroupName "This will be the initial group that every newly created Actor will become part of.";
var string Pauser;
var LevelSummary Summary;
var string VisibleGroups;
var() noexport string PatchLayerGroup "Current group name where patch layer data will be stored.";
var() noexport SmackerTexture LevelEnterSmacker "Smacker to play as an introduction for this level.";
var float LevelEnterSmackerWarmup;
var bool bActiveBinkEndCredits;
var bool bActiveBinkSkippable;
var BinkTexture ActiveBink;
var float ActiveBinkAlpha;
var float ActiveBinkAlphaFadeRate;
var name ActiveBinkCompleteEvent;
var MaterialEx FilmGrainMaterial;
var MaterialEx BlackWhiteMaterial;
var MaterialEx MenuBackgroundMaterial;
var() bool InstaGib;
var() bool BlackWhiteRender;
var() bool MirroredRender;
var() float GameSpeedModifier;
var() float HeadScaleModifier;
var() bool ClassicFreezeRay;
var() bool bLonePlayer;
var bool bBegunPlay;
var bool bPlayersOnly;
var bool bDropDetail;
var bool bAggressiveLOD;
var bool bStartup;
var bool bNoCheating;
var bool bAllowFOV;
var() globalconfig bool bPawnFacialNoise;
var() noexport bool bPlayerCanSwim "Set this to true if players can swim in this map.  This is required to include swimming animations in the automated precache index generation.";
var() int MaxTexStreamMegs;
var() noexport float ShadowCullDistance "Distance at which shadows will no longer be rendered.";
var() noexport float DirectionalShadowBias "Shadow Bias for the PC";
var() noexport float DirectionalShadowBiasPS3 "Shadow Bias for the Ps3";
var() noexport float DirectionalShadowBias360 "Shadow Bias for the 360";
var bool bAllowStencilShadows;
var() noexport deprecated array<Actor> CheckpointTravelActors "Actors that need to be included in fast save data so they restore their states.";
var() noexport float LevelMaxX "MP Only: Maximum X coordinate reachable by player pawns.";
var() noexport float LevelMaxY "MP Only: Maximum Y coordinate reachable by player pawns.";
var() noexport float LevelMaxZ "MP Only: Maximum Z coordinate reachable by player pawns.";
var() noexport float LevelMinX "MP Only: Minimum X coordinate reachable by player pawns.";
var() noexport float LevelMinY "MP Only: Minimum Y coordinate reachable by player pawns.";
var() noexport float LevelMinZ "MP Only: Minimum Z coordinate reachable by player pawns.";
var(Pathing) array<SLevelInfoAIPathInfo> AdditionalAIPathInfos;
var(Pathing) NAVStats LevelNAVStats;
var(Pathing) noexport array<SAIPathInfo> WarnNAVSize "Editor will warn you if your NAV sizes become bigger than these.";
var SPathPerfInfo PathPerf;
var(AI) array<SAIGateInfo> GlobalAIGates;
var array<InteractiveActor> TKObjects;
var(AI) Actor PrimaryHoloActor;
var(AI) float BerzerkerGrappleGlobalIntervalMin;
var float BerzerkerGrappleGate;
var bool bPausedFromTaskSwitch;
var noexport bool bPaused "Is the level currently paused?";
var noexport bool bScreenshotMode "Is screenshot mode set? Provides a roaming free-cam while the game is paused.";
var Vector ScreenshotModeLocation;
var Rotator ScreenshotModeRotation;
var bool bPausedThisFrame;
var() noexport bool bErrorCheckActorLocations "Check to see if two nearly identical actors are in the exact same location.";
var() noexport bool bErrorCheckNetworkInfo "Check to see if things will fail in netplay.";
var() float Brightness;
var() Texture Screenshot;
var Texture DefaultTexture;
var MaterialEx DefaultMaterial;
var StaticMesh DefaultStaticMesh;
var Mesh DefaultMesh;
var int HubStackLevel;
var() noexport int NodeDecalLimit "Sets the maximum # of decals for a bsp node";
var() noexport float DecalDistanceScale "Global scale for decal MaxViewDistance and FadeOutStart to increase/decrease viewing distances.";
var() noexport float AutoDOFMaxFocalDistance "If this value is greater than 0, when doing Auto-DOF adjustments (for zooming), this is the maximum distance a focal point can be.";
var() noexport deprecated array<MenuCamera> MenuCameras "Cameras to use during pause";
var array<MenuCamera> UsedMenuCameras;
var() float ExitLevelFadeTime;
var() noexport deprecated name PlayerDiedEvent "Event to trigger when a player dies.";
var() noexport deprecated name FilmGrainOnTag "Trigger this to enable film grain for local player (SP Only)";
var() noexport deprecated name FilmGrainOffTag "Trigger this to disable film grain for local player (SP Only)";
var const array<MaterialExInstance> MaterialInstances;
var private const transient int EventDatabase;
var float DisableSkipBinkTimer;
var localized string ESCText;
var localized string toSkipText;
var localized string preToSkipText;
var transient LevelInfo.ELevelAction LevelAction;
var transient int LevelLoadState;
var int NumSaves;
var int NumLoads;
var bool bSameLevelLoad;
var LevelInfo.ENetMode NetMode;
var string ComputerName;
var string EngineVersion;
var string MinNetVersion;
var string EngineBuildDate;
var string UserName;
var() class<GameInfo> DefaultGameType;
var() class<PlayerPawn> OverridePlayerClass;
var GameInfo Game;
var GameReplicationInfo GRI;
var bool bSavedGame;
var const Pawn PawnList;
var private PlayerPawn LocalPlayerPawn;
var array<Decoration> EnemyDecorations;
var string NextURL;
var bool bNextItems;
var float NextSwitchCountdown;
var() const string PhysicsEffectsDatabaseClass;
var transient PhysicsEffectsDatabase PhysicsEffectsDatabase;
var() const LevelInfo.EPhysicsProximityDetection ProximityDetector;
var() globalconfig Object.EPhysicsQuality PhysicsQuality;
var() const noexport float KStartupPhysicsTime "Time to tick object physics at start of level.";
var const bool bDoneStartupPhysics;
var() const bool bNoKarma;
var(AmbientLighting) noexport deprecated Actor AmbientLightDirActor "Actor to represent direction of ambient lighting (will use Self if None)";
var(DukeVision) noexport float DukeVisionIntensity "Scales the intensity of DukeVision for the level.";
var array<RenderActor> DukeVisionInterferenceActors;
var() noexport int BombDetectorRadius "Radius of the bomb detector's display on the HUD";
var const int ActiveEditorPath;
var const int NumPaths;
var const NavigationPoint NavigationPointList;
var transient array< class<Actor> > SpawnBlockClasses;
var(AI_Sound) array<SAISoundInfo> AISoundInfo;
var(AI_Sound) editconst array<SAITeamDialogInfo> AITeamDialogInfo;
var float FinishingMoveGate;
var(AI_FinishingMove) float FinishingMoveInterval;
var(AI_TickLimiting) noexport int MinAITicksPerFrame "The minimum number of AI that are allowed to think per frame.";
var(AI_TickLimiting) noexport float MaxPercentageAITicksPerFrame "The maximum percentage of active AI in a level that are allowed to think per frame.";
var(AI_TickLimiting) noexport float MaxAITickMSecPerFrame "Maximum amount of time to be spent in decision tree code.";
var(AI_TickLimiting) noexport int MaxAITargetVisiblitychecksPerFrame "Max times per frame AI will do line checks to see if they can see their target";
var(AI_Sound) noexport int MaxAlertSoundsPerFrame "Max alert sounds that can beplayed in one frame by all AI";
var(AI_Sound) float AISoundGate;
var(AI_Sound) float AISoundInterval;
var int NumAIExecTicksAllowed;
var int NumAITargetEvalsAllowed;
var int NumAILookEvalsAllowed;
var int NumActiveAI;
var int NumAGotoXEvalPerFrame;
var float AIEvalGateTime;
var float AIEvalGateTimeDynamicPathing;
var int DebugNumActiveAILastFrame;
var int DebugNumAIExecTicksAllowedLastFrame;
var int DebugNumAIExecTicksAllowed;
var int DebugNumAIExecTicksLastFrame;
var int DebugNumAITargetEvalsLastFrame;
var int DebugNumAILookEvalsLastFrame;
var() noexport SSoundVolumePrefabEntry VolumePrefabs[9] "Sound volume prefab table:" "0: Invalid" "1: SOUNDVOLUME_WeaponFire" "2: SOUNDVOLUME_WeaponMisc" "3: SOUNDVOLUME_PlayerVoice" "4: SOUNDVOLUME_Voice" "5: SOUNDVOLUME_Creature" "6: SOUNDVOLUME_Ambient" "7: SOUNDVOLUME_Vehicle" "8: SOUNDVOLUME_Interact";
var SSoundVolumePrefabEntry VolumePrefabTable[9];
var SReverbPreset ReverbPresets[10];
var(Audio) noexport array<SAudioMixerAutoDuckRule> MixerAutoDuckRules "List of rules for auto-ducking.";
var(ActorCleanup) noexport float CorpseCleanupPeriod "Amount of time (in seconds) to wait between each corpse cleanup attempt.";
var(ActorCleanup) noexport float CorpseLimbCleanupPeriod "Amount of time (in seconds) to wait between each corpse limb cleanup attempt.";
var(ActorCleanup) noexport float GibCleanupPeriod "Amount of time (in seconds) to wait between each gib cleanup attempt.";
var(ActorCleanup) noexport float AmmoCasingCleanupPeriod "Amount of time (in seconds) to wait between each ammo casing cleanup attempt.";
var(ActorCleanup) noexport float ArmorCleanupPeriod "Amount of time (in seconds) to wait between each armore cleanup attempt.";
var(ActorCleanup) noexport int MaxCorpses "Maximum amount of corpses to have after a cleanup attempt.";
var(ActorCleanup) noexport int MaxCorpseLimbs "Maximum amount of corpse limbs to have after a cleanup attempt.";
var(ActorCleanup) noexport int MaxGibs "Maximum amount of gibs to have after a cleanup attempt.";
var(ActorCleanup) noexport int MaxAmmoCasings "Maximum amount of ammo casings to have after a cleanup attempt.";
var(ActorCleanup) noexport int MaxPipeBombsAndTripMines "Maximum amount of pipebombs and tripmines in a signleplayer game.";
var(ActorCleanup) noexport int MaxPipeBombsAndTripMinesMP "Maximum amount of pipebombs and tripmines in a multiplayer game.";
var(ActorCleanup) noexport int MaxDestructibleArmor "Maximum amount of armor pieces to have after a cleanup attempt.";
var array<DelayedHurtRadius> delayedRadiusDamage;
var array<DelayedTraceFireDamage> delayedTraceFireHitDamage;
var float NextCorpseCleanupTime;
var float NextCorpseLimbCleanupTime;
var float NextGibCleanupTime;
var float NextAmmoCasingCleanupTime;
var float NextArmorCleanupTime;
var array<SCleanupActorEntry> Corpses;
var array<SCleanupActorEntry> CorpseLimbs;
var array<SCleanupActorEntry> Gibs;
var array<SCleanupActorEntry> AmmoCasings;
var array<SCleanupActorEntry> PipeBombsAndTripMines;
var array<SCleanupActorEntry> DestructibleArmor;
var(DLC) noexport array<OverridePlayerClassMapping> OverridePlayerTypes "How this level will change the player class for a given game type player class";

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		GRI, Pauser, 
		TimeDilation, bAllowFOV, 
		bNoCheating, bPaused, 
		bScreenshotMode;
}

// Export ULevelInfo::execCheckOverridePlayerClass(FFrame&, void* const)
native(1152) final function CheckOverridePlayerClass(out class<PlayerPawn> PlayerClass)
{
	//native.PlayerClass;	
}

simulated function NU_ScreenshotMode(bool ScreenshotModeEnabled)
{
	// End:0x44
	if(ScreenshotModeEnabled)
	{
		ScreenshotModeLocation = __NFUN_1161__().__NFUN_872__();
		ScreenshotModeRotation = __NFUN_1161__().__NFUN_873__();		
		ConsoleCommand("r_drawhud off");		
	}
	else
	{		
		ConsoleCommand("r_drawhud on");
	}
	return;
}

final simulated function NoteSpawnedCorpse(Actor Corpse)
{
	local int i;

	i = Corpses.Add(1);
	Corpses[i].Actor = Corpse;
	Corpses[i].SpawnTime = Level.GameTimeSeconds;
	return;
}

final simulated function NoteSpawnedCorpseLimb(Actor CorpseLimb)
{
	local int i;

	i = CorpseLimbs.Add(1);
	CorpseLimbs[i].Actor = CorpseLimb;
	CorpseLimbs[i].SpawnTime = Level.GameTimeSeconds;
	return;
}

final simulated function NoteSpawnedArmorPiece(Actor ArmorPiece)
{
	local int i;

	i = DestructibleArmor.Add(1);
	DestructibleArmor[i].Actor = ArmorPiece;
	DestructibleArmor[i].SpawnTime = Level.GameTimeSeconds;
	return;
}

final simulated function NoteSpawnedGib(Actor Gib)
{
	local int i;

	i = Gibs.Add(1);
	Gibs[i].Actor = Gib;
	Gibs[i].SpawnTime = Level.GameTimeSeconds;
	return;
}

final simulated function NoteSpawnedAmmoCasing(Actor AmmoCasing)
{
	local int i;

	i = AmmoCasings.Add(1);
	AmmoCasings[i].Actor = AmmoCasing;
	AmmoCasings[i].SpawnTime = Level.GameTimeSeconds;
	return;
}

final simulated function NoteSpawnedPipebombOrTripMine(Actor Explosive)
{
	local int i, diff, MaxExplosives;
	local Actor OldExplosive;

	// End:0x31
	if(IsMP())
	{
		// End:0x23
		if(__NFUN_173__(int(Level.NetMode), int(NM_Client)))
		{
			return;
		}
		MaxExplosives = MaxPipeBombsAndTripMinesMP;		
	}
	else
	{
		MaxExplosives = MaxPipeBombsAndTripMines;
	}
	// End:0xBA
	if(__NFUN_170__(MaxExplosives, 0))
	{
		PipeBombsAndTripMines[PipeBombsAndTripMines.Add(1)].Actor = Explosive;
		J0x5F:

		// End:0xBA [Loop If]
		if(__NFUN_170__(string(PipeBombsAndTripMines), MaxExplosives))
		{
			// End:0xAF
			if(__NFUN_340__(PipeBombsAndTripMines[0].Actor, none))
			{
				PipeBombsAndTripMines[0].Actor.bSilentDestroy = true;
				PipeBombsAndTripMines[0].Actor.__NFUN_614__();
			}
			PipeBombsAndTripMines.Remove(0, 1);
			// [Loop Continue]
			goto J0x5F;
		}
	}
	return;
}

// Export ULevelInfo::execXboxStartMatch(FFrame&, void* const)
native function XboxStartMatch();

// Export ULevelInfo::execXboxEndMatch(FFrame&, void* const)
native function XboxEndMatch();

// Export ULevelInfo::execXboxShowGamerCard(FFrame&, void* const)
native function XboxShowGamerCard(PlayerReplicationInfo Player)
{
	//native.Player;	
}

// Export ULevelInfo::execGetLocalURL(FFrame&, void* const)
native simulated function string GetLocalURL();

// Export ULevelInfo::execGetAddressURL(FFrame&, void* const)
native simulated function string GetAddressURL();

// Export ULevelInfo::execWarmupPhysics(FFrame&, void* const)
native(1153) final function WarmupPhysics(float WarmupTime)
{
	//native.WarmupTime;	
}

// Export ULevelInfo::execRegisterLevelEvent(FFrame&, void* const)
native(1154) final function RegisterLevelEvent(name EventType, optional string EventParms)
{
	//native.EventType;
	//native.EventParms;	
}

// Export ULevelInfo::execSetLevelEventFunctionHook(FFrame&, void* const)
native(1155) final function SetLevelEventFunctionHook(class<Actor> OuterClass, name FunctionName, bool bHookState)
{
	//native.OuterClass;
	//native.FunctionName;
	//native.bHookState;	
}

// Export ULevelInfo::execPerformStandaloneSimulation(FFrame&, void* const)
native(1156) final function PerformStandaloneSimulation(KarmaActor StandaloneActor, float DeltaTime)
{
	//native.StandaloneActor;
	//native.DeltaTime;	
}

// Export ULevelInfo::execPerformTeamDialog(FFrame&, void* const)
native(1157) final function PerformTeamDialog(Pawn Speaker, Object.EDialog DialogType)
{
	//native.Speaker;
	//native.DialogType;	
}

// Export ULevelInfo::execCheckAIGate(FFrame&, void* const)
native(1158) final function bool CheckAIGate(name GateName)
{
	//native.GateName;	
}

// Export ULevelInfo::execUpdateAIGate(FFrame&, void* const)
native(1159) final function bool UpdateAIGate(name GateName, optional float OverrideInterval)
{
	//native.GateName;
	//native.OverrideInterval;	
}

// Export ULevelInfo::execCheckAndUpdateAIGate(FFrame&, void* const)
native(1160) final function bool CheckAndUpdateAIGate(name GateName, optional float OverrideInterval)
{
	//native.GateName;
	//native.OverrideInterval;	
}

event PreGameInit()
{
	super(Actor).PreGameInit();
	AITeamDialogInfo = default.AITeamDialogInfo;
	return;
}

simulated event PreBeginPlay()
{
	local int i, j;
	local InteractiveActor IA;

	i = 0;
	J0x07:

	// End:0x34 [Loop If]
	if(__NFUN_169__(i, 9))
	{
		VolumePrefabTable[i] = VolumePrefabs[i];
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0x3B:

	// End:0xDD [Loop If]
	if(__NFUN_169__(i, string(MixerAutoDuckRules)))
	{
		j = 0;
		J0x52:

		// End:0xD3 [Loop If]
		if(__NFUN_169__(j, string(MixerAutoDuckRules[i].DuckGroups)))
		{
			// End:0xC9
			if(__NFUN_202__(MixerAutoDuckRules[i].DuckGroups[j].UnDuckTime, 0))
			{
				MixerAutoDuckRules[i].DuckGroups[j].UnDuckTime = MixerAutoDuckRules[i].DuckGroups[j].DuckTime;
			}
			__NFUN_184__(j);
			// [Loop Continue]
			goto J0x52;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x3B;
	}
	__NFUN_718__('FilmGrainOn', FilmGrainOnTag);
	__NFUN_718__('FilmGrainOff', FilmGrainOffTag);
	// End:0x119
	if(IsMP())
	{		
		ConsoleCommand("BList 1");
		PreloadHoloDuke();		
	}
	else
	{		
		ConsoleCommand("BList 0");
	}
	i = __NFUN_166__(string(CheckpointTravelActors), 1);
	J0x138:

	// End:0x16E [Loop If]
	if(__NFUN_172__(i, 0))
	{
		// End:0x164
		if(__NFUN_339__(CheckpointTravelActors[i], none))
		{
			CheckpointTravelActors.Remove(i, 1);
			// [Explicit Continue]
		}
		__NFUN_185__(i);
		// [Loop Continue]
		goto J0x138;
	}
	super.PreBeginPlay();
	UpdateShadowSettings();
	return;
}

simulated function PreloadHoloDuke()
{
	__NFUN_366__("dnAI.MP_HoloActor", class'Class');
	return;
}

simulated function UpdateShadowSettings()
{
	bAllowStencilShadows = bool(ConsoleCommand("get ini:Engine.Engine.ViewportManager AllowStencilShadows"));
	return;
}

event GenerateLevelTransitionInfo(out SLevelTransitionInfo TransitionInfo)
{
	TransitionInfo.LevelName = __NFUN_303__(Author, Title);
	TransitionInfo.NumSaves = NumSaves;
	TransitionInfo.NumLoads = NumLoads;
	// End:0x5F
	if(__NFUN_340__(Game, none))
	{
		TransitionInfo.GameState = Game.GenerateGameTransitionInfo();
	}
	return;
}

event AcceptLevelTransitionInfo(SLevelTransitionInfo TransitionInfo)
{
	NumSaves = TransitionInfo.NumSaves;
	NumLoads = TransitionInfo.NumLoads;
	bSameLevelLoad = __NFUN_148__(__NFUN_309__(TransitionInfo.LevelName, ""), __NFUN_308__(TransitionInfo.LevelName, __NFUN_303__(Author, Title)));
	// End:0x81
	if(__NFUN_340__(Game, none))
	{
		Game.AcceptGameTransitionInfo(TransitionInfo.GameState, bSameLevelLoad);
	}
	return;
}

event ServerNextMap()
{
	local MapList CurrentMapList;
	local string MapName;

	// End:0x85
	if(IsMP())
	{
		CurrentMapList = __NFUN_615__(Game.MapListType);
		MapName = CurrentMapList.GetNextMap();
		CurrentMapList.__NFUN_614__();
		// End:0x79
		if(__NFUN_308__(MapName, ""))
		{
			MapName = Game.__NFUN_760__(Game.MapPrefix, MapName, 1);
		}
		ServerTravel(MapName, false);
	}
	return;
}

event ServerTravel(string URL, bool bItems)
{
	// End:0x5A
	if(__NFUN_308__(NextURL, ""))
	{
		bNextItems = bItems;
		NextURL = URL;
		// End:0x4F
		if(__NFUN_340__(Game, none))
		{
			Game.ProcessServerTravel(URL, bItems);			
		}
		else
		{
			NextSwitchCountdown = 0;
		}
	}
	return;
}

event FinishedLoading()
{
	// End:0x24
	if(__NFUN_148__(__NFUN_145__(bDoneStartupPhysics), __NFUN_206__(KStartupPhysicsTime, 0)))
	{
		__NFUN_1153__(KStartupPhysicsTime);
	}
	return;
}

final simulated function DrawLevelEnterSmacker(Canvas C)
{
	local float XL, YL;
	local PlayerPawn P;

	// End:0x1E
	if(__NFUN_150__(__NFUN_339__(LevelEnterSmacker, none), __NFUN_174__(int(LevelAction), int(0))))
	{
		return;
	}
	C.Style = 1;
	C.__NFUN_1250__(0, 0);
	C.__NFUN_1234__(Texture'BlackTexture', float(C.SizeX), float(C.SizeY), 0, 0, 1, 1,,,, false, 1);
	// End:0xE6
	if(__NFUN_201__(LevelEnterSmackerWarmup, 0))
	{
		__NFUN_210__(LevelEnterSmackerWarmup, TimeDeltaSeconds);
		LevelEnterSmacker.SetPause(true);
		LevelEnterSmacker.SetFrame(0);
		LevelEnterSmacker.SetLoop(false);
		return;
	}
	XL = __NFUN_195__(float(LevelEnterSmacker.__NFUN_1191__()), C.FixedScale);
	YL = __NFUN_195__(float(LevelEnterSmacker.__NFUN_1192__()), C.FixedScale);
	C.__NFUN_1250__(__NFUN_195__(0.5, __NFUN_199__(float(C.SizeX), XL)), __NFUN_195__(0.5, __NFUN_199__(float(C.SizeY), YL)));
	C.__NFUN_1234__(LevelEnterSmacker, XL, YL, 0, 0, float(LevelEnterSmacker.__NFUN_1191__()), float(LevelEnterSmacker.__NFUN_1192__()),,,, true, 1);
	// End:0x1F5
	if(LevelEnterSmacker.GetPause())
	{
		C.__NFUN_1249__();
		LevelEnterSmacker.SetPause(false);
	}
	// End:0x256
	if(LevelEnterSmacker.IsFinalFrame())
	{
		LevelEnterSmacker = none;
		P = __NFUN_1161__();
		// End:0x256
		if(__NFUN_148__(__NFUN_340__(P, none), __NFUN_340__(P.MyHUD, none)))
		{
			P.MyHUD.EnterLevelFade();
		}
	}
	return;
}

final simulated function bool OpenBink(string BinkName, optional bool bSkippable, optional bool bPreload, optional name DonePlayingEvent, optional float FadeRate, optional bool bEndCredits)
{
	CloseActiveBink();
	ActiveBink = class'BinkTexture'.static.__NFUN_1219__(BinkName, bPreload);
	// End:0x32
	if(__NFUN_339__(ActiveBink, none))
	{
		return false;
	}
	bActiveBinkSkippable = bSkippable;
	bActiveBinkEndCredits = bEndCredits;
	// End:0x5D
	if(bEndCredits)
	{
		bActiveBinkSkippable = false;
	}
	ActiveBinkCompleteEvent = DonePlayingEvent;
	// End:0x90
	if(__NFUN_201__(FadeRate, 0))
	{
		ActiveBinkAlpha = 0;
		ActiveBinkAlphaFadeRate = FadeRate;		
	}
	else
	{
		ActiveBinkAlpha = 1;
	}
	// End:0xF4
	if(bEndCredits)
	{
		ActiveBink.SetVolume(__NFUN_195__(ActiveBinkAlpha, float(ConsoleCommand("get ini:Engine.Engine.AudioDevice MusicVolume"))));		
	}
	else
	{
		ActiveBink.SetVolume(__NFUN_195__(ActiveBinkAlpha, float(ConsoleCommand("get ini:Engine.Engine.AudioDevice SoundVolume"))));
	}
	return true;
	return;
}

final simulated function CloseActiveBink()
{
	// End:0x0E
	if(__NFUN_339__(ActiveBink, none))
	{
		return;
	}
	class'BinkTexture'.static.__NFUN_1220__(ActiveBink);
	ActiveBink = none;
	GlobalTrigger(ActiveBinkCompleteEvent);
	return;
}

final simulated function DrawActiveBink(Canvas C)
{
	local float XL, YL, Ratio, textXSize, textYSize, xOffset;

	local name CompleteEvent;
	local MaterialEx btn;
	local PlayerPawn P;

	// End:0x1E
	if(__NFUN_150__(__NFUN_339__(ActiveBink, none), __NFUN_174__(int(LevelAction), int(0))))
	{
		return;
	}
	// End:0x64
	if(__NFUN_148__(__NFUN_200__(ActiveBinkAlpha, 1), __NFUN_145__(bPaused)))
	{
		ActiveBinkAlpha = __NFUN_224__(1, __NFUN_198__(ActiveBinkAlpha, __NFUN_195__(ActiveBinkAlphaFadeRate, Level.TimeDeltaSeconds)));
	}
	// End:0xBD
	if(bActiveBinkEndCredits)
	{
		ActiveBink.SetVolume(__NFUN_195__(ActiveBinkAlpha, float(ConsoleCommand("get ini:Engine.Engine.AudioDevice MusicVolume"))));		
	}
	else
	{
		ActiveBink.SetVolume(__NFUN_195__(ActiveBinkAlpha, float(ConsoleCommand("get ini:Engine.Engine.AudioDevice SoundVolume"))));
	}
	C.Style = 1;
	C.__NFUN_1250__(0, 0);
	C.__NFUN_1234__(Texture'BlackTexture', float(C.SizeX), float(C.SizeY), 0, 0, 1, 1,,,, false, 1);
	Ratio = __NFUN_196__(float(ActiveBink.__NFUN_1191__()), float(ActiveBink.__NFUN_1192__()));
	XL = float(C.SizeX);
	YL = __NFUN_196__(XL, Ratio);
	// End:0x210
	if(__NFUN_201__(YL, float(C.SizeY)))
	{
		YL = float(C.SizeY);
		XL = __NFUN_195__(YL, Ratio);
	}
	C.__NFUN_1250__(__NFUN_195__(0.5, __NFUN_199__(float(C.SizeX), XL)), __NFUN_195__(0.5, __NFUN_199__(float(C.SizeY), YL)));
	C.__NFUN_1234__(ActiveBink, XL, YL, 0, 0, float(ActiveBink.__NFUN_1191__()), float(ActiveBink.__NFUN_1192__()),,,, true, ActiveBinkAlpha);
	C.__NFUN_1250__(0, 0);
	C.__NFUN_1234__(class'FilmGrain_fb', float(C.SizeX), float(C.SizeY), 0, 0, float(C.SizeX), float(C.SizeY),,,,, ActiveBinkAlpha);
	P = __NFUN_1161__();
	// End:0x749
	if(__NFUN_148__(__NFUN_148__(__NFUN_340__(P, none), bActiveBinkEndCredits), bActiveBinkSkippable))
	{
		xOffset = __NFUN_195__(float(C.SizeX), 0.4);
		C.Font = C.TallFont;
		C.__NFUN_1250__(xOffset, __NFUN_195__(float(C.SizeY), 0.8));
		C.__NFUN_1238__(preToSkipText, textXSize, textYSize, C.FixedScale, C.FixedScale);
		C.__NFUN_1232__(preToSkipText,,,, C.FixedScale, C.FixedScale);
		__NFUN_209__(xOffset, textXSize);
		// End:0x538
		if(P.__NFUN_994__())
		{
			btn = P.MyHUD.__NFUN_1183__("(A)");
			C.__NFUN_1250__(xOffset, __NFUN_195__(float(C.SizeY), 0.8));
			C.__NFUN_1234__(btn, __NFUN_195__(__NFUN_195__(float(btn.__NFUN_1191__()), C.FixedScale), 0.6), __NFUN_195__(__NFUN_195__(float(btn.__NFUN_1192__()), C.FixedScale), 0.6), 0, 0, float(btn.__NFUN_1191__()), float(btn.__NFUN_1192__()));
			__NFUN_209__(xOffset, __NFUN_195__(__NFUN_195__(float(btn.__NFUN_1191__()), C.FixedScale), 0.6));			
		}
		else
		{
			btn = class'PC_Generic_Button';
			C.__NFUN_1250__(xOffset, __NFUN_195__(float(C.SizeY), 0.8));
			C.__NFUN_1234__(btn, __NFUN_195__(__NFUN_195__(float(btn.__NFUN_1191__()), C.FixedScale), 0.6), __NFUN_195__(__NFUN_195__(float(btn.__NFUN_1192__()), C.FixedScale), 0.6), 0, 0, float(btn.__NFUN_1191__()), float(btn.__NFUN_1192__()));
			C.__NFUN_1250__(__NFUN_198__(xOffset, __NFUN_195__(__NFUN_195__(float(btn.__NFUN_1191__()), C.FixedScale), 0.1)), __NFUN_195__(float(C.SizeY), 0.815));
			C.Font = C.BlockFontSmall;
			C.__NFUN_1232__(ESCText,,,, __NFUN_195__(C.FixedScale, 0.6), __NFUN_195__(C.FixedScale, 0.6));
			__NFUN_209__(xOffset, __NFUN_195__(__NFUN_195__(float(btn.__NFUN_1191__()), C.FixedScale), 0.6));
		}
		C.__NFUN_1250__(xOffset, __NFUN_195__(float(C.SizeY), 0.8));
		C.Font = C.TallFont;
		C.__NFUN_1232__(toSkipText,,,, C.FixedScale, C.FixedScale);
	}
	// End:0x785
	if(ActiveBink.IsFinalFrame())
	{
		// End:0x77F
		if(__NFUN_148__(bActiveBinkEndCredits, __NFUN_340__(__NFUN_1161__(), none)))
		{
			__NFUN_1161__().EndCreditsFullyViewed();
		}
		CloseActiveBink();
	}
	return;
}

function WantToSkipVideo()
{
	bActiveBinkSkippable = true;
	DisableSkipBinkTimer = 3;
	return;
}

event DoTick(float Delta)
{
	// End:0x3A
	if(__NFUN_148__(bActiveBinkEndCredits, __NFUN_201__(DisableSkipBinkTimer, 0)))
	{
		__NFUN_210__(DisableSkipBinkTimer, Delta);
		// End:0x3A
		if(__NFUN_202__(DisableSkipBinkTimer, float(0)))
		{
			bActiveBinkSkippable = false;
		}
	}
	return;
}

// Export ULevelInfo::execGetLocalPlayerPawn(FFrame&, void* const)
native(1161) final simulated function PlayerPawn GetLocalPlayerPawn();

event bool FinishingMoveAllowed()
{
	return __NFUN_203__(GameTimeSeconds, FinishingMoveGate);
	return;
}

event NotifyFinishingMove()
{
	FinishingMoveGate = __NFUN_198__(GameTimeSeconds, FinishingMoveInterval);
	return;
}

event bool AISoundAllowed(LevelInfo.EAISoundInfoType SoundType)
{
	local bool B;
	local int i;

	i = 0;
	J0x07:

	// End:0x40 [Loop If]
	if(__NFUN_169__(i, string(AISoundInfo)))
	{
		// End:0x36
		if(__NFUN_173__(int(AISoundInfo[i].SoundType), int(SoundType)))
		{
			// [Explicit Break]
			goto J0x40;
		}
		__NFUN_184__(i);
		// [Loop Continue]
		goto J0x07;
	}
	J0x40:

	__NFUN_354__(__NFUN_169__(i, string(AISoundInfo)));
	B = __NFUN_200__(AISoundInfo[i].Gate, GameTimeSeconds);
	// End:0x9F
	if(B)
	{
		AISoundInfo[i].Gate = __NFUN_198__(GameTimeSeconds, AISoundInfo[i].MinInterval);
	}
	return B;
	return;
}

event CalcMaxAITicksPerFrame()
{
	DebugNumActiveAILastFrame = NumActiveAI;
	DebugNumAIExecTicksAllowedLastFrame = DebugNumAIExecTicksAllowed;
	DebugNumAIExecTicksLastFrame = __NFUN_166__(DebugNumAIExecTicksAllowedLastFrame, NumAIExecTicksAllowed);
	DebugNumAITargetEvalsLastFrame = __NFUN_166__(DebugNumAIExecTicksAllowedLastFrame, NumAITargetEvalsAllowed);
	DebugNumAILookEvalsLastFrame = __NFUN_166__(DebugNumAIExecTicksAllowedLastFrame, NumAILookEvalsAllowed);
	NumAIExecTicksAllowed = __NFUN_189__(MinAITicksPerFrame, int(__NFUN_195__(float(NumActiveAI), MaxPercentageAITicksPerFrame)));
	NumAITargetEvalsAllowed = NumAIExecTicksAllowed;
	NumAILookEvalsAllowed = NumAIExecTicksAllowed;
	NumActiveAI = 0;
	DebugNumAIExecTicksAllowed = NumAIExecTicksAllowed;
	MaxAITickMSecPerFrame = default.MaxAITickMSecPerFrame;
	NumAGotoXEvalPerFrame = default.NumAGotoXEvalPerFrame;
	MaxAITargetVisiblitychecksPerFrame = default.MaxAITargetVisiblitychecksPerFrame;
	MaxAlertSoundsPerFrame = default.MaxAlertSoundsPerFrame;
	return;
}

// Export ULevelInfo::execNoteGamePaused(FFrame&, void* const)
native(1162) final function NoteGamePaused();

// Export ULevelInfo::execNoteGameResumed(FFrame&, void* const)
native(1163) final function NoteGameResumed();

event ScriptGetActorColor()
{
	return;
}

simulated function TriggerFunc_FilmGrainOn()
{
	// End:0x0B
	if(IsMP())
	{
		return;
	}
	// End:0x23
	if(__NFUN_340__(__NFUN_1161__(), none))
	{
		__NFUN_1161__().FilmGrainOn();
	}
	return;
}

simulated function TriggerFunc_FilmGrainOff()
{
	// End:0x0B
	if(IsMP())
	{
		return;
	}
	// End:0x23
	if(__NFUN_340__(__NFUN_1161__(), none))
	{
		__NFUN_1161__().FilmGrainOff();
	}
	return;
}

function ScheduleHurtRadiusActivity(Actor Victim, Actor DamageInstigator, float DamageAmount, Vector DamageOrigin, float DamageRadius, float DamageFalloffStart, class<DamageType> DamageType, Vector DamageStart, optional bool bIgnoreDrawScale, optional float RelativeScale, optional int Delay)
{
	local float fDelay;
	local DelayedHurtRadius Damage;

	Damage.Victim = Victim;
	Damage.DamageInstigator = DamageInstigator;
	Damage.DamageAmount = DamageAmount;
	Damage.RelativeDamageOrigin = __NFUN_239__(DamageOrigin, Victim.Location);
	Damage.DamageRadius = DamageRadius;
	Damage.DamageFalloffStart = DamageFalloffStart;
	Damage.DamageType = DamageType;
	Damage.DamageStart = DamageStart;
	Damage.bIgnoreDrawScale = bIgnoreDrawScale;
	Damage.RelativeScale = RelativeScale;
	// End:0xCF
	if(__NFUN_171__(Delay, 0))
	{
		Delay = __NFUN_165__(int(__NFUN_195__(float(6), __NFUN_222__())), 1);
	}
	Damage.DamageTime = __NFUN_165__(LevelTickStamp, Delay);
	delayedRadiusDamage[delayedRadiusDamage.Add(1)] = Damage;
	return;
}

event ScheduleTraceFireHit(CorpseBase Corpse, Actor SourceActor, class<TraceDamageType> TraceDamageType, Vector SourceTraceOrigin, Vector HitLocation, Vector HitNormal, name HitBoneName, bool bExtentTrace, optional int Delay)
{
	local float fDelay;
	local DelayedTraceFireDamage Damage;

	Damage.Corpse = Corpse;
	Damage.SourceActor = SourceActor;
	Damage.TraceDamageType = TraceDamageType;
	Damage.SourceTraceOrigin = SourceTraceOrigin;
	Damage.HitLocation = __NFUN_239__(HitLocation, Corpse.Location);
	Damage.HitNormal = HitNormal;
	Damage.HitBoneName = HitBoneName;
	Damage.bExtentTrace = bExtentTrace;
	// End:0xAF
	if(__NFUN_171__(Delay, 0))
	{
		Delay = __NFUN_165__(int(__NFUN_195__(float(6), __NFUN_222__())), 1);
	}
	Damage.DamageTime = __NFUN_165__(LevelTickStamp, Delay);
	delayedTraceFireHitDamage[delayedTraceFireHitDamage.Add(1)] = Damage;
	return;
}

// Export ULevelInfo::execMirrorModeEnabled(FFrame&, void* const)
native(1164) final function bool MirrorModeEnabled();

// Export ULevelInfo::execIsFullScreen(FFrame&, void* const)
native(1165) final function bool IsFullScreen();

defaultproperties
{
	TimeDilation=1
	Title="<?int?Engine.LevelInfo.Title?>"
	VisibleGroups="None"
	PatchLayerGroup="PatchLayers"
	LevelEnterSmackerWarmup=0.5
	FilmGrainMaterial='dt_effects.PostProcessing.FilmGrain_fb'
	BlackWhiteMaterial='dt_effects.PostProcessing.BlackWhite_FB'
	MenuBackgroundMaterial='Menu.Menu.Backdrop'
	GameSpeedModifier=1
	HeadScaleModifier=1
	bPawnFacialNoise=true
	MaxTexStreamMegs=35
	ShadowCullDistance=1024
	DirectionalShadowBias=0.0001
	DirectionalShadowBiasPS3=0.0005
	DirectionalShadowBias360=0.0005
	LevelMaxX=13000
	LevelMaxY=13500
	LevelMaxZ=3500
	LevelMinX=-11000
	LevelMinY=-3500
	LevelMinZ=-5500
	
}