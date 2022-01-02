BEGIN ~VPSIMEP2~

IF ~Global("Kicked_Out","LOCALS",1)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
  IF ~~ THEN REPLY @2 GOTO 6
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
END

IF ~Global("Kicked_Out","LOCALS",0)~ THEN BEGIN 2
  SAY @4
  IF ~AreaCheck("AR4500")~ THEN REPLY @5 GOTO 3
  IF ~!AreaCheck("AR4500")
!AreaCheck("AR4000")
!AreaCheck("AR6200")~ THEN REPLY @5 GOTO 4
  IF ~OR(2)
AreaCheck("AR4000")
AreaCheck("AR6200")~ THEN REPLY @5 GOTO 5
  IF ~~ THEN REPLY @6 GOTO 8
END

IF ~~ THEN BEGIN 3
  SAY @7
  IF ~~ THEN REPLY @8 GOTO 9
END

IF ~~ THEN BEGIN 4
  SAY @9
  IF ~~ THEN REPLY @10 GOTO 10
  IF ~~ THEN REPLY @11 GOTO 11
END

IF ~~ THEN BEGIN 5
  SAY @9
  IF ~~ THEN REPLY @11 GOTO 11
END

IF ~~ THEN BEGIN 6
  SAY @12
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 8
  SAY @13
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
END

IF ~~ THEN BEGIN 9
  SAY @14
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
MoveToPointNoInterrupt([1731.1104])
Face(0)~ EXIT
END

IF ~~ THEN BEGIN 10
  SAY @12
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
CreateVisualEffectObject("SPDIMNDR",Myself)
Wait(2)
MoveBetweenAreas("AR4500",[1731.1104],0)~ EXIT
END

IF ~~ THEN BEGIN 11
  SAY @14
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)~ EXIT
END