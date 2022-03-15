BEGIN VPSIMEJ

//// Vampire Plot

// Abduction
ADD_TRANS_TRIGGER BODHIAMB 5 ~OR(2)
!InParty("vpsime")
!Global("VP_SimeRomanceActive","GLOBAL",2)~ DO 0

INTERJECT BODHIAMB 5 VPSimeBodhiAbduction1
== BODHIAMB IF ~Global("VP_SimeRomanceActive","GLOBAL",2)
InParty("vpsime")~ THEN @0
END
IF ~OR(2)
!InPartyAllowDead("vpsime")
Dead("vpsime")~ THEN EXTERN BODHIAMB 6
IF ~InPartyAllowDead("vpsime")
!Dead("vpsime")~ THEN EXTERN BODHIAMB VPSimeBodhiAbduction2

CHAIN BODHIAMB VPSimeBodhiAbduction2
@1
== VPSIMEJ @2
== BODHIAMB @3
END
IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("vpcutamb")~
UNSOLVED_JOURNAL @4 EXIT

// Oghma

ADD_TRANS_TRIGGER IMNBOOK1 0
~OR(2)
!Global("RevealUmar","GLOBAL",1)
!PartyHasItem("vpsbody")~

EXTEND_BOTTOM IMNBOOK1 0
IF ~PartyHasItem("vpsbody")
Global("RevealUmar","GLOBAL",1)~ THEN REPLY #59383 EXTERN IMNBOOK1 4
END

EXTEND_BOTTOM DOGHMA 0 #5
	+ ~Global("RevealUmar","GLOBAL",1) PartyHasItem("vpsbody")~ + @5 GOTO 10
END

EXTEND_BOTTOM DOGHMA 3 7 9 #4
	+ ~Global("RevealUmar","GLOBAL",1) PartyHasItem("vpsbody")~ + @5 GOTO 10
END

EXTEND_BOTTOM SUDEMIN 2
+ ~PartyHasItem("vpsbody")~ + @6 GOTO 3
END

ADD_STATE_TRIGGER OGHMONK1 0
  ~!PartyHasItem("vpsbody")~

ADD_STATE_TRIGGER OGHMONK1 1
  ~!PartyHasItem("vpsbody")~

ADD_STATE_TRIGGER OGHMONK1 2
  ~!PartyHasItem("vpsbody")~

ADD_STATE_TRIGGER OGHMONK1 3
  ~!PartyHasItem("vpsbody")~

// Elhan

EXTEND_BOTTOM C6ELHAN2 70
	+ ~PartyHasItem("vpsbody")~ + @7 + 76
END

EXTEND_BOTTOM WARSAGE 0
	+ ~!Dead("c6bodhi") Global("VP_SimeVampire","GLOBAL",2)~ + @8 + 6
END

EXTEND_BOTTOM WARSAGE 0
	+ ~PartyHasItem("vpsbody")~ + @9 + 5
END

// Final Battle

// Bodhi section 2

EXTEND_BOTTOM C6BODHI 21
IF ~Global("VP_SimeVampire","GLOBAL",2)~ + 23
END

EXTEND_BOTTOM C6BODHI 23
IF ~Global("VP_SimeVampire","GLOBAL",2)~ THEN REPLY @10 EXTERN C6BODHI VPSimeBodhiBattle
IF ~Global("VP_SimeVampire","GLOBAL",2)~ THEN REPLY @11 EXTERN C6BODHI VPSimeBodhiBattle
IF ~Global("VP_SimeVampire","GLOBAL",2)~ THEN REPLY @12 EXTERN C6BODHI VPSimeBodhiBattle
IF ~Global("VP_SimeVampire","GLOBAL",2)~ THEN REPLY @13 EXTERN C6BODHI VPSimeBodhiBattle
END

BEGIN VPSIMEVA

CHAIN C6BODHI VPSimeBodhiBattle
@14
== VPSIMEVA @15
= @16
== C6BODHI @17
END
IF ~~ EXTERN C6BODHI 22

//// Sols Meet

//Meet

BEGIN VPSOL
BEGIN VPSOLA
BEGIN VPSOLAUF

CHAIN IF ~Global("VP_SimeSolas","GLOBAL",1)~ THEN VPSOL VPSol0
@18 DO ~SetGlobal("VP_Sol_Speak_Sime","GLOBAL",1)~
== VPSOLA @19
== VPSOLAUF @20
== VPSOLA @21
== VPSOL @22
== VPSIMEJ @23
DO ~SetGlobal("VP_SimeSolas","GLOBAL",2)
ActionOverride("vpsol",Enemy())
ActionOverride("vpsola",Enemy())
ActionOverride("vpsolauf",Enemy())
AttackReevaluate("vpsol",75)~
EXIT

//After Fight

APPEND VPSIMEJ

IF WEIGHT #-96 ~Global("VP_SimeSolas","GLOBAL",2) Global("VP_SimeDefeatedSols","GLOBAL",1)~ THEN BEGIN VPSolAfter
  SAY @24
  IF ~~ THEN REPLY @25 DO ~SetGlobal("VP_SimeFlirt","GLOBAL",6)~ GOTO VPSolAftera
  IF ~~ THEN REPLY @26 DO ~SetGlobal("VP_SimeFlirt","GLOBAL",6)~ GOTO VPSolAfterb
  IF ~~ THEN REPLY @27 DO ~SetGlobal("VP_SimeFlirt","GLOBAL",6)~ GOTO VPSolAfterc
  IF ~~ THEN REPLY @28 DO ~SetGlobal("VP_SimeFlirt","GLOBAL",6)~ GOTO VPSolAfterd
  IF ~~ THEN REPLY @29 DO ~SetGlobal("VP_SimeFlirt","GLOBAL",6)~ GOTO VPSolAftere
END

IF ~~ THEN BEGIN VPSolAftera
  SAY @30
  IF ~~ THEN DO ~SetGlobal("VP_SimeRejected","GLOBAL",1)
