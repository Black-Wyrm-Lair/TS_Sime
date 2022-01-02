BEGIN VPSIMEP

IF WEIGHT #1 ~NumTimesTalkedToGT(0)
Global("Kicked_Out","LOCALS",1)
Global("VP_OnIsland","GLOBAL",0)~ THEN BEGIN 0
  SAY @0
  IF ~~ THEN REPLY @1 GOTO 1
  IF ~~ THEN REPLY @2 GOTO 7
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
END

IF WEIGHT #3 ~NumTimesTalkedToGT(0)
Global("Kicked_Out","LOCALS",0)~ THEN BEGIN 3
  SAY @4
  IF ~~ THEN REPLY @5 GOTO 4
  IF ~~ THEN REPLY @6 GOTO 13
END

IF ~~ THEN BEGIN 4
  SAY @7
  IF ~!AreaCheck("AR0601")
!AreaCheck("AR0602")
!AreaCheck("AR0603")
!AreaCheck("AR0410")
!AreaCheck("AR0411")
!AreaCheck("AR0412")
!AreaCheck("AR0413")
!AreaCheck("AR0414")
!AreaCheck("AR1512")
!AreaCheck("AR1513")
!AreaCheck("AR1514")
!AreaCheck("AR1515")
!AreaCheck("AR1516")
!AreaCheck("AR1501")
!AreaCheck("AR1502")
!AreaCheck("AR1503")
!AreaCheck("AR1504")
!AreaCheck("AR1505")
!AreaCheck("AR1506")
!AreaCheck("AR1507")
!AreaCheck("AR1508")
!AreaCheck("AR1509")
!AreaCheck("AR1510")
!AreaCheck("AR1511")
!AreaCheck("AR2100")
!AreaCheck("AR2101")
!AreaCheck("AR2102")
!AreaCheck("AR2200")
!AreaCheck("AR2202")
!AreaCheck("AR2203")
!AreaCheck("AR2204")
!AreaCheck("AR2205")
!AreaCheck("AR2206")
!AreaCheck("AR2207")
!AreaCheck("AR2208")
!AreaCheck("AR2209")
!AreaCheck("AR2210")
!AreaCheck("AR2300")
!AreaCheck("AR2400")
!AreaCheck("AR2401")
!AreaCheck("AR2402")
!AreaCheck("AR2900")
!AreaCheck("AR2901")
!AreaCheck("AR2902")
!AreaCheck("AR2903")
!AreaCheck("AR2904")
!AreaCheck("AR2905")
!AreaCheck("AR2906")
Global("VP_InHalruaa","GLOBAL",0)
Global("VP_OnIsland","GLOBAL",0)~ THEN REPLY @8 GOTO 10
  IF ~!AreaCheck("AR0301")
!AreaCheck("AR0302")
!AreaCheck("AR0303")
!AreaCheck("AR0304")
!AreaCheck("AR0305")
!AreaCheck("AR0306")
!AreaCheck("AR0307")
!AreaCheck("AR0509")
!AreaCheck("AR0510")
!AreaCheck("AR0511")
!AreaCheck("AR1102")
!AreaCheck("AR1107")
!AreaCheck("AR0801")
!AreaCheck("AR0803")
!AreaCheck("AR1300")
!AreaCheck("AR1301")
!AreaCheck("AR1302")
!AreaCheck("AR1303")
!AreaCheck("AR0601")
!AreaCheck("AR0602")
!AreaCheck("AR0603")
!AreaCheck("AR0604")
!AreaCheck("AR0605")
!AreaCheck("AR0606")
!InWatchersKeep()
Global("VP_OnIsland","GLOBAL",0)~ THEN REPLY @9 GOTO 11
  IF ~Global("VP_InHalruaa","GLOBAL",0)
Global("VP_OnIsland","GLOBAL",0)~ THEN REPLY @10 GOTO 12
END

IF WEIGHT #4 ~Global("SimeKorganFight","GLOBAL",2)
Global("Kicked_Out","LOCALS",0)~ THEN BEGIN 5
  SAY @11
  IF ~~ THEN REPLY @5 GOTO 6
  IF ~~ THEN REPLY @12 GOTO 17
END

IF ~~ THEN BEGIN 6
  SAY @7
  IF ~!AreaCheck("AR0601")
!AreaCheck("AR0602")
!AreaCheck("AR0603")
!AreaCheck("AR0410")
!AreaCheck("AR0411")
!AreaCheck("AR0412")
!AreaCheck("AR0413")
!AreaCheck("AR0414")
!AreaCheck("AR1512")
!AreaCheck("AR1513")
!AreaCheck("AR1514")
!AreaCheck("AR1515")
!AreaCheck("AR1516")
!AreaCheck("AR1501")
!AreaCheck("AR1502")
!AreaCheck("AR1503")
!AreaCheck("AR1504")
!AreaCheck("AR1505")
!AreaCheck("AR1506")
!AreaCheck("AR1507")
!AreaCheck("AR1508")
!AreaCheck("AR1509")
!AreaCheck("AR1510")
!AreaCheck("AR1511")
!AreaCheck("AR2100")
!AreaCheck("AR2101")
!AreaCheck("AR2102")
!AreaCheck("AR2200")
!AreaCheck("AR2202")
!AreaCheck("AR2203")
!AreaCheck("AR2204")
!AreaCheck("AR2205")
!AreaCheck("AR2206")
!AreaCheck("AR2207")
!AreaCheck("AR2208")
!AreaCheck("AR2209")
!AreaCheck("AR2210")
!AreaCheck("AR2300")
!AreaCheck("AR2400")
!AreaCheck("AR2401")
!AreaCheck("AR2402")
!AreaCheck("AR2900")
!AreaCheck("AR2901")
!AreaCheck("AR2902")
!AreaCheck("AR2903")
!AreaCheck("AR2904")
!AreaCheck("AR2905")
!AreaCheck("AR2906")
!AreaCheck("TT0100")
!AreaCheck("TT0101")
!AreaCheck("TT0102")
!AreaCheck("TT0201")
!AreaCheck("TT0202")
!AreaCheck("TT0203")
!AreaCheck("TT0204")
!AreaCheck("TT0301")
!AreaCheck("TT0302")
!AreaCheck("TT0303")
!AreaCheck("TT0304")
!AreaCheck("TT0305")
!AreaCheck("TT0306")
!AreaCheck("TT0307")
!AreaCheck("TT0308")~ THEN REPLY @8 GOTO 14
  IF ~!AreaCheck("AR0301")
