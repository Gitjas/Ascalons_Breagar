APPEND ACBREP

IF WEIGHT #-1 ~AreaCheck("bd4700")
GlobalLT("bd_plot","global",570)
~ THEN BEGIN 0 // from:
  SAY @95  /* ~Jetzt hauen wir erstmal diesen Dämon platt, würde ich vorschlagen!~ */
  IF ~~ THEN DO ~SetGlobal("ACBreagar_kicked_bd4700","global",1)
SetGlobal("bd_joined","locals",0)
SetGlobal("ACBREINPARTY","GLOBAL",3)~ EXIT
END

IF WEIGHT #-1 ~OR(2)
AreaCheck("BD0120")
AreaCheck("BD0130")
Global("ACBREINPARTY","GLOBAL",2)~ THEN BEGIN KICKOUT.KORLASZTOMB
SAY @11
++ @2 + KICKOUT.SOD1
++ @12 + KICKOUT.SOD5
++ @16 + KICKOUT.SOD3
END


IF WEIGHT #-1 ~%SoD_VAR% Global("ACBREINPARTY","GLOBAL",2)~ THEN BEGIN KICKOUT.SOD
SAY @11
++ @2 + KICKOUT.SOD1
++ ~Wartet hier auf mich.~ + KICKOUT.SOD2
+ ~GlobalGT("bd_npc_camp_chapter","global",1)
GlobalLT("bd_npc_camp_chapter","global",5)
OR(2)
!Range("ff_camp",999)
NextTriggerObject("ff_camp")
!IsOverMe("ACBre")~ + @96 /* ~I want you to go back to the camp. I'll come and find you later.~ */ DO ~SetGlobal("bd_npc_camp","locals",1)~ + KICKOUT.SOD4
++ @16 + KICKOUT.SOD3
END

IF ~~ THEN BEGIN KICKOUT.SOD1
SAY @13
IF ~~ THEN DO ~JoinParty()~ EXIT
END

IF ~~ THEN BEGIN KICKOUT.SOD2
SAY @4
IF ~~ THEN DO ~SetGlobal("bd_joined","locals",0) SetGlobal("ACBREINPARTY","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN KICKOUT.SOD3
SAY @17
IF ~~ THEN DO ~SetGlobal("bd_joined","locals",0) SetGlobal("ACBREINPARTY","GLOBAL",3)SetGlobal("ACBREBROKE","GLOBAL",1)EscapeAreaDestroy(90)~ EXIT
END

IF ~~ THEN BEGIN KICKOUT.SOD4
SAY @97 /* ~Dann werde ich dort auf Euch warten.~ */
IF ~~ THEN DO ~SetGlobal("bd_joined","locals",0) SetGlobal("ACBREINPARTY","GLOBAL",3)~ EXIT
END

IF ~~ THEN KICKOUT.SOD5
  SAY @94 /* ~Dann warte ich am Eingang zu dieser Gruft.~ */
  IF ~~ THEN DO ~SetGlobal("ACBREINPARTY","GLOBAL",3)
EscapeAreaMove("bd0120",945,1685,14)
~ EXIT
END


IF WEIGHT #-1 
~%SoD_VAR%Global("ACBREINPARTY","GLOBAL",3)~ THEN BEGIN REJOIN.SOD
SAY @19
++ @20 + REJOIN.SOD1
++ @21 EXIT
END


IF ~~ THEN BEGIN REJOIN.SOD1
SAY @22
IF ~~ THEN DO ~SetGlobal("ACBREINPARTY","GLOBAL",2)JoinParty()~ EXIT
END

END

I_C_T3 BDIMOEN 99 ACBre_SoDMurderComment
== ACBreP IF ~!Dead("ACBre")
InMyArea("ACBre")
!InParty("ACBre")~ THEN @100
== ACBreP IF ~Global("bd_player_exiled","global",0)
!Dead("ACBre")
InMyArea("ACBre")
!InParty("ACBre")~ THEN @98 /* ~Hrmpf. So richtig wohl ist mir bei Eurer Rolle bei der ganzen Sache nicht, <CHARNAME>. Nun ja. Lasst uns mal ein paar Meilen zwischen uns und die Stadt bringen, dann wird es alles anders aussehen.~ */
== ACBreP IF ~!Global("bd_player_exiled","global",0)
!Dead("ACBre")
InMyArea("ACBre")
!InParty("ACBre")~ THEN @99 /* ~Hrmpf. Bin schon irgendwie froh, Euch zu sehen. Blöde Sache, das Ganze. Lasst uns mal ein paar Meilen zwischen uns und die Stadt bringen, dann wird es alles anders aussehen.~ */
END