SetGlobal("VP_SimeDefeatedSols","GLOBAL",3)
SetGlobal("Kicked_Out","LOCALS",1)
DestroyItem("vpwfig")
DestroyItem("vpsleat")
DestroyItem("vpsamul")
DestroyItem("vpshelm")
GivePartyAllEquipment()
LeaveParty()
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN VPSolAfterb
  SAY @31
  IF ~~ THEN DO ~SetGlobal("VP_SimeDefeatedSols","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN VPSolAfterc
  SAY @32
  IF ~~ THEN DO ~SetGlobal("VP_SimeDefeatedSols","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN VPSolAfterd
  SAY @33
  IF ~~ THEN DO ~SetGlobal("VP_SimeDefeatedSols","GLOBAL",2)
SetGlobal("Kicked_Out","GLOBAL",1)
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()
EscapeAreaMove("AR0307",4642,2000,0)~ EXIT
END

IF ~~ THEN BEGIN VPSolAftere
  SAY @34
  IF ~~ THEN DO ~SetGlobal("VP_SimeDefeatedSols","GLOBAL",2)~ EXIT
END
END

//// Slayer Change

//5 Friend

INTERJECT PLAYER1 5 VPSimeSlayerFriend5
== VPSIMEJ IF ~InParty("vpsime") InMyArea("vpsime") !StateCheck("vpsime",CD_STATE_NOTVALID) !Global("VP_SimeRomanceActive","GLOBAL",1) !Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN @37 
END
++ @38 EXTERN VPSIMEJ VPSimeSlayerFriend5a
++ @39 EXTERN VPSIMEJ VPSimeSlayerFriend5b
++ @40 EXTERN VPSIMEJ VPSimeSlayerFriend5c

CHAIN VPSIMEJ VPSimeSlayerFriend5a
@41
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerFriend5b
@42
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerFriend5c
@43
= @44
END
COPY_TRANS PLAYER1 5

//5 Love

INTERJECT PLAYER1 5 VPSimeSlayerLove5.0
== ~VPSIMEJ~ IF ~InParty("vpsime") InMyArea("vpsime") !StateCheck("vpsime",CD_STATE_NOTVALID) OR(2) Global("VP_SimeRomanceActive","GLOBAL",1) Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN
@45
END 
IF ~~ THEN REPLY @46 DO ~SetGlobal("VP_SlayerBanter","GLOBAL",3)~ EXTERN VPSIMEJ VPSimeSlayerLove5.1
IF ~~ THEN REPLY @47 DO ~SetGlobal("VP_SlayerBanter","GLOBAL",3)~ EXTERN VPSIMEJ VPSimeSlayerLove5.2
IF ~~ THEN REPLY @48 DO ~SetGlobal("VP_SlayerBanter","GLOBAL",3)~ EXTERN VPSIMEJ VPSimeSlayerLove5.3
IF ~~ THEN REPLY @49 DO ~SetGlobal("VP_SlayerBanter","GLOBAL",3)~ EXTERN VPSIMEJ VPSimeSlayerLove5.4

CHAIN VPSIMEJ VPSimeSlayerLove5.1
@50
END
  IF ~~ THEN REPLY @51 GOTO VPSimeSlayerLove5.1a
  IF ~~ THEN REPLY @52 GOTO VPSimeSlayerLove5.1a
  IF ~~ THEN REPLY @53 GOTO VPSimeSlayerLove5.1b

CHAIN VPSIMEJ VPSimeSlayerLove5.1a
@54
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerLove5.1b
@55
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerLove5.2
@56
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerLove5.3
@57
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerLove5.4
@58
END
  IF ~~ THEN REPLY @59 DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ GOTO VPSimeSlayerLove5.4a
  IF ~~ THEN REPLY @60 GOTO VPSimeSlayerLove5.4b
  IF ~~ THEN REPLY @61 GOTO VPSimeSlayerLove5.5
  
CHAIN VPSIMEJ VPSimeSlayerLove5.4a
@62
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerLove5.4b
@63
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerLove5.5
@64
END
  IF ~~ THEN REPLY @65 GOTO VPSimeSlayerLove5.5a
  IF ~~ THEN REPLY @66 GOTO VPSimeSlayerLove5.5b
  IF ~InParty("Imoen2") See("Imoen2")~ THEN REPLY @67 EXTERN ~IMOEN2J~ VPSimeSlayerLove5.5Immy1

CHAIN VPSIMEJ VPSimeSlayerLove5.5a
@68
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerLove5.5b
@69 DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~
END
COPY_TRANS PLAYER1 5

CHAIN IMOEN2J VPSimeSlayerLove5.5Immy1
@70
END
++ @71 EXTERN IMOEN2J VPSimeSlayerLove5.5Immy2

CHAIN IMOEN2J VPSimeSlayerLove5.5Immy2
@72
== VPSIMEJ @73
== IMOEN2J @74
END
  IF ~~ THEN REPLY @75 EXTERN IMOEN2J VPSimeSlayerLove5.5Immy2a
  IF ~~ THEN REPLY @76 EXTERN IMOEN2J VPSimeSlayerLove5.5Immy2b
  IF ~~ THEN REPLY @77 EXTERN IMOEN2J VPSimeSlayerLove5.5Immy2c

CHAIN IMOEN2J VPSimeSlayerLove5.5Immy2a
@78
== VPSIMEJ @79
END
COPY_TRANS PLAYER1 5

CHAIN IMOEN2J VPSimeSlayerLove5.5Immy2b
@80
== VPSIMEJ @81
END
COPY_TRANS PLAYER1 5

CHAIN IMOEN2J VPSimeSlayerLove5.5Immy2c
@82
== VPSIMEJ @81
END
COPY_TRANS PLAYER1 5

//7 Love

INTERJECT PLAYER1 7 VPSimeSlayer7
== VPSIMEJ IF ~InParty("vpsime") !StateCheck("vpsime",CD_STATE_NOTVALID) InMyArea("vpsime") Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN
@83
END
++ @84 DO ~SetGlobal("VPEndangerLovedOne","GLOBAL",1)~ EXTERN VPSIMEJ VPSimeSlayer7a
++ @85 DO ~SetGlobal("VPEndangerLovedOne","GLOBAL",1)~ EXTERN VPSIMEJ VPSimeSlayer7a
++ @86 DO ~SetGlobal("VPEndangerLovedOne","GLOBAL",1)~ EXTERN VPSIMEJ VPSimeSlayer7a

CHAIN VPSIMEJ VPSimeSlayer7a
#49924 /* ~<CHARNAME>? Your lips move but there is no sound. <CHARNAME>? <CHARNAME>!!!~ */
DO ~ActionOverride(Player1,ReallyForceSpell(Myself,SLAYER_CHANGE))~
EXIT

//// Tree of Life

// Friend

INTERJECT PLAYER1 33 VPSimeToLFriend0
== PLAYER1 IF ~OR(2) Global("VP_SimeRomanceActive","GLOBAL",0) Global("VP_SimeRomanceActive","GLOBAL",3) InParty("vpsime") InMyArea("vpsime") !StateCheck("vpsime",CD_STATE_NOTVALID)~ THEN
@87
END
  IF ~~ THEN REPLY @88 EXTERN VPSIMEJ VPSimeToLFriend1
  IF ~~ THEN REPLY @89 EXTERN VPSIMEJ VPSimeToLFriend2
  IF ~~ THEN REPLY @90 EXTERN VPSIMEJ VPSimeToLFriend3

APPEND VPSIMEJ

IF ~~ THEN BEGIN VPSimeToLFriend1
  SAY @91
COPY_TRANS PLAYER1 33
END  

IF ~~ THEN BEGIN VPSimeToLFriend2
  SAY @92
COPY_TRANS PLAYER1 33
END

IF ~~ THEN BEGIN VPSimeToLFriend3
  SAY @93
COPY_TRANS PLAYER1 33
END
END

// Love

INTERJECT PLAYER1 33 VPSimeToLLove0
== PLAYER1 IF ~OR(2) Global("VP_SimeRomanceActive","GLOBAL",1) Global("VP_SimeRomanceActive","GLOBAL",2) InParty("vpsime") InMyArea("vpsime") !StateCheck("vpsime",CD_STATE_NOTVALID)~ THEN
@94
END
  IF ~~ THEN REPLY @95 EXTERN VPSIMEJ VPSimeToLLove1
  IF ~~ THEN REPLY @96 EXTERN VPSIMEJ VPSimeToLLove2
  IF ~~ THEN REPLY @90 EXTERN VPSIMEJ VPSimeToLLove3

APPEND VPSIMEJ

IF ~~ THEN BEGIN VPSimeToLLove1
SAY @97
COPY_TRANS PLAYER1 33
END
  
IF ~~ THEN BEGIN VPSimeToLLove2
SAY @98
COPY_TRANS PLAYER1 33
END

IF ~~ THEN BEGIN VPSimeToLLove3
SAY @99
COPY_TRANS PLAYER1 33
END
END

//Hell

I_C_T PLAYER1 25 VPSimeHell 
== ~VPSIMEJ~ IF ~InParty("vpsime") InMyArea("vpsime") !StateCheck("vpsime",CD_STATE_NOTVALID)~ @100
END

/////////////////////
//// Sime Romance
////////////////////////

//// Pre-romance Flirts

// Flirt 1. Sime's Parents
APPEND VPSIMEJ

IF WEIGHT #-99 ~Global("VP_SimeFlirt","GLOBAL",2)~ THEN BEGIN f1.0
  SAY @101
  IF ~~ THEN REPLY @102 GOTO f1.1
  IF ~~ THEN REPLY @103 GOTO f1.x1
END

IF ~~ THEN BEGIN f1.1
  SAY @104
  IF ~~ THEN REPLY @105 GOTO f1.2
  IF ~~ THEN REPLY @106 GOTO f1.2
  IF ~~ THEN REPLY @107 GOTO f1.2
END

IF ~~ THEN BEGIN f1.2
  SAY @108
  IF ~~ THEN REPLY @109 GOTO f1.3
  IF ~~ THEN REPLY @110 GOTO f1.3
  IF ~~ THEN REPLY @111 GOTO f1.skip
END

IF ~~ THEN BEGIN f1.3
  SAY @112
  IF ~~ THEN REPLY @113 GOTO f1.4
  IF ~~ THEN REPLY @114 GOTO f1.x2
  IF ~~ THEN REPLY @115 GOTO f1.4
END

IF ~~ THEN BEGIN f1.4
  SAY @116
  IF ~~ THEN DO ~SetGlobal("VP_SimeFlirt","GLOBAL",3) RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800)~ EXIT
END


IF ~~ THEN BEGIN f1.x1
  SAY @117
  IF ~~ THEN DO ~SetGlobal("VP_SimeFlirt","GLOBAL",3) RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800) SetGlobal("VP_SimeRejected","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN f1.x2
  SAY @118
  IF ~~ THEN DO ~SetGlobal("VP_SimeFlirt","GLOBAL",3) RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800) SetGlobal("VP_SimeRejected","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN f1.skip
  SAY @119
  IF ~~ THEN DO ~SetGlobal("VP_SimeFlirt","GLOBAL",3) RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800)~ EXIT
END

//Flirt 2. Sime's mother

IF WEIGHT #-98 ~Global("VP_SimeFlirt","GLOBAL",4)~ THEN BEGIN f2.0
  SAY @120
  IF ~~ THEN REPLY @121 GOTO f2.1
  IF ~~ THEN REPLY @122 GOTO f2.x1
END

IF ~~ THEN BEGIN f2.1
  SAY @123
  IF ~~ THEN REPLY @124 GOTO f2.2
  IF ~~ THEN REPLY @125 GOTO f2.x1
END

IF ~~ THEN BEGIN f2.x1
  SAY @126
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800)
SetGlobal("VP_SimeFlirt","GLOBAL",5)
SetGlobal("VP_SimeRejected","GLOBAL",1)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN f2.2
  SAY @127
  IF ~~ THEN REPLY @128 GOTO f2.3
  IF ~~ THEN REPLY @129 GOTO f2.3a
  IF ~~ THEN REPLY @130 GOTO f2.x2
END

IF ~~ THEN BEGIN f2.3
  SAY @131
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800)
SetGlobal("VP_SimeFlirt","GLOBAL",5)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN f2.3a
  SAY @132
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800)
SetGlobal("VP_SimeFlirt","GLOBAL",5)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN f2.x2
  SAY @133
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800)
SetGlobal("VP_SimeFlirt","GLOBAL",5)
SetGlobal("VP_SimeRejected","GLOBAL",1)
RestParty()~ EXIT
END

// LT 2. Your Heritage

IF WEIGHT #-99 ~Global("VP_SimeLoveTalk","GLOBAL",2)~ THEN BEGIN lt1.0
  SAY @134
  IF ~~ THEN REPLY @135 GOTO lt1.1a
  IF ~~ THEN REPLY @136 GOTO lt1.1b
  IF ~~ THEN REPLY @137 GOTO lt1.1c
END

IF ~~ THEN BEGIN lt1.1a
  SAY @138
  IF ~~ THEN REPLY @139 GOTO lt1.2a
  IF ~~ THEN REPLY @140 GOTO lt1.2a
  IF ~~ THEN REPLY @141 GOTO lt1.xa
END

IF ~~ THEN BEGIN lt1.2a
  SAY @142
  IF ~~ THEN REPLY @143 GOTO lt1.3a
  IF ~~ THEN REPLY @144 GOTO lt1.3a
  IF ~~ THEN REPLY @145 GOTO lt1.4a
  IF ~~ THEN REPLY @146 GOTO lt1.xa
END

IF ~~ THEN BEGIN lt1.3a
  SAY @147
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN lt1.4a
  SAY @148
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN lt1.xa
  SAY @149
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN lt1.1b
  SAY @150
  IF ~~ THEN REPLY @151 GOTO lt1.2b
  IF ~~ THEN REPLY @152 GOTO lt1.3b
  IF ~~ THEN REPLY @153 GOTO lt1.4b
END

IF ~~ THEN BEGIN lt1.2b
  SAY @154
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN lt1.3b
  SAY @155
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN lt1.4b
  SAY @156
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN lt1.1c
  SAY @157
  IF ~~ THEN REPLY @158 GOTO lt1.2c
  IF ~~ THEN REPLY @159 GOTO lt1.xc1
  IF ~~ THEN REPLY @160 GOTO lt1.3c
END

IF ~~ THEN BEGIN lt1.2c
  SAY @161
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN lt1.xc1
  SAY @162
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)

SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN lt1.3c
  SAY @163
  IF ~~ THEN REPLY @164 GOTO lt1.xc2
  IF ~~ THEN REPLY @165 GOTO lt1.4c
  IF ~~ THEN REPLY @166 GOTO lt1.5c
END

IF ~~ THEN BEGIN lt1.xc2
  SAY @155
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)

SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN lt1.4c
  SAY @167
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN lt1.5c
  SAY @168
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

// LT 4. Nightmares

IF WEIGHT #-97 ~Global("VP_SimeLoveTalk","GLOBAL",4)~ THEN BEGIN 292
  SAY @169
  IF ~~ THEN REPLY @170 GOTO 293
  IF ~~ THEN REPLY @171 GOTO 297
  IF ~~ THEN REPLY @172 GOTO 298
  IF ~~ THEN REPLY @173 GOTO 299
END

IF ~~ THEN BEGIN 293
  SAY @174
  IF ~~ THEN REPLY @175 GOTO 294
  IF ~~ THEN REPLY @176 GOTO 294
  IF ~~ THEN REPLY @177 GOTO 295
  IF ~~ THEN REPLY @178 GOTO 296
END

IF ~~ THEN BEGIN 294
  SAY @179
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",5)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 295
  SAY @180
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",5)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 296
  SAY @181
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",5)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 297
  SAY @182
  IF ~~ THEN REPLY @183 GOTO 294
  IF ~~ THEN REPLY @176 GOTO 294
  IF ~~ THEN REPLY @177 GOTO 295
  IF ~~ THEN REPLY @178 GOTO 296
END

IF ~~ THEN BEGIN 298
  SAY @184
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",5)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 299
  SAY @185
  IF ~~ THEN REPLY @175 GOTO 294
  IF ~~ THEN REPLY @176 GOTO 294
  IF ~~ THEN REPLY @177 GOTO 295
  IF ~~ THEN REPLY @186 GOTO 300
  IF ~~ THEN REPLY @178 GOTO 296
END

IF ~~ THEN BEGIN 300
  SAY @187
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",5)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

//LT 6

IF WEIGHT #-96 ~Global("VP_SimeLoveTalk","GLOBAL",6)~ THEN BEGIN 301
  SAY @188
  IF ~~ THEN REPLY @189 GOTO 302
  IF ~~ THEN REPLY @190 GOTO 302
  IF ~~ THEN REPLY @191 GOTO 307
END

