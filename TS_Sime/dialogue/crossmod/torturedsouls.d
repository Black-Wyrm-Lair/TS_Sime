// Kachiko

/*
CHAIN
IF ~InParty("vpkachi")
See("vpkachi")
!StateCheck("vpkachi",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
RealGlobalTimerExpired("VPSimeKachikoTimer","GLOBAL")
Global("VPSimeKachiko1","GLOBAL",0)~ THEN VPSIMEB SimeKachiko1
~The world is a small place, Kachiko! Could I imagine that I would be talking to a Kara-Turian one day?~ [SIMEKA01]
DO ~SetGlobal("VPSimeKachiko1","GLOBAL",1) RealSetGlobalTimer("VPSimeKachikoTimer","GLOBAL",2000)~
== VPKACHIB ~The world is a small place for those who travel, Sime. I know people for whom their house is an entire world.~
== VPSIMEB ~You are right, of course there are plenty of those for whom stepping over the threshold is an adventure. Not the sort of adventure I dream of.~
== VPKACHIB ~The mind has no boundaries, Sime. A philosopher may never leave his straw mat but his mind will travel the highest mountains and the deepest gorges and see the things clearer than the one who has climbed to the top.~
== VPSIMEB ~I do not think I would derive satisfaction from a road walked only in my mind.~
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
~You grew up in a large family, did you not, Kachiko?~ [SIMEKA02]
DO ~SetGlobal("VPSimeKachiko2","GLOBAL",1) RealSetGlobalTimer("VPSimeKachikoTimer","GLOBAL",2000)~
== VPKACHIB ~I have four brothers and a sister.~
== VPSIMEB ~I am an only child. I always wanted to have a sibling.~
== VPKACHIB ~It is a joy to have relations, yes. Your father does not have any other children?~
== VPSIMEB ~My father has been befriending only one certain type of women ever since my mother’s death. The sort which do not stay with one man for long and who would not carry a child.~
== VPKACHIB ~You sound bitter, Sime.~
== VPSIMEB ~I am not bitter, I just. . .I think that Aran believes that it will save him from pain.~ [SIMEKA03]
== VPKACHIB ~And you do not believe so?~
== VPSIMEB ~No, I do not. He is wedging the knife deeper in his wound and twisting it, causing himself more pain and more sorrow. I told him that many times, but he would not listen. He will understand one day, but it will be too late.~
EXIT
*/