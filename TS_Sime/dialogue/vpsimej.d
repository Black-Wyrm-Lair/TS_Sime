BEGIN VPSIMEJ

//// Vampire Plot

// Abduction
ADD_TRANS_TRIGGER BODHIAMB 5 ~OR(2)
!InParty("vpsime")
!Global("VP_SimeRomanceActive","GLOBAL",2)~ DO 0

INTERJECT BODHIAMB 5 VPSimeBodhiAbduction1
== BODHIAMB IF ~Global("VP_SimeRomanceActive","GLOBAL",2)
InParty("vpsime")~ THEN ~You follow in the hopes of retrieving something dear to you. I say that the longer you keep this up, the more you will lose.~
END
IF ~OR(2)
!InPartyAllowDead("vpsime")
Dead("vpsime")~ THEN EXTERN BODHIAMB 6
IF ~InPartyAllowDead("vpsime")
!Dead("vpsime")~ THEN EXTERN BODHIAMB VPSimeBodhiAbduction2

CHAIN BODHIAMB VPSimeBodhiAbduction2
~Consider the thief’s daughter by your side. It is so disappointing to lose something, which you were only starting to dream of...~
== VPSIMEJ ~Stay away from <PRO_HIMHER>, vampire! You and your murderous bastard of a brother had taken too many lives as is. I will not allow you to harm <CHARNAME>...~
== BODHIAMB ~You misunderstand me completely, Sime. I am going to leave him his pathetic life. But yours I shall have, Linvails’ daughter. Follow me further <CHARNAME>, and you will lose more than you can imagine. Starting now!~
END
IF ~~ THEN DO ~ClearAllActions() StartCutSceneMode() StartCutScene("vpcutamb")~
UNSOLVED_JOURNAL ~The Final Battle with Bodhi.

Bodhi appeared in an ambush shortly before I reached her haven, warning me that she was aware of my pursuit and stealing from me my love, my dear Sime. Before she vanished and unleashed more of her undead creations upon me, Bodhi warned me that if I continue I will lose even more than I thought possible. I cannot give up on the Rhynn Lanthorn... but now the life and immortal soul of the one I love is at stake, as well!  I should get going, no matter how hurt I am; I should get going...~ EXIT

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
	+ ~Global("RevealUmar","GLOBAL",1) PartyHasItem("vpsbody")~ + ~A friend is afflicted by vampirism.  An old book suggested that followers of Oghma might know something about that.~ GOTO 10
END

EXTEND_BOTTOM DOGHMA 3 7 9 #4
	+ ~Global("RevealUmar","GLOBAL",1) PartyHasItem("vpsbody")~ + ~A friend is afflicted by vampirism.  An old book suggested that followers of Oghma might know something about that.~ GOTO 10
END

EXTEND_BOTTOM SUDEMIN 2
+ ~PartyHasItem("vpsbody")~ + ~I lost a loved on in a battle with his sister, Bodhi.  I seek a means of curing her.~ GOTO 3
END

/*APPEND OGHMONK1
IF WEIGHT #-1
~Global("RevealUmar","GLOBAL",1)
PartyHasItem("vpsbody")~ THEN BEGIN VPSimeOghmaMonk
 SAY ~Have you come seeking wisdom from the Binder of What is Known? The Wise God stands ready.~
	++ ~No, thank you, I have no need of help at the moment.~ EXTERN OGHMONK1 5
	++ ~A friend is afflicted by vampirism.  An old book suggested that followers of Oghma might know something about that.~ EXTERN OGHMONK1 6
END
END*/

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
	+ ~PartyHasItem("vpsbody")~ + ~Elhan! I've the half vampire body of Sime here because of you! You'll tell me now!~ + 76
END

EXTEND_BOTTOM WARSAGE 0
	+ ~!Dead("c6bodhi") Global("VP_SimeVampire","GLOBAL",2)~ + ~A loved one was taken by a vampire. What can I expect when I find them?~ + 6
END

EXTEND_BOTTOM WARSAGE 0
	+ ~PartyHasItem("vpsbody")~ + ~Someone I care about has fallen to a vampire. Is there any way to save them?~ + 5
END

// Final Battle

// Bodhi section 2

EXTEND_BOTTOM C6BODHI 21
IF ~Global("VP_SimeVampire","GLOBAL",2)~ + 23
END

EXTEND_BOTTOM C6BODHI 23
IF ~Global("VP_SimeVampire","GLOBAL",2)~ THEN REPLY ~You place too much confidence in sentiment.  The theft of Sime will not save you.~ EXTERN C6BODHI VPSimeBodhiBattle
IF ~Global("VP_SimeVampire","GLOBAL",2)~ THEN REPLY ~You have taken too much already!  You will return both Imoen's soul and Sime!~ EXTERN C6BODHI VPSimeBodhiBattle
IF ~Global("VP_SimeVampire","GLOBAL",2)~ THEN REPLY ~And you have delivered on that promise. Return Sime and perhaps I will be merciful.~ EXTERN C6BODHI VPSimeBodhiBattle
IF ~Global("VP_SimeVampire","GLOBAL",2)~ THEN REPLY ~I would have hunted you for your theft of Sime alone. She is very important to me.~ EXTERN C6BODHI VPSimeBodhiBattle
END

BEGIN VPSIMEVA

CHAIN C6BODHI VPSimeBodhiBattle
~She is lost to you, <CHARNAME>. Sime has been quite receptive to my wiles. I doubt your fumbling could have inspired the loyalty I have taken with a bite and a gaze.~
== VPSIMEVA ~As you desire Mistress. (*Sime tries to walk towards you, hissing some threat, but stops short in her steps.*)~
= ~I cannot hurt <CHARNAME> Mistress. I cannot... I will take anybody's life but not his. Please, Mistress, forgive me my disobedience... punish me if you will, destroy me, but I will not harm him. I love him.~
== C6BODHI ~Love... I should have sealed my doors tighter against that perpetrator. I have no times for follies, stupid bitch. Punishment you want - then you should get it.~
END
IF ~~ EXTERN C6BODHI 22

//// Sols Meet

//Meet

BEGIN VPSOL
BEGIN VPSOLA
BEGIN VPSOLAUF

CHAIN IF ~Global("VP_SimeSolas","GLOBAL",1)~ THEN VPSOL VPSol0
~Oh, beautiful daughter of Aran Linvail! Never you spared a tender word for me in life. I praise my order to deliver you to the Mistress. I was promised that in undeath you shall be mine, Sime Linvail.~ DO ~SetGlobal("VP_Sol_Speak_Sime","GLOBAL",1)~
== VPSOLA ~Love him, Sime... His bite is deadly and sweet as almonds. Nothing is more tender than death...~
== VPSOLAUF ~Bodhi gives power, true power to those who serve her. Your father is doomed. Come with us, Sime. Join us in undeath... And bring the Bhaalchild along. 

We will have beds of fleeting odors,
Couches deep as memorials,
And strange flowers on the stairs
To blossom for us under skies more beautiful.~
== VPSOLA ~Following each other 'til the last warmth came,
From our two hearts, two vast torches will pour
The reflection of their double flames
On our two spirits, these twin mirrors.~
== VPSOL ~One evening made of pink and mystical blue,
We will exchange a single flash from afar,
Like a long sob, charged with adieux; 

This evening is tonight, my dear Sime... Accept the death from me and we shall live forever, powerful and passionate.~
== VPSIMEJ ~I did not forget the last lines as you did. They are: 

And later a Solar, the gates ajar,
Will joyously restore to life the ores,
The dead flames and the tarnished mirrors 

No restoration will you find and never will your spirit know rest after you have been destroyed. You say you are powerful? That we shall see! For the glory of life and light I shall strike you down!~ [SIMESO02]
DO ~SetGlobal("VP_SimeSolas","GLOBAL",2)
ActionOverride("vpsol",Enemy())
ActionOverride("vpsola",Enemy())
ActionOverride("vpsolauf",Enemy())
AttackReevaluate("vpsol",75)~
EXIT

//After Fight

APPEND VPSIMEJ

IF WEIGHT #-96 ~Global("VP_SimeSolas","GLOBAL",2) Global("VP_SimeDefeatedSols","GLOBAL",1)~ THEN BEGIN VPSolAfter
  SAY ~It seems that I am an unfortunate companion, <CHARNAME>. This is not the first time I am attacked by those who wish to harm my father. With the Guild war growing ever more cruel maybe you would prefer not to be affiliated with Linvail’s daughter?~
  IF ~~ THEN REPLY ~It was not the first time? Sime, you should have told me that before! I have enough enemies as is! I think you are right. Let’s part.~ DO ~SetGlobal("VP_SimeFlirt","GLOBAL",6)~ GOTO VPSolAftera
  IF ~~ THEN REPLY ~Nonsense, Sime! The more the merrier! Let them all come and they will get their punishment from me.~ DO ~SetGlobal("VP_SimeFlirt","GLOBAL",6)~ GOTO VPSolAfterb
  IF ~~ THEN REPLY ~I rather fancy protecting you... If you do not mind that is...~ DO ~SetGlobal("VP_SimeFlirt","GLOBAL",6)~ GOTO VPSolAfterc
  IF ~~ THEN REPLY ~It’s up to you really. Stay if you wish or go if you think that you are better off on your own.~ DO ~SetGlobal("VP_SimeFlirt","GLOBAL",6)~ GOTO VPSolAfterd
  IF ~~ THEN REPLY ~Stay with us, Sime. You are a valuable companion and I am not afraid of an extra skirmish. Besides, I am already Bodhi’s sworn enemy.~ DO ~SetGlobal("VP_SimeFlirt","GLOBAL",6)~ GOTO VPSolAftere
END

IF ~~ THEN BEGIN VPSolAftera
  SAY ~So be it.~
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
  SAY ~I am not sure I like your attitude, but if you wish to continue to travel with me I shall stay by your side.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeDefeatedSols","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN VPSolAfterc
  SAY ~I do not mind at all... I am flattered.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeDefeatedSols","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN VPSolAfterd
  SAY ~I’d go then. I would not want to be responsible for your death or for the death of our companions. Should you need me, I will probably stay with father for a time.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeDefeatedSols","GLOBAL",2)
SetGlobal("Kicked_Out","GLOBAL",1)
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()
EscapeAreaMove("AR0307",4642,2000,0)~ EXIT
END

IF ~~ THEN BEGIN VPSolAftere
  SAY ~We shall fight our enemies together then!~
  IF ~~ THEN DO ~SetGlobal("VP_SimeDefeatedSols","GLOBAL",2)~ EXIT
END
END

//// Replacements in Brynnlaw

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
  "EPILOGUE" ~EXTERN VPSIMEJ 14~
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
  IF ~InParty("vpsime")~ THEN EXTERN VPSIMEJ 15
END

ADD_TRANS_TRIGGER ~PPSAEM~ 56 ~Global("ThiefGroup","GLOBAL",1)
!InParty("Sime")
See("ppsime")~ DO 0

EXTEND_BOTTOM PPSAEM 56
  IF ~Global("ThiefGroup","GLOBAL",1)
InParty("vpsime")~ THEN DO ~SetAreaRestFlag(0)
StartCutSceneMode()
StartCutScene("vpcut41e")~ EXIT
  IF ~Global("ThiefGroup","GLOBAL",1)
!InParty("vpsime")
See("vpsime")~ THEN DO ~SetAreaRestFlag(0)
StartCutSceneMode()
StartCutScene("vpcut41e")~ EXIT
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
  "EPILOGUE" ~EXTERN VPSIMEJ 14~
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
  "EPILOGUE" ~EXTERN VPSIMEJ 14~
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
  "EPILOGUE" ~EXTERN VPSIMEJ 14~
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
  "EPILOGUE" ~EXTERN VPSIMEJ 14~
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
  "EPILOGUE" ~EXTERN VPSIMEJ 14~
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

IF ~~ THEN BEGIN 14
  SAY ~A particular congratulations to you, captain. It was fortunate you distracted those other ships we saw in the distance. Your signals in the night; were they some type of warning?~
  IF ~~ THEN EXTERN ~PPSAEM~ 54
END

IF ~~ THEN BEGIN 15
  SAY ~Again, my compliments. It did seem that they truly believed your signal meant there would be trouble if they attacked.~
  IF ~~ THEN EXTERN ~PPSAEM~ 55
END
END

//// Slayer Change

//5 Friend

INTERJECT PLAYER1 5 VPSimeSlayerFriend5
== VPSIMEJ IF ~InParty("vpsime") InMyArea("vpsime") !StateCheck("vpsime",CD_STATE_NOTVALID) !Global("VP_SimeRomanceActive","GLOBAL",1) !Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN ~You would have killed me, if I had let you. You would have left me to rot in this place.~ 
END
++ ~I fear this will not be the last time this happens. I can’t control it.~ EXTERN VPSIMEJ VPSimeSlayerFriend5a
++ ~I tried to warn you, but I couldn’t speak. I am sorry. I should distance myself from you.~ EXTERN VPSIMEJ VPSimeSlayerFriend5b
++ ~It wasn’t my fault. Whine if you want, but I’m the one really in trouble here.~ EXTERN VPSIMEJ VPSimeSlayerFriend5c

CHAIN VPSIMEJ VPSimeSlayerFriend5a
~I’m not sure you should try to control it. We must distance you from it, not embrace it. We will make due, despite the danger.~
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerFriend5b
~No, you should not be alone during this. We will get through, I am sure. We just have to keep going, no matter what comes.~
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerFriend5c
~You are not the only one affected by this! It is so hard to see you...~
=~<CHARNAME>, please, let’s just keep moving. We’ll get through, I’m sure of it. Really.~
END
COPY_TRANS PLAYER1 5

//5 Love

INTERJECT PLAYER1 5 VPSimeSlayerLove5.0
== ~VPSIMEJ~ IF ~InParty("vpsime") InMyArea("vpsime") !StateCheck("vpsime",CD_STATE_NOTVALID) OR(2) Global("VP_SimeRomanceActive","GLOBAL",1) Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN
~What was it? This monster, this beast! Was it really you, my sweet lover? Is there no spirit warm and kind enough in this world to protect you?~ [SIME21_1]
END 
IF ~~ THEN REPLY ~The shadow has passed and I pray that it will never happen again. ~ DO ~SetGlobal("VP_SlayerBanter","GLOBAL",3)~ EXTERN VPSIMEJ VPSimeSlayerLove5.1
IF ~~ THEN REPLY ~Cut it out! Look at yourself: you are pale and tremble like a leaf in the wind. I am not an  innocent victim, you idiot! Power is coming to me. I do not know how to control it yet, but soon enough I will.~ DO ~SetGlobal("VP_SlayerBanter","GLOBAL",3)~ EXTERN VPSIMEJ VPSimeSlayerLove5.2
IF ~~ THEN REPLY ~Sime, gods are of no help, do not call for them. Help me chase down Irenicus and rip MY soul out of his body and I shall be whole again.~ DO ~SetGlobal("VP_SlayerBanter","GLOBAL",3)~ EXTERN VPSIMEJ VPSimeSlayerLove5.3
IF ~~ THEN REPLY ~Protect me? Protect me against whom or what? From myself? I am a Bhaalspawn and I assumed the form of my father’s avatar. It is only natural, do not you think? (*You laugh bitterly.*)~ DO ~SetGlobal("VP_SlayerBanter","GLOBAL",3)~ EXTERN VPSIMEJ VPSimeSlayerLove5.4

CHAIN VPSIMEJ VPSimeSlayerLove5.1
~<CHARNAME>... It hurts me to see you misshapen. But most of all it pains me to see the light in your eyes to change to insatiable hunger of a killer. Nobody should have to go through torture like this and you in particular. I wait impatiently for the day when that evil mage pays for his crimes against you.~
END
  IF ~~ THEN REPLY ~That day will come soon, I swear. And when it comes I will be glad to have a trusted companion like you by my side.~ GOTO VPSimeSlayerLove5.1a
  IF ~~ THEN REPLY ~Irenicus has committed many crimes. He has killed and tortured many. I will have to make him pay for all of them when at last we confront him.~ GOTO VPSimeSlayerLove5.1a
  IF ~~ THEN REPLY ~Sime, I can see that you are upset, but please, calm down.~ GOTO VPSimeSlayerLove5.1b

CHAIN VPSIMEJ VPSimeSlayerLove5.1a
~By the first day and the last day of Toril, by the torment of Abyss and by the triumph of light over darkness, by the multitude of Planes, by your breath on my cheek, by my bliss and by my torture, by my love for you, I swear that I shall not abandon your fight till we have won.~
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerLove5.1b
~I am calm, <CHARNAME>, I am deadly calm. And so I will be the day we catch up with Irenicus.~
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerLove5.2
~Then the Evil got its grip on you... Fight it if you can, oh, please, I beg you! It pains me to see the light in your eyes to change to insatiable hunger of a killer! Fight it, <CHARNAME>.~
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerLove5.3
~That’s what I am here for, <CHARNAME>. By the first day and the last day of Toril, by the torment of Abyss and by the triumph of light over darkness, by the multitude of Planes, by your breath on my cheek, by my bliss and by my torture, by my love for you, I swear that I shall not abandon your fight till we have won.~
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerLove5.4
~Come here and let me hold you for a moment. I know it’s just an illusion but I feel like I am protecting you from all the evils of the world.~
END
  IF ~~ THEN REPLY ~I am glad YOU are feeling better.~ DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ GOTO VPSimeSlayerLove5.4a
  IF ~~ THEN REPLY ~Now that you have mentioned that, I do have the feeling of being protected... It is so strange. You are only one woman...~ GOTO VPSimeSlayerLove5.4b
  IF ~~ THEN REPLY ~(*Whisper*) Are you mad? What would the others think?~ GOTO VPSimeSlayerLove5.5
  
CHAIN VPSIMEJ VPSimeSlayerLove5.4a
~There is no need to snap at me. If you feel uncomfortable with me loving you, you should have said so earlier.~
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerLove5.4b
~One woman, yes, but I am your woman and I would not let some dead god or a crazed mage to take you away from me. Let them all come, I am ready to give them a fight... (*Laughs and strokes your hair*)... We will get through this, <CHARNAME>, do not worry.~
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerLove5.5
~Do you really care?~
END
  IF ~~ THEN REPLY ~No, let them talk!~ GOTO VPSimeSlayerLove5.5a
  IF ~~ THEN REPLY ~Yes! (*You free yourself from her arms*)~ GOTO VPSimeSlayerLove5.5b
  IF ~InParty("Imoen2") See("Imoen2")~ THEN REPLY ~Imoen, what’s the matter?~ EXTERN ~IMOEN2J~ VPSimeSlayerLove5.5Immy1

CHAIN VPSIMEJ VPSimeSlayerLove5.5a
~Now, that’s better. By the first day and the last day of Toril, by the torment of Abyss and by the triumph of light over darkness, by the multitude of Planes, by your breath on my cheek, by my bliss and by my torture, by my love for you, I swear that I shall not abandon your fight till we have won.~
END
COPY_TRANS PLAYER1 5

CHAIN VPSIMEJ VPSimeSlayerLove5.5b
~I see... I will not embarrass you with my unwanted attention any more, I swear.~ DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~
END
COPY_TRANS PLAYER1 5

CHAIN IMOEN2J VPSimeSlayerLove5.5Immy1
~Awww... So sweet. Nope, of course he does not! And it is cool to see big <PRO_BROTHERSISTER> is blushing.~
END
++ ~Imoen! Have the decency to look away!~ EXTERN IMOEN2J VPSimeSlayerLove5.5Immy2

CHAIN IMOEN2J VPSimeSlayerLove5.5Immy2
~(*Giggles*) What! And miss all the hot stuff? No way in Nine Hells! I have spent too long watching a crack on my ceiling as entertainment!~
== VPSIMEJ ~Imoen, a certain degree of shyness becomes a maiden.~
== IMOEN2J ~And who's to say I am a maiden? Hey, I am almost as old as <CHARNAME> is, and I did not have Gorion on my back, so once I...~
END
  IF ~~ THEN REPLY ~(*Close your ears with your palms*)... LA-LA-LA! I am not listening! LA-LA-LA!~ EXTERN IMOEN2J VPSimeSlayerLove5.5Immy2a
  IF ~~ THEN REPLY ~Go on, Imoen, I am extremely interested to know which old stuffy mage or dusty librarian you graced with your favors.~ EXTERN IMOEN2J VPSimeSlayerLove5.5Immy2b
  IF ~~ THEN REPLY ~IMOEN!~ EXTERN IMOEN2J VPSimeSlayerLove5.5Immy2c

CHAIN IMOEN2J VPSimeSlayerLove5.5Immy2a
~(*Laughs and makes faces*)~
== VPSIMEJ ~Imoen, let us make a deal: I will listen to your story tonight, and we will leave <CHARNAME> out of it.~
END
COPY_TRANS PLAYER1 5

CHAIN IMOEN2J VPSimeSlayerLove5.5Immy2b
~(*Pouts*) 'Twas no stuffy mage! 'Twas that awesome looking traveller who came through Candlekeep on that stormy night... It was a pitch-black. The thunder was shuttering the skies, the moon was showing her face from behind the clouds specifically to make the world even scarier, and the wind was blowing with the force unknown before.~
== VPSIMEJ ~Imoen, I believe you. But let us make a deal: I will listen to your story tonight, and we will leave <CHARNAME> out of it, he seems to be turning greenish for some reason. You know how men are...~
END
COPY_TRANS PLAYER1 5

CHAIN IMOEN2J VPSimeSlayerLove5.5Immy2c
~(*Pouts*) Imoen! I know I am Imoen. You NEVER give me a chance to tell ANYTHING!~
== VPSIMEJ ~Imoen, I believe you. But let us make a deal: I will listen to your story tonight, and we will leave <CHARNAME> out of it, he seems to be turning greenish for some reason. You know how men are...~
END
COPY_TRANS PLAYER1 5

//7 Love

INTERJECT PLAYER1 7 VPSimeSlayer7
== VPSIMEJ IF ~InParty("vpsime") !StateCheck("vpsime",CD_STATE_NOTVALID) InMyArea("vpsime") Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN
~Are you well? I am growing very worried about you, you know. I should not like to lose you in this evil place.~
END
++ ~Sime, I would get back if I were you. I think it’s happening again!~ DO ~SetGlobal("VPEndangerLovedOne","GLOBAL",1)~ EXTERN VPSIMEJ VPSimeSlayer7a
++ ~Get back, Sime, if you value your life.~ DO ~SetGlobal("VPEndangerLovedOne","GLOBAL",1)~ EXTERN VPSIMEJ VPSimeSlayer7a
++ ~Leave me be! You endanger yourself just standing there!~ DO ~SetGlobal("VPEndangerLovedOne","GLOBAL",1)~ EXTERN VPSIMEJ VPSimeSlayer7a

CHAIN VPSIMEJ VPSimeSlayer7a
#49924 /* ~<CHARNAME>? Your lips move but there is no sound. <CHARNAME>? <CHARNAME>!!!~ */
DO ~ActionOverride(Player1,ReallyForceSpell(Myself,SLAYER_CHANGE))~
EXIT

//// Tree of Life

// Friend

INTERJECT PLAYER1 33 VPSimeToLFriend0
== PLAYER1 IF ~OR(2) Global("VP_SimeRomanceActive","GLOBAL",0) Global("VP_SimeRomanceActive","GLOBAL",3) InParty("vpsime") InMyArea("vpsime") !StateCheck("vpsime",CD_STATE_NOTVALID)~ THEN
~Sime is before you, the woman you had not come to know very well, though she was a loyal companion.~
END
  IF ~~ THEN REPLY ~Sime, I know little of you, but Irenicus is no enemy of yours. You do not have to fight my battle...~ EXTERN VPSIMEJ VPSimeToLFriend1
  IF ~~ THEN REPLY ~You know how powerful Irenicus is, Sime. The fight is going to be deadly. If you wish, you may take your leave now.~ EXTERN VPSIMEJ VPSimeToLFriend2
  IF ~~ THEN REPLY ~Sime, that’s not the best time to chat, but I need to know that you readily and willingly partaking in the fight with Irenicus.~ EXTERN VPSIMEJ VPSimeToLFriend3

APPEND VPSIMEJ

IF ~~ THEN BEGIN VPSimeToLFriend1
  SAY ~Irenicus had willfully damaged the Tree of Life. Thus he became an enemy of everyone with elven blood in their veins. I will fight him with you.~
COPY_TRANS PLAYER1 33
END  

IF ~~ THEN BEGIN VPSimeToLFriend2
  SAY ~Give me one good reason why a ranger should run away from a battle with an evil wizard who endangered the whole world in his madness? You are silent? Good. I stand ready to fight.~
COPY_TRANS PLAYER1 33
END

IF ~~ THEN BEGIN VPSimeToLFriend3
  SAY ~You are right, we do not have time to chat. Just give me a signal to attack.~
COPY_TRANS PLAYER1 33
END
END

// Love

INTERJECT PLAYER1 33 VPSimeToLLove0
== PLAYER1 IF ~OR(2) Global("VP_SimeRomanceActive","GLOBAL",1) Global("VP_SimeRomanceActive","GLOBAL",2) InParty("vpsime") InMyArea("vpsime") !StateCheck("vpsime",CD_STATE_NOTVALID)~ THEN
~Sime... You look at the maiden’s eyes and you see what you have hoped and scared to see: the determination to follow you to the end of the world and beyond it. It is obvious that you might keep Sime out of this battle, if you, say, tied her up and gagged her. Still, you want to give her a chance to reconsider.~
END
  IF ~~ THEN REPLY ~Sime, Irenicus is no enemy of yours. You do not have to fight my battles.~ EXTERN VPSIMEJ VPSimeToLLove1
  IF ~~ THEN REPLY ~You know how powerful Irenicus is, Sime. The fight is going to be deadly. I am afraid that you might get hurt or die... I would rather... Do you think you might wait here?~ EXTERN VPSIMEJ VPSimeToLLove2
  IF ~~ THEN REPLY ~Sime, that’s not the best time to chat, but I need to know that you readily and willingly partaking in the fight with Irenicus.~ EXTERN VPSIMEJ VPSimeToLLove3

APPEND VPSIMEJ

IF ~~ THEN BEGIN VPSimeToLLove1
SAY ~Irenicus had willfully damaged the Tree of Life. Thus he became an enemy of everyone with Elven blood in their veins. Irenicus had hurt and tormented a man I love. How many more reasons do you want me to give you? I am ready to fight, <CHARNAME> and this battle is mine, as well as yours.~
COPY_TRANS PLAYER1 33
END
  
IF ~~ THEN BEGIN VPSimeToLLove2
SAY ~No. Let’s not waste words. I am ready to fight, <CHARNAME> and this battle is mine, as well as yours.~
COPY_TRANS PLAYER1 33
END

IF ~~ THEN BEGIN VPSimeToLLove3
SAY ~I am partaking readily and willingly. You are right, we do not have time to chat. Just give me a signal to attack.~
COPY_TRANS PLAYER1 33
END
END

//Hell

I_C_T PLAYER1 25 VPSimeHell 
== ~VPSIMEJ~ IF ~InParty("vpsime") InMyArea("vpsime") !StateCheck("vpsime",CD_STATE_NOTVALID)~ ~I often said to myself when it was getting rough - it could be worst, it could be Nine Hells... But now I am afraid we are in Nine Hells. (*Shrugs*)~
END

/////////////////////
//// Sime Romance
////////////////////////

//// Pre-romance Flirts

// Flirt 1. Sime's Parents
APPEND VPSIMEJ

IF WEIGHT #-99 ~Global("VP_SimeFlirt","GLOBAL",2)~ THEN BEGIN f1.0
  SAY ~<CHARNAME>, you once had asked me about my connection with Shadow Thieves...~ [SIMEPC06]
  IF ~~ THEN REPLY ~Yes, I am quite curious...~ GOTO f1.1
  IF ~~ THEN REPLY ~Sime, it’s really, really, really bad time to bring this stuff up. Let’s talk about that later.~ GOTO f1.x1
END

