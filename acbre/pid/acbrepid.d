APPEND ACBREJ

IF ~TRUE()~ THEN BEGIN PID
SAY @0
IF ~AreaCheck("AR0334")Global("ACFORGE1","GLOBAL",2)PartyHasItem("ACSTONE1")PartyHasItem("ACSTONE2")PartyHasItem("ACSTONE3")~ THEN REPLY @1 DO ~SetGlobal("ACFORGE1","GLOBAL",3)~ + PID.FORGE
//Energy cells from ID:
/* Guergar forge in AR0603 */
IF ~AreaCheck("AR0603")
Global("ACMISC4E","GLOBAL",4)
PartyHasItem("ACHAND3")
PartyHasItem("MISC4E")
AreaCheck("AR0603")
OR(4)
	Range("Forge1",20)
	Range("Forge2",20)
	Range("Forge3",20)
	Range("Forge4",20)~ THEN REPLY @117 /* ~Ich denke jetzt sollten wir Zeit haben, damit Ihr an der Schmiede arbeiten könnt, Breagar.~ */ + PID_enerygcells
/* Cromwell */
IF ~AreaCheck("AR0334")
Global("ACBREKNOWSCROMWELL","GLOBAL",1)
GlobalLT("ACMISC4E","GLOBAL",5)
PartyHasItem("ACHAND3")
PartyHasItem("MISC4E")~ THEN REPLY @118 /* ~Ihr meintet Ihr würdet gerne etwas mit den Energiezellen aus dem Gefängnis von Irenicus ausprobieren. Dort waren wir nicht mehr dazu gekommen. Wollt Ihr es hier versuchen?~ */ + PID_enerygcells_cromwell
IF ~AreaCheck("AR0334")
Global("ACMISC4E","GLOBAL",5)
PartyHasItem("ACHAND3")
PartyHasItem("MISC4E")~ THEN REPLY @119 /* ~Macht das mit dem Schmieden der Energiezellen. Wir haben dafür jetzt Zeit.~ */ + PID_enerygcells
IF ~Global("ACBREPID1","GLOBAL",1)~ THEN REPLY @2 + PID.1
IF ~Global("ACBREPID2","GLOBAL",1)~ THEN REPLY @3 + PID.2
++ @4 + PID.10
IF ~Global("ACBRETOLDAJOKE","GLOBAL",0)~ THEN REPLY @5 + PID.11
++ @6 + PID.END
END

IF ~~ THEN BEGIN PID.B
SAY @7
IF ~Global("ACBREPID1","GLOBAL",1)~ THEN REPLY @2 + PID.1
++ @4 + PID.10
IF ~Global("ACBRETOLDAJOKE","GLOBAL",0)~ THEN REPLY @5 + PID.11
++ @6 + PID.END
END

IF ~~ THEN BEGIN PID.FORGE
SAY @8
IF ~~ THEN DO ~ClearAllActions()StartCutScenemode()StartCutScene("ACCUT_13")~ EXIT
END

IF ~~ THEN PID_enerygcells_cromwell
SAY @120 /* ~Ob ich das will? Da könnt Ihr aber Gift drauf nehmen, <CHARNAME>. Das juckt mich schon in den Fingern, seit wir hier reingekommen sind! Wir haben die Dinger wahrlich lange genug mit uns rumgetragen.~ */
++ @119 /* Macht das mit dem Schmieden der Energiezellen. Wir haben dafür jetzt Zeit.~ */ + PID_enerygcells
++ @121 /* Gut, ich merke es mir. Jetzt gerade passt es leider nicht.~ */ DO ~SetGlobal("ACMISC4E","GLOBAL",5)~ + PID.END
END

IF ~~ THEN PID_enerygcells
SAY @122 /* ~Nun, dann wollen wir mal sehen, ob das so klappt wie ich mir das vorstelle. Bei Moradin!~ */
IF ~~ THEN DO ~SetGlobal("ACMISC4E","GLOBAL",6) ClearAllActions()StartCutScenemode()StartCutScene("ACCUT_20")~ EXIT
IF ~AreaCheck("AR0334")~ THEN DO ~SetGlobal("ACMISC4E","GLOBAL",6) ClearAllActions()StartCutScenemode()StartCutScene("ACCUT_19")~ EXIT
END

IF ~~ THEN BEGIN PID.END
SAY @9
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PID.1
SAY @10
++ @11 + PID1.1
IF ~Global("ACPIDGOTRIK","GLOBAL",0)~ THEN REPLY @12 + PID1.2
IF ~Global("ACPIDGOTRIK","GLOBAL",1)~ THEN REPLY @13 + PID1.3
IF ~Global("ACPIDGOTRIK","GLOBAL",2)~ THEN REPLY @13 + PID1.4
IF ~Global("ACPIDGOTRIK","GLOBAL",3)~ THEN REPLY @13 + PID1.5
IF ~Global("ACPIDGOTRIK","GLOBAL",4)~ THEN REPLY @14 + PID1.2
++ @15 + PID1.12
++ @16 + PID.B
END

