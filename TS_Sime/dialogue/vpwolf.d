BEGIN VPWOLF

IF ~!IsGabber("vpsime")~ THEN BEGIN 0
  SAY ~Veter looks at you with suspicion, and after a moment's inspection, it turns and gives you full view of its rear while it strolls to Sime.~
  IF ~~ THEN DO ~MoveToObject("vpsime")~ EXIT
END

IF ~IsGabber("vpsime")~ THEN BEGIN 1
  SAY ~Veter looks at Sime, its nose is twitching slightly, and its tail is shuddering...~
  IF ~~ THEN REPLY ~Veter, come here...~ GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY ~*Sime strokes Veter's head gently, and it suddenly turns into the figurine.*~
  IF ~~ THEN DO ~GiveItemCreate("vpwfig","vpsime",0,0,0)
SetGlobal("VP_Veter","GLOBAL",1)
SetGlobal("VP_VeterRest","GLOBAL",0)
DestroySelf()~ EXIT
END
