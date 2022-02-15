// Kachiko Banters

CHAIN
IF ~InParty("vpkachi")
See("vpkachi")
!StateCheck("vpkachi",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
RealGlobalTimerExpired("VPSimeKachikoTimer","GLOBAL")
Global("VPSimeKachiko1","GLOBAL",0)~ THEN VPSIMEB SimeKachiko1
@0
DO ~SetGlobal("VPSimeKachiko1","GLOBAL",1)~
== VPKACHIB @1
== VPSIMEB @2
== VPKACHIB @3
== VPSIMEB @4
EXIT

CHAIN
IF ~InParty("vpkachi")
See("vpkachi")
!StateCheck("vpkachi",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
RealGlobalTimerExpired("VPSimeKachikoTimer","GLOBAL")
Global("VPSimeKachiko2","GLOBAL",0)~ THEN VPSIMEB SimeKachiko2
@5
DO ~SetGlobal("VPSimeKachiko2","GLOBAL",1)~
== VPKACHIB @6
== VPSIMEB @7
== VPKACHIB @8
== VPSIMEB @9
== VPKACHIB @10
== VPSIMEB @11
== VPKACHIB @12
== VPSIMEB @13
EXIT

//TS Island Interjections

EXTEND_TOP PPSAEM %vpsimeppsaemext%
  IF ~InParty("vpsime") Global("ThiefGroup","GLOBAL",1)~ THEN REPLY @4 DO ~SetGlobal("Island_War","GLOBAL",1)~ EXTERN VPSIMEJ 4
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
= @21
== PPSAEM @22
== VPSIMEJ @23
== PPSAEM @24
== PPARAN2 @25
== PPSAEM @26
END
IF ~~ THEN EXTERN VPKACHIJ %vpkachisailoff1%
