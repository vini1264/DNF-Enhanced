/*******************************************************************************
 * Details_Generic_MouseTrap_Cheese generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Details_Generic_MouseTrap_Cheese extends Details_Generic;

event TakeDamage(Pawn Instigator, float Damage, Vector DamageOrigin, Vector DamageDirection, class<DamageType> DamageType, optional name HitBoneName, optional Vector DamageStart)
{
	MountParent.TakeDamage(Instigator, Damage, DamageOrigin, DamageDirection, DamageType, HitBoneName, DamageStart);
	return;
}

simulated event DetachedFromMountParent()
{
	super(Actor).DetachedFromMountParent();
	// End:0x2A
	if(__NFUN_145__(bGibActor))
	{
		bGibActor = true;
		Level.NoteSpawnedGib(self);
	}
	__NFUN_621__(bCollideActors, bBlockActors, bBlockPlayers, true);
	__NFUN_642__(18);
	bTickOnlyWhenPhysicsAwake = true;
	return;
}

defaultproperties
{
	HealthPrefab=0
	bIgnorePawnAirCushion=true
	PhysicsMaterial='dnMaterial.dnPhysicsMaterial_Rubber'
	bBlockKarma=false
	Mass=5
	StaticMesh='sm_class_decorations.RatTrap.RatTrap_Cheese'
}