CHAIN
IF ~Global("ACBRsola","GLOBAL",0)
%BGT_VAR2%
InParty("ACBRE")
InParty("sola")
See("sola")
!StateCheck("ACBRE",CD_STATE_NOTVALID)
!StateCheck("sola",CD_STATE_NOTVALID)~ THEN ACBREB ACBRsola1
@10 DO ~SetGlobal("ACBRsola","GLOBAL",1)~
==Sola @11
==ACBREB @12
==Sola @13
==ACBREB @14
==Sola @15
==ACBREB @16
==Sola @17
==ACBREB @18
= @19
==Sola @21
==ACBREB @22
EXIT