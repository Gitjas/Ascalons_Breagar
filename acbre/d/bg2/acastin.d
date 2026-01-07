BEGIN ACANSTI1

IF ~NumTimesTalkedTo(0)~ THEN BEGIN START
SAY @0
++ @1 + 1
++ @2 + 2
++ @3 + 3
++ @4 + 4
END

IF ~~ THEN BEGIN 1
SAY @5 = @6 = @7
++ @8 + 2
++ @9 + 2
++ @10 + 3
++ @4 + 4
END

IF ~~ THEN BEGIN 2
SAY @11 = @12
++ @13 + 5
++ @14 + 3
++ @4 + 4
END

IF ~~ THEN BEGIN 3
SAY @15
++ @16 + 19
++ @17 + 4
END

IF ~~ THEN BEGIN 4
SAY @18
++ @19 + 6
++ @20 + 7
++ @21 + 8
END

IF ~~ THEN BEGIN 5
SAY @22 = @23
++ @19 + 6
++ @20 + 7
++ @21 + 8
END

IF ~~ THEN BEGIN 6
SAY @24
++ @25 + 9
++ @20 + 7
++ @21 + 8
END

IF ~~ THEN BEGIN 7
SAY @26
++ @25 + 9
++ @27 + 10
++ @21 + 8
END

IF ~~ THEN BEGIN 8
SAY @28 = @29
++ @30 + 11
++ @31 + 12
++ @32 + 9
END

IF ~~ THEN BEGIN 9
SAY @33 = @34 = @35
++ @30 + 11
++ @36 + 12
++ @37 + 10
END

IF ~~ THEN BEGIN 10
SAY @38 = @39
++ @30 + 11
++ @36 + 12
++ @40 + 13
++ @41 + 17
END

IF ~~ THEN BEGIN 11
SAY @42
++ @36 + 12
++ @43 + 13
++ @44 + 14
++ @45 + 15
END

IF ~~ THEN BEGIN 12
SAY @46 = @47 = @48 = @49
++ @44 + 14
++ @37 + 10
++ @40 + 13
++ @41 + 17
++ @50 + 15
END

IF ~~ THEN BEGIN 13
SAY @51
++ @44 + 14
++ @52 + 16
++ @41 + 17
++ @50 + 15
END

IF ~~ THEN BEGIN 14
SAY @53 = @54
++ @40 + 13
++ @41 + 17
++ @50 + 15
END

IF  ~~ THEN BEGIN 15
SAY @55
++ @40 + 13
++ @41 + 17
END

IF ~~ THEN BEGIN 16
SAY @56
++ @57 + 18
++ @58 + 17
END

IF ~~ THEN BEGIN 17
SAY @59
++ @60 + 19
++ @61 + 16
END

IF ~~ THEN BEGIN 18
SAY @62
IF ~~ THEN DO ~SetGlobal("ACANSTIQUEST","GLOBAL",1)EraseJournalEntry(@10032)EraseJournalEntry(@10033)EraseJournalEntry(@10034)AddJournalEntry(@10035,QUEST)~ EXIT
END

IF ~~ THEN BEGIN 19
SAY @63
IF ~~ THEN DO ~SetGlobal("ACANSTIQUEST","GLOBAL",5)EraseJournalEntry(@10032)EraseJournalEntry(@10033)EraseJournalEntry(@10034)EraseJournalEntry(@10035)AddJournalEntry(@10037,QUEST)CreateCreature("SHADOW01",[933.428],0)CreateCreature("SHADOW01",[1093.501],0)CreateCreature("SHADOW01",[1097.553],0)CreateCreature("SHADOW01",[999.651],0)CreateCreature("SHADOW01",[835.693],0)CreateCreature("SHADOW01",[719.655],0)Enemy()~ EXIT
END

IF ~RandomNum(3,1)Global("ACANSTIQUEST","GLOBAL",1)~ THEN BEGIN 22a
SAY @64
IF ~~ THEN EXIT
END

IF ~RandomNum(3,2)Global("ACANSTIQUEST","GLOBAL",1)~ THEN BEGIN 22b
SAY @65
IF ~~ THEN EXIT
END

IF ~RandomNum(3,3)Global("ACANSTIQUEST","GLOBAL",1)~ THEN BEGIN 22c
SAY @66
IF ~~ THEN EXIT
END

IF ~Global("ACANSTIQUEST","GLOBAL",3)~ THEN BEGIN 23
SAY @67
IF ~~ THEN DO ~SetGlobal("ACANSTIQUEST","GLOBAL",5)EraseJournalEntry(@10032)EraseJournalEntry(@10033)EraseJournalEntry(@10034)EraseJournalEntry(@10035)AddJournalEntry(@10037,QUEST)CreateCreature("SHADOW01",[933.428],0)CreateCreature("SHADOW01",[1093.501],0)CreateCreature("SHADOW01",[1097.553],0)CreateCreature("SHADOW01",[999.651],0)CreateCreature("SHADOW01",[835.693],0)CreateCreature("SHADOW01",[719.655],0)Enemy()~ EXIT
END

IF ~Global("ACANSTIQUEST","GLOBAL",4)~ THEN BEGIN 24
SAY @68
IF ~PartyHasItem("ACPOTN48")~ THEN REPLY @69 DO ~TakePartyItem("ACPOTN48")DestroyItem("ACPOTN48")~ + 25a
IF ~!PartyHasItem("ACPOTN48")~ THEN REPLY @70 + 25b
++ @71 + 25c
++ @72 + 25d
END

IF ~~ THEN BEGIN 25a
SAY @73
IF ~~ THEN DO ~SetGlobal("ACANSTIQUEST","GLOBAL",5)EraseJournalEntry(@10032)EraseJournalEntry(@10033)EraseJournalEntry(@10034)EraseJournalEntry(@10035)AddJournalEntry(@10036,QUEST_DONE)AddJournalEntry(@10037,QUEST)AddexperienceParty(28800)DropInventory()CreateVisualEffectObject("spholy",Myself)PlaySound("EFF_P15")DestroySelf()~ EXIT
END


IF ~~ THEN BEGIN 25b
SAY @74
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 25c
SAY @75
IF ~~ THEN DO ~SetGlobal("ACANSTIQUEST","GLOBAL",5)EraseJournalEntry(@10032)EraseJournalEntry(@10033)EraseJournalEntry(@10034)EraseJournalEntry(@10035)AddJournalEntry(@10037,QUEST)CreateCreature("SHADOW01",[933.428],0)CreateCreature("SHADOW01",[1093.501],0)CreateCreature("SHADOW01",[1097.553],0)CreateCreature("SHADOW01",[999.651],0)CreateCreature("SHADOW01",[835.693],0)CreateCreature("SHADOW01",[719.655],0)Enemy()~ EXIT
END

IF ~~ THEN BEGIN 25d
SAY @76
IF ~~ THEN EXIT
END