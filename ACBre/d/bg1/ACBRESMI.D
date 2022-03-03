/* !InPartySlot(LastTalkedToBy(),0) ersetzt mit "OR(3) 
!InParty(Player1) 
!See(Player1) 
StateCheck(Player1,CD_STATE_NOTVALID)" */
/* InPartySlot(LastTalkedToBy(),0) ersetzt mit "InParty(Player1) 
See(Player1) 
!StateCheck(Player1,CD_STATE_NOTVALID)" */


APPEND ACBRESMI

/* Breagar war in der Gruppe, wurde aber entlassen (Armquest abgeschlossen: hat Silberarm) */
IF ~Global("ACSTORY","GLOBAL",5)%BGT_VAR%
InParty(Player1) 
See(Player1) 
!StateCheck(Player1,CD_STATE_NOTVALID)
Global("ACBREINPARTY","GLOBAL",3)~ THEN BEGIN ReJoin2.START
SAY @0
++ @1 + ReJoin.3a
++ @2 + ReJoin.2a
++ @3 + 1forg
++ @4 + Endit
END

IF ~~ THEN BEGIN Endit
SAY @5
IF ~~ THEN EXIT
END

/* Nachdem Breagar was geschmiedet hat */

IF ~%BGT_VAR%!Global("ACSTORY","GLOBAL",2)!Global("ACSTORY","GLOBAL",5)!Global("IRONDEALING","GLOBAL",1)Global("ACFORG01","LOCALS",1)~ THEN BEGIN Forge
SAY @6
IF ~~ THEN DO ~SetGlobal("ACFORG01","LOCALS",2)~ EXIT
END

/* Weder hat Breagar das Stück Eisen gerade genommen, noch ist der Armquest komplett abgeschlossen, noch wartet Breagar darauf, dass er dem HC das Eisen abkaufen kann, HC in der Nähe + Breagar war in der Gruppe */

IF ~%BGT_VAR%!Global("ACSTORY","GLOBAL",2)!Global("ACSTORY","GLOBAL",5)!Global("IRONDEALING","GLOBAL",1)
InParty(Player1) 
See(Player1) 
!StateCheck(Player1,CD_STATE_NOTVALID)
Global("ACBREINPARTY","GLOBAL",3)~ THEN BEGIN ReJoin
SAY @0
IF ~Global("ACSTORY","GLOBAL",0)~ THEN REPLY @7 + REMEET.8
IF ~Global("ACSTORY","GLOBAL",1)~ THEN REPLY @8 + IRONDEAL
++ @2 + ReJoin.2
++ @3 + 1forg
++ @4 + REMEET.3
END

/* Weder hat Breagar das Stück Eisen gerade genommen, noch ist der Armquest komplett abgeschlossen, einmal angesprochen, Player1 nicht in der Nähe */

IF ~%BGT_VAR%!Global("ACSTORY","GLOBAL",2)!Global("ACSTORY","GLOBAL",5)NumTimesTalkedTo(1)
OR(3) 
	!InParty(Player1) 
	!See(Player1) 
	StateCheck(Player1,CD_STATE_NOTVALID)
Global("ACBREINPARTY","GLOBAL",0)~ THEN BEGIN NoStart
SAY @9
IF ~~ THEN DO ~SetNumTimesTalkedTo(1)~ EXIT
END

/* Breagar das Stück Eisen nicht gerade genommen, mehr als einmal angesprochen, Player1 nicht in der Nähe */

IF ~%BGT_VAR%!Global("ACSTORY","GLOBAL",2)NumTimesTalkedToGT(1)
OR(3) 
	!InParty(Player1) 
	!See(Player1) 
	StateCheck(Player1,CD_STATE_NOTVALID)~ THEN BEGIN NoStart.A
SAY @10
IF ~~ THEN EXIT
END

/* Weder hat Breagar das Stück Eisen gerade genommen, noch ist der Armquest komplett abgeschlossen, noch wartet Breagar darauf, dass er dem HC das Eisen abkaufen kann, HC in der Nähe, einmal angesprochen + Breagar war NICHT in der Gruppe (erstes Ansprechen nach Breagars Wutausbruch unten) */


IF ~%BGT_VAR%!Global("ACSTORY","GLOBAL",2)!Global("ACSTORY","GLOBAL",5)!Global("IRONDEALING","GLOBAL",1)NumTimesTalkedTo(1)InParty(Player1) 
See(Player1) 
!StateCheck(Player1,CD_STATE_NOTVALID)
Global("ACBREINPARTY","GLOBAL",0)~ THEN BEGIN Start.1
SAY @11 
++ @12 + REMEET.1
++ @13 + REMEET.2
++ @14 + REMEET.4
++ @3 + 1forg
++ @4 + REMEET.3
END

/* Weder hat Breagar das Stück Eisen gerade genommen, noch ist der Armquest komplett abgeschlossen, noch wartet Breagar darauf, dass er dem HC das Eisen abkaufen kann, HC in der Nähe, MEHR ALS einmal angesprochen + Breagar war NICHT in der Gruppe */

