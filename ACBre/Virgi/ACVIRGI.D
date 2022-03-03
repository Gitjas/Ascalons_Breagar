BEGIN ACVIRGI
IF ~Global("ACANSTIQUEST","GLOBAL",1)~ THEN BEGIN ANSTIN.1
SAY @4000
++ @4001 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",2)ActionOverride("Container 12",DestroyItem("ACPEPPER")ActionOverride("Container 12",DestroyItem("ACFIREFL")ActionOverride("Container 12",DestroyItem("MISC43")ActionOverride("Container 12",DestroyItem("POTN26")~ + ANSTIN.2
++ @4002 DO ~ActionOverride("Container 12",DestroyItem("ACPEPPER")ActionOverride("Container 12",DestroyItem("ACFIREFL")ActionOverride("Container 12",DestroyItem("MISC43")ActionOverride("Container 12",DestroyItem("POTN26")ActionOverride("ACVIRGI",GiveItemCreate("POTN26",[PC],0,0,0)ActionOverride("ACVIRGI",GiveItemCreate("ACFIREFL",[PC],0,0,0)ActionOverride("ACVIRGI",GiveItemCreate("ACPEPPER",[PC],0,0,0)ActionOverride("ACVIRGI",GiveItemCreate("MISC43",[PC],0,0,0)~ + ANSTIN.3
END

IF ~~ THEN BEGIN ANSTIN.3
SAY @4003
IF ~~ THEN DO ~DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN ANSTIN.2
SAY @4004
++ @4005 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
++ @4006 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
++ @4007 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
++ @4008 + 26
++ @4009 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
END

IF ~~ THEN BEGIN 25
SAY @4010
IF ~~ THEN DO ~ReallyForceSpell(LastTalkedToBy(),WIZARD_FIREBALL)DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN 26
SAY @4011
++ @4005 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
++ @4006 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
++ @4007 + 27
++ @4009 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
END

IF ~~ THEN BEGIN 27
SAY @4012
++ @4005 + 28
++ @4006 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
++ @4013 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
++ @4009 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
END

IF ~~ THEN BEGIN 28
SAY @0014
++ @4005 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
++ @4006 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
++ @4013 + 29
++ @4009 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
END

IF ~~ THEN BEGIN 29
SAY @4015
++ @4005  DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
++ @4006 + 30
++ @4009 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
END

IF ~~ THEN BEGIN 30
SAY @4016
++ @4005  DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
++ @4006 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",3)~ + 25
++ @4009 DO ~SetGlobal("ACANSTIQUEST","GLOBAL",4)~ + 31
END

IF ~~ THEN BEGIN 31
SAY @4017
IF ~~ THEN DO ~GiveItemCreate("ACPOTN48",LastTalkedToBy,0,0,0) DestroySelf()~ EXIT
END