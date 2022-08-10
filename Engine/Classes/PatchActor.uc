/*******************************************************************************
 * PatchActor generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class PatchActor extends RenderActor
	native
	collapsecategories
	notplaceable;

cpptext
{
// Stripped
}

enum EPatchSize
{
	PSIZE_3,
	PSIZE_5,
	PSIZE_7,
	PSIZE_9,
	PSIZE_11,
	PSIZE_13,
	PSIZE_15,
	PSIZE_17,
	PSIZE_19
};

enum EPatchUVMode
{
	UVMODE_Fit,
	UVMODE_Natural1,
	UVMODE_Natural2,
	UVMODE_Axis,
	UVMODE_AxisX,
	UVMODE_AxisY,
	UVMODE_AxisZ
};

enum EPatchPrimitiveType
{
	PTYPE_Sheet,
	PTYPE_Cylinder,
	PTYPE_Bevel,
	PTYPE_InverseBevel,
	PTYPE_EndCap,
	PTYPE_Terrain
};

var PatchActor.EPatchPrimitiveType DefaultPrimitiveMode;
var PatchActor.EPatchSize DefaultSizeX;
var PatchActor.EPatchSize DefaultSizeY;
var bool DefaultCaps;
var bool bTerrainPatch;
var() export PatchData PatchData;
var export PatchRenderData PatchRenderData;

defaultproperties
{
	FixedPhysicsDamageToNotPlayer=-1
	bCollisionAssumeValid=true
	bStatic=true
	bBlockActors=true
	bBlockPlayers=true
	bBlockKarma=true
	bBlockParticles=true
	bWorldGeometry=true
	bUnlisted=true
	bNoNativeTick=true
	bTickOnlyRecent=true
	bTickOnlyZoneRecent=true
	bTickOnlyNearby=true
	bCollideActors=true
	CollisionRadius=1
	CollisionHeight=1
	TickStyle=0
	DrawType=8
	RemoteRole=0
}