IF ~~ THEN BEGIN f1.1
  SAY ~Aran Linvail is my... father, <CHARNAME>. ~ [SIMEPC07]
  IF ~~ THEN REPLY ~What?~ GOTO f1.2
  IF ~~ THEN REPLY ~Your father? That’s quite a twist!~ GOTO f1.2
  IF ~~ THEN REPLY ~I suspected it all along, my dear. You look alike. But go on, please.~ GOTO f1.2
END

IF ~~ THEN BEGIN f1.2
  SAY ~Yes... I do not remember my mother. Aran does not speak of her often. Theirs was a difficult relationship. Aran was young and during a reckless party he boasted that he could rob a mysterious elven temple of Selune. A lieutenant of the Shadow Thieves Guild promised him admission to the Guild, if he would bring Seluna’s necklace, a powerful and priceless relic... Aran took challenge seriously and robbing the temple became his obsession. After months of careful planning he managed to get into the temple...~ [SIMEPC08]
  IF ~~ THEN REPLY ~A brilliant carrier move...~ GOTO f1.3
  IF ~~ THEN REPLY ~Wow, that Aran was quite a man!~ GOTO f1.3
  IF ~~ THEN REPLY ~Sime, I do not want to listen to this story, it sickens me to know that someone can rob a temple of Selune.~ GOTO f1.skip
END

IF ~~ THEN BEGIN f1.3
  SAY ~Well, yes... Apparently the information he gathered was faulty and instead of making it into the temple’s main hall he broke into one of the cleric’s private chambers. He plunged down from the window right at my mother’s feet. Aran looked so scared and silly that she laughed and took pity on the would be thief. And he... he was enchanted by her beauty and instead of running away he stayed with her that night.~
  IF ~~ THEN REPLY ~Ahem, Sime, why are you telling me that? And anyway, how Aran then got into the Guild and became Shadow Master.~ GOTO f1.4
  IF ~~ THEN REPLY ~Sime, please, spare me that romantic nonsense.~ GOTO f1.x2
  IF ~~ THEN REPLY ~If that’s true, how did Aran become Shadow Master?~ GOTO f1.4
END

IF ~~ THEN BEGIN f1.4
  SAY ~In truth - I do not know... He might have done something else... or faked the necklace. My father is quite resourceful. ~
  IF ~~ THEN DO ~SetGlobal("VP_SimeFlirt","GLOBAL",3) RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800)~ EXIT
END


IF ~~ THEN BEGIN f1.x1
  SAY ~If you wish.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeFlirt","GLOBAL",3) RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800) SetGlobal("VP_SimeRejected","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN f1.x2
  SAY ~Got it! No romantic nonsense in <CHARNAME>’s company!~
  IF ~~ THEN DO ~SetGlobal("VP_SimeFlirt","GLOBAL",3) RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800) SetGlobal("VP_SimeRejected","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN f1.skip
  SAY ~I am glad to hear that! I also thought that it was one of the most outrageous of my father’s notions. On the other hand that lead to my birth, so I guess I cannot complain too much.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeFlirt","GLOBAL",3) RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800)~ EXIT
END

//Flirt 2. Sime's mother

IF WEIGHT #-98 ~Global("VP_SimeFlirt","GLOBAL",4)~ THEN BEGIN f2.0
  SAY ~The night is so beautiful...  But it’s on nights like this when I miss my mother the most...~
  IF ~~ THEN REPLY ~You never told me what happened to your mother. Where is she?~ GOTO f2.1
  IF ~~ THEN REPLY ~Sime, would you mind keeping your grievances to yourself? I am trying to get some rest here.~ GOTO f2.x1
END

IF ~~ THEN BEGIN f2.1
  SAY ~It’s very sad. My parents could not see each other often, because he had to stay in the city, trying to move up in the Guild and my mother would have none of it... So they met in secret. Shortly after I was born, bandits killed my mother when she was travelling to one of their hideouts...~
  IF ~~ THEN REPLY ~I am sorry to hear that, Sime.~ GOTO f2.2
  IF ~~ THEN REPLY ~Look I’m crying already. May be you can tell me the rest another time?~ GOTO f2.x1
END

IF ~~ THEN BEGIN f2.x1
  SAY ~I get the message. Sorry, I had mistaken you for someone with a heart.~
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800)
SetGlobal("VP_SimeFlirt","GLOBAL",5)
SetGlobal("VP_SimeRejected","GLOBAL",1)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN f2.2
  SAY ~I wish I had at least one small memory of her. But I do not. Aran was a wonderful father however. He meant everything to me when I was a child. But like my mother, I could not accept his ways. However, his days will come to an end soon. I am trying to spend as much time with him as I can. And that’s why I was by his side, when you come to the Guild. My parent’s problems... should be boring to you.~
  IF ~~ THEN REPLY ~Sime, I know how difficult it is to keep everything in. Please, talk to me whenever you feel like it.~ GOTO f2.3
  IF ~~ THEN REPLY ~No, actually it was very entertaining!~ GOTO f2.3a
  IF ~~ THEN REPLY ~Sime, I am afraid, yes, it was terribly boring and I struggled to keep awake. I hope you got it out of your system now.~ GOTO f2.x2
END

IF ~~ THEN BEGIN f2.3
  SAY ~ Thank you, <CHARNAME>... and you always have my ear.~
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800)
SetGlobal("VP_SimeFlirt","GLOBAL",5)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN f2.3a
  SAY ~Oh! You like the stories and songs of the doomed love? I might have one or two more for you then.~
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800)
SetGlobal("VP_SimeFlirt","GLOBAL",5)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN f2.x2
  SAY ~I did. Thank you for taking the pain and listening.~
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800)
SetGlobal("VP_SimeFlirt","GLOBAL",5)
SetGlobal("VP_SimeRejected","GLOBAL",1)
RestParty()~ EXIT
END

// LT 2. Your Heritage

IF WEIGHT #-99 ~Global("VP_SimeLoveTalk","GLOBAL",2)~ THEN BEGIN lt1.0
  SAY ~I know who you are, m’<PRO_LADYLORD>. Or rather what you are. If that was a secret, then it was not guarded carefully. Tell me, <CHARNAME>, was it your intention to let the world know that you are Bhaal’s child or it was a mishap?~ [SIME1_1]
  IF ~~ THEN REPLY ~I do not know, Sime. After I defeated Sarevok, my heritage became common knowledge. The rumours in this land spread faster than wildfire. I wonder sometimes what do they pay messengers for?~ GOTO lt1.1a
  IF ~~ THEN REPLY ~Bad mishap, Sime. I wish I could keep my Gorion’s ward mantle for longer, but it was stripped away from me. By the way, Sime, if you’d stop calling me "m’<PRO_LADYLORD>" that might greatly improve the intimacy of our friendship.~ GOTO lt1.1b
  IF ~~ THEN REPLY ~Of course that was my intention! Would you be a demigod, would you hide it?~ GOTO lt1.1c
END

IF ~~ THEN BEGIN lt1.1a
  SAY ~(*Laughs*) For staying in the inns and getting drunk, while the good folk do their jobs, m’<PRO_LADYLORD>. Indeed, the gossip travels faster than a bird flies and I fail to understand how. May be it is magic?~
  IF ~~ THEN REPLY ~Scrying devices you mean? I am afraid that even as we speak some wizened man has nothing better to do than to pry on me.~ GOTO lt1.2a
  IF ~~ THEN REPLY ~Magic or not it is annoying as Nine Hells!~ GOTO lt1.2a
  IF ~~ THEN REPLY ~Sime, I do not mean to be disrespectful, but this talk and your attitude upset me.~ GOTO lt1.xa
END

IF ~~ THEN BEGIN lt1.2a
  SAY ~You think so? (*laughs*) Then let’s give them something to look at my <PRO_LADYLORD>!

(*Before you can answer, Sime gives you a deep, long kiss*).~ [SIME1_2]
  IF ~~ THEN REPLY ~There could be more than one wizard watching, caring soul. Care to repeat the performance to keep them all interested? By the way, Sime, do stop calling me "m’<PRO_LADYLORD>" already! <CHARNAME> will do.~ GOTO lt1.3a
  IF ~~ THEN REPLY ~Awww... Good, but not enough. We shall give it another try one day. That’s if you would drop that "m’<PRO_LADYLORD>" when talking to me. <CHARNAME> will do.~ GOTO lt1.3a
  IF ~~ THEN REPLY ~<CHARNAME>, just <CHARNAME>. But for the gods sake, woman, control yourself!~ GOTO lt1.4a
  IF ~~ THEN REPLY ~Sime, I assume that was a joke. But I will not let you off so easily next time. One more escapade like that - and you are out of this group!~ GOTO lt1.xa
END

IF ~~ THEN BEGIN lt1.3a
  SAY ~<CHARNAME>? I think I rather like your name. Try it again? Why not? You are a good kisser, even when caught unaware.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN lt1.4a
  SAY ~Fear not, <CHARNAME>, I am in full control of what I am doing.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN lt1.xa
  SAY ~My <PRO_LADYLORD>, I was only wishing to cheer you. If you prefer to revel in your grim thoughts, suit yourself.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN lt1.1b
  SAY ~Then I shall call you by your name. <CHARNAME>... I like the sound of it. So, <CHARNAME> you would prefer to be incognito?~
  IF ~~ THEN REPLY ~Yes, Sime. Way too often people expect a heroic feat or a mad <PRO_MANWOMAN>man’s act or who knows what else of me, just because I am a Bhaalspawn.~ GOTO lt1.2b
  IF ~~ THEN REPLY ~I guess. But really, it is none of your business.~ GOTO lt1.3b
  IF ~~ THEN REPLY ~It is not that bad actually. Half of the people run away from me, another half want me to do something, and all that based on the same fact: "because you are a Bhaalspawn". I guess it is funny in a way.~ GOTO lt1.4b
END

IF ~~ THEN BEGIN lt1.2b
  SAY ~I understand. Or at least I can see why you are aggravated. I cannot stop the fools from gaping at you, but I can promise that I shall think of you as a person, not as something menacing and unusual.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN lt1.3b
  SAY ~(*Shrugs*) If you say so.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN lt1.4b
  SAY ~Funny? You are gifted with a happy character if you find it funny. I cannot stop the fools from gaping at you, but I can promise that I shall think of you as a person, not as something menacing and unusual.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN lt1.1c
  SAY ~I do not know. I am a half-elf, half-human and I’ve never hid any part of my heritage, like some half-bloods do. May be if I was a demigod, I would not keep it a secret either.~
  IF ~~ THEN REPLY ~My point exactly. I cannot change who I am and I am not ashamed of my heritage. After all it was my mother, who had peculiar taste in men, not I. And Sime, do call me <CHARNAME>. "My <PRO_LADYLORD>" unnerves me.~ GOTO lt1.2c
  IF ~~ THEN REPLY ~Sime, let’s not make a big deal out of it.~ GOTO lt1.xc1
  IF ~~ THEN REPLY ~I would not wish anyone to face the choices I face. I cope, Sime, but it is not easy to carry the burden of my accursed heritage. The crowd’s fascination does not help things. Half of the people run away from me, another half want me to do something, and all that based on the same fact: "because you are a Bhaalspawn". Pray Sime, pray hard every night NOT to wake up next morn a demigod and a famous persona in the Realms as it happened to me.~ GOTO lt1.3c
END

IF ~~ THEN BEGIN lt1.2c
  SAY ~Then I shall call you by your name. <CHARNAME>... I like the sound of it. I think we have something in common: my mother had very unusual tastes where men were concerned it seems. But at least she picked a local murderer and a thief, not the Lord of Murder.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN lt1.xc1
  SAY ~We shall not then.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)

SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN lt1.3c
  SAY ~(*Laughs*) Your warning is belated, m’<PRO_LADYLORD>. I am now Sime Linvail, the one who travels in the company of Bhaalspawn! ~
  IF ~~ THEN REPLY ~Sime, I really do not have time for a small talk.~ GOTO lt1.xc2
  IF ~~ THEN REPLY ~But I warned you! And Sime, do call me <CHARNAME>. "My <PRO_LADYLORD>" unnerves me.~ GOTO lt1.4c
  IF ~~ THEN REPLY ~What have I done! I doomed you! And since we have such an intimate connection as a common curse, would you consider calling me <CHARNAME>?~ GOTO lt1.5c
END

IF ~~ THEN BEGIN lt1.xc2
  SAY ~(*Shrugs*) If you say so.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)

SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN lt1.4c
  SAY ~Thank you for the warning, <CHARNAME>. I think I rather like your name.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN lt1.5c
  SAY ~<CHARNAME>? I think I rather like your name. I shall use it often.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",3)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

// LT 4. Nightmares

IF WEIGHT #-97 ~Global("VP_SimeLoveTalk","GLOBAL",4)~ THEN BEGIN 292
  SAY ~I heard you moaning in your sleep another night. It might be that I am intruding, <CHARNAME>, but do you have nightmares?~ [SIME2_1]
  IF ~~ THEN REPLY ~You are impossible Sime. What I dream of should not concern you.~ GOTO 293
  IF ~~ THEN REPLY ~Yes, Sime. Ever since Gorion died and I was forced to fight for my dear life. I am used to nightmares, Sime, do not worry.~ GOTO 297
  IF ~~ THEN REPLY ~I do not have any bloody nightmares. I was not moaning. It must have been wind or a lovesick cat you have heard.~ GOTO 298
  IF ~~ THEN REPLY ~If you do not mind, I would rather not to discuss it further. Sime, I took you along to fight my battles and I am not interested in discussing my private life with you.~ GOTO 299
END

IF ~~ THEN BEGIN 293
  SAY ~I am a healer, remember? I might be able to help you. You look troubled and you have ill dreams. Even now I can see pain in your eyes. May be a sleeping draught...~
  IF ~~ THEN REPLY ~No, Sime, no sleeping draught will get rid of my dreams. Ever since Gorion died and I was forced to fight for my dear life I have had those visions. I am used to nightmares by now, do not worry.~ GOTO 294
  IF ~~ THEN REPLY ~Thank you for the thought, but no, I do not need a potion. I will cope.~ GOTO 294
  IF ~~ THEN REPLY ~I know you mean well, but I do not require any help. The nightmares are painful, but they bring me power once in a while.~ GOTO 295
  IF ~~ THEN REPLY ~Sleeping draught? How about a taste of sweet maiden’s lips for a potion?~ GOTO 296
END

IF ~~ THEN BEGIN 294
  SAY ~You sound so sure,<CHARNAME>. So be it. But you need only ask for my help, should you change your mind.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",5)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 295
  SAY ~Oh, you are one of those who would go through the worst torture to gain even the smallest grain of knowledge or power? Suit yourself then. But you need only ask for my help, should you change your mind.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",5)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 296
  SAY ~My kisses are known to wake a <PRO_MANWOMAN> up, not to put <PRO_HIMHER> to sleep. ~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",5)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 297
  SAY ~It is awful. I can see that the nightmares wear you down and there is pain in your eyes. May be a sleeping draught...~ [SIME2_3]
  IF ~~ THEN REPLY ~No, Sime, a sleeping draught will not save me from my dreams.~ GOTO 294
  IF ~~ THEN REPLY ~Thank you for the thought, but no, I do not need a potion. I will cope.~ GOTO 294
  IF ~~ THEN REPLY ~I know you mean well, but I do not require any help. The nightmares are painful, but they bring me power once in a while.~ GOTO 295
  IF ~~ THEN REPLY ~Sleeping draught? How about a taste of sweet maiden’s lips for a potion?~ GOTO 296
END

IF ~~ THEN BEGIN 298
  SAY ~(*Smiles*) Of course. A lovesick cat it was. Should you meet that poor animal, do let me know. I might have a potion or two to help the unfortunate beast to sleep better.~ [SIME2_4]
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",5)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 299
  SAY ~And that is precisely what I am doing: fighting your battles. Fear cuts deeper than swords, they say. Even now I can see pain in your eyes caused by the ill dreams. I am a healer and a good healer mends souls as often as mending bodies. I can give you a sleeping draught or I can talk to you.  Whichever will bring you peace of mind.~
  IF ~~ THEN REPLY ~No, Sime, no sleeping draught will get rid of my dreams. Ever since Gorion died and I was forced to fight for my dear life I have had those visions. I am used to nightmares by now, do not worry.~ GOTO 294
  IF ~~ THEN REPLY ~Thank you for the thought, but no, I do not need a potion. I will cope.~ GOTO 294
  IF ~~ THEN REPLY ~I know you mean well, but I do not require any help. The nightmares are painful, but they bring me power once in a while.~ GOTO 295
  IF ~~ THEN REPLY ~I said: I do not want to discuss my private life with you.~ GOTO 300
  IF ~~ THEN REPLY ~Sleeping draught? How about a taste of sweet maiden’s lips for a potion?~ GOTO 296
END

IF ~~ THEN BEGIN 300
  SAY ~Have it your own way then, you stubborn lout. You will not hear another word from me, but a battle cry.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",5)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

//LT 6

IF WEIGHT #-96 ~Global("VP_SimeLoveTalk","GLOBAL",6)~ THEN BEGIN 301
  SAY ~Do not call me a wise owl, <CHARNAME>. I have had my share of mistakes and silly escapades. Sometimes I think that I am alive only by the will of the gods who guard all fools.~ [SIME3_1]
  IF ~~ THEN REPLY ~You have done something stupid? I am sorry, Sime, but I will need proof to believe you. Come tell me about at least one thing you have done wrong.~ GOTO 302
  IF ~~ THEN REPLY ~Sure. We all did. But you appear to be a very rational person at present. Care to trade a tale of your apparently crazy youth?~ GOTO 302
  IF ~~ THEN REPLY ~Whatever you say. Sime, we do not have time for arguments. Be a good girl, stop hanging at my every word and turning everything into a discussion!~ GOTO 307
END

IF ~~ THEN BEGIN 302
  SAY ~I will oblige your curiosity. I ran away from the safe home where Aran placed me to when I was young. I wanted no less than to become a famous bard. The grand plan was to collect the folk songs of the Barbarians of the Icewind Dale. I reasoned that I could sustain myself by singing and dancing as I will be making my way up North.~
  IF ~~ THEN REPLY ~Sounds like a daring enterprise. And I agree, an unwise one. Was your expedition somehow related to Aran?~ GOTO 303
  IF ~~ THEN REPLY ~But that’s a brilliant idea! I have never heard Barbarian sagas in the South. Why did not you go through with your plan?~ GOTO 308
  IF ~~ THEN REPLY ~I am convinced, Sime. That was a rather silly escapade.~ GOTO 309
END

IF ~~ THEN BEGIN 303
  SAY ~Of course it was related to Aran. In those days everything I did was in some way connected to my father. I ran away after I finally understood who my father is.~
  IF ~~ THEN REPLY ~Did he find you then?~ GOTO 304
  IF ~~ THEN REPLY ~What happened next, Sime?~ GOTO 304
  IF ~~ THEN REPLY ~(*Yawn*) Yes, sure thing.~ GOTO 307
END

IF ~~ THEN BEGIN 304
  SAY ~I learned later that my father sent in secret a couple of thugs to watch over me and to give me a coin or two if the things became too rough. Aran knew that interfering directly or arguing with me was useless. He hoped, that I would return back of my own volition and that may be life on the streets would make me less judgmental. He did not foresee that Darriel would walk into a tavern where I was trying to sing for a meal...~
  IF ~~ THEN REPLY ~Darriel of Tangelwood, the mentor you have mentioned?~ GOTO 305
  IF ~~ THEN REPLY ~Your father has no divination talent then?~ GOTO 306
  IF ~~ THEN REPLY ~(*Yawn*) Yes, sure thing.~ GOTO 307
END

IF ~~ THEN BEGIN 305
  SAY ~Yes, him. Darriel is not among the living any more, <CHARNAME>... I would rather not continue the story now. A sad storyteller would not lift your spirit, and I wish to see you smiling.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",7)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 306
  SAY ~Do not you try to be smart with me! You know well enough that my father’s talents are of different sort than needed for the Arcane Arts devotee. You need not remind me of his true calling.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",7)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 307
  SAY ~I did not mean to bore you to tears, <CHARNAME>. I shall be quiet from now on.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",7)

SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN 308
  SAY ~Brilliant? <CHARNAME>, you either have a dark sense of humour or you have heard nothing at all about the barbarians of Icewind Dale! I prefer to think the latter. Know that what waited for me, then a young girl incapable to defend herself, were slavery, torture, rape and in best case quick death.~
  IF ~~ THEN REPLY ~It was a stupid joke, Sime, I am sorry.~ GOTO 309
  IF ~~ THEN REPLY ~Oh, I did not know that. Indeed it is for the best that you did not go. But what happened instead?~ GOTO 304
  IF ~~ THEN REPLY ~(*Shrug*) Whatever...~ GOTO 310
END

IF ~~ THEN BEGIN 309
  SAY ~It was. But all is well that ends well.~
  IF ~~ THEN GOTO 304
END

IF ~~ THEN BEGIN 310
  SAY ~I think that talking to a wooden statue is a better than talking to you! At least it is silent. You ARE Bhaal’s blood, cold and unfeeling, I know now.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",7)

SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT
END

// LT 8

IF WEIGHT #-95 ~Global("VP_SimeLoveTalk","GLOBAL",8)~ THEN BEGIN 311
  SAY ~Since we talked last time, I started thinking of Darriel often. You even remind me of him. May be not in looks but in the way you’re talking so surely, fight with such valour and you both know mercy and have talent to understand others.~ [SIME4_1]
  IF ~~ THEN REPLY ~Your words are pleasant enough, Sime, but I feel ill at ease when you compare me to your dead lover.~ GOTO 312
  IF ~~ THEN REPLY ~I gather that Darriel commanded your respect and admiration. (*aside*) Makes me wonder what else he won.~ GOTO 312
  IF ~~ THEN REPLY ~Woman quit your whining. I am not your Darriel reborn from the dead.~ GOTO 319
  IF ~~ THEN REPLY ~There is none like me, Sime. I am Bhaal’s heir and you ought to sense my greatness far surpassing anything a mere mortal can master. Do not dare to compare me with some snooty Elf, wench!~ GOTO 320
END

IF ~~ THEN BEGIN 312
  SAY ~Strange, I am almost sure that I can hear jealousy in your voice. Everything Darriel was to me. He was a biter foe when he carried me away and I thought he was my father’s hireling. He was a chance comrade and an imprisoned, when I wanted nothing but to escape. He became a friend and a mentor when I discovered the true calling of my heart. But he was never my lover.~ [SIME4_2]
  IF ~~ THEN REPLY ~Do not reply if you do not want to, but I cannot help but ask why? Another woman? Too much ranging to do, no time for gentle talk? His romantic interests lay elsewhere?~ GOTO 313
  IF ~~ THEN REPLY ~Oh.~ GOTO 317
  IF ~~ THEN REPLY ~I am sorry if I have unintentionally stirred painful memories.~ GOTO 318
  IF ~~ THEN REPLY ~And now he is dead. How tragic. If you do not mind, Sime I have better things to do than talking to you about some rotting corpse.~ GOTO 316
END

IF ~~ THEN BEGIN 313
  SAY ~I think that such curiosity befits a cat or a bored woman, rather than a <PRO_MANWOMAN> grown. But to answer your question, I guess I am a coward of a sort and I was scared of the love and trust I had in him, so I pushed him away. However, was not it for the best? I miss my friend badly, how much worse would it hurt was he my lover?~
  IF ~~ THEN REPLY ~No worse I think. You will call to your lost friends in your dreams, and you will be tricked for a moment and extend your hands and wake up only to the empty room, the locked doors and the bitter taste of loss.~ GOTO 314
  IF ~~ THEN REPLY ~I did not think that you were one to be afraid to love. Even if it hurts sometimes.~ GOTO 315
  IF ~~ THEN REPLY ~I grow bored, Sime. Let’s get going.~ GOTO 316
END

IF ~~ THEN BEGIN 314
  SAY ~Of course, you are right. But no man have I loved like I loved my father, and I was so bitterly disappointed. Since then I have a trapped door on the bottom of my heart and I will not allow any man to enter it. That’s why not Darriel.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",9)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 315
  SAY ~I am not afraid to fall in love <CHARNAME> and I loved many. But no man have I loved like I loved my father, and I was so bitterly disappointed. Since then I have a trapped door on the bottom of my heart and I will not allow any man to enter it. That’s why not Darriel.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",9)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 316
  SAY ~As you wish. I can see that you have little interest in me, so I’ll spare you from now on.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",9)

SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN 317
  SAY ~I guess I am a coward of a sort and I was scared have the love and trust I had in him, so I pushed him away. However was not it for the best? I miss my friend badly, how much worse would it hurt was he my lover?~
  IF ~~ THEN REPLY ~No worse I think. You will call to your lost friends in your dreams, and you will be tricked for a moment and extend your hands and wake up only to the empty room, the locked doors and the bitter taste of loss.~ GOTO 314
  IF ~~ THEN REPLY ~I did not think that you were one to be afraid to love. Even if it hurts sometimes.~ GOTO 315
  IF ~~ THEN REPLY ~I grow bored, Sime. Let’s get going.~ GOTO 316
END

IF ~~ THEN BEGIN 318
  SAY ~No, I am actually grateful to you. It feels easier somehow after I said it. No man have I loved like I loved my father, and I was so bitterly disappointed. Since then I have a trapped door on the bottom of my heart and I will not allow any man to enter it. That’s why not Darriel.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",9)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 319
  SAY ~No, you are not. Strange, I am almost sure that I can hear jealousy in your voice. Everything Darriel was to me. He was a biter foe when he carried me away and I thought he was my father’s hireling. He was a chance comrade and an imprisoned, when I wanted nothing but to escape. He became a friend and mentor while I discovered the true calling of my heart. But he was never my lover.~
  IF ~~ THEN REPLY ~Do not reply if you do not want to, but I cannot help but ask why? Another woman? Too much ranging to do, no time for gentle talk? His romantic interests lay elsewhere?~ GOTO 313
  IF ~~ THEN REPLY ~Oh.~ GOTO 317
  IF ~~ THEN REPLY ~I am sorry if I have unintentionally stirred painful memories.~ GOTO 318
  IF ~~ THEN REPLY ~And now he is dead. How tragic! If you do not mind, Sime, I have better things to do than talking to you about some rotting corpse.~ GOTO 316
END

IF ~~ THEN BEGIN 320
  SAY ~May be the god’s part of your soul is well fitting what Bhaal had hoped for, but I find that the mortal part of your soul is wanting.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",9)

SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT
END

// LT 10

IF WEIGHT #-94 ~Global("VP_SimeLoveTalk","GLOBAL",10)~ THEN BEGIN 321
  SAY ~I am troubled by one thought lately, <CHARNAME>. My father, he allowed me to follow you without a protest. I was almost certain that he was actually glad, when I took my leave. Why?~
  IF ~Gender(Player1,MALE)~ THEN REPLY ~Sime, I met your father once, I cannot judge his actions. But why should he protest? Do I strike you as a man whom you cannot trust to travel in a company of maidens?~ GOTO 322
  IF ~Class(Player1,PALADIN_ALL)~ THEN REPLY ~Sime, there is a guild war out there, remember? May be he thinks you are safer by my side?~ GOTO 323
  IF ~~ THEN REPLY ~He did not protest your earlier departures, did he?~ GOTO 331
  IF ~~ THEN REPLY ~You think it is a part of some sinister plan of his? May be I should have accepted Bodhi’s offer.~ GOTO 327
  IF ~~ THEN REPLY ~I have a great solution to the problem: you go back to your father and we all will have fewer things to worry about.~ GOTO 330
  IF ~Class(Player1,RANGER_ALL)~ THEN REPLY ~Sime, there is a guild war out there, remember? May be he thinks you are safer by my side?~ GOTO 328
  IF ~!Class(Player1,RANGER_ALL)
!Class(Player1,PALADIN_ALL)~ THEN REPLY ~Sime, there is a guild war out there, remember? May be he thinks you are safer by my side?~ GOTO 329
END