IF ~~ THEN BEGIN 302
  SAY @192
  IF ~~ THEN REPLY @193 GOTO 303
  IF ~~ THEN REPLY @194 GOTO 308
  IF ~~ THEN REPLY @195 GOTO 309
END

IF ~~ THEN BEGIN 303
  SAY @196
  IF ~~ THEN REPLY @197 GOTO 304
  IF ~~ THEN REPLY @198 GOTO 304
  IF ~~ THEN REPLY @199 GOTO 307
END

IF ~~ THEN BEGIN 304
  SAY @200
  IF ~~ THEN REPLY @201 GOTO 305
  IF ~~ THEN REPLY @202 GOTO 306
  IF ~~ THEN REPLY @199 GOTO 307
END

IF ~~ THEN BEGIN 305
  SAY @203
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",7)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 306
  SAY @204
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",7)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 307
  SAY @205
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",7)

SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN 308
  SAY @206
  IF ~~ THEN REPLY @207 GOTO 309
  IF ~~ THEN REPLY @208 GOTO 304
  IF ~~ THEN REPLY @209 GOTO 310
END

IF ~~ THEN BEGIN 309
  SAY @210
  IF ~~ THEN GOTO 304
END

IF ~~ THEN BEGIN 310
  SAY @211
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",7)

SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT
END

// LT 8

IF WEIGHT #-95 ~Global("VP_SimeLoveTalk","GLOBAL",8)~ THEN BEGIN 311
  SAY @212
  IF ~~ THEN REPLY @213 GOTO 312
  IF ~~ THEN REPLY @214 GOTO 312
  IF ~~ THEN REPLY @215 GOTO 319
  IF ~~ THEN REPLY @216 GOTO 320
END

IF ~~ THEN BEGIN 312
  SAY @217
  IF ~~ THEN REPLY @218 GOTO 313
  IF ~~ THEN REPLY @219 GOTO 317
  IF ~~ THEN REPLY @220 GOTO 318
  IF ~~ THEN REPLY @221 GOTO 316
END

IF ~~ THEN BEGIN 313
  SAY @222
  IF ~~ THEN REPLY @223 GOTO 314
  IF ~~ THEN REPLY @224 GOTO 315
  IF ~~ THEN REPLY @225 GOTO 316
END

IF ~~ THEN BEGIN 314
  SAY @226
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",9)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 315
  SAY @227
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",9)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 316
  SAY @228
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",9)

SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN 317
  SAY @229
  IF ~~ THEN REPLY @223 GOTO 314
  IF ~~ THEN REPLY @224 GOTO 315
  IF ~~ THEN REPLY @225 GOTO 316
END

IF ~~ THEN BEGIN 318
  SAY @230
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",9)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 319
  SAY @231
  IF ~~ THEN REPLY @218 GOTO 313
  IF ~~ THEN REPLY @219 GOTO 317
  IF ~~ THEN REPLY @220 GOTO 318
  IF ~~ THEN REPLY @232 GOTO 316
END

IF ~~ THEN BEGIN 320
  SAY @233
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",9)

SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT
END

// LT 10

IF WEIGHT #-94 ~Global("VP_SimeLoveTalk","GLOBAL",10)~ THEN BEGIN 321
  SAY @234
  IF ~Gender(Player1,MALE)~ THEN REPLY @235 GOTO 322
  IF ~Class(Player1,PALADIN_ALL)~ THEN REPLY @236 GOTO 323
  IF ~~ THEN REPLY @237 GOTO 331
  IF ~~ THEN REPLY @238 GOTO 327
  IF ~~ THEN REPLY @239 GOTO 330
  IF ~Class(Player1,RANGER_ALL)~ THEN REPLY @236 GOTO 328
  IF ~!Class(Player1,RANGER_ALL)
!Class(Player1,PALADIN_ALL)~ THEN REPLY @236 GOTO 329
END

IF ~~ THEN BEGIN 322
  SAY @240
  IF ~Class(Player1,PALADIN)~ THEN REPLY @241 GOTO 323
  IF ~~ THEN REPLY @238 GOTO 327
  IF ~~ THEN REPLY @239 GOTO 330
  IF ~Class(Player1,RANGER)~ THEN REPLY @241 GOTO 328
  IF ~!Class(Player1,RANGER)
!Class(Player1,PALADIN)~ THEN REPLY @241 GOTO 329
END

IF ~~ THEN BEGIN 323
  SAY @242
  IF ~~ THEN REPLY @243 GOTO 324
  IF ~~ THEN REPLY @244 GOTO 325
  IF ~~ THEN REPLY @245 GOTO 326
END

IF ~~ THEN BEGIN 324
  SAY @246
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",11)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 325
  SAY @247
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",11)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 326
  SAY @248
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",11)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 327
  SAY @249
  IF ~Class(Player1,PALADIN)~ THEN REPLY @250 GOTO 323
  IF ~Class(Player1,RANGER)~ THEN REPLY @250 GOTO 328
  IF ~!Class(Player1,RANGER)
!Class(Player1,PALADIN)~ THEN REPLY @250 GOTO 329
  IF ~~ THEN REPLY @239 GOTO 330
END

IF ~~ THEN BEGIN 328
  SAY @251
  IF ~~ THEN REPLY @252 GOTO 324
  IF ~~ THEN REPLY @253 GOTO 325
  IF ~~ THEN REPLY @254 GOTO 326
END

IF ~~ THEN BEGIN 329
  SAY @255
  IF ~~ THEN REPLY @252 GOTO 324
  IF ~~ THEN REPLY @253 GOTO 325
  IF ~~ THEN REPLY @256 GOTO 326
END

IF ~~ THEN BEGIN 330
  SAY @257
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",11)
SetGlobal("Kicked_Out","GLOBAL",1)
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()
EscapeAreaMove("AR0307",4642,2000,0)~ EXIT
END

IF ~~ THEN BEGIN 331
  SAY @258
  IF ~Class(Player1,PALADIN)~ THEN REPLY @259 GOTO 323
  IF ~Class(Player1,RANGER)~ THEN REPLY @259 GOTO 328
  IF ~!Class(Player1,RANGER)
!Class(Player1,PALADIN)~ THEN REPLY @260 GOTO 329
  IF ~~ THEN REPLY @238 GOTO 327
  IF ~~ THEN REPLY @239 GOTO 330
END

// LT6 12

IF WEIGHT #-93 ~Global("VP_SimeLoveTalk","GLOBAL",12)~ THEN BEGIN 332
  SAY @261
  IF ~~ THEN REPLY @262 GOTO 333
  IF ~~ THEN REPLY @263 GOTO 333
  IF ~~ THEN REPLY @264 GOTO 341
  IF ~~ THEN REPLY @265 GOTO 340
END

IF ~~ THEN BEGIN 333
  SAY @266
  IF ~~ THEN REPLY @267 GOTO 334
  IF ~~ THEN REPLY @268 GOTO 339
  IF ~~ THEN REPLY @265 GOTO 340
END

IF ~~ THEN BEGIN 334
  SAY @269
  IF ~~ THEN REPLY @270 GOTO 335
  IF ~~ THEN REPLY @271 GOTO 336
  IF ~~ THEN REPLY @272 GOTO 337
  IF ~~ THEN REPLY @273 GOTO 338
END

IF ~~ THEN BEGIN 335
  SAY @274
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",13)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 336
  SAY @275
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",13)
~ EXIT
END

IF ~~ THEN BEGIN 337
  SAY @276
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",13)
~ EXIT
END

IF ~~ THEN BEGIN 338
  SAY @277
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",13)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 339
  SAY @278
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",13)
~ EXIT
END

IF ~~ THEN BEGIN 340
  SAY @279
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",13)
~ EXIT
END

IF ~~ THEN BEGIN 341
  SAY @280
  IF ~~ THEN REPLY @281 GOTO 334
  IF ~~ THEN REPLY @268 GOTO 339
  IF ~~ THEN REPLY @265 GOTO 340
  IF ~OR(3)
Class(Player1,FIGHTER)
Class(Player1,PALADIN)
Class(Player1,RANGER)~ THEN REPLY @282 GOTO 334
END

//LT 14

IF WEIGHT #-92 ~Global("VP_SimeLoveTalk","GLOBAL",14)~ THEN BEGIN 342
  SAY @283
  IF ~~ THEN REPLY @284 GOTO 343
  IF ~~ THEN REPLY @285 GOTO 343
  IF ~~ THEN REPLY @286 GOTO 354
END

IF ~~ THEN BEGIN 343
  SAY @287
  IF ~~ THEN REPLY @288 GOTO 345
  IF ~Gender(Player1,FEMALE)~ THEN REPLY @289 GOTO 344
  IF ~Gender(Player1,MALE)~ THEN REPLY @290 GOTO 344
  IF ~OR(3)
Class(Player1,FIGHTER)
Class(Player1,PALADIN)
Class(Player1,RANGER)~ THEN REPLY @291 GOTO 345
END

IF ~~ THEN BEGIN 344
  SAY @292
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 345
  SAY @293
  IF ~~ THEN REPLY @294 GOTO 346
  IF ~~ THEN REPLY @295 GOTO 352
  IF ~~ THEN REPLY @296 GOTO 348
END

IF ~~ THEN BEGIN 346
  SAY @297
  IF ~~ THEN REPLY @295 GOTO 347
  IF ~~ THEN REPLY @298 GOTO 348
  IF ~~ THEN REPLY @299 GOTO 351
END

IF ~~ THEN BEGIN 347
  SAY @300
  IF ~~ THEN REPLY @298 GOTO 348
  IF ~~ THEN REPLY @299 GOTO 351
END

IF ~~ THEN BEGIN 348
  SAY @301
  IF ~~ THEN REPLY @302 GOTO 349
  IF ~~ THEN REPLY @303 GOTO 350
  IF ~~ THEN REPLY @304 GOTO 351
END

IF ~~ THEN BEGIN 349
  SAY @305
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 350
  SAY @306
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 351
  SAY @307
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 352
  SAY @300
  IF ~~ THEN REPLY @294 GOTO 353
  IF ~~ THEN REPLY @298 GOTO 348
  IF ~~ THEN REPLY @299 GOTO 351
END

IF ~~ THEN BEGIN 353
  SAY @297
  IF ~~ THEN REPLY @299 GOTO 351
  IF ~~ THEN REPLY @298 GOTO 348
END

IF ~~ THEN BEGIN 354
  SAY @308
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",15)

RestParty()~ EXIT
END

IF ~~ THEN BEGIN 355
  SAY @309
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",15)

RestParty()~ EXIT
END

IF ~~ THEN BEGIN 356
  SAY @310
  IF ~~ THEN REPLY @311 GOTO 357
  IF ~~ THEN REPLY @312 GOTO 355
END

IF ~~ THEN BEGIN 357
  SAY @313
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

RestParty()~ EXIT
END

IF ~~ THEN BEGIN 358
  SAY @314
  IF ~~ THEN REPLY @315 GOTO 359
  IF ~~ THEN REPLY @316 GOTO 360
END

IF ~~ THEN BEGIN 359
  SAY @317
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

RestParty()~ EXIT
END

IF ~~ THEN BEGIN 360
  SAY @318
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

RestParty()~ EXIT
END

IF ~~ THEN BEGIN 361
  SAY @319
  IF ~!Alignment(Player1,CHAOTIC_EVIL)
!Alignment(Player1,LAWFUL_EVIL)
!Alignment(Player1,NEUTRAL_EVIL)~ THEN REPLY @320 GOTO 362
  IF ~~ THEN REPLY @321 GOTO 363
  IF ~~ THEN REPLY @322 GOTO 364
