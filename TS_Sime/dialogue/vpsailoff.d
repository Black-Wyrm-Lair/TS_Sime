ADD_TRANS_TRIGGER ~ARAN~ 47 ~Global("Sime_Meet","GLOBAL",0)~ DO 0

EXTEND_BOTTOM ARAN 47
  IF ~Global("Sime_Meet","GLOBAL",1)
InParty("vpsime")~ THEN DO ~EraseJournalEntry(96562)
AddJournalEntry(96562,QUEST_DONE)
AddJournalEntry(96563,QUEST)
EraseJournalEntry(47783)
EraseJournalEntry(47805)
EraseJournalEntry(47806)
EraseJournalEntry(47831)
EraseJournalEntry(47837)
EraseJournalEntry(47838)
StartCutSceneMode()
StartCutScene("vpmov3b")~ JOURNAL #47839 EXIT
  IF ~Global("Sime_Meet","GLOBAL",1)
!InParty("vpsime")~ THEN DO ~EraseJournalEntry(96562)
AddJournalEntry(96562,QUEST_DONE)
AddJournalEntry(96563,QUEST)
EraseJournalEntry(47783)
EraseJournalEntry(47805)
EraseJournalEntry(47806)
EraseJournalEntry(47831)
EraseJournalEntry(47837)
EraseJournalEntry(47838)
StartCutSceneMode()
StartCutScene("Movie03b")~ JOURNAL #47839 EXIT
END

ALTER_TRANS PPSAEM // file name
BEGIN 52 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~!InParty("vpkachi") Global("Sime_Meet","GLOBAL",0)~
END

EXTEND_TOP PPSAEM 52
  IF ~!InParty("vpkachi") !InParty("vpsime") Global("Sime_Meet","GLOBAL",1)~ THEN DO ~StartCutSceneMode() StartCutScene("vp41dsm")~ EXIT
END

ALTER_TRANS PPSAEM // file name
BEGIN 48 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~!InParty("vpsime")~
END

EXTEND_BOTTOM PPSAEM 48
  IF ~InParty("vpsime") !InParty("vpkachi")~ THEN EXTERN ~PPARAN2~ VPSailOffSime
END

CHAIN PPARAN2 VPSailOffSime
@1
= @2
== PPSAEM @3
== VPSIMEJ @4
== PPSAEM @5
== PPARAN2 @6
== PPSAEM @7 DO ~StartCutSceneMode() StartCutScene("vp41dsp")~
EXIT