IF ~%BGT_VAR%!Global("ACSTORY","GLOBAL",2)!Global("ACSTORY","GLOBAL",5)!Global("IRONDEALING","GLOBAL",1)NumTimesTalkedToGT(1)
InParty(Player1) 
See(Player1) 
!StateCheck(Player1,CD_STATE_NOTVALID)
Global("ACBREINPARTY","GLOBAL",0)~ THEN BEGIN Start.2
SAY @15
IF ~Global("ACSTORY","GLOBAL",0)~ THEN REPLY @16 + REMEET.8
IF ~Global("ACSTORY","GLOBAL",1)~ THEN REPLY @8 + IRONDEAL
++ @17 + REMEET.1
++ @13 + REMEET.2
++ @14 + REMEET.4
++ @3 + 1forg
++ @4 + REMEET.3
END

/* Breagar hat gerade das gute Stück Eisen bekommen, entweder war er vorher in der Gruppe und ist nun zur Schmiede gegangen, oder er war in der Schmiede und hat es dem HC abgekauft + HC ist NICHT in der Nähe */

IF ~%BGT_VAR%Global("ACSTORY","GLOBAL",2)
OR(3) 
	!InParty(Player1) 
	!See(Player1) 
	StateCheck(Player1,CD_STATE_NOTVALID)~ THEN BEGIN WORK.NOSTART
SAY @18
IF ~~ THEN EXIT
END

/* Breagar hat gerade das gute Stück Eisen bekommen, entweder war er vorher in der Gruppe und ist nun zur Schmiede gegangen, oder er war in der Schmiede und hat es dem HC abgekauft + HC IST in der Nähe */

IF ~%BGT_VAR%Global("ACSTORY","GLOBAL",2) 
InParty(Player1) 
See(Player1) 
!StateCheck(Player1,CD_STATE_NOTVALID)
NumTimesTalkedTo(0)~ THEN BEGIN WORK.START
SAY @19
++ @20 + WORK.1
++ @21 + WORK.2
IF ~!IsActive("TAEROM")~ THEN REPLY @22 + WORK.3a
IF ~IsActive("TAEROM")~ THEN REPLY @23 + WORK.3
END

IF ~~ THEN BEGIN REMEET.2
SAY @24
++ @12 + REMEET.1
++ @14 + REMEET.4
++ @3 + 1forg
++ @4 + REMEET.3
END

IF ~~ THEN BEGIN REMEET.3
SAY @25
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN REMEET.5
SAY @26
IF ~Global("ACSTORY","GLOBAL",1)~ THEN REPLY @27 + IRONDEAL
IF ~Global("ACSTORY","GLOBAL",0)~ THEN REPLY @28 + REMEET.6
IF ~Global("ACSTORY","GLOBAL",0)~ THEN REPLY @29 + REMEET.6a
END

IF ~~ THEN BEGIN REMEET.6a
SAY @30
IF ~~ THEN DO ~AddJournalEntry(@10005,QUEST)~ GOTO REMEET.8
END

IF ~~ THEN BEGIN REMEET.6
SAY @31
IF ~InParty("Khalid")InParty("Jaheira")~ THEN REPLY @32 UNSOLVED_JOURNAL @10005 + REMEET.7a
IF ~!InParty("Khalid")InParty("Jaheira")~ THEN REPLY @33 UNSOLVED_JOURNAL @10005 + REMEET.7b
IF ~InParty("Khalid")!InParty("Jaheira")~ THEN REPLY @34 UNSOLVED_JOURNAL @10005 + REMEET.7c
IF ~InParty("Xzar")InParty("Montaron")~ THEN REPLY @35 UNSOLVED_JOURNAL @10005 + REMEET.7d
IF ~!InParty("Xzar")InParty("Montaron")~ THEN REPLY @36 UNSOLVED_JOURNAL @10005 + REMEET.7e
IF ~InParty("Xzar")!InParty("Montaron")~ THEN REPLY @37 UNSOLVED_JOURNAL @10005 + REMEET.7f
IF ~!InParty("Khalid")!InParty("Jaheira")!InParty("Xzar")!InParty("Montaron")~ THEN REPLY @38 UNSOLVED_JOURNAL @10005 + REMEET.7g
END

IF ~~ THEN BEGIN REMEET.7a
SAY @39
IF ~~ THEN GOTO REMEET.8
END

IF ~~ THEN BEGIN REMEET.7b
SAY @40
IF ~~ THEN GOTO REMEET.8
END

IF ~~ THEN BEGIN REMEET.7c
SAY @41
IF ~~ THEN GOTO REMEET.8
END

IF ~~ THEN BEGIN REMEET.7d
SAY @42
IF ~~ THEN GOTO REMEET.8
END

IF ~~ THEN BEGIN REMEET.7e
SAY @43
IF ~~ THEN GOTO REMEET.8
END

IF ~~ THEN BEGIN REMEET.7f
SAY @44
IF ~~ THEN GOTO REMEET.8
END

IF ~~ THEN BEGIN REMEET.7g
SAY @25
IF ~~ THEN GOTO REMEET.8
END

