/* Breagars SoD Einmischdialoge etc. */

/* the dwarven miners. Do not kill them for the Lich! */

I_C_T BDCOLDH 17 ACBre_BDCOLDH_17
== ACBreJ IF ~InParty("ACBRE")See("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN @0
END



APPEND ACBreJ

/* 
IF
	OR(2)
		Global("BD_DOD_COLDH_CONSIDER","LOCALS",1)
		Global("BD_DOD_KILL_CLERICS","GLOBAL",1)
	!Dead("BDDEEP")
	!Dead("BDDEEP2")
	Global("ACBre_BDCOLDH_17","GLOBAL",1)
*/

IF ~Global("ACBre_BDCOLDH_17","GLOBAL",2)~ THEN dwarven_lich
SAY @1
IF ~~ THEN DO ~SetGlobal("ACBre_BDCOLDH_17","GLOBAL",3)~ EXIT
END

/*
IF 
	OR(4)
		Allegiance("BDDEEP",[ENEMY])
		Allegiance("BDDEEP2",[ENEMY])
		!Dead("BDDEEP")
		!Dead("BDDEEP2")
	OR(2)
		See("BDDEEP")
		See("BDDEEP2")
*/


IF ~Global("ACBre_SoDDeepvein","LOCALS",1)~ THEN attack_dwarves
SAY @2
IF ~~ THEN DO ~SetGlobal("ACBREINPARTY","GLOBAL",3)LeaveParty()Enemy()~ EXIT
END

END //APPEND

/* Thrix's game */

ADD_TRANS_TRIGGER BDTHRIX 13 ~!IsValidForPartyDialogue("ACBre")~ DO 1

EXTEND_BOTTOM BDTHRIX 21 22 23 24 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 
IF ~Global("ACBre_SoDThrix","GLOBAL",0) IsValidForPartyDialogue("ACBre")~ THEN + breagar
END




APPEND BDTHRIX

IF ~~ THEN BEGIN breagar
  SAY @3
  IF ~~ THEN REPLY @4 DO ~SetGlobal("ACBre_SoDThrix","GLOBAL",2)
SetGlobal("bd_thrix_sacrifice_companion","global",1)
~ EXTERN ACBreJ thrix_01
  IF ~~ THEN REPLY @5 DO ~SetGlobal("ACBre_SoDThrix","GLOBAL",1)
IncrementGlobal("BD_NumInParty","bd4500",1)
~ EXTERN ACBreJ thrix_02
  IF ~~ THEN REPLY @6 GOTO 113
  IF ~~ THEN REPLY @7 GOTO 12
END

END //APPEND


CHAIN
IF ~~ THEN ACBreJ thrix_01
@8 
== BDTHRIX @9
END
  IF ~RandomNum(4,1)~ THEN EXTERN ~BDTHRIX~ 70
  IF ~RandomNum(4,2)~ THEN EXTERN ~BDTHRIX~ 71
  IF ~RandomNum(4,3)~ THEN EXTERN ~BDTHRIX~ 72
  IF ~RandomNum(4,4)~ THEN EXTERN ~BDTHRIX~ 73
  IF ~!Global("BD_NumInParty","bd4500",1)
!Global("BD_NumInParty","bd4500",2)
!Global("BD_NumInParty","bd4500",3)
!Global("BD_NumInParty","bd4500",4)~ THEN EXTERN ~BDTHRIX~ 114


APPEND ACBreJ

IF ~~ THEN BEGIN thrix_02
  SAY @10 
  IF ~  RandomNum(4,1)
~ THEN EXTERN ~BDTHRIX~ 74
  IF ~  RandomNum(4,2)
~ THEN EXTERN ~BDTHRIX~ 75
  IF ~  RandomNum(4,3)
~ THEN EXTERN ~BDTHRIX~ 76
  IF ~  RandomNum(4,4)
~ THEN EXTERN ~BDTHRIX~ 77
  IF ~  !Global("BD_NumInParty","bd4500",1)
!Global("BD_NumInParty","bd4500",2)
!Global("BD_NumInParty","bd4500",3)
!Global("BD_NumInParty","bd4500",4)
~ THEN EXTERN ~BDTHRIX~ 114
END


/* Reaktion auf Thrixs Wette */

/* HC hat Breagars Seele angeboten
IF
	Global("ACBre_SoDThrix","GLOBAL",2)

*/


IF ~Global("ACBre_SoDThrix","GLOBAL",3)~ THEN thrix_followup
SAY @11
++ @12 + thrix_followup_03
++ @13 + thrix_followup_04
+ ~Global("bd_thrix_sacrifice_self","global",1)~ + @14 + thrix_followup_05
+ ~Global("bd_thrix_sacrifice_companion","global",1)~ + @14 + thrix_followup_01
+ ~Global("bd_thrix_sacrifice_self","global",0)~ + @15 + thrix_followup_09
END

IF ~~ THEN thrix_followup_01
SAY @16
IF ~Global("bd_thrix_sacrifice_companion","global",1) ~ THEN + thrix_followup_06
IF ~OR(2)
Global("BD_THRIX_ANGERED","GLOBAL",1)
Global("BD_Thrix_riddle_won","GLOBAL",1)~ THEN + thrix_followup_02
END

IF ~~ THEN thrix_followup_02
SAY @17
IF ~~ THEN DO ~SetGlobal("ACBre_SoDThrix","GLOBAL",4)~ EXIT
END

IF ~~ THEN thrix_followup_03
SAY @18
IF ~Global("bd_thrix_sacrifice_companion","global",1)~ THEN + thrix_followup_06
IF ~Global("bd_thrix_sacrifice_self","global",1)~ THEN + thrix_followup_07
IF ~OR(2)
Global("BD_THRIX_ANGERED","GLOBAL",1)
Global("BD_Thrix_riddle_won","GLOBAL",1)~ THEN + thrix_followup_02
END

IF ~~ THEN thrix_followup_04
SAY @19
IF ~Global("bd_thrix_sacrifice_companion","global",1)~ THEN + thrix_followup_06
IF ~!Global("ACBre_SoDThrix","GLOBAL",5) Global("bd_thrix_sacrifice_self","global",1)~ THEN + thrix_followup_07
IF ~Global("ACBre_SoDThrix","GLOBAL",5) Global("bd_thrix_sacrifice_self","global",1)~ THEN + thrix_followup_10
IF ~OR(2)
Global("BD_THRIX_ANGERED","GLOBAL",1)
Global("BD_Thrix_riddle_won","GLOBAL",1)~ THEN + thrix_followup_02
END

IF ~~ THEN thrix_followup_05
SAY @20
IF ~~ THEN + thrix_followup_07
END

IF ~~ THEN thrix_followup_06
SAY @21
IF ~~ THEN DO ~SetGlobal("ACBre_SoDThrix","GLOBAL",4)~ EXIT
END

IF ~~ THEN thrix_followup_07
SAY @22
IF ~~ THEN DO ~SetGlobal("ACBre_SoDThrix","GLOBAL",4)~ EXIT
END

/* wenn der HC einen anderen Kameraden verwettet hat */

IF ~Global("ACBre_SoDThrix","GLOBAL",5)~ THEN thrix_followup_08
SAY @23
++ @24 + thrix_followup_04
++ @25 + thrix_followup_01
++ @26 + thrix_followup_09
+ ~Global("bd_thrix_sacrifice_self","global",0)~ + @15 + thrix_followup_09
END

IF ~~ THEN thrix_followup_09
SAY @27
IF ~Global("bd_thrix_sacrifice_companion","global",1)~ THEN + thrix_followup_06
IF ~Global("bd_thrix_sacrifice_self","global",1)~ THEN + thrix_followup_10
IF ~OR(2)
Global("BD_THRIX_ANGERED","GLOBAL",1)
Global("BD_Thrix_riddle_won","GLOBAL",1)~ THEN + thrix_followup_02
END

IF ~~ THEN thrix_followup_10
SAY @28
IF ~~ THEN DO ~SetGlobal("ACBre_SoDThrix","GLOBAL",4)~ EXIT
END

END //APPEND









