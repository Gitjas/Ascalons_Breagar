/* Seatower cook: */

INTERJECT_COPY_TRANS YSMCOOK1 0 ACYSMCOOK1_0
== ACBreJ IF ~InParty("ACBre")InMyArea("ACBRE")!StateCheck("ACBre",CD_STATE_NOTVALID)~ THEN
@0 /* ~MY DIRTY WHAT?! I might not come in the finest clothes, but you spent a tenday on the road and see how you look, woman!~ */
== YSMCOOK1 IF ~InParty("ACBre")InMyArea("ACBRE")!StateCheck("ACBre",CD_STATE_NOTVALID)~ THEN
@1 /* I know what you dwarves wants! Ale for free and leaving the barrel half empty is it! Well, not in this kitchen, no sir!~ */
== ACBreJ IF ~InParty("ACBre")InMyArea("ACBRE")!StateCheck("ACBre",CD_STATE_NOTVALID)~ THEN
@2 /* ~Nothing wrong with a good ale for a dwarf? Don't you think I'd steal any, woman. I always pay for my ale right and proper!~ */
END

INTERJECT_COPY_TRANS YSMCOOK1 17 ACYSMCOOK1_17
== ACBreJ IF ~InParty("ACBre")InMyArea("ACBRE")!StateCheck("ACBre",CD_STATE_NOTVALID)~ THEN
@3 /* ~Hrmph, <CHARNAME>, when this is over I'll need several pints of ale to wash the cook's anger down, I can tell you.~ */
END



