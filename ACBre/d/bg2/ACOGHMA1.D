BEGIN ACOGHMA1
IF ~NumTimesTalkedTo(0)GlobalLT("ACBOOKWORK","GLOBAL",5)~ THEN BEGIN 1
SAY @0
++ @1 + 2
IF ~OR(3)PartyHasItem("ACTEXT1")PartyHasItem("ACTEXT2")PartyHasItem("ACTEXT3")Global("ACBOOKWORK","GLOBAL",0)~ THEN REPLY @2 + 3
IF ~OR(3)!PartyHasItem("ACTEXT1")!PartyHasItem("ACTEXT2")!PartyHasItem("ACTEXT3")GlobalGT("ACTEXTCOMPLETE","LOCALS",0)~ THEN REPLY @3 + 3a
IF ~PartyHasItem("ACTEXT1")PartyHasItem("ACTEXT2")PartyHasItem("ACTEXT3")Global("ACBOOKWORK","GLOBAL",1)~ THEN REPLY @3 DO ~EraseJournalEntry(@10050) AddJournalEntry(@10049,QUEST)~ + 3b
++ @4 + 4
END

IF ~NumTimesTalkedToGT(0)GlobalLT("ACBOOKWORK","GLOBAL",5)~ THEN BEGIN 1a
SAY @5
++ @1 + 2
IF ~OR(3)PartyHasItem("ACTEXT1")PartyHasItem("ACTEXT2")PartyHasItem("ACTEXT3")~ THEN REPLY @2 + 3
++ @4 + 4
END

IF ~Global("ACBOOKWORK","GLOBAL",5)~ THEN BEGIN WORKDONE
SAY @6
IF ~~ THEN DO ~SetGlobal("ACBOOKWORK","GLOBAL",6)AddexperienceParty(15000)GiveItemCreate("ACBOOK02",LastTalkedToBy(),0,0,0) EraseJournalEntry(@10053) AddJournalEntry(@10054,QUEST_DONE)~ EXIT
END

IF ~~ THEN BEGIN 2
SAY @7
++ @8 + 5
IF ~OR(3)PartyHasItem("ACTEXT1")PartyHasItem("ACTEXT2")PartyHasItem("ACTEXT3")~ THEN REPLY @2 + 3
++ @4 + 4
END

IF ~~ THEN BEGIN 3a
SAY @9
++ @10 + 5
++ @11 + 6
++ @12 + 7
++ @13 + 4
END

IF ~~ THEN BEGIN 3b
SAY @9
++ @14 + 9
++ @15 + 10
++ @16 + 4
++ @17 + 11
END

IF ~~ THEN BEGIN 4
SAY @18
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 5
SAY @19
++ @11 DO ~AddJournalEntry(@10052,QUEST)~ + 6
++ @12 DO ~AddJournalEntry(@10052,QUEST)~ + 7
++ @20 DO ~AddJournalEntry(@10052,QUEST)~ + 4
END

IF ~~ THEN BEGIN 6
SAY @21
++ @10 DO ~AddJournalEntry(@10051,QUEST)~ + 5
++ @12 DO ~AddJournalEntry(@10051,QUEST)~ + 7
++ @20 DO ~AddJournalEntry(@10051,QUEST)~ + 4
END


IF ~~ THEN BEGIN 7
SAY @22
++ @10 + 5
++ @11 + 6
++ @20 + 4
END

IF ~~ THEN BEGIN 9
SAY @23
IF ~PartyGoldGT(4999)~ THEN REPLY @24 + 12
IF ~PartyGoldLT(5000)~ THEN REPLY @25 + 13
IF ~PartyHasItem("BOOK89")~ THEN REPLY @26 + 14
++ @27 + 13
++ @17 + 11
++ @28 + 4
END

IF ~~ THEN BEGIN 10
SAY @29
IF ~PartyGoldGT(4999)~ THEN REPLY @24 + 12
IF ~PartyGoldLT(5000)~ THEN REPLY @25 + 13
IF ~PartyHasItem("BOOK89")~ THEN REPLY @26 + 14
++ @17 + 11
++ @28 + 4
END

IF ~~ THEN BEGIN 11
SAY @30
++ @31 + 9
++ @15 + 10
++ @28 + 4
END

