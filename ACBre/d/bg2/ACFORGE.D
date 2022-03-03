APPEND ACBRESMI
IF ~Global("ACFORGE1","GLOBAL",3)~ THEN BEGIN 1stStone
SAY @0
++ @1 DO ~SetGlobal("ACFORGE1","GLOBAL",7)~ + StoneEnd3
++ @2 DO ~SetGlobal("ACFORGE1","GLOBAL",4)~ + StoneEnd
++ @3 DO ~SetGlobal("ACFORGE1","GLOBAL",7)~ + StoneEnd3
++ @4 DO ~SetGlobal("ACFORGE1","GLOBAL",7)~ + StoneEnd3
END

IF ~Global("ACFORGE1","GLOBAL",4)~ THEN BEGIN 2ndStone
SAY @5
++ @1 DO ~SetGlobal("ACFORGE1","GLOBAL",7)~ + StoneEnd3
++ @2 DO ~SetGlobal("ACFORGE1","GLOBAL",7)~ + StoneEnd3
++ @3 DO ~SetGlobal("ACFORGE1","GLOBAL",7)~ + StoneEnd3
++ @4 DO ~SetGlobal("ACFORGE1","GLOBAL",5)~ + StoneEnd
END

IF ~Global("ACFORGE1","GLOBAL",5)~ THEN BEGIN 3rdStone
SAY @6
++ @1 DO ~SetGlobal("ACFORGE1","GLOBAL",6)~ + StoneEnd2
++ @2 DO ~SetGlobal("ACFORGE1","GLOBAL",7)~ + StoneEnd3
++ @3 DO ~SetGlobal("ACFORGE1","GLOBAL",7)~ + StoneEnd3
++ @4 DO ~SetGlobal("ACFORGE1","GLOBAL",7)~ + StoneEnd3
END

IF ~~ THEN BEGIN StoneEnd
SAY @7
IF ~~ THEN DO ~ClearAllActions()StartCutScenemode()StartCutScene("ACCUT13a")~ EXIT
END

IF ~~ THEN BEGIN StoneEnd2
SAY @8
IF ~~ THEN DO ~ClearAllActions()StartCutScenemode()StartCutScene("ACCUT13b")~ EXIT
END

IF ~~ THEN BEGIN StoneEnd3
SAY @7
IF ~~ THEN DO ~ClearAllActions()StartCutScenemode()StartCutScene("ACCUT13c")~ EXIT
END
END

APPEND ACBREJ
IF ~Global("ACFORGE1","GLOBAL",7)~ THEN BEGIN StoneEndFail
SAY @9 = @10 = @11
IF ~~ THEN DO ~SetGlobal("ACFORGE1","GLOBAL",8)~ EXIT
END


IF ~Global("ACFORGE1","GLOBAL",6)~ THEN BEGIN StoneEndDunnit
SAY @12 = @13 = @14 
IF ~~ THEN DO ~SetGlobal("ACFORGE1","GLOBAL",8)AddexperienceParty(30000)~ EXIT
END
END