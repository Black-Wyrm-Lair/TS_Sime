BEGIN VPSIMEJ2

//// Master Wraith

EXTEND_BOTTOM HGWRA01 18
IF ~Global("VP_SimeRomanceActive","GLOBAL",2) InParty("vpsime") 
!StateCheck("vpsime",CD_STATE_NOTVALID)~ DO ~SetGlobal("VPSimeLovedOne","GLOBAL",1)~ EXTERN HGWRA01 VPSimeWraith1
END

CHAIN HGWRA01 VPSimeWraith1
@0 DO ~SetGlobal("LovedOne","GLOBAL",6)~
== VPSIMEJ2 @1
EXTERN HGWRA01 24

EXTEND_BOTTOM HGWRA01 24
IF ~Global("VP_SimeRomanceActive","GLOBAL",2)~
DO ~ClearAllActions() StartCutSceneMode() StartCutScene("vpcutwra")~ EXIT
END

BEGIN VPEXLOVE

CHAIN IF ~NumTimesTalkedTo(0) InParty("vpsime") Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN VPEXLOVE 0
@2
== VPSIMEJ2 @3
== VPEXLOVE @4
== VPSIMEJ2 @5
== VPEXLOVE @6
== VPSIMEJ2 @7
== VPEXLOVE @8
== VPSIMEJ2 @9
== VPEXLOVE @10
== VPSIMEJ2 @11
END
IF ~~ THEN REPLY @12 EXTERN ~HGWRA01~ 25
IF ~~ THEN REPLY @13 EXTERN ~HGWRA01~ 25
IF ~~ THEN REPLY @14 EXTERN ~HGWRA01~ 25
IF ~~ THEN REPLY @15 EXTERN ~HGWRA01~ 25

//// Solar

EXTEND_BOTTOM FINSOL01 27
  IF ~InParty("vpsime")
Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN EXTERN VPSIMEJ2 SimeLoveChoice
  IF ~InParty("vpsime")
!Global("VP_SimeRomanceActive","GLOBAL",2)
!Alignment(Player1,MASK_EVIL)~ THEN EXTERN VPSIMEJ2 SimeFriendChoiceGood
  IF ~InParty("vpsime")
!Global("VP_SimeRomanceActive","GLOBAL",2)
Alignment(Player1,MASK_EVIL)~ THEN EXTERN VPSIMEJ2 SimeFriendChoiceEvil
END

EXTEND_BOTTOM FINSOL01 29
  IF ~InParty("vpsime")
Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN EXTERN VPSIMEJ2 SimeLoveGod
END

EXTEND_BOTTOM FINSOL01 30
  IF ~InParty("vpsime")
Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN EXTERN VPSIMEJ2 SimeLoveGod
END

EXTEND_BOTTOM FINSOL01 31
  IF ~InParty("vpsime")
Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN EXTERN VPSIMEJ2 SimeLoveGod
END

EXTEND_BOTTOM FINSOL01 32
  IF ~InParty("vpsime")
Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN EXTERN VPSIMEJ2 SimeLoveMortal0
END

//Friend, before the choice

CHAIN VPSIMEJ2 SimeFriendChoiceGood
@16
=@17
END
COPY_TRANS FINSOL01 27

CHAIN VPSIMEJ2 SimeFriendChoiceEvil
@16
= @18
END
COPY_TRANS FINSOL01 27

//Love, before the choice

CHAIN VPSIMEJ2 SimeLoveChoice
@19
END
COPY_TRANS FINSOL01 27

//Love, God

CHAIN VPSIMEJ2 SimeLoveGod
@20
END
COPY_TRANS FINSOL01 29

//Love, Mortal

CHAIN VPSIMEJ2 SimeLoveMortal0
@21
END
IF ~~ THEN REPLY @22 EXTERN VPSIMEJ2 SimeLoveMortal1
IF ~~ THEN REPLY @23 EXTERN VPSIMEJ2 SimeLoveMortal2
IF ~~ THEN REPLY @24 EXTERN VPSIMEJ2 SimeLoveMortal3
IF ~~ THEN REPLY @25 EXTERN VPSIMEJ2 SimeLoveMortal4
IF ~Gender(Player1,MALE)~ THEN REPLY @26 EXTERN VPSIMEJ2 SimeLoveMortal5
IF ~Gender(Player1,FEMALE)~ THEN REPLY @27 EXTERN VPSIMEJ2 SimeLoveMortal5

CHAIN VPSIMEJ2 SimeLoveMortal1
@28
END
IF ~~ THEN EXTERN VPSIMEJ2 SimeLoveMortalFinal

CHAIN VPSIMEJ2 SimeLoveMortal2
@29
END
IF ~~ THEN EXTERN VPSIMEJ2 SimeLoveMortalFinal

CHAIN VPSIMEJ2 SimeLoveMortal3
@30
END
IF ~~ THEN EXTERN VPSIMEJ2 SimeLoveMortalFinal

CHAIN VPSIMEJ2 SimeLoveMortal4
@31
END
IF ~~ THEN EXTERN VPSIMEJ2 SimeLoveMortalFinal

CHAIN VPSIMEJ2 SimeLoveMortal5
@32
END
IF ~~ THEN EXTERN VPSIMEJ2 SimeLoveMortalFinal

CHAIN VPSIMEJ2 SimeLoveMortalFinal
@33
END
COPY_TRANS FINSOL01 32