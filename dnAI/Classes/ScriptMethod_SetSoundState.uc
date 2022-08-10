/*******************************************************************************
 * ScriptMethod_SetSoundState generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ScriptMethod_SetSoundState extends ScriptMethod
	native
	exportstructs
	hidecategories(Object);

cpptext
{
// Stripped
}

var() noexport bool EnableSounds "If true, the AI will play his normal sounds. If false, he will not.";

event string GetMethodString()
{
	return __NFUN_302__(__NFUN_302__("EnableSounds (", string(EnableSounds)), ")");
	return;
}