END

IF ~~ THEN BEGIN 362
  SAY @323
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

RestParty()~ EXIT
END

IF ~~ THEN BEGIN 363
  SAY @324
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",15)

RestParty()~ EXIT
END

IF ~~ THEN BEGIN 364
  SAY @325
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

RestParty()~ EXIT
END

// LT 16

IF WEIGHT #-91 ~Global("VP_SimeLoveTalk","GLOBAL",16)~ THEN BEGIN 365
  SAY @326
  IF ~~ THEN REPLY @327 GOTO 366
  IF ~~ THEN REPLY @328 GOTO 374
  IF ~~ THEN REPLY @329 GOTO 366
END

IF ~~ THEN BEGIN 366
  SAY @330
  IF ~~ THEN REPLY @331 GOTO 367
  IF ~~ THEN REPLY @332 GOTO 372
  IF ~~ THEN REPLY @333 GOTO 371
  IF ~~ THEN REPLY @334 GOTO 373
END

IF ~~ THEN BEGIN 367
  SAY @335
  IF ~~ THEN REPLY @336 GOTO 368
  IF ~~ THEN REPLY @337 GOTO 371
  IF ~~ THEN REPLY @338 GOTO 370
END

IF ~~ THEN BEGIN 368
  SAY @339
  IF ~~ THEN REPLY @340 GOTO 369
  IF ~~ THEN REPLY @341 GOTO 369
  IF ~~ THEN REPLY @338 GOTO 370
END

IF ~~ THEN BEGIN 369
  SAY @342
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",17)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 370
  SAY @343
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",17)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 371
  SAY @344
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",17)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 372
  SAY @345
  IF ~~ THEN REPLY @336 GOTO 368
  IF ~~ THEN REPLY @337 GOTO 371
  IF ~~ THEN REPLY @338 GOTO 370
END

IF ~~ THEN BEGIN 373
  SAY @346
  IF ~~ THEN REPLY @336 GOTO 368
  IF ~~ THEN REPLY @337 GOTO 371
  IF ~~ THEN REPLY @338 GOTO 370
END

IF ~~ THEN BEGIN 374
  SAY @347
  IF ~~ THEN REPLY @348 GOTO 366
  IF ~~ THEN REPLY @328 GOTO 375
  IF ~~ THEN REPLY @349 GOTO 371
END

IF ~~ THEN BEGIN 375
  SAY @350
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",17)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

// LT 18

IF WEIGHT #-90 ~Global("VP_SimeLoveTalk","GLOBAL",18)~ THEN BEGIN 376
  SAY @351
  IF ~~ THEN GOTO 377
END

IF ~~ THEN BEGIN 377
  SAY @352
  IF ~Class(Player1,THIEF)~ THEN REPLY @353 GOTO 378
  IF ~~ THEN REPLY @354 GOTO 386
  IF ~~ THEN REPLY @355 GOTO 390
  IF ~~ THEN REPLY @356 GOTO 394
END

IF ~~ THEN BEGIN 378
  SAY @357
  IF ~~ THEN REPLY @358 GOTO 379
  IF ~~ THEN REPLY @359 GOTO 383
  IF ~~ THEN REPLY @360 GOTO 384
  IF ~~ THEN REPLY @361 GOTO 385
END

IF ~~ THEN BEGIN 379
  SAY @362
  IF ~~ THEN REPLY @363 GOTO 380
  IF ~~ THEN REPLY @364 GOTO 381
END

IF ~~ THEN BEGIN 380
  SAY @365
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",19)~ EXIT
END

IF ~~ THEN BEGIN 381
  SAY @366
  IF ~~ THEN GOTO 382
END

IF ~~ THEN BEGIN 382
  SAY @367
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",19)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 383
  SAY @368
  IF ~~ THEN REPLY @363 GOTO 380
  IF ~~ THEN REPLY @369 GOTO 381
END

IF ~~ THEN BEGIN 384
  SAY @370
  IF ~~ THEN REPLY @363 GOTO 380
  IF ~~ THEN REPLY @369 GOTO 381
END

IF ~~ THEN BEGIN 385
  SAY @371
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",19)~ EXIT
END

IF ~~ THEN BEGIN 386
  SAY @372
  IF ~~ THEN REPLY @373 GOTO 387
  IF ~~ THEN REPLY @374 GOTO 388
  IF ~~ THEN REPLY @375 GOTO 389
END

IF ~~ THEN BEGIN 387
  SAY @376
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",19)~ EXIT
END

IF ~~ THEN BEGIN 388
  SAY @377
  IF ~~ THEN GOTO 382
END

IF ~~ THEN BEGIN 389
  SAY @378
  IF ~~ THEN GOTO 382
END

IF ~~ THEN BEGIN 390
  SAY @379
  IF ~~ THEN REPLY @380 GOTO 391
  IF ~~ THEN REPLY @381 GOTO 392
  IF ~~ THEN REPLY @382 GOTO 393
END

IF ~~ THEN BEGIN 391
  SAY @383
  IF ~~ THEN GOTO 382
END

IF ~~ THEN BEGIN 392
  SAY @384
  IF ~~ THEN GOTO 382
END

IF ~~ THEN BEGIN 393
  SAY @385
  IF ~~ THEN GOTO 382
END

IF ~~ THEN BEGIN 394
  SAY @386
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",19)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

// LT 20

IF WEIGHT #-90 ~Global("VP_SimeLoveTalk","GLOBAL",20)~ THEN BEGIN 395
  SAY @387
  IF ~OR(2)
Class(Player1,DRUID_ALL)
Class(Player1,RANGER_ALL)~ THEN REPLY @388 GOTO 396
  IF ~OR(2)
Class(Player1,MAGE_ALL)
Class(Player1,SORCERER)~ THEN REPLY @389 GOTO 408
  IF ~~ THEN REPLY @390 GOTO 409
  IF ~~ THEN REPLY @391 GOTO 409
  IF ~~ THEN REPLY @392 GOTO 410
END

IF ~~ THEN BEGIN 396
  SAY @393
  IF ~OR(3)
Class(Player1,DRUID)
Class(Player1,RANGER)
Class(Player1,MAGE)~ THEN REPLY @394 GOTO 397
  IF ~~ THEN REPLY @395 GOTO 406
  IF ~CheckStatGT(Player1,12,WIS)~ THEN REPLY @396 GOTO 406
  IF ~~ THEN REPLY @397 GOTO 407
END

IF ~~ THEN BEGIN 397
  SAY @398
  IF ~~ THEN REPLY @399 GOTO 398
  IF ~~ THEN REPLY @400 GOTO 399
  IF ~~ THEN REPLY @401 GOTO 399
  IF ~~ THEN REPLY @402 GOTO 403
  IF ~~ THEN REPLY @403 GOTO 403
END

IF ~~ THEN BEGIN 398
  SAY @404
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",21)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 399
  SAY @405
  IF ~~ THEN REPLY @406 GOTO 400
  IF ~~ THEN REPLY @407 GOTO 400
  IF ~~ THEN REPLY @408 GOTO 400
END

IF ~~ THEN BEGIN 400
  SAY @409
  IF ~~ THEN REPLY @410 GOTO 401
  IF ~~ THEN REPLY @411 GOTO 402
END

IF ~~ THEN BEGIN 401
  SAY @412
  IF ~~ THEN DO ~GiveItemCreate("VPBela",Player1,1,0,0)
ActionOverride(Player1,UseItem("VPBela",Myself))
SetGlobal("VP_SimeLoveTalk","GLOBAL",21)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 402
  SAY @413
  IF ~~ THEN DO ~GiveItemCreate("VPBela",Player1,1,0,0)
ActionOverride(Player1,UseItem("VPBela",Myself))
SetGlobal("VP_SimeLoveTalk","GLOBAL",21)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 403
  SAY @414
  IF ~~ THEN REPLY @415 GOTO 404
  IF ~~ THEN REPLY @416 GOTO 404
  IF ~~ THEN REPLY @417 GOTO 405
END

IF ~~ THEN BEGIN 404
  SAY @418
  IF ~~ THEN DO ~GiveItemCreate("VPBela",Myself,1,0,0)
UseItem("VPBela",Myself)
SetGlobal("VP_SimeLoveTalk","GLOBAL",21)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 405
  SAY @419
  IF ~~ THEN DO ~GiveItemCreate("VPBela",Myself,1,0,0)
UseItem("VPBela",Myself)
SetGlobal("VP_SimeLoveTalk","GLOBAL",21)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 406
  SAY @420
  IF ~~ THEN REPLY @399 GOTO 398
  IF ~~ THEN REPLY @400 GOTO 399
  IF ~~ THEN REPLY @401 GOTO 399
  IF ~~ THEN REPLY @402 GOTO 403
  IF ~~ THEN REPLY @403 GOTO 403
END

IF ~~ THEN BEGIN 407
  SAY @421
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",21)~ EXIT
END

IF ~~ THEN BEGIN 408
  SAY @422
  IF ~OR(3)
Class(Player1,DRUID)
Class(Player1,RANGER)
Class(Player1,MAGE)~ THEN REPLY @394 GOTO 397
  IF ~~ THEN REPLY @395 GOTO 406
  IF ~CheckStatGT(Player1,12,WIS)~ THEN REPLY @396 GOTO 406
  IF ~~ THEN REPLY @397 GOTO 407
END

IF ~~ THEN BEGIN 409
  SAY @423
  IF ~OR(3)
Class(Player1,DRUID)
Class(Player1,RANGER)
Class(Player1,MAGE)~ THEN REPLY @394 GOTO 397
  IF ~~ THEN REPLY @395 GOTO 406
  IF ~CheckStatGT(Player1,12,WIS)~ THEN REPLY @396 GOTO 406
  IF ~~ THEN REPLY @397 GOTO 407
END

IF ~~ THEN BEGIN 410
  SAY @424
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",21)~ EXIT
END

// LT 22

IF WEIGHT #-89 ~Global("VP_SimeLoveTalk","GLOBAL",22)~ THEN BEGIN 411
  SAY @425
  IF ~~ THEN REPLY @426 GOTO 412
  IF ~~ THEN REPLY @427 GOTO 413
  IF ~~ THEN REPLY @428 GOTO 414
  IF ~~ THEN REPLY @429 GOTO 423
  IF ~Gender(Player1,FEMALE)~ THEN REPLY @430 GOTO 423
END

IF ~~ THEN BEGIN 412
  SAY @431
  IF ~~ THEN REPLY @432 GOTO 413
  IF ~~ THEN REPLY @433 GOTO 414
  IF ~~ THEN REPLY @434 GOTO 423
  IF ~Gender(Player1,FEMALE)~ THEN REPLY @435 GOTO 423
END

IF ~~ THEN BEGIN 413
  SAY @436
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",2)

SetGlobal("VP_SleptSime","GLOBAL",1)
SetGlobal("VP_SimeLoveTalk","GLOBAL",23)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 414
  SAY @437
  IF ~~ THEN REPLY @438 GOTO 415
  IF ~~ THEN REPLY @439 GOTO 416
  IF ~~ THEN REPLY @440 GOTO 421
  IF ~~ THEN REPLY @441 GOTO 422
END

IF ~~ THEN BEGIN 415
  SAY @442
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",2)

