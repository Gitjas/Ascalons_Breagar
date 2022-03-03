APPEND ACBRE

IF ~%BGT_VAR2%
AreaCheck("AR0602")
OR(3) 
!InParty(Player1) 
!See(Player1) 
StateCheck(Player1,CD_STATE_NOTVALID)~ THEN BEGIN BG2.START.1
SAY @68
IF ~~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
END

IF ~%BGT_VAR2%Global("ACBREINPARTY","GLOBAL",0)
InParty(Player1) 
See(Player1) 
!StateCheck(Player1,CD_STATE_NOTVALID)~ THEN BEGIN BG2.START.2
SAY @69 
+ ~AreaCheck("AR0602")~ + @70 + BG2.1
+ ~!AreaCheck("AR0602")~ + @0 + BG2.5
++ @71 + BG2.2
++ @72 + BG2.3
END

IF ~~ THEN BEGIN BG2.1
SAY @73
++ @74 + BG2.4
++ @75 + BG2.2
++ @76 + BG2.3
END

IF ~~ THEN BEGIN BG2.2
SAY @77 = @78 = @79
IF ~~ THEN GOTO BG2.5
END

IF ~~ THEN BEGIN BG2.3
SAY @80 = @81
++ @82 + BG2.3a
++ @83 + BG2.3b
++ @84 + BG2.3c
++ @85 + BG2.4
END

IF ~~ THEN BEGIN BG2.3a
SAY @86
++ @87 + BG2.3b
++ @84 + BG2.3c
++ @85 + BG2.4
END

IF ~~ THEN BEGIN BG2.3b
SAY @88
++ @82 + BG2.3a
++ @84 + BG2.3c
++ @85 + BG2.4
END

IF ~~ THEN BEGIN BG2.3c
SAY @89
++ @82 + BG2.3a
++ @87 + BG2.3b
++ @85 + BG2.4
END

IF ~~ THEN BEGIN BG2.4
SAY @90
IF ~~ THEN GOTO BG2.5
END

IF ~~ THEN BEGIN BG2.6
SAY @91
IF ~~ THEN DO ~MakeGlobal()SetGlobal("ACBREINPARTY","GLOBAL",2)JoinParty()~ EXIT
END

END

CHAIN
IF ~~ THEN ACBRE BG2.7
@92 
== ACBRE IF ~AreaCheck("AR0602")~ THEN @93
== ACBRE IF ~!AreaCheck("AR0602")~ THEN @124
END
IF ~~ THEN DO ~SetGlobal("ACBREINPARTY","GLOBAL",3) SetDialog("ACBREP") MakeGlobal()EscapeAreaMove("AR0334",648,229,2)~ EXIT

CHAIN
IF ~~ THEN ACBRE BG2.5
@115 DO ~AddJournalEntry(@10026,QUEST)~
==BIMOEN2 IF ~InParty("IMOEN2")See("IMOEN2")!StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN @116
==BJAHEIR IF ~AreaCheck("AR0602") InParty("Jaheira")See("Jaheira")!StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @117
==BMINSC IF ~InParty("MINSC")See("MINSC")!StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @118
==ACBRE @119 
==ACBRE IF ~AreaCheck("AR0602")~ THEN @120
END
++ @121 + BG2.6
++ @122 + BG2.7