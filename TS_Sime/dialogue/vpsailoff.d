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

REPLACE ~PPSAEM~

IF ~~ THEN BEGIN 48
  SAY @0
  IF ~!InParty("vpsime")~ THEN EXTERN ~PPARAN2~ 5 // both cases: Sime has been already and has not been yet in party ---> original sequence of dialogues
  IF ~InParty("vpsime")~ THEN EXTERN ~PPARAN2~ VPSailOffSime // Sime is in party
END
END

CHAIN PPARAN2 VPSailOffSime
@1
= @2
== PPSAEM @3
== VPSIMEJ @4
== PPSAEM @5
== PPARAN2 @6
== PPSAEM @7
DO ~StartCutSceneMode() StartCutScene("vpcut41d")~
EXIT