IF ~~ THEN BEGIN 322
  SAY ~No, <CHARNAME>, you are a decent sort and no maiden would feel endangered in your company. You are even pleasant to look upon and sound like a reasonable man. Still, my father always argued against my ranging.~
  IF ~Class(Player1,PALADIN)~ THEN REPLY ~You think that I am a good-looking fellow, flatterer? I am not sure, but I think I might guess his reason. There is a guild war out there, remember? May be he thinks you are safer by my side?~ GOTO 323
  IF ~~ THEN REPLY ~You think it is a part of some sinister plan of his? May be I should have accepted Bodhi’s offer.~ GOTO 327
  IF ~~ THEN REPLY ~I have a great solution to the problem: you go back to your father and we all will have fewer things to worry about.~ GOTO 330
  IF ~Class(Player1,RANGER)~ THEN REPLY ~You think that I am a good-looking fellow, flatterer? I am not sure, but I think I might guess his reason. There is a guild war out there, remember? May be he thinks you are safer by my side?~ GOTO 328
  IF ~!Class(Player1,RANGER)
!Class(Player1,PALADIN)~ THEN REPLY ~You think that I am a good-looking fellow, flatterer? I am not sure, but I think I might guess his reason. There is a guild war out there, remember? May be he thinks you are safer by my side?~ GOTO 329
END

IF ~~ THEN BEGIN 323
  SAY ~My chivalrous warrior, bold and pure, I am sure that he took it into account. Nowhere I am safer than with you and your valorous friends. Still, my father always argued against my ranging.~
  IF ~~ THEN REPLY ~You worry yourself needlessly, my Lady. Now, let’s continue on.~ GOTO 324
  IF ~~ THEN REPLY ~Even if there is some dark design behind Aran’s actions, calm yourself. We shall avoid any trap he might be setting.~ GOTO 325
  IF ~~ THEN REPLY ~You are a member of my brave party, Sime, and in my heart I place you among my most cherished friends.  Together we shall strike for righteousness! Stay close to me and worry not about Aran’s plots.~ GOTO 326
END

IF ~~ THEN BEGIN 324
  SAY ~I guess, you are right. I must be thinking too suspiciously of my father. After all, Aran has never tried to use me in his designs before. Why should he now? I am sorry for wasting your time with my doubts. It is just I would not want to hurt you in any way. The one who is warned is safe, they say.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",11)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 325
  SAY ~Your words have cheered me up. I must be thinking too low of my father. After all, Aran has never tried to use me in his designs before. Why should he now? I am sorry for wasting your time with my doubts. It is just I would not want to hurt you in any way. The one who is warned is safe, they say.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",11)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 326
  SAY ~You are very kind. It is just I would not want to hurt you in any way. The one who is warned is safe, they say. And you know what, <CHARNAME>? I would gladly stay very near you.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",11)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 327
  SAY ~No, you should not have. My father is a dark man, but he has a code of honour of a sort and he is a living being. The rival guild mistress has neither of those qualities. Aran might have some sort of hidden design or he may not. But she is your enemy for sure, an enemy to anybody of flesh and blood. She is hatred incarnate. Fear her, <CHARNAME>.~
  IF ~Class(Player1,PALADIN)~ THEN REPLY ~Speaking of Bodhi. Here is a reason for you. There is a guild war out there, remember? May be Aran thinks that you are safer by my side?~ GOTO 323
  IF ~Class(Player1,RANGER)~ THEN REPLY ~Speaking of Bodhi. Here is a reason for you. There is a guild war out there, remember? May be Aran thinks that you are safer by my side?~ GOTO 328
  IF ~!Class(Player1,RANGER)
!Class(Player1,PALADIN)~ THEN REPLY ~Speaking of Bodhi. Here is a reason for you. There is a guild war out there, remember? May be Aran thinks that you are safer by my side?~ GOTO 329
  IF ~~ THEN REPLY ~I have a great solution to the problem: you go back to your father and we all will have fewer things to worry about.~ GOTO 330
END

IF ~~ THEN BEGIN 328
  SAY ~My noble <PRO_BROTHERSISTER>, I am sure that he took it into account. I am among valiant friends when I travel with you. Still, my father always argued against my ranging.~
  IF ~~ THEN REPLY ~You worry yourself needlessly, Sime. Now, let’s continue on.~ GOTO 324
  IF ~~ THEN REPLY ~Even if there is some dark design behind Aran’s actions, calm yourself. We shall avoid any trap he might be setting. Besides, I do not think Aran will use his own daughter as a tool in his games.~ GOTO 325
  IF ~~ THEN REPLY ~Sime, whatever it is, you and I will be able to deal with it in time. I trust you and I know you to be my kindred spirit and a valorous warrior. May be Aran had finally seen that you can take care of yourself and others and that’s why he did not argue? Stay close to me, my friend and worry not about Aran’s plots.~ GOTO 326
END

IF ~~ THEN BEGIN 329
  SAY ~<CHARNAME>, I am sure that he took it into account. I am among valiant friends when I travel with you. Still, my father always argued against my ranging.~
  IF ~~ THEN REPLY ~You worry yourself needlessly, Sime. Now, let’s continue on.~ GOTO 324
  IF ~~ THEN REPLY ~Even if there is some dark design behind Aran’s actions, calm yourself. We shall avoid any trap he might be setting. Besides, I do not think Aran will use his own daughter as a tool in his games.~ GOTO 325
  IF ~~ THEN REPLY ~You are one of my friends, Sime. I know you for a valorous warrior. May be Aran had finally seen that you can take care of yourself and others and that’s why he did not argue? In any case, stay close to me, Sime, and worry not about Aran’s plots.~ GOTO 326
END

IF ~~ THEN BEGIN 330
  SAY ~If you think that it is a solution, then so be it.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",11)
SetGlobal("Kicked_Out","GLOBAL",1)
ChangeAIScript("",DEFAULT)
SetLeavePartyDialogFile()
LeaveParty()
EscapeAreaMove("AR0307",4642,2000,0)~ EXIT
END

IF ~~ THEN BEGIN 331
  SAY ~Yes, my father always argued against my ranging.~
  IF ~Class(Player1,PALADIN)~ THEN REPLY ~I am not sure, but I think I might guess his reason. There is a guild war out there, remember? May be he thinks you are safer by my side? ~ GOTO 323
  IF ~Class(Player1,RANGER)~ THEN REPLY ~I am not sure, but I think I might guess his reason. There is a guild war out there, remember? May be he thinks you are safer by my side? ~ GOTO 328
  IF ~!Class(Player1,RANGER)
!Class(Player1,PALADIN)~ THEN REPLY ~I am not sure, but I think I might guess his reason. There is a guild war out there, remember? May be he thinks you are safer by my side?~ GOTO 329
  IF ~~ THEN REPLY ~You think it is a part of some sinister plan of his? May be I should have accepted Bodhi’s offer.~ GOTO 327
  IF ~~ THEN REPLY ~I have a great solution to the problem: you go back to your father and we all will have fewer things to worry about.~ GOTO 330
END

// LT6 12

IF WEIGHT #-93 ~Global("VP_SimeLoveTalk","GLOBAL",12)~ THEN BEGIN 332
  SAY ~(*Sime stands still for a moment, facing the wind, her locks flying wild around her face. Then she smiles and turns to you.*)

Do you like my new hairdo? I have the best hairdresser in the world.~ [SIME6_1]
  IF ~~ THEN REPLY ~Sime, all I see is you, facing gusts of wind. Not that you do not look pretty, with your hair flying, but what sort of hairdo is that?~ GOTO 333
  IF ~~ THEN REPLY ~Wind will be your hairdresser then?~ GOTO 333
  IF ~~ THEN REPLY ~Ah? What?~ GOTO 341
  IF ~~ THEN REPLY ~Why do I get a disturbing feeling that the next thing you will ask me will be if you look fat in your armor?~ GOTO 340
END

IF ~~ THEN BEGIN 333
  SAY ~Northern wind hairdo - the style I prefer to any else.~
  IF ~~ THEN REPLY ~I like your style, Sime. I always wanted to meet a woman who looks lovely without an effort.~ GOTO 334
  IF ~~ THEN REPLY ~Now if you would only cut your hair, make some of those little curls whatever they call them, and put some make up on, then I’d say you improved your appearance. Letting the wind to make a mess of your hair will not do anything for your looks.~ GOTO 339
  IF ~~ THEN REPLY ~Why do I get a disturbing feeling that the next thing you will ask me will be if you look fat in your armor?~ GOTO 340
END

IF ~~ THEN BEGIN 334
  SAY ~I think you have just presented me with a challenge. I should take some time and help you to brush up you skills in gallant talk.~
  IF ~~ THEN REPLY ~You have my permission to tutor me in gallant matters, Madam.~ GOTO 335
  IF ~~ THEN REPLY ~Sime, I am eloquent enough with ladies who are of interest to me. You are not one of them. Sorry, but at some point I had to be plain, since you do not understand more subtle hints.~ GOTO 336
  IF ~~ THEN REPLY ~That will be not needed, Sime.~ GOTO 337
  IF ~~ THEN REPLY ~I see it as a challenge. I am going to prove you that I have fine knowledge of the science of tender passion and its linguistic applications.~ GOTO 338
END

IF ~~ THEN BEGIN 335
  SAY ~I will take this task very close to my heart, <CHARNAME>.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",13)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 336
  SAY ~Honesty is one of your finest qualities, <CHARNAME>. Do not worry, I will leave you alone.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",13)
~ EXIT
END

IF ~~ THEN BEGIN 337
  SAY ~Oh, I see. I think, I get the hint.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",13)
~ EXIT
END

IF ~~ THEN BEGIN 338
  SAY ~I will be waiting for a demonstration... impatiently.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",13)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 339
  SAY ~I am afraid we have different idea on beauty.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",13)
~ EXIT
END

IF ~~ THEN BEGIN 340
  SAY ~I will not, do not worry.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",13)
~ EXIT
END

IF ~~ THEN BEGIN 341
  SAY ~(*Laughs*) I noticed that you were watching me and I fished for a compliment from you, silly.~
  IF ~~ THEN REPLY ~Oh, a compliment? The Lady’s desire will be granted then. I like your style, Sime. I always wanted to meet a woman who looks lovely without an effort.~ GOTO 334
  IF ~~ THEN REPLY ~Now if you would only cut your hair, make some of those little curls whatever they call them, and put some make up on, then I’d say you improved your appearance. Letting the wind to make a mess of your hair will not do anything for your looks.~ GOTO 339
  IF ~~ THEN REPLY ~Why do I get a disturbing feeling that the next thing you will ask me will be if you look fat in your armor?~ GOTO 340
  IF ~OR(3)
Class(Player1,FIGHTER)
Class(Player1,PALADIN)
Class(Player1,RANGER)~ THEN REPLY ~Sorry, Sime the rough lips of this warrior are unaccustomed to saying gallant nonsense. ~ GOTO 334
END

//LT 14

IF WEIGHT #-92 ~Global("VP_SimeLoveTalk","GLOBAL",14)~ THEN BEGIN 342
  SAY ~It is a pleasing thing to get some rest at last. The day was long and the battles were many, but it is done, the fire is warm, and no danger is near. Come, sit by me and I shall sooth your hurts and heal your wounds.~
  IF ~~ THEN REPLY ~I feel quite well, Sime. The day’s work is done, but did not we decide to exercise in courtly speech? Shall I start my lesson now?~ GOTO 343
  IF ~~ THEN REPLY ~My wounds are all healed, Sime... do you know what I appreciate about a fire the most... It is the way it softens features and makes our hearts gentler. About our lesson in gallant talk my Lady - is there a better time for it?~ GOTO 343
  IF ~~ THEN REPLY ~Sime, all I need is a good night’s sleep. Just leave me where I am.~ GOTO 354
END

IF ~~ THEN BEGIN 343
  SAY ~There will never be better time. So lead the way, <CHARNAME>.~
  IF ~~ THEN REPLY ~To prove to my Lady that I am skilled in gentle matters I shall sing a song of love and let’s see if the Lady can continue. Will you play this little game with me, Sime?~ GOTO 345
  IF ~Gender(Player1,FEMALE)~ THEN REPLY ~On the second thought it is too taxing. I mean to talk and whatever. Can I just kiss you and buy you a dozen of crimson rodelias if we happen to pass by a flower shop?~ GOTO 344
  IF ~Gender(Player1,MALE)~ THEN REPLY ~On the second thought it is too taxing. I mean to talk and whatever. Can I just kiss your hand and buy you a dozen of crimson rodelias if we happen to pass by a flower shop?~ GOTO 344
  IF ~OR(3)
Class(Player1,FIGHTER)
Class(Player1,PALADIN)
Class(Player1,RANGER)~ THEN REPLY ~I am an old soldier and I rarely speak the words of love, but I shall sing a song about it and let’s see if you can continue. Will you play this little game with me, Sime?~ GOTO 345
END

IF ~~ THEN BEGIN 344
  SAY ~Rest then, <CHARNAME>. And do not overexert yourself by looking for flowers.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 345
  SAY ~I was starting to wonder when I would hear at last anything more gentle than a battle song from you, <CHARNAME>. You seem to avoid what feeds so many others of your calling. I like the game, <CHARNAME>, it will lighten our hearts and will ease our minds.~
  IF ~~ THEN REPLY ~The fountains mingle with the river
And the rivers with the ocean, 
The winds of heaven mix for ever
With a sweet emotion...          ~ GOTO 346
  IF ~~ THEN REPLY ~Ahem... Love, love me do,
You know I love you...~ GOTO 352
  IF ~~ THEN REPLY ~I love a maiden young as spring,
Her eyes bloom as flowers green
Her hair sways as golden wheat
Her lips are rubies sweet as sin.~ GOTO 348
END

IF ~~ THEN BEGIN 346
  SAY ~Nothing in the world is single,
All things by a law divine
In one another’s being mingle-
Why not I with thine?

What a lovely song. What will you try next?~
  IF ~~ THEN REPLY ~Ahem... Love, love me do,
You know I love you...~ GOTO 347
  IF ~~ THEN REPLY ~I love a maiden young as spring
Her eyes bloom as flowers green
Her hair sways as golden wheat
Her lips are rubies sweet as sin.~ GOTO 348
  IF ~~ THEN REPLY ~Nothing. I think I am too tired to continue the game.~ GOTO 351
END

IF ~~ THEN BEGIN 347
  SAY ~I’ll always be true,
So please, love me do!

What a lovely song. What will you try next?~
  IF ~~ THEN REPLY ~I love a maiden young as spring
Her eyes bloom as flowers green
Her hair sways as golden wheat
Her lips are rubies sweet as sin.~ GOTO 348
  IF ~~ THEN REPLY ~Nothing. I think I am too tired to continue the game.~ GOTO 351
END

IF ~~ THEN BEGIN 348
  SAY ~I do not know this song, <CHARNAME>. But I would like to hear the rest of it.~
  IF ~~ THEN REPLY ~Of course you do not know it! I tricked you, I wrote it myself today. Here is the rest:
                                 
To you alone I shall tell
That Lady wears silver bell,
You won’t see it when she passes 
But you will hear when she laughs.~ GOTO 349
  IF ~~ THEN REPLY ~I guess you lost then, Sime. Do I get a prize?~ GOTO 350
  IF ~~ THEN REPLY ~Never mind, I think I am too tired to continue the game.~ GOTO 351
END

IF ~~ THEN BEGIN 349
  SAY ~Oh, but it is wonderful. Makes me wonder though who the Lady in question might be.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 350
  SAY ~I think I shall kiss you as a reward. For

...the sunlight clasps the earth,
And the moonbeams kiss the sea-
What are all these kissings worth,
If thou kiss not me?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 351
  SAY ~Already? I thought we just started. Well, it was amusing and I must admit that you sounded very sweet. Good night, <CHARNAME>.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 352
  SAY ~I’ll always be true,
So please, love me do!

What a lovely song. What will you try next?~
  IF ~~ THEN REPLY ~The fountains mingle with the river
And the rivers with the ocean, 
The winds of heaven mix for ever
With a sweet emotion...          ~ GOTO 353
  IF ~~ THEN REPLY ~I love a maiden young as spring
Her eyes bloom as flowers green
Her hair sways as golden wheat
Her lips are rubies sweet as sin.~ GOTO 348
  IF ~~ THEN REPLY ~Nothing. I think I am too tired to continue the game.~ GOTO 351
END

IF ~~ THEN BEGIN 353
  SAY ~Nothing in the world is single,
All things by a law divine
In one another’s being mingle-
Why not I with thine?

What a lovely song. What will you try next?~
  IF ~~ THEN REPLY ~Nothing. I think I am too tired to continue the game.~ GOTO 351
  IF ~~ THEN REPLY ~I love a maiden young as spring
Her eyes bloom as flowers green
Her hair sways as golden wheat
Her lips are rubies sweet as sin.~ GOTO 348
END

IF ~~ THEN BEGIN 354
  SAY ~Sleep tight then.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",15)

RestParty()~ EXIT
END

IF ~~ THEN BEGIN 355
  SAY ~At least you are honest.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",15)

RestParty()~ EXIT
END

IF ~~ THEN BEGIN 356
  SAY ~You are my soul mate then? But sometimes loneliness of the woods is too much for a person to bare. Trust me, I know. One needs friends even if he chooses solitude.~
  IF ~~ THEN REPLY ~I know, Sime. I am glad to have trusted companions with me. I would imagine some would come by to trade a tale or two into my humble abode far away.~ GOTO 357
  IF ~~ THEN REPLY ~Solitude is fine with me, I never feel lonely. And I am so tired of you talking! ~ GOTO 355
END

IF ~~ THEN BEGIN 357
  SAY ~I know, that I would.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

RestParty()~ EXIT
END

IF ~~ THEN BEGIN 358
  SAY ~I have no such place. I envy the feeling you have for Candlekeep. Do you think I might visit one day with you there?~
  IF ~~ THEN REPLY ~You would not like Candlekeep, Sime. It’s full of old scholars and the life centers around the library...~ GOTO 359
  IF ~~ THEN REPLY ~Why not? But it is difficult to gain an entry. You have to pay 10,000 gold pieces or carry a book of particular value. It is really a strange rule, but it is effective in keeping almost everyone out and in expanding the library.~ GOTO 360
END

IF ~~ THEN BEGIN 359
  SAY ~I like libraries. I visited once an Edificant library with Darriel and another time we went through Silverymoon. I love the feeling of ages and peoples of old watching you from the shelves. I think I rather fancy the idea to visit Candlekeep.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

RestParty()~ EXIT
END

IF ~~ THEN BEGIN 360
  SAY ~If you’d live there maybe you can help me to get over the city wall or something. I do not own much.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

RestParty()~ EXIT
END

IF ~~ THEN BEGIN 361
  SAY ~I am not sure. I avoid interfering with the business of gods, yet I would not like the taint to change you into a merciless killing machine. I’ve become a ranger against my father’s will. It must be a much harder battle for you.~
  IF ~!Alignment(Player1,CHAOTIC_EVIL)
!Alignment(Player1,LAWFUL_EVIL)
!Alignment(Player1,NEUTRAL_EVIL)~ THEN REPLY ~I fear it myself Sime and I watch my heart carefully. I will not let Bhaal take over. ~ GOTO 362
  IF ~~ THEN REPLY ~What’s your problem, ranger? I am Bhaal’s spawn and I am not as shy of the callings of my blood.~ GOTO 363
  IF ~~ THEN REPLY ~You are being too grim. I do not notice any evil influences in me. Surely men point their fingers and call me names, and maniacs like Irenicus hunt me, and I have nightmares sometimes... Oops, I guess there is something evil around me, but I shall be all right.~ GOTO 364
END

IF ~~ THEN BEGIN 362
  SAY ~I am surely glad to hear that.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

RestParty()~ EXIT
END

IF ~~ THEN BEGIN 363
  SAY ~Indeed, my advice was useless then.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",15)

RestParty()~ EXIT
END

IF ~~ THEN BEGIN 364
  SAY ~I think I worried needlessly. You are far too cheerful to be overtaken by the God of Murder.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",15)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

RestParty()~ EXIT
END

// LT 16

IF WEIGHT #-91 ~Global("VP_SimeLoveTalk","GLOBAL",16)~ THEN BEGIN 365
  SAY ~(*You hear her quiet voice, and suddenly you listen more carefully and you can distinguish her words.*).

Forest Maiden, tonight a thousand of young acolytes will ask for you to cast your glance their way, a hundred of priests dressed in ritual robes will pray to you, a dozen of sturdy rangers will whisper your name among their many toils in hope for your blessing. And among many words that reach your ears tonight, I, Sime Linvail ask you to listen to my plea. Forest Maiden, my prayer is not for me, but for a <PRO_MANWOMAN> of valor, a <PRO_MANWOMAN> tormented. <PRO_HESHE> is cursed often for no other fault than <PRO_HISHER> blood, <PRO_HESHE> has endured many trials, and I fear will face many more before <PRO_HESHE> is through. Bless <PRO_HIMHER>, Mielikki and give <PRO_HIMHER> some hope.~
  IF ~~ THEN REPLY ~Sime? Were you prayers... for me?~ GOTO 366
  IF ~~ THEN REPLY ~(*Stay silent*)~ GOTO 374
  IF ~~ THEN REPLY ~Sime, what do you think you are doing?~ GOTO 366
END

IF ~~ THEN BEGIN 366
  SAY ~You are awake? (*Laughs*) A stupid question, really. Of course you are. I was praying for you. You... do not mind, do you?~
  IF ~~ THEN REPLY ~I do not, but it is not really necessary. My god watches over me, Sime.~ GOTO 367
  IF ~~ THEN REPLY ~No, of course not. Thank you, Sime. I did not know you cared so much for me.~ GOTO 372
  IF ~~ THEN REPLY ~Sime, do not you understand? I am not tormented, I am not cursed! I am who I am, a child of Bhaal, and I am ready to face my destiny. I do not need your prayers or your pity!~ GOTO 371
  IF ~~ THEN REPLY ~My kind Lady. Thank you.~ GOTO 373
END

IF ~~ THEN BEGIN 367
  SAY ~I know that, <CHARNAME>. But I fear for you sometimes.~
  IF ~~ THEN REPLY ~Do you fear for me or do you fear of me?~ GOTO 368
  IF ~~ THEN REPLY ~Do not fear for me, Sime. I am not tormented, I am not cursed! I am who I am, a child of Bhaal, and I am ready to face my destiny. I do not need your prayers or your pity!~ GOTO 371
  IF ~~ THEN REPLY ~You know, that’s getting too weird. Let me say you a "good night" and let’s forget the whole thing.~ GOTO 370
END

IF ~~ THEN BEGIN 368
  SAY ~I never feared you.~
  IF ~~ THEN REPLY ~Some will say you should.~ GOTO 369
  IF ~~ THEN REPLY ~I am glad to hear that, Sime. It is pleasant for a change. With all those rumors floating around Athkatla, I guess that I am mentioned more often in a curse than in a prayer.~ GOTO 369
  IF ~~ THEN REPLY ~You know, that’s getting too weird. Let me say you a "good night" and let’s forget the whole thing.~ GOTO 370
END

IF ~~ THEN BEGIN 369
  SAY ~They can say all they want, those others. Sometimes I wish to cast a silence spell when I hear old crows trading dark stories about you. But I am no crow, I know you and I trust my heart. I am not afraid of you, <CHARNAME>.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",17)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 370
  SAY ~Good night then.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",17)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 371
  SAY ~You cannot forbid me to feel. I did not know that the fact that someone is concerned about your wellbeing would upset you so. But have it your own way.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",17)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 372
  SAY ~I do care for you, <CHARNAME>. And I fear for you sometimes.~
  IF ~~ THEN REPLY ~Do you fear for me or do you fear of me?~ GOTO 368
  IF ~~ THEN REPLY ~Do not fear for me, Sime. I am not tormented, I am not cursed! I am who I am, a child of Bhaal, and I am ready to face my destiny. I do not need your prayers or your pity!~ GOTO 371
  IF ~~ THEN REPLY ~You know, that’s getting too weird. Let me say you a "good night" and let’s forget the whole thing.~ GOTO 370
END

IF ~~ THEN BEGIN 373
  SAY ~<CHARNAME>, do not thank me. I did nothing out of the ordinary. I am a priest and it is my duty to pray for those I care for and I fear for.~
  IF ~~ THEN REPLY ~Do you fear for me or do you fear of me?~ GOTO 368
  IF ~~ THEN REPLY ~Do not fear for me, Sime. I am not tormented, I am not cursed! I am who I am, a child of Bhaal, and I am ready to face my destiny. I do not need your prayers or your pity!~ GOTO 371
  IF ~~ THEN REPLY ~You know, that’s getting too weird. Let me say you a "good night" and let’s forget the whole thing.~ GOTO 370
END

IF ~~ THEN BEGIN 374
  SAY ~(*Sime comes near you and brushes hair aside from your forehead gently*)~
  IF ~~ THEN REPLY ~(*Catch her hand and squeeze her fingers*) Sime? Were you prayers... for me?~ GOTO 366
  IF ~~ THEN REPLY ~(*Stay silent*)~ GOTO 375
  IF ~~ THEN REPLY ~Sime, that’s enough! You are acting like a mother hen! I do not need your prayers or your pity!~ GOTO 371
END

IF ~~ THEN BEGIN 375
  SAY ~(*Sime walks away*) ~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",17)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

// LT 18

IF WEIGHT #-90 ~Global("VP_SimeLoveTalk","GLOBAL",18)~ THEN BEGIN 376
  SAY ~It is strange how things that are so simple suddenly become more complex. When I was young, the Guild members were men visiting my father, often giving me a passing glance, sometimes joking with me.~ [SIME11_1]
  IF ~~ THEN GOTO 377
END

IF ~~ THEN BEGIN 377
  SAY ~Yet now I know that some of them are vicious assassins, others are petty thieves, and the rest are so wicked and lie so often that I do not have a clue how they acquire the coins filling their pockets. I happened to run across some of my father’s associates when ranging. It was not pleasant.~
  IF ~Class(Player1,THIEF)~ THEN REPLY ~And now you are travelling with one. That is what you are trying to say? You knew it when you joined in with me. What has changed?~ GOTO 378
  IF ~~ THEN REPLY ~Oh, Sime, my poor noble-hearted Sime! I know how you feel. It is not easy to say sometimes, what is a good or is an evil thing to do.~ GOTO 386
  IF ~~ THEN REPLY ~Sime, you do what you must do, no matter if it pleases you or not. You are a ranger, a keeper of law and order, and defender of the weak.~ GOTO 390
  IF ~~ THEN REPLY ~Of course, of course. Simple things are complex, complex things are simple. Can we go now?~ GOTO 394
END

IF ~~ THEN BEGIN 378
  SAY ~What has changed? I have been thinking a lot about you lately. You are... you are different from greedy and merciless assassins, and you do not take the last possessions from the poor. You are furtive, cavalier yet cautious, and your avaricious personality determined your past. But somehow, you are yet unspoiled by the rogue’s ways.~
  IF ~~ THEN REPLY ~I am a rogue, Sime, and probably will always be a rogue.~ GOTO 379
  IF ~~ THEN REPLY ~You are trying to... embellish me?~ GOTO 383
  IF ~~ THEN REPLY ~May be I am a vagabond, but a charming one. You like me no matter what do not you?~ GOTO 384
  IF ~~ THEN REPLY ~Enough of this rubbish, Sime. Let’s go.~ GOTO 385
END

IF ~~ THEN BEGIN 379
  SAY ~I know. If there is no hope for you to engage into a more honorable activity, promise me at least that you will not forsake this odd code of honor you now have.~
  IF ~~ THEN REPLY ~This world is not made for keeping promises, Sime. It changes at every turn of the hourglass. I’d rather not bind myself with empty words.~ GOTO 380
  IF ~~ THEN REPLY ~I will not change, Sime. I promise. With all this talk about my colleagues, who are so prone to make things theirs... Tell me, Sime, did anyone attempt to steal your heart?~ GOTO 381
END

IF ~~ THEN BEGIN 380
  SAY ~You are right, words are empty. It is time for us to deal with something more material.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",19)~ EXIT
END

IF ~~ THEN BEGIN 381
  SAY ~Oh, an attempt was made recently, I think.~
  IF ~~ THEN GOTO 382
END