SetGlobal("VP_SleptSime","GLOBAL",1)
SetGlobal("VP_SimeLoveTalk","GLOBAL",23)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 416
  SAY @443
  IF ~Gender(Player1,MALE)~ THEN REPLY @444 GOTO 417
  IF ~Gender(Player1,MALE)~ THEN REPLY @445 GOTO 417
  IF ~~ THEN REPLY @446 GOTO 418
  IF ~Gender(Player1,FEMALE)~ THEN REPLY @444 GOTO 420
  IF ~Gender(Player1,FEMALE)~ THEN REPLY @445 GOTO 420
END

IF ~~ THEN BEGIN 417
  SAY @447
  IF ~~ THEN REPLY @448 GOTO 418
  IF ~~ THEN REPLY @449 GOTO 419
END

IF ~~ THEN BEGIN 418
  SAY @442
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",2)

SetGlobal("VP_SleptSime","GLOBAL",1)
SetGlobal("VP_SimeLoveTalk","GLOBAL",23)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 419
  SAY @450
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",2)

SetGlobal("VP_SimeLoveTalk","GLOBAL",23)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 420
  SAY @451
  IF ~~ THEN REPLY @448 GOTO 418
  IF ~~ THEN REPLY @449 GOTO 419
END

IF ~~ THEN BEGIN 421
  SAY @452
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",2)

SetGlobal("VP_SleptSime","GLOBAL",1)
SetGlobal("VP_SimeLoveTalk","GLOBAL",23)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 422
  SAY @453
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",23)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 423
  SAY @454
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",23)
RestParty()~ EXIT
END

// LT 24

IF WEIGHT #-88 ~Global("VP_SimeLoveTalk","GLOBAL",24)~ THEN BEGIN 424
  SAY @455
  IF ~~ THEN REPLY @456 GOTO 425
  IF ~~ THEN REPLY @457 GOTO 429
  IF ~~ THEN REPLY @458 GOTO 430
END

IF ~~ THEN BEGIN 425
  SAY @459
  IF ~~ THEN REPLY @460 GOTO 426
  IF ~Gender(Player1,MALE)~ THEN REPLY @461 GOTO 427
  IF ~Gender(Player1,FEMALE)~ THEN REPLY @462 GOTO 589
  IF ~~ THEN REPLY @463 GOTO 428
END

IF ~~ THEN BEGIN 426
  SAY @464
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",25)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 427
  SAY @465
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",25)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 428
  SAY @466
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",25)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 429
  SAY @467
  IF ~~ THEN REPLY @460 GOTO 426
  IF ~Gender(Player1,MALE)~ THEN REPLY @461 GOTO 427
  IF ~Gender(Player1,FEMALE)~ THEN REPLY @462 GOTO 589
  IF ~~ THEN REPLY @463 GOTO 428
END

IF ~~ THEN BEGIN 430
  SAY @468
  IF ~~ THEN REPLY @460 GOTO 426
  IF ~Gender(Player1,MALE)~ THEN REPLY @461 GOTO 427
  IF ~Gender(Player1,FEMALE)~ THEN REPLY @462 GOTO 589
  IF ~~ THEN REPLY @463 GOTO 428
END

IF ~~ THEN BEGIN 589
  SAY @469
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",25)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

// LT 26

IF WEIGHT #-87 ~Global("VP_SimeLoveTalk","GLOBAL",26)~ THEN BEGIN 431
  SAY @470
  IF ~~ THEN REPLY @471 GOTO 432
  IF ~~ THEN REPLY @472 GOTO 433
  IF ~~ THEN REPLY @473 GOTO 436
  IF ~~ THEN REPLY @474 GOTO 440
END

IF ~~ THEN BEGIN 432
  SAY @475
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",27)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 433
  SAY @476
  IF ~~ THEN REPLY @477 GOTO 434
  IF ~~ THEN REPLY @478 GOTO 436
  IF ~~ THEN REPLY @479 GOTO 437
END

IF ~~ THEN BEGIN 434
  SAY @480
  IF ~~ THEN REPLY @481 GOTO 435
  IF ~~ THEN REPLY @482 GOTO 436
  IF ~~ THEN REPLY @479 GOTO 437
END

IF ~~ THEN BEGIN 435
  SAY @483
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",27)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 436
  SAY @484
  IF ~~ THEN REPLY @485 GOTO 437
  IF ~~ THEN REPLY @486 GOTO 438
  IF ~~ THEN REPLY @487 GOTO 439
END

IF ~~ THEN BEGIN 437
  SAY @488
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",27)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 438
  SAY @489
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",27)~ EXIT
END

IF ~~ THEN BEGIN 439
  SAY @490
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",27)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 440
  SAY @491
  IF ~~ THEN REPLY @492 GOTO 441
  IF ~~ THEN REPLY @493 GOTO 441
  IF ~~ THEN REPLY @494 GOTO 437
END

IF ~~ THEN BEGIN 441
  SAY @495
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",27)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

// LT 28

IF WEIGHT #-86 ~Global("VP_SimeLoveTalk","GLOBAL",28)~ THEN BEGIN 442
  SAY @496
  IF ~~ THEN REPLY @497 GOTO 443
  IF ~OR(2)
Class(Player1,MAGE_ALL)
Class(Player1,SORCERER)~ THEN REPLY @498 GOTO 448
  IF ~~ THEN REPLY @499 GOTO 449
  IF ~~ THEN REPLY @500 GOTO 450
  IF ~~ THEN REPLY @501 GOTO 451
  IF ~~ THEN REPLY @502 GOTO 452
END

IF ~~ THEN BEGIN 443
  SAY @503
  IF ~~ THEN GOTO 444
END

IF ~~ THEN BEGIN 444
  SAY @504
  IF ~~ THEN REPLY @505 GOTO 445
  IF ~~ THEN REPLY @506 GOTO 446
  IF ~~ THEN REPLY @507 GOTO 447
END

IF ~~ THEN BEGIN 445
  SAY @508
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",29)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 446
  SAY @509
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",29)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 447
  SAY @510
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",29)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 448
  SAY @511
  IF ~~ THEN GOTO 444
END

IF ~~ THEN BEGIN 449
  SAY @512
  IF ~~ THEN GOTO 444
END

IF ~~ THEN BEGIN 450
  SAY @513
  IF ~~ THEN GOTO 444
END

IF ~~ THEN BEGIN 451
  SAY @514
  IF ~~ THEN GOTO 444
END

IF ~~ THEN BEGIN 452
  SAY @515
  IF ~~ THEN GOTO 444
END

//LT 30

IF WEIGHT #-85 ~Global("VP_SimeLoveTalk","GLOBAL",30)~ THEN BEGIN 453
  SAY @516
  IF ~~ THEN REPLY @517 GOTO 454
  IF ~~ THEN REPLY @518 GOTO 462
  IF ~~ THEN REPLY @519 GOTO 472
END

IF ~~ THEN BEGIN 454
  SAY @520
  IF ~~ THEN REPLY @521 GOTO 455
  IF ~~ THEN REPLY @522 GOTO 460
  IF ~~ THEN REPLY @523 GOTO 461
END

IF ~~ THEN BEGIN 455
  SAY @524
  IF ~~ THEN REPLY @525 GOTO 456
  IF ~~ THEN REPLY @526 GOTO 458
  IF ~~ THEN REPLY @527 GOTO 459
END

IF ~~ THEN BEGIN 456
  SAY @528
  IF ~~ THEN GOTO 457
END

IF ~~ THEN BEGIN 457
  SAY @529
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 458
  SAY @530
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 459
  SAY @531
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 460
  SAY @532
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 461
  SAY @533
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 462
  SAY @534
  IF ~~ THEN REPLY @535 GOTO 463
  IF ~~ THEN REPLY @536 GOTO 466
END

IF ~~ THEN BEGIN 463
  SAY @537
  IF ~~ THEN REPLY @538 GOTO 455
  IF ~~ THEN REPLY @539 GOTO 464
  IF ~~ THEN REPLY @523 GOTO 465
END

IF ~~ THEN BEGIN 464
  SAY @532
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 465
  SAY @533
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 466
  SAY @540
  IF ~~ THEN REPLY @541 GOTO 467
  IF ~~ THEN REPLY @542 GOTO 471
  IF ~~ THEN REPLY @543 GOTO 471
END

IF ~~ THEN BEGIN 467
  SAY @544
  IF ~~ THEN REPLY @545 GOTO 468
  IF ~~ THEN REPLY @546 GOTO 469
  IF ~~ THEN REPLY @547 GOTO 470
END

IF ~~ THEN BEGIN 468
  SAY @548
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 469
  SAY @549
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 470
  SAY @550
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 471
  SAY @551
  IF ~~ THEN REPLY @545 GOTO 468
  IF ~~ THEN REPLY @546 GOTO 469
  IF ~~ THEN REPLY @547 GOTO 470
END

IF ~~ THEN BEGIN 472
  SAY @552
  IF ~~ THEN REPLY @547 GOTO 470
  IF ~~ THEN REPLY @553 GOTO 473
  IF ~~ THEN REPLY @554 GOTO 473
END

IF ~~ THEN BEGIN 473
  SAY @555
  IF ~~ THEN REPLY @556 GOTO 474
  IF ~~ THEN REPLY @557 GOTO 475
  IF ~~ THEN REPLY @558 GOTO 476
END

IF ~~ THEN BEGIN 474
  SAY @559
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 475
  SAY @560
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 476
  SAY @561
  IF ~~ THEN REPLY @562 GOTO 468
  IF ~~ THEN REPLY @546 GOTO 469
  IF ~~ THEN REPLY @547 GOTO 470
END


//LT 32

IF WEIGHT #-84  ~Global("VP_SimeLoveTalk","GLOBAL",32)~ THEN BEGIN 477
  SAY @563
  IF ~~ THEN REPLY @564 GOTO 478
  IF ~~ THEN REPLY @565 GOTO 479
  IF ~~ THEN REPLY @566 GOTO 481
  IF ~~ THEN REPLY @567 GOTO 486
  IF ~~ THEN REPLY @568 GOTO 491
  IF ~!InParty("Sharteel")~ THEN REPLY @569 GOTO 493
END

IF ~~ THEN BEGIN 478
  SAY @570
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 479
  SAY @571
  IF ~~ THEN REPLY @572 GOTO 480
  IF ~~ THEN REPLY @573 GOTO 478
  IF ~~ THEN REPLY @566 GOTO 481
  IF ~~ THEN REPLY @574 GOTO 486
  IF ~~ THEN REPLY @575 GOTO 491
  IF ~~ THEN REPLY @569 GOTO 493
END

IF ~~ THEN BEGIN 480
  SAY @576
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 481
  SAY @577
  IF ~~ THEN REPLY @578 GOTO 482
END

IF ~~ THEN BEGIN 482
  SAY @579
  IF ~~ THEN REPLY @580 GOTO 483
  IF ~~ THEN REPLY @581 GOTO 484
  IF ~~ THEN REPLY @573 GOTO 485
END

IF ~~ THEN BEGIN 483
  SAY @582
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 484
  SAY @583
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 485
  SAY @570
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 486
  SAY @577
  IF ~~ THEN REPLY @584 GOTO 487
END

IF ~~ THEN BEGIN 487
  SAY @585
  IF ~~ THEN REPLY @586 GOTO 488
  IF ~~ THEN REPLY @587 GOTO 489
  IF ~~ THEN REPLY @588 GOTO 490
END

IF ~~ THEN BEGIN 488
  SAY @589
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END
IF ~~ THEN BEGIN 489
  SAY @590
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 490
  SAY @591
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 491
  SAY @592
  IF ~~ THEN REPLY @593 GOTO 492
