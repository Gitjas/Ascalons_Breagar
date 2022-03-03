BEGIN ACBreS

IF ~True()~ THEN sod_aufnahme
SAY @0
++ @1 + sod_aufnahme_02
++ @2 + sod_aufnahme_04
++ @3 + sod_aufnahme_01
END

IF ~~ THEN sod_aufnahme_01
SAY @4
++ @1 + sod_aufnahme_02
++ @2 + sod_aufnahme_04
++ @5 + sod_aufnahme_05
END

IF ~~ THEN sod_aufnahme_02
SAY @6
IF ~~ THEN + sod_aufnahme_03
END

IF ~~ THEN sod_aufnahme_03
SAY @7
IF ~~ THEN DO ~SetGlobal("ACBREINPARTY","GLOBAL",2) JoinParty()~ EXIT
END

IF ~~ THEN sod_aufnahme_04
SAY @8
IF ~~ THEN + sod_aufnahme_02
END

IF ~~ THEN sod_aufnahme_05
SAY @9
IF ~~ THEN DO ~SetGlobal("ACBREINPARTY","GLOBAL",3)SetGlobal("ACBREBROKE","GLOBAL",1)EscapeAreaDestroy(90)~ EXIT
END