BEGIN ~VPCHRDRA~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY ~Another knight? Find my cooking book, wenches! I shall feast tonight!~
  IF ~~ THEN GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY ~Wait, I recognise you... Oh, you are terribly wrong coming back to my lair... Are you crazy?~
  IF ~~ THEN REPLY ~I came to free the maidens you are unlawfully keeping in your service. Release them and no harm will come to you, Dal!~ GOTO 2
  IF ~~ THEN REPLY ~Should I be your meal, I hope you break your teeth on me.~ GOTO 2
  IF ~~ THEN REPLY ~Dalhaleitkazyyr, the Mighty! I am here representing righteousness and...~ GOTO 3
  IF ~~ THEN REPLY ~Helm’s Beard, that’s one big lizard you have here, Ladies!~ GOTO 2
  IF ~~ THEN REPLY ~Honor! Duty!~ GOTO 4
END

IF ~~ THEN BEGIN 2
  SAY ~Bha-ha-ha-ha... A jester we have here, wenches. But enough of the small talk, I am getting hungry and since you are the main course for my dinner, I do not see the point of delaying cooking! ~
  IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN 3
  SAY ~Oh, you are one of those, paladins, aren’t you? Those are always bad news for a gourmand, such as I... Too bony a head, and too much armor polish. But one cannot be choosy when the dinner is served to his doorstep. I am getting hungry, let us start!~
  IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN 4
  SAY ~Please, do continue. I have a genuine interest in the amount of multisyllabic words you can yell out as I roast you! My wenches will keep the tally so your whining is not lost to the following generations.~
  IF ~~ THEN DO ~Enemy()~ EXIT
END