END

IF ~~ THEN BEGIN 492
  SAY @594
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 493
  SAY @577
  IF ~~ THEN REPLY @595 GOTO 494
END

IF ~~ THEN BEGIN 494
  SAY @596
  IF ~~ THEN REPLY @597 GOTO 495
  IF ~~ THEN REPLY @598 GOTO 496
END

IF ~~ THEN BEGIN 495
  SAY @599
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 496
  SAY @600
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

// LT 34

IF WEIGHT #-83 ~Global("VP_SimeLoveTalk","GLOBAL",34)~ THEN BEGIN 497
  SAY @601
  IF ~~ THEN GOTO 498
END

IF ~~ THEN BEGIN 498
  SAY @602
  IF ~~ THEN REPLY @603 GOTO 499
  IF ~~ THEN REPLY @604 GOTO 506
  IF ~~ THEN REPLY @605 GOTO 510
  IF ~~ THEN REPLY @606 GOTO 511
END

IF ~~ THEN BEGIN 499
  SAY @607
  IF ~~ THEN REPLY @608 GOTO 500
  IF ~Class(Player1,RANGER_ALL)~ THEN REPLY @609 GOTO 501
  IF ~~ THEN REPLY @610 GOTO 502
  IF ~~ THEN REPLY @611 GOTO 503
END

IF ~~ THEN BEGIN 500
  SAY @612
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 501
  SAY @613
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 502
  SAY @614
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 503
  SAY @615
  IF ~~ THEN REPLY @616 GOTO 504
  IF ~~ THEN REPLY @617 GOTO 505
END

IF ~~ THEN BEGIN 504
  SAY @618
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 505
  SAY @619
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 506
  SAY @620
  IF ~~ THEN REPLY @621 GOTO 507
  IF ~~ THEN REPLY @622 GOTO 508
  IF ~~ THEN REPLY @623 GOTO 509
END

IF ~~ THEN BEGIN 507
  SAY @624
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 508
  SAY @625
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 509
  SAY @626
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 510
  SAY @627
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 511
  SAY @628
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

// LT 36

IF WEIGHT #-82 ~Global("VP_SimeLoveTalk","GLOBAL",36)~ THEN BEGIN 512
  SAY @629
  IF ~~ THEN REPLY @630 GOTO 513
  IF ~~ THEN REPLY @631 GOTO 514
  IF ~~ THEN REPLY @632 GOTO 515
END

IF ~~ THEN BEGIN 513
  SAY @633
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",37)~ EXIT
END

IF ~~ THEN BEGIN 514
  SAY @634
  IF ~~ THEN REPLY @635 GOTO 513
  IF ~~ THEN REPLY @636 GOTO 515
  IF ~~ THEN REPLY @637 GOTO 515
END

IF ~~ THEN BEGIN 515
  SAY @638
  IF ~~ THEN DO ~SetGlobal("VP_Sime_DreamIsland","GLOBAL",1)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
SetGlobal("VP_SimeLoveTalk","GLOBAL",37)
ClearAllActions()
StartCutSceneMode()
StartCutScene("vpcuts01")~ EXIT
END

// LT 38

IF WEIGHT #-81 ~Global("VP_SimeLoveTalk","GLOBAL",38)~ THEN BEGIN 516
  SAY @639
  IF ~~ THEN REPLY @640 GOTO 517
  IF ~!Race(Player1,ELF)
!Race(Player1,HALF_ELF)~ THEN REPLY @641 GOTO 518
  IF ~~ THEN REPLY @642 GOTO 522
  IF ~~ THEN REPLY @643 GOTO 523
END

IF ~~ THEN BEGIN 517
  SAY @644
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",39)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 518
  SAY @645
  IF ~~ THEN REPLY @646 GOTO 519
  IF ~~ THEN REPLY @647 GOTO 520
  IF ~~ THEN REPLY @648 GOTO 521
END

IF ~~ THEN BEGIN 519
  SAY @649
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",39)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 520
  SAY @650
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",39)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 521
  SAY @651
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",39)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 522
  SAY @652
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",39)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 523
  SAY @653
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",39)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END


// LT 40

IF WEIGHT #-80 ~Global("VP_SimeLoveTalk","GLOBAL",40)~ THEN BEGIN 524
  SAY @654
  IF ~~ THEN REPLY @655 GOTO 525
  IF ~~ THEN REPLY @656 GOTO 525
  IF ~~ THEN REPLY @657 GOTO 544
END

IF ~~ THEN BEGIN 525
  SAY @658
  IF ~~ THEN REPLY @659 GOTO 526
  IF ~~ THEN REPLY @660 GOTO 532
  IF ~~ THEN REPLY @661 GOTO 533
END

IF ~~ THEN BEGIN 526
  SAY @662
  IF ~~ THEN REPLY @663 GOTO 527
  IF ~~ THEN REPLY @664 GOTO 531
  IF ~~ THEN REPLY @665 GOTO 527
END

IF ~~ THEN BEGIN 527
  SAY @666
  IF ~~ THEN REPLY @667 GOTO 528
  IF ~~ THEN REPLY @668 GOTO 529
  IF ~~ THEN REPLY @669 GOTO 530
END

IF ~~ THEN BEGIN 528
  SAY @670
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 529
  SAY @671
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 530
  SAY @672
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 531
  SAY @673
  IF ~~ THEN REPLY @667 GOTO 528
  IF ~~ THEN REPLY @668 GOTO 529
  IF ~~ THEN REPLY @669 GOTO 530
END

IF ~~ THEN BEGIN 532
  SAY @673
  IF ~~ THEN REPLY @674 GOTO 528
  IF ~~ THEN REPLY @668 GOTO 529
  IF ~~ THEN REPLY @675 GOTO 530
END

IF ~~ THEN BEGIN 533
  SAY @676
  IF ~~ THEN REPLY @677 GOTO 534
  IF ~~ THEN REPLY @678 GOTO 535
  IF ~~ THEN REPLY @679 GOTO 535
  IF ~~ THEN REPLY @680 GOTO 539
END

IF ~~ THEN BEGIN 534
  SAY @681
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 535
  SAY @682
  IF ~~ THEN REPLY @667 GOTO 536
  IF ~~ THEN REPLY @668 GOTO 537
  IF ~~ THEN REPLY @675 GOTO 538
END

IF ~~ THEN BEGIN 536
  SAY @683
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 537
  SAY @684
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 538
  SAY @672
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 539
  SAY @685
  IF ~~ THEN REPLY @686 GOTO 540
  IF ~~ THEN REPLY @687 GOTO 541
  IF ~~ THEN REPLY @688 GOTO 542
  IF ~~ THEN REPLY @689 GOTO 543
END

IF ~~ THEN BEGIN 540
  SAY @690
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 541
  SAY @691
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 542
  SAY @692
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 543
  SAY @693
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",41)~ EXIT
END

IF ~~ THEN BEGIN 544
  SAY @694
  IF ~~ THEN REPLY @659 GOTO 526
  IF ~~ THEN REPLY @660 GOTO 532
  IF ~~ THEN REPLY @695 GOTO 533
END


//LT 42

IF WEIGHT #-79 ~Global("VP_SimeLoveTalk","GLOBAL",42)~ THEN BEGIN 545
  SAY @696
  IF ~~ THEN REPLY @697 GOTO 546
  IF ~~ THEN REPLY @698 GOTO 552
  IF ~~ THEN REPLY @699 GOTO 550
END

IF ~~ THEN BEGIN 546
  SAY @700
  IF ~~ THEN REPLY @701 GOTO 547
  IF ~~ THEN REPLY @699 GOTO 550
  IF ~~ THEN REPLY @702 GOTO 551
END

IF ~~ THEN BEGIN 547
  SAY @703
  IF ~~ THEN REPLY @704 GOTO 548
  IF ~~ THEN REPLY @705 GOTO 549
  IF ~~ THEN REPLY @699 GOTO 550
END

IF ~~ THEN BEGIN 548
  SAY @706
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",43)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 549
  SAY @707
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",43)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 550
  SAY @708
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",43)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 551
  SAY @709
  IF ~~ THEN REPLY @710 GOTO 548
  IF ~~ THEN REPLY @705 GOTO 549
  IF ~~ THEN REPLY @699 GOTO 550
END

IF ~~ THEN BEGIN 552
  SAY @711
  IF ~~ THEN REPLY @704 GOTO 548
  IF ~~ THEN REPLY @705 GOTO 549
  IF ~~ THEN REPLY @699 GOTO 550
END

//LT 44

IF WEIGHT #-78 ~Global("VP_SimeLoveTalk","GLOBAL",44)~ THEN BEGIN 553
  SAY @712
  IF ~~ THEN REPLY @713 GOTO 554
  IF ~Gender(Player1,MALE)~ THEN REPLY @714 GOTO 560
  IF ~~ THEN REPLY @715 GOTO 561
END

IF ~~ THEN BEGIN 554
  SAY @716
  IF ~~ THEN REPLY @717 GOTO 555
  IF ~~ THEN REPLY @718 GOTO 556
  IF ~~ THEN REPLY @719 GOTO 557
END

IF ~~ THEN BEGIN 555
  SAY @720
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",1)
SetGlobal("VP_SimeLoveTalk","GLOBAL",45)
ClearAllActions()
StartCutSceneMode()
StartCutScene("vpcuts03")~ EXIT
END

IF ~~ THEN BEGIN 556
  SAY @721
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",1)
SetGlobal("VP_SimeLoveTalk","GLOBAL",45)
ClearAllActions()
StartCutSceneMode()
StartCutScene("vpcuts03")~ EXIT
END

IF ~~ THEN BEGIN 557
  SAY @722
  IF ~~ THEN REPLY @723 GOTO 558
  IF ~~ THEN REPLY @724 GOTO 559
END

IF ~~ THEN BEGIN 558
  SAY @725
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",45)~ EXIT
END

IF ~~ THEN BEGIN 559
  SAY @726
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",1)
SetGlobal("VP_SimeLoveTalk","GLOBAL",45)
ClearAllActions()
StartCutSceneMode()
StartCutScene("vpcuts03")~ EXIT
END

IF ~~ THEN BEGIN 560
  SAY @727
  IF ~~ THEN REPLY @717 GOTO 555
  IF ~~ THEN REPLY @718 GOTO 556
  IF ~~ THEN REPLY @719 GOTO 557
END

IF ~~ THEN BEGIN 561
  SAY @728
  IF ~~ THEN REPLY @717 GOTO 555
  IF ~~ THEN REPLY @718 GOTO 556
  IF ~~ THEN REPLY @719 GOTO 557
END
END

//// Conflicts

// Aerie Romance

CHAIN IF WEIGHT #-75 ~Global("VP_Sime_vs_Aerie","GLOBAL",1)~ THEN VPSIMEJ SimeAerieRomCon0
@729 DO ~SetGlobal("VP_Sime_vs_Aerie","GLOBAL",2)~
== AERIEJ @730
== VPSIMEJ @731
== AERIEJ @732
== VPSIMEJ @733
== AERIEJ @734
== VPSIMEJ @735
END
IF ~~ THEN REPLY @736 GOTO SimeAerieRomCon1
IF ~~ THEN REPLY @737 GOTO SimeAerieRomCon1

APPEND VPSIMEJ

