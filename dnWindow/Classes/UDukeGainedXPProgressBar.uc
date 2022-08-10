/*******************************************************************************
 * UDukeGainedXPProgressBar generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UDukeGainedXPProgressBar extends UDukeProgressBar;

var string StartText;
var string EndText;
var string CurrentText;
var float textlabesizeX;
var float TxtBarSpacing;
var Texture BarSheet;
var Color YellowBar;
var Color OrangeBar;
var Color GreyColor;
var Region BackBarRegion;
var Region FillBarRegion;
var Region FrontBarRegion;
var float GainedValue;
var float textscale;

function SetGainedValue(float gained)
{
	GainedValue = gained;
	return;
}

function Paint(Canvas C, float X, float Y)
{
	local Texture White;
	local float BarStartX, BarEndX, CurrentPCT, GainedPCT;
	local Color fillColor;
	local float StartTxtXL, StartTxtYL, EndTxtXL, EndTxtYL;

	C.Style = 1;
	White = class'WhiteTexture';
	// End:0x2A
	if(__NFUN_173__(EndValue, 0))
	{
		return;
	}
	BarHeight = __NFUN_195__(WinHeight, 0.5);
	// End:0x92
	if(__NFUN_170__(__NFUN_166__(EndValue, StartValue), 0))
	{
		CurrentPCT = __NFUN_196__(float(__NFUN_166__(CurrentValue, StartValue)), float(__NFUN_166__(EndValue, StartValue)));
		GainedPCT = __NFUN_196__(__NFUN_199__(GainedValue, float(StartValue)), float(__NFUN_166__(EndValue, StartValue)));
	}
	C.DrawColor = GreyColor;
	C.Font = C.TallFont;
	TextSize(C, StartText, StartTxtXL, StartTxtYL, textscale, textscale);
	TextSize(C, EndText, EndTxtXL, EndTxtYL, textscale, textscale);
	BarStartX = __NFUN_198__(StartTxtXL, TxtBarSpacing);
	BarEndX = __NFUN_199__(__NFUN_199__(WinWidth, __NFUN_195__(EndTxtXL, float(2))), TxtBarSpacing);
	ClipText(C, 0, __NFUN_196__(__NFUN_199__(WinHeight, StartTxtYL), 2), StartText,, textscale, textscale, 1, 2);
	C.DrawColor = WhiteColor;
	C.__NFUN_1250__(BarStartX, __NFUN_196__(__NFUN_199__(WinHeight, BarHeight), 2));
	C.__NFUN_1234__(BarSheet, __NFUN_199__(BarEndX, BarStartX), __NFUN_195__(BarHeight, 0.6), float(BackBarRegion.X), float(BackBarRegion.Y), float(BackBarRegion.W), float(BackBarRegion.h),,,, false, 1);
	C.DrawColor = OrangeBar;
	C.__NFUN_1250__(BarStartX, __NFUN_196__(__NFUN_199__(WinHeight, BarHeight), 2));
	C.__NFUN_1234__(BarSheet, __NFUN_195__(__NFUN_199__(BarEndX, BarStartX), GainedPCT), __NFUN_195__(BarHeight, 0.6), float(FillBarRegion.X), float(FillBarRegion.Y), __NFUN_195__(float(FillBarRegion.W), GainedPCT), float(FillBarRegion.h),,,, false, 1);
	C.DrawColor = YellowBar;
	C.__NFUN_1250__(BarStartX, __NFUN_196__(__NFUN_199__(WinHeight, BarHeight), 2));
	C.__NFUN_1234__(BarSheet, __NFUN_195__(__NFUN_199__(BarEndX, BarStartX), CurrentPCT), __NFUN_195__(BarHeight, 0.6), float(FillBarRegion.X), float(FillBarRegion.Y), __NFUN_195__(float(FillBarRegion.W), CurrentPCT), float(FillBarRegion.h),,,, false, 1);
	C.DrawColor = GreyColor;
	ClipText(C, __NFUN_198__(BarEndX, EndTxtXL), __NFUN_196__(__NFUN_199__(WinHeight, EndTxtYL), 2), EndText,, textscale, textscale, 1, 2);
	C.DrawColor = WhiteColor;
	return;
}

defaultproperties
{
	TxtBarSpacing=5
	BarSheet='dt_hud.ingame_hud.boostbar'
	YellowBar=(B=36,G=1,R=220,A=37)
	OrangeBar=(B=36,G=1,R=227,A=37)
	GreyColor=(B=36,G=1,R=192,A=37)
	BackBarRegion=(X=50,Y=84,W=398,h=15)
	FillBarRegion=(X=50,Y=108,W=398,h=15)
	FrontBarRegion=(X=50,Y=25,W=411,h=29)
	textscale=1
}