IF ~~ THEN BEGIN REMEET.10
SAY @45 = @46
IF ~~ THEN EXIT //DO ~SetGlobal("ACBREINPARTY","GLOBAL",3)~ ##
END

IF ~~ THEN BEGIN 1forg
SAY @47 = @48
IF ~~ THEN DO ~SetGlobal("ACBRESMICANFORGE","GLOBAL",1)~ GOTO 3forg
END

IF ~~ THEN BEGIN 2forg
SAY @25
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 3forg
SAY @49
IF ~PartyHasItem("%tutu_var%AX1H01")~ THEN REPLY @50 DO ~SetGlobal("ACBRESMIAX1H01","GLOBAL",1)~ + 5forg
IF ~PartyHasItem("%tutu_var%BLUN02")~ THEN REPLY @51 DO ~SetGlobal("ACBRESMIBLUN02","GLOBAL",1)~ + 5forg
IF ~PartyHasItem("%tutu_var%BLUN04")~ THEN REPLY @52 DO ~SetGlobal("ACBRESMIBLUN04","GLOBAL",1)~ + 5forg
IF ~PartyHasItem("%tutu_var%BLUN06")~ THEN REPLY @53 DO ~SetGlobal("ACBRESMIBLUN06","GLOBAL",1)~ + 5forg
IF ~PartyHasItem("%tutu_var%DAGG01")~ THEN REPLY @54 DO ~SetGlobal("ACBRESMIDAGG01","GLOBAL",1)~ + 5forg
IF ~PartyHasItem("%tutu_var%DAGG06")~ THEN REPLY @55 + 4aforg
IF ~PartyHasItem("%tutu_var%DAGG07")~ THEN REPLY @56 + 4aforg
IF ~PartyHasItem("%tutu_var%HALB01")~ THEN REPLY @57 DO ~SetGlobal("ACBRESMIHALB01","GLOBAL",1)~ + 5forg
IF ~PartyHasItem("%tutu_var%SPER01")~ THEN REPLY @58 DO ~SetGlobal("ACBRESMISPER01","GLOBAL",1)~ + 5forg
IF ~PartyHasItem("%tutu_var%SW1H01")~ THEN REPLY @59 DO ~SetGlobal("ACBRESMISW1H01","GLOBAL",1)~ + 5forg
IF ~PartyHasItem("%tutu_var%SW1H04")~ THEN REPLY @60 DO ~SetGlobal("ACBRESMISW1H04","GLOBAL",1)~ + 5forg
IF ~PartyHasItem("%tutu_var%SW1H07")~ THEN REPLY @61 DO ~SetGlobal("ACBRESMISW1H07","GLOBAL",1)~ + 5forg
IF ~PartyHasItem("%tutu_var%SW1H12")~ THEN REPLY @62 + 4aforg
IF ~PartyHasItem("%tutu_var%SW1H17")~ THEN REPLY @63 + 4bforg
IF ~PartyHasItem("%tutu_var%SW1H20")~ THEN REPLY @64 DO ~SetGlobal("ACBRESMISW1H20","GLOBAL",1)~ + 6forg
IF ~PartyHasItem("SW1H43")~ THEN REPLY @65 DO ~SetGlobal("ACBRESMISW1H43","GLOBAL",1)~ + 6forg
IF ~PartyHasItem("SW1H46")~ THEN REPLY @66 DO ~SetGlobal("ACBRESMISW1H46","GLOBAL",1)~ + 6forg
IF ~PartyHasItem("SW1H48")~ THEN REPLY @67 DO ~SetGlobal("ACBRESMISW1H48","GLOBAL",1)~ + 6forg
IF ~PartyHasItem("%tutu_var%SW2H01")~ THEN REPLY @68 DO ~SetGlobal("ACBRESMISW2H01","GLOBAL",1)~ + 6forg
IF ~PartyHasItem("%tutu_scriptbg%MISC56")~ THEN REPLY @69 + 4forg
++ @70 + 2forg
END

IF ~~ THEN BEGIN 4forg
SAY @71
IF ~~ THEN GOTO 3forg
END

IF ~~ THEN BEGIN 4aforg
SAY @72
IF ~~ THEN GOTO 3forg
END

IF ~~ THEN BEGIN 4bforg
SAY @73
IF ~~ THEN GOTO 3forg
END

