BEGIN VPSIMEP

IF WEIGHT #1 ~NumTimesTalkedToGT(0)
Global("Kicked_Out","LOCALS",1)
Global("VP_OnIsland","GLOBAL",0)~ THEN BEGIN 0
  SAY ~Hey, you have returned? Have a need of Sime, don’t you?~
  IF ~~ THEN REPLY ~Yes, Sime, you are right. It was foolish of me to refuse your help. Join in!~ GOTO 1
  IF ~~ THEN REPLY ~No, just wanted to say hi. You are cool, but I am satisfied with my companions for now.~ GOTO 7
END

IF ~~ THEN BEGIN 1
  SAY ~Let’s go.~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
END

IF WEIGHT #3 ~NumTimesTalkedToGT(0)
Global("Kicked_Out","LOCALS",0)~ THEN BEGIN 3
  SAY ~I guess the time have come for us to part. Are you sure you do not want my company any longer?~
  IF ~~ THEN REPLY ~Sime, it is better if we go on separately for now.~ GOTO 4
  IF ~~ THEN REPLY ~Of course I want your company! It was a mistake, Sime, stay with us.~ GOTO 13
END

IF ~~ THEN BEGIN 4
  SAY ~Where should we meet if you were to change your mind?~
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
Global("VP_OnIsland","GLOBAL",0)~ THEN REPLY ~Meet us at the Sea Bounty Tavern.~ GOTO 10
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
Global("VP_OnIsland","GLOBAL",0)~ THEN REPLY ~Just wait right here and we’ll come back for you later.~ GOTO 11
  IF ~Global("VP_InHalruaa","GLOBAL",0)
Global("VP_OnIsland","GLOBAL",0)~ THEN REPLY ~I don’t know... If I change my mind, I’ll find you.~ GOTO 12
END

IF WEIGHT #4 ~Global("SimeKorganFight","GLOBAL",2)
Global("Kicked_Out","LOCALS",0)~ THEN BEGIN 5
  SAY ~Bah! The fool isn’t worse a fight. Bastard... If you still need my help, I’d gladly come with you, if not - I’ll find my own way...~
  IF ~~ THEN REPLY ~Sime, it is better if we go on separately for now.~ GOTO 6
  IF ~~ THEN REPLY ~Join the party again, then.~ GOTO 17
END

IF ~~ THEN BEGIN 6
  SAY ~Where should we meet if you were to change your mind?~
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
!AreaCheck("TT0308")~ THEN REPLY ~Meet us at the Sea Bounty Tavern.~ GOTO 14
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
Global("VP_OnIsland","GLOBAL",0)~ THEN REPLY ~Just wait right here and we’ll come back for you later.~ GOTO 15
  IF ~Global("VP_InHalruaa","GLOBAL",0)
Global("VP_OnIsland","GLOBAL",0)~ THEN REPLY ~I don’t know... If I change my mind, I’ll find you.~ GOTO 16
END

IF ~~ THEN BEGIN 7
  SAY ~As you wish, my friend.  See you soon, I hope.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 10
  SAY ~See you soon, then.  Take care of yourself.~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
EscapeAreaMove("AR0313",784,313,7)~ EXIT
END

IF ~~ THEN BEGIN 11
  SAY ~As you wish, my friend.  See you soon, I hope.~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN 12
  SAY ~I will be staying with my father for a time. You can find me there, if you require my further assistance.~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
EscapeAreaMove("AR0307",4642,2000,7)~ EXIT
END

IF ~~ THEN BEGIN 13
  SAY ~I thought as much.~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
END

IF ~~ THEN BEGIN 14
  SAY ~See you soon, then.  Take care of yourself.~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
SetGlobal("SimeKorganFight","GLOBAL",3)
EscapeAreaMove("AR0313",784,313,7)~ EXIT
END

IF ~~ THEN BEGIN 15
  SAY ~As you wish, my friend.  See you soon, I hope.~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
SetGlobal("SimeKorganFight","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN 16
  SAY ~I will be staying with my father for a time. You can find me there, if you require my further assistance.~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
SetGlobal("SimeKorganFight","GLOBAL",3)
EscapeAreaMove("AR0307",4642,2000,7)~ EXIT
END

IF ~~ THEN BEGIN 17
  SAY ~I thought as much.~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
SetGlobal("SimeKorganFight","GLOBAL",3)
JoinParty()~ EXIT
END

//After Vampire

IF WEIGHT #0 ~Global("VP_SimeVampire","GLOBAL",5)~ THEN BEGIN 18
  SAY ~Is it you, my love? That is a happy dream. I was yearning to dream of you for so long! You are just like I remember you, and you smile... I want to kiss you so much! Please, do not go away until I do. It is strange to beg a dream not to go away. Amazing how we have so little control over our dreams...~
  IF ~~ THEN REPLY ~It is no dream, Sime. It is for real. I took you away from Bodhi’s clutches and I brought you back to life. And you think that after all these troubles I will simply leave you? No way, milady, no way! You are stuck with me now.~ DO ~EraseJournalEntry(32084)
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
  IF ~~ THEN REPLY ~A dream? Do dreams kiss like that? (*You give Sime a deep kiss*)~ DO ~EraseJournalEntry(32084)
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
  IF ~~ THEN REPLY ~Sime, that’s me, <CHARNAME>! Can you hear me? You are going to be alright! Breathe deeply and here is some Elven water for you to drink! You are alive!~ DO ~EraseJournalEntry(32084)
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
  SAY ~I am it seems. I... I am sorry... I am not crying, it is just... well tears pouring out of my eyes. I love you, <CHARNAME>, I love you so much!~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
END

IF ~~ THEN BEGIN 20
  SAY ~(*Matches your kiss and embraces you tightly*)~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
END

IF ~~ THEN BEGIN 21
  SAY ~Ouch! This holy water is cold! I am awake now, stop pouring it over me!  I am bloody glad to see you... Ahem, sorry, very glad to see you...~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
END