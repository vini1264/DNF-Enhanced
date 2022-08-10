/*******************************************************************************
 * TriggerPortal generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TriggerPortal extends Triggers
	collapsecategories
	notplaceable
	hidecategories(Filter,Interactivity,Karma,Lighting,Networking,Sound);

var() bool Enabled;
var() int X;
var() name XVariable;
var() int Y;
var() name YVariable;
var() int Width;
var() name WidthVariable;
var() int Height;
var() name HeightVariable;
var() bool DontDrawIfNoCameraActor;
var() Vector CameraLocation;
var() Rotator CameraRotation;
var() int FOV;
var() name FOVVariable;
var() bool ClearZ;
var() bool Fullscreen;
var() bool ScaleFrom640x480;
var() bool UsePawnViewRot;
var() Vector CameraOffset;

defaultproperties
{
	Enabled=true
	Width=128
	Height=128
	FOV=90
	ClearZ=true
	Fullscreen=true
}