!AreaCheck("AR0302")
!AreaCheck("AR0303")
!AreaCheck("AR0304")
!AreaCheck("AR0305")
!AreaCheck("AR0306")
!AreaCheck("AR0307")
!AreaCheck("AR0509")
!AreaCheck("AR0510")
!AreaCheck("AR0511")
!AreaCheck("AR1102")
!AreaCheck("AR1107")
!AreaCheck("AR0801")
!AreaCheck("AR0803")
!AreaCheck("AR1300")
!AreaCheck("AR1301")
!AreaCheck("AR1302")
!AreaCheck("AR1303")
!AreaCheck("AR0601")
!AreaCheck("AR0602")
!AreaCheck("AR0603")
!AreaCheck("AR0604")
!AreaCheck("AR0605")
!AreaCheck("AR0606")
!InWatchersKeep()
Global("VP_OnIsland","GLOBAL",0)~ THEN REPLY @9 GOTO 15
  IF ~Global("VP_InHalruaa","GLOBAL",0)
Global("VP_OnIsland","GLOBAL",0)~ THEN REPLY @10 GOTO 16
END

IF ~~ THEN BEGIN 7
  SAY @13
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 10
  SAY @14
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
EscapeAreaMove("AR0313",784,313,7)~ EXIT
END

IF ~~ THEN BEGIN 11
  SAY @13
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN 12
  SAY @15
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
EscapeAreaMove("AR0307",4642,2000,7)~ EXIT
END

IF ~~ THEN BEGIN 13
  SAY @16
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
END

IF ~~ THEN BEGIN 14
  SAY @14
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
SetGlobal("SimeKorganFight","GLOBAL",3)
EscapeAreaMove("AR0313",784,313,7)~ EXIT
END

IF ~~ THEN BEGIN 15
  SAY @13
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
SetGlobal("SimeKorganFight","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN 16
  SAY @15
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
SetGlobal("SimeKorganFight","GLOBAL",3)
EscapeAreaMove("AR0307",4642,2000,7)~ EXIT
END

IF ~~ THEN BEGIN 17
  SAY @16
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
SetGlobal("SimeKorganFight","GLOBAL",3)
JoinParty()~ EXIT
END

//After Vampire

IF WEIGHT #0 ~Global("VP_SimeVampire","GLOBAL",5)~ THEN BEGIN 18
  SAY @17
  IF ~~ THEN REPLY @18 DO ~EraseJournalEntry(32084)
EraseJournalEntry(32085)
EraseJournalEntry(16351)
EraseJournalEntry(7002)
EraseJournalEntry(3716)
EraseJournalEntry(5814)
EraseJournalEntry(16331)
EraseJournalEntry(11864)
EraseJournalEntry(3374)
EraseJournalEntry(3377)
EraseJournalEntry(3927)
EraseJournalEntry(15710)
EraseJournalEntry(6589)
EraseJournalEntry(79170)
EraseJournalEntry(79181)
SetGlobal("VP_SimeVampire","GLOBAL",6)~ GOTO 19
  IF ~~ THEN REPLY @19 DO ~EraseJournalEntry(32084)
EraseJournalEntry(32085)
EraseJournalEntry(16351)
EraseJournalEntry(7002)
EraseJournalEntry(3716)
EraseJournalEntry(5814)
EraseJournalEntry(16331)
EraseJournalEntry(11864)
EraseJournalEntry(3374)
EraseJournalEntry(3377)
EraseJournalEntry(3927)
EraseJournalEntry(15710)
EraseJournalEntry(6589)
EraseJournalEntry(79170)
EraseJournalEntry(79181)
SetGlobal("VP_SimeVampire","GLOBAL",6)~ GOTO 20
  IF ~~ THEN REPLY @20 DO ~EraseJournalEntry(32084)
EraseJournalEntry(32085)
EraseJournalEntry(16351)
EraseJournalEntry(7002)
EraseJournalEntry(3716)
EraseJournalEntry(5814)
EraseJournalEntry(16331)
EraseJournalEntry(11864)
EraseJournalEntry(3374)
EraseJournalEntry(3377)
EraseJournalEntry(3927)
EraseJournalEntry(15710)
EraseJournalEntry(6589)
EraseJournalEntry(79170)
EraseJournalEntry(79181)
SetGlobal("VP_SimeVampire","GLOBAL",6)~ GOTO 21
END

IF ~~ THEN BEGIN 19
  SAY @21
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
END

IF ~~ THEN BEGIN 20
  SAY @22
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
END

IF ~~ THEN BEGIN 21
  SAY @23
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
END