IF ~~ THEN BEGIN 5forg
SAY @74
IF ~PartyGoldGT(9)~ THEN REPLY @75 DO ~DestroyGold(10)~ + 7forg
++ @76 DO ~SetGlobal("ACBRESMIAX1H01","GLOBAL",0)SetGlobal("ACBRESMIBLUN02","GLOBAL",0)SetGlobal("ACBRESMIBLUN04","GLOBAL",0)SetGlobal("ACBRESMIBLUN06","GLOBAL",0)SetGlobal("ACBRESMIDAGG01","GLOBAL",0)SetGlobal("ACBRESMIHALB01","GLOBAL",0)SetGlobal("ACBRESMISPER01","GLOBAL",0)SetGlobal("ACBRESMISW1H01","GLOBAL",0)SetGlobal("ACBRESMISW1H04","GLOBAL",0)SetGlobal("ACBRESMISW1H07","GLOBAL",0)~ + 3forg
IF ~PartyGoldLT(10)~ THEN REPLY @77 DO ~SetGlobal("ACBRESMIAX1H01","GLOBAL",0)SetGlobal("ACBRESMIBLUN02","GLOBAL",0)SetGlobal("ACBRESMIBLUN04","GLOBAL",0)SetGlobal("ACBRESMIBLUN06","GLOBAL",0)SetGlobal("ACBRESMIDAGG01","GLOBAL",0)SetGlobal("ACBRESMIHALB01","GLOBAL",0)SetGlobal("ACBRESMISPER01","GLOBAL",0)SetGlobal("ACBRESMISW1H01","GLOBAL",0)SetGlobal("ACBRESMISW1H04","GLOBAL",0)SetGlobal("ACBRESMISW1H07","GLOBAL",0)~ + 3forg
END

IF ~~ THEN BEGIN 6forg
SAY @78
IF ~PartyGoldGT(19)~ THEN REPLY @75 DO ~DestroyGold(20)~ + 7forg
++ @76 DO ~SetGlobal("ACBRESMISW1H20","GLOBAL",0)SetGlobal("ACBRESMISW1H43","GLOBAL",0)SetGlobal("ACBRESMISW1H46","GLOBAL",0)SetGlobal("ACBRESMISW1H48","GLOBAL",0)SetGlobal("ACBRESMISW2H01","GLOBAL",0)~ + 3forg
IF ~PartyGoldLT(20)~ THEN REPLY @77 DO ~SetGlobal("ACBRESMISW1H20","GLOBAL",0)SetGlobal("ACBRESMISW1H43","GLOBAL",0)SetGlobal("ACBRESMISW1H46","GLOBAL",0)SetGlobal("ACBRESMISW1H48","GLOBAL",0)SetGlobal("ACBRESMISW2H01","GLOBAL",0)~ + 3forg
END

