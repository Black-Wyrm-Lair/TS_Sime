BEGIN VPSIMEB2

// Anomen

CHAIN
IF ~InParty("Anomen")
See("Anomen")
!StateCheck("Anomen",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeAnomenTOB1","GLOBAL",0)~ THEN VPSIMEB SimeAnomenTOB1
~It is good of you my dear Lord Anomen to pick up my glove. I am much obliged.~
DO ~SetGlobal("VPSimeAnomenTOB1","GLOBAL",1)~
== BANOME25 ~The gratitude of a lady is what a knight strives for. He is willing to endanger his life in a tournament for her approval and he seeks adventures and glory to gain her favor.~
== VPSIMEB2 ~I am familiar with the concept, Anomen.~
== BANOME25 ~A little wrinkle between your brows indicates that you do not approve. Is that so, Sime?~
== VPSIMEB2 ~I am an adept of another sort of love, Anomen.~
== BANOME25 ~Is there another sort of love, than falling for a beautiful and cold Lady from afar and fighting for years on end for a hint of a smile?~
== VPSIMEB2 ~I am not the sort to gaze from afar at boys fighting. There are enemies and monsters abound. If my man is to fight a dragon I am to fight alongside with him. So I profess love of a kind when people share pain and walk together. While the love lasts.~
== BANOME25 ~[*Chuckles*] Indeed my Lady, it is difficult to imagine you indifferent to a battle. I have been a witness to your prowess. But you said my Lady, "while the love lasts". Do you mean that all love expires?~
== VPSIMEB2 ~Indeed. And then it is time to walk your own way and keep fond memories.~
EXIT

// Keldorn

CHAIN
IF ~InParty("Keldorn")
See("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeKeldornTOB","GLOBAL",0)~ THEN VPSIMEB SimeKeldornTOB1
~And you are still here, you stubborn lout! Look, we are moving farther and farther away from Athkatla!~
DO ~SetGlobal("VPSimeKeldornTOB","GLOBAL",1)~
== BKELDO25 ~And my heart aches with every step. But I gather yours do too.~
== VPSIMEB2 ~Indeed. But the love my father and I share is stronger when there are long leagues between us.~
== BKELDO25 ~Mayhap, is that the reason why you are always on the road, Sime?~
== VPSIMEB2 ~On the road I am because I hunger to behold new sights and new people. I am a wanderer. My eyes would start watering from watching the same place every day.~
== BKELDO25 ~Will you also tire from the company of the same people?~
== VPSIMEB2 ~Nay, I will not. I can see my dear friend’s faces every waking minute and still wish for more of their company.~
== BKELDO25 ~Is not that why you are rumored not to part with some of them after the nightfall?~
== VPSIMEB2 ~Indeed. But a married man is a dead man in Sime’s books, Keldorn.~
== BKELDO25 ~What! I never!~
== VPSIMEB2 ~Oh, pardon me, my good Sir. (*Snickers*)~
EXIT

// Sarevok

CHAIN
IF ~InParty("Sarevok")
See("Sarevok")
!StateCheck("Sarevok",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeSarevokTOB","GLOBAL",0)~ THEN VPSIMEB SimeSarevokTOB1
~I look at you and I see a man who died, went through Nine Hells, and is back. It chills me to the bones, Sarevok, to be around you.~ [SIMESA01]
DO ~SetGlobal("VPSimeSarevokTOB","GLOBAL",1)~
== BSAREV25 ~You would be chilled deeper, to the very core of your trembling heart should I unveil the terrors and mysteries of the Abyss. You have not seen enough to be truly afraid, Sime. The Pocket Plain our ingenious <CHARNAME> has conjured is a cozy place, trust me.~
== VPSIMEB2 ~I believe you, Dark Lord. Even if I did not, one look at those shiny yet empty orbs of yours would convince me.~
== BSAREV25 ~Am I terrible to look upon for a young girl like you?~
== VPSIMEB2 ~You are and you know that. But I cannot deny that you have certain attractiveness as well.~ [SIMESA02]
== BSAREV25 ~The attractiveness of a sin, is not it? Women! To make a perfect one it takes all things the goodly gods can bestow and a drop of a demon’s blood.~
== VPSIMEB2 ~Strange compliments we have exchanged.~
EXIT

CHAIN
IF ~InParty("Sarevok")
See("Sarevok")
!StateCheck("Sarevok",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeSarevokTOB","GLOBAL",1)~ THEN VPSIMEB SimeSarevokTOB2
~Was it fear that led you to ask <CHARNAME> to bring you back half-way? Or is it redemption that you are seeking?~ [SIMESA03]
DO ~SetGlobal("VPSimeSarevokTOB","GLOBAL",2)~
== BSAREV25 ~Neither is true. Fear? I never knew what it is. The moment I knew that I was about to die I was not fearful, I was surprised. Redemption? Is it my place to seek redemption? My hands did what was done, but my father was in command of my heart, not me.~
== VPSIMEB2 ~So why do you want to return to the world of living?~
== BSAREV25 ~Because it is better to be a lowly peasant who lives than a dead godling. I had women, gold, wine, and power enough in my life to acquire a taste for them. Nay, not taste, thirst and hunger for more of those things.~
== VPSIMEB2 ~If you enjoyed it so much, why did you want to become a god who does not have a need for neither women, nor gold, nor wine?~ [SIMESA04]
== BSAREV25 ~Power, Sime, is a better lover than any woman and it tastes sweeter than wine and fills your hands fuller than gold coins.~
== VPSIMEB2 ~Wild is your blood and you are powerful. Yet you failed. May be you failed because you wanted power too strongly? How will <CHARNAME> fare, I wonder?~
EXIT
