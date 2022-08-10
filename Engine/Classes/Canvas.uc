/*******************************************************************************
 * Canvas generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Canvas extends Object
	native
	noexport;

const FW_DONTCARE = 0;
const FW_THIN = 100;
const FW_EXTRALIGHT = 200;
const FW_ULTRALIGHT = 200;
const FW_LIGHT = 300;
const FW_NORMAL = 400;
const FW_REGULAR = 400;
const FW_MEDIUM = 500;
const FW_SEMIBOLD = 600;
const FW_DEMIBOLD = 600;
const FW_BOLD = 700;
const FW_EXTRABOLD = 800;
const FW_ULTRABOLD = 800;
const FW_HEAVY = 900;
const FW_BLACK = 900;

var Font Font;
var float SpaceX;
var float SpaceY;
var float OrgX;
var float OrgY;
var float ClipX;
var float ClipY;
var float CurX;
var float CurY;
var float Z;
var byte Style;
var float CurYL;
var Color DrawColor;
var bool bCenter;
var bool bNoSmooth;
var bool bClamp;
var const int SizeX;
var const int SizeY;
var const int FixedX;
var const int FixedY;
var const float FixedScale;
var() Font SmallFont;
var() Font MedFont;
var() Font LargeFont;
var() Font HUDFont;
var() Font HUDFontSmall;
var() Font BlockFont;
var() Font BlockFontSmall;
var() Font TallFont;
var const Viewport Viewport;
var const int Frame;
var const int Render;
var(FontList) array<Font> BitmapFonts;
var(FontList) array<Font> TrueTypeFonts;
var FontBaseBlargo FontBase;

// Export UCanvas::execReset(FFrame&, void* const)
native(1230) final function Reset();

// Export UCanvas::execStrLen(FFrame&, void* const)
native(1231) final function StrLen(coerce string String, out float XL, out float YL)
{
	//native.String;
	//native.XL;
	//native.YL;	
}

// Export UCanvas::execDrawText(FFrame&, void* const)
native(1232) final function float DrawText(coerce string Text, optional bool CR, optional bool Wrap, optional bool Clip, optional float XScale, optional float YScale, optional float Alpha, optional float ShadowDrift)
{
	//native.Text;
	//native.CR;
	//native.Wrap;
	//native.Clip;
	//native.XScale;
	//native.YScale;
	//native.Alpha;
	//native.ShadowDrift;	
}

// Export UCanvas::execDrawTextDropShadowed(FFrame&, void* const)
native(1233) final function DrawTextDropShadowed(coerce string Text, optional bool CR, optional bool Wrap, optional bool Clip, optional float XScale, optional float YScale, optional float Alpha, optional float ShadowDrift)
{
	//native.Text;
	//native.CR;
	//native.Wrap;
	//native.Clip;
	//native.XScale;
	//native.YScale;
	//native.Alpha;
	//native.ShadowDrift;	
}

// Export UCanvas::execDrawTile(FFrame&, void* const)
native(1234) final function DrawTile(MaterialEx Tex, float XL, float YL, float u, float V, float UL, float VL, optional float Rotation, optional float rotationOffsetX, optional float rotationOffsetY, optional bool bilinear, optional float Alpha, optional bool mirrorHoriz, optional bool mirrorVert, optional float depthScale)
{
	//native.Tex;
	//native.XL;
	//native.YL;
	//native.u;
	//native.V;
	//native.UL;
	//native.VL;
	//native.Rotation;
	//native.rotationOffsetX;
	//native.rotationOffsetY;
	//native.bilinear;
	//native.Alpha;
	//native.mirrorHoriz;
	//native.mirrorVert;
	//native.depthScale;	
}

// Export UCanvas::execDrawActor(FFrame&, void* const)
native(1235) final function DrawActor(Actor A, bool Wireframe, optional bool ClearZ)
{
	//native.A;
	//native.Wireframe;
	//native.ClearZ;	
}

// Export UCanvas::execDrawTileClipped(FFrame&, void* const)
native(1236) final function DrawTileClipped(MaterialEx Tex, float XL, float YL, float u, float V, float UL, float VL, float fAlpha, bool bBilinear, float Rotation)
{
	//native.Tex;
	//native.XL;
	//native.YL;
	//native.u;
	//native.V;
	//native.UL;
	//native.VL;
	//native.fAlpha;
	//native.bBilinear;
	//native.Rotation;	
}

// Export UCanvas::execDrawTextClipped(FFrame&, void* const)
native(1237) final function DrawTextClipped(coerce string Text, optional bool bCheckHotKey, optional float XScale, optional float YScale, optional float Alpha, optional float ShadowDrift)
{
	//native.Text;
	//native.bCheckHotKey;
	//native.XScale;
	//native.YScale;
	//native.Alpha;
	//native.ShadowDrift;	
}

// Export UCanvas::execTextSize(FFrame&, void* const)
native(1238) final function TextSize(coerce string String, out float XL, out float YL, optional float XScale, optional float YScale)
{
	//native.String;
	//native.XL;
	//native.YL;
	//native.XScale;
	//native.YScale;	
}

// Export UCanvas::execDrawClippedActor(FFrame&, void* const)
native(1239) final function DrawClippedActor(Actor A, bool Wireframe, int X, int Y, int XB, int YB, optional bool ClearZ)
{
	//native.A;
	//native.Wireframe;
	//native.X;
	//native.Y;
	//native.XB;
	//native.YB;
	//native.ClearZ;	
}

// Export UCanvas::execDrawLine(FFrame&, void* const)
native(1240) final function DrawLine(Vector P1, Vector P2, optional bool Is3D)
{
	//native.P1;
	//native.P2;
	//native.Is3D;	
}

// Export UCanvas::execDrawColoredLine(FFrame&, void* const)
native(1241) final function DrawColoredLine(Vector P1, Vector P2, optional bool Is3D)
{
	//native.P1;
	//native.P2;
	//native.Is3D;	
}

// Export UCanvas::execDrawPortal(FFrame&, void* const)
native(1242) final function DrawPortal(int X, int Y, int Width, int Height, Actor CamActor, Vector CamLocation, Rotator CamRotation, optional int FOV, optional bool ClearZ)
{
	//native.X;
	//native.Y;
	//native.Width;
	//native.Height;
	//native.CamActor;
	//native.CamLocation;
	//native.CamRotation;
	//native.FOV;
	//native.ClearZ;	
}

// Export UCanvas::execGetScreenBounds(FFrame&, void* const)
native(1243) final function GetScreenBounds(Actor A, out float x1, out float x2, out float y1, out float y2, optional bool Collision)
{
	//native.A;
	//native.x1;
	//native.x2;
	//native.y1;
	//native.y2;
	//native.Collision;	
}

// Export UCanvas::execGetScreenXY(FFrame&, void* const)
native(1244) final function bool GetScreenXY(Vector V, out float X, out float Y)
{
	//native.V;
	//native.X;
	//native.Y;	
}

// Export UCanvas::execGetScreenXYNoClip(FFrame&, void* const)
native(1245) final function GetScreenXYNoClip(Vector V, out float X, out float Y)
{
	//native.V;
	//native.X;
	//native.Y;	
}

// Export UCanvas::execGetRenderBoundingBox(FFrame&, void* const)
native(1246) final function GetRenderBoundingBox(Actor A, out Vector Min, out Vector Max)
{
	//native.A;
	//native.Min;
	//native.Max;	
}

// Export UCanvas::execDrawCylinder(FFrame&, void* const)
native(1247) final function DrawCylinder(Vector Location, float Radius, float Height)
{
	//native.Location;
	//native.Radius;
	//native.Height;	
}

// Export UCanvas::execSetClampMode(FFrame&, void* const)
native(1248) final function SetClampMode(bool bClamp)
{
	//native.bClamp;	
}

// Export UCanvas::execFlush(FFrame&, void* const)
native(1249) final function Flush();

// Export UCanvas::execSetPos(FFrame&, void* const)
native(1250) final function SetPos(float X, float Y)
{
	//native.X;
	//native.Y;	
}

// Export UCanvas::execSetOrigin(FFrame&, void* const)
native(1251) final function SetOrigin(float X, float Y)
{
	//native.X;
	//native.Y;	
}

// Export UCanvas::execSetClip(FFrame&, void* const)
native(1252) final function SetClip(float X, float Y)
{
	//native.X;
	//native.Y;	
}

// Export UCanvas::execDrawScaledIcon(FFrame&, void* const)
native(1253) final function DrawScaledIcon(MaterialEx Tex, float ScaleX, float ScaleY, optional bool bNoBilinear)
{
	//native.Tex;
	//native.ScaleX;
	//native.ScaleY;
	//native.bNoBilinear;	
}

// Export UCanvas::execDrawScaledIconClipped(FFrame&, void* const)
native(1254) final function DrawScaledIconClipped(MaterialEx Tex, float ScaleX, float ScaleY, optional bool bNoBilinear)
{
	//native.Tex;
	//native.ScaleX;
	//native.ScaleY;
	//native.bNoBilinear;	
}

// Export UCanvas::execDrawIcon(FFrame&, void* const)
native(1255) final function DrawIcon(MaterialEx Tex, float Scale, optional float Alpha)
{
	//native.Tex;
	//native.Scale;
	//native.Alpha;	
}

// Export UCanvas::execDrawArc(FFrame&, void* const)
native(1256) final function DrawArc(float CenterX, float CenterY, float InnerRadius, float OuterRadius, float StartAngle, float EndAngle, float DeltaAngle, Color C, optional bool startCap, optional bool endCap, optional MaterialEx bodyMaterial, optional MaterialEx capMaterial)
{
	//native.CenterX;
	//native.CenterY;
	//native.InnerRadius;
	//native.OuterRadius;
	//native.StartAngle;
	//native.EndAngle;
	//native.DeltaAngle;
	//native.C;
	//native.startCap;
	//native.endCap;
	//native.bodyMaterial;
	//native.capMaterial;	
}

// Export UCanvas::execDrawBar(FFrame&, void* const)
native(1257) final function DrawBar(float leftX, float topY, float rightX, float bottomY, Color C, optional bool leftCap, optional bool rightCap, optional MaterialEx bodyMaterial, optional MaterialEx capMaterial)
{
	//native.leftX;
	//native.topY;
	//native.rightX;
	//native.bottomY;
	//native.C;
	//native.leftCap;
	//native.rightCap;
	//native.bodyMaterial;
	//native.capMaterial;	
}

// Export UCanvas::execDrawBlurryDesaturation(FFrame&, void* const)
native(1258) final function DrawBlurryDesaturation(float BlurBrightness, float Blur, float Desaturation, float Alpha)
{
	//native.BlurBrightness;
	//native.Blur;
	//native.Desaturation;
	//native.Alpha;	
}

// Export UCanvas::execNeeds480FontScalingFix(FFrame&, void* const)
native(1259) final function bool Needs480FontScalingFix();

// Export UCanvas::execDo480FontScalingFix(FFrame&, void* const)
native(1260) final function Do480FontScalingFix(out float OutFontScale, optional float MinScaleOverride)
{
	//native.OutFontScale;
	//native.MinScaleOverride;	
}

final function DrawPattern(MaterialEx Tex, float XL, float YL, float Scale)
{
	__NFUN_1234__(Tex, XL, YL, __NFUN_195__(__NFUN_199__(CurX, OrgX), Scale), __NFUN_195__(__NFUN_199__(CurY, OrgY), Scale), __NFUN_195__(XL, Scale), __NFUN_195__(YL, Scale));
	return;
}

final function DrawRect(MaterialEx Tex, float RectX, float RectY)
{
	__NFUN_1234__(Tex, RectX, RectY, 0, 0, float(Tex.__NFUN_1191__()), float(Tex.__NFUN_1192__()));
	return;
}

event LocalizationChange(string Language)
{
	__NFUN_355__(__NFUN_303__(__NFUN_303__(__NFUN_303__(string(self), "::LocalizationChanged("), Language), ")"));
	// End:0x3E
	if(__NFUN_308__(Language, "jpn"))
	{
	}
	return;
}

defaultproperties
{
	Z=1
	Style=1
	DrawColor=(B=6,G=1,R=255,A=7)
	SmallFont=Font'SmallFont'
	MedFont=FontTrueType'BlockFontSmall'
	LargeFont=FontTrueType'BlockFont'
	HUDFont=FontTrueType'BlockFont'
	HUDFontSmall=FontTrueType'BlockFontSmall'
	BlockFont=FontTrueType'BlockFont'
	BlockFontSmall=FontTrueType'BlockFontSmall'
	TallFont=FontTrueType'TallFont'
	BitmapFonts(0)=Struct'Object.Vector'
	BitmapFonts(1)=Font'SmallFont'
	BitmapFonts(2)=Function'Trigger.DisableTicking'
	BitmapFonts(3)=ObjectProperty'Pawn.BecomeFrozen.Jetpack'
	BitmapFonts(4)='PlayerPawn'
	BitmapFonts(5)='Object'
	BitmapFonts(6)=FontTrueType'BlockFont'
	BitmapFonts(7)=FontTrueType'BlockFontSmall'
	BitmapFonts(8)=FontTrueType'TallFont'
	BitmapFonts(9)=BoolProperty'Actor.CanBeUsedBy.ReturnValue'
	BitmapFonts(10)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(11)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(12)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(13)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(14)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(15)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(16)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(17)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(18)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(19)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(20)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(21)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(22)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(23)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(24)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(25)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(26)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(27)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(28)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(29)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(30)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(31)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	BitmapFonts(32)=
/* Exception thrown while deserializing BitmapFonts
System.IO.EndOfStreamException: Unable to read beyond the end of the stream.
   at System.IO.BinaryReader.ReadByte()
   at UELib.UnrealReader.ReadIndex() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 268
   at UELib.UObjectStream.ReadObject() in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\UnrealStream.cs:line 742
   at UELib.Core.UDefaultProperty.DeserializeDefaultPropertyValue(PropertyType type, DeserializeFlags& deserializeFlags) in E:\SteamLibrary\steamapps\common\DukeNukem\Tools\UnrealscriptDecompiler\Core\Classes\UDefaultProperty.cs:line 515 */
	Engine=1.467591E+14
}