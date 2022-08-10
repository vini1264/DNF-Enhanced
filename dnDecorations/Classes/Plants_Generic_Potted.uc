/*******************************************************************************
 * Plants_Generic_Potted generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class Plants_Generic_Potted extends Plants_Generic
	abstract
	collapsecategories;

final function PositionProperly(Vector NewLocation)
{
	local KConstraint BaseConstraint;

	BaseConstraint = GetValidAutoConstraint(0);
	// End:0x1B
	if(__NFUN_339__(BaseConstraint, none))
	{
		return;
	}
	BaseConstraint.__NFUN_642__(0);
	__NFUN_621__(,,, false);
	BaseConstraint.__NFUN_645__(NewLocation);
	__NFUN_645__(NewLocation, true);
	__NFUN_621__(,,, true);
	BaseConstraint.__NFUN_642__(18);
	return;
}

function KarmaSetConstraintProperties(KConstraint ConstraintActor)
{
	// End:0x26
	if(__NFUN_340__(Owner, none))
	{
		ConstraintActor.KConstraintActor2 = KarmaActor(Owner);
	}
	return;
}

event Destroyed()
{
	super(dnDecoration).Destroyed();
	// End:0x1E
	if(__NFUN_341__(PhysicsEntityGroup, 'LevelPhysicsEntityGroup'))
	{
		__NFUN_816__('PlantPotsPhysicsEntityGroup');
	}
	return;
}

defaultproperties
{
	AutoConstraints=/* Array type was not detected. */
	bConstraintOnDeath=false
	BoneName=Root
	ConstraintMounting=(bDontActuallyMount=false,bHideable=false,bIndependentRotation=false,bIndependentLocation=false,bMatchParentLocation=false,bMatchParentRotation=false,bSurviveDismount=false,bDontScaleByDrawScale=false,bScaleByDrawScaleNonDefault=false,bTransformDrawScale3DChange=false,bTakeParentTag=false,bTransferToCorpse=false,bDontSetOwner=false,MountParentTag=None,DrawScaleOverride=0,AppendToTag=None,ForceTag=None,ForceEvent=None,MountMeshItem=None,MountOrigin=(X=1.291717E-41,Y=2.797242E-17,Z=0),Z=0)
	OtherConstraintActor=none
	OtherConstraintBone=None
	ConstraintClass=none
	ConstraintActor=none
}