IF ~~ THEN BEGIN 7forg
SAY @79
IF ~Global("ACBRESMIAX1H01","GLOBAL",1)~ THEN DO ~SetGlobal("ACBRESMIAX1H01","GLOBAL",0)ClearAllActions()StartCutSceneMode()TakePartyItem("%tutu_var%AX1H01")DestroyItem("%tutu_var%AX1H01")GiveItemCreate("ACAX1H01",LastTalkedToBy(),0,0,0)StartCutScene("ACFORG01")~ EXIT
IF ~Global("ACBRESMIBLUN02","GLOBAL",1)~ THEN DO ~SetGlobal("ACBRESMIBLUN02","GLOBAL",0)ClearAllActions()StartCutSceneMode()TakePartyItem("%tutu_var%BLUN02")DestroyItem("%tutu_var%BLUN02")GiveItemCreate("ACBLUN02",LastTalkedToBy(),0,0,0)StartCutScene("ACFORG01")~ EXIT
IF ~Global("ACBRESMIBLUN04","GLOBAL",1)~ THEN DO ~SetGlobal("ACBRESMIBLUN04","GLOBAL",0)ClearAllActions()StartCutSceneMode()TakePartyItem("%tutu_var%BLUN04")DestroyItem("%tutu_var%BLUN04")GiveItemCreate("ACBLUN04",LastTalkedToBy(),0,0,0)StartCutScene("ACFORG01")~ EXIT
IF ~Global("ACBRESMIBLUN06","GLOBAL",1)~ THEN DO ~SetGlobal("ACBRESMIBLUN06","GLOBAL",0)ClearAllActions()StartCutSceneMode()TakePartyItem("%tutu_var%BLUN06")DestroyItem("%tutu_var%BLUN06")GiveItemCreate("ACBLUN06",LastTalkedToBy(),0,0,0)StartCutScene("ACFORG01")~ EXIT
IF ~Global("ACBRESMIDAGG01","GLOBAL",1)~ THEN DO ~SetGlobal("ACBRESMIDAGG01","GLOBAL",0)ClearAllActions()StartCutSceneMode()TakePartyItem("%tutu_var%DAGG01")DestroyItem("%tutu_var%DAGG01")GiveItemCreate("ACDAGG01",LastTalkedToBy(),0,0,0)StartCutScene("ACFORG01")~ EXIT
IF ~Global("ACBRESMIHALB01","GLOBAL",1)~ THEN DO ~SetGlobal("ACBRESMIHALB01","GLOBAL",0)ClearAllActions()StartCutSceneMode()TakePartyItem("%tutu_var%HALB01")DestroyItem("%tutu_var%HALB01")GiveItemCreate("ACHALB01",LastTalkedToBy(),0,0,0)StartCutScene("ACFORG01")~ EXIT
IF ~Global("ACBRESMISPER01","GLOBAL",1)~ THEN DO ~SetGlobal("ACBRESMISPER01","GLOBAL",0)ClearAllActions()StartCutSceneMode()TakePartyItem("%tutu_var%SPER01")DestroyItem("%tutu_var%SPER01")GiveItemCreate("ACSPER01",LastTalkedToBy(),0,0,0)StartCutScene("ACFORG01")~ EXIT
IF ~Global("ACBRESMISW1H01","GLOBAL",1)~ THEN DO ~SetGlobal("ACBRESMISW1H01","GLOBAL",0)ClearAllActions()StartCutSceneMode()TakePartyItem("%tutu_var%SW1H01")DestroyItem("%tutu_var%SW1H01")GiveItemCreate("ACSW1H01",LastTalkedToBy(),0,0,0)StartCutScene("ACFORG01")~ EXIT
IF ~Global("ACBRESMISW1H04","GLOBAL",1)~ THEN DO ~SetGlobal("ACBRESMISW1H04","GLOBAL",0)ClearAllActions()StartCutSceneMode()TakePartyItem("%tutu_var%SW1H04")DestroyItem("%tutu_var%SW1H04")GiveItemCreate("ACSW1H04",LastTalkedToBy(),0,0,0)StartCutScene("ACFORG01")~ EXIT
IF ~Global("ACBRESMISW1H07","GLOBAL",1)~ THEN DO ~SetGlobal("ACBRESMISW1H07","GLOBAL",0)ClearAllActions()StartCutSceneMode()TakePartyItem("%tutu_var%SW1H07")DestroyItem("%tutu_var%SW1H07")GiveItemCreate("ACSW1H07",LastTalkedToBy(),0,0,0)StartCutScene("ACFORG01")~ EXIT
IF ~Global("ACBRESMISW1H20","GLOBAL",1)~ THEN DO ~SetGlobal("ACBRESMISW1H20","GLOBAL",0)ClearAllActions()StartCutSceneMode()TakePartyItem("%tutu_var%SW1H20")DestroyItem("%tutu_var%SW1H20")GiveItemCreate("ACSW1H20",LastTalkedToBy(),0,0,0)StartCutScene("ACFORG01")~ EXIT
IF ~Global("ACBRESMISW1H43","GLOBAL",1)~ THEN DO ~SetGlobal("ACBRESMISW1H43","GLOBAL",0)ClearAllActions()StartCutSceneMode()TakePartyItem("SW1H43")DestroyItem("SW1H43")GiveItemCreate("ACSW1H43",LastTalkedToBy(),0,0,0)StartCutScene("ACFORG01")~ EXIT
IF ~Global("ACBRESMISW1H46","GLOBAL",1)~ THEN DO ~SetGlobal("ACBRESMISW1H46","GLOBAL",0)ClearAllActions()StartCutSceneMode()TakePartyItem("SW1H46")DestroyItem("SW1H46")GiveItemCreate("ACSW1H46",LastTalkedToBy(),0,0,0)StartCutScene("ACFORG01")~ EXIT
IF ~Global("ACBRESMISW1H48","GLOBAL",1)~ THEN DO ~SetGlobal("ACBRESMISW1H48","GLOBAL",0)ClearAllActions()StartCutSceneMode()TakePartyItem("SW1H48")DestroyItem("SW1H48")GiveItemCreate("ACSW1H48",LastTalkedToBy(),0,0,0)StartCutScene("ACFORG01")~ EXIT
IF ~Global("ACBRESMISW2H01","GLOBAL",1)~ THEN DO ~SetGlobal("ACBRESMISW2H01","GLOBAL",0)ClearAllActions()StartCutSceneMode()TakePartyItem("%tutu_var%SW2H01")DestroyItem("%tutu_var%SW2H01")GiveItemCreate("ACSW2H01",LastTalkedToBy(),0,0,0)StartCutScene("ACFORG01")~ EXIT
END

IF ~~ THEN BEGIN ReJoin.3
SAY @80
IF ~~ THEN DO ~SetGlobal("ACBREINPARTY","GLOBAL",1)MoveGlobal("%Beregost%","ACBRE",[4595.3063])EscapeAreaMove("AC9999",222,222,0)~ EXIT
END

IF ~~ THEN BEGIN ReJoin.3a
SAY @81
IF ~~ THEN DO ~SetGlobal("ACBREINPARTY","GLOBAL",1)MoveGlobal("%Beregost%","ACBRE",[4595.3063])EscapeAreaMove("AC9999",222,222,0)~ EXIT
END

IF ~~ THEN BEGIN IRONDEAL
SAY @82
IF ~PartyHasItem("ACIRON")~ THEN REPLY @83 + IRONDEAL.1
++ @84 + IRONDEAL.2
END


/* Weder hat Breagar das Stück Eisen gerade genommen, noch ist der Armquest komplett abgeschlossen, Breagar WARTET darauf, dass er dem HC das Eisen abkaufen kann, HC in der Nähe [--+ Breagar war in der Gruppe--] */

/* Habe das "Global("ACBREINPARTY","GLOBAL",3)" entfernt - dieser Dialog sollte auch triggern, wenn Breagar nicht in der Gruppe war */

