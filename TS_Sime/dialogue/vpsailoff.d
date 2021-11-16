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
  SAY ~Protection? I was not aware of any such plans. The captain should be consulted on all such matters.~
  IF ~!InParty("vpsime")~ THEN EXTERN ~PPARAN2~ 5 // both cases: Sime has been already and has not been yet in party ---> original sequence of dialogues
  IF ~InParty("vpsime")~ THEN EXTERN ~PPARAN2~ VPSailOffSime // Sime is in party
END
END

CHAIN PPARAN2 VPSailOffSime
~Sime has been travelling with <CHARNAME> for some time. She will attempt to improve the overall safety of the voyage.~
= ~She will be staying very close to you, Saemon Havarian. For your safety, of course.~
== PPSAEM ~Of course.~
== VPSIMEJ ~I shall make certain that, should we be surprised at sea, death will not come from a surprise source. Do I make myself clear?~
== PPSAEM ~As clear as clear could be, m’lady, though I am not sure I approve of your tone. I assure you, nothing untoward will happen during our crossing.~
== PPARAN2 ~Sime shall also advise you, <CHARNAME>. She is acquainted with a few of the inhabitants of the island.~
== PPSAEM ~Then we are fully staffed and ready to sail. Best that we get underway as soon as possible. Disembark, m’lord, and we shall away.~
DO ~StartCutSceneMode() StartCutScene("vpcut41d")~
EXIT
