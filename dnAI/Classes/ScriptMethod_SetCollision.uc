/*******************************************************************************
 * ScriptMethod_SetCollision generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_SetCollision extends ScriptMethod
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport Engine.Object.EBitModifier CollideWorld;
var() noexport Engine.Object.EBitModifier CollideActors;
var() noexport Engine.Object.EBitModifier BlockActors;
var() noexport Engine.Object.EBitModifier BlockPlayers;
var() noexport Engine.Object.EBitModifier BlockKarma;
var() noexport Engine.Object.EBitModifier AssumeValid;

event string GetMethodString()
{
	return __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__("SetCollision (", string(__NFUN_365__(class'EBitModifier', int(CollideWorld)))), ", "), string(__NFUN_365__(class'EBitModifier', int(CollideActors)))), ", "), string(__NFUN_365__(class'EBitModifier', int(BlockActors)))), ", "), string(__NFUN_365__(class'EBitModifier', int(BlockPlayers)))), ", "), string(__NFUN_365__(class'EBitModifier', int(BlockKarma)))), ", "), string(__NFUN_365__(class'EBitModifier', int(AssumeValid)))), ")");
	return;
}