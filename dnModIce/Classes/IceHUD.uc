class IceHUD extends DukeHUD;

var Color YellowBar;
var MaterialEx dnCrosshair;
var float BarOffset;
var MaterialEx WeaponWheel;
var texture GradientTexture;
var texture IndexBarLeftTexture;
var texture IndexBarBottomTexture;
var texture InventoryBarTopTexture;
var texture InventoryBarBotTexture;
var texture InventoryCatHLTexture;
var texture InventoryCatHLTexture2;
var texture MiscBarTabTexture;
var texture MiscBarHLTexture;
var texture HUDTemplateTexture;
var texture ItemSlantTexture;
var texture ItemSlantHLTexture;
var texture MiscBarTexture;
var texture MiscBarTexture2;
var texture NumberCircleTexture;

function float ScaleHeight(Canvas C, float value)
{
	return value * (c.SizeY / 720.0);
}

function float ScaleWidth(Canvas C, float value)
{
	return value * (c.SizeX / 1280.0);
}

simulated event PreRender(Canvas Canvas)
{

}
	
simulated function DrawNewCrosshair(Canvas C)
{
	local int width;
	local int height;
	local Actor HitActor;
	local AIActor HitAIActor;
	local int i;

	width = dnCrosshair.GetUSize();
	height = dnCrosshair.GetVSize();	
	
	HitActor = PlayerOwner.TraceFromCrosshairMesh(6000);
	HitAIActor = AIActor(HitActor);

	if(HitAIActor != none)
	{
		C.DrawColor = RedColor;
	}

	for(i = 0; i < 3; i++)
	{
		C.SetPos(ScaleWidth(C, 640 - (width / 2)), ScaleHeight(C, 360 - (height / 2)));
		C.DrawTile(dnCrosshair, width, height, 0, 0, width, height);	
	}
	
	C.DrawColor = WhiteColor;
}

simulated event PostPostRender(Canvas C)
{
	local int ego;
	local int currentAmmo;
	local int loadedAmmo;
	local float egoPerct;
	local float ammoPerct;
	local float minorHudTextSize;
	local float majorHudTextSize;
	local float backScaleX;
	local float backScaleY;

	bHideHUD = false;
	bHideCrosshair = false;

	DrawNewCrosshair(C);

	backScaleX = ScaleWidth(C, 0.91);
	backScaleY = ScaleHeight(C, 0.91);

	C.Font = Font'BlockFont';
	
	DrawAmmoRoster(C);

	ego = PlayerOwner.Ego;

	if(PlayerOwner == none || PlayerOwner.EgoCap == 0)
	{
		egoPerct = 0;
	}
	else
	{
		egoPerct = ego / PlayerOwner.EgoCap;
	}

	if(PlayerOwner.Weapon == none || PlayerOwner.Weapon.GetMaximumAmmo() == 0)
	{
		loadedAmmo = 0;
		currentAmmo = 0;
		ammoPerct = 0;
	}
	else
	{
		loadedAmmo = PlayerOwner.Weapon.GetLoadedAmmo();
		currentAmmo = PlayerOwner.Weapon.GetTotalAmmo();
	
		if(PlayerOwner.Weapon.WeaponConfig.default.ReloadCount == 0)
		{
			ammoPerct = float(loadedAmmo) / float(PlayerOwner.Weapon.GetMaximumAmmo());
		}
		else
		{
			ammoPerct = float(loadedAmmo) / float(PlayerOwner.Weapon.WeaponConfig.default.ReloadCount);
		}

		// Log("ammoPerct = " $ ammoPerct $ " " $ loadedAmmo $ " " $ PlayerOwner.Weapon.WeaponConfig.default.ReloadClipAmmo);
	}	

	minorHudTextSize = ScaleWidth(C, 0.85 - (0.85 * 0.375));
	majorHudTextSize = ScaleWidth(C, 1.1 - (1.1 * 0.375));

	// Draw the index background bar.
	C.DrawColor = YellowBar;
	C.SetPos(0, C.SizeY-ScaleHeight(C, 233));	
	C.DrawScaledIcon(IndexBarLeftTexture, backScaleX, backScaleY);
	
	// C.DrawColor = YellowBar;
	// C.SetPos(450, C.SizeY-ScaleHeight(C, 650));
	// C.DrawScaledIcon(WeaponWheel, backScaleX, backScaleY);

	C.DrawColor = YellowBar;
	DrawStatusBar(C, ScaleWidth(C, 108), C.SizeY-ScaleHeight(C, 127), ScaleWidth(C, 184), ScaleHeight(C, 36), egoPerct);
	C.SetPos(ScaleWidth(C, 305), C.SizeY-ScaleHeight(C, 123));
	C.DrawText("" $ ego,,,,majorHudTextSize,majorHudTextSize);
	
	if(PlayerOwner.Weapon != none && PlayerOwner.Weapon.GetMaximumAmmo() > 0)
	{
		DrawStatusBar(C, ScaleWidth(C, 120), C.SizeY-ScaleHeight(C, 100), ScaleWidth(C, 166), ScaleHeight(C, 36), ammoPerct);
		C.SetPos(ScaleWidth(C, 300), C.SizeY-ScaleHeight(C, 96));
		C.DrawText("" $ loadedAmmo,,,,majorHudTextSize,majorHudTextSize);

		C.SetPos(ScaleWidth(C, 155), C.SizeY-ScaleHeight(C, 33));
		C.DrawText("" $ currentAmmo,,,,minorHudTextSize,minorHudTextSize);
	}
}

defaultproperties
{
	YellowBar=(R=40,G=106,B=254,A=0)
	dnCrosshair=hud_effects.crosshairs.crosshair11BC
    GradientTexture=hud_effects.ingame_hud.ing_gradient1BC
	IndexBarLeftTexture=HDHud.Hud.NewHud
	WeaponWheel=HDHud.Hud.weaponwheel
	IndexBarBottomTexture=hud_effects.ingame_hud.ingame_main_repeat1bc
	InventoryBarTopTexture=hud_effects.ingame_hud.ingame_wepbar1BC
	InventoryBarBotTexture=hud_effects.ingame_hud.ingame_wepbar2BC
	InventoryCatHLTexture=hud_effects.ingame_hud.ingame_wepbar_highlight1bc
	InventoryCatHLTexture2=hud_effects.ingame_hud.ingame_wepbar_highlight2bc
	ItemSlantTexture=hud_effects.ingame_hud.ingame_itemslant1bc
	ItemSlantHLTexture=hud_effects.ingame_hud.ingame_itemslant_highlightbc
	MiscBarTexture=hud_effects.ingame_hud.ingame_miscbar1bc
	MiscBarTexture2=hud_effects.ingame_hud.ingame_miscbar2bc
	NumberCircleTexture=hud_effects.ingame_hud.ingame_numbercircleBC
	BarOffset=0.0
}