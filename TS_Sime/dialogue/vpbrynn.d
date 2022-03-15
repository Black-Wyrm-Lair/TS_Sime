//////////////////////////////////////
//Replaces in Saemon Docks Dialogue
//////////////////////////////////////

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
= #43913
== PPSAEM #43916
== VPSIMEJ #43917
== PPSAEM #43918
== PPARAN2 #43919
== PPSAEM #43920
= #43921
DO ~StartCutSceneMode() StartCutScene("vp41dsp")~
EXIT

///////////////////////////
//Replacements in Brynnlaw
//////////////////////////

//Saemon (Start)

ALTER_TRANS PPSAEM // file name
BEGIN 53 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~!IfValidForPartyDialog("Nalia")
!IfValidForPartyDialog("Jan")
!IfValidForPartyDialog("Yoshimo")
!IfValidForPartyDialog("Korgan")
InParty("vpsime")~
END

ALTER_TRANS PPSAEM // file name
BEGIN 53 END // state number (can be more than one)
BEGIN 0 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~EXTERN VPSIMEJ VPSimeBrynnTalkAnswer1~
END

EXTEND_TOP PPSAEM 53
IF ~!IfValidForPartyDialog("Nalia")
!IfValidForPartyDialog("Jan")
!IfValidForPartyDialog("Yoshimo")
!IfValidForPartyDialog("Korgan")
!InParty("vpsime")
OR(2)
	See("ppsime")
	Global("Sime_Meet","GLOBAL",0)~ THEN DO ~SetGlobal("AsylumPlot","GLOBAL",2)~ JOURNAL #20632 EXTERN ~PPSIME~ 1
END

ADD_TRANS_TRIGGER ~PPSAEM~ 54 ~!InParty("Sime")
  OR(2)
See("ppsime")
Global("Sime_Meet","GLOBAL",0)~ DO 0

EXTEND_BOTTOM PPSAEM 54
  IF ~InParty("vpsime")~ THEN EXTERN VPSIMEJ VPSimeBrynnTalkAnswer2
END

ADD_TRANS_TRIGGER ~PPSAEM~ 56 ~Global("ThiefGroup","GLOBAL",1)
!InParty("Sime")
See("ppsime")~ DO 0

EXTEND_BOTTOM PPSAEM 56
  IF ~Global("ThiefGroup","GLOBAL",1)
InParty("vpsime")~ THEN DO ~SetAreaRestFlag(0)
StartCutSceneMode()
StartCutScene("vp41e")~ EXIT
  IF ~Global("ThiefGroup","GLOBAL",1)
!InParty("vpsime")
See("vpsime")~ THEN DO ~SetAreaRestFlag(0)
StartCutSceneMode()
StartCutScene("vp41e")~ EXIT
END

//Korgan (Start)

ALTER_TRANS KORGANJ // file name
BEGIN 117 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~!IfValidForPartyDialog("Jaheira")
!IfValidForPartyDialog("Cernd")
!IfValidForPartyDialog("Viconia")
Global("ThiefGroup","GLOBAL",1)
InParty("vpsime")~
END

ALTER_TRANS KORGANJ // file name
BEGIN 117 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~EXTERN VPSIMEJ VPSimeBrynnTalkAnswer1~
END

EXTEND_TOP KORGANJ 117
IF ~!IfValidForPartyDialog("Jaheira")
!IfValidForPartyDialog("Cernd")
!IfValidForPartyDialog("Viconia")
Global("ThiefGroup","GLOBAL",1)
!InParty("vpsime")
OR(2)
	See("ppsime")
	Global("Sime_Meet","GLOBAL",0)~
THEN DO ~SetGlobal("AsylumPlot","GLOBAL",2)~ JOURNAL #20632 EXTERN ~PPSIME~ 1
END

ALTER_TRANS KORGANJ // file name
BEGIN 118 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~Global("ThiefGroup","GLOBAL",1)
InParty("vpsime")~
END

