BEGIN VPSIMEB

//Aerie

CHAIN
IF ~InParty("Aerie")
See("Aerie")
!StateCheck("Aerie",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeAerie1","GLOBAL",0)~ THEN VPSIMEB SimeAerie1
@0
DO ~SetGlobal("VPSimeAerie1","GLOBAL",1)~
== BAERIE @1
== VPSIMEB @2
== BAERIE @3
== VPSIMEB @4
== BAERIE @5
== VPSIMEB @6
== BAERIE @7
== VPSIMEB @8
EXIT

CHAIN
IF ~InParty("Aerie")
See("Aerie")
!StateCheck("Aerie",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeAerie2","GLOBAL",0)~ THEN VPSIMEB SimeAerie2
@9
DO ~SetGlobal("VPSimeAerie2","GLOBAL",1)~
== BAERIE @10
== VPSIMEB @11
== BAERIE @12
== VPSIMEB @13
== BAERIE @14
== VPSIMEB @15
== BAERIE @16
== VPSIMEB @17
== BAERIE @18
== VPSIMEB @19
== BAERIE @20
== VPSIMEB @21
EXIT

CHAIN
IF ~InParty("Aerie")
See("Aerie")
!StateCheck("Aerie",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeAerie3","GLOBAL",0)
Global("VP_Sime_vs_Aerie","GLOBAL",5)~ THEN VPSIMEB SimeAerie3
@22
DO ~SetGlobal("VPSimeAerie3","GLOBAL",1) SetGlobal("VP_Sime_vs_Aerie","GLOBAL",6)~
== BAERIE @23
== VPSIMEB @24
== BAERIE @25
== VPSIMEB @26
== BAERIE @27
== VPSIMEB @28
== BAERIE @29
== VPSIMEB @30
EXIT

// Anomen

CHAIN
IF ~InParty("Anomen")
See("Anomen")
!StateCheck("Anomen",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeAnomen1","GLOBAL",0)~ THEN VPSIMEB SimeAnomen1
@31
DO ~SetGlobal("VPSimeAnomen1","GLOBAL",1)~
== BANOMEN @32
== VPSIMEB @33
== BANOMEN @34
== VPSIMEB @35
== BANOMEN @36
== VPSIMEB @37
== BANOMEN @38
== VPSIMEB @39
== BANOMEN @40
== VPSIMEB @41
EXIT

CHAIN
IF ~InParty("Anomen")
See("Anomen")
!StateCheck("Anomen",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeAnomen2","GLOBAL",0)~ THEN VPSIMEB SimeAnomen2
@42
DO ~SetGlobal("VPSimeAnomen2","GLOBAL",1)~
== BANOMEN @43
== VPSIMEB @44
== BANOMEN @45
== VPSIMEB @46
== BANOMEN @47
== VPSIMEB @48
== BANOMEN @49
== VPSIMEB @50
EXIT

// Cernd

CHAIN
IF ~InParty("Cernd")
See("Cernd")
!StateCheck("Cernd",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeCernd1","GLOBAL",0)~ THEN VPSIMEB SimeCernd1
@51
DO ~SetGlobal("VPSimeCernd1","GLOBAL",1)~
== BCERND @52
== VPSIMEB @53
== BCERND @54
== VPSIMEB @55
== BCERND @56
== VPSIMEB @57
== BCERND @58
== VPSIMEB @59
== BCERND @60
== VPSIMEB @61
EXIT

CHAIN
IF ~InParty("Cernd")
See("Cernd")
!StateCheck("Cernd",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeCernd2","GLOBAL",0)~ THEN VPSIMEB SimeCernd2
@62
DO ~SetGlobal("VPSimeCernd2","GLOBAL",1)~
== BCERND @63
== VPSIMEB @64
== BCERND @65
== VPSIMEB @66
== BCERND @67
== VPSIMEB @68
== BCERND @69
== VPSIMEB @70
EXIT

// Edwin

CHAIN
IF ~InParty("Edwin")
See("Edwin")
Gender("Edwin",MALE)
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeEdwin","GLOBAL",0)~ THEN VPSIMEB SimeEdwin1
@71
DO ~SetGlobal("VPSimeEdwin","GLOBAL",1)~
== BEDWIN @72
== VPSIMEB @73
== BEDWIN @74
== VPSIMEB @75
== BEDWIN @76
== VPSIMEB @77
== BEDWIN @78
== VPSIMEB @79
EXIT

CHAIN
IF ~InParty("Edwin")
See("Edwin")
Gender("Edwin",MALE)
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeEdwin","GLOBAL",1)~ THEN VPSIMEB SimeEdwin2
@80
DO ~SetGlobal("VPSimeEdwin","GLOBAL",2)~
== BEDWIN @81
== VPSIMEB @82
== BEDWIN @83
== VPSIMEB @84
== BEDWIN @85
== VPSIMEB @86
== BEDWIN @87
== VPSIMEB @88
== BEDWIN @89
== VPSIMEB @90
EXIT

CHAIN
IF ~InParty("Edwin")
See("Edwin")
Gender("Edwin",MALE)
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeEdwin","GLOBAL",2)~ THEN VPSIMEB SimeEdwin3
@91
DO ~SetGlobal("VPSimeEdwin","GLOBAL",3)~
== BEDWIN @92
== VPSIMEB @93
== BEDWIN @94
== VPSIMEB @95
== BEDWIN @96
== VPSIMEB @97
EXIT

CHAIN
IF ~InParty("Edwin")
See("Edwin")
Gender("Edwin",MALE)
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeEdwin","GLOBAL",3)~ THEN VPSIMEB SimeEdwin4
@98
DO ~SetGlobal("VPSimeEdwin","GLOBAL",4)~
== BEDWIN @99
== VPSIMEB @100
== BEDWIN @101
== VPSIMEB @102
== BEDWIN @103
== VPSIMEB @104
== BEDWIN @105
== VPSIMEB @106
== BEDWIN @107
== VPSIMEB @108
EXIT

// Haer'Dalis

CHAIN
IF ~InParty("HaerDalis")
See("HaerDalis")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeHaerDalis","GLOBAL",0)~ THEN VPSIMEB SimeHaerDalis1
@109
DO ~SetGlobal("VPSimeHaerDalis","GLOBAL",1)~
== BHAERDA @110
== VPSIMEB @111
== BHAERDA @112
== VPSIMEB @113
== BHAERDA @114
== VPSIMEB @115
== BHAERDA @116
== VPSIMEB @117
== BHAERDA @118
== VPSIMEB @119
== BHAERDA @120
== VPSIMEB @121
EXIT

CHAIN
IF ~InParty("HaerDalis")
See("HaerDalis")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeHaerDalis","GLOBAL",1)~ THEN VPSIMEB SimeHaerDalis2
@122
DO ~SetGlobal("VPSimeHaerDalis","GLOBAL",2)~
== BHAERDA @123
== VPSIMEB @124
== BHAERDA @125
== VPSIMEB @126
EXIT

CHAIN
IF ~InParty("HaerDalis")
See("HaerDalis")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeHaerDalis","GLOBAL",3)~ THEN VPSIMEB SimeHaerDalis3
@127
DO ~SetGlobal("VPSimeHaerDalis","GLOBAL",4)~
== BHAERDA @128
== VPSIMEB @129
== BHAERDA @130
== VPSIMEB @131
EXIT

CHAIN
IF ~InParty("HaerDalis")
See("HaerDalis")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeHaerDalis","GLOBAL",4)~ THEN VPSIMEB SimeHaerDalis4
@132
DO ~SetGlobal("VPSimeHaerDalis","GLOBAL",5)~
== BHAERDA @133
== VPSIMEB @134
== BHAERDA @135
== VPSIMEB @136
== BHAERDA @137
== VPSIMEB @138
== BHAERDA @139
== VPSIMEB @140
EXIT

CHAIN
IF ~InParty("HaerDalis")
See("HaerDalis")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeHaerDalis","GLOBAL",5)~ THEN VPSIMEB SimeHaerDalis5
@141
DO ~SetGlobal("VPSimeHaerDalis","GLOBAL",6)~
== BHAERDA @142
== VPSIMEB @143
== BHAERDA @144
== VPSIMEB @145
EXIT

CHAIN
IF ~InParty("HaerDalis")
See("HaerDalis")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeHaerDalis","GLOBAL",6)~ THEN VPSIMEB SimeHaerDalis6
@146
DO ~SetGlobal("VPSimeHaerDalis","GLOBAL",7)~
== BHAERDA @147
== VPSIMEB @148
== BHAERDA @149
== VPSIMEB @150
== BHAERDA @151
== VPSIMEB @152
EXIT

CHAIN
IF ~InParty("HaerDalis")
See("HaerDalis")
!StateCheck("HaerDalis",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeHaerDalis","GLOBAL",7)~ THEN VPSIMEB SimeHaerDalis7
@153
DO ~SetGlobal("VPSimeHaerDalis","GLOBAL",8)~
== BHAERDA @154
== VPSIMEB @155
== BHAERDA @156
== VPSIMEB @157
== BHAERDA @158
== VPSIMEB @159
== BHAERDA @160
== VPSIMEB @161
EXIT

// Imoen

CHAIN
IF ~InParty("Imoen")
See("Imoen")
!StateCheck("Imoen",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeImoen1","GLOBAL",0)~ THEN VPSIMEB SimeImoen1
@162
DO ~SetGlobal("VPSimeImoen1","GLOBAL",1)~
== BIMOEN2 @163
== VPSIMEB @164
== BIMOEN2 @165
== VPSIMEB @166
== BIMOEN2 IF ~InParty("Jaheira")~ THEN @167
== BIMOEN2 IF ~!InParty("Jaheira")~ THEN @168
== VPSIMEB IF ~InParty("Jaheira")~ THEN @169
== VPSIMEB IF ~!InParty("Jaheira")~ THEN @170
EXIT

CHAIN
IF ~InParty("Imoen")
See("Imoen")
!StateCheck("Imoen",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeImoen2","GLOBAL",0)~ THEN VPSIMEB SimeImoen2
@171
DO ~SetGlobal("VPSimeImoen2","GLOBAL",1)~
== BIMOEN2 @172
== BIMOEN2 IF ~InParty("Aerie")~ THEN @173
== VPSIMEB IF ~InParty("Aerie")~ THEN @174
== BIMOEN2 IF ~InParty("Korgan")~ THEN @175
== VPSIMEB IF ~InParty("Korgan")~ THEN @176
== BIMOEN2 IF ~InParty("Valygar")~ THEN @177
== VPSIMEB IF ~InParty("Valygar")~ THEN @178
== BIMOEN2 IF ~InParty("Valygar")~ THEN @179
== VPSIMEB IF ~InParty("Valygar")~ THEN @180
== BIMOEN2 IF ~InParty("Anomen")~ THEN @181
== VPSIMEB IF ~InParty("Anomen")~ THEN @182
== BIMOEN2 IF ~InParty("Cernd")~ THEN @183
== VPSIMEB IF ~InParty("Cernd")~ THEN @184
== BIMOEN2 IF ~InParty("Jan")~ THEN @185
== VPSIMEB IF ~InParty("Jan")~ THEN @186
== BIMOEN2 IF ~InParty("Yoshimo")~ THEN @187
== VPSIMEB IF ~InParty("Yoshimo")~ THEN @188
//== BIMOEN2 IF ~InParty("Kachiko")~ THEN ~Kachiko has a lock of dark hair!~
//== VPSIMEB IF ~InParty("Kachiko")~ THEN ~I am guessing Yoshimo’s mane is missing it!~
== BIMOEN2 IF ~InParty("Keldorn")~ THEN @189
== VPSIMEB IF ~InParty("Keldorn")~ THEN @190
== BIMOEN2 IF ~InParty("Nalia")~ THEN @191
== VPSIMEB IF ~InParty("Nalia")~ THEN @192
== BIMOEN2 IF ~InParty("Mazzy")~ THEN @193
== VPSIMEB IF ~InParty("Mazzy")~ THEN @194
== BIMOEN2 IF ~InParty("Jaheira")~ THEN @195
== VPSIMEB IF ~InParty("Jaheira")~ THEN @196
== BIMOEN2 IF ~InParty("Minsc")~ THEN @197
== VPSIMEB IF ~InParty("Minsc")~ THEN @198
== BIMOEN2 IF ~InParty("Edwin")~ THEN @199
== VPSIMEB IF ~InParty("Edwin")~ THEN @200
== BIMOEN2 IF ~InParty("Viconia")~ THEN @201
== VPSIMEB IF ~InParty("Viconia")~ THEN @202
== VPSIMEB @203
EXIT

// Jaheira

CHAIN
IF ~InParty("Jaheira")
See("Jaheira")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeJaheira1","GLOBAL",0)~ THEN VPSIMEB SimeJaheira1
@204
DO ~SetGlobal("VPSimeJaheira1","GLOBAL",1)~
== BJAHEIR @205
== VPSIMEB @206
== BJAHEIR @207
== VPSIMEB @208
== BJAHEIR @209
== VPSIMEB @210
EXIT

CHAIN
IF ~InParty("Jaheira")
See("Jaheira")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeJaheira2","GLOBAL",0)~ THEN VPSIMEB SimeJaheira2
@211
DO ~SetGlobal("VPSimeJaheira2","GLOBAL",1)~
== BJAHEIR @212
== VPSIMEB @213
== BJAHEIR @214
== VPSIMEB @215
EXIT

// Jan

CHAIN
IF ~InParty("Jan")
See("Jan")
!StateCheck("Jan",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeJan1","GLOBAL",0)~ THEN VPSIMEB SimeJan1
@216
DO ~SetGlobal("VPSimeJan1","GLOBAL",1)~
== BJAN @217
== VPSIMEB @218
== BJAN @219
== VPSIMEB @220
== BJAN @221
== VPSIMEB @222
== BJAN @223
== VPSIMEB @224
== BJAN @225
== VPSIMEB @226
== BJAN @227
== VPSIMEB @228 DO ~RestParty()~
EXIT

CHAIN
IF ~InParty("Jan")
See("Jan")
!StateCheck("Jan",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeJan2","GLOBAL",0)~ THEN VPSIMEB SimeJan2
@229
DO ~SetGlobal("VPSimeJan2","GLOBAL",1)~
== BJAN @230
== VPSIMEB @231
== BJAN @232
== VPSIMEB @233
== BJAN @234
== VPSIMEB @235
== BJAN @236
== VPSIMEB @237
EXIT

// Keldorn

CHAIN
IF ~InParty("Keldorn")
See("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeKeldorn1","GLOBAL",0)~ THEN VPSIMEB SimeKeldorn1
@238
DO ~SetGlobal("VPSimeKeldorn1","GLOBAL",1)~
== BKELDOR @239
== VPSIMEB @240
== BKELDOR @241
== VPSIMEB @242
== BKELDOR @243
== VPSIMEB @244
EXIT

CHAIN
IF ~InParty("Keldorn")
See("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeKeldorn2","GLOBAL",0)~ THEN VPSIMEB SimeKeldorn2
@245
DO ~SetGlobal("VPSimeKeldorn2","GLOBAL",1)~
== BKELDOR @246
== VPSIMEB @247
== BKELDOR @248
== VPSIMEB @249
EXIT

// Korgan

CHAIN
IF ~InParty("Korgan")
See("Korgan")
!StateCheck("Korgan",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeKorgan","GLOBAL",0)~ THEN VPSIMEB SimeKorgan1
@250
DO ~SetGlobal("VPSimeKorgan","GLOBAL",1)~
== BKORGAN @251
== VPSIMEB @252
== BKORGAN @253
== VPSIMEB @254
== BKORGAN @255
== VPSIMEB @256
== BKORGAN @257
== VPSIMEB @258
== BKORGAN @259
== VPSIMEB @260
EXIT

CHAIN
IF ~InParty("Korgan")
See("Korgan")
!StateCheck("Korgan",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeKorgan","GLOBAL",1)~ THEN VPSIMEB SimeKorgan2.0
@261
DO ~SetGlobal("VPSimeKorgan","GLOBAL",2)~
== BKORGAN @262
== VPSIMEB @263
== BKORGAN @264
== VPSIMEB @265
== BKORGAN @266
== VPSIMEB @267
== BKORGAN @268
== VPSIMEB @269
== BKORGAN @270
== VPSIMEB @271
END
  IF ~~ THEN REPLY @272 GOTO SimeKorgan2.1
  IF ~~ THEN REPLY @273 GOTO SimeKorgan2.2
  IF ~~ THEN REPLY @274 GOTO SimeKorgan2.3

CHAIN VPSIMEB SimeKorgan2.1
@275
EXIT

CHAIN VPSIMEB SimeKorgan2.2
@276DO ~LeaveParty() EscapeArea()~
EXIT

CHAIN VPSIMEB SimeKorgan2.3
@277 DO ~SetGlobal("VP_KorganAttacksSime","GLOBAL",1)~
EXIT

// Mazzy

CHAIN
IF ~InParty("Mazzy")
See("Mazzy")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeMazzy1","GLOBAL",0)~ THEN VPSIMEB SimeMazzy1
@278
DO ~SetGlobal("VPSimeMazzy1","GLOBAL",1)~
== BMAZZY @279
== VPSIMEB @280
== BMAZZY @281
== VPSIMEB @282
== BMAZZY @283
== VPSIMEB @284
== BMAZZY @285
== VPSIMEB @286
END
IF ~~ THEN REPLY @287 GOTO SimeMazzy1.1
IF ~~ THEN REPLY @288 GOTO SimeMazzy1.2
IF ~~ THEN REPLY @289 GOTO SimeMazzy1.3
IF ~~ THEN REPLY @290 GOTO SimeMazzy1.4

CHAIN VPSIMEB SimeMazzy1.1
@291
EXIT

CHAIN VPSIMEB SimeMazzy1.2
@292
EXIT

CHAIN VPSIMEB SimeMazzy1.3
@293
EXIT

CHAIN VPSIMEB SimeMazzy1.4
@294
EXIT

CHAIN
IF ~InParty("Mazzy")
See("Mazzy")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeMazzy2","GLOBAL",0)~ THEN VPSIMEB SimeMazzy2
@295
DO ~SetGlobal("VPSimeMazzy2","GLOBAL",1)~
== BMAZZY @296
== VPSIMEB @297
== BMAZZY @298
== VPSIMEB @299
== BMAZZY @300
== VPSIMEB @301
== BMAZZY @302
== VPSIMEB @303
== BMAZZY @304
== VPSIMEB @305
EXIT

// Minsc

CHAIN
IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeMinsc1","GLOBAL",0)~ THEN VPSIMEB SimeMinsc1
@306
DO ~SetGlobal("VPSimeMinsc1","GLOBAL",1)~
== BMINSC @307
== VPSIMEB @308
== BMINSC @309
== VPSIMEB @310
== BMINSC @311
== VPSIMEB @312
EXIT

CHAIN
IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeMinsc2","GLOBAL",0)~ THEN VPSIMEB SimeMinsc2
@313
DO ~SetGlobal("VPSimeMinsc2","GLOBAL",1)~
== BMINSC @314
== VPSIMEB @315
== BMINSC @316
== VPSIMEB @317
== BMINSC @318
== VPSIMEB @319
EXIT

CHAIN
IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeMinsc3","GLOBAL",0)~ THEN VPSIMEB SimeMinsc3
@320
DO ~SetGlobal("VPSimeMinsc3","GLOBAL",1)~
== BMINSC @321
== VPSIMEB @322
== BMINSC @323
== VPSIMEB @324
== BMINSC @325
== VPSIMEB @326
== BMINSC @327
== VPSIMEB @328
EXIT

// Nalia

CHAIN
IF ~InParty("Nalia")
See("Nalia")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
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
@329
DO ~SetGlobal("VPSimeNalia1","GLOBAL",1)~
== BNALIA @330
== VPSIMEB @331
== BNALIA @332
== VPSIMEB @333
EXIT

CHAIN
IF ~InParty("Nalia")
See("Nalia")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("RoenalControl","GLOBAL",1)
Global("VPSimeNalia1","GLOBAL",0)~ THEN VPSIMEB SimeNalia1A
@334
DO ~SetGlobal("VPSimeNalia1","GLOBAL",1)~
== BNALIA @335
== VPSIMEB @336
== BNALIA @337
== VPSIMEB @338
EXIT

CHAIN
IF ~InParty("Nalia")
See("Nalia")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeNalia2","GLOBAL",0)~ THEN VPSIMEB SimeNalia2
@339
DO ~SetGlobal("VPSimeNalia2","GLOBAL",1)~
== BNALIA @340
== VPSIMEB @341
== BNALIA @342
== VPSIMEB @343
== BNALIA @344
== VPSIMEB @345
EXIT

// Valygar

CHAIN
IF ~InParty("Valygar")
See("Valygar")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeValygar1","GLOBAL",0)~ THEN VPSIMEB SimeValygar1
@346
DO ~SetGlobal("VPSimeValygar1","GLOBAL",1)~
== BVALYGA @347
== VPSIMEB @348
== BVALYGA @349
== VPSIMEB @350
== BVALYGA @351
== VPSIMEB @352
EXIT

CHAIN
IF ~InParty("Valygar")
See("Valygar")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeValygar2","GLOBAL",0)~ THEN VPSIMEB SimeValygar2
@353
DO ~SetGlobal("VPSimeValygar2","GLOBAL",1)~
== BVALYGA @354
== VPSIMEB @355
== BVALYGA @356
== VPSIMEB @357
== BVALYGA @358
== VPSIMEB @359
== BVALYGA @360
== VPSIMEB @361
== BVALYGA @362
== VPSIMEB @363
== BVALYGA @364
== VPSIMEB @365
== BVALYGA @366
== VPSIMEB @367
EXIT

// Viconia

CHAIN
IF ~InParty("Viconia")
See("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeViconia1","GLOBAL",0)~ THEN VPSIMEB SimeViconia1
@368
DO ~SetGlobal("VPSimeViconia1","GLOBAL",1)~
== BVICONI @369
== VPSIMEB @370
== BVICONI @371
== VPSIMEB @372
== BVICONI @373
== VPSIMEB @374
EXIT

CHAIN
IF ~InParty("Viconia")
See("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeViconia2","GLOBAL",0)~ THEN VPSIMEB SimeViconia2
@375
DO ~SetGlobal("VPSimeViconia2","GLOBAL",1)~
== BVICONI @376
== VPSIMEB @377
== BVICONI @378
== VPSIMEB @379
== BVICONI @380
== VPSIMEB @381
EXIT

// Yoshimo

CHAIN
IF ~InParty("Yoshimo")
See("Yoshimo")
!StateCheck("Yoshimo",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeYoshimo1","GLOBAL",0)~ THEN VPSIMEB SimeYoshimo1
@382
DO ~SetGlobal("VPSimeYoshimo1","GLOBAL",1)~
== BYOSHIM @383
== VPSIMEB @384
== BYOSHIM @385
== VPSIMEB @386
== BYOSHIM @387
== VPSIMEB @388
== BYOSHIM @389
== VPSIMEB @390
== BYOSHIM @391
== VPSIMEB @392
EXIT

CHAIN
IF ~InParty("Yoshimo")
See("Yoshimo")
!StateCheck("Yoshimo",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("VPSimeYoshimo2","GLOBAL",0)~ THEN VPSIMEB SimeYoshimo2
@393
DO ~SetGlobal("VPSimeYoshimo2","GLOBAL",1)~
== BYOSHIM @394
== VPSIMEB @395
== BYOSHIM @396
== VPSIMEB @397
== BYOSHIM @398
== VPSIMEB @399
== BYOSHIM @400
== VPSIMEB @401
EXIT

// Kachiko

/*
CHAIN
IF ~InParty("vpkachi")
See("vpkachi")
!StateCheck("vpkachi",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
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
IF ~InParty("vpkachi")
See("vpkachi")
!StateCheck("vpkachi",CD_STATE_NOTVALID)
!StateCheck("vpsime",CD_STATE_NOTVALID)
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

