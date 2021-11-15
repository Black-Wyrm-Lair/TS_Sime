BEGIN VPSIMEB

//Aerie

CHAIN
IF ~InParty("Aerie")
See("Aerie")
!StateCheck("Aerie",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeAerie1","GLOBAL",0)~ THEN VPSIMEB SimeAerie1
~Another day of depression is one day too many. Why the sour face, Aerie?~ [SIMEAE01]
DO ~SetGlobal("VPSimeAerie1","GLOBAL",1)~
== BAERIE ~My face is not... not sour!~
== VPSIMEB ~If you say so. But if you’d try to smile you’d look prettier.~
== BAERIE ~You mean... you mean I look... ugly?~
== VPSIMEB ~Let’s see... turn around, Aerie. Well, not completely. If one does not see your face you are quite nice looking. Too fragile and bony may be, but some like it.~
== BAERIE ~What's wrong with my... my face?~
== VPSIMEB ~Puffy eyes, red twitching nose, trembling lips...~ [SIMEAE02]
== BAERIE ~Oh...*sniffs*~
== VPSIMEB ~(*shrugs*) And I thought I was improving things.~
EXIT

CHAIN
IF ~InParty("Aerie")
See("Aerie")
!StateCheck("Aerie",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeAerie2","GLOBAL",0)~ THEN VPSIMEB SimeAerie2
~Aerie, here you are! Why are you always lagging behind?~ [SIMEAE03]
DO ~SetGlobal("VPSimeAerie2","GLOBAL",1)~
== BAERIE ~I... I... was trying not to fall down...~
== VPSIMEB ~Princess, you need not measure your every step. We are not on a raft, you will not slip. And the floor under our feet is not covered with broken glass and spikes.~ [SIMEAE04]
== BAERIE ~For me... for me it is, Sime. Avariel are not accustomed to prolonged walks like this. Avariel fly...~
== VPSIMEB ~Aerie, I reckon that you spent many years on the ground.~
== BAERIE ~In a cage... where I could not lay down, let alone walk. I... I have never walked this much in my whole life.~
== VPSIMEB ~I am sorry, Aerie. I could not have imagined that anyone might be uncomfortable on the solid ground.~
== BAERIE ~I... I know... Do not... do not tell anyone, please?~
== VPSIMEB ~But why, Aerie?~
== BAERIE ~They'd laugh... They always laugh...~
== VPSIMEB ~<CHARNAME>! Do you mind if we walk more slowly? I would rather not be sweating and puffing if we run into an enemy!~
== BAERIE ~Thank you, Sime. Now if only someone could clean this place up... It is so... dirty and dusty!~
== VPSIMEB ~Do not look at me!~
EXIT

CHAIN
IF ~InParty("Aerie")
See("Aerie")
!StateCheck("Aerie",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeAerie3","GLOBAL",0)
Global("VP_Sime_vs_Aerie","GLOBAL",5)~ THEN VPSIMEB SimeAerie1
~Aerie, I wanted to talk to you.~
DO ~SetGlobal("VPSimeAerie3","GLOBAL",1) SetGlobal("VP_Sime_vs_Aerie","GLOBAL",6)~
== BAERIE ~I... do not need talking to, Sime. I have enough of that from <CHARNAME>.~
== VPSIMEB ~Not enough, I am afraid. I can sense your distress and I want to help you.~
== BAERIE ~Help me? You... want to help me? How can you help me? Can you make <CHARNAME> to love me?~
== VPSIMEB ~I cannot make <CHARNAME> to love you. I cannot make anybody to love anybody. And you cannot either. But love is not a prison, Aerie. Love is wings. Even love which is unreturned.~
== BAERIE ~You do not... understand.~
== VPSIMEB ~I do. Listen to me and do not shut your heart. It’s like a port: one ship enters while another leaves. In few years you will not be able to remember his name, too much in love with another man to care.~
== BAERIE ~You... are wrong. I will never... love anyone, but <CHARNAME>!~
== VPSIMEB ~(*smiles*) Of course, dear. But just in case, remember what I told you: do not shut your heart.~
EXIT

// Anomen

CHAIN
IF ~InParty("Anomen")
See("Anomen")
!StateCheck("Anomen",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeAnomen1","GLOBAL",0)~ THEN VPSIMEB SimeAnomen1
~Young Lord Delryn, I still do not believe that you have killed twelve giants on your own. Yes, I know you are valiant, but do not you just exaggerate a little bit?~ [SIMEAN01]
DO ~SetGlobal("VPSimeAnomen1","GLOBAL",1)~
== BANOMEN ~Nay my Lady, not in the least.~
== VPSIMEB ~I must apologize then for calling you a twit.~
== BANOMEN ~You should my Lady, you should.~
== VPSIMEB ~Because you are not a twit, my young Lord, but a lunatic. A sweet lunatic, who believes his own lies!~ [SIMEAN02]
== BANOMEN ~It is most hurtful to hear such harsh words from a noble born Lady.~
== VPSIMEB ~Who told you that I am a noble born Lady, Anomen? I am a thief’s daughter.~
== BANOMEN ~But surely, your Lady mother was of a high station...~
== VPSIMEB ~She was an Elf, Anomen that’s all I know. Her origin is a mystery to me.~
== BANOMEN ~Mayhaps you are a Princess of some enchanted place and you know not of it, my Lady?~
== VPSIMEB ~I strongly doubt it, Anomen. And frankly, I would not want it.~
EXIT

CHAIN
IF ~InParty("Anomen")
See("Anomen")
!StateCheck("Anomen",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeAnomen2","GLOBAL",0)~ THEN VPSIMEB SimeAnomen2
~You look very upset, knight. What is your grievance?~ [SIMEAN03]
DO ~SetGlobal("VPSimeAnomen2","GLOBAL",1)~
== BANOMEN ~My Lady, you are an observant friend. I am worried of my feeling about our company.~
== VPSIMEB ~You do not like our adventuring company?~
== BANOMEN ~Quite the opposite, my dear Sime, quite the opposite...~
== VPSIMEB ~You like us... That’s very kind and generous of you, my heroic knight. Yet why does it bring you pain to like your comrades at arms?~ [SIMEAN04]
== BANOMEN ~Our group is lacking discipline and the purpose. Yet I like it. What would the Prelate of the Order say if he would learn that I am not insistent enough on proper procedures? When are we to undertake the heroic deeds fit for a paladin of the Order?~
== VPSIMEB ~Seems to me that you enjoy adventuring, Anomen. We might not draw from the pool of light, but we do good things...~
== BANOMEN ~Aye, you speak truthfully, my Lady. And that was "the pool of right"... I suppose I strike evil in the name of the Order and I am pleased with it. Menial tasks or no, we do good things. But the lack of discipline and insubordination does not sit well with me!~
== VPSIMEB ~I am afraid I cannot agree with you. I would choke if I were a subject to proper discipline and the Order’s structure. I’d rather ask my heart what to do, than my superior.~
EXIT

// Cernd

CHAIN
IF ~InParty("Cernd")
See("Cernd")
!StateCheck("Cernd",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeCernd1","GLOBAL",0)~ THEN VPSIMEB SimeCernd1
~Do you think, Cernd, that the beasts and birds and plants can dream?~
DO ~SetGlobal("VPSimeCernd1","GLOBAL",1)~
== BCERND ~What's your heart telling you on that account, ranger?~
== VPSIMEB ~I believe they do.~
== BCERND ~You sound very sure. Why ask me then, Sime?~
== VPSIMEB ~I like asking questions of those who are quiet. Their answers often both charm and puzzle me. So what do you think? And this time I will not take a question for an answer.~
== BCERND ~I know that every living thing has dreams, Sime. The Oak Father granted me a rare spell once and I... I was fortunate enough to see the dreams of a beast then.~
== VPSIMEB ~Which beast was it?~
== BCERND ~A spotted lion. A strange and wonderful thing are the beast's dreams, Sime. Wild and so... unrestricted.~
== VPSIMEB ~Do tell me!~
== BCERND ~(*shakes his head*) No, Sime. They cannot be put in words, those images. Pray to have an experience like that for yourself.~
== VPSIMEB ~I will.~
EXIT

CHAIN
IF ~InParty("Cernd")
See("Cernd")
!StateCheck("Cernd",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeCernd2","GLOBAL",0)~ THEN VPSIMEB SimeCernd2
~Would you return to Tethyr one day?~
DO ~SetGlobal("VPSimeCernd2","GLOBAL",1)~
== BCERND ~Yes. They are expecting me back at the Grove.~
== VPSIMEB ~Druids must have great patience... You have been adventuring with us for quite some time now.~
== BCERND ~All things happen in due course in nature. My part now is to follow Bhaal's child.~
== VPSIMEB ~Why? Why do you need to be among <CHARNAME>’s associates?~
== BCERND ~Demigods are strange creatures, Sime. I know that Bhaal's blood torments <CHARNAME>. If I am not mistaken, events mysterious and terrible are brewing... The fate of the greater balance depends on how well <CHARNAME> can maintain the balance of <PRO_HISHER> soul. Someone who understands the ways of Balance needs to be watching after <PRO_HIMHER>.~
== VPSIMEB ~You certainly have foresight, druid. But would not you rather watch after your own son, not a stranger with a dark heritage?~
== BCERND ~I would, Sime. I yearn to return to the Grove and be with him. But the very fate of my child depends on the actions of <CHARNAME>. Balance must be preserved...~
== VPSIMEB ~It always amazes me how one of your calling can be so warm and so chilling at the same time.~
EXIT

// Edwin

CHAIN
IF ~InParty("Edwin")
See("Edwin")
Gender("Edwin",MALE)
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeEdwin","GLOBAL",0)~ THEN VPSIMEB SimeEdwin1
~Am I truly blessed? Edwin the Great threw a glance my way! My heart sings with joy.~ [SIMEED01]
DO ~SetGlobal("VPSimeEdwin","GLOBAL",1)~
== BEDWIN ~Yes, pretty face, I had noticed you and that should put a smile on any maiden's face. (This one is smarter than she looks. She appreciates me and shows appropriate reverence.)~
== VPSIMEB ~Indeed, your attention puts a smile on my face. A very wide smile.~
== BEDWIN ~I am coming to the conclusion that mutual attraction is growing between the most attractive and intelligent person in this pathetic troupe and his devoted maid. (Should I have included some compliment for the wench? No, that would be giving her too much. She is gasping in anticipation already.)~
== VPSIMEB ~Really? Who might you talking about? Forgive me my Lord, I am exceptionally stupid today.~
== BEDWIN ~Sime, you had better sit down, least your happiness takes you off your feet. (Amazing imbecile. Comes of roaming the wilds in the company of beasts, no doubt. I should be more direct with the likes of her. But she can be educated, I hope.)~
== VPSIMEB ~Done, I am sitting (*struggles with laughter*)~
== BEDWIN ~Sime, I had devised that you, poor soul, are deeply taken by my superior charms. While it is clear that you are inferior to me I am willing to condescend and bring the relationship to consummation tonight.~
== VPSIMEB ~You are too precious of an ornament, Edwin, for me to wear tonight. I shall refuse your... ahem... kind offer. Now if you would excuse me, I am retiring to my chambers. (*goes away laughing*)~ [SIMEED02]
EXIT

CHAIN
IF ~InParty("Edwin")
See("Edwin")
Gender("Edwin",MALE)
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeEdwin","GLOBAL",1)~ THEN VPSIMEB SimeEdwin2
~Shave off your beard, wizard. Then I might consider kissing you. I emphasize: "might".~ [SIMEED03]
DO ~SetGlobal("VPSimeEdwin","GLOBAL",2)~
== BEDWIN ~Fool woman, my look and style are perfect. How dare you to suggest an imbalance? (And I thought she had a grain of sense!)~
== VPSIMEB ~Imbalance? Have you been befriending druids perchance, Edwin?~
== BEDWIN ~You do not suggest seriously that I might have pay attention to anything tree-hugging rabble have to say?~
== VPSIMEB ~Oh, forgive me, Edwin. Indeed, you are the sort who listens to his own voice exclusively. Let me guess, you have come up with a concept of the world’s balance on your own.~
== BEDWIN ~I do not see how it is relevant to the kiss you were ordered to give me, but indeed I have an intelligent concept of the world's balance (do I even dare to hope that someone can understand a scheme so perfectly devised?)~
== VPSIMEB ~With yourself as a Supreme Ruler of the World?~
== BEDWIN ~I can see that you are not as hopelessly foolish as I originally thought (I would have to use my charm, the wench is stubborn) but you should not be afraid of my greatness. I am a red-blooded male as well as an intellectual pinnacle of mankind.~
== VPSIMEB ~How about elvenkind?~
== BEDWIN ~Elves? An outdated and almost extinct nation. The only true power lies with humans.~
== VPSIMEB ~I can take many things from you for amusement’s sake, Edwin. But that’s it. I am sick of you.~ [SIMEED04]
EXIT

CHAIN
IF ~InParty("Edwin")
See("Edwin")
Gender("Edwin",MALE)
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeEdwin","GLOBAL",2)~ THEN VPSIMEB SimeEdwin3
~(*yawns*) Edwin, what is it?~ [SIMEED05]
DO ~SetGlobal("VPSimeEdwin","GLOBAL",3)~
== BEDWIN ~You had the most annoying outburst of base emotions when I have spoken to you last time. (Must I explain everything to those imbeciles?) I am interested to know if you saw the truth of my words and are ready to apologize for your unspeakable behavior?~
== VPSIMEB ~No, I am not ready to apologize. And I would never be.~
== BEDWIN ~I fail to understand how you can fight off your attraction to me for so long. It must be very painful to be away from my gorgeous body and not to be a receptacle of my nearly divine wisdom.~
== VPSIMEB ~This game grew boring. I do not like you Edwin. I think you are ridiculous. Now go away.~ [SIMEED06]
== BEDWIN ~I have suspected that you with your narrow mind were interested in some stupid joke. (I have a long memory and I shall have revenge.)~
== VPSIMEB ~I found the joke quite to my satisfaction.~
EXIT

CHAIN
IF ~InParty("Edwin")
See("Edwin")
Gender("Edwin",MALE)
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeEdwin","GLOBAL",3)~ THEN VPSIMEB SimeEdwin4
~My beloved Edwin! Here you come at last. I can barely control my burning passion, come, hold me close, my lover.~ [SIMEED07]
DO ~SetGlobal("VPSimeEdwin","GLOBAL",4)~
== BEDWIN ~(Is it not amazing how their attitude can change.) I am coming, wench.~
== VPSIMEB ~The sweet sound of your voice intensifies my desire. Make haste, my beloved!~
== BEDWIN ~Here I am, in all my glorious beauty... What is it? Why are you dressed? And armored? And you hold your mace? Sime, my love...~
== VPSIMEB ~So that WAS a charm spell, you dirty egomaniac!~ [SIMEED08]
== BEDWIN ~Only for the love of you my queen, my dear elven queen... You would not hurt your humble slave, will you? I am naked and defenseless before you... (*tries to cast a fireball*)~
== VPSIMEB ~You bet I will! (* slaps him off his feet and after a short struggle bounds his hands behinds his back*) Now you cannot cast.~
== BEDWIN ~But my sweet charming elven beauty... (How many more humiliation the wench wants me to go through?)~
== VPSIMEB ~Shut up! On your knees and repeat after me: " I shall leave Sime alone."~
== BEDWIN ~I... shall... leave Sime alone!~
== VPSIMEB ~Good. I will come and unbind you in the morning least you get into any mischief.~
EXIT

// Haer'Dalis

CHAIN
IF ~InParty("HaerDalis")
See("HaerDalis")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeHaerDalis","GLOBAL",0)~ THEN VPSIMEB SimeHaerDalis1
~Believe it or not, I tried to become a bard in my youth.~ [SIMEHA01]
DO ~SetGlobal("VPSimeHaerDalis","GLOBAL",1)~
== BHAERDA ~I easily believe it, my seagull. Your voice is melodic and your steps are light. You were born to be a minstrel.~
== VPSIMEB ~There is more to the bards’ art than the ability to dance and to sing. I do no worse than any intelligent woman can. But I have no true gift.~
== BHAERDA ~You sound sure.~
== VPSIMEB ~I am. I told you I tried. When I want something I do not attempt it half-heartedly. I was very young and I had just begun to understand what sort of business my father is in. He could not shield me from the reality any longer and was even making plans to start my training.~
== BHAERDA ~Might I assume that my little seagull made her own plans?~
== VPSIMEB ~A single plan. But a lousy one. I run away, hoping to earn money by utilizing all those boring lute lessons I was taught as a child.~ [SIMEHA02]
== BHAERDA ~I am eager to hear the rest, Sime, though I foresee that the rude crowd did not appreciate your talent and grace.~
== VPSIMEB ~*Laughs* There was none in the first place, Haer’Dalis. Looking back I think that I was received more warmly than I deserved. But it was a sorry existence. I never knew when next I would eat, but I could not return home.~
== BHAERDA ~How did the adventure end? Did your father come for you? Or...?~
== VPSIMEB ~A man dragged me off the stage, put me on his saddle and did not stop riding until we were far away. I thought him a bandit, kidnapping me to get back at my father.~
== BHAERDA ~He was not?~
== VPSIMEB ~No. He was a ranger. He taught me everything I know of life and of love.~
EXIT

CHAIN
IF ~InParty("HaerDalis")
See("HaerDalis")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeHaerDalis","GLOBAL",1)~ THEN VPSIMEB SimeHaerDalis2
~I must have bored you to death with my story. You keep staring at me and you do not speak. I give you my word, I will not start a "History of Sime’s Life" next time.~ [SIMEHA03]
DO ~SetGlobal("VPSimeHaerDalis","GLOBAL",2)~
== BHAERDA ~My sweetest Lady, I am just dreamy because

I met a lady in the meads
Full beautiful, a faery's child;
Her hair was long, her foot was light,
And her eyes were wild.~
== VPSIMEB ~(*smiles*) But you are faery’s child yourself, you should not be so astounded by elven beauty.~
== BHAERDA ~One cannot get used to beauty.~
== VPSIMEB ~Well said, Haer’Dalis.~
EXIT

CHAIN
IF ~InParty("HaerDalis")
See("HaerDalis")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeHaerDalis","GLOBAL",3)~ THEN VPSIMEB SimeHaerDalis3
~That is very impressive! I have never seen anyone juggle with burning torches before. But be careful, Haer’Dalis, you will burn your fingers.~ [SIMEHA04]
DO ~SetGlobal("VPSimeHaerDalis","GLOBAL",4)~
== BHAERDA ~The blood of a fiend is in my veins Sime. Hot, dark blood. It burns stronger than fire. A simple torch cannot harm me.~
== VPSIMEB ~I shall remind you of those words next time I am healing your body from the burns of a fireball, Haer’Dalis.~ [SIMEHA05]
== BHAERDA ~My Lady will not allow a poet romantic exaggeration?~
== VPSIMEB ~I will, of course.~
EXIT

CHAIN
IF ~InParty("HaerDalis")
See("HaerDalis")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeHaerDalis","GLOBAL",4)~ THEN VPSIMEB SimeHaerDalis4
~It’s only me, Haer’Dalis, do not be startled. You were deep in your thoughts, I am sorry for bothering you.~ [SIMEHA06]
DO ~SetGlobal("VPSimeHaerDalis","GLOBAL",5)~
== BHAERDA ~Oh, on the contrary I am grateful. I needed to be interrupted. The structured and coherent thought is an enemy of chaos. But yours is a timely arrival for I was thinking of you.~
== VPSIMEB ~They say: think of a demon and it will come to your summons.~
== BHAERDA ~Are you a demon, Sime? That would make you a most appropriate mate for a member of the Doomguard such as I.~
== VPSIMEB ~I am who I am...~
== BHAERDA ~Oh, may I be allowed to continue?~
== VPSIMEB ~If you wish, Haer’Dalis.~
== BHAERDA ~

I was made that way.
When I wish to laugh
I laugh till it hurts.

I love the one who loves me
And is it really my fault
that it is not the same man
I love every night?~
== VPSIMEB ~Bravo, Haer’Dalis. You almost made me believe that you are a whore.~ [SIMEHA07]
EXIT

CHAIN
IF ~InParty("HaerDalis")
See("HaerDalis")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeHaerDalis","GLOBAL",5)~ THEN VPSIMEB SimeHaerDalis5
~The night grows long. Will you cheer me with a song, good bard?~ [SIMEHA08]
DO ~SetGlobal("VPSimeHaerDalis","GLOBAL",6)~
== BHAERDA ~As my Lady demands. Let me find a melody sweet enough to engage the interest of the seagull.

I bring you with reverent hands
The books of my countless dreams,
White woman that passion has worn 
As the tide wears the dove-gray sands, 
And with heart much older than the horn 
That is brimmed from the pale fire of time: 
White woman with numberless dreams,
I bring you my passionate rhyme.~
== VPSIMEB ~A pretty song. But I was thinking of a different sort.~
== BHAERDA ~Why Sime? Your heart will not listen tonight to a poet's plea for love?~
== VPSIMEB ~Not tonight nor any other.~
EXIT

CHAIN
IF ~InParty("HaerDalis")
See("HaerDalis")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeHaerDalis","GLOBAL",6)~ THEN VPSIMEB SimeHaerDalis6
~Yes, Haer’Dalis, you have treated me to a marvelous performance. The song was sweet and your voice even sweeter.~ [SIMEHA09]
DO ~SetGlobal("VPSimeHaerDalis","GLOBAL",7)~
== BHAERDA ~Have you heard elvenkind sing before, Sime?~
== VPSIMEB ~I might have. I heard myself singing that’s for sure. But my voice lacks the typical chiming silver bell tone.~
== BHAERDA ~I shall tell you a secret, Sime. About elven voices.~
== VPSIMEB ~I am all ears.~
== BHAERDA ~An elf sings the prettiest after a night of passionate lovemaking. Care to find out for yourself?~
== VPSIMEB ~Oh, not in my opinion. I find that elves sound harsher under the aforementioned circumstances.~ [SIMEHA10]
EXIT

CHAIN
IF ~InParty("HaerDalis")
See("HaerDalis")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeHaerDalis","GLOBAL",7)~ THEN VPSIMEB SimeHaerDalis6
~I did not mean to offend you Haer’Dalis. But I prefer to be direct in the matters of heart.~ [SIMEHA11]
DO ~SetGlobal("VPSimeHaerDalis","GLOBAL",8)~
== BHAERDA ~The possibility of rejection is part of the game, seagull.~
== VPSIMEB ~But I am not playing games, Haer’Dalis. I do not fancy you.~
== BHAERDA ~Oh, but the ways of love are often complicated. I will have hope so long as I draw breath.~
== VPSIMEB ~You can breathe, Haer’Dalis, but you should not hope. At the first moment I meet a man I decide if he is to be my lover or not. I do not change my mind.~
== BHAERDA ~Is it my hair color?~
== VPSIMEB ~Not really.~
== BHAERDA ~That's a relief. You could not begin to imagine how I suffer over it!~
== VPSIMEB ~Rest assured, your baby-blue hair has nothing to do with my decision. It is about me, not about you, Haer’Dalis.~
EXIT

// Imoen

CHAIN
IF ~InParty("Imoen")
See("Imoen")
!StateCheck("Imoen",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeImoen1","GLOBAL",0)~ THEN VPSIMEB SimeImoen1
~I have been watching you for a time, Imoen. You look troubled. Are you hurting?~ [SIMEIM01]
DO ~SetGlobal("VPSimeImoen1","GLOBAL",1)~
== BIMOEN2 ~Nope, Sime. I'm fine at last. Just tryin' to shake off the nightmares. I was just thinkin' on how many new faces are around. Yours for instance.~
== VPSIMEB ~I guess I have an advantage of knowing a lot about you in advance, Imoen. <CHARNAME> spoke often of you.~
== BIMOEN2 ~Must have been complaining about <PRO_HISHER> "little troublemaker" as usual. <CHARNAME> never noticed that I grew up, I am afraid.~
== VPSIMEB ~On the contrary, <PRO_HESHE> praised your youthful and cheerful spirit, Imoen. I was awaiting to meet you. By Mielikki, we have enough gloom around us. Sad and grim is our business. We can use a ray of sunshine, like your smile.~
== BIMOEN2 IF ~InParty("Jaheira")~ THEN ~Jaheira says I look silly when I smile. Well, actually her exact words were "sillier than usual".~
== BIMOEN2 IF ~!InParty("Jaheira")~ THEN ~<CHARNAME> says I look silly when I smile. Well, actually <PRO_HISHER> exact words were "sillier than usual".~
== VPSIMEB IF ~InParty("Jaheira")~ THEN ~Do not listen to Jaheira. She is a bore!~
== VPSIMEB IF ~!InParty("Jaheira")~ THEN ~Do not listen to <PRO_HIMHER>. Sometimes <PRO_HESHE> is a bore!~
EXIT

CHAIN
IF ~InParty("Imoen")
See("Imoen")
!StateCheck("Imoen",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeImoen2","GLOBAL",0)~ THEN VPSIMEB SimeImoen2
~What is it, Imoen? (*whispering*) Ah, what are you doing? Pick-pocketing other’s people clothes! You cannot...~ [SIMEIM02]
DO ~SetGlobal("VPSimeImoen2","GLOBAL",1)~
== BIMOEN2 ~(Pssst) I do not steal, Sime, I just look. Don't ya wanna know what each of them might be carrying around in secret?~
== BIMOEN2 IF ~InParty("Aerie")~ THEN ~Aerie carries a mirror and... blush!~
== VPSIMEB IF ~InParty("Aerie")~ THEN ~Oh, I thought it was not natural!~
== BIMOEN2 IF ~InParty("Korgan")~ THEN ~Korgan carries a a book entitled "How to Make Friends and Influence Other People".~
== VPSIMEB IF ~InParty("Korgan")~ THEN ~I wonder if he ever read it? He’s obviously never read it.~
== BIMOEN2 IF ~InParty("Valygar")~ THEN ~Guess what our somber ranger carries? A laced lady's glove!~
== VPSIMEB IF ~InParty("Valygar")~ THEN ~Any initials on it?~
== BIMOEN2 IF ~InParty("Valygar")~ THEN ~Nope!~
== VPSIMEB IF ~InParty("Valygar")~ THEN ~Rats!~
== BIMOEN2 IF ~InParty("Anomen")~ THEN ~Oh, my dear Mystra, just look at that! Anomen has...~
== VPSIMEB IF ~InParty("Anomen")~ THEN ~Oh, no big surprise there. Almost every Order member has a set of pornographic drawings.~
== BIMOEN2 IF ~InParty("Cernd")~ THEN ~Cernd has some sort of seeds here. And bark. And pebbles.~
== VPSIMEB IF ~InParty("Cernd")~ THEN ~Always on duty.~
== BIMOEN2 IF ~InParty("Jan")~ THEN ~Jan has a turnip, no two turnips... three... ten...~
== VPSIMEB IF ~InParty("Jan")~ THEN ~You are wasting your time counting them! I am sure he has at least two dozens.~
== BIMOEN2 IF ~InParty("Yoshimo")~ THEN ~Yoshimo has nothing, but his weapons and this other stuff he is carrying for <CHARNAME>.~
== VPSIMEB IF ~InParty("Yoshimo")~ THEN ~He must have guessed that you are in a habit of snooping around, Imoen.~
//== BIMOEN2 IF ~InParty("Kachiko")~ THEN ~Kachiko has a lock of dark hair!~
//== VPSIMEB IF ~InParty("Kachiko")~ THEN ~I am guessing Yoshimo’s mane is missing it!~
== BIMOEN2 IF ~InParty("Keldorn")~ THEN ~Keldorn has a pipe and smoking weed. But I have never seen him smoking!~
== VPSIMEB IF ~InParty("Keldorn")~ THEN ~He must be one of those who quits, but carries it around to remind himself of the "good old times." I bet it was Lady M. who forced him into quitting!~
== BIMOEN2 IF ~InParty("Nalia")~ THEN ~Nalia has some sort of blueprints. Looks like it is her castle.~
== VPSIMEB IF ~InParty("Nalia")~ THEN ~She was saying something about rebuilding the property earlier.~
== BIMOEN2 IF ~InParty("Mazzy")~ THEN ~Mazzy has high-heeled shoes!~
== VPSIMEB IF ~InParty("Mazzy")~ THEN ~He-he. At least her problem is partially curable. I would not be able to look a single inch shorter than I already am!~
== BIMOEN2 IF ~InParty("Jaheira")~ THEN ~Jaheira has a portrait of Khalid.~
== VPSIMEB IF ~InParty("Jaheira")~ THEN ~That is sad.~
== BIMOEN2 IF ~InParty("Minsc")~ THEN ~Well, he carries Boo, cheese for Boo, peanuts for Boo and carrots for Boo...~
== VPSIMEB IF ~InParty("Minsc")~ THEN ~Careful, do not wake up Boo!~
== BIMOEN2 IF ~InParty("Edwin")~ THEN ~"How I Became an Evil Overlord" by Edwin Odesseiron.~
== VPSIMEB IF ~InParty("Edwin")~ THEN ~Sweet are the dreams of that man.~
== BIMOEN2 IF ~InParty("Viconia")~ THEN ~I am afraid to pick-pocket Viconia. If she wakes up, she'll kill me on spot.~
== VPSIMEB IF ~InParty("Viconia")~ THEN ~Do not do it then. The less I deal with the Dark one, the better.~
== VPSIMEB ~Okay, that is enough. If we get caught we will never hear the end of it.~
EXIT

// Jaheira

CHAIN
IF ~InParty("Jaheira")
See("Jaheira")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeJaheira1","GLOBAL",0)~ THEN VPSIMEB SimeJaheira1
~Always you act like we all need your constant supervision, Jaheira. Might you lower your guard down for a time?~ [SIMEJH01]
DO ~SetGlobal("VPSimeJaheira1","GLOBAL",1)~
== BJAHEIR ~Drop my guard? With the likes of you in the group? I am not mad enough.~
== VPSIMEB ~The likes of me? How did I offend you, druid?~
== BJAHEIR ~I am not easily offended. But I have seen your type oft enough to be weary, Sime Linvail. I have heard you talking to men. Your words are honey, but your heart is cold.  You called yourself a hunter, as I recall. Indeed you are. But the heads of men are your trophies.~
== VPSIMEB ~You are mistaken, Jaheira. Love is something I take and give with generosity. I did not ruin any man and I was not a traitor to any woman.~ [SIMEJH02]
== BJAHEIR ~You may think so, Sime, but around women like you there is always some turmoil. You seek drama and thrill, and you break hearts without looking back.~
== VPSIMEB ~You seem to consider men fragile and unable to care for themselves, Jaheira. I wonder why?~
EXIT

CHAIN
IF ~InParty("Jaheira")
See("Jaheira")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeJaheira2","GLOBAL",0)~ THEN VPSIMEB SimeJaheira2
~Jaheira, I repeat again, the white moss from the tundra is the ingredient needed for this potion. You cannot hope to be successful without it.~ [SIMEJH03]
DO ~SetGlobal("VPSimeJaheira2","GLOBAL",1)~
== BJAHEIR ~And what would you know of potions?~
== VPSIMEB ~I walk the wild and I know my herbs. If it interests you I have gathered the moss myself in Icewind Dale and I know its uses very well.~
== BJAHEIR ~More talents. Aren't we fortunate to have someone so learned and well-traveled amongst us! But Sime, Tethyr is far away from Icewind Dale and we have found an acceptable substitute.~
== VPSIMEB ~I see. I had better write it down then.~
EXIT

// Jan

CHAIN
IF ~InParty("Jan")
See("Jan")
!StateCheck("Jan",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeJan1","GLOBAL",0)~ THEN VPSIMEB SimeJan1
~(*brushes her long blond hair and looks thoughtful*)~
DO ~SetGlobal("VPSimeJan1","GLOBAL",1)~
== BJAN ~Now that reminds me my second cousin Amalia...~
== VPSIMEB ~(*sighs*) Was she a blonde?~
== BJAN ~Cousin Amalia? She did not have hair at all and wore a wig. But that did not hinder Amalia. She was a true femme fatale, just like you. You see, she was dreaming to give herself to a true artist, a man of inspiration and vision. "I shall fall in love because I fall in love" she was saying often. "And I can only fall in love with a great artist!" She wedded an old man.~
== VPSIMEB ~An old artist?~
== BJAN ~No, a turnip merchant. One of the most prominent in the trade, I must say. He had the biggest shop in the whole of Waterdeep and was exporting turnips as far as Rasheman. They eat plenty of turnip there.~
== VPSIMEB ~I am afraid you’ve lost me, Jan. Why would Amalia marry a turnip merchant?~
== BJAN ~You see, she adored obstacles. The old rich man was the great obstacle on her way to true love. She was crying and acting all weird and saying that one day she is to find her true love and she will follow her calling for arts but until then she has too many obstacles. So when her husband died...~
== VPSIMEB ~She met an artist?~
== BJAN ~No, she actually met another obstacle, poor soul.~
== VPSIMEB ~Let me guess: another rich old man?~
== BJAN ~Indeed. Which reminds me...~
== VPSIMEB ~Sorry, Jan, I absolutely have to interrupt you. I have a date and I do not want to be late. Good night!~ DO ~RestParty()~
EXIT

CHAIN
IF ~InParty("Jan")
See("Jan")
!StateCheck("Jan",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeJan2","GLOBAL",0)~ THEN VPSIMEB SimeJan2
~Jan, may I see it? I am pretty sure you were carving that turnip.~
DO ~SetGlobal("VPSimeJan2","GLOBAL",1)~
== BJAN ~I was indeed. That's a craft we, the Jansens, possessed for many generations. This turnip I called Lissa. That pinkish shade on its sides reminds me of Lissa's cheeks. Just as plump too. Lissa was my fianc?e if you wish to know.~
== VPSIMEB ~Hmm, seems to me that I err in looking at the tall knights and noble rangers for a romance. If you are capable of see a blushing maiden in a highly prosaic vegetable, you must have a heart of a poet, Jan.~
== BJAN ~Oh, poetry. That reminds me of the time Cousin Willy was writing that play of his. He said that the biggest problem is to get a captivating title. Uncle Lero said however that Cousin Willy's play would be just the same no matter what title he uses. So Cousin Willy called it "A Play Without a Name". Which apparently was a captivating title. Or so the critics said.~
== VPSIMEB ~Good for your Cousin Willy!~
== BJAN ~Not exactly, the problem was that the general opinion was that the play failed to deliver what the captivating title promised. People were so mad that Cousin Willy switched the name to "A Lovestory of Teomund and Allastria Which Happened During the Times of Troubles in the Great and Prosperous City of Baldur's Gate Governed by the Most Respectable Dukes".~
== VPSIMEB ~I get the picture, Jan. How clever! I bet that not a single critic was able to read the whole title from the beginning to the end.~
== BJAN ~Neither did the spectators. Imagine, they have to add twenty extra pages to the program, which in turn led to the shortage of paper and bread in Neverwinter and huge riots. Unfortunately because of these riots the playhouse was closed and Cousin Willy's play was prohibited.~
== VPSIMEB ~Paper and bread? Dare I ask...  No, forget it! Let’s catch up with the rest, Jan.~
EXIT

// Keldorn

CHAIN
IF ~InParty("Keldorn")
See("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeKeldorn1","GLOBAL",0)~ THEN VPSIMEB SimeKeldorn1
~Keldorn, old man, you are a pitiful sight. Why are you on the road instead of sitting by the fireplace and telling your kids stories of old?~ [SIMEKE01]
DO ~SetGlobal("VPSimeKeldorn1","GLOBAL",1)~
== BKELDOR ~I am on the road because that’s my duty.~
== VPSIMEB ~Your first duty is to your family, Keldorn. Nothing is worth taking a father from his children’s life and a husband from his wife’s thoughts.~
== BKELDOR ~If I were not on the road, Sime, some other husband would not return to his wife, slain by a monster or a bandit and his children would turn fatherless.~
== VPSIMEB ~You sound convinced. But does not your heart tell you that you are wrong?~
== BKELDOR ~Far too often I waver, Sime. I wish not for you to add to my doubts. Please, allow me some peace.~
== VPSIMEB ~As you wish.~
EXIT

CHAIN
IF ~InParty("Keldorn")
See("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeKeldorn2","GLOBAL",0)~ THEN VPSIMEB SimeKeldorn2
~You want to find a word that rhymes with Maria? Truly, Sir Keldorn, that’s a question to ask a bard, not a ranger such as I.~ [SIMEKE02]
DO ~SetGlobal("VPSimeKeldorn2","GLOBAL",1)~
== BKELDOR ~I thought you might know a thing or two about lovers’ talk. I miss Maria deeply and I wanted to write her a letter. But I am an old soldier and have little experience with tender words. I know it does not suit me to act like a boy, but really, I need to tell her how of my love.~
== VPSIMEB ~Why won’t you write her what you just told me and add that the only rhymes you can find to Maria is Keldorn?~
== BKELDOR ~By Torm, that’s a jolly good idea, milady!~
== VPSIMEB ~My pleasure, Sir Keldorn.~ [SIMEKE03]
EXIT

// Korgan

CHAIN
IF ~InParty("Korgan")
See("Korgan")
!StateCheck("Korgan",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeKorgan","GLOBAL",0)~ THEN VPSIMEB SimeKorgan1
~Greed and lust, nothing else! Even your bravery is a commendable thing. For it is born in a cold heart.~ [SIMEKO01]
DO ~SetGlobal("VPSimeKorgan","GLOBAL",1)~
== BKORGAN ~Shut your mouth, girl afore I shut it with me fist.~
== VPSIMEB ~Bah! Try it and you may lose your fist.~ [SIMEKO02]
== BKORGAN ~Blasted fool! Think you can spit on me cause I take care of meself and not burden me head with worries of nonsense! I remember there was that priest of Ilmater, who thought to convert me...~
== VPSIMEB ~A martyr, no doubt.~
== BKORGAN ~A dimwit more like. I hit low times and I told him, I'd go to his darned church and sleep there. ~
== VPSIMEB ~They had to wash the temple with holy water after your visit, I am sure.~
== BKORGAN ~I did not stay. I slept that night in the best inn!~
== VPSIMEB ~I thought you were low on cash?~
== BKORGAN ~Some miserly Lord came by with a load of coin to donate to the priests. His sins were plugging him. So the idiot decided to give, not to take. I persuaded him to give... to me that is. Low times were over for Korgan. And he went straight to his god's arms, just as he desired.~
== VPSIMEB ~You... killed him? Only out of respect for <CHARNAME> shall I let you be for now. But I warn you: as soon as you are not affiliated with <PRO_HIMHER>, I challenge you to a fight!~
EXIT

CHAIN
IF ~InParty("Korgan")
See("Korgan")
!StateCheck("Korgan",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeKorgan","GLOBAL",1)~ THEN VPSIMEB SimeKorgan2.0
~Get away from me!~ [SIMEKO03]
DO ~SetGlobal("VPSimeKorgan","GLOBAL",2)~
== BKORGAN ~I love when they fight! Come, girl you want it, do not you?~
== VPSIMEB ~You are drunk!~
== BKORGAN ~A man cannot go fighting without his ale, fool girl. Now, enough talking!~
== VPSIMEB ~Indeed! (*hits him*)~
== BKORGAN ~Ooh! Yor hit a dwarf on the head! Ha-Ha-Ha! Yor have a lot to learn!~
== VPSIMEB ~(*picks up her mace*)~
== BKORGAN ~Hot stuff!~
== VPSIMEB ~(*Hits his knees*)~
== BKORGAN ~Fast learner! Ouch! That hurts! You're gonna suffer... Where is me axe? (*Tumbles over, hits the floor and starts snoring.*)~
== VPSIMEB ~(*with disgust*): I loathe the day <CHARNAME> got this bastard to join in with us. I HATE him!~
END
  IF ~~ THEN REPLY ~Sime, we need this fighter. I’ll talk to him tomorrow and ask him to stop bugging you.~ GOTO SimeKorgan2.1
  IF ~~ THEN REPLY ~Sime, I think he... likes you. None can resist your charm.~ GOTO SimeKorgan2.2
  IF ~~ THEN REPLY ~He is out this very moment!~ GOTO SimeKorgan2.3

CHAIN VPSIMEB SimeKorgan2.1
~You are an idiot! He does more harm than good. Suit yourself. But know that next time I’ll kill the bastard.~ [SIMEKO04]
EXIT

CHAIN VPSIMEB SimeKorgan2.2
~You are mad! He was trying to rape me! I... I will not stay any longer.~DO ~LeaveParty() EscapeArea()~
EXIT

CHAIN VPSIMEB SimeKorgan2.3
~Thank you, your actions are both wise and proper.~ DO ~SetGlobal("VP_KorganAttacksSime","GLOBAL",1)~
EXIT

// Mazzy

CHAIN
IF ~InParty("Mazzy")
See("Mazzy")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeMazzy1","GLOBAL",0)~ THEN VPSIMEB SimeMazzy1
~I am most pleased to be introduced to you, Lady Mazzy. I have heard the most favorable things about you and your group.~ [SIMEMA01]
DO ~SetGlobal("VPSimeMazzy1","GLOBAL",1)~
== BMAZZY ~None of them are here to trade a tale or share a glass of wine with. Shadows took them all.~
== VPSIMEB ~I grief with you. I know from my own experiences that one’s own wound does not hurt as much as those of friends’.~
== BMAZZY ~I was under the impression that you are a loner, Sime.~
== VPSIMEB ~I have not always been a loner, Mazzy. Once I roamed the forests and dales with a company of brave friends. We were so young and restless and we almost believed ourselves immortal. But the fates decreed otherwise. So I am a loner now. With a glass of good wine I wish to toast every one of them!~
== BMAZZY ~So do I. To Patrick, my beloved!~
== VPSIMEB ~To Kilendil, whose arrows ever hit the mark!~ [SIMEMA02]
== BMAZZY ~To Andrea and her little pseudo-dragon! I swear, I miss the little bugger.~
== VPSIMEB ~To Dorian, the man whose smile made my heart race! I shall never forget you!~
END
IF ~~ THEN REPLY ~Shut up, you crows! Let the dead be!~ GOTO SimeMazzy1.1
IF ~~ THEN REPLY ~I shall join in. To Dynaheir! None could summon a fireball with such a grace! To Khalid, the man who won each battle with due humility!~ GOTO SimeMazzy1.2
IF ~~ THEN REPLY ~Your conversation is making me sad. For I have a list of friends lost as well. Would you not drink quietly?~ GOTO SimeMazzy1.3
IF ~~ THEN REPLY ~Do not let your sorrow cloud your hearts, friends. We will all die eventually. I say let it be on the battlefield!~ GOTO SimeMazzy1.4

CHAIN VPSIMEB SimeMazzy1.1
~Shut up yourself. I am drunk now and I wish to drink to my friends. Each of them was worth ten of your kind!~ [SIMEMA03]
EXIT

CHAIN VPSIMEB SimeMazzy1.2
~To Khalid and Dynaheir!~
EXIT

CHAIN VPSIMEB SimeMazzy1.3
~Why would you not join us instead? Mayhap you would feel better if you tell us of your brave friends who will not join us again.~
EXIT

CHAIN VPSIMEB SimeMazzy1.4
~Let it be. But I cannot chase the sorrow away tonight. I shall be drunk.~
EXIT

CHAIN
IF ~InParty("Mazzy")
See("Mazzy")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeMazzy2","GLOBAL",0)~ THEN VPSIMEB SimeMazzy2
~What is your weapon of choice, Mazzy?~ [SIMEMA04]
DO ~SetGlobal("VPSimeMazzy2","GLOBAL",1)~
== BMAZZY ~But of course the sword! Long had the slender and bright blades fascinated me. Look, how well balanced it is and how it flows lightly through the air. Is it not beautiful?~
== VPSIMEB ~Yes, it is.~
== BMAZZY ~Your voice is impartial, but I can see the glimmer in your eyes. You like swords, Sime Linvail.~
== VPSIMEB ~You are right, Mazzy. My clerical persuasion does not allow me to wield a sharpened blade. That does not mean that I cannot appreciate the weapon.~
== BMAZZY ~Of course. Still I reckon you a fierce adversary, no matter what you wield. Swords do not win battles. Fighters do.~
== VPSIMEB ~(*laughs*) Unless it is a Mordenkainen’s Sword.~
== BMAZZY ~(*laughs*) Oh, that one! A wizards' toy!~
== VPSIMEB ~A dangerous toy nonetheless. Have you ever heard about the wizard who lost control over one of those blades? They say he made three full circles around the city’s wall, the sword on his heels, before the blade got dispelled.~ [SIMEMA05]
== BMAZZY ~I wish I had been there to see it. Serves as a good warning. A good fighter shall not entrust his life to a magical trinket!~
== VPSIMEB ~Yes, sometimes these things have mind of their own. Wondrous nonetheless.~
EXIT

// Minsc

CHAIN
IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeMinsc1","GLOBAL",0)~ THEN VPSIMEB SimeMinsc1
~I admire your choice of a familiar, Minsc. Indeed, it is not uncommon for a ranger to travel with a dire wolf or with a graceful panther. Yet you choose to give your friendship to a small and pitiful animal. That shows a richness of heart.~ [SIMEMI01]
DO ~SetGlobal("VPSimeMinsc1","GLOBAL",1)~
== BMINSC ~Boo is not small, Sime. Boo is a Miniature Giant Space Hamster. He is incredibly large for his very young age. And he is not pitiful! Have not you seen how he hungers for a battle?~
== VPSIMEB ~I did, Minsc. He is very... fierce.~
== BMINSC ~And after the battle is won he is the first one to drink the blood of our defeated enemies!~
== VPSIMEB ~(*pales*) I saw that. I am guessing it is an acquired taste.~
== BMINSC ~Yes! Boo learns the ferocity from Minsc! And he gives Minsc his wise counsel in return.~
== VPSIMEB ~Well, I am glad we had this little chat, Minsc.~
EXIT

CHAIN
IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeMinsc2","GLOBAL",0)~ THEN VPSIMEB SimeMinsc2
~Yes, Minsc, Boo is very fluffy. Exceptionally so. He is groomed to perfection.~ [SIMEMI02]
DO ~SetGlobal("VPSimeMinsc2","GLOBAL",1)~
== BMINSC ~Boo says that he likes what Lady Sime says about him. He says that Lady Sime has eyes like stars.~
== VPSIMEB ~Boo says that?~
== BMINSC ~Actually he said "as pretty as a hamster’s" but I thought "like stars" would be better. It is better, is it not?~
== VPSIMEB ~Yes, Minsc it was very nice. Boo’s, however, was a very non-traditional compliment, fresh and with zest. It would make me wonder about the secret meaning behind it.~
== BMINSC ~Ahem, Lady Sime, I am not sure that I know. Did you like what Boo said or did you like what Minsc said?~
== VPSIMEB ~I loved what both of you said. You are both incredibly sweet.~
EXIT

CHAIN
IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeMinsc3","GLOBAL",0)~ THEN VPSIMEB SimeMinsc3
~Minsc, thank you so much for putting my mace in a safe and secret place. Now if you would tell me where this place is...~ [SIMEMI06]
DO ~SetGlobal("VPSimeMinsc3","GLOBAL",1)~
== BMINSC ~Boo’s saying that if I tell you, it would not be a secret place.~
== VPSIMEB ~Yes, but I need my mace. And when I am fighting nobody will take the mace from me, except if I were to be killed.~
== BMINSC ~Minsc does not want Lady Sime to be dead. Boo would be very sad.~
== VPSIMEB ~If you do not want me dead, please, give me my mace.~
== BMINSC ~Boo is not sure it is a good idea. Lady Sime should not go up front. It is dangerous for Lady Sime. Lady Sime should stay behind Minsc and throw stones.~
== VPSIMEB ~What if some enemy were to trick the honorable Minsc and attack from the back? Then poor Sime would not be able to defend herself without her mace.~
== BMINSC ~Dirty tricksters would die once Minsc unleashed his righteous boot on them! But Boo thinks you are right. Here is your mace, Sime.~
== VPSIMEB ~Your backpack is a very safe place indeed. Thank you, my dear Minsc, but in the future, please ask me before trying to help me out.~
EXIT

// Nalia

CHAIN
IF ~InParty("Nalia")
See("Nalia")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
OR(6)
	AreaCheck("AR1301")
	AreaCheck("AR1302")
	AreaCheck("AR1303")
	AreaCheck("AR1305")
	AreaCheck("AR1306")
	AreaCheck("AR1307")
Global("VPSimeNalia1","GLOBAL",0)~ THEN VPSIMEB SimeNalia1
~I wonder how you could live in that somber place. Do not you ever get chilly? I do not like closed spaces.~ [SIMENA01]
DO ~SetGlobal("VPSimeNalia1","GLOBAL",1)~
== BNALIA ~I love the Keep, Sime. I spent all my childhood there and I have many fond memories of my relatives and friends coming to visit us there. But of course I cannot help but to feel guilty that my family owns such an excessive space when the less fortunate have no roof over their head.~
== VPSIMEB ~I am unfortunate when I have a roof over my head, other than starry skies. But tell me, are you going to do something about this guilt or are you going to savor it?~ [SIMENA02]
== BNALIA ~As a matter of fact I have very definite plans for the Keep. In the Northern wing I shall create a school for the village kids and I plan to re-arrange the whole of the first floor into a charitable hospital. I have corresponded with few priests of Ilmater and few missionaries are willing to help me to start both the school and the hospital.~
== VPSIMEB ~Nalia, this is a brave enterprise. You will need a lot of support, though. Let me know if you can use an extra helping hand.~
EXIT

CHAIN
IF ~InParty("Nalia")
See("Nalia")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("RoenalControl","GLOBAL",1)
Global("VPSimeNalia1","GLOBAL",0)~ THEN VPSIMEB SimeNalia1A
~May be it’s for the best that the Castle is gone, Nalia? The Castle was a rather somber place. I would be chilly and lost in those endless dark chambers. I do not like closed spaces.~ [SIMENA03]
DO ~SetGlobal("VPSimeNalia1","GLOBAL",1)~
== BNALIA ~I love the Keep, Sime. I spent all my childhood there and I have many fond memories of my relatives and friends coming to visit us there.~
== VPSIMEB ~Come, Nalia! Our walls and arches are the tree trunks and our carpet is the glen full of flowers. Do you not breathe easier here? And aren’t you surrounded by friends?~
== BNALIA ~I do not really mourn the material loss, Sime. What bothers me is that my plans for the Keep were ruined. In the Northern wing I wanted to create a school for the village kids and I planned to re-arrange the whole of the first floor into a charitable hospital. Now none of it's going to happen!~
== VPSIMEB ~Nalia, I am astounded by your plans. Indeed it is a pity that you have not got the time to bring it to life. But you will always be a charitable person, no matter you own a Castle or not. Besides, things turn around and you might get the Castle back yet!~
EXIT

CHAIN
IF ~InParty("Nalia")
See("Nalia")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeNalia2","GLOBAL",0)~ THEN VPSIMEB SimeNalia2
~Do I have my cloak inside out, Nalia? Or is it something else about my humble persona that makes you look so puzzled?~ [SIMENA04]
DO ~SetGlobal("VPSimeNalia2","GLOBAL",1)~
== BNALIA ~I do not quite recognize you, Sime. The crimson cloak, jewelry, and I if I am not mistaken some make up...~
== VPSIMEB ~Oh, you are surprised by my city grab? *Laughs* I find little to my liking in Athkatla, Nalia. I might as well enjoy what I can. Crimson cloak in a forest might serve one purpose only.~
== BNALIA ~Which one would that be? I reckoned of none.~
== VPSIMEB ~It attracts bandits splendidly.~
== BNALIA ~(*Laughs*) They take you for an empty headed noble, do they not?~
== VPSIMEB ~An illusion which does not live long.~ [SIMENA05]
EXIT

// Valygar

CHAIN
IF ~InParty("Valygar")
See("Valygar")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeValygar1","GLOBAL",0)~ THEN VPSIMEB SimeValygar1
~I think you are robbing yourself, Valygar, by denying faith.~ [SIMEVA01]
DO ~SetGlobal("VPSimeValygar1","GLOBAL",1)~
== BVALYGA ~I do not deny faith. But I do not have love for gods and I do not worship them.~
== VPSIMEB ~Faith gives support and hope.~
== BVALYGA ~A shaky support and a false hope.~
== VPSIMEB ~As I said, you rob yourself. Is there no deity you feel...close to?~
== BVALYGA ~If I choose to worship, I’ll worship Shaundakul if that’s what you want to know.~
== VPSIMEB ~The Rider of the Winds and the Helping Hand? (*smiles*) I am not surprised in the least.~ [SIMEVA02]
EXIT

CHAIN
IF ~InParty("Valygar")
See("Valygar")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeValygar2","GLOBAL",0)~ THEN VPSIMEB SimeValygar2
~Insomnia torments you as well? Valygar! Your katana is as shiny as a looking glass! Stop polishing it. Look at me! Talk to me... I am bored and I am restless.~ [SIMEVA03]
DO ~SetGlobal("VPSimeValygar2","GLOBAL",1)~
== BVALYGA ~I do not like looking at woman above the leaping fire, Sime. It brings ill memories.~
== VPSIMEB ~Then I shall sit by your side and the fire will not be between us anymore. Now, tell me what I reminded you of.~ [SIMEVA04]
== BVALYGA ~You will be disappointed. It was only a childhood nightmare.~
== VPSIMEB ~I cannot picture you having nightmares, Valygar.~
== BVALYGA ~(*shrugs*)~
== VPSIMEB ~So?~
== BVALYGA ~You will have the tale, or I will not have rest?~
== VPSIMEB ~Yes, your guess is right.~
== BVALYGA ~Very well. I was a boy of eight years and I played around Corthala’s mansion. By chance I went through a secret entrance...~
== VPSIMEB ~(*smiles*) By chance?~
== BVALYGA ~Accidentally. It lead to a room my mother used for summoning. I saw her, standing against flames, crying out the words of the spell in agony... Then the demon appeared in the flames. It growled and pointed at me, mocking my fear, asking mother if I was to be killed. Mother managed to control the demon, but her anger was so terrible, that I thought I’d prefer to be eaten by the demon...~
== VPSIMEB ~She was just scared for your life, I am sure.~
== BVALYGA ~I know now. I did not know then. You heard the tale, now you think you will go sleep and leave me alone?~
== VPSIMEB ~Do I have a choice? Good night, Valygar.~
EXIT

// Viconia

CHAIN
IF ~InParty("Viconia")
See("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeViconia1","GLOBAL",0)~ THEN VPSIMEB SimeViconia1
~I am the daughter of Aran Linvail, Viconia. His only daughter.~ [SIMEVI01]
DO ~SetGlobal("VPSimeViconia1","GLOBAL",1)~
== BVICONI ~Why you are going away from the Shadow Thieves Guild? You do not look stupid to me, and yet your actions are inapt. In your absence another would usurp your rightful place by your father.~
== VPSIMEB ~In the Guild there are no inherited positions, Viconia. Should I want to advance I would start to work my way up from the streets and it would be my cunning which would promote me. But I have no desire to be connected with Shadow Thieves.~
== BVICONI ~You find it more desirable to crawl through the dirty streets and be treated like rubbish by every rivvin you meet and still have no station?~
== VPSIMEB ~Those who treat a ranger like rubbish are generally those who cry the loudest for his or her help in the time of need.~ [SIMEVI02]
== BVICONI ~(*snorts*) And they will get it, no doubt. Typical. Imbecilic surfacers.~
== VPSIMEB ~I think this conversation is over, Viconia. You will never understand my motives, I will never understand yours.~
EXIT

CHAIN
IF ~InParty("Viconia")
See("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeViconia2","GLOBAL",0)~ THEN VPSIMEB SimeViconia2
~You abandoned the way of Lloth. Not for any kinder deity I may say, but still, you did. How many are like you among the Drow, Viconia?~ [SIMEVI03]
DO ~SetGlobal("VPSimeViconia2","GLOBAL",1)~
== BVICONI ~Very few. Lloth is a cunning Mistress and watches her herd carefully. The high priestesses are ever restless, hunting the outlaws to sacrifice to Lloth and gain her favor.~
== VPSIMEB ~ I heard tales about Drizzt, and you have mentioned that your brother was a deviant as well. You fled to the surface and now live by your own rules. Which leads me to believe that a renegade Drow is not such an uncommon thing. Surely, there are others.~
== BVICONI ~I know of none. Drizzt * spits * brought misfortune and ill fate to all of the Menzoberranzan. I doubt that anyone would feel anything but loathing for him and his choices. Drizzt's treachery strengthened my people's resolve to keep to their own ways.~
== VPSIMEB ~I know your people’s "ways"! I have seen babes and women slain without pity by their sharp blades. I have seen the results of a Drow raid! How can a being that presumably has heart to commit deeds of such cruelty?~
== BVICONI ~If you wish for me to answer to all of my kin's doings, you are too late. You should have thrown a torch into my pyre.~
== VPSIMEB ~That would be adopting the way of the Drow, Viconia. Drow who will not hesitate to cut an Elf’s throat no question’s asked.~ [SIMEVI04]
EXIT

// Yoshimo

CHAIN
IF ~InParty("Yoshimo")
See("Yoshimo")
!StateCheck("Yoshimo",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeYoshimo1","GLOBAL",0)~ THEN VPSIMEB SimeYoshimo1
~Your smile conveys that you know more than you are willing to tell, Yoshimo. Why do you watch me and smile?~ [SIMEYO01]
DO ~SetGlobal("VPSimeYoshimo1","GLOBAL",1)~
== BYOSHIM ~Mayhap I admire the sight in front of me. Exquisite is your beauty, Sime, and perfect is your grace.~
== VPSIMEB ~Mayhap, but no, not this time. I know all sorts of men’s glances. Yours is not that of an admirer.~
== BYOSHIM ~(*bows*) You know more than you are willing to tell as well, Lady Sime.~
== VPSIMEB ~I speak my mind openly, Yoshimo and rarely do I play games.~
== BYOSHIM ~Then tell me, my direct and honest Sime, what interest Linvail has in <CHARNAME>?~
== VPSIMEB ~More often than not I am afraid to know the thoughts of Aran. My answer to you is that I simply do not know. And it is an honest one. But why should there be any special interest? <CHARNAME> paid for his assistance.~
== BYOSHIM ~Linvail wanted you, his most trusted ally, to follow <CHARNAME>.~
== VPSIMEB ~You cannot call me Aran’s ally! I am no Shadow Thief! I argue with Aran every single minute I spend with him! I disagree with everything he is doing!~ [SIMEYO02]
== BYOSHIM ~And yet you are the only one who would mourn his death, Sime. That’s an ally.~
== VPSIMEB ~True. But it does not mean that he confides in me.~
EXIT

CHAIN
IF ~InParty("Yoshimo")
See("Yoshimo")
!StateCheck("Yoshimo",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeYoshimo2","GLOBAL",0)~ THEN VPSIMEB SimeYoshimo2
~You are a calm and composed man, Yoshimo. A dangerous man. You are one of the best in the profession I have seen.~ [SIMEYO03]
DO ~SetGlobal("VPSimeYoshimo2","GLOBAL",1)~
== BYOSHIM ~Somehow the words of milady sound like a scold. Did you mean it to be a compliment?~
== VPSIMEB ~If a compliment, than a watery one. A pity that you chose to be a thief, and did not apply your considerable talents in another field.~ [SIMEYO04]
== BYOSHIM ~You have no love for thieves, I take it? Why so? You must have seen deserving ones among Aran’s cohorts.~
== VPSIMEB ~Aye, I did. They were dreamers and died quickly. A thief’s path is a displeasing one for an honorable person.~
== BYOSHIM ~Think what you may, Sime, but sometimes stealing means survival. Poor people had loved a thief or two more than they loved their lords. Noble lords turn thieves sometimes.~
== VPSIMEB ~That’s all tales!~
== BYOSHIM ~Each tale has a grain of truth.~
== VPSIMEB ~A very small grain.~
EXIT

// Kachiko

/*
CHAIN
IF ~InParty("VPKachi")
See("VPKachi")
!StateCheck("VPKachi",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
RealGlobalTimerExpired("VPSimeKachikoTimer","GLOBAL")
Global("VPSimeKachiko1","GLOBAL",0)~ THEN VPSIMEB SimeKachiko1
~The world is a small place, Kachiko! Could I imagine that I would be talking to a Kara-Turian one day?~ [SIMEKA01]
DO ~SetGlobal("VPSimeKachiko1","GLOBAL",1) RealSetGlobalTimer("VPSimeKachikoTimer","GLOBAL",2000)~
== VPKACHIB ~The world is a small place for those who travel, Sime. I know people for whom their house is an entire world.~
== VPSIMEB ~You are right, of course there are plenty of those for whom stepping over the threshold is an adventure. Not the sort of adventure I dream of.~
== VPKACHIB ~The mind has no boundaries, Sime. A philosopher may never leave his straw mat but his mind will travel the highest mountains and the deepest gorges and see the things clearer than the one who has climbed to the top.~
== VPSIMEB ~I do not think I would derive satisfaction from a road walked only in my mind.~
EXIT

CHAIN
IF ~InParty("VPKachi")
See("VPKachi")
!StateCheck("VPKachi",CD_STATE_NOTVALID)
!StateCheck("VPSime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
RealGlobalTimerExpired("VPSimeKachikoTimer","GLOBAL")
Global("VPSimeKachiko2","GLOBAL",0)~ THEN VPSIMEB SimeKachiko2
~You grew up in a large family, did you not, Kachiko?~ [SIMEKA02]
DO ~SetGlobal("VPSimeKachiko2","GLOBAL",1) RealSetGlobalTimer("VPSimeKachikoTimer","GLOBAL",2000)~
== VPKACHIB ~I have four brothers and a sister.~
== VPSIMEB ~I am an only child. I always wanted to have a sibling.~
== VPKACHIB ~It is a joy to have relations, yes. Your father does not have any other children?~
== VPSIMEB ~My father has been befriending only one certain type of women ever since my mother’s death. The sort which do not stay with one man for long and who would not carry a child.~
== VPKACHIB ~You sound bitter, Sime.~
== VPSIMEB ~I am not bitter, I just. . .I think that Aran believes that it will save him from pain.~ [SIMEKA03]
== VPKACHIB ~And you do not believe so?~
== VPSIMEB ~No, I do not. He is wedging the knife deeper in his wound and twisting it, causing himself more pain and more sorrow. I told him that many times, but he would not listen. He will understand one day, but it will be too late.~
EXIT
*/

