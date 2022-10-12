class IcePigCop extends PigCop_Shotgun;

var Sound pigPainSound;

// Set PicCop to look more like Duke3D and disabled stupid bezerker mechanic.
// Also increased health. 

event PostBeginPlay()
{
	super(AIActor).PostBeginPlay();	
}

event Tick(float DeltaSeconds)
{
	super(AIActor).Tick(DeltaSeconds);	
}

function TookDamage(Pawn Instigator, float Damage, Object.EPawnBodyPart Part, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	Damage = Damage * 0.75;

	if(!IsDead())
	{
		PlaySound(NS_Standard, pigPainSound, SLOT_Pain);
		SetHealth(Health - Damage);
		spawn(class'IceBloodChunks', Owner, , DamageOrigin);
	}

	if(IsDead())
	{
		Died(Instigator, int(Damage), DamageOrigin, DamageDirection, DamageType, HitBoneName);
	}
}

defaultproperties
{	
	pigPainSound=a_creatures.PIGCOP.PIGPN
	BloodSpurt=class'IceBloodChunks'
	Mesh=c_characters.PigCopC
}