IF ~!Global("ACSTORY","GLOBAL",2)!Global("ACSTORY","GLOBAL",5)
InParty(Player1) 
See(Player1) 
!StateCheck(Player1,CD_STATE_NOTVALID)
Global("IRONDEALING","GLOBAL",1)%BGT_VAR%~ THEN BEGIN IRONDEAL.1
SAY @85
IF ~PartyHasItem("ACIRON")~ THEN REPLY @86 + IRONDEAL.4
IF ~PartyHasItem("ACIRON")~ THEN REPLY @87 + IRONDEAL.5
IF ~!PartyHasItem("ACIRON")~ THEN REPLY @88 + IRONDEAL.7
++ @89 + IRONDEAL.6
END

IF ~~ THEN BEGIN IRONDEAL.2
SAY @90
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN IRONDEAL.3
SAY @91
++ @86 + IRONDEAL.4
++ @87 + IRONDEAL.5
++ @89 + IRONDEAL.6
END

IF ~~ THEN BEGIN IRONDEAL.4
SAY @92 = @93
IF ~~ THEN DO ~EraseJournalEntry(@10005)AddJournalEntry(@10006,QUEST)SetNumTimesTalkedTo(0)SetGlobal("IRONDEALING","GLOBAL",2)SetGlobal("ACSTORY","GLOBAL",2)TakePartyItem("ACIRON")DestroyItem("ACIRON")TakePartyItem("ACBOOK")DestroyItem("ACBOOK")AddexperienceParty(300)~ EXIT
END

IF ~~ THEN BEGIN IRONDEAL.5
SAY @94
++ @86 + IRONDEAL.4
IF ~RandomNum(5,1)~ THEN REPLY @95 + IRONDEAL.5a
IF ~RandomNum(5,2)~ THEN REPLY @96 + IRONDEAL.5b
IF ~RandomNum(5,3)~ THEN REPLY @97 + IRONDEAL.5c
IF ~RandomNum(5,4)~ THEN REPLY @98 + IRONDEAL.5d
IF ~RandomNum(5,5)~ THEN REPLY @99 + IRONDEAL.5e
++ @89 + IRONDEAL.6
END

IF ~~ THEN BEGIN IRONDEAL.5a
SAY @100
++ @86 + IRONDEAL.4
IF ~RandomNum(5,1)~ THEN REPLY @95 + IRONDEAL.5
IF ~RandomNum(5,2)~ THEN REPLY @96 + IRONDEAL.5b
IF ~RandomNum(5,3)~ THEN REPLY @97 + IRONDEAL.5c
IF ~RandomNum(5,4)~ THEN REPLY @98 + IRONDEAL.5d
IF ~RandomNum(5,5)~ THEN REPLY @99 + IRONDEAL.5e
++ @89 + IRONDEAL.6
END

IF ~~ THEN BEGIN IRONDEAL.5b
SAY @101
++ @86 + IRONDEAL.4
IF ~RandomNum(5,1)~ THEN REPLY @95 + IRONDEAL.5a
IF ~RandomNum(5,2)~ THEN REPLY @96 + IRONDEAL.5
IF ~RandomNum(5,3)~ THEN REPLY @97 + IRONDEAL.5c
IF ~RandomNum(5,4)~ THEN REPLY @98 + IRONDEAL.5d
IF ~RandomNum(5,5)~ THEN REPLY @99 + IRONDEAL.5e
++ @89 + IRONDEAL.6
END

IF ~~ THEN BEGIN IRONDEAL.5c
SAY @102
++ @86 + IRONDEAL.4
IF ~RandomNum(5,1)~ THEN REPLY @95 + IRONDEAL.5a
IF ~RandomNum(5,2)~ THEN REPLY @96 + IRONDEAL.5b
IF ~RandomNum(5,3)~ THEN REPLY @97 + IRONDEAL.5
IF ~RandomNum(5,4)~ THEN REPLY @98 + IRONDEAL.5d
IF ~RandomNum(5,5)~ THEN REPLY @99 + IRONDEAL.5e
++ @89 + IRONDEAL.6
END

IF ~~ THEN BEGIN IRONDEAL.5d
SAY @103
++ @86 + IRONDEAL.4
IF ~RandomNum(5,1)~ THEN REPLY @95 + IRONDEAL.5a
IF ~RandomNum(5,2)~ THEN REPLY @96 + IRONDEAL.5b
IF ~RandomNum(5,3)~ THEN REPLY @97 + IRONDEAL.5c
IF ~RandomNum(5,4)~ THEN REPLY @98 + IRONDEAL.5
IF ~RandomNum(5,5)~ THEN REPLY @99 + IRONDEAL.5e
++ @89 + IRONDEAL.6
END

IF ~~ THEN BEGIN IRONDEAL.5e
SAY @104
++ @86 + IRONDEAL.4
IF ~RandomNum(5,1)~ THEN REPLY @95 + IRONDEAL.5a
IF ~RandomNum(5,2)~ THEN REPLY @96 + IRONDEAL.5b
IF ~RandomNum(5,3)~ THEN REPLY @97 + IRONDEAL.5c
IF ~RandomNum(5,4)~ THEN REPLY @98 + IRONDEAL.5d
IF ~RandomNum(5,5)~ THEN REPLY @99 + IRONDEAL.5
++ @89 + IRONDEAL.6
END

