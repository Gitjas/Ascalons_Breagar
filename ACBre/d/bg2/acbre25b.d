BEGIN ACBRE25B

INTERJECT_COPY_TRANS2 25SPELL 2 AC25SPELL2
== ACBRE25B IF ~InParty("ACBRE")See("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN 
@0
END

INTERJECT_COPY_TRANS ABAZIGAL 0 ACABAZIGAL0
== ACBRE25B IF ~InParty("ACBRE")See("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN 
@1
== ABAZIGAL IF ~InParty("ACBRE")See("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN 
@2
END

INTERJECT_COPY_TRANS2 AMASANA 1 ACAMASANA1
== ACBRE25B IF ~InParty("ACBRE")See("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN 
@3
END

INTERJECT_COPY_TRANS2 AMSAEMON 3 ACAMSAEMON3
== ACBRE25B IF ~InParty("ACBRE")See("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN 
@4
END

INTERJECT AMSAEMON 8 ACAMSAEMON8
==ACBRE25B IF ~InParty("ACBRE")InMyArea("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN 
@5
END
IF ~~ THEN EXTERN AMSAEMON 9

INTERJECT_COPY_TRANS2 SAREV25A 0 ACSAREV25A
== ACBRE25B IF ~InParty("ACBRE")See("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN 
@6
END

INTERJECT_COPY_TRANS2 SARBUL05 0 ACSARBUL05
== ACBRE25B IF ~InParty("ACBRE")See("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN 
@7
END

INTERJECT_COPY_TRANS2 SARCNT01 9 ACSARCNT019
== ACBRE25B IF ~InParty("ACBRE")See("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN 
@8
END

INTERJECT_COPY_TRANS2 SARCNT01 14 ACSARCNT0114
== ACBRE25B IF ~InParty("ACBRE")See("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN 
@9 DO ~LeaveParty()Enemy()~
END

INTERJECT_COPY_TRANS2 SARCPT01 25 ACSAREV25A
== ACBRE25B IF ~InParty("ACBRE")See("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN 
@10
END

INTERJECT FINSOL01 27 ACWERDASLIESTISTDOOF
== ACBRE25B IF ~InMyArea("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN @11 = @12
COPY_TRANS FINSOL01 27

INTERJECT FINSOL01 31 ACWERDASLIESTISTSAUDOOF
== ACBRE25B IF ~InMyArea("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN @13 
COPY_TRANS FINSOL01 31

INTERJECT FINSOL01 30 ACWERDASLIESTISTSAUDOOF
== ACBRE25B IF ~InMyArea("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN @13 
COPY_TRANS FINSOL01 30

INTERJECT FINSOL01 29 ACWERDASLIESTISTSAUDOOF
== ACBRE25B IF ~InMyArea("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN @13 
COPY_TRANS FINSOL01 29

INTERJECT SARDW04 1 ACSARDW041
== ACBRE25B IF ~InParty("ACBRE")See("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN 
@14
END
IF ~~ THEN EXTERN ACBRE25B SARDW04

INTERJECT SARDW05 0 ACSARDW050
== ACBRE25B IF ~InParty("ACBRE")See("ACBRE")!StateCheck("ACBRE",CD_STATE_NOTVALID)~ THEN 
@14
END
IF ~~ THEN EXTERN ACBRE25B SARDW04

CHAIN
IF ~~ THEN ACBRE25B SARDW04
@15
==SARDW04 @16
==ACBRE25B @17
==SARDW05 @18
==ACBRE25B @19 = @20
==SARDW05 @21
==ACBRE25B @22
==SARDW04 @23
==ACBRE25B @24
==SARDW04 @25 DO ~EscapeAreaDestroy(90)~
==SARDW05 @26 DO ~IncrementGlobal("ACBREINSARADUSH","GLOBAL",1)EscapeAreaDestroy(90)~
EXIT