IF ~~ THEN BEGIN 382
  SAY ~But do not look for the culprit among the members of the Guild. Look closer... (*Quietly*). You will find <PRO_HIMHER> in the looking glass.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",19)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 383
  SAY ~I do not. I know that there is no hope for you to engage into a more honorable activity. Promise me at least that you will not forsake this odd code of honor you now have.~
  IF ~~ THEN REPLY ~This world is not made for keeping promises, Sime. It changes at every turn of the hourglass. I’d rather not bind myself with empty words.~ GOTO 380
  IF ~~ THEN REPLY ~I will not change, Sime. I promise. With all this talk about my colleagues, who are so prone to make things theirs? Tell me, Sime, did anyone attempt to steal your heart?~ GOTO 381
END

IF ~~ THEN BEGIN 384
  SAY ~I like you the way you are now, yes. I know that there is no hope for you to engage into a more honorable activity. Promise me at least that you will not forsake this odd code of honor you now have.~
  IF ~~ THEN REPLY ~This world is not made for keeping promises, Sime. It changes at every turn of the hourglass. I’d rather not bind myself with empty words.~ GOTO 380
  IF ~~ THEN REPLY ~I will not change, Sime. I promise. With all this talk about my colleagues, who are so prone to make things theirs? Tell me, Sime, did anyone attempt to steal your heart?~ GOTO 381
END

IF ~~ THEN BEGIN 385
  SAY ~Oh, so my opinion is rubbish? How very sweet of you to let me know that. I will make sure that you are not bothered by it anymore.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",19)~ EXIT
END

IF ~~ THEN BEGIN 386
  SAY ~You are right, <CHARNAME>. I often do not know if coming to the Guild to see my father is good or bad for me. I think it is a good thing though. I love my father and love can never be a bad thing, can it?~
  IF ~~ THEN REPLY ~I am no expert on love. Do ask someone else, please. Actually, it will be nice if you direct all of your questions to someone else.~ GOTO 387
  IF ~~ THEN REPLY ~Love can never be a bad thing, Sime. With all this talk about Shadow Thieves, who are so prone to make things theirs, I have meant to ask a question of you for some time... Is it just because of Aran that you visit the Guild? Or did some charming rogue steal your heart?~ GOTO 388
  IF ~~ THEN REPLY ~If I were you, I would not come see Aran. But you are the only one who can decide something like that. With all this talk about Shadow Thieves, who are so prone to make things theirs, I have meant to ask question of you for some time... Is it just because of Aran that you visit the Guild? Or did some charming rogue steal your heart?~ GOTO 389
END

IF ~~ THEN BEGIN 387
  SAY ~I will in the future.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",19)~ EXIT
END

IF ~~ THEN BEGIN 388
  SAY ~It comforts me that you think so. As for your question, an attempt was made recently, I think.~
  IF ~~ THEN GOTO 382
END

IF ~~ THEN BEGIN 389
  SAY ~I lack your straightforwardness, I am afraid. As for your question, an attempt was made recently, I think.~
  IF ~~ THEN GOTO 382
END

IF ~~ THEN BEGIN 390
  SAY ~I am true to my vows to Mielikki. However, I would prefer that it not be my own father and his associates from whom I need to defend people.~
  IF ~~ THEN REPLY ~May be you should go away from Amn one day and leave the past behind? With some decent man may be? Or... forgive me if I am being too intrusive, but I wonder if it is just because of Aran that you visit the Guild? Or did some charming rogue steal your heart?~ GOTO 391
  IF ~~ THEN REPLY ~Duty is sacred and vows cannot be broken. I am glad we talked about it. If you ever feel like you are about to falter, do seek me out, Sime. Or another loyal friend. But tell me, Sime, is your father your only connection to the Guild? Or did some charming rogue steal your heart and cause you all this pain? Because if one did, I am going to take his head off his shoulders.~ GOTO 392
  IF ~~ THEN REPLY ~Aran is not the best father by far, but you could have gotten worse. Just think, as far as fathers are concerned, compared to me, you definitely lucked out.  Oh, you have finally smiled? With all this talk about Shadow Thieves, who are so prone to make things theirs, I have meant to ask a question of you for some time... Is it just because of Aran that you visit the Guild? Or did some charming rogue steal your heart?~ GOTO 393
END

IF ~~ THEN BEGIN 391
  SAY ~I tried so many times, <CHARNAME>. Did not I tell you of my travels? I am tired of running. As for your question, an attempt was made recently, I think.~
  IF ~~ THEN GOTO 382
END

IF ~~ THEN BEGIN 392
  SAY ~I will be sure to seek you out, <CHARNAME>. As for your question, an attempt was made recently, I think.~
  IF ~~ THEN GOTO 382
END

IF ~~ THEN BEGIN 393
  SAY ~If you can make a joke about your father, then indeed, I should probably learn from you and take it less seriously. After all, I am not my father. As for your question, an attempt was made recently, I think.~
  IF ~~ THEN GOTO 382
END

IF ~~ THEN BEGIN 394
  SAY ~Sure, let us go. I am ranting far too much.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",19)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

// LT 20

IF WEIGHT #-90 ~Global("VP_SimeLoveTalk","GLOBAL",20)~ THEN BEGIN 395
  SAY ~I cannot believe it! Come, <CHARNAME>, look at this! I have never seen it grow in these parts and never does it bloom at this time of the year. It is a small miracle, this flower.~ [SIME12_1]
  IF ~OR(2)
Class(Player1,DRUID_ALL)
Class(Player1,RANGER_ALL)~ THEN REPLY ~Why, I think it is Suna’s Bloom. Is not it? I have not seen one before.~ GOTO 396
  IF ~OR(2)
Class(Player1,MAGE_ALL)
Class(Player1,SORCERER)~ THEN REPLY ~Hmm, what do we have here? I believe that it’s commonly called "Suna’s Blessing" or Solanum Carolinense Eunwoe in Elvish. Dwarves call it a Lay Flower and Forest Gnomes in Tethyr know it under the name of Auglim Leaf. The Halfing name would be... would be...~ GOTO 408
  IF ~~ THEN REPLY ~A nice enough purple flower it is, Sime. But a miracle?~ GOTO 409
  IF ~~ THEN REPLY ~Ahem, what is all this noise about? A couple leaves and few purple buds on a stem? Women!~ GOTO 409
  IF ~~ THEN REPLY ~Sime, has anyone told you before that you have an impossible voice? I, for my part, do not wish to hear it more often than absolutely necessary.~ GOTO 410
END

IF ~~ THEN BEGIN 396
  SAY ~It is a very rare plant. I am surprised you know of it. Do you know why it is called Suna’s Bloom?~
  IF ~OR(3)
Class(Player1,DRUID)
Class(Player1,RANGER)
Class(Player1,MAGE)~ THEN REPLY ~I have heard tales, Sime. Is it true that a freshly picked flower of Suna’s Bloom will make one more attractive to the opposite sex?~ GOTO 397
  IF ~~ THEN REPLY ~So, why it is called Suna’s Bloom? Sounds rather intriguing.~ GOTO 406
  IF ~CheckStatGT(Player1,12,WIS)~ THEN REPLY ~I have a feeling that you will tell me whether I want to know or not. Speak, Sime, I am all ears.~ GOTO 406
  IF ~~ THEN REPLY ~I am not sure I want to know. Suna is not a deity I am prone to worship.~ GOTO 407
END

IF ~~ THEN BEGIN 397
  SAY ~So the scrolls say. We can see if it is true or not. Here, let me pick it and attach it to your cloak. Then I can tell you the effect.~
  IF ~~ THEN REPLY ~If it is as rare a flower as you say, it is better to leave it growing, Sime. I reckon I am attractive enough without it.~ GOTO 398
  IF ~~ THEN REPLY ~Among our gloomy days full of spilt blood and endless battles, this flower reminds me of the lighter, gentler side of life. I will wear the Bloom, not to appear more attractive, but to honor Love.~ GOTO 399
  IF ~~ THEN REPLY ~Let’s see if the scrolls lie.~ GOTO 399
  IF ~~ THEN REPLY ~That sounds like an interesting idea. But the finder is the keeper. Sime shall wear the bloom and I shall see how much more attractive she can become.~ GOTO 403
  IF ~~ THEN REPLY ~My Lady, among our gloomy days full of spilt blood and endless battles, this flower reminds me of the lighter, gentler side of life. And so do you, Sime Linvail. Please, humor me and wear the bloom.~ GOTO 403
END

IF ~~ THEN BEGIN 398
  SAY ~You are as wise as you are handsome, <CHARNAME>. Let the flower grow unharmed.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",21)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 399
  SAY ~Here, the flower is on your cloak. Now I shall announce my judgement.~
  IF ~~ THEN REPLY ~So what do you think, my gentle judge? ~ GOTO 400
  IF ~~ THEN REPLY ~Sime, if the effect is too strong, I will take it off. Speak to me!~ GOTO 400
  IF ~~ THEN REPLY ~Eh, how is it?~ GOTO 400
END

IF ~~ THEN BEGIN 400
  SAY ~You always appeared handsome in my eyes, but the scrolls do not lie, <CHARNAME>. You look incredible: there is a glow about your face and your orbs shine; the troubles are wiped from your forehead and even your voice sounds sweeter to me. I am certainly glad the enchantment does not last long.~
  IF ~~ THEN REPLY ~Why do not you want the enchantment to last, Sime?~ GOTO 401
  IF ~~ THEN REPLY ~I think I will take the flower off then. I feel odd.~ GOTO 402
END

IF ~~ THEN BEGIN 401
  SAY ~I’ll let you guess that one on your own.~
  IF ~~ THEN DO ~GiveItemCreate("VPBela",Player1,1,0,0)
ActionOverride(Player1,UseItem("VPBela",Myself))
SetGlobal("VP_SimeLoveTalk","GLOBAL",21)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 402
  SAY ~It is too late. The spell is on you and it cannot be reversed. Do not worry, in few short hours you will be your old self again. And I promise to guard you against any unwanted attention.~
  IF ~~ THEN DO ~GiveItemCreate("VPBela",Player1,1,0,0)
ActionOverride(Player1,UseItem("VPBela",Myself))
SetGlobal("VP_SimeLoveTalk","GLOBAL",21)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 403
  SAY ~If you wish. Watch me very closely, <CHARNAME>. I put the flower on... So?~
  IF ~~ THEN REPLY ~Words rarely fail me. But so they do every time I look at you. You are beautiful, Sime, with or without the Suna’s Bloom.~ GOTO 404
  IF ~~ THEN REPLY ~You look incredible: there is a glow about your face and your orbs shine; the troubles are wiped from your forehead and even your voice sounds sweeter to me.~ GOTO 404
  IF ~~ THEN REPLY ~(*Shrug*) Yeah, some changes are evident. I guess the scrolls speak truly. We shall go now.~ GOTO 405
END

IF ~~ THEN BEGIN 404
  SAY ~Such gentle words, My Lord, are to be rewarded by a grateful maiden. (*She kisses you gently and runs away giggling*)~
  IF ~~ THEN DO ~GiveItemCreate("VPBela",Myself,1,0,0)
UseItem("VPBela",Myself)
SetGlobal("VP_SimeLoveTalk","GLOBAL",21)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 405
  SAY ~Good to know that we can trust our scholars. (*Laughs*). Oh, I see you are growing impatient. I am coming!~
  IF ~~ THEN DO ~GiveItemCreate("VPBela",Myself,1,0,0)
UseItem("VPBela",Myself)
SetGlobal("VP_SimeLoveTalk","GLOBAL",21)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 406
  SAY ~The scrolls say that a freshly picked flower of Suna’s Bloom will make one attractive to the opposite sex. We can see if it is true or not. Here, let me pick it and attach to your cloak. Then I can tell you the effect.~
  IF ~~ THEN REPLY ~If it is as rare a flower as you say, it is better to leave it growing, Sime. I reckon I am attractive enough without it.~ GOTO 398
  IF ~~ THEN REPLY ~Among our gloomy days full of spilt blood and endless battles, this flower reminds me of the lighter, gentler side of life. I will wear the Bloom, not to appear more attractive, but to honor Love.~ GOTO 399
  IF ~~ THEN REPLY ~Let’s see if the scrolls lie.~ GOTO 399
  IF ~~ THEN REPLY ~That sounds like an interesting idea. But the finder is the keeper. Sime shall wear the bloom and I shall see how much more attractive she can become.~ GOTO 403
  IF ~~ THEN REPLY ~My Lady, among our gloomy days full of spilt blood and endless battles, this flower reminds me of the lighter, gentler side of life. And so do you, Sime Linvail. Please, humor me and wear the bloom.~ GOTO 403
END

IF ~~ THEN BEGIN 407
  SAY ~You do not respect Love? Then you are a fool and a servant of Death.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",21)~ EXIT
END

IF ~~ THEN BEGIN 408
  SAY ~Do not try to remember: there is no name in Halfling speech for this one. It is a very rare plant. I am surprised you know of it. Do you know why it is called Suna’s Bloom?~
  IF ~OR(3)
Class(Player1,DRUID)
Class(Player1,RANGER)
Class(Player1,MAGE)~ THEN REPLY ~I have heard tales, Sime. Is it true that a freshly picked flower of Suna’s Bloom will make one more attractive to the opposite sex?~ GOTO 397
  IF ~~ THEN REPLY ~So, why it is called Suna’s Bloom? Sounds rather intriguing.~ GOTO 406
  IF ~CheckStatGT(Player1,12,WIS)~ THEN REPLY ~I have a feeling that you will tell me whether I want to know or not. Speak, Sime, I am all ears.~ GOTO 406
  IF ~~ THEN REPLY ~I am not sure I want to know. Suna is not a deity I am prone to worship.~ GOTO 407
END

IF ~~ THEN BEGIN 409
  SAY ~It is a very rare plant. And it is called Suna’s Bloom for a reason.~
  IF ~OR(3)
Class(Player1,DRUID)
Class(Player1,RANGER)
Class(Player1,MAGE)~ THEN REPLY ~I have heard tales, Sime. Is it true that a freshly picked flower of Suna’s Bloom will make one more attractive to the opposite sex?~ GOTO 397
  IF ~~ THEN REPLY ~So, why it is called Suna’s Bloom? Sounds rather intriguing.~ GOTO 406
  IF ~CheckStatGT(Player1,12,WIS)~ THEN REPLY ~I have a feeling that you will tell me whether I want to know or not. Speak, Sime, I am all ears.~ GOTO 406
  IF ~~ THEN REPLY ~I am not sure I want to know. Suna is not a deity I am prone to worship.~ GOTO 407
END

IF ~~ THEN BEGIN 410
  SAY ~You will not.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",21)~ EXIT
END

// LT 22

IF WEIGHT #-89 ~Global("VP_SimeLoveTalk","GLOBAL",22)~ THEN BEGIN 411
  SAY ~I am lonely and sad tonight. Faerun feels enormous and cold. See how that little star twinkles and strives to shine, and barely can in this chilly air? So does my heart. It aches because of you. Will you keep me company and warm me up, <CHARNAME>?~
  IF ~~ THEN REPLY ~You are cold? Here, I’ll wrap my cloak around you, it is lined with fur and it is very warm. Sit down closer to the fire and I will get it going in no time. ~ GOTO 412
  IF ~~ THEN REPLY ~I can offer you the comfort of my arms and warmth of my bedroll if you wish, Sime.~ GOTO 413
  IF ~~ THEN REPLY ~Are you trying to say that you... love me? ~ GOTO 414
  IF ~~ THEN REPLY ~I am afraid I cannot Sime. I am sorry, but I am involved with someone else.~ GOTO 423
  IF ~Gender(Player1,FEMALE)~ THEN REPLY ~I am afraid I cannot Sime. I can offer no spark to set your heart aflame this cold evening... I am sorry...~ GOTO 423
END

IF ~~ THEN BEGIN 412
  SAY ~That is not exactly what I meant, but damn, it is pleasant to have someone to take care of me. You are such a wonderful person!  <CHARNAME>, I am attracted to you and it was not your cloak I hoped to have wrapped around my shoulders, but your arms.~
  IF ~~ THEN REPLY ~I can offer you the comfort of my arms and warmth of my bedroll if you wish.~ GOTO 413
  IF ~~ THEN REPLY ~Are you trying to say that you... love me?~ GOTO 414
  IF ~~ THEN REPLY ~I understood you perfectly, Sime. I hope you will understand me. I am involved with someone else.~ GOTO 423
  IF ~Gender(Player1,FEMALE)~ THEN REPLY ~I understood you perfectly, Sime. I hope you will understand me... I am sorry... I can offer no spark to set your heart aflame this cold evening.~ GOTO 423
END

IF ~~ THEN BEGIN 413
  SAY ~Then move and let me lay by your side and shower you with kisses, my sweet lover.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",2)

SetGlobal("VP_SleptSime","GLOBAL",1)
SetGlobal("VP_SimeLoveTalk","GLOBAL",23)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 414
  SAY ~But of course I love you tonight! I fell asleep a moment ago and was dreaming of kissing you when I woke up. I like when my dreams come true in that regard. Is that not enough talk for you, <CHARNAME>? Won’t you hold me and kiss me already?~
  IF ~~ THEN REPLY ~Of course I will. A stone would melt from that devilish look in your eyes, let alone a lover’s heart. Come here, beautiful. ~ GOTO 415
  IF ~~ THEN REPLY ~Tonight? What about on the morrow?~ GOTO 416
  IF ~~ THEN REPLY ~ Actually I was going to discuss the origin of magic in Faerun, the nature of Weave and the descent of Dragons with you... Oh, what in Nine Hells I am talking about? Come here this very moment, enchantress, and let’s make the heavens shake.~ GOTO 421
  IF ~~ THEN REPLY ~You know, it is very sweet of you to offer but I am just too tired. May be another time...~ GOTO 422
END

IF ~~ THEN BEGIN 415
  SAY ~Now, those are the words I wish to hear! Let me lay by your side and shower you with kisses, my sweet lover.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",2)

SetGlobal("VP_SleptSime","GLOBAL",1)
SetGlobal("VP_SimeLoveTalk","GLOBAL",23)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 416
  SAY ~Tomorrow will be another day, <CHARNAME>. We will die or we will live. May be we will love each other again, may be not. Why worry about it? We are together now, that is all that matters.~
  IF ~Gender(Player1,MALE)~ THEN REPLY ~You are right, dear Sime. But I would prefer that you still love me on the morrow.~ GOTO 417
  IF ~Gender(Player1,MALE)~ THEN REPLY ~Why get involved with a thought that will be over in a day or two? I am disappointed that you treat me like this. I hoped that there was something special going on between us.~ GOTO 417
  IF ~~ THEN REPLY ~Yes, I feel it as well, that we live, as each day is our last one. And I want to love a maiden on my last day that is for sure. ~ GOTO 418
  IF ~Gender(Player1,FEMALE)~ THEN REPLY ~You are right, dear Sime. But I would prefer that you still love me on the morrow.~ GOTO 420
  IF ~Gender(Player1,FEMALE)~ THEN REPLY ~Why get involved with a thought that will be over in a day or two? I am disappointed that you treat me like this. I hoped that there was something special going on between us.~ GOTO 420
END

IF ~~ THEN BEGIN 417
  SAY ~I cannot promise you a life-long commitment, a house full of books, flowers, and little ones with me as your wife, <CHARNAME>. But I can give you a night of passion, which you will remember till the evening dawn of your life. Take it or leave it.~
  IF ~~ THEN REPLY ~Of course I will take it. A stone would melt from that devilish look in your eyes, let alone a lover’s heart. Come here, beautiful.~ GOTO 418
  IF ~~ THEN REPLY ~No, Sime, what you are offering is not enough.~ GOTO 419
END

IF ~~ THEN BEGIN 418
  SAY ~Now, those are the words I wish to hear! Let me lay by your side and shower you with kisses, my sweet lover.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",2)

SetGlobal("VP_SleptSime","GLOBAL",1)
SetGlobal("VP_SimeLoveTalk","GLOBAL",23)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 419
  SAY ~Then I shall return into my cold bed alone. Only in the tales of heroes-of-old does one get three chances, <CHARNAME>. With Sime it is only one and you missed it. Sleep tight.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",2)

SetGlobal("VP_SimeLoveTalk","GLOBAL",23)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 420
  SAY ~I cannot promise you a life-long commitment, a house full of books and flowers, <CHARNAME>. But I can give you a night of passion, which you will remember till the evening dawn of your life. Take it or leave it.~
  IF ~~ THEN REPLY ~Of course I will take it. A stone would melt from that devilish look in your eyes, let alone a lover’s heart. Come here, beautiful.~ GOTO 418
  IF ~~ THEN REPLY ~No, Sime, what you are offering is not enough.~ GOTO 419
END

IF ~~ THEN BEGIN 421
  SAY ~Let me lay by your side and shower you with kisses, my sweet lover.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",2)

SetGlobal("VP_SleptSime","GLOBAL",1)
SetGlobal("VP_SimeLoveTalk","GLOBAL",23)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 422
  SAY ~Only in the tales of old does a hero get three chances, <CHARNAME>. With Sime it is only one and you missed it. Sleep tight.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",23)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 423
  SAY ~I wish you every happiness then. ~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",23)
RestParty()~ EXIT
END

// LT 24

IF WEIGHT #-88 ~Global("VP_SimeLoveTalk","GLOBAL",24)~ THEN BEGIN 424
  SAY ~Wake up, m’<PRO_LADYLORD>, the dawn is spreading over the sky! And the woman of the yester eve is up already and her eyes spell trouble for you. Wake up, m’<PRO_LADYLORD>, the world is holding its breath in anticipation of your decisions. Shall we live or shall we not? Shall we love or shan’t we? ~
  IF ~~ THEN REPLY ~No-yet still steadfast, still unchangeable,
Pillow’d upon my fair love’s ripening breast,
To feel for ever its soft fall and swell,
Awake for ever in a sweet unrest,
Still, still to hear her tender-taken breath,
And so live ever-or else swoon to death.~ GOTO 425
  IF ~~ THEN REPLY ~You know, Sime, the last time a maiden awoke me yelling, it was Imoen and I was caged in Irenicus’ Dungeon, after being broken and tortured for months. Spare me bad memories and by all Gods of the Realms, do lower your voice!~ GOTO 429
  IF ~~ THEN REPLY ~I would be up already were not you sitting upon my chest.~ GOTO 430
END

IF ~~ THEN BEGIN 425
  SAY ~Hmm, I take it you liked the pleasures we partook of last evening?~
  IF ~~ THEN REPLY ~The play between the sheets is play between the sheets, Sime. It was fine, but now we must get moving.~ GOTO 426
  IF ~Gender(Player1,MALE)~ THEN REPLY ~Sime, my sweet Sime, if I were a god I would make this night last forever. But since I am only a measly demi-god I must put my feelings in words: it was awesome, wonderful, and unforgettable.  Kiss me another time to give me small consolation; for I must now take my hands off your body and let you hide it from me under your armor.~ GOTO 427
  IF ~Gender(Player1,FEMALE)~ THEN REPLY ~Sime, my sweet Sime, if I were a goddess I would make this night last forever. But since I am only a measly demi-goddess I must put my feelings in words: it was awesome, wonderful, and unforgettable.  Kiss me another time to give me small consolation; for I must now take my hands off your body and let you hide it from me under your armor.~ GOTO 589
  IF ~~ THEN REPLY ~Sime, I must tell you... It does not feel right. We shall not continue this.~ GOTO 428
END

IF ~~ THEN BEGIN 426
  SAY ~My point exactly, <CHARNAME>. Now, MOVE!~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",25)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 427
  SAY ~I love you even if you are merely a demi-god. But do get up.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",25)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 428
  SAY ~Fair enough. Take my heart or loose it, <CHARNAME>, as you desire.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",25)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 429
  SAY ~I hope the analogy does not go any further than my loud voice? Or was last eve torturous for you? ~
  IF ~~ THEN REPLY ~The play between the sheets is play between the sheets, Sime. It was fine, but now we must get moving.~ GOTO 426
  IF ~Gender(Player1,MALE)~ THEN REPLY ~Sime, my sweet Sime, if I were a god I would make this night last forever. But since I am only a measly demi-god I must put my feelings in words: it was awesome, wonderful, and unforgettable.  Kiss me another time to give me small consolation; for I must now take my hands off your body and let you hide it from me under your armor.~ GOTO 427
  IF ~Gender(Player1,FEMALE)~ THEN REPLY ~Sime, my sweet Sime, if I were a goddess I would make this night last forever. But since I am only a measly demi-goddess I must put my feelings in words: it was awesome, wonderful, and unforgettable.  Kiss me another time to give me small consolation; for I must now take my hands off your body and let you hide it from me under your armor.~ GOTO 589
  IF ~~ THEN REPLY ~Sime, I must tell you... It does not feel right. We shall not continue this.~ GOTO 428
END

IF ~~ THEN BEGIN 430
  SAY ~Such a grouch you are in the morning! Pray tell, is it usual for you to grumble after a night of passion, or you are so exclusively with me? Do I love in a way that puts you in a bad spirit?~
  IF ~~ THEN REPLY ~The play between the sheets is play between the sheets, Sime. It was fine, but now we must get moving.~ GOTO 426
  IF ~Gender(Player1,MALE)~ THEN REPLY ~Sime, my sweet Sime, if I were a god I would make this night last forever. But since I am only a measly demi-god I must put my feelings in words: it was awesome, wonderful, and unforgettable.  Kiss me another time to give me small consolation; for I must now take my hands off your body and let you hide it from me under your armor.~ GOTO 427
  IF ~Gender(Player1,FEMALE)~ THEN REPLY ~Sime, my sweet Sime, if I were a goddess I would make this night last forever. But since I am only a measly demi-goddess I must put my feelings in words: it was awesome, wonderful, and unforgettable.  Kiss me another time to give me small consolation; for I must now take my hands off your body and let you hide it from me under your armor.~ GOTO 589
  IF ~~ THEN REPLY ~Sime, I must tell you... It does not feel right. We shall not continue this.~ GOTO 428
END

IF ~~ THEN BEGIN 589
  SAY ~I love you even if you are merely a demi-goddess. But do get up.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",25)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

// LT 26

IF WEIGHT #-87 ~Global("VP_SimeLoveTalk","GLOBAL",26)~ THEN BEGIN 431
  SAY ~<CHARNAME>, I want to make sure that we understand each other. You know what is my credo in love? Do not trust, do not fear, and do not ask.~ [SIME14_1]
  IF ~~ THEN REPLY ~Ahem, is it about the last night? I mean it was swell and all, but try not to make a big deal out of it.~ GOTO 432
  IF ~~ THEN REPLY ~I never fear, be it in battle or in love. But I do not think I should take without asking and I wish to be able to trust.~ GOTO 433
  IF ~~ THEN REPLY ~Why, Sime? Are you so afraid to get hurt?~ GOTO 436
  IF ~~ THEN REPLY ~In the mad world we are living in, it is a sensible rule. I understand you, Sime.~ GOTO 440
END

IF ~~ THEN BEGIN 432
  SAY ~Well, I see that you have the attitude I desire, even if it was not put in the most gentle of words.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",27)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 433
  SAY ~Only madmen know no fear, <CHARNAME>. Bravery is in overcoming it, not in denying it.~
  IF ~~ THEN REPLY ~I am mad. Mad about you. And I am mad at you too, because you are trying to rob our relationship of any meaning.~ GOTO 434
  IF ~~ THEN REPLY ~Then you shall learn to overcome your fear in the matters of love. Are you so much afraid of being hurt, that you would forbid yourself to trust a <PRO_MANWOMAN>, Sime Linvail?~ GOTO 436
  IF ~~ THEN REPLY ~I do not want to argue with you, Sime. I would not want to hurt you. It will be as you wish.~ GOTO 437
END

IF ~~ THEN BEGIN 434
  SAY ~I am not robbing you, I am trying to protect you, <CHARNAME>.~
  IF ~~ THEN REPLY ~Love and trust are not the things I need to be protected from. I have too little of them in my life as is.~ GOTO 435
  IF ~~ THEN REPLY ~You are not trying to protect me, Sime. You are trying to build walls around your own heart. Are you so much afraid of being hurt, that you forbid yourself to trust a <PRO_MANWOMAN>, Sime Linvail?~ GOTO 436
  IF ~~ THEN REPLY ~I do not want to argue with you, Sime. I would not want to hurt you. It will be as you wish.~ GOTO 437
