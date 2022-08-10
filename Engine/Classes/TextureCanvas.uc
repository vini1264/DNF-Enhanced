/*******************************************************************************
 * TextureCanvas generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class TextureCanvas extends ProceduralTexture
	native
	safereplace
	hidecategories(Object);

var const transient int PaletteMap;

// Export UTextureCanvas::execInit(FFrame&, void* const)
native(1198) final function Init(int InUSize, int InVSize)
{
	//native.InUSize;
	//native.InVSize;	
}

// Export UTextureCanvas::execPrecache(FFrame&, void* const)
native(1199) final function Precache(Texture Tex)
{
	//native.Tex;	
}

// Export UTextureCanvas::execDrawPixel(FFrame&, void* const)
native(1200) final function DrawPixel(int X, int Y, byte Color, optional Texture Source)
{
	//native.X;
	//native.Y;
	//native.Color;
	//native.Source;	
}

// Export UTextureCanvas::execDrawLine(FFrame&, void* const)
native(1201) final function DrawLine(int x1, int y1, int x2, int y2, byte Color, optional Texture Source)
{
	//native.x1;
	//native.y1;
	//native.x2;
	//native.y2;
	//native.Color;
	//native.Source;	
}

// Export UTextureCanvas::execDrawTriangle(FFrame&, void* const)
native(1202) final function DrawTriangle(int x1, int y1, int x2, int y2, int X3, int Y3, byte Color, optional Texture Source, optional bool bWireframe)
{
	//native.x1;
	//native.y1;
	//native.x2;
	//native.y2;
	//native.X3;
	//native.Y3;
	//native.Color;
	//native.Source;
	//native.bWireframe;	
}

// Export UTextureCanvas::execDrawString(FFrame&, void* const)
native(1203) final function DrawString(Font f, int x1, int T1, string str, optional int Color)
{
	//native.f;
	//native.x1;
	//native.T1;
	//native.str;
	//native.Color;	
}

// Export UTextureCanvas::execDrawClear(FFrame&, void* const)
native(1204) final function DrawClear(byte Color)
{
	//native.Color;	
}

// Export UTextureCanvas::execDrawStatic(FFrame&, void* const)
native(1205) final function DrawStatic();

// Export UTextureCanvas::execDrawTile(FFrame&, void* const)
native(1206) final function DrawTile(Texture Tex, int X, int Y, int XL, int YL, int u, int V, int UL, int VL, optional bool bMasked)
{
	//native.Tex;
	//native.X;
	//native.Y;
	//native.XL;
	//native.YL;
	//native.u;
	//native.V;
	//native.UL;
	//native.VL;
	//native.bMasked;	
}

// Export UTextureCanvas::execTextSize(FFrame&, void* const)
native(1207) final function TextSize(string Text, out float XL, out float YL, Font Font)
{
	//native.Text;
	//native.XL;
	//native.YL;
	//native.Font;	
}

// Export UTextureCanvas::execForceTick(FFrame&, void* const)
native(1208) final function ForceTick(float Delta)
{
	//native.Delta;	
}

// Export UTextureCanvas::execSetParametric(FFrame&, void* const)
native(1209) final function SetParametric(bool bParametric)
{
	//native.bParametric;	
}

// Export UTextureCanvas::execSetDynamic(FFrame&, void* const)
native(1210) final function SetDynamic(bool bDynamic)
{
	//native.bDynamic;	
}

final function DrawStringDropShadowed(Font f, int X, int Y, string str, optional int ShadowOffset, optional int ColorPrimary, optional int ColorShadow)
{
	__NFUN_1203__(f, __NFUN_165__(X, ShadowOffset), __NFUN_165__(Y, ShadowOffset), str, ColorPrimary);
	__NFUN_1203__(f, X, Y, str, ColorShadow);
	return;
}

final function DrawBitmap(Texture Tex, int X, int Y, optional bool bMasked)
{
	// End:0x0E
	if(__NFUN_339__(Tex, none))
	{
		return;
	}
	__NFUN_1206__(Tex, X, Y, Tex.USize, Tex.VSize, 0, 0, Tex.USize, Tex.VSize, bMasked);
	return;
}

static function TextureCanvas StaticCreateTextureCanvas(Texture Tex, optional Object CanvasOwner)
{
	local TextureCanvas TCanvas;

	// End:0x28
	if(__NFUN_150__(__NFUN_339__(Tex, none), __NFUN_174__(int(Tex.Format), int(0))))
	{
		return none;
	}
	TCanvas = new (CanvasOwner) class'TextureCanvas';
	TCanvas.__NFUN_1198__(Tex.USize, Tex.VSize);
	TCanvas.NormalMap = Tex.NormalMap;
	TCanvas.SpecularMap = Tex.SpecularMap;
	TCanvas.EmissiveMap = Tex.EmissiveMap;
	TCanvas.BumpMap = Tex.BumpMap;
	TCanvas.SpecularScale = Tex.SpecularScale;
	TCanvas.BumpScale = Tex.BumpScale;
	TCanvas.BumpSmoothPasses = Tex.BumpSmoothPasses;
	TCanvas.Palette.Colors = Tex.Palette.Colors;
	TCanvas.DrawBitmap(Tex, 0, 0);
	return TCanvas;
	return;
}

defaultproperties
{
	CompressionMode=0
}