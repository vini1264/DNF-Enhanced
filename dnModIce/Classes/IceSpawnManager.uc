class IceSpawnManager extends Actor;

event Spawned()
{
	Log("Ice Spawn Manager Created Successfully");
	super.Spawned();
}

function PreGameInitHook(Object obj)
{
	if(Actor(obj) != none)
	{
		// Actor(obj).bUseShadowTag = false;
		Actor(obj).bCastStencilShadows = true;
		// Actor(obj).bForceDirectionalShadows = true;
		
		// PistolPickup_Gold(obj).InventoryType=Class'IcePistol';
		
		// ShotgunPickup(obj).InventoryType=Class'IceShotgun';
		
		// MachineGunPickup(obj).InventoryType=Class'IceMachineGun';
		
		// RPGPickup(obj).InventoryType=Class'IceRPG';
		
		// DevastatorPickup(obj).InventoryType=Class'IceDevastator';
		
		return;
	}
}


function PostEntitySpawn(Object obj)
{
	local int i;	
	
	if(Pistol_Gold(obj) != none)
	{
		Log("!!PISTOL CHANGED DAMAGE!!!");
		// Pistol_Gold(obj).BaseDamagePerShot = 20;
		// Pistol_Gold(obj).InventoryReferenceClass=Class'IcePistol';
		// Pistol_Gold(obj).WeaponConfig=Class'IcePistolWeaponConfig';
		
		return;
	}
	
	if(Shotgun(obj) != none)
	{
		// Shotgun(obj).BaseDamagePerShot = 14;
		// Shotgun(obj).HighBaseDamagePerShot = 19;
		// Shotgun(obj).DamageFalloffStart = 0;
		// Shotgun(obj).DamageFalloffEnd = 0;
		// Shotgun(obj).InventoryReferenceClass=Class'IceShotgun';
		// Shotgun(obj).WeaponConfig=Class'IceShotgunWeaponConfig';
		// Shotgun_Strapless(obj).WeaponConfig=Class'IceShotgunWeaponConfig';
		// Shotgun_Strapless(obj).InventoryReferenceClass=Class'IceShotgun';
		// Shotgun_Strapless_Pigcop(obj).WeaponConfig=Class'IceShotgunWeaponConfig_Pigcop';
		// Shotgun_Strapless_Pigcop(obj).InventoryReferenceClass=Class'IceShotgun';
		
		return;
	}
	
	if(MachineGun(obj) != none)
	{
		// MachineGun(obj).BaseDamagePerShot = 12;
		// MachineGun(obj).WeaponConfig=Class'IceMachineGunWeaponConfig';
		// MachineGun(obj).InventoryReferenceClass=Class'IceMachineGun';
		// MachineGun_Pigcop(obj).InventoryReferenceClass=Class'IceMachineGun';
		// MachineGun_Pigcop_SuperAccurate(obj).InventoryReferenceClass=Class'IceMachineGun';
		
		return;
	}
	
	if(RPG(obj) != none)
	{
		// RPG(obj).WeaponConfig=Class'IceRPGWeaponConfig';
		// RPG(obj).InventoryReferenceClass=Class'IceRPG';
		// RPG_EDF(obj).WeaponConfig=Class'IceRPG_AIWeaponConfig';
		// RPG_EDF(obj).InventoryReferenceClass=Class'IceRPG';
		// RPG_Pigcop(obj).WeaponConfig=Class'IceRPGWeaponConfig_Pigcop';
		// RPG_Pigcop(obj).InventoryReferenceClass=Class'IceRPG';
		
		return;
	}
	
	if(Devastator(obj) != none)
	{
		// Devastator(obj).InventoryReferenceClass=Class'IceDevastator';
		// Devastator(obj).WeaponConfig=Class'IceDevastatorWeaponConfig';
		
		return;
	}
	
	if(RPGAmmo(obj) != none)
	{
		// RPGAmmo(obj).Charge = 20;
		// RPGAmmo(obj).MaxCharge = 20;
		
		return;
	}
	
	if(DevastatorAmmo(obj) != none)
	{
		// DevastatorAmmo(obj).Charge = 99;
		// DevastatorAmmo(obj).MaxCharge = 99;
		
		return;
	}
}