IF ~~ THEN BEGIN PID1.1
SAY @17
++ @18 + PID1.8
++ @19 + PID1.9
++ @20 + PID1.10
++ @21 + PID1.11
++ @16 + PID.B
END

IF ~~ THEN BEGIN PID1.2
SAY @22 = @23 = @24 = @25
++ @26 DO ~SetGlobal("ACPIDGOTRIK","GLOBAL",1)~ + PID1.3
++ @27 DO ~SetGlobal("ACPIDGOTRIK","GLOBAL",1)~ + PID1.7
END

IF ~~ THEN BEGIN PID1.3
SAY @28 = @29 = @30 = @31 = @32
++ @26 DO ~SetGlobal("ACPIDGOTRIK","GLOBAL",2)~ + PID1.4
++ @27 DO ~SetGlobal("ACPIDGOTRIK","GLOBAL",2)~ + PID1.7
END

IF ~~ THEN BEGIN PID1.4
SAY @33 = @34 = @35 = @36
++ @26 DO ~SetGlobal("ACPIDGOTRIK","GLOBAL",3)~ + PID1.5
++ @27 DO ~SetGlobal("ACPIDGOTRIK","GLOBAL",3)~ + PID1.7
END

IF ~~ THEN BEGIN PID1.5
SAY @37 = @38 = @39 = @40 = @41 = @42
++ @43 DO ~SetGlobal("ACPIDGOTRIK","GLOBAL",4)SetGlobal("ACBRETOLDBOUTDUERGAR","GLOBAL",1)~ + PID1.6
++ @16 DO ~SetGlobal("ACPIDGOTRIK","GLOBAL",4)SetGlobal("ACBRETOLDBOUTDUERGAR","GLOBAL",1)~ + PID.B
END

IF ~~ THEN BEGIN PID1.6
SAY @44
IF ~~ THEN GOTO PID.B
END

IF ~~ THEN BEGIN PID1.7
SAY @45
IF ~~ THEN GOTO PID.B
END

IF ~~ THEN BEGIN PID1.8
SAY @46
++ @19 + PID1.9
++ @20 + PID1.10
++ @21 + PID1.11
++ @16 + PID.B
END

IF ~~ THEN BEGIN PID1.9
SAY @47
++ @18 + PID1.8
++ @20 + PID1.10
++ @21 + PID1.11
++ @16 + PID.B
END

IF ~~ THEN BEGIN PID1.10
SAY @48
++ @18 + PID1.8
++ @19 + PID1.9
++ @21 + PID1.11
++ @16 + PID.B
END

IF ~~ THEN BEGIN PID1.11
SAY @49 = @50 = @51
++ @18 + PID1.8
++ @19 + PID1.9
++ @20 + PID1.10
++ @16 + PID.B
END

IF ~~ THEN BEGIN PID1.12
SAY @52
++ @53 + PID1.13
++ @54 + PID1.14
++ @55 + PID1.15
++ @56 + PID1.16
++ @16 + PID.B
END

IF ~~ THEN BEGIN PID1.13
SAY @57 = @58
++ @54 + PID1.14
++ @55 + PID1.15
++ @56 + PID1.16
++ @16 + PID.B
END

IF ~~ THEN BEGIN PID1.14
SAY @59 = @60
++ @53 + PID1.13
++ @55 + PID1.15
++ @56 + PID1.16
++ @16 + PID.B
END

IF ~~ THEN BEGIN PID1.15
SAY @61 = @62
++ @63 + PID8.5
++ @53 + PID1.13
++ @54 + PID1.14
++ @56 + PID1.16
++ @16 + PID.B
END

IF ~~ THEN BEGIN PID1.16
SAY @64 = @65
++ @53 + PID1.13
++ @54 + PID1.14
++ @55 + PID1.15
++ @16 + PID.B
END

IF ~~ THEN BEGIN PID8.5
SAY @66 = @67 = @68 = @69 = @70 = @71 = @72 = @73
IF ~~ THEN GOTO PID.B
END

IF ~~ THEN BEGIN PID.10
SAY @74 = @75
IF ~~ THEN GOTO PID.B
END

IF ~~ THEN BEGIN PID.2
SAY @52
++ @76 + PID2.1
++ @77 + PID2.2
++ @78 + PID2.3
++ @79 + PID2.4
++ @16 + PID.B
END

