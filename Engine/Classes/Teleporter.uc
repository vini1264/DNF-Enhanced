/*******************************************************************************
 * Teleporter generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Teleporter extends NavigationPoint
	native
	collapsecategories
	notplaceable;

var() string URL;
var() bool bChangesVelocity;
var() bool bChangesYaw;
var() bool bReversesX;
var() bool bReversesY;
var() bool bReversesZ;
var() bool bEnabled;
var() bool MusicChange;
var() bool SmoothTransition;
var() noexport bool bTeleportRadiusActors "If true, Teleporter will setup all Actors for level transition if they are within TeleportRadius and have bNeverTravel = false.";
var() string MusicFilename;
var() float TeleportRadius;
var() Vector TargetVelocity;
var(VehicleTransition) noexport bool bVehicleTransition "If true, this is a special transition that involves a vehicle.";
var(VehicleTransition) noexport deprecated name SourceVehicleTag "Tag of the vehicle in this map.";
var(VehicleTransition) noexport deprecated name DestinationVehicleTag "Tag of the vehicle in the destination map.";
var Actor TriggerActor;
var Actor TriggerActor2;
var float LastFired;

replication
{
	// Pos:0x000
	reliable if(__NFUN_173__(int(Role), int(ROLE_Authority)))
		URL, bEnabled;

	// Pos:0x00B
	reliable if(__NFUN_148__(bNetInitial, __NFUN_173__(int(Role), int(ROLE_Authority))))
		TargetVelocity, bChangesVelocity, 
		bChangesYaw, bReversesX, 
		bReversesY, bReversesZ;
}

event PostBeginPlay()
{
	// End:0x15
	if(__NFUN_173__(__NFUN_314__(URL), 0))
	{
		SetTeleporterEnabled(false);
	}
	SetTeleporterEnabled(bEnabled);
	super(Actor).PostBeginPlay();
	return;
}

event Trigger(Actor Other, Pawn EventInstigator)
{
	super(Actor).Trigger(Other, EventInstigator);
	SetTeleporterEnabled(__NFUN_145__(bEnabled));
	return;
}

final function SetTeleporterEnabled(bool bNewEnabled)
{
	bEnabled = bNewEnabled;
	__NFUN_621__(bEnabled);
	return;
}

final simulated function StartTeleportAttempt(Actor Incoming)
{
	__NFUN_362__('Touch');
	return;
}

final simulated function EndTeleportAttempt(Actor Incoming, bool bSuccess, Object.EPhysics RestorePhysics)
{
	__NFUN_361__('Touch');
	// End:0x28
	if(__NFUN_174__(int(RestorePhysics), int(11)))
	{
		Incoming.__NFUN_642__(RestorePhysics);
	}
	return;
}

simulated function bool Accept(Actor Incoming, Teleporter Source)
{
	local Rotator NewRot, OldRot;
	local int OldYaw;
	local float Mag;
	local Vector OldDir;
	local Pawn PawnIncoming;
	local Object.EPhysics IncomingPhysics;

	PawnIncoming = Pawn(Incoming);
	IncomingPhysics = Incoming.Physics;
	StartTeleportAttempt(Incoming);
	NewRot = Incoming.Rotation;
	// End:0x63
	if(bChangesYaw)
	{
		NewRot.Yaw = Rotation.Yaw;
	}
	// End:0x195
	if(__NFUN_340__(PawnIncoming, none))
	{
		// End:0xFC
		if(__NFUN_145__(PawnIncoming.__NFUN_864__(__NFUN_238__(Location, Incoming.TravelLocation))))
		{
			__NFUN_355__(__NFUN_302__("SetLocation failed. Invalid Destination for PawnIncoming. Destination is", string(self)));
			EndTeleportAttempt(Incoming, false, IncomingPhysics);
			return false;
		}
		// End:0x17D
		if(__NFUN_150__(__NFUN_173__(int(Role), int(ROLE_Authority)), __NFUN_201__(__NFUN_199__(Level.GameTimeSeconds, LastFired), 0.5)))
		{
			// End:0x168
			if(__NFUN_145__(Source.SmoothTransition))
			{
				PawnIncoming.__NFUN_652__(NewRot);
				PawnIncoming.ViewRotation = NewRot;
			}
			LastFired = Level.GameTimeSeconds;
		}
		PawnIncoming.MoveTimer = -1;		
	}
	else
	{
		Incoming.__NFUN_642__(0);
		// End:0x1CE
		if(__NFUN_145__(Incoming.__NFUN_645__(Location)))
		{
			EndTeleportAttempt(Incoming, false, IncomingPhysics);
			return false;
		}
		// End:0x1E9
		if(bChangesYaw)
		{
			Incoming.__NFUN_652__(NewRot);
		}
	}
	EndTeleportAttempt(Incoming, true, IncomingPhysics);
	// End:0x21B
	if(bChangesVelocity)
	{
		Incoming.Velocity = TargetVelocity;		
	}
	else
	{
		// End:0x2B6
		if(bChangesYaw)
		{
			// End:0x248
			if(__NFUN_173__(int(Incoming.Physics), int(1)))
			{
				OldRot.Pitch = 0;
			}
			OldDir = Vector(OldRot);
			Mag = __NFUN_244__(Incoming.Velocity, OldDir);
			Incoming.Velocity = __NFUN_238__(__NFUN_239__(Incoming.Velocity, __NFUN_235__(Mag, OldDir)), __NFUN_235__(Mag, Vector(Incoming.Rotation)));
		}
		// End:0x2DA
		if(bReversesX)
		{
			__NFUN_207__(Incoming.Velocity.X, -1);
		}
		// End:0x2FE
		if(bReversesY)
		{
			__NFUN_207__(Incoming.Velocity.Y, -1);
		}
		// End:0x322
		if(bReversesZ)
		{
			__NFUN_207__(Incoming.Velocity.Z, -1);
		}
	}
	PlayTeleportEffect(Incoming, false);
	return true;
	return;
}

final function PlayTeleportEffect(Actor Incoming, bool bOut)
{
	// End:0x39
	if(Incoming.bIsPawn)
	{
		Level.Game.PlayTeleportEffect(Incoming, bOut, true);
	}
	return;
}

simulated event Touch(Actor Other)
{
	local array<Teleporter> LocalTeleporterList;
	local Teleporter Dest;
	local RenderActor TravelRA;
	local Pawn PawnOther;
	local PlayerPawn PlayerPawnOther;
	local bool bChunkTransition;
	local KarmaActor Vehicle;

	PawnOther = Pawn(Other);
	PlayerPawnOther = PlayerPawn(PawnOther);
	// End:0x42
	if(__NFUN_150__(__NFUN_145__(bEnabled), Other.bJustTeleported))
	{
		return;
	}
	// End:0x4AF
	if(Other.bCanTeleport)
	{
		// End:0x311
		if(__NFUN_150__(__NFUN_172__(__NFUN_315__(URL, "/"), 0), __NFUN_172__(__NFUN_315__(URL, "#"), 0)))
		{
			// End:0x30E
			if(__NFUN_148__(__NFUN_173__(int(Role), int(ROLE_Authority)), __NFUN_340__(PlayerPawnOther, none)))
			{
				// End:0xAA
				if(PlayerPawnOther.IsDead())
				{
					return;
				}
				PlayerPawnOther.bLevelTransition = true;
				// End:0x2EA
				if(__NFUN_150__(SmoothTransition, bChunkTransition))
				{
					PlayerPawnOther.TravelLocation = __NFUN_239__(PlayerPawnOther.Location, Location);
					PlayerPawnOther.TravelRotation = PlayerPawnOther.Rotation;
					PlayerPawnOther.TravelViewRotation = PlayerPawnOther.ViewRotation;
					PlayerPawnOther.TeleportTravel = true;
					// End:0x175
					if(__NFUN_148__(bChunkTransition, bVehicleTransition))
					{
						Vehicle = KarmaActor(FindActor(class'KarmaActor', SourceVehicleTag));
					}
					// End:0x234
					if(__NFUN_340__(Vehicle, none))
					{
						PlayerPawnOther.TravelVehicleTag = DestinationVehicleTag;
						PlayerPawnOther.TravelLocation = __NFUN_239__(Vehicle.Location, Location);
						PlayerPawnOther.TravelRotation = Vehicle.Rotation;
						// End:0x212
						if(__NFUN_173__(int(Vehicle.Physics), int(18)))
						{
							Vehicle.__NFUN_794__(PlayerPawnOther.TravelVehicleVelocity);							
						}
						else
						{
							PlayerPawnOther.TravelVehicleVelocity = Vehicle.Velocity;
						}						
					}
					else
					{
						PlayerPawnOther.TravelVehicleTag = 'None';
					}
					// End:0x2E7
					if(bTeleportRadiusActors)
					{
						// End:0x2E6
						foreach __NFUN_751__(class'RenderActor', TravelRA, TeleportRadius)
						{
							// End:0x2E5
							if(__NFUN_145__(TravelRA.bNeverTravel))
							{
								TravelRA.bWillTravel = true;
								TravelRA.bTravel = true;
								TravelRA.TravelRotation = TravelRA.Rotation;
								TravelRA.TravelLocation = __NFUN_239__(TravelRA.Location, Location);
							}							
						}						
					}					
				}
				Level.Game.SendPlayer(PlayerPawnOther, URL);
			}			
		}
		else
		{
			// End:0x35E
			foreach __NFUN_747__(class'Teleporter', Dest)
			{
				// End:0x35D
				if(__NFUN_148__(__NFUN_340__(Dest, self), __NFUN_310__(string(Dest.Tag), URL)))
				{
					LocalTeleporterList[LocalTeleporterList.Add(1)] = Dest;
				}				
			}			
			// End:0x37F
			if(__NFUN_170__(string(LocalTeleporterList), 0))
			{
				Dest = LocalTeleporterList[__NFUN_187__(string(LocalTeleporterList))];
			}
			// End:0x45B
			if(__NFUN_340__(Dest, none))
			{
				// End:0x404
				if(__NFUN_340__(PlayerPawnOther, none))
				{
					// End:0x404
					if(SmoothTransition)
					{
						PlayerPawnOther.TravelLocation = __NFUN_239__(PlayerPawnOther.Location, Location);
						PlayerPawnOther.TravelRotation = PlayerPawnOther.Rotation;
						PlayerPawnOther.TravelViewRotation = PlayerPawnOther.ViewRotation;
					}
				}
				PlayTeleportEffect(PawnOther, true);
				Dest.Accept(Other, self);
				// End:0x458
				if(Other.bIsPawn)
				{
					GlobalTrigger(Event, Other.Instigator, Other);
				}				
			}
			else
			{
				// End:0x4AF
				if(__NFUN_400__())
				{
					// End:0x4AF
					if(__NFUN_173__(int(Role), int(ROLE_Authority)))
					{
						PawnOther.ClientMessage(__NFUN_302__(__NFUN_302__("Teleport destination for ", string(self)), " not found!"));
					}
				}
			}
		}
	}
	return;
}

defaultproperties
{
	bChangesYaw=true
	bEnabled=true
	MusicChange=true
	TeleportRadius=400
	bDirectional=true
	bCollideActors=true
	CollisionRadius=18
	CollisionHeight=40
	Texture=Texture'S_Teleport'
}