ALTER_TRANS KORGANJ // file name
BEGIN 118 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~EXTERN VPSIMEJ VPSimeBrynnTalkAnswer1~
END

EXTEND_TOP KORGANJ 118
IF ~Global("ThiefGroup","GLOBAL",1)
!InParty("vpsime")
OR(2)
	See("ppsime")
	Global("Sime_Meet","GLOBAL",0)~
THEN DO ~SetGlobal("AsylumPlot","GLOBAL",2)~ JOURNAL #20632 EXTERN ~PPSIME~ 1
END

//Yoshimo (Start)

ALTER_TRANS YOSHJ // file name
BEGIN 92 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~!IfValidForPartyDialog("Korgan")
Global("ThiefGroup","GLOBAL",1)
InParty("vpsime")~
END

ALTER_TRANS YOSHJ // file name
BEGIN 92 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~EXTERN VPSIMEJ VPSimeBrynnTalkAnswer1~
END

EXTEND_TOP YOSHJ 92
IF ~!IfValidForPartyDialog("Korgan")
Global("ThiefGroup","GLOBAL",1)
!InParty("vpsime")
OR(2)
	See("ppsime")
	Global("Sime_Meet","GLOBAL",0)~
THEN DO ~SetGlobal("AsylumPlot","GLOBAL",2)~ JOURNAL #20632 EXTERN ~PPSIME~ 1
END

// Jan (Start)

ALTER_TRANS JANJ // file name
BEGIN 150 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~!IfValidForPartyDialog("Yoshimo")
!IfValidForPartyDialog("Korgan")
Global("ThiefGroup","GLOBAL",1)
InParty("vpsime")~
END

ALTER_TRANS JANJ // file name
BEGIN 150 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~EXTERN VPSIMEJ VPSimeBrynnTalkAnswer1~
END

EXTEND_TOP JANJ 150
IF ~!IfValidForPartyDialog("Yoshimo")
!IfValidForPartyDialog("Korgan")
Global("ThiefGroup","GLOBAL",1)
!InParty("vpsime")
OR(2)
	See("ppsime")
	Global("Sime_Meet","GLOBAL",0)~
THEN DO ~SetGlobal("AsylumPlot","GLOBAL",2)~ JOURNAL #20632 EXTERN ~PPSIME~ 1
END

// Nalia (Start)

ALTER_TRANS NALIAJ // file name
BEGIN 272 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "TRIGGER" ~!IfValidForPartyDialog("Jan")
!IfValidForPartyDialog("Yoshimo")
!IfValidForPartyDialog("Korgan")
Global("ThiefGroup","GLOBAL",1)
InParty("vpsime")~
END

ALTER_TRANS NALIAJ // file name
BEGIN 272 END // state number (can be more than one)
BEGIN 1 END // transition number (can be more than one)
BEGIN // list of changes, see below for flags
  "EPILOGUE" ~EXTERN VPSIMEJ VPSimeBrynnTalkAnswer1~
END

EXTEND_TOP NALIAJ 272
IF ~!IfValidForPartyDialog("Jan")
!IfValidForPartyDialog("Yoshimo")
!IfValidForPartyDialog("Korgan")
Global("ThiefGroup","GLOBAL",1)
!InParty("vpsime")
OR(2)
	See("ppsime")
	Global("Sime_Meet","GLOBAL",0)~
THEN DO ~SetGlobal("AsylumPlot","GLOBAL",2)~ JOURNAL #20632 EXTERN ~PPSIME~ 1
END

//VP Sime Answers

APPEND VPSIMEJ

IF ~~ THEN BEGIN VPSimeBrynnTalkAnswer1
  SAY #43923
  IF ~~ THEN EXTERN ~PPSAEM~ 54
END

IF ~~ THEN BEGIN VPSimeBrynnTalkAnswer2
  SAY #43925
  IF ~~ THEN EXTERN ~PPSAEM~ 55
END
END