IF ~~ THEN BEGIN PID2.1
SAY @80
++ @77 + PID2.2
++ @78 + PID2.3
++ @79 + PID2.4
++ @16 + PID.B
END

IF ~~ THEN BEGIN PID2.3
SAY @81
++ @82 + PID.2
++ @83 + PID.B
END

IF ~~ THEN BEGIN PID2.4
SAY @84 = @85
++ @76 + PID2.1
++ @77 + PID2.2
++ @78 + PID2.3
++ @16 + PID.B
END

IF ~~ THEN BEGIN PID2.2
SAY @86
++ @87 + PID2.2a
++ @88 + PID2.2b
++ @89 + PID2.2c
++ @90 + PID2.2d
++ @91 + PID2.2e
++ @92 + PID2.2f
++ @93 + PID2.2g
++ @94 + PID2.2h
++ @95 + PID2.2i
++ @96 + PID2.2j
++ @97 + PID2.2k
++ @98 + PID2.2l
++ @99 + PID2.2m
++ @100 + PID2.2n
++ @82 + PID.2
++ @83 + PID.B
END

IF ~~ THEN BEGIN PID2.2a
SAY @101
++ @88 + PID2.2b
++ @89 + PID2.2c
++ @90 + PID2.2d
++ @91 + PID2.2e
++ @92 + PID2.2f
++ @93 + PID2.2g
++ @94 + PID2.2h
++ @95 + PID2.2i
++ @96 + PID2.2j
++ @97 + PID2.2k
++ @98 + PID2.2l
++ @99 + PID2.2m
++ @100 + PID2.2n
++ @82 + PID.2
++ @83 + PID.B
END

IF ~~ THEN BEGIN PID2.2b
SAY @102
++ @87 + PID2.2a
++ @89 + PID2.2c
++ @90 + PID2.2d
++ @91 + PID2.2e
++ @92 + PID2.2f
++ @93 + PID2.2g
++ @94 + PID2.2h
++ @95 + PID2.2i
++ @96 + PID2.2j
++ @97 + PID2.2k
++ @98 + PID2.2l
++ @99 + PID2.2m
++ @100 + PID2.2n
++ @82 + PID.2
++ @83 + PID.B
END

IF ~~ THEN BEGIN PID2.2c
SAY @103
++ @87 + PID2.2a
++ @88 + PID2.2b
++ @90 + PID2.2d
++ @91 + PID2.2e
++ @92 + PID2.2f
++ @93 + PID2.2g
++ @94 + PID2.2h
++ @95 + PID2.2i
++ @96 + PID2.2j
++ @97 + PID2.2k
++ @98 + PID2.2l
++ @99 + PID2.2m
++ @100 + PID2.2n
++ @82 + PID.2
++ @83 + PID.B
END

IF ~~ THEN BEGIN PID2.2d
SAY @104
++ @87 + PID2.2a
++ @88 + PID2.2b
++ @89 + PID2.2c
++ @91 + PID2.2e
++ @92 + PID2.2f
++ @93 + PID2.2g
++ @94 + PID2.2h
++ @95 + PID2.2i
++ @96 + PID2.2j
++ @97 + PID2.2k
++ @98 + PID2.2l
++ @99 + PID2.2m
++ @100 + PID2.2n
++ @82 + PID.2
++ @83 + PID.B
END

IF ~~ THEN BEGIN PID2.2e
SAY @105
++ @87 + PID2.2a
++ @88 + PID2.2b
++ @89 + PID2.2c
++ @90 + PID2.2d
++ @92 + PID2.2f
++ @93 + PID2.2g
++ @94 + PID2.2h
++ @95 + PID2.2i
++ @96 + PID2.2j
++ @97 + PID2.2k
++ @98 + PID2.2l
++ @99 + PID2.2m
++ @100 + PID2.2n
++ @82 + PID.2
++ @83 + PID.B
END

IF ~~ THEN BEGIN PID2.2g
SAY @106
++ @87 + PID2.2a
++ @88 + PID2.2b
++ @89 + PID2.2c
++ @90 + PID2.2d
++ @91 + PID2.2e
++ @92 + PID2.2f
++ @94 + PID2.2h
++ @95 + PID2.2i
++ @96 + PID2.2j
++ @97 + PID2.2k
++ @98 + PID2.2l
++ @99 + PID2.2m
++ @100 + PID2.2n
++ @82 + PID.2
++ @83 + PID.B
END