END

IF ~~ THEN BEGIN 435
  SAY ~I just do not want love to be an obligation! I do not want our love to turn against us or to become a necessity. Look at my parents: they loved each other against all odds and look what it brought them? My mother is dead and my father wasting himself on whores. I... I am getting very upset and I do not like it. I am sorry to have started this conversation.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",27)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 436
  SAY ~Yes, I am afraid. Look at my parents: they loved each other against all odds and look what it brought them? My mother is dead and my father wasting himself on whores. His love did not protect her from afar. Love me while I am close to you, not when I am away; love me while I am in a good health not when I am frail; and you will always be free, and should you go, I will remember you with a warm smile, not with a scowl. And I expect the same from you.~
  IF ~~ THEN REPLY ~You are a strange woman, Sime. I am not quite sure what do you want exactly or why do you want it, but be it as you wish. I do not care to argue with you, Sime. I would not want to hurt you. ~ GOTO 437
  IF ~~ THEN REPLY ~For me, love always carries an element of devotion. I will not participate in this weird arrangement.~ GOTO 438
  IF ~~ THEN REPLY ~I hope one day you will feel like I do. I hope you will understand we were meant to be together and that we are true soul mates. I hope you will trust me completely and you will love me without any fear or remorse and you will forget feeling you need to reserve a way out.~ GOTO 439
END

IF ~~ THEN BEGIN 437
  SAY ~You are ever so gentle, my love. Sometimes, it makes me wonder if I can play by my own rules with you.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",27)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 438
  SAY ~As I said - you are free to go at any time. Let it be now then.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",27)~ EXIT
END

IF ~~ THEN BEGIN 439
  SAY ~Sometimes I wonder, how could you endure all these trials, and keep your soul so young and gentle. You are truly a noble <PRO_MANWOMAN>. Just remember, it was not me who gave you that hope.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",27)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 440
  SAY ~I am glad. I hope that we both are sincere right now and we both know what we want. I... would not want to hurt you in any way, <CHARNAME>.~
  IF ~~ THEN REPLY ~We both do, do not we? No obligations, no questions asked, and we walk free should the time come. This is the only way to avoid hurting each other. ~ GOTO 441
  IF ~~ THEN REPLY ~Sime, I do not know. The heart can change but why worry about it now, while everything is so good?~ GOTO 441
  IF ~~ THEN REPLY ~I would not want to hurt you either, Sime. It will be as you wish.~ GOTO 437
END

IF ~~ THEN BEGIN 441
  SAY ~You are right. Let’s continue on our journey. Passion shall rule our nights, but not our day life.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",27)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

// LT 28

IF WEIGHT #-86 ~Global("VP_SimeLoveTalk","GLOBAL",28)~ THEN BEGIN 442
  SAY ~You know what I was doing last night? I was counting stars and giving them different names. I even considered calling one after you. Guess which one?~
  IF ~~ THEN REPLY ~Mystra’s star? Though, it’s my preference to think about you while watching it: it is so bright, beautiful, and mysterious.~ GOTO 443
  IF ~OR(2)
Class(Player1,MAGE_ALL)
Class(Player1,SORCERER)~ THEN REPLY ~I think Mystra’s star is the obvious choice.~ GOTO 448
  IF ~~ THEN REPLY ~Ieryn - the star of the North? I know it is sacred to Selunites and you have a deep spiritual connection with your mother. May be you were speaking of me to her while watching the night sky and Ieryn came to your mind?~ GOTO 449
  IF ~~ THEN REPLY ~Shaundral? An erratic star who shines brightest before disaster? Like me, whose coming was foretold in Alaundo’s prophesies?~ GOTO 450
  IF ~~ THEN REPLY ~King’s Coin? The star of the rulers for Men and the Kingslayer to Elves? Do you think I am destined for greatness or great failure?~ GOTO 451
  IF ~~ THEN REPLY ~I do not know, Sime. Why do not you tell me?~ GOTO 452
END

IF ~~ THEN BEGIN 443
  SAY ~Mystra’s star? I love its blue soft light. May be if I had to select one star to name after you I would have chosen it. But you know, when I was looking at the sky yesterday, I suddenly realized that every star reminds me of you.~
  IF ~~ THEN GOTO 444
END

IF ~~ THEN BEGIN 444
  SAY ~Then I thought that everything which is fair and dear to my heart is somehow connected to you. You are in my frosted breath in the early morning, and in the tune I whistle when I wake. You are my sun and stars... I am afraid you are becoming my world.~
  IF ~~ THEN REPLY ~What about your own credo, Sime? The "do not fear" part? You have nothing to be afraid of by my side, me included. Neither you should be afraid of your love for me. I know one day I will harvest those simple words from your lips, undressed and unadorned. I yearn for that day.~ GOTO 445
  IF ~~ THEN REPLY ~Too many fancy words, Sime. Do give me a more material declaration of your feelings for me. The night grows long and we do need some sleep afterwards.~ GOTO 446
  IF ~~ THEN REPLY ~Now you have me wondering what star I shall name for you. I guess I will stay up all night poring over that task. I wonder why the poor and rich alike in these parts stock their bookshelves with endless copies of the "History of the North"? It must have been on sale or something. I’d rather fancy to see a "Star Lore" book somewhere...~ GOTO 447
END

IF ~~ THEN BEGIN 445
  SAY ~And I am yearning for a bedroll right now. Care to join me there? You have not embraced me for far too long, my lazy lover.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",29)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 446
  SAY ~(*Laughs*)... It can be as long or as short as you wish, <CHARNAME>. But I remember that on occasion you are prepared to forsake your sleep. So, what are you waiting for? Care to join me? You for have not embraced me for far too long, and I do not fancy lazy lovers.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",29)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 447
  SAY ~By Mielikki, I have created a monster! If you wish to begin your very own star lore book right now, I can help you I suppose. Alternatively, you may join me in my bedroll. I would like to bring to your attention that you have not embraced me for far too long and that I do not fancy lazy lovers.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",29)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
RestParty()~ EXIT
END

IF ~~ THEN BEGIN 448
  SAY ~Why, because you are a wizard? I could have chosen it, I guess. But you know, when I was looking at the sky yesterday, I suddenly realized that every star reminds me of you.~
  IF ~~ THEN GOTO 444
END

IF ~~ THEN BEGIN 449
  SAY ~The most constant star of the sky? The one who guides my steps when I am lost? I could have chosen it, I guess. But you know, when I was looking at the sky yesterday, I suddenly realized that every star reminds me of you.~
  IF ~~ THEN GOTO 444
END

IF ~~ THEN BEGIN 450
  SAY ~Some might say that it is indeed a fitting star for you, <CHARNAME>. But I do not see its ominous light reflected in your eyes. You know, when I was looking at the sky yesterday, I suddenly realized that every star reminds me of you.~
  IF ~~ THEN GOTO 444
END

IF ~~ THEN BEGIN 451
  SAY ~You are dramatic as ever. Whatever your destiny, I hope you won’t know a great fall. I am too afraid of the darker fame of Kingslayer among the Elves to give it to you. However, when I was looking at the sky yesterday, I suddenly realized that every star reminds me of you.~
  IF ~~ THEN GOTO 444
END

IF ~~ THEN BEGIN 452
  SAY ~You are a wise one, <CHARNAME>, for it was a tricky question. When I was looking at the sky yesterday, I suddenly realized that every star reminds me of you.~
  IF ~~ THEN GOTO 444
END

//LT 30

IF WEIGHT #-85 ~Global("VP_SimeLoveTalk","GLOBAL",30)~ THEN BEGIN 453
  SAY ~Future? Why do you suddenly want to know about the future? The only certain thing is that we all will die, sooner or later. Though yours might be a different story. You know, I pity seers, the ones who are burdened with knowing what is to come.~ [SIME17_1]
  IF ~~ THEN REPLY ~Sime, I was not talking about the future of Faerun! I was talking about you. What will you do when my quests are over?~ GOTO 454
  IF ~~ THEN REPLY ~Future is one of your phobias as well?~ GOTO 462
  IF ~~ THEN REPLY ~Why would you pity seers? Theirs is a rare gift and the great ones of the world seek their advice and wisdom.~ GOTO 472
END

IF ~~ THEN BEGIN 454
  SAY ~(*Laughs*)... So you foresee the end of your quests, <CHARNAME>? I do not believe you! Your job is never done, my hero. There will always be a city to save from foes or a maiden to rescue from the clutches of a dragon. And so long as you choose the honorable way, and we do not grow bored of each other’s company, I shall walk by your side.~
  IF ~~ THEN REPLY ~You are anything but boring, Sime. So fear not me leaving you.~ GOTO 455
  IF ~~ THEN REPLY ~Oh, yeah. I love that sort of stuff. Dragons and foes, beware! <CHARNAME> and Sime are coming to get you!~ GOTO 460
  IF ~~ THEN REPLY ~Do not you find that righteous path you are so eager to stay upon a little bit slow and boring? What if we deviate a bit for a while? Kill a couple of fluffy kittens and sweet old ladies? For variety’s sake?~ GOTO 461
END

IF ~~ THEN BEGIN 455
  SAY ~Do not you know a mortal’s
Short-living love?
A fateful excitement of blood, 
But as the days pass blood cools.
Who will resist parting,
temptation of a new beauty,
fatigue and boredom and
despotism of a new dream?~
  IF ~~ THEN REPLY ~Escape me?
Never-
Beloved!
While I am I, and you are you,
So long as the world contains us both,
Me the loving and you the loth,
While the one eludes, must the other pursue.~ GOTO 456
  IF ~~ THEN REPLY ~If I say me, you will only laugh, right?~ GOTO 458
  IF ~~ THEN REPLY ~Mere mortal - may be. But I am a demi-god, for all it’s worth. Mayhap I love differently, Sime.~ GOTO 459
END

IF ~~ THEN BEGIN 456
  SAY ~I went to the bird merchant
And I bought birds
For you, my love
I went to the flower shop
And I bought flowers 
For you, my love
I went to the smithy
And I bought chains
Heavy chains
For you my love
And then I went to the slave market
And I was looking for you,
But I could not find you there
My love.~
  IF ~~ THEN GOTO 457
END

IF ~~ THEN BEGIN 457
  SAY ~Do not bother to look for me at the slave market, <CHARNAME>. Nothing lasts forever and that is a good thing. It is all the sweeter that way.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 458
  SAY ~I will not laugh, but I will smile.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 459
  SAY ~Let me hope not. I want the love of a mortal person, the one of flesh and blood, not divine favor. It is the Forest Lady I pray to, not you.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 460
  SAY ~And none shall withstand our combined wrath. Speaking of which - it is past time we rejoin the others and press onward.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 461
  SAY ~If that will ever be your choice, I will leave your side, <CHARNAME>. If our paths should cross again afterwards, we shall join in battle as bitter foes.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 462
  SAY ~I am not afraid of anything that comes my way. I can handle it or I will die. But what I would not want is to know my future in advance. I’d be so bored!~
  IF ~~ THEN REPLY ~Boredom? That is what you are afraid of? Then you have found a great antidote: my life, and the lives of those who travel with me, is anything but boring. Stick with me and we are going to have loads of fun. There will always be a city to save from foes or a maiden to rescue from the clutches of a dragon.~ GOTO 463
  IF ~~ THEN REPLY ~Why? Do not you want to be forewarned?~ GOTO 466
END

IF ~~ THEN BEGIN 463
  SAY ~I do believe you in that! Your job is never done, my hero. And so long as you choose the honorable way, and we do not grow bored of each other’s company, I shall walk by your side.~
  IF ~~ THEN REPLY ~You are anything but boring, yourself, Sime. So, fear not me leaving you as well.~ GOTO 455
  IF ~~ THEN REPLY ~Dragons and foes, beware! <CHARNAME> and Sime are coming to get you!~ GOTO 464
  IF ~~ THEN REPLY ~Do not you find that righteous path you are so eager to stay upon a little bit slow and boring? What if we deviate a bit for a while? Kill a couple of fluffy kittens and sweet old ladies? For variety’s sake?~ GOTO 465
END

IF ~~ THEN BEGIN 464
  SAY ~And none shall withstand our combined wrath. Speaking of which - it is past time we rejoin the others and press onward.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 465
  SAY ~If that will ever be your choice, I will leave your side, <CHARNAME>. If our paths should cross again afterwards, we shall join in battle as bitter foes.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 466
  SAY ~Forewarned? Guaranteed from making mistakes? No, <CHARNAME>, I do not want my days to be presented in front of me by some fortune teller. I love surprise and I love making decisions on my own. I thought you were the same sort of person.~
  IF ~~ THEN REPLY ~I was. Then I spent a year roaming the Sword Coast and being chased by every rogue in existence. In those days, I wish I had possessed some idea of what I am and what is my destiny.~ GOTO 467
  IF ~~ THEN REPLY ~Oh, I have bloody forewarning, Sime. Made by Alaundo himself, not some cheap charlatan. Do not you remember: "the Lord of Murder shall perish..." and that entire circus?~ GOTO 471
  IF ~~ THEN REPLY ~My destiny was foretold, Sime. And I feel that I know what is going to happen in the end.~ GOTO 471
END

IF ~~ THEN BEGIN 467
  SAY ~And how much more secure would you feel knowing that you are Lord of the Murder son and that it is your half-brother who is after you? Tell me is that your goal in life, to make Alaundo’s prophecy to come true?~
  IF ~~ THEN REPLY ~No, of course not. I live by the advice of my own heart. But the prophecy... the prophecy explains many things to me about the way I feel and I act. I would be worse off, if I did not know what I am.~ GOTO 468
  IF ~~ THEN REPLY ~Yes. My destiny is clear and I shall take what I was promised.~ GOTO 469
  IF ~~ THEN REPLY ~Sime, please, let us just drop this talk? Or I will damage my jaw yawning.~ GOTO 470
END

IF ~~ THEN BEGIN 468
  SAY ~And that is the only way to live! I am glad to hear you say that. But I think we should rejoin the others and press onward now.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 469
  SAY ~(*Quietly*) Was not that how Sarevok felt? ~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 470
  SAY ~We cannot have that, can we? Let us rejoin the others and press onward then.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 471
  SAY ~I remember, <CHARNAME>. And I pity you for that. Tell me, is that your life’s goal, to make Alaundo’s prophecy to come true?~
  IF ~~ THEN REPLY ~No, of course not. I live by the advice of my own heart. But the prophecy... the prophecy explains many things to me about the way I feel and I act. I would be worse off, if I did not know what I am.~ GOTO 468
  IF ~~ THEN REPLY ~Yes. My destiny is clear and I shall take what I was promised.~ GOTO 469
  IF ~~ THEN REPLY ~Sime, please, let us just drop this talk? Or I will damage my jaw yawning.~ GOTO 470
END

IF ~~ THEN BEGIN 472
  SAY ~Is there wisdom in being an oracle of events which have not yet happened? Is it really a great joy to be questioned constantly by fearful people and know that your answer may not be taken lightly by a Lord you serve? If I was a prophet I would hide from the rich and powerful, that is for sure.~
  IF ~~ THEN REPLY ~Sime, please, let us just drop this talk? Or I will damage my jaw yawning.~ GOTO 470
  IF ~~ THEN REPLY ~Everyone has a talent, a particular talent. And to fulfill your life it has to be realized. If a seer hid himself and ignored his visions it would drive him mad, I think.~ GOTO 473
  IF ~~ THEN REPLY ~You would rather turn into one of the mad beggars walking the roads and foretelling doom to all?~ GOTO 473
END

IF ~~ THEN BEGIN 473
  SAY ~Going mad may be a wise choice for them. At least then they would not feel responsible for their counsel and not comprehend its consequences.~
  IF ~~ THEN REPLY ~Then any counselor or a ruler is better off mad, Sime.~ GOTO 474
  IF ~~ THEN REPLY ~Sime, you stopped making any sense.~ GOTO 475
  IF ~~ THEN REPLY ~You are being unreasonable. The prophecy of Alaundo explains many things to me about the way I feel and act. I would be worse off, if I did not know what I am.~ GOTO 476
END

IF ~~ THEN BEGIN 474
  SAY ~A mad Lord will cause great grief to his people. Because of that, I wish no ruler or his courtier to be mad.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 475
  SAY ~Let us rejoin the others and press onward then.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",31)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 476
  SAY ~I know that, <CHARNAME>. And I pity you for it. Tell me, is that your life’s goal, to make Alaundo’s prophecy to come true?~
  IF ~~ THEN REPLY ~No, of course not. I live by the advice of my own heart. But the prophecy. . .the prophecy explains many things to me about the way I feel and act. I would be worse off, if I did not know what I am.~ GOTO 468
  IF ~~ THEN REPLY ~Yes. My destiny is clear and I shall take what I was promised.~ GOTO 469
  IF ~~ THEN REPLY ~Sime, please, let us just drop this talk? Or I will damage my jaw yawning.~ GOTO 470
END


//LT 32

IF WEIGHT #-84  ~Global("VP_SimeLoveTalk","GLOBAL",32)~ THEN BEGIN 477
  SAY ~So, tell me of all those ladies you fancied in your past? Is there a maid still waiting for you in Candlekeep? Was there a companion of the road  who was dearer to your heart than any other?~
  IF ~~ THEN REPLY ~Sime, you are the only one for me. I can see the beauty and grace of other women, but I am somehow not attracted to them in the way I am to you. And I never was. I guess I was just waiting for you to come and claim my heart.~ GOTO 478
  IF ~~ THEN REPLY ~Are you in the mood for absolving sins? Yes, I had a girl or two before. ~ GOTO 479
  IF ~~ THEN REPLY ~There was a Northerner, tall and proud, who traveled with me for a time. A true warrior Branwen was, and beautiful beyond belief.~ GOTO 481
  IF ~~ THEN REPLY ~I often had my eyes upon Skie Silvershield, a daughter of a Grand Duke of Baldur’s Gate.~ GOTO 486
  IF ~~ THEN REPLY ~Dynaheir, her name was Dynaheir, but I rather not talk about it.~ GOTO 491
  IF ~!InParty("Sharteel")~ THEN REPLY ~There was a fighter I fancied for a time, Shar Teel by name.~ GOTO 493
END

IF ~~ THEN BEGIN 478
  SAY ~Is that true? Oh, no matter that sounds way too sweet for me to question it.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 479
  SAY ~And?~
  IF ~~ THEN REPLY ~No "and". I wish to keep some sins and some secrets, Sime.~ GOTO 480
  IF ~~ THEN REPLY ~And then I met you. Sime, you are the only one for me now. I can see the beauty and grace of other women, but I am somehow not attracted to them in the way I am to you. No one else matters.~ GOTO 478
  IF ~~ THEN REPLY ~There was a Northerner, tall and proud, who traveled with me for a time. A true warrior Branwen was, and beautiful beyond belief.~ GOTO 481
  IF ~~ THEN REPLY ~I often had my eyes upon Skie Silvershield, a daughter of a Grand Duke in Baldur’s Gate.~ GOTO 486
  IF ~~ THEN REPLY ~Dynaheir, her name was Dynaheir, but I would rather not talk about it.~ GOTO 491
  IF ~~ THEN REPLY ~There was a fighter I fancied for a time, Shar Teel by name.~ GOTO 493
END

IF ~~ THEN BEGIN 480
  SAY ~Oh well, I’ll let the bards figure it out for their songs.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 481
  SAY ~What ever became of her?~
  IF ~~ THEN REPLY ~My stone maiden she was. It is true, Sime. A lousy mage turned her into stone when she refused to fight unarmed people. I released her from the curse. I sort of thought that would promote a romance. But Branwen had been on her own quest to become a priest of Tempus. It was a position reserved solely for males in her parts, so when she judged that she had gained enough power, and the favor of Tempus was with her, she departed for her homeland to prove herself. I felt that I had to let her go.~ GOTO 482
END

IF ~~ THEN BEGIN 482
  SAY ~That was very noble of you.~
  IF ~~ THEN REPLY ~I guess. That was what I was kept telling myself for a time. But time heals all wounds.~ GOTO 483
  IF ~~ THEN REPLY ~Noble? May be. That war hammer she was swinging in battle also played a role in my decision.~ GOTO 484
  IF ~~ THEN REPLY ~And then I met you. Sime, you are the only one for me now. I can see the beauty and grace of other women, but I am somehow not attracted to them in the way I am to you. No one else matters.~ GOTO 485
END

IF ~~ THEN BEGIN 483
  SAY ~I find that this sort of wound can only be healed by more radical means. The heart is like a port: as one ship is leaving another is entering. Fear not, <CHARNAME>, I foresee that you will love and be loved many more times.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 484
  SAY ~You are never serious, are you? I like that about you.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 485
  SAY ~Is that true? Oh, no matter that sounds way too sweet for me to question it.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 486
  SAY ~What ever became of her?~
  IF ~~ THEN REPLY ~She has gone off with her lover, a fortune seeker named Eldoth Kron. She is still trying to persuade Duke Silvershield to recognize their marriage. Until then, they are in hiding. I hope at least, Eldoth does not mistreat her.~ GOTO 487
END

IF ~~ THEN BEGIN 487
  SAY ~Young girls brought up in noble families can be so blind in the ways of the real world. Was there nothing you could do?~
  IF ~~ THEN REPLY ~Just like her father, I tried to make her to see Eldoth for what he was, but I got no better results than him. It only added to her conviction that the whole world was one big conspiracy against her love for the slimy bard.~ GOTO 488
  IF ~~ THEN REPLY ~Well, all my courting went unnoticed. She considered me to be a lowlife.~ GOTO 489
  IF ~~ THEN REPLY ~I tried but without success. As you said, she was completely oblivious to the way things work in the real world. But, Sime,that is enough of Skie. You are the only one for me now. I can see the beauty and grace of other women, but I am somehow not attracted to them in the way I am to you.  No one else matters.~ GOTO 490
END

IF ~~ THEN BEGIN 488
  SAY ~For her sake I hope she will wake up one day and meet someone more honorable. It always saddens me when hearts bleed for an unworthy person.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END
IF ~~ THEN BEGIN 489
  SAY ~(*Laughs*)...  Then she committed a grave mistake. I did never meet a lord more honorable and valiant than you. I would dearly like to have seen you in the beginning of your travels. A bit shabbier you may have been, but with less pain in your eyes, and more starlight and youth.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 490
  SAY ~For her sake I hope she will wake up one day and meet someone more honorable. But she will not have you now; I am a greedy woman.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 491
  SAY ~It is the name of one of your fallen companions, is not it?~
  IF ~~ THEN REPLY ~Yes, it is.~ GOTO 492
END

IF ~~ THEN BEGIN 492
  SAY ~I know how it feels to lose a lover to death, <CHARNAME>.  That’s when our spinning and ringing world of battles and adventures comes to a crashing stop.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 493
  SAY ~What ever became of her?~
  IF ~~ THEN REPLY ~If I only knew... Shar-Teel was a very angry person and trusted no man. Her life was not an easy one, I suspect. She let me have no more than a glance into her soul, which was far more than anyone else ever saw.  I suspect that she is fighting some battle somewhere or drinks and laughs with one group of rascals or another.~ GOTO 494
END

IF ~~ THEN BEGIN 494
  SAY ~It does not sound like a happy story, <CHARNAME>.~
  IF ~~ THEN REPLY ~Wrong people, wrong feelings. Happens all the time.~ GOTO 495
  IF ~~ THEN REPLY ~You want a happy story? Then let us make it. You are the only one for me now. I can see the beauty and grace of other women, but I am somehow not attracted to them in the way I am to you. Nothing else matters.~ GOTO 496
END

IF ~~ THEN BEGIN 495
  SAY ~Yes, but I feel not comforted by that.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 496
  SAY ~A worthy idea! And we are hard at it already, do not you think?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",33)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

// LT 34

IF WEIGHT #-83 ~Global("VP_SimeLoveTalk","GLOBAL",34)~ THEN BEGIN 497
  SAY ~(*Reads to you from an old tome*)

"And His Grace the King came then upon Sir Knight and his Lady Wife. They were asleep on his cloak shielded by the branches of an ancient oak tree. Sir Knight’s great sword lay between them and so the King saw that his honor was not despoiled.  His Grace kneeled and slipped his own ring onto his Lady’s finger and then he rode off..."~
  IF ~~ THEN GOTO 498
END

IF ~~ THEN BEGIN 498
  SAY ~I am not sure I am truly convinced in the efficiency of that sword. Be there a blade between us or not, you will not be safe from my embrace. But I have heard of a ranger who used a direwolf for that purpose. That might be more efficient.~
  IF ~~ THEN REPLY ~Sounds like a thing Valygar would do. Or may be Kivan if some lady would imagine that she could replace his dear Deheriana. It would be a hamster, not direwolf in Minsc’s case, I guess.~ GOTO 499
  IF ~~ THEN REPLY ~That sounds dangerous - a sword in the bedroll. Someone could get hurt.~ GOTO 506
  IF ~~ THEN REPLY ~Ahem, Sime, do you think we can delay the story’s ending till tomorrow night? I am afraid my endurance is lacking compare to that of Sir Knight.~ GOTO 510
  IF ~~ THEN REPLY ~That is a tale to warm up a noble heart.~ GOTO 511
END

IF ~~ THEN BEGIN 499
  SAY ~His name was Jon. But, do you imply that it is a typical behavioral pattern for rangers?~
  IF ~~ THEN REPLY ~In no way. Rangers can be very playful and outgoing. I even know one. Blonde tresses, green eyes, charming smile, and an absolutely irresistible way to kiss.~ GOTO 500
  IF ~Class(Player1,RANGER_ALL)~ THEN REPLY ~Oh, no. I know that better than anyone else! Rangers are passionate lovers. Do not you agree?~ GOTO 501
  IF ~~ THEN REPLY ~May be. But I can be convinced to reconsider.~ GOTO 502
  IF ~~ THEN REPLY ~I have no opinion on the matter. You were talking about rangers and I remembered all I have met. No, wait I forgot Drizzt Do’Urden! Ahem, bad example, I am afraid.~ GOTO 503
END

IF ~~ THEN BEGIN 500
  SAY ~Now, that you started this talk about kissing, think we can delay the story’s ending till tomorrow night? And do some serious research on the ways the rangers love?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 501
  SAY ~Absolutely true, <CHARNAME>. Do you think we can delay the story’s  ending till tomorrow night? And do some serious research on the ways the rangers love?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 502
  SAY ~I am afraid it can take some significant amount of time. Do you think we can delay the story’s ending till tomorrow night? And do some serious research on the ways the rangers love?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 503
  SAY ~Bad example indeed. Have you ever heard about the courtesan in Waterdeep who approached him, thinking he was sufficiently drunk? Not only did he politely refuse her nineteen times, but on the twentieth he set his ale aside, pulled out his diary, and started reading her an excerpt on the Drow’s way of love... They say that poor girl refuses to enter that inn ever since.~
  IF ~~ THEN REPLY ~Sime, that... that cannot be true!~ GOTO 504
  IF ~~ THEN REPLY ~Shall we keep talking about Drow or can we delay it till tomorrow night? I am afraid my endurance is lacking compared to that of Sir Knight or Drizzt.~ GOTO 505
END

IF ~~ THEN BEGIN 504
  SAY ~May be, but I have heard it from a very reliable source. Do you think we can delay this discussion? And do some serious research on the ways the other rangers love?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 505
  SAY ~Am I glad to hear that, <CHARNAME>. I was wondering how long it would take you to figure out that I had not been kissed tonight yet.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 506
  SAY ~A direwolf sounds better to you?~
  IF ~~ THEN REPLY ~At least it is softer. And warmer.~ GOTO 507
  IF ~~ THEN REPLY ~Where is your familiar?~ GOTO 508
  IF ~~ THEN REPLY ~Depends. Did it work for that ranger?~ GOTO 509
END

IF ~~ THEN BEGIN 507
  SAY ~How about  warming up our bed ourselves?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 508
  SAY ~He’s off hunting. But at any rate, the werewolf did not work for Jon, why should it work for us?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 509
  SAY ~No, it did not. His lady was just as persistent as I am. I hope you will follow his suit and join me under the covers now.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 510
  SAY ~Am I glad to hear that, <CHARNAME>. I was wondering how long it would take you to figure out that I had not yet been kissed tonight.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