IF ~~ THEN BEGIN IRONDEAL.6
SAY @105
IF ~~ THEN DO ~SetGlobal("IRONDEALING","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN IRONDEAL.7
SAY @106
IF ~~ THEN DO ~SetGlobal("ACBREBROKE","GLOBAL",1)EscapeAreaDestroy(90)~ EXIT
END

IF ~~ THEN BEGIN WORK.1
SAY @107
IF ~!IsActive("TAEROM")~ THEN REPLY @108 + WORK.4a
IF ~IsActive("TAEROM")~ THEN REPLY @108 + WORK.4
++ @109 + WORK.5
IF ~!IsActive("TAEROM")~ THEN REPLY @110 + WORK.6a
IF ~IsActive("TAEROM")~ THEN REPLY @110 + WORK.6
IF ~!IsActive("TAEROM")~ THEN REPLY @111 + WORK.3a
IF ~IsActive("TAEROM")~ THEN REPLY @111 + WORK.3
END

IF ~~ THEN BEGIN WORK.2
SAY @112
++ @109 + WORK.5
IF ~!IsActive("TAEROM")~ THEN REPLY @108 + WORK.4a
IF ~IsActive("TAEROM")~ THEN REPLY @108 + WORK.4
IF ~!IsActive("TAEROM")~ THEN REPLY @110 + WORK.6a
IF ~IsActive("TAEROM")~ THEN REPLY @110 + WORK.6
IF ~!IsActive("TAEROM")~ THEN REPLY @111 + WORK.3a
IF ~IsActive("TAEROM")~ THEN REPLY @111 + WORK.3
END

IF ~~ THEN BEGIN WORK.3
SAY @113
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN WORK.3a
SAY @114
IF ~~ THEN DO ~SetGlobal("AC6701TELEPORT","GLOBAL",1)ClearAllActions()StartCutSceneMode()StartCutScene("ACCUT_01")~ EXIT
END

IF ~~ THEN BEGIN WORK.4
SAY @115 = @116
++ @21 + WORK.2
++ @109 + WORK.5
IF ~IsActive("TAEROM")~ THEN REPLY @23 + WORK.3
IF ~!IsActive("TAEROM")~ THEN REPLY @23 + WORK.3a
END

IF ~~ THEN BEGIN WORK.4a
SAY @117 
IF ~~ THEN DO ~SetGlobal("AC6701TELEPORT","GLOBAL",1)ClearAllActions()StartCutSceneMode()StartCutScene("ACCUT_01")~ EXIT
END

IF ~~ THEN BEGIN WORK.6
SAY @118
++ @109 + WORK.5
IF ~!IsActive("TAEROM")~ THEN REPLY @108 + WORK.4a
IF ~IsActive("TAEROM")~ THEN REPLY @108 + WORK.4
IF ~!IsActive("TAEROM")~ THEN REPLY @111 + WORK.3a
IF ~IsActive("TAEROM")~ THEN REPLY @111 + WORK.3
END

IF ~~ THEN BEGIN WORK.6a
SAY @119 
IF ~~ THEN DO ~SetGlobal("AC6701TELEPORT","GLOBAL",1)ClearAllActions()StartCutSceneMode()StartCutScene("ACCUT_01")~ EXIT
END

END

/* 
Weder hat Breagar das Stück Eisen gerade genommen, noch ist der Armquest komplett abgeschlossen, noch nie mit ihm geredet (Wutausbruch nachdem der HC gerade zur Tür hereinkam ) */

CHAIN
IF ~%BGT_VAR%!Global("ACSTORY","GLOBAL",2)!Global("ACSTORY","GLOBAL",5)NumTimesTalkedTo(0)~ THEN ACBRESMI START
@120
==ACBRESMI IF ~InMyArea("TAEROM")~ THEN @121  = @122  = @123
==%tutu_var%TAEROM IF ~IsActive("TAEROM")InMyArea("TAEROM")~ THEN @124
==ACBRESMI IF ~IsActive("TAEROM")InMyArea("TAEROM")~ THEN @125
==%tutu_var%TAEROM IF ~IsActive("TAEROM")InMyArea("TAEROM")~ THEN @126
==ACBRESMI IF ~IsActive("TAEROM")InMyArea("TAEROM")~ THEN @127
==%tutu_var%TAEROM IF ~IsActive("TAEROM")InMyArea("TAEROM")~ THEN @128
==ACBRESMI IF ~IsActive("TAEROM")InMyArea("TAEROM")~ THEN @129
==%tutu_var%TAEROM IF ~IsActive("TAEROM")InMyArea("TAEROM")~ THEN @130
==ACBRESMI IF ~IsActive("TAEROM")InMyArea("TAEROM")~ THEN @131
==%tutu_var%TAEROM IF ~IsActive("TAEROM")InMyArea("TAEROM")~ THEN @132
==ACBRESMI IF ~IsActive("TAEROM")InMyArea("TAEROM")~ THEN @133
==ACBRESMI IF ~!IsActive("TAEROM")!InMyArea("TAEROM")~ THEN @134
END
IF ~~ THEN DO ~SetGlobal("ACBRETAEROM","GLOBAL",3)MoveToPointNoInterrupt([851.508])Face(10)~ EXIT

CHAIN
IF ~~ THEN ACBRESMI REMEET.1
@135 
= @136 DO ~MakeGlobal()~
==%tutu_var%TAEROM IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @137
==ACBRESMI IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @138
==%tutu_var%TAEROM IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @139
==ACBRESMI IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @140
==%tutu_var%TAEROM IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @141
==ACBRESMI IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @142
==%tutu_var%TAEROM IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @143
==ACBRESMI IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @144
==ACBRESMI IF ~OR(3)!IsActive("TAEROM")!InMyArea("TAEROM")StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @145
END
IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN REPLY @146 + REMEET.5
IF ~Global("ACSTORY","GLOBAL",0)~ THEN REPLY @28 + REMEET.6
IF ~Global("ACSTORY","GLOBAL",1)~ THEN REPLY @8 + IRONDEAL
++ @147 + REMEET.6a

CHAIN
IF ~~ THEN ACBRESMI REMEET.4
@148
==%tutu_var%TAEROM IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @149
==ACBRESMI IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @150
==ACBRESMI IF ~OR(3)!IsActive("TAEROM")!InMyArea("TAEROM")StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @151
END
++ @12 + REMEET.1
++ @152 + 1forg
++ @4 + REMEET.3

CHAIN
IF ~~ THEN ACBRESMI REMEET.8
@153 = @154
==%tutu_var%TAEROM IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @155
==ACBRESMI IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @156
END
++ @157 + REMEET.9
++ @158 + REMEET.10

CHAIN
IF ~~ THEN ACBRESMI REMEET.9
@159 
==%IMOEN_BANTER% IF ~InParty("%IMOEN_DV%")See("%IMOEN_DV%")!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @160
==%KAGAIN_BANTER% IF ~InParty("KAGAIN")See("KAGAIN")!StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @161
==%JAHEIRA_BANTER% IF ~InParty("JAHEIRA")See("JAHEIRA")!StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @162
==ACBRESMI @163
END
IF ~~ THEN DO ~SetGlobal("ACBREINPARTY","GLOBAL",1)MoveGlobal("%Beregost%","ACBRE",[4595.3063])EscapeAreaMove("AC9999",222,222,0)~ EXIT

CHAIN
IF ~~ THEN ACBRESMI ReJoin.2
@164
==%tutu_var%TAEROM IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @165
==ACBRESMI IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @166
END
IF ~Global("ACSTORY","GLOBAL",0)~ THEN REPLY @167 + ReJoin.3
IF ~Global("ACSTORY","GLOBAL",1)~ THEN REPLY @8 + IRONDEAL
++ @168 + 1forg
++ @4 + REMEET.3

CHAIN
IF ~~ THEN ACBRESMI IRONDEAL.1a
@169
==%KHALID_BANTER% IF ~InParty("KHALID")See("KHALID")!StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @170
==%KAGAIN_BANTER% IF ~InParty("KAGAIN")See("KAGAIN")!StateCheck("KAGAIN",CD_STATE_NOTVALID)~ THEN @171
END
++ @172 + IRONDEAL.4
++ @173 + IRONDEAL.3
IF ~!PartyHasItem("ACIRON")~ THEN REPLY @88 + IRONDEAL.7
++ @89 + IRONDEAL.6

CHAIN
IF ~~ THEN ACBRESMI WORK.5
@174
==ACBRESMI IF ~IsActive("TAEROM")~ THEN @175
==ACBRESMI IF ~!IsActive("TAEROM")~ THEN @176 DO ~SetGlobal("AC6701TELEPORT","GLOBAL",1)ClearAllActions()StartCutSceneMode()StartCutScene("ACCUT_01")~
EXIT

/* Breagar hat das Stück Eisen erhalten, HC in der Nähe, bereits mit ihm gesprochen */

CHAIN
IF ~%BGT_VAR%Global("ACSTORY","GLOBAL",2)
InParty(Player1) 
See(Player1) 
!StateCheck(Player1,CD_STATE_NOTVALID)
NumTimesTalkedToGT(0)~ THEN ACBRESMI Letithappen
@177
==ACBRESMI IF ~IsActive("TAEROM")~ THEN @178
==ACBRESMI IF ~!IsActive("TAEROM")~ THEN @179 DO ~SetGlobal("AC6701TELEPORT","GLOBAL",1)ClearAllActions()StartCutSceneMode()StartCutScene("ACCUT_01")~
EXIT

CHAIN
IF ~~ THEN ACBRESMI ReJoin.2a
@180
==%tutu_var%TAEROM IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @181
==ACBRESMI IF ~IsActive("TAEROM")InMyArea("TAEROM")!StateCheck("TAEROM",CD_STATE_NOTVALID)~ THEN @166
END
++ @1 + ReJoin.3a
++ @168 + 1forg
++ @4 + Endit

