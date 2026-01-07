CHAIN
IF ~Global("ACBREK#A","GLOBAL",0)
%BGT_VAR2%
PartyHasItem("AURNSW")
InParty("ACBRE")
InParty("K#Auren")
See("K#Auren")
!StateCheck("ACBRE",CD_STATE_NOTVALID)
!StateCheck("K#Auren",CD_STATE_NOTVALID)~ THEN ACBREB BreK#a1
@0 DO ~SetGlobal("ACBREK#A","GLOBAL",1)~
==K#AurenB @1
==ACBREB @2
==K#AurenB @3
==ACBREB @4
==K#AurenB @5
==ACBREB @6
==K#AurenB @7
==ACBREB @8
EXIT

CHAIN
IF ~Global("ACBREK#A","GLOBAL",1)
%BGT_VAR2%
InParty("ACBRE")
InParty("K#Auren")
See("K#Auren")
!StateCheck("ACBRE",CD_STATE_NOTVALID)
!StateCheck("K#Auren",CD_STATE_NOTVALID)~ THEN ACBREB BreK#a1
@9 DO ~SetGlobal("ACBREK#A","GLOBAL",2)~
==K#AurenB @10
==ACBREB @11
==K#AurenB @12
==ACBREB @13
==K#AurenB @14
==ACBREB @15
==K#AurenB @16
==ACBREB @8
EXIT