IF ~~ THEN BEGIN 511
  SAY ~How about warming up our bed as well?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",35)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
StartCutSceneMode()
StartCutScene("Cut34a")~ EXIT
END

// LT 36

IF WEIGHT #-82 ~Global("VP_SimeLoveTalk","GLOBAL",36)~ THEN BEGIN 512
  SAY ~I am not a mage, <CHARNAME>, and I am not even a mage’s apprentice, but there is a spell Darriel once taught me. I can see that you are weary and sad. The spell might put you into lighter mood. Do you want me to cast it?~
  IF ~~ THEN REPLY ~No, Sime, I do not want any spell cast on me. I will sleep now, and I will be fine once I have rested.~ GOTO 513
  IF ~~ THEN REPLY ~What is the nature of that spell? ~ GOTO 514
  IF ~~ THEN REPLY ~I doubt that a single spell can take away my worries (unless it kills Irenicus), but do cast it Sime. I’d welcome some entertainment.~ GOTO 515
END

IF ~~ THEN BEGIN 513
  SAY ~Sleep tight then, <CHARNAME>.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_SimeLoveTalk","GLOBAL",37)~ EXIT
END

IF ~~ THEN BEGIN 514
  SAY ~That is a... surprise. You like surprises, do not you?~
  IF ~~ THEN REPLY ~No, Sime, not really. I do not want any spell cast on me. I will sleep now, and I will be fine once I have rested.~ GOTO 513
  IF ~~ THEN REPLY ~It depends... But you said it is going to be something pleasant, did not you? All right then cast your spell and we shall see.~ GOTO 515
  IF ~~ THEN REPLY ~I adore surprises, especially pleasant ones. Cast the spell, Sime Linvail!~ GOTO 515
END

IF ~~ THEN BEGIN 515
  SAY ~Give me your hand, <CHARNAME>... Kaimeldor panta annonta ten’lle...~
  IF ~~ THEN DO ~SetGlobal("VP_Sime_DreamIsland","GLOBAL",1)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
SetGlobal("VP_SimeLoveTalk","GLOBAL",37)
ClearAllActions()
StartCutSceneMode()
StartCutScene("vpcuts01")~ EXIT
END

// LT 38

IF WEIGHT #-81 ~Global("VP_SimeLoveTalk","GLOBAL",38)~ THEN BEGIN 516
  SAY ~I am glad to feel the warmth of the sun on my skin and see the light and the shadows play. I have not liked it at all in the caverns of the Underdark and its creepy inhabitants. How do you feel now that we have returned to the Surface? Are you a creature of light?~
  IF ~~ THEN REPLY ~I am a creature of light, Sime, no matter what they say about me. I have never been as jolly as when we came back under the gaze of the sun. I disliked the Underdark and all the foul creatures that populate it.~ GOTO 517
  IF ~!Race(Player1,ELF)
!Race(Player1,HALF_ELF)~ THEN REPLY ~Dark it is my fair Lady, but many riches are hidden within. I took a look around the mines that those gnomes worked. I say that the rock there might yield clear diamonds and glowing garnet gems. And that was naught but a small corner of the Underdark. Nays, Sime, do not judge the place unlikable too hastily.~ GOTO 518
  IF ~~ THEN REPLY ~I agree with you in that I feel more comfortable on the Surface. But there is a certain beauty in the Underdark. And not all creatures that populate it are foul.~ GOTO 522
  IF ~~ THEN REPLY ~I have to say that I felt fine in the Underdark. Drow are no worse than the snotty Elves in Suldanesselar. Solaufein fellow was quite decent. Deep gnomes are cute... Of course there were few unpleasant meetings, but that’s no different than on the Surface. Besides it is always warm there and it does not rain. In fact I am thinking of journeying there again when I will have time.~ GOTO 523
END

IF ~~ THEN BEGIN 517
  SAY ~I am glad we think alike.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",39)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 518
  SAY ~I did not think about it in that way, <CHARNAME>. But to tell you the truth, I treasure a flower above any jewel, and I like the light of sun above any riches.~
  IF ~~ THEN REPLY ~Oh, then I can give you wild flowers instead of jewels. How very wise and economic! The only thing that bothers me that I will be seen while picking up flowers, like some effeminate Elf.~ GOTO 519
  IF ~~ THEN REPLY ~Ah, but what of weapons, Sime? Can you make a blade without shiny mithril or dark adamantite?~ GOTO 520
  IF ~~ THEN REPLY ~You talk nonsense, girl. Flowers will wither, but gemstone would shine forever.~ GOTO 521
END

IF ~~ THEN BEGIN 519
  SAY ~I can propose an even more economic solution: give me your love, that’s all I need.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",39)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 520
  SAY ~Here you got me! Well, I guess I was not born to be a miner, but I shall be grateful that others were. Though if there were not any weapons ever made... there wouldn’t be fighting. Nay, I am silly. One can fight with wooden weapons, his bare hands or spells if he really wants to.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",39)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 521
  SAY ~Both flowers and gems are given by nature to us, and they both are beautiful. I am talking nonsense, <CHARNAME>. I guess the fresh air after the stuffiness of the Underdark made me feel queer.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",39)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)
~ EXIT
END

IF ~~ THEN BEGIN 522
  SAY ~Indeed, <CHARNAME>. I am talking nonsense, I am afraid. I guess the fresh air after the stuffiness of the Underdark made me feel queer.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",39)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 523
  SAY ~I thought that I would never want to part with you, but I doubt that I would like to accompany you back to the Underdark. However... however there is a certain beauty in the Underdark. And not all creatures that populate it are foul. May be we shall go back. After all, I like a good adventure!~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",39)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END


// LT 40

IF WEIGHT #-80 ~Global("VP_SimeLoveTalk","GLOBAL",40)~ THEN BEGIN 524
  SAY ~Irenicus is nearer with every step, <CHARNAME>, we all know... How do you feel about it? Are you nervous?~
  IF ~~ THEN REPLY ~As I always do when I am about to bring justice to the world! Irenicus is going to be punished for his crimes and the righteousness shall triumph again!~ GOTO 525
  IF ~~ THEN REPLY ~Nothing special really. One more foe to fight, big deal.~ GOTO 525
  IF ~~ THEN REPLY ~I think I am... We have faced Irenicus before, and he is not exactly your commonplace diseased xvart. ~ GOTO 544
END

IF ~~ THEN BEGIN 525
  SAY ~It may sound odd, but do you think Irenicus is a black-hearted villain? That he cannot be redeemed? It is apparent that his capabilities are far above normal. Genius and evil are two things incompatible, a bard said once. Do not you think so?~
  IF ~~ THEN REPLY ~Sime, Irenicus had overstepped every moral boundary known.  Genius he might be, but a genius of evil. He destroys before creating. He is Evil incarnate, Sime, and an unredeemable Evil.~ GOTO 526
  IF ~~ THEN REPLY ~I neither know, nor do I care, if he is apt for redemption, Sime. I have a personal score to settle with Irenicus, and I am bent on sending him to Nine Hells.~ GOTO 532
  IF ~~ THEN REPLY ~There can be redemption for him, Sime, but it is not my part to bring it to him. ~ GOTO 533
END

IF ~~ THEN BEGIN 526
  SAY ~Do you think that he killed or destroyed more than you did?~
  IF ~~ THEN REPLY ~I killed those who were standing against me ready to fight. I neither tortured my enemies, nor violated someone by stealing his soul. May be I am not exactly what you would call an innocent victim, but you know my sister, Imoen. Do you think anyone, but a heartless monster could put her through the tortures she endured?~ GOTO 527
  IF ~~ THEN REPLY ~If I did, then I am the stronger, and that gives me hope that I can defeat him. He has something of mine and I want it back! Irenicus can do whatever he wants in Abyss after I cast him down there.~ GOTO 531
  IF ~~ THEN REPLY ~Sime, cannot you see the difference between Irenicus and me? It is scary.~ GOTO 527
END

IF ~~ THEN BEGIN 527
  SAY ~Irenicus’ crimes are immense, <CHARNAME>. I just hope that it will not be blind hatred and revenge that will guide your striking arm when we will finally meet him.~
  IF ~~ THEN REPLY ~Revenge is a noble passion. And hatred - I am past hatred I think. I see a man who has to be destroyed lest he renders the Realm into ashes.~ GOTO 528
  IF ~~ THEN REPLY ~Sime, it is strange, but I do not feel hatred, nor I am going into this battle for vengeance. I feel that I am doomed to fight him. I think that he forged our link himself, by stealing my soul - only one of us is to live now. Forgive me if I am egotistical, but I want him to die, not me.~ GOTO 529
  IF ~~ THEN REPLY ~The passions you are speaking about are dark ones, but they make my blood boil in battle. Therefore I allow them to fill what is left of my soul. But I know how to control them now, just like I can control the Slayer in myself.~ GOTO 530
END

IF ~~ THEN BEGIN 528
  SAY ~I am glad that you go into this battle leaving hatred behind, but I urge you to clear your mind of the thought of revenge as well. Have not you seen people obsessed with revenge and how empty their life becomes after the sworn enemy is dead? Please, promise me to reflect on that, <CHARNAME>.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 529
  SAY ~(*Smiles and touches your cheek*)... You know that your staying alive will make at least one more person happy, do not you? May be you are right, <CHARNAME>, maybe it is you or him. But be merciful if you should have a chance, will you?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 530
  SAY ~Then I admire your strength, <CHARNAME>. For you will be fighting two battles instead of one. But be merciful if you should have a chance, will you?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 531
  SAY ~It is, as I feared then. Blind hatred and revenge will guide your striking arm when we will finally meet him.~
  IF ~~ THEN REPLY ~Revenge is a noble passion. And hatred - I am past hatred I think. I see a man who has to be destroyed lest he renders the Realm into ashes.~ GOTO 528
  IF ~~ THEN REPLY ~Sime, it is strange, but I do not feel hatred, nor I am going into this battle for vengeance. I feel that I am doomed to fight him. I think that he forged our link himself, by stealing my soul - only one of us is to live now. Forgive me if I am egotistical, but I want him to die, not me.~ GOTO 529
  IF ~~ THEN REPLY ~The passions you are speaking about are dark ones, but they make my blood boil in battle. Therefore I allow them to fill what is left of my soul. But I know how to control them now, just like I can control the Slayer in myself.~ GOTO 530
END

IF ~~ THEN BEGIN 532
  SAY ~It is, as I feared then. Blind hatred and revenge will guide your striking arm when we will finally meet him.~
  IF ~~ THEN REPLY ~Revenge is a noble passion. And hatred - I am past hatred I think. I see a man who has to be destroyed lest he renders the Realm into ashes. ~ GOTO 528
  IF ~~ THEN REPLY ~Sime, it is strange, but I do not feel hatred, nor I am going into this battle for vengeance. I feel that I am doomed to fight him. I think that he forged our link himself, by stealing my soul - only one of us is to live now. Forgive me if I am egotistical, but I want him to die, not me.~ GOTO 529
  IF ~~ THEN REPLY ~The passions you are speaking about are dark ones, but they make my blood boil in battle. Therefore, I allow them to fill what is left of my soul. But I know how to control them now, just like I can control the Slayer in myself.~ GOTO 530
END

IF ~~ THEN BEGIN 533
  SAY ~Why?~
  IF ~~ THEN REPLY ~Because.~ GOTO 534
  IF ~~ THEN REPLY ~Imoen, Khalid and Dynaheir are my three reasons.  It is in my power to forgive him for what he had done to me, but how can I forgive him the torture and death of my friends? He did not give them any chances.~ GOTO 535
  IF ~~ THEN REPLY ~I have judged him and found him guilty. The only mercy I have for him is the mercy of my sword hand. He will die quick and painless if that choice would be given to me, but he will die.~ GOTO 535
  IF ~~ THEN REPLY ~I am not the redeeming type, Sime. He can go to priests of Ilmater for that, not to me.~ GOTO 539
END

IF ~~ THEN BEGIN 534
  SAY ~Oh, that was deep.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 535
  SAY ~Irenicus crimes are immense, <CHARNAME>, including the ones he committed against you and your friends. I can understand your anger and your pain. I just hope that it will not be blind hatred and revenge that will guide your striking arm when we will finally meet him.~
  IF ~~ THEN REPLY ~Revenge is a noble passion. And hatred - I am past hatred I think. I see a man who has to be destroyed lest he renders the Realm into ashes.~ GOTO 536
  IF ~~ THEN REPLY ~Sime, it is strange, but I do not feel hatred, nor I am going into this battle for vengeance. I feel that I am doomed to fight him. I think that he forged our link himself, by stealing my soul - only one of us is to live now. Forgive me if I am egotistical, but I want him to die, not me.~ GOTO 537
  IF ~~ THEN REPLY ~The passions you are speaking about are dark ones, but they make my blood boil in battle. Therefore, I allow them to fill what is left of my soul. But I know how to control them now, just like I can control the Slayer in myself.~ GOTO 538
END

IF ~~ THEN BEGIN 536
  SAY ~I am glad that you go into this battle leaving hatred behind, but I urge you to clear your mind of the thought of revenge as well. Have not you seen people obsessed with revenge and how empty their lives become after the sworn enemy is dead? Please, promise me to reflect on that, <CHARNAME>.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 537
  SAY ~(*Smiles and touches your cheek.*)... You know that your staying alive will make at least one more person happy, do not you? May be you are right, <CHARNAME>, maybe it is you or him. But be merciful if you will have a chance, will you?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 538
  SAY ~Then I admire your strength, <CHARNAME>. For you will be fighting two battles instead of one. But be merciful if you should have a chance, will you?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 539
  SAY ~Care to take one along? Because it is most likely that we will meet with Irenicus before he will have a desire to visit Ilmater’s Temple.~
  IF ~~ THEN REPLY ~He will have the desire as soon as he sees me, I wager.~ GOTO 540
  IF ~~ THEN REPLY ~You are a good enough priest, Sime. Besides, I am sure Irenicus would clutch to his sins, rather than have them absolved.~ GOTO 541
  IF ~~ THEN REPLY ~A whole dozen if that will please my Lady! ~ GOTO 542
  IF ~~ THEN REPLY ~Ahem, do you think they are any good in a fight those beggars?~ GOTO 543
END

IF ~~ THEN BEGIN 540
  SAY ~I doubt it not, <CHARNAME>. You scare even me sometimes. But be merciful if you should have a chance, will you?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 541
  SAY ~May be... after all, you know him better than I do. Let it be, then. But be merciful if you should have a chance, will you?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 542
  SAY ~<CHARNAME>, pleasing me is not the concern here... By Mielikki, you are grinning! Are you ever serious?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",41)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 543
  SAY ~You are thinking cannon fodder, are not you? You... you are a beast!~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_SimeLoveTalk","GLOBAL",41)~ EXIT
END

IF ~~ THEN BEGIN 544
  SAY ~It is apparent that his capabilities are far above normal, yes. He is a terrifying adversary. <CHARNAME>, I wanted to ask you something. It may sound odd, but do you think Irenicus is a black-hearted villain? That he cannot be redeemed? Genius and evil are two things incompatible, a bard said once. Do not you think so?~
  IF ~~ THEN REPLY ~Sime, Irenicus had overstepped every moral boundary known.  Genius he might be, but a genius of evil. He destroys before creating. He is Evil incarnate, Sime, and an unredeemable Evil.~ GOTO 526
  IF ~~ THEN REPLY ~I neither know, nor do I care, if he is apt for redemption, Sime. I have a personal score to settle with Irenicus, and I am bent on sending him to Nine Hells.~ GOTO 532
  IF ~~ THEN REPLY ~There can be redemption for him, Sime, but it is not my part to bring it to him.~ GOTO 533
END


//LT 42

IF WEIGHT #-79 ~Global("VP_SimeLoveTalk","GLOBAL",42)~ THEN BEGIN 545
  SAY ~Once I thought that I discovered a secret: love was once invented by an idle person, and the whole world believed it out of boredom or envy. My soul was silent since then and sickly.~
  IF ~~ THEN REPLY ~Why you are telling me that?~ GOTO 546
  IF ~~ THEN REPLY ~But you do not believe it now?~ GOTO 552
  IF ~~ THEN REPLY ~And what I am supposed to say?~ GOTO 550
END

IF ~~ THEN BEGIN 546
  SAY ~Because it was you who have destroyed my blissful ignorance, <CHARNAME>. Because you healed my heart.~
  IF ~~ THEN REPLY ~Oh... good.~ GOTO 547
  IF ~~ THEN REPLY ~And what I am supposed to say?~ GOTO 550
  IF ~~ THEN REPLY ~So now you are just like everyone else: waiting for a chanced meeting, afraid to part and singing sad songs?~ GOTO 551
END

IF ~~ THEN BEGIN 547
  SAY ~Of course it is good! But sometimes I am angry at you for that.~
  IF ~~ THEN REPLY ~You are cross with me because you love me? ~ GOTO 548
  IF ~~ THEN REPLY ~I think I will just kiss you and hope for the best.~ GOTO 549
  IF ~~ THEN REPLY ~And what I am supposed to say?~ GOTO 550
END

IF ~~ THEN BEGIN 548
  SAY ~It does not make sense, does it? Oh, Nine Hells, just kiss me, will you?~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",43)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 549
  SAY ~Wonderful idea! That is guaranteed to cheer me up.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",43)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 550
  SAY ~You are supposed to say "uh-huh" and kiss me.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",43)
RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 551
  SAY ~Exactly. And it is your entire fault! I am cross with you, <CHARNAME>.~
  IF ~~ THEN REPLY ~You are cross with me because you love me?~ GOTO 548
  IF ~~ THEN REPLY ~I think I will just kiss you and hope for the best.~ GOTO 549
  IF ~~ THEN REPLY ~And what I am supposed to say?~ GOTO 550
END

IF ~~ THEN BEGIN 552
  SAY ~No, because you destroyed that belief of mine. I am cross with you.~
  IF ~~ THEN REPLY ~You are cross with me because you love me? ~ GOTO 548
  IF ~~ THEN REPLY ~I think I will just kiss you and hope for the best.~ GOTO 549
  IF ~~ THEN REPLY ~And what I am supposed to say?~ GOTO 550
END

//LT 44

IF WEIGHT #-78 ~Global("VP_SimeLoveTalk","GLOBAL",44)~ THEN BEGIN 553
  SAY ~I have been studying you for so long, <CHARNAME>, that I can write a book about you. You are noble and valiant person. The sort that saves fair maidens from the clutches of evil dragons.~
  IF ~~ THEN REPLY ~Nay, Sime. There are enough fair maidens in the world and too few dragons. Though of course there is one maiden which is worth fighting a dragon for.~ GOTO 554
  IF ~Gender(Player1,MALE)~ THEN REPLY ~Sure, I start every day by killing a dragon and saving a maiden. They have a terrifying habit of marrying me as a gesture of gratitude and now I have a harem full of princesses of all sorts, did not you notice?~ GOTO 560
  IF ~~ THEN REPLY ~Sime, where is this conversation leading?~ GOTO 561
END

IF ~~ THEN BEGIN 554
  SAY ~You think so? (*Laughs*)... Care to try?~
  IF ~~ THEN REPLY ~Sime, you, rangers are supposed to prevent people from doing dangerous things, like fighting dragons for example...~ GOTO 555
  IF ~~ THEN REPLY ~Sime, are you thinking what I think you are thinking?~ GOTO 556
  IF ~~ THEN REPLY ~Sime, I do not want to fight any dragons!~ GOTO 557
END

IF ~~ THEN BEGIN 555
  SAY ~But, we rangers are also supposed to promote good deeds like maiden saving... And I really want to be a damsel in distress for once... Come, give me your hand!  Kaimeldor panta annonta ten’lle, <CHARNAME>.~
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",1)
SetGlobal("VP_SimeLoveTalk","GLOBAL",45)
ClearAllActions()
StartCutSceneMode()
StartCutScene("vpcuts03")~ EXIT
END

IF ~~ THEN BEGIN 556
  SAY ~Oh, yes! Come, give me your hand! Kaimeldor panta annonta ten’lle, <CHARNAME>.~
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",1)
SetGlobal("VP_SimeLoveTalk","GLOBAL",45)
ClearAllActions()
StartCutSceneMode()
StartCutScene("vpcuts03")~ EXIT
END

IF ~~ THEN BEGIN 557
  SAY ~What, not even a tiny one? For me? Please? I really want to be a damsel in distress for once...~
  IF ~~ THEN REPLY ~No, Sime, not even a baby-dragon. And you are terrible at making puppy eyes.~ GOTO 558
  IF ~~ THEN REPLY ~Alright, alright, where is this beast I am required to slaughter to free my fair Lady?~ GOTO 559
END

IF ~~ THEN BEGIN 558
  SAY ~I will have to practice harder then.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeLoveTalk","GLOBAL",45)~ EXIT
END

IF ~~ THEN BEGIN 559
  SAY ~Oh, yes! Come, give me your hand!  Kaimeldor panta annonta ten’lle, <CHARNAME>.~
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",1)
SetGlobal("VP_SimeLoveTalk","GLOBAL",45)
ClearAllActions()
StartCutSceneMode()
StartCutScene("vpcuts03")~ EXIT
END

IF ~~ THEN BEGIN 560
  SAY ~Is that true? (*Laughs*)... But I have not seen you do that today yet. We cannot leave you without a princess of the day, can we?~
  IF ~~ THEN REPLY ~Sime, you, rangers are supposed to prevent people from doing dangerous things, like fighting dragons for example...~ GOTO 555
  IF ~~ THEN REPLY ~Sime, are you thinking what I think you are thinking?~ GOTO 556
  IF ~~ THEN REPLY ~Sime, I do not want to fight any dragons!~ GOTO 557
END

IF ~~ THEN BEGIN 561
  SAY ~I thought I might offer you a very exotic entertainment... very romantic too...~
  IF ~~ THEN REPLY ~Sime, you, rangers are supposed to prevent people from doing dangerous things, like fighting dragons for example...~ GOTO 555
  IF ~~ THEN REPLY ~Sime, are you thinking what I think you are thinking?~ GOTO 556
  IF ~~ THEN REPLY ~Sime, I do not want to fight any dragons!~ GOTO 557
END
END

//// Conflicts

// Aerie Romance

CHAIN IF WEIGHT #-75 ~Global("VP_Sime_vs_Aerie","GLOBAL",1)~ THEN VPSIMEJ SimeAerieRomCon0
~Aerie, what are you doing? What is this? Let me take a look at this vial.~ DO ~SetGlobal("VP_Sime_vs_Aerie","GLOBAL",2)~
== AERIEJ ~You... do not need to check me. I... do what I want.~
== VPSIMEJ ~Give me that vial.~
== AERIEJ ~It is empty.~
== VPSIMEJ ~I can see that. No harm in giving me an empty vial, is not it?~
== AERIEJ ~Here, catch it if you can... (*She throws the vial to Sime and tries to run away, crying).~
== VPSIMEJ ~(*Sniffs the bottle carefully*)... <CHARNAME>! Hold her! Silly child.~
END
IF ~~ THEN REPLY ~She is... faint?~ GOTO SimeAerieRomCon1
IF ~~ THEN REPLY ~What, I have nothing better to do than run after hysterical girls? She will come back. Sime, she fainted!~ GOTO SimeAerieRomCon1

APPEND VPSIMEJ

IF ~~ THEN BEGIN SimeAerieRomCon1
  SAY ~You caught her? Good. Please, hold her tight while I purge her body from poison.~
  IF ~~ THEN REPLY ~Poison? Aerie poisoned herself? I do not understand. Is not it regarded as a mortal sin among elves? Why, Aerie, why?~ GOTO SimeAerieRomCon2
  IF ~~ THEN REPLY ~As if we do not have enough troubles already. She is unaccustomed to the trials of adventurer’s life. I should not have allowed her to follow... us.~ GOTO SimeAerieRomCon3
  IF ~~ THEN REPLY ~Do you think that she did it because of...~ GOTO SimeAerieRomCon2
END

IF ~~ THEN BEGIN SimeAerieRomCon2
  SAY ~It is because of you and me, <CHARNAME>, do not you see? She is in love with you.~
  IF ~~ THEN REPLY ~I hope she will be alright. I will talk to her and I will try to explain... I do not know how yet, but I will try. I do not wish our future to be clouded by this child’s tears.~ GOTO SimeAerieRomCon4
  IF ~~ THEN REPLY ~Because of me? My poor gentle Aerie! Sime, I am sorry, but I think my eyes are finally opened. I love Aerie.~ GOTO SimeAerieRomCon5
END

IF ~~ THEN BEGIN SimeAerieRomCon3
  SAY ~To follow YOU, that’s what you wanted to say. It is because of you and me, <CHARNAME>, let’s face it. She is in love with you.~
  IF ~~ THEN REPLY ~I hope she will be alright. I will talk to her and I will try to explain... I do not know how yet, but I will try. I do not wish our future to be clouded by this child’s tears.~ GOTO SimeAerieRomCon4
  IF ~~ THEN REPLY ~Because of me? My poor gentle Aerie! Sime, I am sorry, but I think my eyes are finally opened. I love Aerie.~ GOTO SimeAerieRomCon5
END

IF ~~ THEN BEGIN SimeAerieRomCon4
  SAY ~She is waking up. I will leave you now. Whatever you want to say should be said in private. I do not think she would want me around.~
  IF ~~ THEN DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN SimeAerieRomCon5
  SAY ~I see. Know <CHARNAME>, that I will not ask you for your love again. It looks that you find a good place for it. But hid my advice, tell her how I loved you. The foolish ones hold the sense of victory in more esteem than the tenderness of the first days together. When you would spend the last penny of your happiness with your sweetheart, on the night of my triumph, do not come to me! I will not know you. And how will I be able to help? I would not know how to heal the happiness.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)
SetGlobal("VP_Sime_vs_Aerie","GLOBAL",3)~ EXIT
END
END

//Jaheira Romance

CHAIN IF WEIGHT #-49 ~Global("VP_Sime_vs_Jaheira","GLOBAL",1)~ THEN VPSIMEJ SimeJaheiraRomcon0
~Listen, Jaheira, I know that look. Stop nagging at me, just say you are jealous and be done with it.~ DO ~SetGlobal("VP_Sime_vs_Jaheira","GLOBAL",2)~
== JAHEIRAJ ~Jealous? No, I am not. Why would I? I am only pitying <CHARNAME>. The empty-headed toy like you would not give anything. You are not capable to give and instill the true deep feelings, warm and tender, of the sort my Khalid and I shared.~
== VPSIMEJ ~So deep, warm and tender that you have remembered them for what? Three days? Before starting to try to entice your former ward?~
== JAHEIRAJ ~Child, are you going just to sit there and listen your mouth agape, to some foolish girl to shame your oldest friend?~
== VPSIMEJ ~(*laughs*) Oldest, yeah, that’s true. But friend?~
END
IF ~~ THEN REPLY ~Eh, Sime. Lay off. Jaheira is a real friend and a loyal companion, I would not have her insulted.~ EXTERN ~JAHEIRAJ~ SimeJaheiraRomcon1
IF ~~ THEN REPLY ~Jaheira, pay Sime no heed. She will never understand the true love, such as you and I share.~ EXTERN ~JAHEIRAJ~ SimeJaheiraRomcon2
IF ~~ THEN REPLY ~Jaheira, I love Sime. If you are as loyal to me as you always claim to be, you shall accept this. Otherwise, the roads are free for all to use.~ EXTERN ~JAHEIRAJ~ SimeJaheiraRomcon3

CHAIN JAHEIRAJ SimeJaheiraRomcon1
~I? A loyal companion? So that's how you feel about me? I shall remember.~
== VPSIMEJ ~(*sighs*) I was rude, I am sorry.~ DO ~SetGlobal("JaheiraRomanceActive","GLOBAL",3)~
EXIT