IF ~~ THEN BEGIN SimeAerieRomCon1
  SAY @738
  IF ~~ THEN REPLY @739 GOTO SimeAerieRomCon2
  IF ~~ THEN REPLY @740 GOTO SimeAerieRomCon3
  IF ~~ THEN REPLY @741 GOTO SimeAerieRomCon2
END

IF ~~ THEN BEGIN SimeAerieRomCon2
  SAY @742
  IF ~~ THEN REPLY @743 GOTO SimeAerieRomCon4
  IF ~~ THEN REPLY @744 GOTO SimeAerieRomCon5
END

IF ~~ THEN BEGIN SimeAerieRomCon3
  SAY @745
  IF ~~ THEN REPLY @743 GOTO SimeAerieRomCon4
  IF ~~ THEN REPLY @744 GOTO SimeAerieRomCon5
END

IF ~~ THEN BEGIN SimeAerieRomCon4
  SAY @746
  IF ~~ THEN DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN SimeAerieRomCon5
  SAY @747
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_Sime_vs_Aerie","GLOBAL",3)~ EXIT
END
END

//Jaheira Romance

CHAIN IF WEIGHT #-49 ~Global("VP_Sime_vs_Jaheira","GLOBAL",1)~ THEN VPSIMEJ SimeJaheiraRomcon0
@748 DO ~SetGlobal("VP_Sime_vs_Jaheira","GLOBAL",2)~
== JAHEIRAJ @749
== VPSIMEJ @750
== JAHEIRAJ @751
== VPSIMEJ @752
END
IF ~~ THEN REPLY @753 EXTERN ~JAHEIRAJ~ SimeJaheiraRomcon1
IF ~~ THEN REPLY @754 EXTERN ~JAHEIRAJ~ SimeJaheiraRomcon2
IF ~~ THEN REPLY @755 EXTERN ~JAHEIRAJ~ SimeJaheiraRomcon3

CHAIN JAHEIRAJ SimeJaheiraRomcon1
@756
== VPSIMEJ @757 DO ~SetGlobal("JaheiraRomanceActive","GLOBAL",3)~
EXIT

CHAIN JAHEIRAJ SimeJaheiraRomcon2
@758
== VPSIMEJ @759
= @760 DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~
EXIT

CHAIN JAHEIRAJ SimeJaheiraRomcon3
@761
== VPSIMEJ @762
DO ~SetGlobal("JaheiraRomanceActive","GLOBAL",3)
ActionOverride("Jaheira",LeaveParty())
ActionOverride("Jaheira",EscapeArea())~
EXIT

//Viconia Romance

CHAIN IF WEIGHT #-56 ~Global("VP_Sime_vs_Viconia","GLOBAL",1)~ THEN VPSIMEJ SimeViconiaRomcon0
@763 DO ~SetGlobal("VP_Sime_vs_Viconia","GLOBAL",2)~
== VICONIJ @764
END
IF ~~ THEN REPLY @765 EXTERN VPSIMEJ SimeViconiaRomcon1
IF ~~ THEN REPLY @766 EXTERN VPSIMEJ SimeViconiaRomcon1
IF ~~ THEN REPLY @767 EXTERN VPSIMEJ SimeViconiaRomcon1

CHAIN VPSIMEJ SimeViconiaRomcon1
@768
== VICONIJ @769
END
IF ~~ THEN REPLY @770 EXTERN VICONIJ SimeViconiaRomcon2
IF ~~ THEN REPLY @771 EXTERN VICONIJ SimeViconiaRomcon3

CHAIN VICONIJ SimeViconiaRomcon2
@772
END
++ @773 EXTERN VPSIMEJ SimeViconiaRomcon4
++ @774 EXTERN VPSIMEJ SimeViconiaRomcon5

CHAIN VICONIJ SimeViconiaRomcon3
@775
DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
LeaveParty()
EscapeArea()~ EXIT

CHAIN VPSIMEJ SimeViconiaRomcon4
@776
DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT

CHAIN VPSIMEJ SimeViconiaRomcon5
@777
DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)~ EXIT

////FLIRTS

//Early

APPEND VPSIMEJ

IF ~IsGabber(Player1) GlobalGT("LoveTalk","GLOBAL",2) GlobalLT("LoveTalk","GLOBAL",23) OR(2) Global("VP_SimeRomanceActive","GLOBAL",1) Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN BEGIN VPPID1
SAY @778
IF ~~ THEN REPLY @779 GOTO flirt_14
IF ~~ THEN REPLY @780 GOTO flirt_15
IF ~~ THEN REPLY @781 GOTO flirt_16
IF ~~ THEN REPLY @782 GOTO flirt_17
IF ~~ THEN REPLY @783 GOTO flirt_18
IF ~~ THEN REPLY @784 GOTO flirt_19
IF ~~ THEN REPLY @785 GOTO flirt_20
IF ~AreaType(OUTDOOR) CheckStatLT(Player1,16,STR)~ THEN REPLY @786 GOTO flirt_21a
IF ~AreaType(OUTDOOR) CheckStatGT(Player1,15,STR)~ THEN REPLY @786 GOTO flirt_21b
END

IF ~~ THEN BEGIN flirt_14
SAY @787
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_15
SAY @788
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_16
SAY @789
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_17
SAY @790
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_18
SAY @791
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_19
SAY @792
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_20
SAY @793
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_21a
SAY @794
= @795
= @796
= @797
= @798
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_21b
SAY @799
= @800
= @801
= @802
IF ~~ THEN EXIT
END

//Late

IF ~IsGabber(Player1) GlobalGT("LoveTalk","GLOBAL",22) OR(2) Global("VP_SimeRomanceActive","GLOBAL",1) Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN BEGIN flirts_B
SAY @803
+ ~RandomNum(3,1)~ + @804 + flirt_1a
+ ~RandomNum(3,2)~ + @804 + flirt_1b
+ ~RandomNum(3,3)~ + @804 + flirt_1c
+ ~RandomNum(3,1)~ + @805 + flirt_2a
+ ~RandomNum(3,2)~ + @805 + flirt_2b
+ ~RandomNum(3,3)~ + @805 + flirt_2c
+ ~RandomNum(3,1)~ + @806 + flirt_3a
+ ~RandomNum(3,2)~ + @806 + flirt_3b
+ ~RandomNum(3,3)~ + @806 + flirt_3c
+ ~RandomNum(3,1)~ + @807 + flirt_4a
+ ~RandomNum(3,2)~ + @807 + flirt_4b
+ ~RandomNum(3,3)~ + @807 + flirt_4c
+ ~RandomNum(3,1)~ + @808 + flirt_5a
+ ~RandomNum(3,2)~ + @808 + flirt_5b
+ ~RandomNum(3,3)~ + @808 + flirt_5c
+ ~RandomNum(3,1)~ + @809 + flirt_6a
+ ~RandomNum(3,2)~ + @809 + flirt_6b
+ ~RandomNum(3,3)~ + @809 + flirt_6c
+ ~RandomNum(3,1)~ + @810 + flirt_7a
+ ~RandomNum(3,2)~ + @810 + flirt_7b
+ ~RandomNum(3,3)~ + @810 + flirt_7c
+ ~RandomNum(3,1)~ + @811 + flirt_8a
+ ~RandomNum(3,2)~ + @811 + flirt_8b
+ ~RandomNum(3,3)~ + @811 + flirt_8c
+ ~RandomNum(3,1)~ + @812 + flirt_9a
+ ~RandomNum(3,2)~ + @812 + flirt_9b
+ ~RandomNum(3,3)~ + @812 + flirt_9c
+ ~RandomNum(3,1)~ + @813 + flirt_10
+ ~RandomNum(3,1) AreaType(OUTDOOR)~ + @814 + flirt_11a
+ ~RandomNum(3,2) AreaType(OUTDOOR)~ + @815 + flirt_11b
+ ~RandomNum(3,3) AreaType(OUTDOOR) CheckStatLT(Player1,13,INT)~ + @816 + flirt_11c
+ ~RandomNum(3,1) AreaType(DUNGEON)~ + @817 + flirt_12a
+ ~RandomNum(3,2) AreaType(DUNGEON)~ + @817 + flirt_12b
+ ~RandomNum(3,1) AreaType(DUNGEON)~ + @818 + flirt_13a
+ ~RandomNum(3,2) AreaType(DUNGEON)~ + @818 + flirt_13b
+ ~RandomNum(3,3) AreaType(DUNGEON)~ + @818 + flirt_13c
END

IF ~~ THEN BEGIN flirt_1a
SAY @819
= @820
= @821
= @822
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_1b
SAY @823
= @824
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_1c
SAY @825
= @826
= @827
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_2a
SAY @828
= @829
= @830
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_2b
 SAY @831
= @832
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_2c
SAY @833
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_3a
SAY @834
= @835
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_3b
SAY @836
= @837
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_3c
SAY @838
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_4a
SAY @839
= @840
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_4b
SAY @841
= @842
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_4c
SAY @843
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_5a
SAY @844
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_5b
SAY @845
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_5c
SAY @846
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_6a
SAY @847
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_6b
SAY @848
= @849
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_6c
SAY @850
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_7a
SAY @851
= @852
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_7b
SAY @853
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_7c
SAY @854
= @855
= @856
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_8a
SAY @857
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_8b
SAY @858
= @859
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_8c
SAY @860
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_9a
SAY @861
= @862
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_9b
SAY @863
= @864
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_9c
SAY @865
= @866
= @867
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_10
SAY @868
= @869
= @870
= @871
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_11a
SAY @872
= @873
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_11b
SAY @874
= @875
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_11c
SAY @876
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_12a
SAY @877
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_12b
SAY @878
= @879
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_13a
SAY @880
= @881
= @882
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_13b
SAY @883
= @884
= @885
= @886
= @887
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_13c
SAY @888
= @889
IF ~~ THEN EXIT
END

/////////////////////////////////////////////////////

IF WEIGHT #-95 ~Global("AsylumPlot","GLOBAL",2)
Global("simespeak","GLOBAL",0)~ THEN BEGIN VPSimeAsylumPlot2
  SAY @890
  IF ~~ THEN REPLY @891 DO ~SetGlobal("simespeak","GLOBAL",1)
SetGlobal("SaemNoBodhi","GLOBAL",1)~ GOTO VPSimeAsPlot2a
  IF ~~ THEN REPLY @892 DO ~SetGlobal("simespeak","GLOBAL",1)
SetGlobal("SaemNoBodhi","GLOBAL",1)~ GOTO VPSimeAsPlot2b
  IF ~~ THEN REPLY @893 DO ~SetGlobal("simespeak","GLOBAL",1)
SetGlobal("SaemNoBodhi","GLOBAL",1)~ GOTO VPSimeAsPlot2a
END

IF ~~ THEN BEGIN VPSimeAsPlot2a
  SAY @894
  IF ~~ THEN DO ~MoveToPoint([863.2422])~ EXIT
END

IF ~~ THEN BEGIN VPSimeAsPlot2b
  SAY @895
  IF ~~ THEN DO ~MoveToPoint([863.2422])
SaveGame(0)~ EXIT
END
END

CHAIN IF WEIGHT #-94 ~Global("AsylumPlot","GLOBAL",5)~ THEN VPSIMEJ VPSimeAsylumPlot5.0
@896
== ANOMENJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN #55696
== VICONIJ IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN #55695
== JAHEIRAJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN #55693
== VPSIMEJ @897
END
  IF ~~ THEN REPLY @898 DO ~SetGlobal("AsylumPlot","GLOBAL",6)~ GOTO VPSimeAsylumPlot5.2
  IF ~~ THEN REPLY @899 DO ~SetGlobal("AsylumPlot","GLOBAL",6)~ GOTO VPSimeAsylumPlot5.2
  IF ~~ THEN REPLY @900 DO ~SetGlobal("AsylumPlot","GLOBAL",6)~ GOTO VPSimeAsylumPlot5.2

