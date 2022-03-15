//TS Island Interjections

EXTEND_BOTTOM PPSAEM %vpsimeppsaemext%
  IF ~InParty("vpsime") Global("ThiefGroup","GLOBAL",1)~ THEN REPLY @4 DO ~SetGlobal("Island_War","GLOBAL",1)~ EXTERN VPSIMEJ vpsimetsl0
END

CHAIN VPSIMEJ vpsimetsl0
@14
END
  IF ~~ THEN REPLY @15 EXTERN VPSIMEJ vpsimetsl1
  IF ~~ THEN REPLY @16 EXTERN VPSIMEJ vpsimetsl2

CHAIN VPSIMEJ vpsimetsl1
@17
DO ~SetGlobal("Kicked_Out","LOCALS",1)
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()~
EXIT

CHAIN VPSIMEJ vpsimetsl2
@18 DO ~SetGlobal("Kicked_Out","LOCALS",0)~
EXIT


//Sailoff Dialogue

EXTEND_BOTTOM PPSAEM 48
  IF ~InParty("vpsime") InParty("vpkachi")~ THEN EXTERN ~PPARAN2~ VPSailOffSime_TSL
END

CHAIN PPARAN2 VPSailOffSime_TSL
@20
= #43913
== PPSAEM #43916
== VPSIMEJ #43917
== PPSAEM #43918
== PPARAN2 #43919
== PPSAEM #43920
= #43921
END
IF ~~ THEN EXTERN VPKACHIJ %vpkachisailoff1%