class IcePlayer extends DukePlayer;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();		
}

simulated function bool IsDead()
{
	if(ego <= 0)
	{
		// Death_LoadOrRestart();
		return true;
	}

	return false;
}

simulated function int GetWeaponPriority(Weapon Weap)
{
	return 1;
}