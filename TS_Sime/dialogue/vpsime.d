BEGIN VPSIME

IF WEIGHT #-2 ~Global("Sime_Meet","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~SetGlobal("Sime_Meet","GLOBAL",1)~ GOTO 1
  IF ~~ THEN REPLY @2 DO ~SetGlobal("Sime_Meet","GLOBAL",1)~ GOTO 2
  IF ~~ THEN REPLY @3 DO ~SetGlobal("Sime_Meet","GLOBAL",1)~ GOTO 2
  IF ~~ THEN REPLY @4 DO ~SetGlobal("Sime_Meet","GLOBAL",1)~ GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @5
  IF ~~ THEN REPLY @6 GOTO 2
  IF ~~ THEN REPLY @7 GOTO 5
  IF ~~ THEN REPLY @8 GOTO 3
END

IF ~~ THEN BEGIN 2
  SAY @9
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Is_Waiting","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN 3
  SAY @10
  IF ~~ THEN REPLY @6 GOTO 2
  IF ~~ THEN REPLY @11 GOTO 2
  IF ~~ THEN REPLY @12 GOTO 5
END

IF ~~ THEN BEGIN 4
  SAY @9
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Is_Waiting","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN 5
  SAY @13
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800) JoinParty()~ EXIT
END

IF WEIGHT #1 ~NumTimesTalkedToGT(0) Global("Sime_Meet","GLOBAL",1)~ THEN BEGIN 6
  SAY @14
  IF ~~ THEN REPLY @15 GOTO 5
  IF ~~ THEN REPLY @16 GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @17
  IF ~~ THEN EXIT
END