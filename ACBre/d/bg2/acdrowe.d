BEGIN ACDROWE1
IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY @0
IF ~~ THEN DO ~CreateCreature("SENFOD01",[-1.-1],12)CreateCreature("SENFOD01",[-1.-1],12)Enemy()~ EXIT
END

BEGIN ACDROWE2
IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY @1
IF ~~ THEN DO ~CreateCreature("SENFOD01",[-1.-1],12)CreateCreature("SENFOD01",[-1.-1],12)CreateCreature("SENFOD01",[-1.-1],12)Enemy()~ EXIT
END

BEGIN ACDROWE3
IF ~!AreaCheck("ARAC07")NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY @2
IF ~~ THEN DO ~CreateCreature("SENFOD01",[-1.-1],12)CreateCreature("SENFOD01",[-1.-1],12)CreateCreature("SENFOD01",[-1.-1],12)CreateCreature("SENFOD01",[-1.-1],12)Enemy()~ EXIT
END

CHAIN
IF ~NumTimesTalkedToGT(0)Global("ACTOWERCLEAN","GLOBAL",0)~ THEN ACDROWE3 2
@3 DO ~SetGlobal("ACTOWERCLEAN","GLOBAL",1)DestroyItem("MINHP1")~
== ACBRE25B IF ~InParty("ACBRE")See("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN @4
== ACDROWE3 @5
EXIT

CHAIN
IF ~AreaCheck("ARAC07")~ THEN ACDROWE3 1
@6
==ACREG @7
==ACFORRES @8
==ACDROWE3 @9 DO ~ClearAllActions()StartCutSceneMode()SetNumTimesTalkedTo(0)StartCutScene("ACCUT15C")~
EXIT