BEGIN VPSIME

IF WEIGHT #-2 ~Global("Sime_Meet","GLOBAL",0)~ THEN BEGIN 0
  SAY ~Hello, <CHARNAME>. I have heard... things about you, and I am quite impressed. I was wondering if you need another companion? I would be honored if you’d allow me to travel with you.~ [SIMEPC02]
  IF ~~ THEN REPLY ~Well, may be, but I hate talking to strangers...~ DO ~SetGlobal("Sime_Meet","GLOBAL",1)~ GOTO 1
  IF ~~ THEN REPLY ~No chance... I seek to speak only to Aran and I am in a hurry. Away with you!~ DO ~SetGlobal("Sime_Meet","GLOBAL",1)~ GOTO 2
  IF ~~ THEN REPLY ~I am sorry, but I have enough people for now. I’d keep you in mind, though...~ DO ~SetGlobal("Sime_Meet","GLOBAL",1)~ GOTO 2
  IF ~~ THEN REPLY ~May be, but who are you and what are you capable of doing?~ DO ~SetGlobal("Sime_Meet","GLOBAL",1)~ GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY ~My name is Sime (*lifts her hood up*)... and as you can see I am a half-elf. I was an apprentice of a wise ranger, Darriel of Tanglewood once, and now I am a ranger in my own right... My faith in Mielikki is strong, and I am fortunate to preach her teaching, so you can regard me as a priestess as well. Apart from that there is little to tell...~ [SIMEPC03]
  IF ~~ THEN REPLY ~I am sorry, but I have enough people for now. I’d keep you in mind, though.~ GOTO 2
  IF ~~ THEN REPLY ~You sound like a valuable companion, Sime. I am glad that you wish to join in with us. I am sure we have more time to chat later on, but now we should hurry! Come along.~ GOTO 5
  IF ~~ THEN REPLY ~A ranger? A priestess of Mielikki? What are you doing in the Shadow Thieves compound in the middle of the big city?~ GOTO 3
END

IF ~~ THEN BEGIN 2
  SAY ~Sure, proceed without me if you are so inclined. I will stay here for the time being and you can always count on my help if you change your mind.~ [SIMEPC04]
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Is_Waiting","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN 3
  SAY ~It has nothing to do with my abilities, I assure you. There are... some very personal reasons for me to be here. I would not want to talk about it right now. But there is nothing... dishonest about it. So, would you want me to travel with you?~ [SIMEPC05]
  IF ~~ THEN REPLY ~I am sorry, but I have enough people for now. I’d keep you in mind, though.~ GOTO 2
  IF ~~ THEN REPLY ~If you do not trust me, why should I trust you? No, I’d do without you. ~ GOTO 2
  IF ~~ THEN REPLY ~You sound like a valuable companion, Sime. And I respect your privacy. May be you will tell me your story one day. Now we should hurry! Come along, Sime.~ GOTO 5
END

IF ~~ THEN BEGIN 4
  SAY ~Sure, proceed without me if you are so inclined. I will stay here for the time being and you can always count on my help if you change your mind.~ [SIMEPC04]
  IF ~~ THEN DO ~SetGlobal("VP_Sime_Is_Waiting","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN 5
  SAY ~Let’s go.~
  IF ~~ THEN DO ~RealSetGlobalTimer("VP_SimeFlirtTimer","GLOBAL",1800) JoinParty()~ EXIT
END

IF WEIGHT #1 ~NumTimesTalkedToGT(0) Global("Sime_Meet","GLOBAL",1)~ THEN BEGIN 6
  SAY ~Hey, you have returned? Have a need of Sime, don’t you?~
  IF ~~ THEN REPLY ~Yes, Sime, you are right. It was foolish of me to refuse your help. Join in!~ GOTO 5
  IF ~~ THEN REPLY ~No, just wanted to say hi. You are cool, but I am satisfied with my companions for now.~ GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY ~As you wish, my friend. See you soon, I hope.~
  IF ~~ THEN EXIT
END
