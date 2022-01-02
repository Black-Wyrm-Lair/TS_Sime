EXTEND_BOTTOM FATESP 6 #9
+ ~!Dead("vpsime") !InMyArea("vpsime") Global("VPSimeSummoned","GLOBAL",0) !Alignment(Player1,MASK_EVIL)~ + @0
DO ~CreateVisualEffect("SPPORTAL",[1999.1228])
Wait(2) 
CreateCreature("vpsime25",[1999.1228],0) 
SetGlobal("VPSimeSummoned","GLOBAL",1)~ GOTO 8
+ ~!Dead("vpsime") !InMyArea("vpsime") Global("VPSimeSummoned","GLOBAL",0) !Alignment(Player1,MASK_EVIL)~ + @1
DO ~CreateVisualEffect("SPPORTAL",[1999.1228])
Wait(2)
SetGlobal("VP_SimeRomanceActive","GLOBAL",2)
CreateCreature("vpsime25",[1999.1228],0) 
SetGlobal("VPSimeSummoned","GLOBAL",1)~ GOTO 8
END
