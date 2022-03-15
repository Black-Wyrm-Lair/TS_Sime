BEGIN VPSIME25

IF ~Global("VPSimeSummoned","GLOBAL",1)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 DO ~SetGlobal("VPSimeSummoned","GLOBAL",2)~ GOTO 1
  IF ~~ THEN REPLY @2 DO ~SetGlobal("VPSimeSummoned","GLOBAL",2)~ GOTO 2
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800) JoinParty()~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY @4
  IF ~~ THEN DO ~MoveToPointNoInterrupt([1731.1104])~ EXIT
END

IF WEIGHT #1 ~Global("VPSimeSummoned","GLOBAL",2)~ THEN BEGIN 3
  SAY @5
  IF ~~ THEN REPLY @6 GOTO 1
  IF ~~ THEN REPLY @2 GOTO 2
END