IF ~~ THEN BEGIN 12
SAY @32
IF ~~ THEN DO ~TakePartyGold(5000)SetGlobal("ACBOOKWORK","GLOBAL",2)SetGlobalTimer("ACBOOKWORKTIMER","GLOBAL",ONE_DAY)AddexperienceParty(15000)TakePartyItem("ACTEXT1")TakePartyItem("ACTEXT2")TakePartyItem("ACTEXT3")EscapeAreaDestroy(10)
EraseJournalEntry(@10048)EraseJournalEntry(@10049)EraseJournalEntry(@10050)EraseJournalEntry(@10051) EraseJournalEntry(@10052) AddJournalEntry(@10053,QUEST)~ EXIT
END

IF ~~ THEN BEGIN 13
SAY @33
IF ~PartyHasItem("BOOK89")~ THEN REPLY @26 + 14
++ @34 + 4
END

IF ~~ THEN BEGIN 14
SAY @35
IF ~PartyHasItem("BOOK89")~ THEN REPLY @36 + 15
IF ~PartyGoldGT(4999)~ THEN REPLY @24 + 12
++ @28 + 4
END

IF ~~ THEN BEGIN 15
SAY @32
IF ~~ THEN DO ~TakePartyItem("BOOK89")SetGlobal("ACBOOKWORK","GLOBAL",2)SetGlobalTimer("ACBOOKWORKTIMER","GLOBAL",ONE_DAY)AddexperienceParty(15000)TakePartyItem("ACTEXT1")TakePartyItem("ACTEXT2")TakePartyItem("ACTEXT3")EscapeAreaDestroy(10)~ EXIT
END

IF ~Global("ACBOOKWORK","GLOBAL",6)RandomNum(3,1)~ THEN BEGIN 16
SAY @37
IF ~~ THEN EXIT
END

IF ~Global("ACBOOKWORK","GLOBAL",6)RandomNum(3,2)~ THEN BEGIN 17
SAY @38
IF ~~ THEN EXIT
END

IF ~Global("ACBOOKWORK","GLOBAL",6)RandomNum(3,3)~ THEN BEGIN 18
SAY @39
IF ~~ THEN EXIT
END

CHAIN
IF ~~ THEN ACOGHMA1 3
@40 DO ~EraseJournalEntry(@10048)~
= @41 = @42
==ACOGHMA1 IF ~OR(3)!PartyHasItem("ACTEXT1")!PartyHasItem("ACTEXT2")!PartyHasItem("ACTEXT3")~ THEN @43 DO ~AddJournalEntry(@10049,QUEST)~
==ACOGHMA1 IF ~PartyHasItem("ACTEXT1")PartyHasItem("ACTEXT2")PartyHasItem("ACTEXT3")~ THEN @44 DO ~AddJournalEntry(@10050,QUEST)~
END
IF ~OR(3)!PartyHasItem("ACTEXT1")!PartyHasItem("ACTEXT2")!PartyHasItem("ACTEXT3")~ THEN REPLY @10 DO ~SetGlobal("ACTEXTCOMPLETE","LOCALS",1)~ + 5
IF ~OR(3)!PartyHasItem("ACTEXT1")!PartyHasItem("ACTEXT2")!PartyHasItem("ACTEXT3")~ THEN REPLY @11 DO ~SetGlobal("ACTEXTCOMPLETE","LOCALS",1)~ + 6
IF ~OR(3)!PartyHasItem("ACTEXT1")!PartyHasItem("ACTEXT2")!PartyHasItem("ACTEXT3")~ THEN REPLY @12 DO ~SetGlobal("ACTEXTCOMPLETE","LOCALS",1)~ + 7
IF ~OR(3)!PartyHasItem("ACTEXT1")!PartyHasItem("ACTEXT2")!PartyHasItem("ACTEXT3")~ THEN REPLY @20 DO ~SetGlobal("ACTEXTCOMPLETE","LOCALS",1)~ + 4
IF ~PartyHasItem("ACTEXT1")PartyHasItem("ACTEXT2")PartyHasItem("ACTEXT3")~ THEN REPLY @31 DO ~SetGlobal("ACBOOKWORK","GLOBAL",1)~ + 9
IF ~PartyHasItem("ACTEXT1")PartyHasItem("ACTEXT2")PartyHasItem("ACTEXT3")~ THEN REPLY @15 DO ~SetGlobal("ACBOOKWORK","GLOBAL",1)~ + 10
IF ~PartyHasItem("ACTEXT1")PartyHasItem("ACTEXT2")PartyHasItem("ACTEXT3")~ THEN REPLY @17 DO ~SetGlobal("ACBOOKWORK","GLOBAL",1)~ + 11
IF ~PartyHasItem("ACTEXT1")PartyHasItem("ACTEXT2")PartyHasItem("ACTEXT3")~ THEN REPLY @28 DO ~SetGlobal("ACBOOKWORK","GLOBAL",1)~ + 4