CHAIN VPSIMEJ VPSimeAsylumPlot5.2
@901
=@902
=@903 
END
IF ~~ THEN UNSOLVED_JOURNAL @904 EXIT

/////////////////////////////////
///////// LT32 - MALE
/////////////////////////////////

APPEND VPSIMEJ

IF WEIGHT #-93 ~Global("VP_Aran_Ring","GLOBAL",2)~ THEN BEGIN 45
  SAY @905
  IF ~~ THEN REPLY @906 GOTO 46
  IF ~~ THEN REPLY @907 GOTO 48
  IF ~~ THEN REPLY @908 GOTO 48
END

IF ~~ THEN BEGIN 46
  SAY @909
  IF ~~ THEN REPLY @910 GOTO 47
  IF ~~ THEN REPLY @911 GOTO 47
  IF ~~ THEN REPLY @912 GOTO 47
  IF ~~ THEN REPLY @913 GOTO 47
END

IF ~~ THEN BEGIN 47
  SAY @914
  IF ~~ THEN DO ~TakePartyItem("VPArRing")
SetGlobal("VP_Aran_Ring","GLOBAL",3)
SetGlobal("VP_Sime_PCThief","GLOBAL",1)
RealSetGlobalTimer("VP_SimeThiefBanter","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 48
  SAY @915
  IF ~~ THEN DO ~TakePartyItem("VPArRing")
SetGlobal("VP_Aran_Ring","GLOBAL",3)
SetGlobal("VP_Sime_PCThief","GLOBAL",1)
RealSetGlobalTimer("VP_SimeThiefBanter","GLOBAL",1800)~ EXIT
END

IF WEIGHT #-92 ~Global("VP_Sime_PCThief","GLOBAL",2)~ THEN BEGIN 49
  SAY @916
  IF ~~ THEN REPLY @917 GOTO 50
  IF ~GlobalGT("PlayerThiefGuild","GLOBAL",0)~ THEN REPLY @918 GOTO 54
  IF ~~ THEN REPLY @919 GOTO 55
END

IF ~~ THEN BEGIN 50
  SAY @920
  IF ~~ THEN REPLY @921 GOTO 51
  IF ~~ THEN REPLY @922 GOTO 51
  IF ~~ THEN REPLY @923 GOTO 51
  IF ~GlobalGT("PlayerThiefGuild","GLOBAL",0)~ THEN REPLY @924 GOTO 52
  IF ~~ THEN REPLY @925 GOTO 53
END

IF ~~ THEN BEGIN 51
  SAY @926
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_Sime_PCThief","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN 52
  SAY @927
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_Sime_PCThief","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN 53
  SAY @928
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_Sime_PCThief","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN 54
  SAY @929
  IF ~~ THEN REPLY @921 GOTO 51
  IF ~~ THEN REPLY @922 GOTO 51
  IF ~~ THEN REPLY @923 GOTO 51
  IF ~~ THEN REPLY @924 GOTO 52
  IF ~~ THEN REPLY @925 GOTO 53
END

IF ~~ THEN BEGIN 55
  SAY @930
  IF ~~ THEN REPLY @921 GOTO 51
  IF ~~ THEN REPLY @922 GOTO 51
  IF ~~ THEN REPLY @923 GOTO 51
  IF ~~ THEN REPLY @924 GOTO 52
  IF ~~ THEN REPLY @925 GOTO 53
END

////////////////////////////////////////////////
//If PC is not thief, Sime starts to talk again
////////////////////////////////////////////////

IF WEIGHT #-91 ~Global("VP_SimeTalksAgain","GLOBAL",1)~ THEN BEGIN 94
  SAY @931
  IF ~~ THEN REPLY @932 GOTO 95
  IF ~~ THEN REPLY @933 GOTO 95
  IF ~~ THEN REPLY @934 GOTO 95
  IF ~~ THEN REPLY @935 GOTO 100
  IF ~~ THEN REPLY @936 GOTO 103
END

IF ~~ THEN BEGIN 95
  SAY @937
  IF ~~ THEN REPLY @938 GOTO 96
  IF ~~ THEN REPLY @939 GOTO 96
  IF ~~ THEN REPLY @940 GOTO 96
END

IF ~~ THEN BEGIN 96
  SAY @941
  IF ~~ THEN REPLY @942 GOTO 97
  IF ~~ THEN REPLY @943 GOTO 98
  IF ~~ THEN REPLY @944 GOTO 97
  IF ~~ THEN REPLY @945 GOTO 99
END

IF ~~ THEN BEGIN 97
  SAY @946
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

SetGlobal("VP_SimeTalksAgain","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN 98
  SAY @947
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

SetGlobal("VP_SimeTalksAgain","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN 99
  SAY @948
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

SetGlobal("VP_SimeTalksAgain","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN 100
  SAY @949
  IF ~~ THEN REPLY @950 GOTO 101
  IF ~~ THEN REPLY @951 GOTO 102
  IF ~~ THEN REPLY @952 GOTO 103
END

IF ~~ THEN BEGIN 101
  SAY @946
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

SetGlobal("VP_SimeTalksAgain","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN 102
  SAY @953
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

SetGlobal("VP_SimeTalksAgain","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN 103
  SAY @954
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

SetGlobal("VP_SimeTalksAgain","GLOBAL",2)~ EXIT
END

////////////////////////////////////////////////

//Elf dream 1

IF WEIGHT #-90 ~Global("VP_Sime_DreamIsland","GLOBAL",1)~ THEN BEGIN VPSimeDream0
  SAY @955
  IF ~OR(2) Race(Player1,ELF) Race(Player1,HALF_ELF)~ THEN REPLY @956 GOTO VPSimeDream1Elf
  IF ~!Race(Player1,ELF) !Race(Player1,HALF_ELF)~ THEN REPLY @956 GOTO VPSimeDream1NoElf
END

IF ~~ THEN BEGIN VPSimeDream1Elf
  SAY @957
  IF ~~ THEN REPLY @958 GOTO VPSimeDream2Elf
  IF ~~ THEN REPLY @959 GOTO VPSimeDream2Elf
  IF ~~ THEN REPLY @960 GOTO VPSimeDream3Elf
END

IF ~~ THEN BEGIN VPSimeDream2Elf
  SAY @961
  IF ~~ THEN REPLY @962 GOTO VPSimeDream4aElf
  IF ~~ THEN REPLY @963 GOTO  VPSimeDream4bElf
  IF ~~ THEN REPLY @964 GOTO  VPSimeDream4cElf
END

IF ~~ THEN BEGIN VPSimeDream4aElf
  SAY @965
  IF ~~ THEN DO ~SetGlobal("VP_Sime_DreamIsland","GLOBAL",2)
StartCutSceneMode()
StartCutScene("vpcuts02")
RestParty()~ EXIT
END

IF ~~ THEN BEGIN VPSimeDream4bElf
  SAY @966
  IF ~~ THEN DO ~SetGlobal("VP_Sime_DreamIsland","GLOBAL",2)
StartCutSceneMode()
StartCutScene("vpcuts02")
RestParty()~ EXIT
END

IF ~~ THEN BEGIN VPSimeDream4cElf
  SAY @967
  IF ~~ THEN DO ~SetGlobal("VP_Sime_DreamIsland","GLOBAL",2)
StartCutSceneMode()
StartCutScene("vpcuts02")
RestParty()~ EXIT
END

IF ~~ THEN BEGIN VPSimeDream3Elf
  SAY @968
  IF ~~ THEN REPLY @962 GOTO VPSimeDream4aElf
  IF ~~ THEN REPLY @963 GOTO VPSimeDream4bElf
  IF ~~ THEN REPLY @964 GOTO VPSimeDream4cElf
END

IF ~~ THEN BEGIN VPSimeDream1NoElf
  SAY @969
  IF ~~ THEN REPLY @970 GOTO VPSimeDream2NoElf
  IF ~~ THEN REPLY @971 GOTO VPSimeDream2NoElf
  IF ~~ THEN REPLY @960 GOTO VPSimeDream3NoElf
END

IF ~~ THEN BEGIN VPSimeDream2NoElf
  SAY @972
  IF ~~ THEN REPLY @973 GOTO VPSimeDream4a
  IF ~~ THEN REPLY @974 GOTO VPSimeDream4a
  IF ~~ THEN REPLY @975 GOTO VPSimeDream4b
END

IF ~~ THEN BEGIN VPSimeDream4a
  SAY @976
  IF ~~ THEN DO ~SetGlobal("VP_Sime_DreamIsland","GLOBAL",2)
StartCutSceneMode()
StartCutScene("vpcuts02")
RestParty()~ EXIT
END

IF ~~ THEN BEGIN VPSimeDream4b
  SAY @977
  IF ~~ THEN DO ~SetGlobal("VP_Sime_DreamIsland","GLOBAL",2)
StartCutSceneMode()
StartCutScene("vpcuts02")
RestParty()~ EXIT
END

IF ~~ THEN BEGIN VPSimeDream3NoElf
  SAY @978
  IF ~~ THEN REPLY @973 GOTO VPSimeDream4a
  IF ~~ THEN REPLY @974 GOTO VPSimeDream4a
  IF ~~ THEN REPLY @975 GOTO VPSimeDream4b
END

//Elf dream 2

IF WEIGHT #-88 ~Global("VP_Sime_Dragon","GLOBAL",4)~ THEN BEGIN VPSimeDreamDr0
  SAY @979
  IF ~~ THEN REPLY @980 GOTO VPSimeDreamDr1
  IF ~~ THEN REPLY @981 GOTO VPSimeDreamDr2
  IF ~~ THEN REPLY @982 GOTO VPSimeDreamDr6
END

IF ~~ THEN BEGIN VPSimeDreamDr1
  SAY @983
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",5)~ EXIT
END

IF ~~ THEN BEGIN VPSimeDreamDr2
  SAY @984
  IF ~~ THEN REPLY @985 GOTO VPSimeDreamDr3
  IF ~~ THEN REPLY @986 GOTO VPSimeDreamDr4
  IF ~~ THEN REPLY @987 GOTO VPSimeDreamDr5
END

IF ~~ THEN BEGIN VPSimeDreamDr3
  SAY @988
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",5)~ EXIT
END

IF ~~ THEN BEGIN VPSimeDreamDr4
  SAY @989
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",5)~ EXIT
END

IF ~~ THEN BEGIN VPSimeDreamDr5
  SAY @990
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",5)~ EXIT
END

IF ~~ THEN BEGIN VPSimeDreamDr6
  SAY @991
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",5)~ EXIT
END
END

///////////////////////////////////////////////////////////////
//End of Romance///////////////////////////////////////////////

//Interjections

I_C_T RENAL 64 VPSimeRenalComm
== ~VPSIMEJ~ IF ~InParty("vpsime") InMyArea("vpsime") !StateCheck("vpsime",CD_STATE_NOTVALID)~ @992
END

APPEND VPSIMEJ

IF WEIGHT #-87 ~GlobalLT("AsylumPlot","GLOBAL",5)
Global("simespeak","GLOBAL",1)~ THEN BEGIN 115
  SAY @993
  IF ~~ THEN EXIT
END
END
