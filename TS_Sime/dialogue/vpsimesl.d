BEGIN VPSIMESL

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN DO ~GiveItemCreate("vpfswor1",Player1,0,0,0)
GiveItemCreate("vpfswor2",Player1,0,0,0)
GiveItemCreate("vpfring",Player1,0,0,0)
GiveItemCreate("vpfstar",Player1,0,0,0)
GiveItemCreate("vpfmace",Player1,0,0,0)
GiveItemCreate("vpfstaff",Player1,0,0,0)
GiveItemCreate("vpfrobe",Player1,0,0,0)
GiveItemCreate("vpfpotn1",Player1,1,0,0)
GiveItemCreate("vpfpotn2",Player1,3,0,0)
GiveItemCreate("vpfpotn3",Player1,1,0,0)
EscapeArea()~ EXIT
END
