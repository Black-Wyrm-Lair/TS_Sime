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