/*******************************************************************************
 * Vehicles_Deco_Car_Taxi generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Vehicles_Deco_Car_Taxi extends Vehicles_Deco_Car_Standard_Base
	collapsecategories;

event RegisterPrecacheComponents(PrecacheIndex PrecacheIndex)
{
	super.RegisterPrecacheComponents(PrecacheIndex);
	PrecacheIndex.__NFUN_1267__(class'CrownVic_Wheel_Brnt');
	return;
}

defaultproperties
{
	CarColor=5
	VehicleParts(0)=(ByteProperty==Engine,bCanBlowOff=false,bDestroyOnExplosion=true,VehiclePartID=Window_Front,VehiclePartStyle=0,VehiclePartActor=none)
}