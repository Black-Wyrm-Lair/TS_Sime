BEGIN VPSIMEJ2

//// Master Wraith

EXTEND_BOTTOM HGWRA01 18
IF ~Global("VP_SimeRomanceActive","GLOBAL",2) InParty("vpsime") 
!StateCheck("vpsime",CD_STATE_NOTVALID)~ DO ~SetGlobal("VPSimeLovedOne","GLOBAL",1)~ EXTERN HGWRA01 VPSimeWraith1
END

CHAIN HGWRA01 VPSimeWraith1
~What of the inevitable pain you must give to the one you love? This Linvail maid?~ DO ~SetGlobal("LovedOne","GLOBAL",6)~
== VPSIMEJ2 ~I did not mind the pain, it was sweet. I love you <CHARNAME>, do not listen to this cruel spirit.~
EXTERN HGWRA01 24

EXTEND_BOTTOM HGWRA01 24
IF ~Global("VP_SimeRomanceActive","GLOBAL",2)~
DO ~ClearAllActions() StartCutSceneMode() StartCutScene("vpcutwra")~ EXIT
END

BEGIN VPEXLOVE

CHAIN IF ~NumTimesTalkedTo(0) InParty("vpsime") Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN VPEXLOVE 0
~Sime Linvail... I was afraid that I would never see you again.~
== VPSIMEJ2 ~Darriel? I do not understand...~
== VPEXLOVE ~What is there to understand? I came to ask you why did you kill me?~
== VPSIMEJ2 ~I did not kill you, Darriel. Your own recklessness did.~
== VPEXLOVE ~Recklessness... Darling, I only became reckless, when I understood that you would give your heart to anyone, but me.~
== VPSIMEJ2 ~I cherished you, I adored you, I looked up to you...~
== VPEXLOVE ~But you did not love me. Funny how it still hurts to see you with another <PRO_MANWOMAN>... just like it did in life.~
== VPSIMEJ2 ~But Darriel, we could not have been lovers, you know that! You were my mentor, my friend...~
== VPEXLOVE ~And I loved you madly. I loved you so much that I did not want to live if you did not return my feelings... so I chose to fight as I was a berserker... sooner or later I knew that the death will find me...~
== VPSIMEJ2 ~No! That’s cannot be true... Darriel could not have thrown your life away because of me...~
END
IF ~~ THEN REPLY ~Darriel, whatever you did, you did it to yourself! Stop trying to place the blame on Sime! She did nothing wrong!~ EXTERN ~HGWRA01~ 25
IF ~~ THEN REPLY ~Gorion, what is it? Sime did nothing to be tortured so... You are unfair.~ EXTERN ~HGWRA01~ 25
IF ~~ THEN REPLY ~This is madness and lies. Enough.~ EXTERN ~HGWRA01~ 25
IF ~~ THEN REPLY ~Sime, my love, this is not Darriel... It is some cruel scheme! Sime, trust me, it is not real!~ EXTERN ~HGWRA01~ 25

//// Solar

EXTEND_BOTTOM FINSOL01 27
  IF ~InParty("vpsime")
Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN EXTERN VPSIMEJ2 SimeLoveChoice
  IF ~InParty("vpsime")
!Global("VP_SimeRomanceActive","GLOBAL",2)
!Alignment(Player1,MASK_EVIL)~ THEN EXTERN VPSIMEJ2 SimeFriendChoiceGood
  IF ~InParty("vpsime")
!Global("VP_SimeRomanceActive","GLOBAL",2)
Alignment(Player1,MASK_EVIL)~ THEN EXTERN VPSIMEJ2 SimeFriendChoiceEvil
END

EXTEND_BOTTOM FINSOL01 29
  IF ~InParty("vpsime")
Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN EXTERN VPSIMEJ2 SimeLoveGod
END

EXTEND_BOTTOM FINSOL01 30
  IF ~InParty("vpsime")
Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN EXTERN VPSIMEJ2 SimeLoveGod
END

EXTEND_BOTTOM FINSOL01 31
  IF ~InParty("vpsime")
Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN EXTERN VPSIMEJ2 SimeLoveGod
END

EXTEND_BOTTOM FINSOL01 32
  IF ~InParty("vpsime")
Global("VP_SimeRomanceActive","GLOBAL",2)~ THEN EXTERN VPSIMEJ2 SimeLoveMortal0
END

//Friend, before the choice

CHAIN VPSIMEJ2 SimeFriendChoiceGood
~This is it, then? I cannot believe I am witnessing a mortal becoming a god.~
=~You are going to ascend, won’t you? You have proven a person of goodness and wisdom. Such a person can succeed in changing the dark domain of the Lord of Murder.~
END
COPY_TRANS FINSOL01 27

