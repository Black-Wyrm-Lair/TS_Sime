BEGIN VPWOLF

IF ~!IsGabber("vpsime")~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN DO ~MoveToObject("vpsime")~ EXIT
END

IF ~IsGabber("vpsime")~ THEN BEGIN 1
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @3
  IF ~~ THEN DO ~GiveItemCreate("vpwfig","vpsime",0,0,0)
SetGlobal("VP_Veter","GLOBAL",1)
SetGlobal("VP_VeterRest","GLOBAL",0)
DestroySelf()~ EXIT
END
