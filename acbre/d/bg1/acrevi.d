BEGIN ACREVI
IF ~NumTimesTalkedTo(0)~ THEN BEGIN 1
SAY @0   
++ @1 + 2
++ @2 + 4
++ @3 + 3
END

IF ~~ THEN BEGIN 2
SAY @4   
++ @5 + 4
END

IF ~~ THEN BEGIN 3
SAY @6   
IF ~~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
END

IF ~~ THEN BEGIN 4
SAY @7   
IF ~~ THEN DO ~EraseJournalEntry(@10008)EscapeAreaMove("AC6701",696,438,1)~ UNSOLVED_JOURNAL @10011 EXIT
END

IF ~NumTimesTalkedTo(1)
OR(3) 
!InParty(Player1) 
!See(Player1) 
StateCheck(Player1,CD_STATE_NOTVALID)~ THEN BEGIN 5
SAY @8   
IF ~~ THEN DO ~SetNumTimesTalkedTo(1)~ EXIT
END

IF ~NumTimesTalkedTo(1)
InParty(Player1) 
See(Player1) 
!StateCheck(Player1,CD_STATE_NOTVALID)~ THEN BEGIN 6
SAY @9   
IF ~~ THEN DO ~ClearAllActions()StartCutSceneMode()StartCutScene("ACCUT_03")~ EXIT
END