CHAIN VPSIMEJ2 SimeFriendChoiceEvil
~This is it, then? I cannot believe I am witnessing a mortal becoming a god.~
= ~I know that you have power and blood of a god, but the Lord of Murder’s domain is a dark one. I... I hope you will not make it darker still.~
END
COPY_TRANS FINSOL01 27

//Love, before the choice

CHAIN VPSIMEJ2 SimeLoveChoice
~I will not hold you, <CHARNAME>. I love you, but your destiny... It is beyond any words I have at my disposal. You were destined for greatness, you were born into it. What is one woman’s desire to hold you close every night compare to that?~
END
COPY_TRANS FINSOL01 27

//Love, God

CHAIN VPSIMEJ2 SimeLoveGod
~I must be feeling really special now for sharing the bedroll of the <PRO_LADYLORD> of Murder. Oh, Nine Hells! What’s done is done. Hopefully my father does not aspire to take Mask’s place. For he is the only person I love left on this plane of existence.~
END
COPY_TRANS FINSOL01 29

//Love, Mortal

CHAIN VPSIMEJ2 SimeLoveMortal0
~What? You choose to remain mortal? <CHARNAME>, <CHARNAME>, I do not know, I feel like berating you for ultimate stupidity, yet my heart sings. And I think I am crying. I must look silly.~
END
IF ~~ THEN REPLY ~You have never looked more beautiful, Sime. I love you, I will not leave you. Not for a crown, not for a godhood, not even for another woman.~ EXTERN VPSIMEJ2 SimeLoveMortal1
IF ~~ THEN REPLY ~Well, at first I wanted to say something like: "It is not that we will be apart, my beloved Sime, it is only that we won’t be together." But then I thought that it is sappy. Since I did not think that: "Oh, Nine Hells!" is not exactly the words you would expect from a person ascending to the godhood, and I could not come up with anything else I decided to stay and... Oh, Nine Hells! I love you, and that’s all that matters.~ EXTERN VPSIMEJ2 SimeLoveMortal2
IF ~~ THEN REPLY ~You thought I’d trade our love for that terrifying piece of used furniture? Not on my life!~ EXTERN VPSIMEJ2 SimeLoveMortal3
IF ~~ THEN REPLY ~Sime, if I wanted a fountain, I would seriously consider you for the job. Whip your tears and let us rejoice!~ EXTERN VPSIMEJ2 SimeLoveMortal4
IF ~Gender(Player1,MALE)~ THEN REPLY ~Compare to me, you look a pinnacle of intelligence, Sime. I am not a god, not even a demi-god now. I am a man and I am in love. That is all I know.~ EXTERN VPSIMEJ2 SimeLoveMortal5
IF ~Gender(Player1,FEMALE)~ THEN REPLY ~Compare to me, you look a pinnacle of intelligence, Sime. I am not a godness, not even a demi-godness now. I am a woman and I am in love. That is all I know.~ EXTERN VPSIMEJ2 SimeLoveMortal5

CHAIN VPSIMEJ2 SimeLoveMortal1
~For a moment I was worried that I was going to loose you. But then your eyes stopped at me. The way you looked at me made thousand of butterflies to be born in my heart.~
END
IF ~~ THEN EXTERN VPSIMEJ2 SimeLoveMortalFinal

CHAIN VPSIMEJ2 SimeLoveMortal2
~"Oh, Nine Hells" will do. I was silly to ask you for pretty words so often. I do not want any now, I want your love, and I want your kiss.~
END
IF ~~ THEN EXTERN VPSIMEJ2 SimeLoveMortalFinal

CHAIN VPSIMEJ2 SimeLoveMortal3
~I... I always wanted to fall in love for a person who’d call the Throne of Bhaal "a piece of used furniture". Now this dream came true.~
END
IF ~~ THEN EXTERN VPSIMEJ2 SimeLoveMortalFinal

CHAIN VPSIMEJ2 SimeLoveMortal4
~I am trying, <CHARNAME>, but the stupid tears won’t stop. But I am rejoicing, and I cry of happiness. I love you so!~
END
IF ~~ THEN EXTERN VPSIMEJ2 SimeLoveMortalFinal

CHAIN VPSIMEJ2 SimeLoveMortal5
~And all I know is that I love you. Let it make us stupid, I do not care.~
END
IF ~~ THEN EXTERN VPSIMEJ2 SimeLoveMortalFinal

CHAIN VPSIMEJ2 SimeLoveMortalFinal
~I love you, <CHARNAME>.~
END
COPY_TRANS FINSOL01 32