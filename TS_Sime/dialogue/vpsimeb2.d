BEGIN VPSIMEB2

// Anomen

CHAIN
IF ~InParty("Anomen")
See("Anomen")
!StateCheck("Anomen",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeAnomenTOB1","GLOBAL",0)~ THEN VPSIMEB SimeAnomenTOB1
@0
DO ~SetGlobal("VPSimeAnomenTOB1","GLOBAL",1)~
== BANOME25 @1
== VPSIMEB2 @2
== BANOME25 @3
== VPSIMEB2 @4
== BANOME25 @5
== VPSIMEB2 @6
== BANOME25 @7
== VPSIMEB2 @8
EXIT

// Keldorn

CHAIN
IF ~InParty("Keldorn")
See("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeKeldornTOB","GLOBAL",0)~ THEN VPSIMEB SimeKeldornTOB1
@9
DO ~SetGlobal("VPSimeKeldornTOB","GLOBAL",1)~
== BKELDO25 @10
== VPSIMEB2 @11
== BKELDO25 @12
== VPSIMEB2 @13
== BKELDO25 @14
== VPSIMEB2 @15
== BKELDO25 @16
== VPSIMEB2 @17
== BKELDO25 @18
== VPSIMEB2 @19
EXIT

// Sarevok

CHAIN
IF ~InParty("Sarevok")
See("Sarevok")
!StateCheck("Sarevok",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeSarevokTOB","GLOBAL",0)~ THEN VPSIMEB SimeSarevokTOB1
@20
DO ~SetGlobal("VPSimeSarevokTOB","GLOBAL",1)~
== BSAREV25 @21
== VPSIMEB2 @22
== BSAREV25 @23
== VPSIMEB2 @24
== BSAREV25 @25
== VPSIMEB2 @26
EXIT

CHAIN
IF ~InParty("Sarevok")
See("Sarevok")
!StateCheck("Sarevok",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeSarevokTOB","GLOBAL",1)~ THEN VPSIMEB SimeSarevokTOB2
@27
DO ~SetGlobal("VPSimeSarevokTOB","GLOBAL",2)~
== BSAREV25 @28
== VPSIMEB2 @29
== BSAREV25 @30
== VPSIMEB2 @31
== BSAREV25 @32
== VPSIMEB2 @33
EXIT
