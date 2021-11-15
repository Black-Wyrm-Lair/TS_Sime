BEGIN ~VPSIMEP2~

IF ~Global("Kicked_Out","LOCALS",1)~ THEN BEGIN 0
  SAY ~Hey, you have returned? Have a need of Sime, don’t you?~
  IF ~~ THEN REPLY ~Yes, Sime, you are right. It was foolish of me to refuse your help. Join in!~ GOTO 1
  IF ~~ THEN REPLY ~No, just wanted to say hi. You are cool, but I am satisfied with my companions for now.~ GOTO 6
END

IF ~~ THEN BEGIN 1
  SAY ~Let’s go.~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
END

IF ~Global("Kicked_Out","LOCALS",0)~ THEN BEGIN 2
  SAY ~I guess the time have come for us to part. Are you sure you do not want my company any longer?~
  IF ~AreaCheck("AR4500")~ THEN REPLY ~Sime, it is better if we go on separately for now.~ GOTO 3
  IF ~!AreaCheck("AR4500")
!AreaCheck("AR4000")
!AreaCheck("AR6200")~ THEN REPLY ~Sime, it is better if we go on separately for now.~ GOTO 4
  IF ~OR(2)
AreaCheck("AR4000")
AreaCheck("AR6200")~ THEN REPLY ~Sime, it is better if we go on separately for now.~ GOTO 5
  IF ~~ THEN REPLY ~Of course I want your company! It was a mistake, Sime, stay with us.~ GOTO 8
END

IF ~~ THEN BEGIN 3
  SAY ~I will be staying with my father for a time. You can find me there, if you require my further assistance.~
  IF ~~ THEN REPLY ~That’s not possible. Why don’t you just wait right here, and if we need you again, we’ll come get you.~ GOTO 9
END

IF ~~ THEN BEGIN 4
  SAY ~Where should we meet if you were to change your mind?~
  IF ~~ THEN REPLY ~I’ll send you back to the pocket plane...wait there.~ GOTO 10
  IF ~~ THEN REPLY ~Just wait right here and we’ll come back for you later.~ GOTO 11
  IF ~~ THEN REPLY ~I don’t know... If I change my mind, I’ll find you.~ GOTO 7
END

IF ~~ THEN BEGIN 5
  SAY ~Where should we meet if you were to change your mind?~
  IF ~~ THEN REPLY ~I don’t know... If I change my mind, I’ll find you.~ GOTO 7
END

IF ~~ THEN BEGIN 6
  SAY ~As you wish, my friend.  See you soon, I hope.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 7
  SAY ~See you soon, then.  Take care of yourself.~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
EscapeAreaMove("AR0307",4642,2000,7)~ EXIT
END

IF ~~ THEN BEGIN 8
  SAY ~I thought as much.~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",0)
JoinParty()~ EXIT
END

IF ~~ THEN BEGIN 9
  SAY ~See you soon, then.  Take care of yourself.~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
MoveToPointNoInterrupt([1731.1104])
Face(0)~ EXIT
END

IF ~~ THEN BEGIN 10
  SAY ~As you wish, my friend.  See you soon, I hope.~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)
CreateVisualEffectObject("SPDIMNDR",Myself)
Wait(2)
MoveBetweenAreas("AR4500",[1731.1104],0)~ EXIT
END

IF ~~ THEN BEGIN 11
  SAY ~See you soon, then.  Take care of yourself.~
  IF ~~ THEN DO ~SetGlobal("Kicked_Out","LOCALS",1)~ EXIT
END