IF ~~ THEN BEGIN PID2.2f
SAY @107
++ @87 + PID2.2a
++ @88 + PID2.2b
++ @89 + PID2.2c
++ @90 + PID2.2d
++ @91 + PID2.2e
++ @93 + PID2.2g
++ @94 + PID2.2h
++ @95 + PID2.2i
++ @96 + PID2.2j
++ @97 + PID2.2k
++ @98 + PID2.2l
++ @99 + PID2.2m
++ @100 + PID2.2n
++ @82 + PID.2
++ @83 + PID.B
END

IF ~~ THEN BEGIN PID2.2h
SAY @108
++ @87 + PID2.2a
++ @88 + PID2.2b
++ @89 + PID2.2c
++ @90 + PID2.2d
++ @91 + PID2.2e
++ @92 + PID2.2f
++ @93 + PID2.2g
++ @95 + PID2.2i
++ @96 + PID2.2j
++ @97 + PID2.2k
++ @98 + PID2.2l
++ @99 + PID2.2m
++ @100 + PID2.2n
++ @82 + PID.2
++ @83 + PID.B
END

IF ~~ THEN BEGIN PID2.2i
SAY @109
++ @87 + PID2.2a
++ @88 + PID2.2b
++ @89 + PID2.2c
++ @90 + PID2.2d
++ @91 + PID2.2e
++ @92 + PID2.2f
++ @93 + PID2.2g
++ @94 + PID2.2h
++ @96 + PID2.2j
++ @97 + PID2.2k
++ @98 + PID2.2l
++ @99 + PID2.2m
++ @100 + PID2.2n
++ @82 + PID.2
++ @83 + PID.B
END

IF ~~ THEN BEGIN PID2.2j
SAY @110
++ @87 + PID2.2a
++ @88 + PID2.2b
++ @89 + PID2.2c
++ @90 + PID2.2d
++ @91 + PID2.2e
++ @92 + PID2.2f
++ @93 + PID2.2g
++ @94 + PID2.2h
++ @95 + PID2.2i
++ @97 + PID2.2k
++ @98 + PID2.2l
++ @99 + PID2.2m
++ @100 + PID2.2n
++ @82 + PID.2
++ @83 + PID.B
END

IF ~~ THEN BEGIN PID2.2k
SAY @109
++ @87 + PID2.2a
++ @88 + PID2.2b
++ @89 + PID2.2c
++ @90 + PID2.2d
++ @91 + PID2.2e
++ @92 + PID2.2f
++ @93 + PID2.2g
++ @94 + PID2.2h
++ @95 + PID2.2i
++ @96 + PID2.2j
++ @98 + PID2.2l
++ @99 + PID2.2m
++ @100 + PID2.2n
++ @82 + PID.2
++ @83 + PID.B
END

IF ~~ THEN BEGIN PID2.2l
SAY @111
++ @87 + PID2.2a
++ @88 + PID2.2b
++ @89 + PID2.2c
++ @90 + PID2.2d
++ @91 + PID2.2e
++ @92 + PID2.2f
++ @93 + PID2.2g
++ @94 + PID2.2h
++ @95 + PID2.2i
++ @96 + PID2.2j
++ @97 + PID2.2k
++ @99 + PID2.2m
++ @100 + PID2.2n
++ @82 + PID.2
++ @83 + PID.B
END

IF ~~ THEN BEGIN PID2.2m
SAY @112
++ @87 + PID2.2a
++ @88 + PID2.2b
++ @89 + PID2.2c
++ @90 + PID2.2d
++ @91 + PID2.2e
++ @92 + PID2.2f
++ @93 + PID2.2g
++ @94 + PID2.2h
++ @95 + PID2.2i
++ @96 + PID2.2j
++ @97 + PID2.2k
++ @98 + PID2.2l
++ @100 + PID2.2n
++ @82 + PID.2
++ @83 + PID.B
END

IF ~~ THEN BEGIN PID2.2n
SAY @113
++ @87 + PID2.2a
++ @88 + PID2.2b
++ @89 + PID2.2c
++ @90 + PID2.2d
++ @91 + PID2.2e
++ @92 + PID2.2f
++ @93 + PID2.2g
++ @94 + PID2.2h
++ @95 + PID2.2i
++ @96 + PID2.2j
++ @97 + PID2.2k
++ @98 + PID2.2l
++ @99 + PID2.2m
++ @82 + PID.2
++ @83 + PID.B
END
END

CHAIN
IF ~~ THEN ACBREJ PID.11
@114 = @115 DO ~SetGlobal("ACBRETOLDAJOKE","GLOBAL",1)~
==%IMOEN_BANTER% IF ~InParty("%IMOEN_DV%")See("%IMOEN_DV%")!StateCheck("%IMOEN_DV%",CD_STATE_NOTVALID)~ THEN @116
EXIT