/*******************************************************************************
 * Destructible_MetalFence_Section generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Destructible_MetalFence_Section extends dnDestructibleBuildingDefinition within dnDestructibleBuilding;

defaultproperties
{
	Parts(0)=Z='DukeHUD',
/* Exception thrown while deserializing Parts
System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at UELib.UnrealStreamImplementations.ReadNameReference(IUnrealStream stream) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 838
   at UELib.Core.UDefaultProperty.DeserializeTagUE1() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 204
   at UELib.Core.UDefaultProperty.DeserializeNextTag() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 193
   at UELib.Core.UDefaultProperty.Deserialize() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 169
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 767 */
	Parts(1)=(Location=(X=-9.45304E+22,Y=2.954668E-17,Z=1.924591),Z=4.000122)
	Parts(2)=(Rotation=(Pitch=8741,Yaw=572915712,Roll=16372),Roll=0)
	Parts(3)=(Scale=(X=1.292418E-41,Y=2.94903E-17,Z=0),Z=0)
	Parts(4)=(SkewPitch=0,SkewYaw=0,SkewRoll=0,RandomSeed=0,OverrideSurvivalChance=0,OverrideCollisionChance=0,OverrideDensity=0,Mass=0,PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Metal_Solid',bDefaultInteractionClass=false)
}