CHAIN JAHEIRAJ SimeJaheiraRomcon2
~Oh, now I hear a man grown, not a boy!~
== VPSIMEJ ~I see. Know <CHARNAME>, that I will not ask you for your love again. It looks that you find a good place for it. But hid my advice, tell her how I loved you.~
= ~The foolish ones hold the sense of victory in more esteem than the tenderness of the first days together. When you would spend the last penny of your happiness with your sweetheart, on the night of my triumph, do not come to me! I will not know you. And how will I be able to help? I would not know how to heal the happiness.~ DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~
EXIT

CHAIN JAHEIRAJ SimeJaheiraRomcon3
~I think that I shall use it then.~
== VPSIMEJ ~Jaheira, you do not have to... I was rude, I am sorry... I am afraid it is too late, <CHARNAME>. Her mind was set on leaving. I am sorry, I did not mean for you to loose your friend.~
DO ~SetGlobal("JaheiraRomanceActive","GLOBAL",3)
ActionOverride("Jaheira",LeaveParty())
ActionOverride("Jaheira",EscapeArea())~
EXIT

//Viconia Romance

CHAIN IF WEIGHT #-56 ~Global("VP_Sime_vs_Viconia","GLOBAL",1)~ THEN VPSIMEJ SimeViconiaRomcon0
~(*Wakes up with a startle*)... What is it? Viconia!~ DO ~SetGlobal("VP_Sime_vs_Viconia","GLOBAL",2)~
== VICONIJ ~(*Hisses and tries to stab Sime*)~
END
IF ~~ THEN REPLY ~What is going on? I did not think you were such close friends to stay up late and chat.~ EXTERN VPSIMEJ SimeViconiaRomcon1
IF ~~ THEN REPLY ~Can I ever get any sleep around here? Viconia, Sime, break it!~ EXTERN VPSIMEJ SimeViconiaRomcon1
IF ~~ THEN REPLY ~What in Nine Hells is going on?~ EXTERN VPSIMEJ SimeViconiaRomcon1

CHAIN VPSIMEJ SimeViconiaRomcon1
~That wicked bitch tried to stab me, that’s all.~
== VICONIJ ~Shut up mrannd d'ssins. Rivvin.~
END
IF ~~ THEN REPLY ~Viconia, that's it. I have given you shelter against fanatics and how do you repay me? By trying to kill the woman I love?~ EXTERN VICONIJ SimeViconiaRomcon2
IF ~~ THEN REPLY ~Viconia, get you backpack and go away. Now!~ EXTERN VICONIJ SimeViconiaRomcon3

CHAIN VICONIJ SimeViconiaRomcon2
~Jal ssinrig zhah waella - All love is foolish.~
END
++ ~No it is not. You are wrong, have not I taught you anything? (*sighs*) Oh, Viconia. I guess it is my own fault, I should not have spend so much time with another and give your poor lost heart so much troubles. Sime, I am sorry about what have happened. I am sure you have it in you to forgive both Viconia and myself. I should not have abandoned the road I walked with Viconia.~ EXTERN VPSIMEJ SimeViconiaRomcon4
++ ~Whatever you say, Viconia. But do not you dare to as much as look at Sime unfriendly again! I am sorry that you have suffered from that vile woman, Sime. Be strong, my love.~ EXTERN VPSIMEJ SimeViconiaRomcon5

CHAIN VICONIJ SimeViconiaRomcon3
~I was going to. (*laughs*) But I wanted to kill your blonde first. Ssun usst - fear me!~
DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)
LeaveParty()
EscapeArea()~ EXIT

CHAIN VPSIMEJ SimeViconiaRomcon4
~Well, walk it then, <CHARNAME>, but watch your step. For you might accidentally end up in Abyss.~
DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)~ EXIT

CHAIN VPSIMEJ SimeViconiaRomcon5
~I am not about to cease breathing yet, <CHARNAME>. It left unpleasant taste in my mouth, but for your love I am ready to endure worst things.~
DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)~ EXIT

////FLIRTS

//Early

APPEND VPSIMEJ

IF ~IsGabber(Player1) GlobalGT("LoveTalk","GLOBAL",2) GlobalLT("LoveTalk","GLOBAL",23) OR(2) Global("VP_SimeRomanceActive","GLOBAL",1) Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN BEGIN VPPID1
SAY ~(*You notice Sime approaching you with a smile on her lips. The two of you have become quite close lately, growing beyond that of simple companionship.*)~
IF ~~ THEN REPLY ~(*Sime stands close to you and gently eases her body against yours for support. You wrap an arm firmly about her shoulder, and kiss the side of her head softly.*)~ GOTO flirt_14
IF ~~ THEN REPLY ~(*Sime pulls your body to hers and hugs you close. She fits perfectly against you, as though your bodies had grown to come together in perfect harmony, like the pieces of a puzzle... As soon as you come into contact with each other, her breathing eases into a steady, content rhythm. It warms your heart to know you can soothe her in such a way.*)~ GOTO flirt_15
IF ~~ THEN REPLY ~(*Sime bestows to you a quick kiss to your cheek, smiling gently as she does so.*)~ GOTO flirt_16
IF ~~ THEN REPLY ~(*You notice that Sime has been watching you carefully for the past few minutes. As you turn toward her to demand an explanation, she simply smiles mysteriously and winks at you.*)~ GOTO flirt_17
IF ~~ THEN REPLY ~<CHARNAME>, I just wanted to thank you for allowing me to see the world with you. You have been a good friend to me  (*Sime smiles and clasps hands with yours*)...~ GOTO flirt_18
IF ~~ THEN REPLY ~(*Sime giggles and bites at the tip of your nose playfully*)...~ GOTO flirt_19
IF ~~ THEN REPLY ~(*Sime quickly inspects the straps of your traveling gear and pack. She notices that a strap is loose on your arm, and tightens it for you.*)~ GOTO flirt_20
IF ~AreaType(OUTDOOR) CheckStatLT(Player1,16,STR)~ THEN REPLY ~(*As the party silently walks down the beaten path, Sime decides to break the lull and pounces on your back.*)~ GOTO flirt_21a
IF ~AreaType(OUTDOOR) CheckStatGT(Player1,15,STR)~ THEN REPLY ~(*As the party silently walks down the beaten path, Sime decides to break the lull and pounces on your back.*)~ GOTO flirt_21b
END

