BEGIN ACGROTHI

/* Ich mache die Bedingung etwas entspannter, damit man den Quest weiterspielen kann, wenn Breagar in der Gruppe ist
IF ~!Name("ACBRE",LastTalkedToBy())~ THEN BEGIN 0
*/

IF ~OR(3)
!InParty("ACBRE") 
!See("ACBRE") 
StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN BEGIN 0
SAY @0
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1
SAY @1
++ @2 + 2
++ @3 + 3
++ @4 + 4
++ @5 + 2
END

IF ~~ THEN BEGIN 2
SAY @6
IF ~~ THEN DO ~SetGlobal("ACGROTHIQUEST","GLOBAL",9)EscapeAreaDestroy(90)~ EXIT
END

IF ~~ THEN BEGIN 5
SAY @7 = @8
IF ~~ THEN DO ~AddJournalEntry(@10024,QUEST)SetGlobal("ACGROTHIQUEST","GLOBAL",2)EscapeAreaMove("%NEBaldursGate_SplurgingSturgeon_L1%",450,449,1)~ EXIT
END

IF ~~ THEN BEGIN 6
SAY @9 = @8
IF ~~ THEN DO ~AddJournalEntry(@10024,QUEST)SetGlobal("ACGROTHIQUEST","GLOBAL",2)EscapeAreaMove("%NEBaldursGate_SplurgingSturgeon_L1%",450,449,1)~ EXIT
END

IF ~~ THEN BEGIN 7
SAY @10 = @8
IF ~~ THEN DO ~AddJournalEntry(@10024,QUEST)SetGlobal("ACGROTHIQUEST","GLOBAL",2)EscapeAreaMove("%NEBaldursGate_SplurgingSturgeon_L1%",450,449,1)~ EXIT
END

IF ~Global("ACGROTHIQUEST","GLOBAL",2)
InParty("ACBRE") See("ACBRE") !StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN BEGIN 8
SAY @11
IF ~PartyHasItem("ACCONT01")~ THEN REPLY @12 DO ~SetGlobal("ACGROTHIQUEST","GLOBAL",3)TakePartyItem("ACCONT01")AddexperienceParty(600)~ + 9
++ @13 + 10
END


IF ~~ THEN BEGIN 9
SAY @14
IF ~~ THEN DO ~EraseJournalEntry(@10024)AddJournalEntry(@10025,QUEST_DONE)EscapeAreaDestroy(90)~ EXIT
END

IF ~~ THEN BEGIN 10
SAY @15
IF ~~ THEN EXIT
END

CHAIN
IF ~Global("ACGROTHIQUEST","GLOBAL",1)~ THEN ACBREJ GROTHI1
@16
==ACGROTHI @17 DO ~SetGabber(PLAYER1)~
==ACBREJ @18
==ACGROTHI @19
==ACBREJ @20
==ACGROTHI @21
==ACBREJ @22
==ACGROTHI @23
==ACBREJ @24
==ACGROTHI @25
==ACBREJ @26
==ACGROTHI @27
END
++ @28 EXTERN ACGROTHI 1

CHAIN
IF ~~ THEN ACGROTHI 3
@29
==ACBREJ @30
==ACGROTHI @31 = @32
==ACBREJ @33
==ACGROTHI @34
==ACBREJ @35
==ACGROTHI @36
==ACBREJ @37
==ACGROTHI @38 = @39
END
++ @40 + 5
++ @41 + 6
++ @42 + 7

CHAIN
IF ~~ THEN ACGROTHI 4
@43
==ACBREJ @44
==ACGROTHI @31 = @32
==ACBREJ @33
==ACGROTHI @34
==ACBREJ @35
==ACGROTHI @36
==ACBREJ @37
==ACGROTHI @38 = @39
END
++ @40 + 5
++ @41 + 6
++ @42 + 7