IF ~~ THEN BEGIN flirt_14
SAY ~(*Sime turns her bright gaze upward into your eyes and, leaning into you, gives you an impassioned kiss to your lips.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_15
SAY ~(*She kisses your cheek firmly before releasing you. You can’t help but feel more empty now that she is out of your arms.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_16
SAY ~(*You hope for more, but instead she turns her back to you, allowing you a splendid view of her graceful figure.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_17
SAY ~(*She begins to quietly hum a random tune and turns away, pretending to occupy herself with cleaning her weapons while still watching you from the corner of her eye.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_18
SAY ~(*She gazes into your eyes with a look that mixes between wonder and affection, and runs her free hand down your cheek and jaw line, sending a slight shiver to course down your spine.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_19
SAY ~(*Before you can ask what brought that on, she has already moved behind you, and wraps her arms wrapped around your neck, breathing contently.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_20
SAY ~(*She smiles and runs her hand down the length of your arm and over the back of your hand in a gentle caress.*) You must remember to keep your traveling equipment in proper order, though I do not mind lending a hand every now and then.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_21a
SAY ~(*You lurch forward with a forlorn yelp, resigned to the fact that the hard ground is quite suddenly rushing up to meet you. Both you and Sime hit the dirt with a resounding smack, but Sime at least has a most convenient cushion for her fall.*)~
= ~(*Sime giggles into your ear and whispers a half-hearted apology before kissing your temple. The pain from the fall vanishes from your mind as you roll under Sime and stare up into her smiling, beautiful features.*)~
= ~Do you forgive me, <CHARNAME>? (*Sime wears her most innocent look, and trails a finger down your forehead and the length of your nose, stopping at your lips.*)~
= ~(*She then leans down and kisses you very sweetly on the lips, causing your heart to beat fiercely and your stomach to tie in knots*)... I knew you would! ~
= ~(*She lets you up then, allowing you to gather your equipment and the last bit of your dignity before hugging you tightly, and resuming her place in line.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_21b
SAY ~(*You stumble forward with a surprised yell, alerting the other party members who, at first think, you were attacked by some vicious animal. When they notice it is only a giggling Sime all they can do is roll their eyes.*)~
= ~(*You manage to support the combined weight of Sime, along with both her and your own equipment.*)~
= ~(*Sime bears no shame, and is giggling madly as you hoist her farther up your back, but you decide to turn the tables against her by reaching behind and grabbing her waist, and with a might swing, she is soon facing you and haning off of your hips.*)~
= ~(*You mash a long and deep kiss upon her rosy lips, both out of pure desire and to stifle the incessant laughing she emits. After your reluctant parting, she slips down from your arms and hugs you tightly, before resuming pace with the rest of the party.*)~
IF ~~ THEN EXIT
END

//Late

IF ~IsGabber(Player1) GlobalGT("LoveTalk","GLOBAL",22) OR(2) Global("VP_SimeRomanceActive","GLOBAL",1) Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN BEGIN flirts_B
SAY ~(*You find your gaze wandering over to Sime. Her sweet disposition belies the crowd of grim Shadow Thieves you found her hanging around with, and you are eager to learn more about her.*)~
+ ~RandomNum(3,1)~ + ~(*Admire Sime’s exquisite beauty and unmatched grace. You realize that you have never before come across such a fair and exotic woman in all of your travels.*)~ + flirt_1a
+ ~RandomNum(3,2)~ + ~(*Admire Sime’s exquisite beauty and unmatched grace. You realize that you have never before come across such a fair and exotic woman in all of your travels.*)~ + flirt_1b
+ ~RandomNum(3,3)~ + ~(*Admire Sime’s exquisite beauty and unmatched grace. You realize that you have never before come across such a fair and exotic woman in all of your travels.*)~ + flirt_1c
+ ~RandomNum(3,1)~ + ~(*You reach for Sime’s hand after removing your cumbersome gloves. Your hand is afire with the desire of her touch, and her soft skin is the only thing to quench your thirst for her.*)~ + flirt_2a
+ ~RandomNum(3,2)~ + ~(*You reach for Sime’s hand after removing your cumbersome gloves. Your hand is afire with the desire of her touch, and her soft skin is the only thing to quench your thirst for her.*)~ + flirt_2b
+ ~RandomNum(3,3)~ + ~(*You reach for Sime’s hand after removing your cumbersome gloves. Your hand is afire with the desire of her touch, and her soft skin is the only thing to quench your thirst for her.*)~ + flirt_2c
+ ~RandomNum(3,1)~ + ~(*You lean into Sime to fulfill your desire to feel her mouth against yours. Sime’s mouth is sweet and her lips rosy red, and you are nearly driven wild in anticipation.*)~ + flirt_3a
+ ~RandomNum(3,2)~ + ~(*You lean into Sime to fulfill your desire to feel her mouth against yours. Sime’s mouth is sweet and her lips rosy red, and you are nearly driven wild in anticipation.*)~ + flirt_3b
+ ~RandomNum(3,3)~ + ~(*You lean into Sime to fulfill your desire to feel her mouth against yours. Sime’s mouth is sweet and her lips rosy red, and you are nearly driven wild in anticipation.*)~ + flirt_3c
+ ~RandomNum(3,1)~ + ~(*Shower Sime’s face and neck with soft, wet kisses.*)~ + flirt_4a
+ ~RandomNum(3,2)~ + ~(*Shower Sime’s face and neck with soft, wet kisses.*)~ + flirt_4b
+ ~RandomNum(3,3)~ + ~(*Shower Sime’s face and neck with soft, wet kisses.*)~ + flirt_4c
+ ~RandomNum(3,1)~ + ~I’m glad that Aran allowed you to join me, Sime. I truly enjoy your presence here beside me.~ + flirt_5a
+ ~RandomNum(3,2)~ + ~I’m glad that Aran allowed you to join me, Sime. I truly enjoy your presence here beside me.~ + flirt_5b
+ ~RandomNum(3,3)~ + ~I’m glad that Aran allowed you to join me, Sime. I truly enjoy your presence here beside me.~ + flirt_5c
+ ~RandomNum(3,1)~ + ~(*Tug Sime toward you for a close, intimate embrace. The contact of her body against yours ignites an inner warmth deep within your heart, making you wonder how you could have ever possibly gone through a day without holding her.*)~ + flirt_6a
+ ~RandomNum(3,2)~ + ~(*Tug Sime toward you for a close, intimate embrace. The contact of her body against yours ignites an inner warmth deep within your heart, making you wonder how you could have ever possibly gone through a day without holding her.*)~ + flirt_6b
+ ~RandomNum(3,3)~ + ~(*Tug Sime toward you for a close, intimate embrace. The contact of her body against yours ignites an inner warmth deep within your heart, making you wonder how you could have ever possibly gone through a day without holding her.*)~ + flirt_6c
+ ~RandomNum(3,1)~ + ~(*Throw aside all care and modesty and caress Sime’s torso and the curves of her body. Her feminine, yet strong build verily begs to be touched and you cannot hold back any longer.*)~ + flirt_7a
+ ~RandomNum(3,2)~ + ~(*Throw aside all care and modesty and caress Sime’s torso and the curves of her body. Her feminine, yet strong build verily begs to be touched and you cannot hold back any longer.*)~ + flirt_7b
+ ~RandomNum(3,3)~ + ~(*Throw aside all care and modesty and caress Sime’s torso and the curves of her body. Her feminine, yet strong build verily begs to be touched and you cannot hold back any longer.*)~ + flirt_7c
+ ~RandomNum(3,1)~ + ~(*Engulf your hands into Sime’s golden tresses, twining her hair between your fingers.*)~ + flirt_8a
+ ~RandomNum(3,2)~ + ~(*Engulf your hands into Sime’s golden tresses, twining her hair between your fingers.*)~ + flirt_8b
+ ~RandomNum(3,3)~ + ~(*Engulf your hands into Sime’s golden tresses, twining her hair between your fingers.*)~ + flirt_8c
+ ~RandomNum(3,1)~ + ~(*Cup Sime’s face between your palms. You slide your tongue easily between full lips that part eagerly for you and massage her tongue with your own.*)~ + flirt_9a
+ ~RandomNum(3,2)~ + ~(*Cup Sime’s face between your palms. You slide your tongue easily between full lips that part eagerly for you and massage her tongue with your own.*)~ + flirt_9b
+ ~RandomNum(3,3)~ + ~(*Cup Sime’s face between your palms. You slide your tongue easily between full lips that part eagerly for you and massage her tongue with your own.*)~ + flirt_9c
+ ~RandomNum(3,1)~ + ~(*You present to Sime a branch of berries you found along a path earlier that morn. After carefully testing their flavor and safety, you tingle with excitement as Sime takes the berries from you.*)~ + flirt_10
+ ~RandomNum(3,1) AreaType(OUTDOOR)~ + ~(*The sun glistening off of Sime’s honey hair inspires you to humble yourself before her, and recite lines of love and adoration to her.*)

Lady of my life, gentle maiden of my dreams and fairy tails,
Let this poor <PRO_MANWOMAN> be blessed by your touch,
The feel of your featherlike hand across my skin
and your sweet breath against my face
Is bliss, let this <PRO_MANWOMAN> be glorified by
Your words of praise and love.
I am yours, my Sime
Now, and forevermore.~ + flirt_11a
+ ~RandomNum(3,2) AreaType(OUTDOOR)~ + ~(*The sun glistening off of Sime’s honey hair inspires you to humble yourself before her, and recite lines of love and adoration to her.*)

Sime, your beauty in this light
And any light for that matter,
Is unmatched by even the most
Glamorous of dryads, or the
Most splendid of Solars
Even the most heavenly
Of Goddesses pale when
Compared to you, dearest Sime,
Please say nothing, but know
That these just words echo
Throughout my mind
Like a thunderous underground waterfall
In a shining, diamond cavern.~ + flirt_11b
+ ~RandomNum(3,3) AreaType(OUTDOOR) CheckStatLT(Player1,13,INT)~ + ~(*The sun glistening off of Sime’s honey hair inspires you to humble yourself before her, and recite lines of love and adoration to her.*)

Uh... demons are red,
Xvarts  are blue,
The Abyss is really hot,
...and so are you!~ + flirt_11c
+ ~RandomNum(3,1) AreaType(DUNGEON)~ + ~(*You notice that Sime seems a bit on edge as of late. You come up beside her and rest an arm about her small shoulders and pull her close to you. Sime looks up at you with gratitude, and you kiss the side of her head softly to comfort her*) Is everything well, my shining star?~ + flirt_12a
+ ~RandomNum(3,2) AreaType(DUNGEON)~ + ~(*You notice that Sime seems a bit on edge as of late. You come up beside her and rest an arm about her small shoulders and pull her close to you. Sime looks up at you with gratitude, and you kiss the side of her head softly to comfort her*) Is everything well, my shining star?~ + flirt_12b
+ ~RandomNum(3,1) AreaType(DUNGEON)~ + ~(*The party takes a short break in order to restore vitality through food and rest. A small campfire is built, and the blackened shadows swiftly retreat from the intrusion of the light. Sime stares into the flames, lost in thought.*)~ + flirt_13a
+ ~RandomNum(3,2) AreaType(DUNGEON)~ + ~(*The party takes a short break in order to restore vitality through food and rest. A small campfire is built, and the blackened shadows swiftly retreat from the intrusion of the light. Sime stares into the flames, lost in thought.*)~ + flirt_13b
+ ~RandomNum(3,3) AreaType(DUNGEON)~ + ~(*The party takes a short break in order to restore vitality through food and rest. A small campfire is built, and the blackened shadows swiftly retreat from the intrusion of the light. Sime stares into the flames, lost in thought.*)~ + flirt_13c
END

IF ~~ THEN BEGIN flirt_1a
SAY ~(*Your eyes linger over the half-elf’s features and body. You note the way her hair flows behind her like a sun-kissed cloth, how her eyes glitter whenever a laugh escapes her lips, and how the trials and tribulations you endure with her never seem to wipe a smile off of her fair face.*)~
= ~(*Her eyes meet yours suddenly, causing your stomach to flutter. She tilts her head to the side and starts making silly faces at you, giggling when you feel your neck and ears heat in an embarrassed blush.*)~
= ~I thought I heard you singing about love, <CHARNAME>. It was lovely enough, but your voice could use a bit of  tuning, however.~
= ~(*Sime giggles at you, and you can only imagine how red your ears and neck must have turned.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_1b
SAY ~(*Sime is currently walking ahead of you, making it easier for you to admire her without being noticed. The easy swaying of her hips and her graceful step are only a few of the great many things about her that you notice.*)~
= ~(*You suddenly find yourself aching for her touch, and burning for the feel of her in your arms. Sime whirls suddenly and presses her mouth against yours, expertly slipping her tongue into your mouth. When the moment is over, she laughs heartily at your surprised expression.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_1c
SAY ~(*Her glistening eyes captivate you as you stare into them. They each have their own inner glow as bright as a thousand suns.*)~
= ~(*Your gaze wanders to the slight curve of her nose to her rich yet subtle lips. When you look back up to her eyes she finds herself staring straight back at you, making you blink in surprise.*)~
= ~(*Sime giggles*) It seems I won that staring contest, <CHARNAME>!~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_2a
SAY ~(*You slowly reach out with your right hand toward her left, but pull away nervously. A moment later, you try to take her hand again but find yourself too nervous to go through with it, and you pull away yet again.*)~
= ~(*Finally, you muster enough courage to reach for her a third time, but Sime snatches your hand in hers. Surprised, you look into her face and see her smiling.*)~
= ~You should try and learn some more subtlety, <CHARNAME>. (*She says, tossing you a wink.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_2b
 SAY ~(*You wrap her free hand in your own, reveling in her touch.*)~
= ~(*Sime looks to you in puzzlement, and politely releases herself from your grip*) I’m sorry, <CHARNAME>, it was sweet, but this isn’t a good time.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_2c
SAY ~(*After interlocking your fingers with hers, Sime’s hand trembles slightly at the sudden contact, but she does not pull away. The two of you walk on for a while as such, until she decisively turns and breaks your hold, in order to inspect her weapons and armor.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_3a
SAY ~(*Sime at first doesn’t react to the sudden brush of your lips on hers, as if she isn’t quite certain of what just happened. She quickly regains her composure and yanks her head back, looking at you with a dark expression on her face.*)~
= ~Look, <CHARNAME>, you have been very kind to me so far, but I do not think I’m prepared to advance our...relationship...that far yet.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_3b
SAY ~(*Sime’s lips lock with yours for a brief moment. You are nearly overcome by the sweetness of the moment, but Sime soon breaks away before any further advancement.*)~
= ~Ah, <CHARNAME>, what exactly have you been drinking as of late?~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_3c
SAY ~(*To your surprise, Sime returns your kiss. It is not the sensual kiss of lovers, but it is more than the formal peck of friends as well. The two of you part quickly, and you feel your heart pounding in your chest. You look to Sime, only to find that she has turned and is walking away from you.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_4a
SAY ~(*You hungrily begin kissing Sime on her forehead, then moving down to her eyelids and the very tip of her nose. She does not pull away or resist your attention, until you reach her neck and upper chest.*)~
= ~(*She lightly but firmly pushes you away, a clear message in her eyes warning you to keep your hands to yourself.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_4b
SAY ~(*You kiss both of Sime’s cheeks, and then her nose. You do not get much farther than that, for she pulls back, trying to suppress a giggle.*)~
= ~I’m sorry <CHARNAME>, but I’m ticklish there!~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_4c
SAY ~(*Sime presses her hand on the back of your head, pulling you closer and encouraging your assault. You stop your affectionate kisses at the base of her neck and pull back, beaming at her. Sime rewards you with a long and deep kiss to your lips.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_5a
SAY ~Thank you, <CHARNAME>. I enjoy being with you as well, but remember, I’m also here for my own reasons, not just for bringing pleasure to you.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_5b
SAY ~And I am glad as well. I much prefer your company than a guild of pickpockets and thieves.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_5c
SAY ~Why thank you, <CHARNAME>. I do my best to aid you, and it pleases me to hear I am doing well.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_6a
SAY ~(*Sime rests her body against yours with a gentle grace. Her light breathing caresses the neck of your skin as you hold her close, causing a tingle to run up your spine.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_6b
SAY ~(*You seem to have picked the perfect moment to give Sime comfort, for she clings to you with desperation.*)~
= ~(*Sime balls her hands into fists while she grips your clothing tightly, and softly whispers something into your shoulder*) Mielikki, bless you.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_6c
SAY ~(*Sime nuzzles her nose against your neck as you hold each other. You are suddenly overcome in a wave of warmth and care, and from the way that Sime holds you as though making sure you are real, you can tell she is experiencing the same.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_7a
SAY ~(*Sime is distracted momentarily by the attention, but she quickly grips your wandering hands by the wrists and pushes you back.*)~
= ~Do not... do not touch me that way, <CHARNAME>.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_7b
SAY ~(*Sime slaps your hands away from her body angrily*) I am not an object, <CHARNAME>. Do not treat me as something to be manhandled as such.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_7c
SAY ~(*You reach towards Sime, but she turns away unexpectedly, making your hands bump into her back. She turns her head around and gazes at you warily, but softens her visage quickly.*)~
= ~(*Sime leans backward into you and presses her back against your stomach while wrapping your arms around her*) You could have just asked if you wanted a hug, <CHARNAME>.~
= ~(*Though it is not exactly what you had in mind, the hug is still quite intimate.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_8a
SAY ~(*Sime welcomes your touch and closes her eyes and smiles to herself as you stroke and play with her hair.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_8b
SAY ~(*Sime smiles mischievously, then she flips her head about, sending her hair flying into your face. Sime laughs sweetly as the loose strands momentarily blind your eyes, and as you sputter to remove the pieces of hair that flew into your mouth.*)~
= ~I’m sorry, <CHARNAME>, it was just too tempting! And you know I love to tease you. (*Sime kisses you once, then twice on the lips in an effort to apologize.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_8c
SAY ~(*Sime reaches out slowly and likewise runs her fingers through your hair. Her soft stroking soothes you, and you feel at peace. She looks as if she wants to say something, but seems to be afraid of spoiling the moment. Instead, she compromises by leaning forward and moves up and down the side of your neck leaving soft, wet kisses in her wake.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_9a
SAY ~(*Sime’s breath quickens in your mouth and she presses against you with a fierce and fiery passion. Your tongues fight each other in a playful match for dominance of the other’s mouth.*)~
= ~(*Your parting is slow and breathless, and Sime’s eyes speak an unfathomable amount of trust and dedication for you.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_9b
SAY ~(*Sime’s reaction is initially slow, but the passion between you two builds wonderfully quickly.*)~
= ~You make me so happy, <CHARNAME>... (*Sime manages to say between chaste kisses. You make certain that your responding kiss tells her of all the adoration you hold for her as well.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_9c
SAY ~(*Sime moves her head backwards denying you the sweetness of her mouth for a moment and tries to speak to you when you suddenly press your mouth on hers, and her words flow into your mouth as an incoherent stream of sound.*)~
= ~(*Her tongue rolls over yours in a wild and beautiful dance inside your mouth*)...~
= ~(*When you finally break the embrace, she grins widely while catching her breath*)... I was just about to say that it had been a while since you last kissed me, <CHARNAME>. Are you certain that one of your gifts as a Bhaalspawn isn’t telepathy?~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_10
SAY ~(*Sime teases you delightfully. She carefully plucks a berry from the branch, and rolls it betwixt her fingers. She brings it to her nose, and smells it slowly. Then, she runs the berry over her succulent lips, slipping her tongue from her mouth and tasting the sweetness of the fruit.*)~
= ~(*You think you hear a pitiful whimpering, and only then you realize it is coming from you. Sime ends her game by slowly inserting the fruit into her delicate mouth, and reverentially chews it before swallowing.*)~
= ~(*She giggles while looking at you, then spits the pit out so that it bounces off of your sweating forehead*)... Mmm, delicious, <CHARNAME>...~
= ~(*You groan in exasperation and surrender the rest of the branch to her.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_11a
SAY ~(*You think you see a tear well in one of Sime’s eyes, but she blinks it away.*)~
= ~That was... wonderful <CHARNAME>, but know you that I am not one to condone slavery. (*She giggles*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_11b
SAY ~(*Thank... thank you, <CHARNAME>. That was much better than the one lined poems some of the Shadow Thieves would grant me... I did not know you felt so much about me.*)~
= ~(*She looks as if she wants to say something to tease you, but thinks better of it. This is a rare moment when Sime actually doesn’t have a clever retort to give... you must have touched her deeply indeed.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_11c
SAY ~Umm... thank you, <CHARNAME>. Please tell me that you didn’t spend all day thinking of that one.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_12a
SAY ~(*Sime smiles at you and snuggles closer to you*)... Everything is all right now, my walking headrest. (*She accentuates her claim by resting her head against your shoulder, humming gently to herself.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_12b
SAY ~Hmm? Oh... of course, I am fine. I thought I smelled undead... I always become distant when the air tastes of the stench of a mummy or vampire. I have never taken a liking to them...~
= ~(*Sime’s distracted look returns to her countenance, but you decide to respect her privacy and not press it any further.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_13a
SAY ~(*You begin singing a well-known song of valor and love, seeing if the rest of the group will join in.*)~
= ~(*No one else joins in with your singing, but the mood does seem to lighten because of it. Sime, however, continues to stare into the flames.*)~
= ~(*Undaunted, you raise the tone of your voice and change the fair lady’s name in the song to “Sime”. You certainly arouse her attention then, and she shakes her head almost resolutely. Seeing you falter in your singing brings a tired, but genuine smile to her face, a reward in itself  for your efforts.*)~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_13b
SAY ~(*You playfully toss a pebble in her direction.*)~
= ~(*Sime’s head shoots up after the pebble bounces harmlessly off of her. You try to suppress a laugh, but to no avail. At first she glares at you in hurt and betrayal, but then it seems she decides she is being too serious and mediocre for her own good.*)~
= ~(*Sime quickly retaliates by launching a barrage of small stones and pebbles back at you, making you squirm and wriggle in surprise. It then becomes a full-fledged throwing contest, and you are soon resorting to food, wrappers, and even the occasional pillow.*)~
= ~(*By the end of your play, you and Sime are laying side by side giggling and laughing at each other’s expense. Sime sits up on her elbows, leaning over you. She then leans down and kisses you softly, sliding her tongue against yours*)...~
= ~I feel better now, <CHARNAME>, thank you.~
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN flirt_13c
SAY ~(*You do nothing.*)~
= ~(*Sime glances up at you from time to time, shifting her gaze from the fire to your face. After a moment of more contemplation, she turns away, and settles into her bedroll, and is soon asleep.*)~
IF ~~ THEN EXIT
END

/////////////////////////////////////////////////////

IF WEIGHT #-95 ~Global("AsylumPlot","GLOBAL",2)
Global("simespeak","GLOBAL",0)~ THEN BEGIN VPSimeAsylumPlot2
  SAY ~I do not trust this pirate, <CHARNAME>. His manner is that of a fool, but his behavior during the voyage betrays a cunning mind beneath.~
  IF ~~ THEN REPLY ~He has delivered us as promised. There are more important things to worry about. ~ DO ~SetGlobal("simespeak","GLOBAL",1)
SetGlobal("SaemNoBodhi","GLOBAL",1)~ GOTO VPSimeAsPlot2a
  IF ~~ THEN REPLY ~Kill him if you wish. I don’t care either way.~ DO ~SetGlobal("simespeak","GLOBAL",1)
SetGlobal("SaemNoBodhi","GLOBAL",1)~ GOTO VPSimeAsPlot2b
  IF ~~ THEN REPLY ~He seems amiable enough to me. Come, you’ll feel better once off the ship.~ DO ~SetGlobal("simespeak","GLOBAL",1)
SetGlobal("SaemNoBodhi","GLOBAL",1)~ GOTO VPSimeAsPlot2a
END

IF ~~ THEN BEGIN VPSimeAsPlot2a
  SAY ~Agreed. Be prepared, this place is dangerous enough even without my suspicions of Saemon. ~
  IF ~~ THEN DO ~MoveToPoint([863.2422])~ EXIT
END

IF ~~ THEN BEGIN VPSimeAsPlot2b
  SAY ~We may need his ship for our return. No, just be on your guard. He is probably the least of our worries in this place.~
  IF ~~ THEN DO ~MoveToPoint([863.2422])
SaveGame(0)~ EXIT
END
END

CHAIN IF WEIGHT #-94 ~Global("AsylumPlot","GLOBAL",5)~ THEN VPSIMEJ VPSimeAsylumPlot5.0
~I knew he would prove treacherous. Our threats were sufficient to keep us safe while afloat, but there must be someone here that he fears even more.~
== ANOMENJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN #55696
== VICONIJ IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN #55695
== JAHEIRAJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN #55693
== VPSIMEJ ~Certainly this was Bodhi’s doing. These creatures would not have followed Saemon of their own will. His weakness would disgust them.~
END
  IF ~~ THEN REPLY ~Unfortunately he fled the battle. I shall be sure to repay him if I see him again.~ DO ~SetGlobal("AsylumPlot","GLOBAL",6)~ GOTO VPSimeAsylumPlot5.2
  IF ~~ THEN REPLY ~We should find him, track him to his lair! He has earned his death from this!~ DO ~SetGlobal("AsylumPlot","GLOBAL",6)~ GOTO VPSimeAsylumPlot5.2
  IF ~~ THEN REPLY ~Forget him. I have no fear of him or any scheme he might come up with.~ DO ~SetGlobal("AsylumPlot","GLOBAL",6)~ GOTO VPSimeAsylumPlot5.2

CHAIN VPSIMEJ VPSimeAsylumPlot5.2
~There are more important things to worry about right now, anyway. I must see that you are able to enter the asylum.~
=~Go to the tavern. Speak with a man named Sanik. If there is a way in to the asylum, he will know it.~
=~Work with haste, <CHARNAME>. Our enemies know we are here.~ 
END
IF ~~ THEN UNSOLVED_JOURNAL ~Getting Inside the Asylum

With the vampires defeated and Saemon fled, Sime said that Bodhi was probably behind the pirate’s treachery. I must work quickly to gain access to the asylum. Sime said to go to the local tavern and speak to a man named Sanik.~ EXIT

/////////////////////////////////
///////// LT32 - MALE
/////////////////////////////////

APPEND VPSIMEJ

IF WEIGHT #-93 ~Global("VP_Aran_Ring","GLOBAL",2)~ THEN BEGIN 45
  SAY ~<CHARNAME>, I wonder what you told him, that settled him down.~
  IF ~~ THEN REPLY ~I told him, that I am going to marry you. Aran gave me your mother’s ring. Will you accept it from me?~ GOTO 46
  IF ~~ THEN REPLY ~Just what he wanted to hear, Sime. He is just worried I will mistreat you. Aran gave me your mother’s ring. Will you accept it from me?~ GOTO 48
  IF ~~ THEN REPLY ~Some nonsense. Aran gave me your mother’s ring. Will you accept it from me?~ GOTO 48
END

IF ~~ THEN BEGIN 46
  SAY ~You what? Are you mad? What are we going to do if Aran takes it seriously and books the biggest temple in Athkatla for the wedding before we know it?~
  IF ~~ THEN REPLY ~(*Smile disarmingly*)... We will... elope?~ GOTO 47
  IF ~~ THEN REPLY ~Go there and get married, what else?~ GOTO 47
  IF ~~ THEN REPLY ~He won’t. And if he does, we’ll find a way around it, unless you do want to marry me.~ GOTO 47
  IF ~~ THEN REPLY ~Oh, Sime you and your father are both too... emotional.~ GOTO 47
END

IF ~~ THEN BEGIN 47
  SAY ~You and your odd sense of humor! All right, I guess we will worry about it when the time comes. And you took the ring! My father was trying to press this thing on me for ages. I do not like it, but I guess now I’ll have to take it so I will not land you in trouble.~
  IF ~~ THEN DO ~TakePartyItem("VPArRing")
SetGlobal("VP_Aran_Ring","GLOBAL",3)
SetGlobal("VP_Sime_PCThief","GLOBAL",1)
RealSetGlobalTimer("VP_SimeThiefBanter","GLOBAL",1800)~ EXIT
END

IF ~~ THEN BEGIN 48
  SAY ~By Mielikki! My father was trying to press this thing on me for ages. I do not like it, but I guess now I’ll have to take it so I will not land you in trouble.~
  IF ~~ THEN DO ~TakePartyItem("VPArRing")
SetGlobal("VP_Aran_Ring","GLOBAL",3)
SetGlobal("VP_Sime_PCThief","GLOBAL",1)
RealSetGlobalTimer("VP_SimeThiefBanter","GLOBAL",1800)~ EXIT
END

IF WEIGHT #-92 ~Global("VP_Sime_PCThief","GLOBAL",2)~ THEN BEGIN 49
  SAY ~I was comparing you to my father, <CHARNAME>, and I came to the conclusion that you are very similar. I am sure that he was the same way as you are in his youth. No law but his own law, live fast, live on the edge, consider everything to be easy come, easy go. It is attractive, but I know what has happened to my father at the end. ~
  IF ~~ THEN REPLY ~Where is this ominous talk leading?~ GOTO 50
  IF ~GlobalGT("PlayerThiefGuild","GLOBAL",0)~ THEN REPLY ~Is it because I took charge of the Guild?~ GOTO 54
  IF ~~ THEN REPLY ~So what? Do not all girls fall hardest for those who remind them of their fathers?~ GOTO 55
END

IF ~~ THEN BEGIN 50
  SAY ~I think, what I meant to say is, it would be best for both of us to discontinue our relationship.~
  IF ~~ THEN REPLY ~Ah? Why in Nine Hells do you think that?~ GOTO 51
  IF ~~ THEN REPLY ~I think I deserve a better explanation than that. What, you feel like you are committing an act of incest? You have some other complex psychological reason to dislike sleeping with me?~ GOTO 51
  IF ~~ THEN REPLY ~Women. Cannot live with them, cannot live without them. Sime, it beats me why you want to walk out on me.~ GOTO 51
  IF ~GlobalGT("PlayerThiefGuild","GLOBAL",0)~ THEN REPLY ~Sime, do not do that! If you wish, I’ll refuse to be the Guild Master, I’d do anything to keep you.~ GOTO 52
  IF ~~ THEN REPLY ~Have it your way. We are history.~ GOTO 53
END

IF ~~ THEN BEGIN 51
  SAY ~I love my father against my good judgement and all my adult life I was fighting to change him into something he is not. I do not wish that to be repeated with you. You should follow your own way, <CHARNAME>, and I shall follow mine. There is nothing more to discuss.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_Sime_PCThief","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN 52
  SAY ~No, I do not want you to do that. <CHARNAME>, I love my father against my good judgement and all my adult life I was fighting to change him into something he is not. I do not wish that to be repeated with you. You should follow your own way, <CHARNAME>, and I shall follow mine. There is nothing more to discuss.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_Sime_PCThief","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN 53
  SAY ~There is nothing more to discuss then.~
  IF ~~ THEN DO ~SetGlobal("VP_SimeRomanceActive","GLOBAL",3)

SetGlobal("VP_Sime_PCThief","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN 54
  SAY ~That only fleshed out my concern. <CHARNAME>, I think that it would be best for both of us to discontinue our relationship.~
  IF ~~ THEN REPLY ~Ah? Why in Nine Hells do you think that?~ GOTO 51
  IF ~~ THEN REPLY ~I think I deserve a better explanation than that. What, you feel like you are committing an act of incest? You have some other complex psychological reason to dislike sleeping with me?~ GOTO 51
  IF ~~ THEN REPLY ~Women. Cannot live with them, cannot live without them. Sime, it beats me why you want to walk out on me.~ GOTO 51
  IF ~~ THEN REPLY ~Sime, do not do that! If you wish, I’ll refuse to be the Guild Master, I’d do anything to keep you.~ GOTO 52
  IF ~~ THEN REPLY ~Have it your way. We are history.~ GOTO 53
END

IF ~~ THEN BEGIN 55
  SAY ~I guess, yes. I might have been in denial, but now I see clearly that I am attracted to you because you remind me so much of my father. But also, because of it, I think it would be best for both of us to discontinue our relationship.~
  IF ~~ THEN REPLY ~Ah? Why in Nine Hells do you think that?~ GOTO 51
  IF ~~ THEN REPLY ~I think I deserve a better explanation than that. What, you feel like you are committing an act of incest? You have some other complex psychological reason to dislike sleeping with me?~ GOTO 51
  IF ~~ THEN REPLY ~Women. Cannot live with them, cannot live without them. Sime, it beats me why you want to walk out on me.~ GOTO 51
  IF ~~ THEN REPLY ~Sime, do not do that! If you wish, I’ll refuse to be the Guild Master, I’d do anything to keep you.~ GOTO 52
  IF ~~ THEN REPLY ~Have it your way. We are history.~ GOTO 53
END

////////////////////////////////////////////////
//If PC is not thief, Sime starts to talk again
////////////////////////////////////////////////

IF WEIGHT #-91 ~Global("VP_SimeTalksAgain","GLOBAL",1)~ THEN BEGIN 94
  SAY ~<CHARNAME>, it seems to me that you are accustomed to the long marches and slow downs between fierce battles. What did you do to speed up the passage of time? I remember we used to sing when the danger was near or far when I was in Darriel’s company.~
  IF ~~ THEN REPLY ~Sing? Well, there was a good song I used to sing back in the good old days spent with the Candlekeep guard. Do you want to it hear it?~ GOTO 95
  IF ~~ THEN REPLY ~(*You look away momentarily*)... Sime, we used to sing this song before, while our company marched. It helped pass the time and keep the mind on more pleasant matters. Will you permit me to sing it to you?~ GOTO 95
  IF ~~ THEN REPLY ~I was always a loner, my friend, and did not adventure in a big company. But when the going got rough, there was one song I liked to sing. Would you care to hear it?~ GOTO 95
  IF ~~ THEN REPLY ~If you used to do it often then mayhap it is time to renew the tradition. Start up a song, Sime.~ GOTO 100
  IF ~~ THEN REPLY ~Sime, you are a ranger after all, you should understand how important it is to be quiet. I know of one thing which can be done very-very quietly and can take your mind away from the weariness of the road... (*You kiss Sime*)~ GOTO 103
END

IF ~~ THEN BEGIN 95
  SAY ~Yes, nothing would please me more, <CHARNAME>, mayhap it will even help you to relax a bit... (*gently smiles*) ...by lighten our hearts and easing our minds.~
  IF ~~ THEN REPLY ~Far over the misty mountains cold 
To dungeons deep and caverns old 
We must away ere break of day 
To seek the pale enchanted gold.~ GOTO 96
  IF ~~ THEN REPLY ~Old Danilo Twill had a hundred bags ’o gold,
And a dozen times more silver than he could ever hold,
But he lost it all at knucklebones, till he didn’t have a crumb,
Still, there’ll always be more where that came from.~ GOTO 96
  IF ~~ THEN REPLY ~The road goes ever on and on,
Out from the door where it begun,
Now far ahead the Road had gone
Let others follow it who can.~ GOTO 96
END

IF ~~ THEN BEGIN 96
  SAY ~It is quite lovely, but it seems to me that this song has triggered some sadness in you, and that was not my intention this eve, nor would it ever be.~
  IF ~~ THEN REPLY ~I used to sing it with my friends and now my mind is assailed by memories of the fallen. Forgive me this moment of weakness, Sime.~ GOTO 97
  IF ~~ THEN REPLY ~A sweet melancholy griped at my heart, as I remembered the peaceful times, and the past. But, it is over now. Did you find the song to your liking my Lady?~ GOTO 98
  IF ~~ THEN REPLY ~(*Taking Sime’s hand*)... I apologize for giving you rise to concern, it is just that...well song is a very emotional thing. Even for a stoic fighter. It is one of the few ways in which your soul can truly be free of the duties you carry, even if only of a moment or two, it is a welcomed release.~ GOTO 97
  IF ~~ THEN REPLY ~No, no, I was not sad at all, I was just concentrating on keeping the tune right!~ GOTO 99
END

IF ~~ THEN BEGIN 97
  SAY ~I wish to properly thank you for sharing such a significant part of yourself with me... (*Sime kisses you deeply*).~
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

SetGlobal("VP_SimeTalksAgain","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN 98
  SAY ~I like the song and I love the singer.~
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

SetGlobal("VP_SimeTalksAgain","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN 99
  SAY ~(*Laughs*)... You always put all your heart in what you are doing, <CHARNAME>!~
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

SetGlobal("VP_SimeTalksAgain","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN 100
  SAY ~Hear this one, then:
 
Home is behind, the world ahead, 
And there are many paths to tread 
Through shadows to the edge of night, 
Until the stars are all alight.~
  IF ~~ THEN REPLY ~I know this song. I used to sing it with my friends as well. Now my mind is assailed by memories of the fallen. Forgive me this moment of melancholy, Sime.~ GOTO 101
  IF ~~ THEN REPLY ~Oh, Sime! The song reminded me of the peaceful times when I only dreamt of adventures! Thank you!~ GOTO 102
  IF ~~ THEN REPLY ~It is a beautiful song, Sime, but I think that we should keep quiet for a time. I know of one thing which can be done very-very quietly and can take your mind away from the weariness of the road... (*You kiss Sime*)~ GOTO 103
END

IF ~~ THEN BEGIN 101
  SAY ~I wish to properly thank you for sharing such a significant part of yourself with me... (*Sime kisses you deeply*).~
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

SetGlobal("VP_SimeTalksAgain","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN 102
  SAY ~Now we have no shortage of adventure it seems and little precious time for love. I’d like to remind you of what’s the passion is like... (*Sime kisses you deeply*)~
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

SetGlobal("VP_SimeTalksAgain","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN 103
  SAY ~So you did not forget the passion we shared last night? I am glad to feel that in your kiss.~
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeRomanceTimer","GLOBAL",1800)

SetGlobal("VP_SimeTalksAgain","GLOBAL",2)~ EXIT
END

////////////////////////////////////////////////

//Elf dream 1

IF WEIGHT #-90 ~Global("VP_Sime_DreamIsland","GLOBAL",1)~ THEN BEGIN VPSimeDream0
  SAY ~You wanted me here as well? I am... surprised.~
  IF ~OR(2) Race(Player1,ELF) Race(Player1,HALF_ELF)~ THEN REPLY ~Sime, where are we?~ GOTO VPSimeDream1Elf
  IF ~!Race(Player1,ELF) !Race(Player1,HALF_ELF)~ THEN REPLY ~Sime, where are we?~ GOTO VPSimeDream1NoElf
END

IF ~~ THEN BEGIN VPSimeDream1Elf
  SAY ~We are in the Land of Dreams, the Kaimeldor. You are one of our kin, have you never heard of it?   It is an ancient Elven enchantment that allows one to live ones’ dreams for a time. Kaimeldor appears different to everyone. The hunter will come to a forest full of game, and an older man will enter an inn and would taste the best ale...~
  IF ~~ THEN REPLY ~I have been raised by a human, Sime. I have never heard of this enchantment. So, am I dreaming? In this case it should not surprise you that you are here.~ GOTO VPSimeDream2Elf
  IF ~~ THEN REPLY ~I am not as versed in Elven lore as I would like to be, Sime. This enchantment, I have never heard of it, but I like it. Why does it surprise you that you are by my side in Kaimeldor?~ GOTO VPSimeDream2Elf
  IF ~~ THEN REPLY ~I must have been really drunk, when I dreamt this place up. Flowers and silly butterflies everywhere! Give me battles and gore, not some gardens! I do dream of you sometimes, I must confess. If Kaimeldor is what you are saying it to be, then I am not surprised that you are here. How the rest got included is the mystery to me.~ GOTO VPSimeDream3Elf
END

IF ~~ THEN BEGIN VPSimeDream2Elf
  SAY ~It is not a dream, <CHARNAME>, we are both awake and walk Kaimeldor. But to call me to your place in this land we have to share a connection of a kind... a bond...~
  IF ~~ THEN REPLY ~A bond, Sime? You mean the Elven Bond? It is not... impossible, is not it, mela en coiamin?~ GOTO VPSimeDream4aElf
  IF ~~ THEN REPLY ~Is that news for you, Sime? Are you finally beginning to understand that we are meant for each other? Amin mela lle. Usst ssin dosst. Noldoli mellethe ulter. Zander thaerine zolt. I love you.~ GOTO  VPSimeDream4bElf
  IF ~~ THEN REPLY ~Sime, it is all too odd. Let us just enjoy this little outing without questioning why and how. ~ GOTO  VPSimeDream4cElf
END

IF ~~ THEN BEGIN VPSimeDream4aElf
  SAY ~I do not think it is impossible... May that’s why we are here today. You called me the love of your life, <CHARNAME>. I guess... I guess you are the one for me as well. Amin mela lle, <CHARNAME>. Amin mela lle. ~
  IF ~~ THEN DO ~SetGlobal("VP_Sime_DreamIsland","GLOBAL",2)
StartCutSceneMode()
StartCutScene("vpcuts02")
RestParty()~ EXIT
END

IF ~~ THEN BEGIN VPSimeDream4bElf
  SAY ~(*Laughs*)... If those are the only words you know how to say in all these languages, than you picked up the right ones to learn. But why would we use the foul language of the Dark ones or a roaring one of the fierce dwarves? We are kin and I think you are right - we are meant for each other. I can hear the voice of my heart clearly. Amin mela lle, <CHARNAME>. Amin mela lle.~
  IF ~~ THEN DO ~SetGlobal("VP_Sime_DreamIsland","GLOBAL",2)
StartCutSceneMode()
StartCutScene("vpcuts02")
RestParty()~ EXIT
END

IF ~~ THEN BEGIN VPSimeDream4cElf
  SAY ~I think there is a meaning to that outing, <CHARNAME>. I think that I came here with you today so I can see that we are meant for each other. I can hear the voice of my heart clearly. Amin mela lle, <CHARNAME>. I love you. ~
  IF ~~ THEN DO ~SetGlobal("VP_Sime_DreamIsland","GLOBAL",2)
StartCutSceneMode()
StartCutScene("vpcuts02")
RestParty()~ EXIT
END

IF ~~ THEN BEGIN VPSimeDream3Elf
  SAY ~Mayhap you have a gentler heart, than you suspected. Dreaming of me is not enough to call me to your place in this land. You could have had my shadow or my voice may be... But for Sime Linvail in flesh and blood to walk Kaimeldor by your side, we have to share a connection of a kind... a bond...~
  IF ~~ THEN REPLY ~A bond, Sime? You mean the Elven Bond? It is not... impossible, is not it, mela en coiamin?~ GOTO VPSimeDream4aElf
  IF ~~ THEN REPLY ~Is that news for you, Sime? Are you finally beginning to understand that we are meant for each other? Amin mela lle. Usst ssin dosst. Noldoli mellethe ulter. Zander thaerine zolt. I love you.~ GOTO VPSimeDream4bElf
  IF ~~ THEN REPLY ~Sime, it is all too odd. Let us just enjoy this little outing without questioning why and how. ~ GOTO VPSimeDream4cElf
END

IF ~~ THEN BEGIN VPSimeDream1NoElf
  SAY ~We are in the Land of Dreams, the Kaimeldor. It is an ancient Elven enchantment that allows one to live ones’ dreams for a time. Kaimeldor appears different to everyone. The hunter will come to a forest full of game, and an older man will enter an inn and would taste the best ale...~
  IF ~~ THEN REPLY ~I have never heard of this enchantment. So, am I dreaming? In this case it should not surprise you that you are here.~ GOTO VPSimeDream2NoElf
  IF ~~ THEN REPLY ~I am not as versed in Elven lore as I would like to be, Sime. This enchantment, I have never heard of it, but I like it. Why does it surprise you that you are by my side in this... Kaimeldor?~ GOTO VPSimeDream2NoElf
  IF ~~ THEN REPLY ~I must have been really drunk, when I dreamt this place up. Flowers and silly butterflies everywhere! Give me battles and gore, not some gardens! I do dream of you sometimes, I must confess. If Kaimeldor is what you are saying it to be, then I am not surprised that you are here. How the rest got included is the mystery to me.~ GOTO VPSimeDream3NoElf
END

IF ~~ THEN BEGIN VPSimeDream2NoElf
  SAY ~It is not a dream, <CHARNAME>, we are both awake and walk Kaimeldor. But to call me to your place in this land we have to share a connection of a kind... an Elven bond... It must be the strength of your divine blood... or... something we do not know that allowed you to call for me.~
  IF ~~ THEN REPLY ~An Elven Bond? Divine blood? I do not know much about it, but what I know, is that I love you, Sime. Is not it reason enough for you to be by my side?~ GOTO VPSimeDream4a
  IF ~~ THEN REPLY ~Is that news for you, Sime? I am not a regular mortal, Elf or not. We are meant for each other - do not you understand? I love you.~ GOTO VPSimeDream4a
  IF ~~ THEN REPLY ~Sime, it is all too odd. Let us just enjoy this little outing without questioning why and how.~ GOTO VPSimeDream4b
END

IF ~~ THEN BEGIN VPSimeDream4a
  SAY ~I do not think it is impossible... May be that’s why we are here today. I guess... I guess I love you. Amin mela lle, <CHARNAME>. Amin mela lle.~
  IF ~~ THEN DO ~SetGlobal("VP_Sime_DreamIsland","GLOBAL",2)
StartCutSceneMode()
StartCutScene("vpcuts02")
RestParty()~ EXIT
END

IF ~~ THEN BEGIN VPSimeDream4b
  SAY ~I think there is a meaning to that outing, <CHARNAME>. I think that I came here with you today so I can see that we are meant for each other. I can hear the voice of my heart clearly. Amin mela lle, <CHARNAME>. Amin mela lle.~
  IF ~~ THEN DO ~SetGlobal("VP_Sime_DreamIsland","GLOBAL",2)
StartCutSceneMode()
StartCutScene("vpcuts02")
RestParty()~ EXIT
END

IF ~~ THEN BEGIN VPSimeDream3NoElf
  SAY ~Mayhap you have a gentler heart, than you suspected. Dreaming of me is not enough to call me to your place in this land. You could have had my shadow or my voice may be... But for Sime Linvail in flesh and blood to walk Kaimeldor by your side, we have to share a connection of a kind... a bond... an Elven bond... It must be the strength of your divine blood... or... something we do not know that allowed you to call for me.~
  IF ~~ THEN REPLY ~An Elven Bond? Divine blood? I do not know much about it, but what I know, is that I love you, Sime. Is not it reason enough for you to be by my side?~ GOTO VPSimeDream4a
  IF ~~ THEN REPLY ~Is that news for you, Sime? I am not a regular mortal, Elf or not. We are meant for each other - do not you understand? I love you.~ GOTO VPSimeDream4a
  IF ~~ THEN REPLY ~Sime, it is all too odd. Let us just enjoy this little outing without questioning why and how.~ GOTO VPSimeDream4b
END

//Elf dream 2

IF WEIGHT #-88 ~Global("VP_Sime_Dragon","GLOBAL",4)~ THEN BEGIN VPSimeDreamDr0
  SAY ~You have indeed free me, my good <PRO_SIRMAAM>!~
  IF ~~ THEN REPLY ~Yes, I did. Am I hero enough for you now?~ GOTO VPSimeDreamDr1
  IF ~~ THEN REPLY ~My Fair Lady, your favor filled me with strength and valor. The victory is as much yours as it is mine.~ GOTO VPSimeDreamDr2
  IF ~~ THEN REPLY ~I... I think so. Oh, Sime must you invent some ridiculous trials? Do not you know that I love you?~ GOTO VPSimeDreamDr6
END

IF ~~ THEN BEGIN VPSimeDreamDr1
  SAY ~I never doubted that you are a hero. But now I can tell everyone, that the <PRO_MANWOMAN> I love saved me from the clutches of an evil dragon. It was worth a trip!~
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",5)~ EXIT
END

IF ~~ THEN BEGIN VPSimeDreamDr2
  SAY ~Such gallantry! I only pity that I did not join you in the fight! Next time...~
  IF ~~ THEN REPLY ~No next time, my Fair Lady. The deal was one salvation for one wedding. I cannot marry you more than once, can I?~ GOTO VPSimeDreamDr3
  IF ~~ THEN REPLY ~Next time we will head a host of riders to fight some evil lord... or fight in a tourney... we cannot do dragons all the time. It will be ultimately boring, my Lady.~ GOTO VPSimeDreamDr4
  IF ~~ THEN REPLY ~Yes, dear. (Keldorn said it usually works...)~ GOTO VPSimeDreamDr5
END

IF ~~ THEN BEGIN VPSimeDreamDr3
  SAY ~Oh... I see. Well, we can do something different then. How about a tourney?~
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",5)~ EXIT
END

IF ~~ THEN BEGIN VPSimeDreamDr4
  SAY ~You have a point. Let it be an evil lord next. But our time is up now...~
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",5)~ EXIT
END

IF ~~ THEN BEGIN VPSimeDreamDr5
  SAY ~Hmm, sounds good. But what was that thing about Keldorn you muttered? Never mind, we must go now.~
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",5)~ EXIT
END

IF ~~ THEN BEGIN VPSimeDreamDr6
  SAY ~I never doubted that you love me. But now I can tell everyone, that the <PRO_MANWOMAN> I love saved me from the clutches of an evil dragon. It was worth a trip!~
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Dragon","GLOBAL",5)~ EXIT
END
END

///////////////////////////////////////////////////////////////
//End of Romance///////////////////////////////////////////////

//Interjections

I_C_T RENAL 64 VPSimeRenalComm
== ~VPSIMEJ~ IF ~InParty("vpsime") InMyArea("vpsime") !StateCheck("vpsime",CD_STATE_NOTVALID)~ ~No, <CHARNAME>, please, do not do it. You do not understand what you are getting yourself into! Renal, he will NOT be a Shadow Thief! <CHARNAME>, please, tell him that you will NOT accept!~
END

APPEND VPSIMEJ

IF WEIGHT #-87 ~GlobalLT("AsylumPlot","GLOBAL",5)
Global("simespeak","GLOBAL",1)~ THEN BEGIN 115
  SAY ~Saemon looks nervous. Find out what he wants.~
  IF ~~ THEN EXIT
END
END
