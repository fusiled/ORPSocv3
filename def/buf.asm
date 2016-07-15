
buf.out:     formato del file elf32-or1k


Disassemblamento della sezione .vectors:

00000000 <_or1k_reset-0x100>:
	...

00000100 <_or1k_reset>:
     100:	18 00 00 00 	l.movhi r0,0x0
     104:	18 20 00 00 	l.movhi r1,0x0
     108:	18 40 00 00 	l.movhi r2,0x0
     10c:	18 60 00 00 	l.movhi r3,0x0
     110:	18 80 00 00 	l.movhi r4,0x0
     114:	18 a0 00 00 	l.movhi r5,0x0
     118:	18 c0 00 00 	l.movhi r6,0x0
     11c:	18 e0 00 00 	l.movhi r7,0x0
     120:	19 00 00 00 	l.movhi r8,0x0
     124:	19 20 00 00 	l.movhi r9,0x0
     128:	19 40 00 00 	l.movhi r10,0x0
     12c:	19 60 00 00 	l.movhi r11,0x0
     130:	19 80 00 00 	l.movhi r12,0x0
     134:	19 a0 00 00 	l.movhi r13,0x0
     138:	19 c0 00 00 	l.movhi r14,0x0
     13c:	19 e0 00 00 	l.movhi r15,0x0
     140:	1a 00 00 00 	l.movhi r16,0x0
     144:	1a 20 00 00 	l.movhi r17,0x0
     148:	1a 40 00 00 	l.movhi r18,0x0
     14c:	1a 60 00 00 	l.movhi r19,0x0
     150:	1a 80 00 00 	l.movhi r20,0x0
     154:	1a a0 00 00 	l.movhi r21,0x0
     158:	1a c0 00 00 	l.movhi r22,0x0
     15c:	1a e0 00 00 	l.movhi r23,0x0
     160:	1b 00 00 00 	l.movhi r24,0x0
     164:	1b 20 00 00 	l.movhi r25,0x0
     168:	1b 40 00 00 	l.movhi r26,0x0
     16c:	1b 60 00 00 	l.movhi r27,0x0
     170:	1b 80 00 00 	l.movhi r28,0x0
     174:	1b a0 00 00 	l.movhi r29,0x0
     178:	1b c0 00 00 	l.movhi r30,0x0
     17c:	1b e0 00 00 	l.movhi r31,0x0
     180:	a8 20 00 01 	l.ori r1,r0,0x1
     184:	c0 00 08 11 	l.mtspr r0,r1,0x11
     188:	c1 40 00 00 	l.mtspr r0,r0,0x5000
     18c:	18 80 00 00 	l.movhi r4,0x0
     190:	a8 84 20 30 	l.ori r4,r4,0x2030
     194:	44 00 20 00 	l.jr r4
     198:	15 00 00 00 	l.nop 0x0
	...
     200:	d4 00 08 04 	l.sw 4(r0),r1
     204:	18 20 00 00 	l.movhi r1,0x0
     208:	a8 21 4a 14 	l.ori r1,r1,0x4a14
     20c:	84 21 00 00 	l.lwz r1,0(r1)
     210:	9c 21 ff 00 	l.addi r1,r1,-256
     214:	d4 01 18 0c 	l.sw 12(r1),r3
     218:	84 60 00 04 	l.lwz r3,4(r0)
     21c:	d4 01 18 04 	l.sw 4(r1),r3
     220:	d4 01 20 10 	l.sw 16(r1),r4
     224:	b4 60 00 10 	l.mfspr r3,r0,0x10
     228:	00 00 0b 03 	l.j 2e34 <_or1k_exception_handler>
     22c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
     300:	d4 00 08 04 	l.sw 4(r0),r1
     304:	18 20 00 00 	l.movhi r1,0x0
     308:	a8 21 4a 14 	l.ori r1,r1,0x4a14
     30c:	84 21 00 00 	l.lwz r1,0(r1)
     310:	9c 21 ff 00 	l.addi r1,r1,-256
     314:	d4 01 18 0c 	l.sw 12(r1),r3
     318:	84 60 00 04 	l.lwz r3,4(r0)
     31c:	d4 01 18 04 	l.sw 4(r1),r3
     320:	d4 01 20 10 	l.sw 16(r1),r4
     324:	b4 60 00 10 	l.mfspr r3,r0,0x10
     328:	00 00 0a c3 	l.j 2e34 <_or1k_exception_handler>
     32c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
     400:	d4 00 08 04 	l.sw 4(r0),r1
     404:	18 20 00 00 	l.movhi r1,0x0
     408:	a8 21 4a 14 	l.ori r1,r1,0x4a14
     40c:	84 21 00 00 	l.lwz r1,0(r1)
     410:	9c 21 ff 00 	l.addi r1,r1,-256
     414:	d4 01 18 0c 	l.sw 12(r1),r3
     418:	84 60 00 04 	l.lwz r3,4(r0)
     41c:	d4 01 18 04 	l.sw 4(r1),r3
     420:	d4 01 20 10 	l.sw 16(r1),r4
     424:	b4 60 00 10 	l.mfspr r3,r0,0x10
     428:	00 00 0a 83 	l.j 2e34 <_or1k_exception_handler>
     42c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
     500:	d4 00 08 04 	l.sw 4(r0),r1
     504:	18 20 00 00 	l.movhi r1,0x0
     508:	a8 21 4a 14 	l.ori r1,r1,0x4a14
     50c:	84 21 00 00 	l.lwz r1,0(r1)
     510:	9c 21 ff 00 	l.addi r1,r1,-256
     514:	d4 01 18 0c 	l.sw 12(r1),r3
     518:	84 60 00 04 	l.lwz r3,4(r0)
     51c:	d4 01 18 04 	l.sw 4(r1),r3
     520:	d4 01 20 10 	l.sw 16(r1),r4
     524:	b4 60 00 10 	l.mfspr r3,r0,0x10
     528:	00 00 0a 43 	l.j 2e34 <_or1k_exception_handler>
     52c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
     600:	d4 00 08 04 	l.sw 4(r0),r1
     604:	18 20 00 00 	l.movhi r1,0x0
     608:	a8 21 4a 14 	l.ori r1,r1,0x4a14
     60c:	84 21 00 00 	l.lwz r1,0(r1)
     610:	9c 21 ff 00 	l.addi r1,r1,-256
     614:	d4 01 18 0c 	l.sw 12(r1),r3
     618:	84 60 00 04 	l.lwz r3,4(r0)
     61c:	d4 01 18 04 	l.sw 4(r1),r3
     620:	d4 01 20 10 	l.sw 16(r1),r4
     624:	b4 60 00 10 	l.mfspr r3,r0,0x10
     628:	00 00 0a 03 	l.j 2e34 <_or1k_exception_handler>
     62c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
     700:	d4 00 08 04 	l.sw 4(r0),r1
     704:	18 20 00 00 	l.movhi r1,0x0
     708:	a8 21 4a 14 	l.ori r1,r1,0x4a14
     70c:	84 21 00 00 	l.lwz r1,0(r1)
     710:	9c 21 ff 00 	l.addi r1,r1,-256
     714:	d4 01 18 0c 	l.sw 12(r1),r3
     718:	84 60 00 04 	l.lwz r3,4(r0)
     71c:	d4 01 18 04 	l.sw 4(r1),r3
     720:	d4 01 20 10 	l.sw 16(r1),r4
     724:	b4 60 00 10 	l.mfspr r3,r0,0x10
     728:	00 00 09 c3 	l.j 2e34 <_or1k_exception_handler>
     72c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
     800:	d4 00 08 04 	l.sw 4(r0),r1
     804:	18 20 00 00 	l.movhi r1,0x0
     808:	a8 21 4a 14 	l.ori r1,r1,0x4a14
     80c:	84 21 00 00 	l.lwz r1,0(r1)
     810:	9c 21 ff 00 	l.addi r1,r1,-256
     814:	d4 01 18 0c 	l.sw 12(r1),r3
     818:	84 60 00 04 	l.lwz r3,4(r0)
     81c:	d4 01 18 04 	l.sw 4(r1),r3
     820:	d4 01 20 10 	l.sw 16(r1),r4
     824:	b4 60 00 10 	l.mfspr r3,r0,0x10
     828:	00 00 09 83 	l.j 2e34 <_or1k_exception_handler>
     82c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
     900:	d4 00 08 04 	l.sw 4(r0),r1
     904:	18 20 00 00 	l.movhi r1,0x0
     908:	a8 21 4a 14 	l.ori r1,r1,0x4a14
     90c:	84 21 00 00 	l.lwz r1,0(r1)
     910:	9c 21 ff 00 	l.addi r1,r1,-256
     914:	d4 01 18 0c 	l.sw 12(r1),r3
     918:	84 60 00 04 	l.lwz r3,4(r0)
     91c:	d4 01 18 04 	l.sw 4(r1),r3
     920:	d4 01 20 10 	l.sw 16(r1),r4
     924:	b4 60 00 10 	l.mfspr r3,r0,0x10
     928:	00 00 09 43 	l.j 2e34 <_or1k_exception_handler>
     92c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
     a00:	d4 00 08 04 	l.sw 4(r0),r1
     a04:	18 20 00 00 	l.movhi r1,0x0
     a08:	a8 21 4a 14 	l.ori r1,r1,0x4a14
     a0c:	84 21 00 00 	l.lwz r1,0(r1)
     a10:	9c 21 ff 00 	l.addi r1,r1,-256
     a14:	d4 01 18 0c 	l.sw 12(r1),r3
     a18:	84 60 00 04 	l.lwz r3,4(r0)
     a1c:	d4 01 18 04 	l.sw 4(r1),r3
     a20:	d4 01 20 10 	l.sw 16(r1),r4
     a24:	b4 60 00 10 	l.mfspr r3,r0,0x10
     a28:	00 00 09 03 	l.j 2e34 <_or1k_exception_handler>
     a2c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
     b00:	d4 00 08 04 	l.sw 4(r0),r1
     b04:	18 20 00 00 	l.movhi r1,0x0
     b08:	a8 21 4a 14 	l.ori r1,r1,0x4a14
     b0c:	84 21 00 00 	l.lwz r1,0(r1)
     b10:	9c 21 ff 00 	l.addi r1,r1,-256
     b14:	d4 01 18 0c 	l.sw 12(r1),r3
     b18:	84 60 00 04 	l.lwz r3,4(r0)
     b1c:	d4 01 18 04 	l.sw 4(r1),r3
     b20:	d4 01 20 10 	l.sw 16(r1),r4
     b24:	b4 60 00 10 	l.mfspr r3,r0,0x10
     b28:	00 00 08 c3 	l.j 2e34 <_or1k_exception_handler>
     b2c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
     c00:	d4 00 08 04 	l.sw 4(r0),r1
     c04:	18 20 00 00 	l.movhi r1,0x0
     c08:	a8 21 4a 14 	l.ori r1,r1,0x4a14
     c0c:	84 21 00 00 	l.lwz r1,0(r1)
     c10:	9c 21 ff 00 	l.addi r1,r1,-256
     c14:	d4 01 18 0c 	l.sw 12(r1),r3
     c18:	84 60 00 04 	l.lwz r3,4(r0)
     c1c:	d4 01 18 04 	l.sw 4(r1),r3
     c20:	d4 01 20 10 	l.sw 16(r1),r4
     c24:	b4 60 00 10 	l.mfspr r3,r0,0x10
     c28:	00 00 08 83 	l.j 2e34 <_or1k_exception_handler>
     c2c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
     d00:	d4 00 08 04 	l.sw 4(r0),r1
     d04:	18 20 00 00 	l.movhi r1,0x0
     d08:	a8 21 4a 14 	l.ori r1,r1,0x4a14
     d0c:	84 21 00 00 	l.lwz r1,0(r1)
     d10:	9c 21 ff 00 	l.addi r1,r1,-256
     d14:	d4 01 18 0c 	l.sw 12(r1),r3
     d18:	84 60 00 04 	l.lwz r3,4(r0)
     d1c:	d4 01 18 04 	l.sw 4(r1),r3
     d20:	d4 01 20 10 	l.sw 16(r1),r4
     d24:	b4 60 00 10 	l.mfspr r3,r0,0x10
     d28:	00 00 08 43 	l.j 2e34 <_or1k_exception_handler>
     d2c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
     e00:	d4 00 08 04 	l.sw 4(r0),r1
     e04:	18 20 00 00 	l.movhi r1,0x0
     e08:	a8 21 4a 14 	l.ori r1,r1,0x4a14
     e0c:	84 21 00 00 	l.lwz r1,0(r1)
     e10:	9c 21 ff 00 	l.addi r1,r1,-256
     e14:	d4 01 18 0c 	l.sw 12(r1),r3
     e18:	84 60 00 04 	l.lwz r3,4(r0)
     e1c:	d4 01 18 04 	l.sw 4(r1),r3
     e20:	d4 01 20 10 	l.sw 16(r1),r4
     e24:	b4 60 00 10 	l.mfspr r3,r0,0x10
     e28:	00 00 08 03 	l.j 2e34 <_or1k_exception_handler>
     e2c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
     f00:	d4 00 08 04 	l.sw 4(r0),r1
     f04:	18 20 00 00 	l.movhi r1,0x0
     f08:	a8 21 4a 14 	l.ori r1,r1,0x4a14
     f0c:	84 21 00 00 	l.lwz r1,0(r1)
     f10:	9c 21 ff 00 	l.addi r1,r1,-256
     f14:	d4 01 18 0c 	l.sw 12(r1),r3
     f18:	84 60 00 04 	l.lwz r3,4(r0)
     f1c:	d4 01 18 04 	l.sw 4(r1),r3
     f20:	d4 01 20 10 	l.sw 16(r1),r4
     f24:	b4 60 00 10 	l.mfspr r3,r0,0x10
     f28:	00 00 07 c3 	l.j 2e34 <_or1k_exception_handler>
     f2c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1000:	d4 00 08 04 	l.sw 4(r0),r1
    1004:	18 20 00 00 	l.movhi r1,0x0
    1008:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    100c:	84 21 00 00 	l.lwz r1,0(r1)
    1010:	9c 21 ff 00 	l.addi r1,r1,-256
    1014:	d4 01 18 0c 	l.sw 12(r1),r3
    1018:	84 60 00 04 	l.lwz r3,4(r0)
    101c:	d4 01 18 04 	l.sw 4(r1),r3
    1020:	d4 01 20 10 	l.sw 16(r1),r4
    1024:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1028:	00 00 07 83 	l.j 2e34 <_or1k_exception_handler>
    102c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1100:	d4 00 08 04 	l.sw 4(r0),r1
    1104:	18 20 00 00 	l.movhi r1,0x0
    1108:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    110c:	84 21 00 00 	l.lwz r1,0(r1)
    1110:	9c 21 ff 00 	l.addi r1,r1,-256
    1114:	d4 01 18 0c 	l.sw 12(r1),r3
    1118:	84 60 00 04 	l.lwz r3,4(r0)
    111c:	d4 01 18 04 	l.sw 4(r1),r3
    1120:	d4 01 20 10 	l.sw 16(r1),r4
    1124:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1128:	00 00 07 43 	l.j 2e34 <_or1k_exception_handler>
    112c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1200:	d4 00 08 04 	l.sw 4(r0),r1
    1204:	18 20 00 00 	l.movhi r1,0x0
    1208:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    120c:	84 21 00 00 	l.lwz r1,0(r1)
    1210:	9c 21 ff 00 	l.addi r1,r1,-256
    1214:	d4 01 18 0c 	l.sw 12(r1),r3
    1218:	84 60 00 04 	l.lwz r3,4(r0)
    121c:	d4 01 18 04 	l.sw 4(r1),r3
    1220:	d4 01 20 10 	l.sw 16(r1),r4
    1224:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1228:	00 00 07 03 	l.j 2e34 <_or1k_exception_handler>
    122c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1300:	d4 00 08 04 	l.sw 4(r0),r1
    1304:	18 20 00 00 	l.movhi r1,0x0
    1308:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    130c:	84 21 00 00 	l.lwz r1,0(r1)
    1310:	9c 21 ff 00 	l.addi r1,r1,-256
    1314:	d4 01 18 0c 	l.sw 12(r1),r3
    1318:	84 60 00 04 	l.lwz r3,4(r0)
    131c:	d4 01 18 04 	l.sw 4(r1),r3
    1320:	d4 01 20 10 	l.sw 16(r1),r4
    1324:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1328:	00 00 06 c3 	l.j 2e34 <_or1k_exception_handler>
    132c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1400:	d4 00 08 04 	l.sw 4(r0),r1
    1404:	18 20 00 00 	l.movhi r1,0x0
    1408:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    140c:	84 21 00 00 	l.lwz r1,0(r1)
    1410:	9c 21 ff 00 	l.addi r1,r1,-256
    1414:	d4 01 18 0c 	l.sw 12(r1),r3
    1418:	84 60 00 04 	l.lwz r3,4(r0)
    141c:	d4 01 18 04 	l.sw 4(r1),r3
    1420:	d4 01 20 10 	l.sw 16(r1),r4
    1424:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1428:	00 00 06 83 	l.j 2e34 <_or1k_exception_handler>
    142c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1500:	d4 00 08 04 	l.sw 4(r0),r1
    1504:	18 20 00 00 	l.movhi r1,0x0
    1508:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    150c:	84 21 00 00 	l.lwz r1,0(r1)
    1510:	9c 21 ff 00 	l.addi r1,r1,-256
    1514:	d4 01 18 0c 	l.sw 12(r1),r3
    1518:	84 60 00 04 	l.lwz r3,4(r0)
    151c:	d4 01 18 04 	l.sw 4(r1),r3
    1520:	d4 01 20 10 	l.sw 16(r1),r4
    1524:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1528:	00 00 06 43 	l.j 2e34 <_or1k_exception_handler>
    152c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1600:	d4 00 08 04 	l.sw 4(r0),r1
    1604:	18 20 00 00 	l.movhi r1,0x0
    1608:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    160c:	84 21 00 00 	l.lwz r1,0(r1)
    1610:	9c 21 ff 00 	l.addi r1,r1,-256
    1614:	d4 01 18 0c 	l.sw 12(r1),r3
    1618:	84 60 00 04 	l.lwz r3,4(r0)
    161c:	d4 01 18 04 	l.sw 4(r1),r3
    1620:	d4 01 20 10 	l.sw 16(r1),r4
    1624:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1628:	00 00 06 03 	l.j 2e34 <_or1k_exception_handler>
    162c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1700:	d4 00 08 04 	l.sw 4(r0),r1
    1704:	18 20 00 00 	l.movhi r1,0x0
    1708:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    170c:	84 21 00 00 	l.lwz r1,0(r1)
    1710:	9c 21 ff 00 	l.addi r1,r1,-256
    1714:	d4 01 18 0c 	l.sw 12(r1),r3
    1718:	84 60 00 04 	l.lwz r3,4(r0)
    171c:	d4 01 18 04 	l.sw 4(r1),r3
    1720:	d4 01 20 10 	l.sw 16(r1),r4
    1724:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1728:	00 00 05 c3 	l.j 2e34 <_or1k_exception_handler>
    172c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1800:	d4 00 08 04 	l.sw 4(r0),r1
    1804:	18 20 00 00 	l.movhi r1,0x0
    1808:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    180c:	84 21 00 00 	l.lwz r1,0(r1)
    1810:	9c 21 ff 00 	l.addi r1,r1,-256
    1814:	d4 01 18 0c 	l.sw 12(r1),r3
    1818:	84 60 00 04 	l.lwz r3,4(r0)
    181c:	d4 01 18 04 	l.sw 4(r1),r3
    1820:	d4 01 20 10 	l.sw 16(r1),r4
    1824:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1828:	00 00 05 83 	l.j 2e34 <_or1k_exception_handler>
    182c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1900:	d4 00 08 04 	l.sw 4(r0),r1
    1904:	18 20 00 00 	l.movhi r1,0x0
    1908:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    190c:	84 21 00 00 	l.lwz r1,0(r1)
    1910:	9c 21 ff 00 	l.addi r1,r1,-256
    1914:	d4 01 18 0c 	l.sw 12(r1),r3
    1918:	84 60 00 04 	l.lwz r3,4(r0)
    191c:	d4 01 18 04 	l.sw 4(r1),r3
    1920:	d4 01 20 10 	l.sw 16(r1),r4
    1924:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1928:	00 00 05 43 	l.j 2e34 <_or1k_exception_handler>
    192c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1a00:	d4 00 08 04 	l.sw 4(r0),r1
    1a04:	18 20 00 00 	l.movhi r1,0x0
    1a08:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    1a0c:	84 21 00 00 	l.lwz r1,0(r1)
    1a10:	9c 21 ff 00 	l.addi r1,r1,-256
    1a14:	d4 01 18 0c 	l.sw 12(r1),r3
    1a18:	84 60 00 04 	l.lwz r3,4(r0)
    1a1c:	d4 01 18 04 	l.sw 4(r1),r3
    1a20:	d4 01 20 10 	l.sw 16(r1),r4
    1a24:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1a28:	00 00 05 03 	l.j 2e34 <_or1k_exception_handler>
    1a2c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1b00:	d4 00 08 04 	l.sw 4(r0),r1
    1b04:	18 20 00 00 	l.movhi r1,0x0
    1b08:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    1b0c:	84 21 00 00 	l.lwz r1,0(r1)
    1b10:	9c 21 ff 00 	l.addi r1,r1,-256
    1b14:	d4 01 18 0c 	l.sw 12(r1),r3
    1b18:	84 60 00 04 	l.lwz r3,4(r0)
    1b1c:	d4 01 18 04 	l.sw 4(r1),r3
    1b20:	d4 01 20 10 	l.sw 16(r1),r4
    1b24:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1b28:	00 00 04 c3 	l.j 2e34 <_or1k_exception_handler>
    1b2c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1c00:	d4 00 08 04 	l.sw 4(r0),r1
    1c04:	18 20 00 00 	l.movhi r1,0x0
    1c08:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    1c0c:	84 21 00 00 	l.lwz r1,0(r1)
    1c10:	9c 21 ff 00 	l.addi r1,r1,-256
    1c14:	d4 01 18 0c 	l.sw 12(r1),r3
    1c18:	84 60 00 04 	l.lwz r3,4(r0)
    1c1c:	d4 01 18 04 	l.sw 4(r1),r3
    1c20:	d4 01 20 10 	l.sw 16(r1),r4
    1c24:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1c28:	00 00 04 83 	l.j 2e34 <_or1k_exception_handler>
    1c2c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1d00:	d4 00 08 04 	l.sw 4(r0),r1
    1d04:	18 20 00 00 	l.movhi r1,0x0
    1d08:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    1d0c:	84 21 00 00 	l.lwz r1,0(r1)
    1d10:	9c 21 ff 00 	l.addi r1,r1,-256
    1d14:	d4 01 18 0c 	l.sw 12(r1),r3
    1d18:	84 60 00 04 	l.lwz r3,4(r0)
    1d1c:	d4 01 18 04 	l.sw 4(r1),r3
    1d20:	d4 01 20 10 	l.sw 16(r1),r4
    1d24:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1d28:	00 00 04 43 	l.j 2e34 <_or1k_exception_handler>
    1d2c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1e00:	d4 00 08 04 	l.sw 4(r0),r1
    1e04:	18 20 00 00 	l.movhi r1,0x0
    1e08:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    1e0c:	84 21 00 00 	l.lwz r1,0(r1)
    1e10:	9c 21 ff 00 	l.addi r1,r1,-256
    1e14:	d4 01 18 0c 	l.sw 12(r1),r3
    1e18:	84 60 00 04 	l.lwz r3,4(r0)
    1e1c:	d4 01 18 04 	l.sw 4(r1),r3
    1e20:	d4 01 20 10 	l.sw 16(r1),r4
    1e24:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1e28:	00 00 04 03 	l.j 2e34 <_or1k_exception_handler>
    1e2c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1f00:	d4 00 08 04 	l.sw 4(r0),r1
    1f04:	18 20 00 00 	l.movhi r1,0x0
    1f08:	a8 21 4a 14 	l.ori r1,r1,0x4a14
    1f0c:	84 21 00 00 	l.lwz r1,0(r1)
    1f10:	9c 21 ff 00 	l.addi r1,r1,-256
    1f14:	d4 01 18 0c 	l.sw 12(r1),r3
    1f18:	84 60 00 04 	l.lwz r3,4(r0)
    1f1c:	d4 01 18 04 	l.sw 4(r1),r3
    1f20:	d4 01 20 10 	l.sw 16(r1),r4
    1f24:	b4 60 00 10 	l.mfspr r3,r0,0x10
    1f28:	00 00 03 c3 	l.j 2e34 <_or1k_exception_handler>
    1f2c:	b4 80 00 20 	l.mfspr r4,r0,0x20
	...
    1ffc:	15 00 00 00 	l.nop 0x0

Disassemblamento della sezione .init:

00002000 <_init-0x4>:
    2000:	15 00 00 00 	l.nop 0x0

00002004 <_init>:
    2004:	9c 21 ff fc 	l.addi r1,r1,-4
    2008:	d4 01 48 00 	l.sw 0(r1),r9
    200c:	04 00 00 bc 	l.jal 22fc <frame_dummy>
    2010:	15 00 00 00 	l.nop 0x0
    2014:	04 00 06 76 	l.jal 39ec <__do_global_ctors_aux>
    2018:	15 00 00 00 	l.nop 0x0
    201c:	85 21 00 00 	l.lwz r9,0(r1)
    2020:	44 00 48 00 	l.jr r9
    2024:	9c 21 00 04 	l.addi r1,r1,4

Disassemblamento della sezione .text:

00002028 <_or1k_start-0x8>:
    2028:	44 00 48 00 	l.jr r9
    202c:	15 00 00 00 	l.nop 0x0

00002030 <_or1k_start>:
    2030:	04 00 03 19 	l.jal 2c94 <_or1k_cache_init>
    2034:	15 00 00 00 	l.nop 0x0
    2038:	04 00 05 c6 	l.jal 3750 <_or1k_board_init_early>
    203c:	15 00 00 00 	l.nop 0x0
    2040:	18 60 00 00 	l.movhi r3,0x0
    2044:	a8 63 48 a0 	l.ori r3,r3,0x48a0
    2048:	18 80 00 00 	l.movhi r4,0x0
    204c:	a8 84 4a 9c 	l.ori r4,r4,0x4a9c
    2050:	d4 03 00 00 	l.sw 0(r3),r0
    2054:	e4 83 20 00 	l.sfltu r3,r4
    2058:	13 ff ff fe 	l.bf 2050 <_or1k_start+0x20>
    205c:	9c 63 00 04 	l.addi r3,r3,4
    2060:	18 20 00 00 	l.movhi r1,0x0
    2064:	a8 21 37 2c 	l.ori r1,r1,0x372c
    2068:	84 21 00 00 	l.lwz r1,0(r1)
    206c:	18 40 00 00 	l.movhi r2,0x0
    2070:	a8 42 37 30 	l.ori r2,r2,0x3730
    2074:	84 42 00 00 	l.lwz r2,0(r2)
    2078:	e0 21 10 00 	l.add r1,r1,r2
    207c:	18 60 00 00 	l.movhi r3,0x0
    2080:	a8 63 4a 14 	l.ori r3,r3,0x4a14
    2084:	d4 03 08 00 	l.sw 0(r3),r1
    2088:	18 60 00 00 	l.movhi r3,0x0
    208c:	a8 63 40 44 	l.ori r3,r3,0x4044
    2090:	84 63 00 00 	l.lwz r3,0(r3)
    2094:	e0 81 18 02 	l.sub r4,r1,r3
    2098:	18 a0 00 00 	l.movhi r5,0x0
    209c:	a8 a5 4a 1c 	l.ori r5,r5,0x4a1c
    20a0:	d4 05 20 00 	l.sw 0(r5),r4
    20a4:	e0 20 20 04 	l.or r1,r0,r4
    20a8:	e0 41 08 04 	l.or r2,r1,r1
    20ac:	18 60 00 00 	l.movhi r3,0x0
    20b0:	a8 63 4a 18 	l.ori r3,r3,0x4a18
    20b4:	d4 03 08 00 	l.sw 0(r3),r1
    20b8:	18 60 00 00 	l.movhi r3,0x0
    20bc:	a8 63 40 40 	l.ori r3,r3,0x4040
    20c0:	84 63 00 00 	l.lwz r3,0(r3)
    20c4:	e0 81 18 02 	l.sub r4,r1,r3
    20c8:	18 a0 00 00 	l.movhi r5,0x0
    20cc:	a8 a5 4a 20 	l.ori r5,r5,0x4a20
    20d0:	d4 05 20 00 	l.sw 0(r5),r4
    20d4:	04 00 04 86 	l.jal 32ec <_or1k_init>
    20d8:	15 00 00 00 	l.nop 0x0
    20dc:	04 00 04 1c 	l.jal 314c <_or1k_libc_impure_init>
    20e0:	15 00 00 00 	l.nop 0x0
    20e4:	07 ff ff c8 	l.jal 2004 <_init>
    20e8:	15 00 00 00 	l.nop 0x0
    20ec:	18 60 00 00 	l.movhi r3,0x0
    20f0:	04 00 00 d0 	l.jal 2430 <atexit>
    20f4:	a8 63 3a 5c 	l.ori r3,r3,0x3a5c
    20f8:	18 80 00 00 	l.movhi r4,0x0
    20fc:	a8 84 37 38 	l.ori r4,r4,0x3738
    2100:	84 84 00 00 	l.lwz r4,0(r4)
    2104:	e4 24 00 00 	l.sfne r4,r0
    2108:	0c 00 00 04 	l.bnf 2118 <_or1k_start+0xe8>
    210c:	e0 60 00 04 	l.or r3,r0,r0
    2110:	04 00 02 74 	l.jal 2ae0 <_or1k_uart_init>
    2114:	15 00 00 00 	l.nop 0x0
    2118:	04 00 05 90 	l.jal 3758 <_or1k_board_init>
    211c:	15 00 00 00 	l.nop 0x0
    2120:	e0 60 00 04 	l.or r3,r0,r0
    2124:	e0 80 00 04 	l.or r4,r0,r0
    2128:	04 00 00 9c 	l.jal 2398 <main>
    212c:	e0 a0 00 04 	l.or r5,r0,r0
    2130:	04 00 00 cc 	l.jal 2460 <exit>
    2134:	9c 6b 00 00 	l.addi r3,r11,0
    2138:	00 00 00 00 	l.j 2138 <_or1k_start+0x108>
    213c:	15 00 00 00 	l.nop 0x0

00002140 <deregister_tm_clones>:
    2140:	d7 e1 17 f8 	l.sw -8(r1),r2
    2144:	18 60 00 00 	l.movhi r3,0x0
    2148:	18 40 00 00 	l.movhi r2,0x0
    214c:	a8 63 48 a3 	l.ori r3,r3,0x48a3
    2150:	a8 42 48 a0 	l.ori r2,r2,0x48a0
    2154:	d7 e1 4f fc 	l.sw -4(r1),r9
    2158:	e0 63 10 02 	l.sub r3,r3,r2
    215c:	d7 e1 0f f4 	l.sw -12(r1),r1
    2160:	bc a3 00 06 	l.sfleui r3,6
    2164:	10 00 00 09 	l.bf 2188 <deregister_tm_clones+0x48>
    2168:	9c 21 ff f4 	l.addi r1,r1,-12
    216c:	18 80 00 00 	l.movhi r4,0x0
    2170:	a8 84 00 00 	l.ori r4,r4,0x0
    2174:	bc 04 00 00 	l.sfeqi r4,0
    2178:	10 00 00 04 	l.bf 2188 <deregister_tm_clones+0x48>
    217c:	15 00 00 00 	l.nop 0x0
    2180:	48 00 20 00 	l.jalr r4
    2184:	a8 62 00 00 	l.ori r3,r2,0x0
    2188:	9c 21 00 0c 	l.addi r1,r1,12
    218c:	85 21 ff fc 	l.lwz r9,-4(r1)
    2190:	84 21 ff f4 	l.lwz r1,-12(r1)
    2194:	44 00 48 00 	l.jr r9
    2198:	84 41 ff f8 	l.lwz r2,-8(r1)

0000219c <register_tm_clones>:
    219c:	d7 e1 17 f8 	l.sw -8(r1),r2
    21a0:	18 60 00 00 	l.movhi r3,0x0
    21a4:	18 40 00 00 	l.movhi r2,0x0
    21a8:	a8 63 48 a0 	l.ori r3,r3,0x48a0
    21ac:	a8 42 48 a0 	l.ori r2,r2,0x48a0
    21b0:	d7 e1 4f fc 	l.sw -4(r1),r9
    21b4:	e0 63 10 02 	l.sub r3,r3,r2
    21b8:	d7 e1 0f f4 	l.sw -12(r1),r1
    21bc:	b8 63 00 82 	l.srai r3,r3,0x2
    21c0:	b8 83 00 5f 	l.srli r4,r3,0x1f
    21c4:	e0 84 18 00 	l.add r4,r4,r3
    21c8:	b8 84 00 81 	l.srai r4,r4,0x1
    21cc:	bc 04 00 00 	l.sfeqi r4,0
    21d0:	10 00 00 09 	l.bf 21f4 <register_tm_clones+0x58>
    21d4:	9c 21 ff f4 	l.addi r1,r1,-12
    21d8:	18 a0 00 00 	l.movhi r5,0x0
    21dc:	a8 a5 00 00 	l.ori r5,r5,0x0
    21e0:	bc 05 00 00 	l.sfeqi r5,0
    21e4:	10 00 00 04 	l.bf 21f4 <register_tm_clones+0x58>
    21e8:	15 00 00 00 	l.nop 0x0
    21ec:	48 00 28 00 	l.jalr r5
    21f0:	a8 62 00 00 	l.ori r3,r2,0x0
    21f4:	9c 21 00 0c 	l.addi r1,r1,12
    21f8:	85 21 ff fc 	l.lwz r9,-4(r1)
    21fc:	84 21 ff f4 	l.lwz r1,-12(r1)
    2200:	44 00 48 00 	l.jr r9
    2204:	84 41 ff f8 	l.lwz r2,-8(r1)

00002208 <__do_global_dtors_aux>:
    2208:	d7 e1 97 f8 	l.sw -8(r1),r18
    220c:	1a 40 00 00 	l.movhi r18,0x0
    2210:	d7 e1 17 f0 	l.sw -16(r1),r2
    2214:	aa 52 48 a0 	l.ori r18,r18,0x48a0
    2218:	d7 e1 4f fc 	l.sw -4(r1),r9
    221c:	8c 52 00 00 	l.lbz r2,0(r18)
    2220:	d7 e1 0f ec 	l.sw -20(r1),r1
    2224:	d7 e1 77 f4 	l.sw -12(r1),r14
    2228:	bc 22 00 00 	l.sfnei r2,0
    222c:	10 00 00 26 	l.bf 22c4 <__do_global_dtors_aux+0xbc>
    2230:	9c 21 ff ec 	l.addi r1,r1,-20
    2234:	19 c0 00 00 	l.movhi r14,0x0
    2238:	18 80 00 00 	l.movhi r4,0x0
    223c:	a9 ce 40 38 	l.ori r14,r14,0x4038
    2240:	a8 84 40 34 	l.ori r4,r4,0x4034
    2244:	18 40 00 00 	l.movhi r2,0x0
    2248:	e1 ce 20 02 	l.sub r14,r14,r4
    224c:	a8 42 48 a4 	l.ori r2,r2,0x48a4
    2250:	b9 ce 00 82 	l.srai r14,r14,0x2
    2254:	84 62 00 00 	l.lwz r3,0(r2)
    2258:	9d ce ff ff 	l.addi r14,r14,-1
    225c:	e4 83 70 00 	l.sfltu r3,r14
    2260:	0c 00 00 0e 	l.bnf 2298 <__do_global_dtors_aux+0x90>
    2264:	9c 63 00 01 	l.addi r3,r3,1
    2268:	18 a0 00 00 	l.movhi r5,0x0
    226c:	b8 83 00 02 	l.slli r4,r3,0x2
    2270:	a8 a5 40 34 	l.ori r5,r5,0x4034
    2274:	d4 02 18 00 	l.sw 0(r2),r3
    2278:	e0 64 28 00 	l.add r3,r4,r5
    227c:	84 63 00 00 	l.lwz r3,0(r3)
    2280:	48 00 18 00 	l.jalr r3
    2284:	15 00 00 00 	l.nop 0x0
    2288:	84 62 00 00 	l.lwz r3,0(r2)
    228c:	e4 83 70 00 	l.sfltu r3,r14
    2290:	13 ff ff f6 	l.bf 2268 <__do_global_dtors_aux+0x60>
    2294:	9c 63 00 01 	l.addi r3,r3,1
    2298:	07 ff ff aa 	l.jal 2140 <deregister_tm_clones>
    229c:	18 40 00 00 	l.movhi r2,0x0
    22a0:	a8 42 00 00 	l.ori r2,r2,0x0
    22a4:	bc 22 00 00 	l.sfnei r2,0
    22a8:	0c 00 00 06 	l.bnf 22c0 <__do_global_dtors_aux+0xb8>
    22ac:	9c 40 00 01 	l.addi r2,r0,1
    22b0:	18 60 00 00 	l.movhi r3,0x0
    22b4:	07 ff f7 53 	l.jal 0 <_or1k_reset-0x100>
    22b8:	a8 63 40 00 	l.ori r3,r3,0x4000
    22bc:	9c 40 00 01 	l.addi r2,r0,1
    22c0:	d8 12 10 00 	l.sb 0(r18),r2
    22c4:	9c 21 00 14 	l.addi r1,r1,20
    22c8:	85 21 ff fc 	l.lwz r9,-4(r1)
    22cc:	84 21 ff ec 	l.lwz r1,-20(r1)
    22d0:	84 41 ff f0 	l.lwz r2,-16(r1)
    22d4:	85 c1 ff f4 	l.lwz r14,-12(r1)
    22d8:	44 00 48 00 	l.jr r9
    22dc:	86 41 ff f8 	l.lwz r18,-8(r1)

000022e0 <call___do_global_dtors_aux>:
    22e0:	d7 e1 4f fc 	l.sw -4(r1),r9
    22e4:	d7 e1 0f f8 	l.sw -8(r1),r1
    22e8:	9c 21 ff f8 	l.addi r1,r1,-8
    22ec:	9c 21 00 08 	l.addi r1,r1,8
    22f0:	85 21 ff fc 	l.lwz r9,-4(r1)
    22f4:	44 00 48 00 	l.jr r9
    22f8:	84 21 ff f8 	l.lwz r1,-8(r1)

000022fc <frame_dummy>:
    22fc:	18 60 00 00 	l.movhi r3,0x0
    2300:	d7 e1 4f fc 	l.sw -4(r1),r9
    2304:	a8 63 00 00 	l.ori r3,r3,0x0
    2308:	d7 e1 0f f8 	l.sw -8(r1),r1
    230c:	bc 03 00 00 	l.sfeqi r3,0
    2310:	10 00 00 07 	l.bf 232c <frame_dummy+0x30>
    2314:	9c 21 ff f8 	l.addi r1,r1,-8
    2318:	18 60 00 00 	l.movhi r3,0x0
    231c:	18 80 00 00 	l.movhi r4,0x0
    2320:	a8 63 40 00 	l.ori r3,r3,0x4000
    2324:	07 ff f7 37 	l.jal 0 <_or1k_reset-0x100>
    2328:	a8 84 48 a8 	l.ori r4,r4,0x48a8
    232c:	18 60 00 00 	l.movhi r3,0x0
    2330:	a8 63 40 3c 	l.ori r3,r3,0x403c
    2334:	84 83 00 00 	l.lwz r4,0(r3)
    2338:	bc 04 00 00 	l.sfeqi r4,0
    233c:	0c 00 00 08 	l.bnf 235c <frame_dummy+0x60>
    2340:	18 80 00 00 	l.movhi r4,0x0
    2344:	07 ff ff 96 	l.jal 219c <register_tm_clones>
    2348:	15 00 00 00 	l.nop 0x0
    234c:	9c 21 00 08 	l.addi r1,r1,8
    2350:	85 21 ff fc 	l.lwz r9,-4(r1)
    2354:	44 00 48 00 	l.jr r9
    2358:	84 21 ff f8 	l.lwz r1,-8(r1)
    235c:	a8 84 00 00 	l.ori r4,r4,0x0
    2360:	bc 04 00 00 	l.sfeqi r4,0
    2364:	13 ff ff f8 	l.bf 2344 <frame_dummy+0x48>
    2368:	15 00 00 00 	l.nop 0x0
    236c:	48 00 20 00 	l.jalr r4
    2370:	15 00 00 00 	l.nop 0x0
    2374:	03 ff ff f4 	l.j 2344 <frame_dummy+0x48>
    2378:	15 00 00 00 	l.nop 0x0

0000237c <call_frame_dummy>:
    237c:	d7 e1 4f fc 	l.sw -4(r1),r9
    2380:	d7 e1 0f f8 	l.sw -8(r1),r1
    2384:	9c 21 ff f8 	l.addi r1,r1,-8
    2388:	9c 21 00 08 	l.addi r1,r1,8
    238c:	85 21 ff fc 	l.lwz r9,-4(r1)
    2390:	44 00 48 00 	l.jr r9
    2394:	84 21 ff f8 	l.lwz r1,-8(r1)

00002398 <main>:
    2398:	15 00 00 00 	l.nop 0x0
    239c:	15 00 00 00 	l.nop 0x0
    23a0:	15 00 00 00 	l.nop 0x0
    23a4:	15 00 00 00 	l.nop 0x0
    23a8:	15 00 00 00 	l.nop 0x0
    23ac:	84 40 00 00 	l.lwz r2,0(r0)
    23b0:	84 60 00 00 	l.lwz r3,0(r0)
    23b4:	84 80 00 00 	l.lwz r4,0(r0)
    23b8:	84 a0 00 00 	l.lwz r5,0(r0)
    23bc:	84 40 00 00 	l.lwz r2,0(r0)
    23c0:	84 60 00 00 	l.lwz r3,0(r0)
    23c4:	84 80 00 00 	l.lwz r4,0(r0)
    23c8:	84 a0 00 00 	l.lwz r5,0(r0)
    23cc:	84 40 00 00 	l.lwz r2,0(r0)
    23d0:	84 60 00 00 	l.lwz r3,0(r0)
    23d4:	84 80 00 00 	l.lwz r4,0(r0)
    23d8:	84 a0 00 00 	l.lwz r5,0(r0)
    23dc:	9c 42 00 07 	l.addi r2,r2,7
    23e0:	9c 63 00 0b 	l.addi r3,r3,11
    23e4:	9c 84 00 0d 	l.addi r4,r4,13
    23e8:	9c a5 00 11 	l.addi r5,r5,17
    23ec:	d4 00 10 10 	l.sw 16(r0),r2
    23f0:	d4 00 18 08 	l.sw 8(r0),r3
    23f4:	d4 00 20 04 	l.sw 4(r0),r4
    23f8:	d4 00 28 00 	l.sw 0(r0),r5
    23fc:	d4 00 10 10 	l.sw 16(r0),r2
    2400:	d4 00 18 08 	l.sw 8(r0),r3
    2404:	d4 00 20 04 	l.sw 4(r0),r4
    2408:	d4 00 28 00 	l.sw 0(r0),r5
    240c:	d4 00 10 10 	l.sw 16(r0),r2
    2410:	d4 00 18 08 	l.sw 8(r0),r3
    2414:	d4 00 20 04 	l.sw 4(r0),r4
    2418:	d4 00 28 00 	l.sw 0(r0),r5
    241c:	15 00 00 00 	l.nop 0x0
    2420:	15 00 00 00 	l.nop 0x0
    2424:	15 00 00 00 	l.nop 0x0
    2428:	15 00 00 00 	l.nop 0x0
    242c:	15 00 00 00 	l.nop 0x0

00002430 <atexit>:
    2430:	a8 83 00 00 	l.ori r4,r3,0x0
    2434:	9c 60 00 00 	l.addi r3,r0,0
    2438:	d7 e1 4f fc 	l.sw -4(r1),r9
    243c:	d7 e1 0f f8 	l.sw -8(r1),r1
    2440:	a8 a3 00 00 	l.ori r5,r3,0x0
    2444:	9c 21 ff f8 	l.addi r1,r1,-8
    2448:	04 00 00 18 	l.jal 24a8 <__register_exitproc>
    244c:	a8 c3 00 00 	l.ori r6,r3,0x0
    2450:	9c 21 00 08 	l.addi r1,r1,8
    2454:	85 21 ff fc 	l.lwz r9,-4(r1)
    2458:	44 00 48 00 	l.jr r9
    245c:	84 21 ff f8 	l.lwz r1,-8(r1)

00002460 <exit>:
    2460:	d7 e1 17 f8 	l.sw -8(r1),r2
    2464:	d7 e1 4f fc 	l.sw -4(r1),r9
    2468:	d7 e1 0f f4 	l.sw -12(r1),r1
    246c:	9c 80 00 00 	l.addi r4,r0,0
    2470:	9c 21 ff f4 	l.addi r1,r1,-12
    2474:	04 00 00 5d 	l.jal 25e8 <__call_exitprocs>
    2478:	a8 43 00 00 	l.ori r2,r3,0x0
    247c:	18 60 00 00 	l.movhi r3,0x0
    2480:	a8 63 3a 80 	l.ori r3,r3,0x3a80
    2484:	84 63 00 00 	l.lwz r3,0(r3)
    2488:	84 83 00 3c 	l.lwz r4,60(r3)
    248c:	bc 04 00 00 	l.sfeqi r4,0
    2490:	10 00 00 04 	l.bf 24a0 <exit+0x40>
    2494:	15 00 00 00 	l.nop 0x0
    2498:	48 00 20 00 	l.jalr r4
    249c:	15 00 00 00 	l.nop 0x0
    24a0:	04 00 00 f2 	l.jal 2868 <_exit>
    24a4:	a8 62 00 00 	l.ori r3,r2,0x0

000024a8 <__register_exitproc>:
    24a8:	d7 e1 17 e8 	l.sw -24(r1),r2
    24ac:	18 40 00 00 	l.movhi r2,0x0
    24b0:	d7 e1 77 ec 	l.sw -20(r1),r14
    24b4:	a8 42 3a 80 	l.ori r2,r2,0x3a80
    24b8:	d7 e1 97 f0 	l.sw -16(r1),r18
    24bc:	85 c2 00 00 	l.lwz r14,0(r2)
    24c0:	d7 e1 a7 f4 	l.sw -12(r1),r20
    24c4:	85 0e 01 48 	l.lwz r8,328(r14)
    24c8:	d7 e1 b7 f8 	l.sw -8(r1),r22
    24cc:	d7 e1 4f fc 	l.sw -4(r1),r9
    24d0:	d7 e1 0f e4 	l.sw -28(r1),r1
    24d4:	bc 28 00 00 	l.sfnei r8,0
    24d8:	9c 21 ff e4 	l.addi r1,r1,-28
    24dc:	aa c3 00 00 	l.ori r22,r3,0x0
    24e0:	a8 44 00 00 	l.ori r2,r4,0x0
    24e4:	aa 85 00 00 	l.ori r20,r5,0x0
    24e8:	0c 00 00 3b 	l.bnf 25d4 <__register_exitproc+0x12c>
    24ec:	aa 46 00 00 	l.ori r18,r6,0x0
    24f0:	84 e8 00 04 	l.lwz r7,4(r8)
    24f4:	bd 47 00 1f 	l.sfgtsi r7,31
    24f8:	10 00 00 14 	l.bf 2548 <__register_exitproc+0xa0>
    24fc:	18 60 00 00 	l.movhi r3,0x0
    2500:	bc 36 00 00 	l.sfnei r22,0
    2504:	10 00 00 25 	l.bf 2598 <__register_exitproc+0xf0>
    2508:	9c a7 00 01 	l.addi r5,r7,1
    250c:	9c e7 00 02 	l.addi r7,r7,2
    2510:	d4 08 28 04 	l.sw 4(r8),r5
    2514:	b8 e7 00 02 	l.slli r7,r7,0x2
    2518:	9d 60 00 00 	l.addi r11,r0,0
    251c:	e0 e8 38 00 	l.add r7,r8,r7
    2520:	d4 07 10 00 	l.sw 0(r7),r2
    2524:	9c 21 00 1c 	l.addi r1,r1,28
    2528:	85 21 ff fc 	l.lwz r9,-4(r1)
    252c:	84 21 ff e4 	l.lwz r1,-28(r1)
    2530:	84 41 ff e8 	l.lwz r2,-24(r1)
    2534:	85 c1 ff ec 	l.lwz r14,-20(r1)
    2538:	86 41 ff f0 	l.lwz r18,-16(r1)
    253c:	86 81 ff f4 	l.lwz r20,-12(r1)
    2540:	44 00 48 00 	l.jr r9
    2544:	86 c1 ff f8 	l.lwz r22,-8(r1)
    2548:	a8 63 00 00 	l.ori r3,r3,0x0
    254c:	bc 23 00 00 	l.sfnei r3,0
    2550:	0f ff ff f5 	l.bnf 2524 <__register_exitproc+0x7c>
    2554:	9d 60 ff ff 	l.addi r11,r0,-1
    2558:	07 ff f6 aa 	l.jal 0 <_or1k_reset-0x100>
    255c:	9c 60 01 90 	l.addi r3,r0,400
    2560:	bc 0b 00 00 	l.sfeqi r11,0
    2564:	10 00 00 1f 	l.bf 25e0 <__register_exitproc+0x138>
    2568:	a9 0b 00 00 	l.ori r8,r11,0x0
    256c:	84 6e 01 48 	l.lwz r3,328(r14)
    2570:	9c 80 00 00 	l.addi r4,r0,0
    2574:	d4 0b 18 00 	l.sw 0(r11),r3
    2578:	d4 0b 20 04 	l.sw 4(r11),r4
    257c:	d4 0e 59 48 	l.sw 328(r14),r11
    2580:	d4 0b 21 88 	l.sw 392(r11),r4
    2584:	d4 0b 21 8c 	l.sw 396(r11),r4
    2588:	bc 36 00 00 	l.sfnei r22,0
    258c:	9c a0 00 01 	l.addi r5,r0,1
    2590:	0f ff ff df 	l.bnf 250c <__register_exitproc+0x64>
    2594:	a8 e4 00 00 	l.ori r7,r4,0x0
    2598:	b9 67 00 02 	l.slli r11,r7,0x2
    259c:	9c 80 00 01 	l.addi r4,r0,1
    25a0:	bc 36 00 02 	l.sfnei r22,2
    25a4:	e0 68 58 00 	l.add r3,r8,r11
    25a8:	e0 84 38 08 	l.sll r4,r4,r7
    25ac:	d4 03 a0 88 	l.sw 136(r3),r20
    25b0:	84 c8 01 88 	l.lwz r6,392(r8)
    25b4:	e0 c6 20 04 	l.or r6,r6,r4
    25b8:	d4 08 31 88 	l.sw 392(r8),r6
    25bc:	13 ff ff d4 	l.bf 250c <__register_exitproc+0x64>
    25c0:	d4 03 91 08 	l.sw 264(r3),r18
    25c4:	84 68 01 8c 	l.lwz r3,396(r8)
    25c8:	e0 83 20 04 	l.or r4,r3,r4
    25cc:	03 ff ff d0 	l.j 250c <__register_exitproc+0x64>
    25d0:	d4 08 21 8c 	l.sw 396(r8),r4
    25d4:	9d 0e 01 4c 	l.addi r8,r14,332
    25d8:	03 ff ff c6 	l.j 24f0 <__register_exitproc+0x48>
    25dc:	d4 0e 41 48 	l.sw 328(r14),r8
    25e0:	03 ff ff d1 	l.j 2524 <__register_exitproc+0x7c>
    25e4:	9d 60 ff ff 	l.addi r11,r0,-1

000025e8 <__call_exitprocs>:
    25e8:	d7 e1 17 d8 	l.sw -40(r1),r2
    25ec:	18 40 00 00 	l.movhi r2,0x0
    25f0:	d7 e1 f7 f8 	l.sw -8(r1),r30
    25f4:	a8 42 3a 80 	l.ori r2,r2,0x3a80
    25f8:	d7 e1 97 e0 	l.sw -32(r1),r18
    25fc:	87 c2 00 00 	l.lwz r30,0(r2)
    2600:	d7 e1 d7 f0 	l.sw -16(r1),r26
    2604:	d7 e1 e7 f4 	l.sw -12(r1),r28
    2608:	d7 e1 4f fc 	l.sw -4(r1),r9
    260c:	d7 e1 0f d4 	l.sw -44(r1),r1
    2610:	d7 e1 77 dc 	l.sw -36(r1),r14
    2614:	d7 e1 a7 e4 	l.sw -28(r1),r20
    2618:	d7 e1 b7 e8 	l.sw -24(r1),r22
    261c:	d7 e1 c7 ec 	l.sw -20(r1),r24
    2620:	9c 5e 01 48 	l.addi r2,r30,328
    2624:	9c 21 ff d0 	l.addi r1,r1,-48
    2628:	1b 80 00 00 	l.movhi r28,0x0
    262c:	ab 43 00 00 	l.ori r26,r3,0x0
    2630:	aa 44 00 00 	l.ori r18,r4,0x0
    2634:	d4 01 10 00 	l.sw 0(r1),r2
    2638:	ab 9c 00 00 	l.ori r28,r28,0x0
    263c:	86 9e 01 48 	l.lwz r20,328(r30)
    2640:	bc 34 00 00 	l.sfnei r20,0
    2644:	0c 00 00 43 	l.bnf 2750 <__call_exitprocs+0x168>
    2648:	86 c1 00 00 	l.lwz r22,0(r1)
    264c:	84 54 00 04 	l.lwz r2,4(r20)
    2650:	9d c2 ff ff 	l.addi r14,r2,-1
    2654:	bd 6e 00 00 	l.sfgesi r14,0
    2658:	0c 00 00 2f 	l.bnf 2714 <__call_exitprocs+0x12c>
    265c:	bc 1c 00 00 	l.sfeqi r28,0
    2660:	9c 42 00 01 	l.addi r2,r2,1
    2664:	b8 42 00 02 	l.slli r2,r2,0x2
    2668:	00 00 00 0a 	l.j 2690 <__call_exitprocs+0xa8>
    266c:	e0 54 10 00 	l.add r2,r20,r2
    2670:	84 62 01 00 	l.lwz r3,256(r2)
    2674:	e4 03 90 00 	l.sfeq r3,r18
    2678:	10 00 00 09 	l.bf 269c <__call_exitprocs+0xb4>
    267c:	15 00 00 00 	l.nop 0x0
    2680:	9d ce ff ff 	l.addi r14,r14,-1
    2684:	bc 2e ff ff 	l.sfnei r14,-1
    2688:	0c 00 00 22 	l.bnf 2710 <__call_exitprocs+0x128>
    268c:	9c 42 ff fc 	l.addi r2,r2,-4
    2690:	bc 12 00 00 	l.sfeqi r18,0
    2694:	0f ff ff f7 	l.bnf 2670 <__call_exitprocs+0x88>
    2698:	15 00 00 00 	l.nop 0x0
    269c:	84 74 00 04 	l.lwz r3,4(r20)
    26a0:	9c 63 ff ff 	l.addi r3,r3,-1
    26a4:	e4 23 70 00 	l.sfne r3,r14
    26a8:	0c 00 00 41 	l.bnf 27ac <__call_exitprocs+0x1c4>
    26ac:	84 a2 00 00 	l.lwz r5,0(r2)
    26b0:	9c 60 00 00 	l.addi r3,r0,0
    26b4:	d4 02 18 00 	l.sw 0(r2),r3
    26b8:	bc 05 00 00 	l.sfeqi r5,0
    26bc:	13 ff ff f1 	l.bf 2680 <__call_exitprocs+0x98>
    26c0:	9c 60 00 01 	l.addi r3,r0,1
    26c4:	e0 83 70 08 	l.sll r4,r3,r14
    26c8:	84 74 01 88 	l.lwz r3,392(r20)
    26cc:	e0 64 18 03 	l.and r3,r4,r3
    26d0:	bc 03 00 00 	l.sfeqi r3,0
    26d4:	0c 00 00 2c 	l.bnf 2784 <__call_exitprocs+0x19c>
    26d8:	87 14 00 04 	l.lwz r24,4(r20)
    26dc:	48 00 28 00 	l.jalr r5
    26e0:	15 00 00 00 	l.nop 0x0
    26e4:	84 74 00 04 	l.lwz r3,4(r20)
    26e8:	e4 23 c0 00 	l.sfne r3,r24
    26ec:	13 ff ff d4 	l.bf 263c <__call_exitprocs+0x54>
    26f0:	15 00 00 00 	l.nop 0x0
    26f4:	84 76 00 00 	l.lwz r3,0(r22)
    26f8:	e4 23 a0 00 	l.sfne r3,r20
    26fc:	13 ff ff d0 	l.bf 263c <__call_exitprocs+0x54>
    2700:	9d ce ff ff 	l.addi r14,r14,-1
    2704:	bc 2e ff ff 	l.sfnei r14,-1
    2708:	13 ff ff e2 	l.bf 2690 <__call_exitprocs+0xa8>
    270c:	9c 42 ff fc 	l.addi r2,r2,-4
    2710:	bc 1c 00 00 	l.sfeqi r28,0
    2714:	10 00 00 0f 	l.bf 2750 <__call_exitprocs+0x168>
    2718:	15 00 00 00 	l.nop 0x0
    271c:	84 54 00 04 	l.lwz r2,4(r20)
    2720:	bc 22 00 00 	l.sfnei r2,0
    2724:	10 00 00 28 	l.bf 27c4 <__call_exitprocs+0x1dc>
    2728:	84 54 00 00 	l.lwz r2,0(r20)
    272c:	bc 02 00 00 	l.sfeqi r2,0
    2730:	10 00 00 25 	l.bf 27c4 <__call_exitprocs+0x1dc>
    2734:	a8 74 00 00 	l.ori r3,r20,0x0
    2738:	07 ff f6 32 	l.jal 0 <_or1k_reset-0x100>
    273c:	d4 16 10 00 	l.sw 0(r22),r2
    2740:	86 96 00 00 	l.lwz r20,0(r22)
    2744:	bc 34 00 00 	l.sfnei r20,0
    2748:	13 ff ff c1 	l.bf 264c <__call_exitprocs+0x64>
    274c:	15 00 00 00 	l.nop 0x0
    2750:	9c 21 00 30 	l.addi r1,r1,48
    2754:	85 21 ff fc 	l.lwz r9,-4(r1)
    2758:	84 21 ff d4 	l.lwz r1,-44(r1)
    275c:	84 41 ff d8 	l.lwz r2,-40(r1)
    2760:	85 c1 ff dc 	l.lwz r14,-36(r1)
    2764:	86 41 ff e0 	l.lwz r18,-32(r1)
    2768:	86 81 ff e4 	l.lwz r20,-28(r1)
    276c:	86 c1 ff e8 	l.lwz r22,-24(r1)
    2770:	87 01 ff ec 	l.lwz r24,-20(r1)
    2774:	87 41 ff f0 	l.lwz r26,-16(r1)
    2778:	87 81 ff f4 	l.lwz r28,-12(r1)
    277c:	44 00 48 00 	l.jr r9
    2780:	87 c1 ff f8 	l.lwz r30,-8(r1)
    2784:	84 74 01 8c 	l.lwz r3,396(r20)
    2788:	e0 64 18 03 	l.and r3,r4,r3
    278c:	bc 23 00 00 	l.sfnei r3,0
    2790:	10 00 00 09 	l.bf 27b4 <__call_exitprocs+0x1cc>
    2794:	15 00 00 00 	l.nop 0x0
    2798:	a8 7a 00 00 	l.ori r3,r26,0x0
    279c:	48 00 28 00 	l.jalr r5
    27a0:	84 82 00 80 	l.lwz r4,128(r2)
    27a4:	03 ff ff d1 	l.j 26e8 <__call_exitprocs+0x100>
    27a8:	84 74 00 04 	l.lwz r3,4(r20)
    27ac:	03 ff ff c3 	l.j 26b8 <__call_exitprocs+0xd0>
    27b0:	d4 14 70 04 	l.sw 4(r20),r14
    27b4:	48 00 28 00 	l.jalr r5
    27b8:	84 62 00 80 	l.lwz r3,128(r2)
    27bc:	03 ff ff cb 	l.j 26e8 <__call_exitprocs+0x100>
    27c0:	84 74 00 04 	l.lwz r3,4(r20)
    27c4:	aa d4 00 00 	l.ori r22,r20,0x0
    27c8:	03 ff ff df 	l.j 2744 <__call_exitprocs+0x15c>
    27cc:	aa 82 00 00 	l.ori r20,r2,0x0

000027d0 <_write_r>:
    27d0:	d7 e1 17 f0 	l.sw -16(r1),r2
    27d4:	d7 e1 77 f4 	l.sw -12(r1),r14
    27d8:	d7 e1 97 f8 	l.sw -8(r1),r18
    27dc:	d7 e1 4f fc 	l.sw -4(r1),r9
    27e0:	d7 e1 0f ec 	l.sw -20(r1),r1
    27e4:	bc 26 00 00 	l.sfnei r6,0
    27e8:	9c 21 ff ec 	l.addi r1,r1,-20
    27ec:	aa 46 00 00 	l.ori r18,r6,0x0
    27f0:	a8 45 00 00 	l.ori r2,r5,0x0
    27f4:	10 00 00 09 	l.bf 2818 <_write_r+0x48>
    27f8:	e1 c5 30 00 	l.add r14,r5,r6
    27fc:	00 00 00 14 	l.j 284c <_write_r+0x7c>
    2800:	9c 21 00 14 	l.addi r1,r1,20
    2804:	04 00 01 1a 	l.jal 2c6c <_or1k_outbyte>
    2808:	9c 42 00 01 	l.addi r2,r2,1
    280c:	e4 22 70 00 	l.sfne r2,r14
    2810:	0c 00 00 0e 	l.bnf 2848 <_write_r+0x78>
    2814:	15 00 00 00 	l.nop 0x0
    2818:	90 62 00 00 	l.lbs r3,0(r2)
    281c:	bc 23 00 0a 	l.sfnei r3,10
    2820:	13 ff ff f9 	l.bf 2804 <_write_r+0x34>
    2824:	15 00 00 00 	l.nop 0x0
    2828:	9c 60 00 0d 	l.addi r3,r0,13
    282c:	04 00 01 10 	l.jal 2c6c <_or1k_outbyte>
    2830:	9c 42 00 01 	l.addi r2,r2,1
    2834:	04 00 01 0e 	l.jal 2c6c <_or1k_outbyte>
    2838:	90 62 ff ff 	l.lbs r3,-1(r2)
    283c:	e4 22 70 00 	l.sfne r2,r14
    2840:	13 ff ff f6 	l.bf 2818 <_write_r+0x48>
    2844:	15 00 00 00 	l.nop 0x0
    2848:	9c 21 00 14 	l.addi r1,r1,20
    284c:	a9 72 00 00 	l.ori r11,r18,0x0
    2850:	85 21 ff fc 	l.lwz r9,-4(r1)
    2854:	84 21 ff ec 	l.lwz r1,-20(r1)
    2858:	84 41 ff f0 	l.lwz r2,-16(r1)
    285c:	85 c1 ff f4 	l.lwz r14,-12(r1)
    2860:	44 00 48 00 	l.jr r9
    2864:	86 41 ff f8 	l.lwz r18,-8(r1)

00002868 <_exit>:
    2868:	d7 e1 4f fc 	l.sw -4(r1),r9
    286c:	d7 e1 0f f8 	l.sw -8(r1),r1
    2870:	04 00 03 b5 	l.jal 3744 <_or1k_board_exit>
    2874:	9c 21 ff f8 	l.addi r1,r1,-8
    2878:	00 00 00 00 	l.j 2878 <_exit+0x10>
    287c:	15 00 00 00 	l.nop 0x0

00002880 <_close_r>:
    2880:	d7 e1 0f fc 	l.sw -4(r1),r1
    2884:	9c 21 ff fc 	l.addi r1,r1,-4
    2888:	9c 80 00 58 	l.addi r4,r0,88
    288c:	9c 21 00 04 	l.addi r1,r1,4
    2890:	9d 60 ff ff 	l.addi r11,r0,-1
    2894:	d4 03 20 00 	l.sw 0(r3),r4
    2898:	44 00 48 00 	l.jr r9
    289c:	84 21 ff fc 	l.lwz r1,-4(r1)

000028a0 <_execve_r>:
    28a0:	d7 e1 0f fc 	l.sw -4(r1),r1
    28a4:	9c 21 ff fc 	l.addi r1,r1,-4
    28a8:	9c 80 00 58 	l.addi r4,r0,88
    28ac:	9c 21 00 04 	l.addi r1,r1,4
    28b0:	9d 60 ff ff 	l.addi r11,r0,-1
    28b4:	d4 03 20 00 	l.sw 0(r3),r4
    28b8:	44 00 48 00 	l.jr r9
    28bc:	84 21 ff fc 	l.lwz r1,-4(r1)

000028c0 <_fork_r>:
    28c0:	d7 e1 4f fc 	l.sw -4(r1),r9
    28c4:	d7 e1 0f f8 	l.sw -8(r1),r1
    28c8:	04 00 03 a6 	l.jal 3760 <__errno>
    28cc:	9c 21 ff f8 	l.addi r1,r1,-8
    28d0:	9c 60 00 58 	l.addi r3,r0,88
    28d4:	d4 0b 18 00 	l.sw 0(r11),r3
    28d8:	9c 21 00 08 	l.addi r1,r1,8
    28dc:	9d 60 ff ff 	l.addi r11,r0,-1
    28e0:	85 21 ff fc 	l.lwz r9,-4(r1)
    28e4:	44 00 48 00 	l.jr r9
    28e8:	84 21 ff f8 	l.lwz r1,-8(r1)

000028ec <_fstat_r>:
    28ec:	d7 e1 0f fc 	l.sw -4(r1),r1
    28f0:	9c 21 ff fc 	l.addi r1,r1,-4
    28f4:	9c 80 00 58 	l.addi r4,r0,88
    28f8:	9c 21 00 04 	l.addi r1,r1,4
    28fc:	9d 60 ff ff 	l.addi r11,r0,-1
    2900:	d4 03 20 00 	l.sw 0(r3),r4
    2904:	44 00 48 00 	l.jr r9
    2908:	84 21 ff fc 	l.lwz r1,-4(r1)

0000290c <_getpid_r>:
    290c:	d7 e1 0f fc 	l.sw -4(r1),r1
    2910:	9c 21 ff fc 	l.addi r1,r1,-4
    2914:	9c 80 00 58 	l.addi r4,r0,88
    2918:	9c 21 00 04 	l.addi r1,r1,4
    291c:	9d 60 ff ff 	l.addi r11,r0,-1
    2920:	d4 03 20 00 	l.sw 0(r3),r4
    2924:	44 00 48 00 	l.jr r9
    2928:	84 21 ff fc 	l.lwz r1,-4(r1)

0000292c <_gettimeofday>:
    292c:	d7 e1 0f fc 	l.sw -4(r1),r1
    2930:	9c 21 ff fc 	l.addi r1,r1,-4
    2934:	9c 80 00 58 	l.addi r4,r0,88
    2938:	9c 21 00 04 	l.addi r1,r1,4
    293c:	9d 60 ff ff 	l.addi r11,r0,-1
    2940:	d4 03 20 00 	l.sw 0(r3),r4
    2944:	44 00 48 00 	l.jr r9
    2948:	84 21 ff fc 	l.lwz r1,-4(r1)

0000294c <_isatty_r>:
    294c:	d7 e1 0f fc 	l.sw -4(r1),r1
    2950:	9c 21 ff fc 	l.addi r1,r1,-4
    2954:	9c 80 00 58 	l.addi r4,r0,88
    2958:	9c 21 00 04 	l.addi r1,r1,4
    295c:	9d 60 00 00 	l.addi r11,r0,0
    2960:	d4 03 20 00 	l.sw 0(r3),r4
    2964:	44 00 48 00 	l.jr r9
    2968:	84 21 ff fc 	l.lwz r1,-4(r1)

0000296c <_kill_r>:
    296c:	d7 e1 0f fc 	l.sw -4(r1),r1
    2970:	9c 21 ff fc 	l.addi r1,r1,-4
    2974:	9c 80 00 58 	l.addi r4,r0,88
    2978:	9c 21 00 04 	l.addi r1,r1,4
    297c:	9d 60 ff ff 	l.addi r11,r0,-1
    2980:	d4 03 20 00 	l.sw 0(r3),r4
    2984:	44 00 48 00 	l.jr r9
    2988:	84 21 ff fc 	l.lwz r1,-4(r1)

0000298c <_link_r>:
    298c:	d7 e1 0f fc 	l.sw -4(r1),r1
    2990:	9c 21 ff fc 	l.addi r1,r1,-4
    2994:	9c 80 00 58 	l.addi r4,r0,88
    2998:	9c 21 00 04 	l.addi r1,r1,4
    299c:	9d 60 ff ff 	l.addi r11,r0,-1
    29a0:	d4 03 20 00 	l.sw 0(r3),r4
    29a4:	44 00 48 00 	l.jr r9
    29a8:	84 21 ff fc 	l.lwz r1,-4(r1)

000029ac <_lseek_r>:
    29ac:	d7 e1 4f fc 	l.sw -4(r1),r9
    29b0:	d7 e1 0f f8 	l.sw -8(r1),r1
    29b4:	04 00 03 6b 	l.jal 3760 <__errno>
    29b8:	9c 21 ff f8 	l.addi r1,r1,-8
    29bc:	9c 60 00 58 	l.addi r3,r0,88
    29c0:	d4 0b 18 00 	l.sw 0(r11),r3
    29c4:	9c 21 00 08 	l.addi r1,r1,8
    29c8:	9d 60 ff ff 	l.addi r11,r0,-1
    29cc:	85 21 ff fc 	l.lwz r9,-4(r1)
    29d0:	44 00 48 00 	l.jr r9
    29d4:	84 21 ff f8 	l.lwz r1,-8(r1)

000029d8 <_open>:
    29d8:	d7 e1 0f fc 	l.sw -4(r1),r1
    29dc:	9c 21 ff fc 	l.addi r1,r1,-4
    29e0:	9c 80 00 58 	l.addi r4,r0,88
    29e4:	9c 21 00 04 	l.addi r1,r1,4
    29e8:	9d 60 ff ff 	l.addi r11,r0,-1
    29ec:	d4 03 20 00 	l.sw 0(r3),r4
    29f0:	44 00 48 00 	l.jr r9
    29f4:	84 21 ff fc 	l.lwz r1,-4(r1)

000029f8 <_read_r>:
    29f8:	d7 e1 0f fc 	l.sw -4(r1),r1
    29fc:	9c 21 ff fc 	l.addi r1,r1,-4
    2a00:	9c 80 00 58 	l.addi r4,r0,88
    2a04:	9c 21 00 04 	l.addi r1,r1,4
    2a08:	9d 60 ff ff 	l.addi r11,r0,-1
    2a0c:	d4 03 20 00 	l.sw 0(r3),r4
    2a10:	44 00 48 00 	l.jr r9
    2a14:	84 21 ff fc 	l.lwz r1,-4(r1)

00002a18 <_readlink_r>:
    2a18:	d7 e1 0f fc 	l.sw -4(r1),r1
    2a1c:	9c 21 ff fc 	l.addi r1,r1,-4
    2a20:	9c 80 00 58 	l.addi r4,r0,88
    2a24:	9c 21 00 04 	l.addi r1,r1,4
    2a28:	9d 60 ff ff 	l.addi r11,r0,-1
    2a2c:	d4 03 20 00 	l.sw 0(r3),r4
    2a30:	44 00 48 00 	l.jr r9
    2a34:	84 21 ff fc 	l.lwz r1,-4(r1)

00002a38 <_stat_r>:
    2a38:	d7 e1 0f fc 	l.sw -4(r1),r1
    2a3c:	9c 21 ff fc 	l.addi r1,r1,-4
    2a40:	9c 80 00 05 	l.addi r4,r0,5
    2a44:	9c 21 00 04 	l.addi r1,r1,4
    2a48:	9d 60 ff ff 	l.addi r11,r0,-1
    2a4c:	d4 03 20 00 	l.sw 0(r3),r4
    2a50:	44 00 48 00 	l.jr r9
    2a54:	84 21 ff fc 	l.lwz r1,-4(r1)

00002a58 <_unlink_r>:
    2a58:	d7 e1 0f fc 	l.sw -4(r1),r1
    2a5c:	9c 21 ff fc 	l.addi r1,r1,-4
    2a60:	9c 80 00 05 	l.addi r4,r0,5
    2a64:	9c 21 00 04 	l.addi r1,r1,4
    2a68:	9d 60 ff ff 	l.addi r11,r0,-1
    2a6c:	d4 03 20 00 	l.sw 0(r3),r4
    2a70:	44 00 48 00 	l.jr r9
    2a74:	84 21 ff fc 	l.lwz r1,-4(r1)

00002a78 <_or1k_uart_interrupt_handler>:
    2a78:	18 60 00 00 	l.movhi r3,0x0
    2a7c:	d7 e1 4f fc 	l.sw -4(r1),r9
    2a80:	a8 63 37 38 	l.ori r3,r3,0x3738
    2a84:	d7 e1 0f f8 	l.sw -8(r1),r1
    2a88:	84 63 00 00 	l.lwz r3,0(r3)
    2a8c:	9c 21 ff f8 	l.addi r1,r1,-8
    2a90:	9c 83 00 02 	l.addi r4,r3,2
    2a94:	8c 84 00 00 	l.lbz r4,0(r4)
    2a98:	bc 24 00 c5 	l.sfnei r4,197
    2a9c:	0c 00 00 06 	l.bnf 2ab4 <_or1k_uart_interrupt_handler+0x3c>
    2aa0:	15 00 00 00 	l.nop 0x0
    2aa4:	9c 21 00 08 	l.addi r1,r1,8
    2aa8:	85 21 ff fc 	l.lwz r9,-4(r1)
    2aac:	44 00 48 00 	l.jr r9
    2ab0:	84 21 ff f8 	l.lwz r1,-8(r1)
    2ab4:	8c 63 00 00 	l.lbz r3,0(r3)
    2ab8:	18 80 00 00 	l.movhi r4,0x0
    2abc:	b8 63 00 18 	l.slli r3,r3,0x18
    2ac0:	a8 84 48 fc 	l.ori r4,r4,0x48fc
    2ac4:	84 84 00 00 	l.lwz r4,0(r4)
    2ac8:	48 00 20 00 	l.jalr r4
    2acc:	b8 63 00 98 	l.srai r3,r3,0x18
    2ad0:	9c 21 00 08 	l.addi r1,r1,8
    2ad4:	85 21 ff fc 	l.lwz r9,-4(r1)
    2ad8:	44 00 48 00 	l.jr r9
    2adc:	84 21 ff f8 	l.lwz r1,-8(r1)

00002ae0 <_or1k_uart_init>:
    2ae0:	d7 e1 17 f4 	l.sw -12(r1),r2
    2ae4:	18 40 00 00 	l.movhi r2,0x0
    2ae8:	d7 e1 77 f8 	l.sw -8(r1),r14
    2aec:	a8 42 37 38 	l.ori r2,r2,0x3738
    2af0:	d7 e1 4f fc 	l.sw -4(r1),r9
    2af4:	85 c2 00 00 	l.lwz r14,0(r2)
    2af8:	d7 e1 0f f0 	l.sw -16(r1),r1
    2afc:	bc 0e 00 00 	l.sfeqi r14,0
    2b00:	10 00 00 2c 	l.bf 2bb0 <_or1k_uart_init+0xd0>
    2b04:	9c 21 ff f0 	l.addi r1,r1,-16
    2b08:	18 60 00 00 	l.movhi r3,0x0
    2b0c:	18 a0 00 00 	l.movhi r5,0x0
    2b10:	a8 63 37 3c 	l.ori r3,r3,0x373c
    2b14:	9c c0 00 00 	l.addi r6,r0,0
    2b18:	84 83 00 00 	l.lwz r4,0(r3)
    2b1c:	18 60 00 00 	l.movhi r3,0x0
    2b20:	a8 a5 48 fc 	l.ori r5,r5,0x48fc
    2b24:	a8 63 37 34 	l.ori r3,r3,0x3734
    2b28:	b8 84 00 04 	l.slli r4,r4,0x4
    2b2c:	84 63 00 00 	l.lwz r3,0(r3)
    2b30:	d4 05 30 00 	l.sw 0(r5),r6
    2b34:	04 00 03 6f 	l.jal 38f0 <__udivsi3>
    2b38:	9d ce 00 03 	l.addi r14,r14,3
    2b3c:	9c 60 ff 80 	l.addi r3,r0,-128
    2b40:	a4 8b 00 ff 	l.andi r4,r11,0xff
    2b44:	d8 0e 18 00 	l.sb 0(r14),r3
    2b48:	a5 6b ff ff 	l.andi r11,r11,0xffff
    2b4c:	84 62 00 00 	l.lwz r3,0(r2)
    2b50:	9c c0 ff c3 	l.addi r6,r0,-61
    2b54:	d8 03 20 00 	l.sb 0(r3),r4
    2b58:	b8 6b 00 48 	l.srli r3,r11,0x8
    2b5c:	84 82 00 00 	l.lwz r4,0(r2)
    2b60:	9d 60 00 00 	l.addi r11,r0,0
    2b64:	9c 84 00 01 	l.addi r4,r4,1
    2b68:	d8 04 18 00 	l.sb 0(r4),r3
    2b6c:	9c 80 00 03 	l.addi r4,r0,3
    2b70:	84 62 00 00 	l.lwz r3,0(r2)
    2b74:	9c 63 00 03 	l.addi r3,r3,3
    2b78:	d8 03 20 00 	l.sb 0(r3),r4
    2b7c:	84 62 00 00 	l.lwz r3,0(r2)
    2b80:	9c 63 00 02 	l.addi r3,r3,2
    2b84:	d8 03 30 00 	l.sb 0(r3),r6
    2b88:	9c 60 00 00 	l.addi r3,r0,0
    2b8c:	84 42 00 00 	l.lwz r2,0(r2)
    2b90:	9c 42 00 01 	l.addi r2,r2,1
    2b94:	d8 02 18 00 	l.sb 0(r2),r3
    2b98:	9c 21 00 10 	l.addi r1,r1,16
    2b9c:	85 21 ff fc 	l.lwz r9,-4(r1)
    2ba0:	84 21 ff f0 	l.lwz r1,-16(r1)
    2ba4:	84 41 ff f4 	l.lwz r2,-12(r1)
    2ba8:	44 00 48 00 	l.jr r9
    2bac:	85 c1 ff f8 	l.lwz r14,-8(r1)
    2bb0:	03 ff ff fa 	l.j 2b98 <_or1k_uart_init+0xb8>
    2bb4:	9d 60 ff ff 	l.addi r11,r0,-1

00002bb8 <_or1k_uart_write>:
    2bb8:	18 80 00 00 	l.movhi r4,0x0
    2bbc:	b8 63 00 18 	l.slli r3,r3,0x18
    2bc0:	a8 84 37 38 	l.ori r4,r4,0x3738
    2bc4:	d7 e1 0f fc 	l.sw -4(r1),r1
    2bc8:	84 c4 00 00 	l.lwz r6,0(r4)
    2bcc:	b8 63 00 98 	l.srai r3,r3,0x18
    2bd0:	9c 21 ff fc 	l.addi r1,r1,-4
    2bd4:	9c a6 00 05 	l.addi r5,r6,5
    2bd8:	8c 85 00 00 	l.lbz r4,0(r5)
    2bdc:	a4 84 00 20 	l.andi r4,r4,0x20
    2be0:	bc 04 00 00 	l.sfeqi r4,0
    2be4:	13 ff ff fd 	l.bf 2bd8 <_or1k_uart_write+0x20>
    2be8:	15 00 00 00 	l.nop 0x0
    2bec:	a4 63 00 ff 	l.andi r3,r3,0xff
    2bf0:	d8 06 18 00 	l.sb 0(r6),r3
    2bf4:	9c 21 00 04 	l.addi r1,r1,4
    2bf8:	44 00 48 00 	l.jr r9
    2bfc:	84 21 ff fc 	l.lwz r1,-4(r1)

00002c00 <or1k_uart_set_read_cb>:
    2c00:	d7 e1 17 f8 	l.sw -8(r1),r2
    2c04:	18 40 00 00 	l.movhi r2,0x0
    2c08:	d7 e1 4f fc 	l.sw -4(r1),r9
    2c0c:	a8 42 37 38 	l.ori r2,r2,0x3738
    2c10:	d7 e1 0f f4 	l.sw -12(r1),r1
    2c14:	84 82 00 00 	l.lwz r4,0(r2)
    2c18:	18 40 00 00 	l.movhi r2,0x0
    2c1c:	9c 84 00 01 	l.addi r4,r4,1
    2c20:	a8 42 48 fc 	l.ori r2,r2,0x48fc
    2c24:	9c 21 ff f4 	l.addi r1,r1,-12
    2c28:	d4 02 18 00 	l.sw 0(r2),r3
    2c2c:	9c 40 00 01 	l.addi r2,r0,1
    2c30:	9c a0 00 00 	l.addi r5,r0,0
    2c34:	d8 04 10 00 	l.sb 0(r4),r2
    2c38:	18 40 00 00 	l.movhi r2,0x0
    2c3c:	18 80 00 00 	l.movhi r4,0x0
    2c40:	a8 42 37 40 	l.ori r2,r2,0x3740
    2c44:	a8 84 2a 78 	l.ori r4,r4,0x2a78
    2c48:	04 00 00 d2 	l.jal 2f90 <or1k_interrupt_handler_add>
    2c4c:	84 62 00 00 	l.lwz r3,0(r2)
    2c50:	04 00 01 2a 	l.jal 30f8 <or1k_interrupt_enable>
    2c54:	84 62 00 00 	l.lwz r3,0(r2)
    2c58:	9c 21 00 0c 	l.addi r1,r1,12
    2c5c:	85 21 ff fc 	l.lwz r9,-4(r1)
    2c60:	84 21 ff f4 	l.lwz r1,-12(r1)
    2c64:	44 00 48 00 	l.jr r9
    2c68:	84 41 ff f8 	l.lwz r2,-8(r1)

00002c6c <_or1k_outbyte>:
    2c6c:	18 80 00 00 	l.movhi r4,0x0
    2c70:	a8 84 37 38 	l.ori r4,r4,0x3738
    2c74:	84 84 00 00 	l.lwz r4,0(r4)
    2c78:	e4 04 00 00 	l.sfeq r4,r0
    2c7c:	10 00 00 04 	l.bf 2c8c <_or1k_outbyte+0x20>
    2c80:	15 00 00 00 	l.nop 0x0
    2c84:	03 ff ff cd 	l.j 2bb8 <_or1k_uart_write>
    2c88:	15 00 00 00 	l.nop 0x0
    2c8c:	44 00 48 00 	l.jr r9
    2c90:	15 00 00 04 	l.nop 0x4

00002c94 <_or1k_cache_init>:
    2c94:	b4 60 00 01 	l.mfspr r3,r0,0x1
    2c98:	a4 83 00 04 	l.andi r4,r3,0x4
    2c9c:	e4 04 00 00 	l.sfeq r4,r0
    2ca0:	10 00 00 21 	l.bf 2d24 <_or1k_cache_init+0x90>
    2ca4:	15 00 00 00 	l.nop 0x0
    2ca8:	b4 c0 00 11 	l.mfspr r6,r0,0x11
    2cac:	9c a0 ff ff 	l.addi r5,r0,-1
    2cb0:	ac a5 00 10 	l.xori r5,r5,16
    2cb4:	e0 a6 28 03 	l.and r5,r6,r5
    2cb8:	c0 00 28 11 	l.mtspr r0,r5,0x11
    2cbc:	b4 60 00 06 	l.mfspr r3,r0,0x6
    2cc0:	a4 83 00 80 	l.andi r4,r3,0x80
    2cc4:	b8 e4 00 47 	l.srli r7,r4,0x7
    2cc8:	a9 00 00 10 	l.ori r8,r0,0x10
    2ccc:	e1 c8 38 08 	l.sll r14,r8,r7
    2cd0:	a4 83 00 78 	l.andi r4,r3,0x78
    2cd4:	b8 e4 00 43 	l.srli r7,r4,0x3
    2cd8:	a9 00 00 01 	l.ori r8,r0,0x1
    2cdc:	e1 a8 38 08 	l.sll r13,r8,r7
    2ce0:	9c c0 00 00 	l.addi r6,r0,0
    2ce4:	e0 ae 38 08 	l.sll r5,r14,r7
    2ce8:	c0 80 30 02 	l.mtspr r0,r6,0x2002
    2cec:	e4 26 28 00 	l.sfne r6,r5
    2cf0:	13 ff ff fe 	l.bf 2ce8 <_or1k_cache_init+0x54>
    2cf4:	e0 c6 70 00 	l.add r6,r6,r14
    2cf8:	b4 c0 00 11 	l.mfspr r6,r0,0x11
    2cfc:	a8 c6 00 10 	l.ori r6,r6,0x10
    2d00:	c0 00 30 11 	l.mtspr r0,r6,0x11
    2d04:	15 00 00 00 	l.nop 0x0
    2d08:	15 00 00 00 	l.nop 0x0
    2d0c:	15 00 00 00 	l.nop 0x0
    2d10:	15 00 00 00 	l.nop 0x0
    2d14:	15 00 00 00 	l.nop 0x0
    2d18:	15 00 00 00 	l.nop 0x0
    2d1c:	15 00 00 00 	l.nop 0x0
    2d20:	15 00 00 00 	l.nop 0x0
    2d24:	b4 60 00 01 	l.mfspr r3,r0,0x1
    2d28:	a4 83 00 02 	l.andi r4,r3,0x2
    2d2c:	e4 04 00 00 	l.sfeq r4,r0
    2d30:	10 00 00 19 	l.bf 2d94 <_or1k_cache_init+0x100>
    2d34:	15 00 00 00 	l.nop 0x0
    2d38:	b4 c0 00 11 	l.mfspr r6,r0,0x11
    2d3c:	9c a0 ff ff 	l.addi r5,r0,-1
    2d40:	ac a5 00 08 	l.xori r5,r5,8
    2d44:	e0 a6 28 03 	l.and r5,r6,r5
    2d48:	c0 00 28 11 	l.mtspr r0,r5,0x11
    2d4c:	b4 60 00 05 	l.mfspr r3,r0,0x5
    2d50:	a4 83 00 80 	l.andi r4,r3,0x80
    2d54:	b8 e4 00 47 	l.srli r7,r4,0x7
    2d58:	a9 00 00 10 	l.ori r8,r0,0x10
    2d5c:	e1 c8 38 08 	l.sll r14,r8,r7
    2d60:	a4 83 00 78 	l.andi r4,r3,0x78
    2d64:	b8 e4 00 43 	l.srli r7,r4,0x3
    2d68:	a9 00 00 01 	l.ori r8,r0,0x1
    2d6c:	e1 a8 38 08 	l.sll r13,r8,r7
    2d70:	9c c0 00 00 	l.addi r6,r0,0
    2d74:	e0 ae 38 08 	l.sll r5,r14,r7
    2d78:	c0 60 30 03 	l.mtspr r0,r6,0x1803
    2d7c:	e4 26 28 00 	l.sfne r6,r5
    2d80:	13 ff ff fe 	l.bf 2d78 <_or1k_cache_init+0xe4>
    2d84:	e0 c6 70 00 	l.add r6,r6,r14
    2d88:	b4 c0 00 11 	l.mfspr r6,r0,0x11
    2d8c:	a8 c6 00 08 	l.ori r6,r6,0x8
    2d90:	c0 00 30 11 	l.mtspr r0,r6,0x11
    2d94:	44 00 48 00 	l.jr r9
    2d98:	15 00 00 00 	l.nop 0x0

00002d9c <or1k_icache_enable>:
    2d9c:	b5 a0 00 11 	l.mfspr r13,r0,0x11
    2da0:	a9 ad 00 10 	l.ori r13,r13,0x10
    2da4:	c0 00 68 11 	l.mtspr r0,r13,0x11
    2da8:	15 00 00 00 	l.nop 0x0
    2dac:	15 00 00 00 	l.nop 0x0
    2db0:	15 00 00 00 	l.nop 0x0
    2db4:	15 00 00 00 	l.nop 0x0
    2db8:	15 00 00 00 	l.nop 0x0
    2dbc:	44 00 48 00 	l.jr r9
    2dc0:	15 00 00 00 	l.nop 0x0

00002dc4 <or1k_icache_disable>:
    2dc4:	b5 a0 00 11 	l.mfspr r13,r0,0x11
    2dc8:	9d 80 ff ff 	l.addi r12,r0,-1
    2dcc:	ad 8c 00 10 	l.xori r12,r12,16
    2dd0:	e1 8d 60 03 	l.and r12,r13,r12
    2dd4:	c0 00 60 11 	l.mtspr r0,r12,0x11
    2dd8:	44 00 48 00 	l.jr r9
    2ddc:	15 00 00 00 	l.nop 0x0

00002de0 <or1k_icache_flush>:
    2de0:	44 00 48 00 	l.jr r9
    2de4:	c0 80 18 02 	l.mtspr r0,r3,0x2002

00002de8 <or1k_dcache_enable>:
    2de8:	b5 a0 00 11 	l.mfspr r13,r0,0x11
    2dec:	a9 ad 00 08 	l.ori r13,r13,0x8
    2df0:	c0 00 68 11 	l.mtspr r0,r13,0x11
    2df4:	15 00 00 00 	l.nop 0x0
    2df8:	15 00 00 00 	l.nop 0x0
    2dfc:	15 00 00 00 	l.nop 0x0
    2e00:	15 00 00 00 	l.nop 0x0
    2e04:	15 00 00 00 	l.nop 0x0
    2e08:	44 00 48 00 	l.jr r9
    2e0c:	15 00 00 00 	l.nop 0x0

00002e10 <or1k_dcache_disable>:
    2e10:	b5 a0 00 11 	l.mfspr r13,r0,0x11
    2e14:	9d 80 ff ff 	l.addi r12,r0,-1
    2e18:	ad 8c 00 08 	l.xori r12,r12,8
    2e1c:	e1 8d 60 03 	l.and r12,r13,r12
    2e20:	c0 00 60 11 	l.mtspr r0,r12,0x11
    2e24:	44 00 48 00 	l.jr r9
    2e28:	15 00 00 00 	l.nop 0x0

00002e2c <or1k_dcache_flush>:
    2e2c:	44 00 48 00 	l.jr r9
    2e30:	c0 60 18 03 	l.mtspr r0,r3,0x1803

00002e34 <_or1k_exception_handler>:
    2e34:	d4 01 10 08 	l.sw 8(r1),r2
    2e38:	d4 01 28 14 	l.sw 20(r1),r5
    2e3c:	d4 01 30 18 	l.sw 24(r1),r6
    2e40:	d4 01 38 1c 	l.sw 28(r1),r7
    2e44:	d4 01 40 20 	l.sw 32(r1),r8
    2e48:	d4 01 48 24 	l.sw 36(r1),r9
    2e4c:	d4 01 50 28 	l.sw 40(r1),r10
    2e50:	d4 01 58 2c 	l.sw 44(r1),r11
    2e54:	d4 01 60 30 	l.sw 48(r1),r12
    2e58:	d4 01 68 34 	l.sw 52(r1),r13
    2e5c:	d4 01 70 38 	l.sw 56(r1),r14
    2e60:	d4 01 78 3c 	l.sw 60(r1),r15
    2e64:	d4 01 80 40 	l.sw 64(r1),r16
    2e68:	d4 01 88 44 	l.sw 68(r1),r17
    2e6c:	d4 01 90 48 	l.sw 72(r1),r18
    2e70:	d4 01 98 4c 	l.sw 76(r1),r19
    2e74:	d4 01 a0 50 	l.sw 80(r1),r20
    2e78:	d4 01 a8 54 	l.sw 84(r1),r21
    2e7c:	d4 01 b0 58 	l.sw 88(r1),r22
    2e80:	d4 01 b8 5c 	l.sw 92(r1),r23
    2e84:	d4 01 c0 60 	l.sw 96(r1),r24
    2e88:	d4 01 c8 64 	l.sw 100(r1),r25
    2e8c:	d4 01 d0 68 	l.sw 104(r1),r26
    2e90:	d4 01 d8 6c 	l.sw 108(r1),r27
    2e94:	d4 01 e0 70 	l.sw 112(r1),r28
    2e98:	d4 01 e8 74 	l.sw 116(r1),r29
    2e9c:	d4 01 f0 78 	l.sw 120(r1),r30
    2ea0:	d4 01 f8 7c 	l.sw 124(r1),r31
    2ea4:	1a 80 00 00 	l.movhi r20,0x0
    2ea8:	aa 94 44 78 	l.ori r20,r20,0x4478
    2eac:	86 94 00 00 	l.lwz r20,0(r20)
    2eb0:	1a a0 00 00 	l.movhi r21,0x0
    2eb4:	aa b5 4a 0c 	l.ori r21,r21,0x4a0c
    2eb8:	d4 15 a0 00 	l.sw 0(r21),r20
    2ebc:	a5 a3 ff 00 	l.andi r13,r3,0xff00
    2ec0:	b9 ad 00 46 	l.srli r13,r13,0x6
    2ec4:	9d ad ff f8 	l.addi r13,r13,-8
    2ec8:	19 c0 00 00 	l.movhi r14,0x0
    2ecc:	a9 ce 4a 24 	l.ori r14,r14,0x4a24
    2ed0:	e1 ce 68 00 	l.add r14,r14,r13
    2ed4:	85 ae 00 00 	l.lwz r13,0(r14)
    2ed8:	e4 2d 00 00 	l.sfne r13,r0
    2edc:	0c 00 00 2b 	l.bnf 2f88 <exception_exit>
    2ee0:	15 00 00 00 	l.nop 0x0
    2ee4:	48 00 68 00 	l.jalr r13
    2ee8:	e0 64 20 04 	l.or r3,r4,r4
    2eec:	1a 80 00 00 	l.movhi r20,0x0
    2ef0:	aa 94 4a 10 	l.ori r20,r20,0x4a10
    2ef4:	86 94 00 00 	l.lwz r20,0(r20)
    2ef8:	1a a0 00 00 	l.movhi r21,0x0
    2efc:	aa b5 4a 0c 	l.ori r21,r21,0x4a0c
    2f00:	d4 15 a0 00 	l.sw 0(r21),r20
    2f04:	84 41 00 08 	l.lwz r2,8(r1)
    2f08:	84 61 00 0c 	l.lwz r3,12(r1)
    2f0c:	84 81 00 10 	l.lwz r4,16(r1)
    2f10:	84 a1 00 14 	l.lwz r5,20(r1)
    2f14:	84 c1 00 18 	l.lwz r6,24(r1)
    2f18:	84 e1 00 1c 	l.lwz r7,28(r1)
    2f1c:	85 01 00 20 	l.lwz r8,32(r1)
    2f20:	85 21 00 24 	l.lwz r9,36(r1)
    2f24:	85 41 00 28 	l.lwz r10,40(r1)
    2f28:	85 61 00 2c 	l.lwz r11,44(r1)
    2f2c:	85 81 00 30 	l.lwz r12,48(r1)
    2f30:	85 a1 00 34 	l.lwz r13,52(r1)
    2f34:	85 c1 00 38 	l.lwz r14,56(r1)
    2f38:	85 e1 00 3c 	l.lwz r15,60(r1)
    2f3c:	86 01 00 40 	l.lwz r16,64(r1)
    2f40:	86 21 00 44 	l.lwz r17,68(r1)
    2f44:	86 41 00 48 	l.lwz r18,72(r1)
    2f48:	86 61 00 4c 	l.lwz r19,76(r1)
    2f4c:	86 81 00 50 	l.lwz r20,80(r1)
    2f50:	86 a1 00 54 	l.lwz r21,84(r1)
    2f54:	86 c1 00 58 	l.lwz r22,88(r1)
    2f58:	86 e1 00 5c 	l.lwz r23,92(r1)
    2f5c:	87 01 00 60 	l.lwz r24,96(r1)
    2f60:	87 21 00 64 	l.lwz r25,100(r1)
    2f64:	87 41 00 68 	l.lwz r26,104(r1)
    2f68:	87 61 00 6c 	l.lwz r27,108(r1)
    2f6c:	87 81 00 70 	l.lwz r28,112(r1)
    2f70:	87 a1 00 74 	l.lwz r29,116(r1)
    2f74:	87 c1 00 78 	l.lwz r30,120(r1)
    2f78:	87 e1 00 7c 	l.lwz r31,124(r1)
    2f7c:	84 21 00 04 	l.lwz r1,4(r1)
    2f80:	24 00 00 00 	l.rfe
    2f84:	15 00 00 00 	l.nop 0x0

00002f88 <exception_exit>:
    2f88:	07 ff fd 36 	l.jal 2460 <exit>
    2f8c:	e0 64 20 04 	l.or r3,r4,r4

00002f90 <or1k_interrupt_handler_add>:
    2f90:	d7 e1 17 fc 	l.sw -4(r1),r2
    2f94:	18 40 00 00 	l.movhi r2,0x0
    2f98:	b8 63 00 02 	l.slli r3,r3,0x2
    2f9c:	a8 42 49 00 	l.ori r2,r2,0x4900
    2fa0:	d7 e1 0f f8 	l.sw -8(r1),r1
    2fa4:	e0 c3 10 00 	l.add r6,r3,r2
    2fa8:	18 40 00 00 	l.movhi r2,0x0
    2fac:	9c 21 ff f8 	l.addi r1,r1,-8
    2fb0:	a8 42 49 80 	l.ori r2,r2,0x4980
    2fb4:	d4 06 20 00 	l.sw 0(r6),r4
    2fb8:	e0 63 10 00 	l.add r3,r3,r2
    2fbc:	d4 03 28 00 	l.sw 0(r3),r5
    2fc0:	9c 21 00 08 	l.addi r1,r1,8
    2fc4:	84 21 ff f8 	l.lwz r1,-8(r1)
    2fc8:	44 00 48 00 	l.jr r9
    2fcc:	84 41 ff fc 	l.lwz r2,-4(r1)

00002fd0 <or1k_interrupts_enable>:
    2fd0:	d7 e1 0f fc 	l.sw -4(r1),r1
    2fd4:	9c 80 00 11 	l.addi r4,r0,17
    2fd8:	9c 21 ff fc 	l.addi r1,r1,-4
    2fdc:	b4 64 00 00 	l.mfspr r3,r4,0x0
    2fe0:	a8 63 00 04 	l.ori r3,r3,0x4
    2fe4:	c0 04 18 00 	l.mtspr r4,r3,0x0
    2fe8:	9c 21 00 04 	l.addi r1,r1,4
    2fec:	44 00 48 00 	l.jr r9
    2ff0:	84 21 ff fc 	l.lwz r1,-4(r1)

00002ff4 <or1k_interrupts_disable>:
    2ff4:	d7 e1 0f f8 	l.sw -8(r1),r1
    2ff8:	d7 e1 17 fc 	l.sw -4(r1),r2
    2ffc:	9c 60 00 11 	l.addi r3,r0,17
    3000:	9c 21 ff f8 	l.addi r1,r1,-8
    3004:	b5 63 00 00 	l.mfspr r11,r3,0x0
    3008:	9c 40 ff fb 	l.addi r2,r0,-5
    300c:	e0 8b 10 03 	l.and r4,r11,r2
    3010:	c0 03 20 00 	l.mtspr r3,r4,0x0
    3014:	9c 21 00 08 	l.addi r1,r1,8
    3018:	b9 6b 00 42 	l.srli r11,r11,0x2
    301c:	84 21 ff f8 	l.lwz r1,-8(r1)
    3020:	a5 6b 00 01 	l.andi r11,r11,0x1
    3024:	44 00 48 00 	l.jr r9
    3028:	84 41 ff fc 	l.lwz r2,-4(r1)

0000302c <or1k_interrupts_restore>:
    302c:	d7 e1 0f f8 	l.sw -8(r1),r1
    3030:	d7 e1 17 fc 	l.sw -4(r1),r2
    3034:	9c 80 00 11 	l.addi r4,r0,17
    3038:	9c 21 ff f8 	l.addi r1,r1,-8
    303c:	b4 84 00 00 	l.mfspr r4,r4,0x0
    3040:	9c 40 ff fb 	l.addi r2,r0,-5
    3044:	bc 23 00 00 	l.sfnei r3,0
    3048:	e0 84 10 03 	l.and r4,r4,r2
    304c:	10 00 00 03 	l.bf 3058 <or1k_interrupts_restore+0x2c>
    3050:	9c a0 00 04 	l.addi r5,r0,4
    3054:	a8 a3 00 00 	l.ori r5,r3,0x0
    3058:	e0 65 20 04 	l.or r3,r5,r4
    305c:	9c 80 00 11 	l.addi r4,r0,17
    3060:	c0 04 18 00 	l.mtspr r4,r3,0x0
    3064:	9c 21 00 08 	l.addi r1,r1,8
    3068:	84 21 ff f8 	l.lwz r1,-8(r1)
    306c:	44 00 48 00 	l.jr r9
    3070:	84 41 ff fc 	l.lwz r2,-4(r1)

00003074 <_or1k_interrupt_handler>:
    3074:	9c 21 ff f4 	l.addi r1,r1,-12
    3078:	d4 01 48 00 	l.sw 0(r1),r9
    307c:	b4 60 48 02 	l.mfspr r3,r0,0x4802
    3080:	18 e0 00 00 	l.movhi r7,0x0
    3084:	a8 e7 49 00 	l.ori r7,r7,0x4900
    3088:	19 80 00 00 	l.movhi r12,0x0
    308c:	a9 8c 49 80 	l.ori r12,r12,0x4980
    3090:	e0 83 00 0f 	l.ff1 r4,r3
    3094:	e4 24 00 00 	l.sfne r4,r0
    3098:	0c 00 00 14 	l.bnf 30e8 <_or1k_interrupt_handler+0x74>
    309c:	15 00 00 00 	l.nop 0x0
    30a0:	9c a4 ff ff 	l.addi r5,r4,-1
    30a4:	b8 c5 00 02 	l.slli r6,r5,0x2
    30a8:	e1 c6 38 00 	l.add r14,r6,r7
    30ac:	e1 a6 60 00 	l.add r13,r6,r12
    30b0:	85 ce 00 00 	l.lwz r14,0(r14)
    30b4:	e4 2e 00 00 	l.sfne r14,r0
    30b8:	0c 00 00 08 	l.bnf 30d8 <_or1k_interrupt_handler+0x64>
    30bc:	15 00 00 00 	l.nop 0x0
    30c0:	d4 01 18 04 	l.sw 4(r1),r3
    30c4:	84 6d 00 00 	l.lwz r3,0(r13)
    30c8:	48 00 70 00 	l.jalr r14
    30cc:	d4 01 28 08 	l.sw 8(r1),r5
    30d0:	84 61 00 04 	l.lwz r3,4(r1)
    30d4:	84 a1 00 08 	l.lwz r5,8(r1)
    30d8:	a8 c0 00 01 	l.ori r6,r0,0x1
    30dc:	e0 c6 28 08 	l.sll r6,r6,r5
    30e0:	03 ff ff ec 	l.j 3090 <_or1k_interrupt_handler+0x1c>
    30e4:	e0 63 30 05 	l.xor r3,r3,r6
    30e8:	85 21 00 00 	l.lwz r9,0(r1)
    30ec:	c1 20 18 02 	l.mtspr r0,r3,0x4802
    30f0:	44 00 48 00 	l.jr r9
    30f4:	9c 21 00 0c 	l.addi r1,r1,12

000030f8 <or1k_interrupt_enable>:
    30f8:	9c 21 ff fc 	l.addi r1,r1,-4
    30fc:	d4 01 20 00 	l.sw 0(r1),r4
    3100:	a8 80 00 01 	l.ori r4,r0,0x1
    3104:	e0 84 18 08 	l.sll r4,r4,r3
    3108:	b4 60 48 00 	l.mfspr r3,r0,0x4800
    310c:	e0 63 20 04 	l.or r3,r3,r4
    3110:	c1 20 18 00 	l.mtspr r0,r3,0x4800
    3114:	84 81 00 00 	l.lwz r4,0(r1)
    3118:	44 00 48 00 	l.jr r9
    311c:	9c 21 00 04 	l.addi r1,r1,4

00003120 <or1k_interrupt_disable>:
    3120:	9c 21 ff fc 	l.addi r1,r1,-4
    3124:	d4 01 20 00 	l.sw 0(r1),r4
    3128:	a8 80 00 01 	l.ori r4,r0,0x1
    312c:	e0 84 18 08 	l.sll r4,r4,r3
    3130:	ac 84 ff ff 	l.xori r4,r4,-1
    3134:	b4 60 48 00 	l.mfspr r3,r0,0x4800
    3138:	e0 63 20 03 	l.and r3,r3,r4
    313c:	c1 20 18 00 	l.mtspr r0,r3,0x4800
    3140:	84 81 00 00 	l.lwz r4,0(r1)
    3144:	44 00 48 00 	l.jr r9
    3148:	9c 21 00 04 	l.addi r1,r1,4

0000314c <_or1k_libc_impure_init>:
    314c:	d7 e1 17 d8 	l.sw -40(r1),r2
    3150:	18 40 00 00 	l.movhi r2,0x0
    3154:	d7 e1 f7 f8 	l.sw -8(r1),r30
    3158:	a8 42 40 4c 	l.ori r2,r2,0x404c
    315c:	9f c0 04 24 	l.addi r30,r0,1060
    3160:	d7 e1 4f fc 	l.sw -4(r1),r9
    3164:	d7 e1 77 dc 	l.sw -36(r1),r14
    3168:	d7 e1 97 e0 	l.sw -32(r1),r18
    316c:	d7 e1 a7 e4 	l.sw -28(r1),r20
    3170:	d7 e1 b7 e8 	l.sw -24(r1),r22
    3174:	d7 e1 c7 ec 	l.sw -20(r1),r24
    3178:	d7 e1 d7 f0 	l.sw -16(r1),r26
    317c:	d7 e1 e7 f4 	l.sw -12(r1),r28
    3180:	84 62 00 00 	l.lwz r3,0(r2)
    3184:	a8 be 00 00 	l.ori r5,r30,0x0
    3188:	d7 e1 0f d4 	l.sw -44(r1),r1
    318c:	9c 80 00 00 	l.addi r4,r0,0
    3190:	9c 21 ff d4 	l.addi r1,r1,-44
    3194:	04 00 01 7d 	l.jal 3788 <memset>
    3198:	1b 40 00 00 	l.movhi r26,0x0
    319c:	84 c2 00 00 	l.lwz r6,0(r2)
    31a0:	1b 80 00 00 	l.movhi r28,0x0
    31a4:	9c 86 03 54 	l.addi r4,r6,852
    31a8:	9c 66 03 bc 	l.addi r3,r6,956
    31ac:	9c a6 02 ec 	l.addi r5,r6,748
    31b0:	ab 5a 3a 84 	l.ori r26,r26,0x3a84
    31b4:	9f 00 33 0e 	l.addi r24,r0,13070
    31b8:	9e c0 ab cd 	l.addi r22,r0,-21555
    31bc:	9e 80 12 34 	l.addi r20,r0,4660
    31c0:	9e 40 e6 6d 	l.addi r18,r0,-6547
    31c4:	9d c0 de ec 	l.addi r14,r0,-8468
    31c8:	ab 9c 44 78 	l.ori r28,r28,0x4478
    31cc:	d4 06 20 08 	l.sw 8(r6),r4
    31d0:	d4 06 18 0c 	l.sw 12(r6),r3
    31d4:	9c 80 00 0b 	l.addi r4,r0,11
    31d8:	9c 60 00 05 	l.addi r3,r0,5
    31dc:	d4 06 28 04 	l.sw 4(r6),r5
    31e0:	d4 06 d0 34 	l.sw 52(r6),r26
    31e4:	dc 06 c0 ac 	l.sh 172(r6),r24
    31e8:	dc 06 b0 ae 	l.sh 174(r6),r22
    31ec:	dc 06 a0 b0 	l.sh 176(r6),r20
    31f0:	dc 06 90 b2 	l.sh 178(r6),r18
    31f4:	dc 06 70 b4 	l.sh 180(r6),r14
    31f8:	dc 06 18 b6 	l.sh 182(r6),r3
    31fc:	dc 06 20 b8 	l.sh 184(r6),r4
    3200:	84 7c 00 00 	l.lwz r3,0(r28)
    3204:	a8 be 00 00 	l.ori r5,r30,0x0
    3208:	9c e0 00 00 	l.addi r7,r0,0
    320c:	9d 00 00 01 	l.addi r8,r0,1
    3210:	d4 06 38 a4 	l.sw 164(r6),r7
    3214:	d4 06 40 a8 	l.sw 168(r6),r8
    3218:	04 00 01 5c 	l.jal 3788 <memset>
    321c:	9c 80 00 00 	l.addi r4,r0,0
    3220:	84 7c 00 00 	l.lwz r3,0(r28)
    3224:	84 82 00 00 	l.lwz r4,0(r2)
    3228:	9c 40 00 0b 	l.addi r2,r0,11
    322c:	9c a3 03 bc 	l.addi r5,r3,956
    3230:	dc 03 10 b8 	l.sh 184(r3),r2
    3234:	18 40 00 00 	l.movhi r2,0x0
    3238:	d4 03 28 0c 	l.sw 12(r3),r5
    323c:	a8 42 4a 0c 	l.ori r2,r2,0x4a0c
    3240:	9c e3 02 ec 	l.addi r7,r3,748
    3244:	d4 02 20 00 	l.sw 0(r2),r4
    3248:	9c c3 03 54 	l.addi r6,r3,852
    324c:	9d 00 00 05 	l.addi r8,r0,5
    3250:	9c 80 00 00 	l.addi r4,r0,0
    3254:	9c a0 00 01 	l.addi r5,r0,1
    3258:	dc 03 c0 ac 	l.sh 172(r3),r24
    325c:	dc 03 b0 ae 	l.sh 174(r3),r22
    3260:	dc 03 a0 b0 	l.sh 176(r3),r20
    3264:	dc 03 90 b2 	l.sh 178(r3),r18
    3268:	dc 03 70 b4 	l.sh 180(r3),r14
    326c:	dc 03 40 b6 	l.sh 182(r3),r8
    3270:	d4 03 20 a4 	l.sw 164(r3),r4
    3274:	d4 03 28 a8 	l.sw 168(r3),r5
    3278:	d4 03 d0 34 	l.sw 52(r3),r26
    327c:	d4 03 38 04 	l.sw 4(r3),r7
    3280:	d4 03 30 08 	l.sw 8(r3),r6
    3284:	9c 21 00 2c 	l.addi r1,r1,44
    3288:	85 21 ff fc 	l.lwz r9,-4(r1)
    328c:	84 21 ff d4 	l.lwz r1,-44(r1)
    3290:	84 41 ff d8 	l.lwz r2,-40(r1)
    3294:	85 c1 ff dc 	l.lwz r14,-36(r1)
    3298:	86 41 ff e0 	l.lwz r18,-32(r1)
    329c:	86 81 ff e4 	l.lwz r20,-28(r1)
    32a0:	86 c1 ff e8 	l.lwz r22,-24(r1)
    32a4:	87 01 ff ec 	l.lwz r24,-20(r1)
    32a8:	87 41 ff f0 	l.lwz r26,-16(r1)
    32ac:	87 81 ff f4 	l.lwz r28,-12(r1)
    32b0:	44 00 48 00 	l.jr r9
    32b4:	87 c1 ff f8 	l.lwz r30,-8(r1)

000032b8 <_or1k_libc_getreent>:
    32b8:	18 60 00 00 	l.movhi r3,0x0
    32bc:	d7 e1 0f fc 	l.sw -4(r1),r1
    32c0:	a8 63 4a 0c 	l.ori r3,r3,0x4a0c
    32c4:	9c 21 ff fc 	l.addi r1,r1,-4
    32c8:	85 63 00 00 	l.lwz r11,0(r3)
    32cc:	9c 21 00 04 	l.addi r1,r1,4
    32d0:	44 00 48 00 	l.jr r9
    32d4:	84 21 ff fc 	l.lwz r1,-4(r1)

000032d8 <_or1k_reent_init>:
    32d8:	d7 e1 0f fc 	l.sw -4(r1),r1
    32dc:	9c 21 ff fc 	l.addi r1,r1,-4
    32e0:	9c 21 00 04 	l.addi r1,r1,4
    32e4:	44 00 48 00 	l.jr r9
    32e8:	84 21 ff fc 	l.lwz r1,-4(r1)

000032ec <_or1k_init>:
    32ec:	d7 e1 4f fc 	l.sw -4(r1),r9
    32f0:	d7 e1 0f f8 	l.sw -8(r1),r1
    32f4:	07 ff ff f9 	l.jal 32d8 <_or1k_reent_init>
    32f8:	9c 21 ff f8 	l.addi r1,r1,-8
    32fc:	18 80 00 00 	l.movhi r4,0x0
    3300:	18 60 00 00 	l.movhi r3,0x0
    3304:	a8 84 30 74 	l.ori r4,r4,0x3074
    3308:	a8 63 4a 24 	l.ori r3,r3,0x4a24
    330c:	d4 03 20 18 	l.sw 24(r3),r4
    3310:	9c 21 00 08 	l.addi r1,r1,8
    3314:	85 21 ff fc 	l.lwz r9,-4(r1)
    3318:	44 00 48 00 	l.jr r9
    331c:	84 21 ff f8 	l.lwz r1,-8(r1)

00003320 <or1k_critical_begin>:
    3320:	d7 e1 4f fc 	l.sw -4(r1),r9
    3324:	d7 e1 17 f8 	l.sw -8(r1),r2
    3328:	d7 e1 0f f4 	l.sw -12(r1),r1
    332c:	07 ff ff 32 	l.jal 2ff4 <or1k_interrupts_disable>
    3330:	9c 21 ff f4 	l.addi r1,r1,-12
    3334:	04 00 00 b7 	l.jal 3610 <or1k_timer_disable>
    3338:	a8 4b 00 00 	l.ori r2,r11,0x0
    333c:	9c 21 00 0c 	l.addi r1,r1,12
    3340:	e0 42 10 00 	l.add r2,r2,r2
    3344:	85 21 ff fc 	l.lwz r9,-4(r1)
    3348:	84 21 ff f4 	l.lwz r1,-12(r1)
    334c:	e1 62 58 04 	l.or r11,r2,r11
    3350:	44 00 48 00 	l.jr r9
    3354:	84 41 ff f8 	l.lwz r2,-8(r1)

00003358 <or1k_critical_end>:
    3358:	d7 e1 4f fc 	l.sw -4(r1),r9
    335c:	d7 e1 17 f8 	l.sw -8(r1),r2
    3360:	d7 e1 0f f4 	l.sw -12(r1),r1
    3364:	a8 43 00 00 	l.ori r2,r3,0x0
    3368:	9c 21 ff f4 	l.addi r1,r1,-12
    336c:	04 00 00 b7 	l.jal 3648 <or1k_timer_restore>
    3370:	a4 63 00 01 	l.andi r3,r3,0x1
    3374:	b8 62 00 41 	l.srli r3,r2,0x1
    3378:	07 ff ff 2d 	l.jal 302c <or1k_interrupts_restore>
    337c:	a4 63 00 01 	l.andi r3,r3,0x1
    3380:	9c 21 00 0c 	l.addi r1,r1,12
    3384:	85 21 ff fc 	l.lwz r9,-4(r1)
    3388:	84 21 ff f4 	l.lwz r1,-12(r1)
    338c:	44 00 48 00 	l.jr r9
    3390:	84 41 ff f8 	l.lwz r2,-8(r1)

00003394 <or1k_exception_handler_add>:
    3394:	9c 63 ff fe 	l.addi r3,r3,-2
    3398:	d7 e1 17 fc 	l.sw -4(r1),r2
    339c:	18 40 00 00 	l.movhi r2,0x0
    33a0:	b8 63 00 02 	l.slli r3,r3,0x2
    33a4:	a8 42 4a 24 	l.ori r2,r2,0x4a24
    33a8:	d7 e1 0f f8 	l.sw -8(r1),r1
    33ac:	e0 63 10 00 	l.add r3,r3,r2
    33b0:	9c 21 ff f8 	l.addi r1,r1,-8
    33b4:	d4 03 20 00 	l.sw 0(r3),r4
    33b8:	9c 21 00 08 	l.addi r1,r1,8
    33bc:	84 21 ff f8 	l.lwz r1,-8(r1)
    33c0:	44 00 48 00 	l.jr r9
    33c4:	84 41 ff fc 	l.lwz r2,-4(r1)

000033c8 <_or1k_timer_interrupt_handler>:
    33c8:	18 a0 00 00 	l.movhi r5,0x0
    33cc:	d7 e1 0f f8 	l.sw -8(r1),r1
    33d0:	a8 a5 4a 00 	l.ori r5,r5,0x4a00
    33d4:	d7 e1 17 fc 	l.sw -4(r1),r2
    33d8:	84 65 00 00 	l.lwz r3,0(r5)
    33dc:	9c 21 ff f8 	l.addi r1,r1,-8
    33e0:	9c 63 00 01 	l.addi r3,r3,1
    33e4:	9c 80 50 00 	l.addi r4,r0,20480
    33e8:	d4 05 18 00 	l.sw 0(r5),r3
    33ec:	b4 64 00 00 	l.mfspr r3,r4,0x0
    33f0:	18 40 3f ff 	l.movhi r2,0x3fff
    33f4:	a8 42 ff ff 	l.ori r2,r2,0xffff
    33f8:	e0 63 10 03 	l.and r3,r3,r2
    33fc:	18 40 60 00 	l.movhi r2,0x6000
    3400:	e0 63 10 04 	l.or r3,r3,r2
    3404:	c0 04 18 00 	l.mtspr r4,r3,0x0
    3408:	9c 21 00 08 	l.addi r1,r1,8
    340c:	84 21 ff f8 	l.lwz r1,-8(r1)
    3410:	44 00 48 00 	l.jr r9
    3414:	84 41 ff fc 	l.lwz r2,-4(r1)

00003418 <or1k_timer_init>:
    3418:	d7 e1 97 f8 	l.sw -8(r1),r18
    341c:	d7 e1 4f fc 	l.sw -4(r1),r9
    3420:	d7 e1 0f ec 	l.sw -20(r1),r1
    3424:	d7 e1 17 f0 	l.sw -16(r1),r2
    3428:	d7 e1 77 f4 	l.sw -12(r1),r14
    342c:	9e 40 00 01 	l.addi r18,r0,1
    3430:	9c 21 ff ec 	l.addi r1,r1,-20
    3434:	b4 b2 00 00 	l.mfspr r5,r18,0x0
    3438:	b8 a5 00 4a 	l.srli r5,r5,0xa
    343c:	e0 a5 90 03 	l.and r5,r5,r18
    3440:	bc 05 00 00 	l.sfeqi r5,0
    3444:	10 00 00 20 	l.bf 34c4 <or1k_timer_init+0xac>
    3448:	18 40 00 00 	l.movhi r2,0x0
    344c:	a8 83 00 00 	l.ori r4,r3,0x0
    3450:	a8 42 37 34 	l.ori r2,r2,0x3734
    3454:	19 c0 00 00 	l.movhi r14,0x0
    3458:	84 62 00 00 	l.lwz r3,0(r2)
    345c:	04 00 01 25 	l.jal 38f0 <__udivsi3>
    3460:	18 40 0f ff 	l.movhi r2,0xfff
    3464:	a8 42 ff ff 	l.ori r2,r2,0xffff
    3468:	a9 ce 4a 00 	l.ori r14,r14,0x4a00
    346c:	e1 6b 10 03 	l.and r11,r11,r2
    3470:	9c 40 50 00 	l.addi r2,r0,20480
    3474:	d4 0e 58 04 	l.sw 4(r14),r11
    3478:	c0 02 58 00 	l.mtspr r2,r11,0x0
    347c:	18 80 00 00 	l.movhi r4,0x0
    3480:	9c 40 00 00 	l.addi r2,r0,0
    3484:	9c 60 00 05 	l.addi r3,r0,5
    3488:	a8 84 33 c8 	l.ori r4,r4,0x33c8
    348c:	d4 0e 10 00 	l.sw 0(r14),r2
    3490:	07 ff ff c1 	l.jal 3394 <or1k_exception_handler_add>
    3494:	15 00 00 00 	l.nop 0x0
    3498:	9c 60 50 01 	l.addi r3,r0,20481
    349c:	d4 0e 90 08 	l.sw 8(r14),r18
    34a0:	c0 03 10 00 	l.mtspr r3,r2,0x0
    34a4:	a9 62 00 00 	l.ori r11,r2,0x0
    34a8:	9c 21 00 14 	l.addi r1,r1,20
    34ac:	85 21 ff fc 	l.lwz r9,-4(r1)
    34b0:	84 21 ff ec 	l.lwz r1,-20(r1)
    34b4:	84 41 ff f0 	l.lwz r2,-16(r1)
    34b8:	85 c1 ff f4 	l.lwz r14,-12(r1)
    34bc:	44 00 48 00 	l.jr r9
    34c0:	86 41 ff f8 	l.lwz r18,-8(r1)
    34c4:	03 ff ff f9 	l.j 34a8 <or1k_timer_init+0x90>
    34c8:	9d 60 ff ff 	l.addi r11,r0,-1

000034cc <or1k_timer_set_period>:
    34cc:	a8 83 00 00 	l.ori r4,r3,0x0
    34d0:	18 60 00 00 	l.movhi r3,0x0
    34d4:	d7 e1 17 f8 	l.sw -8(r1),r2
    34d8:	a8 63 37 34 	l.ori r3,r3,0x3734
    34dc:	18 40 0f ff 	l.movhi r2,0xfff
    34e0:	d7 e1 4f fc 	l.sw -4(r1),r9
    34e4:	d7 e1 0f f4 	l.sw -12(r1),r1
    34e8:	84 63 00 00 	l.lwz r3,0(r3)
    34ec:	9c 21 ff f4 	l.addi r1,r1,-12
    34f0:	04 00 01 00 	l.jal 38f0 <__udivsi3>
    34f4:	a8 42 ff ff 	l.ori r2,r2,0xffff
    34f8:	9c 80 50 00 	l.addi r4,r0,20480
    34fc:	e1 6b 10 03 	l.and r11,r11,r2
    3500:	b4 64 00 00 	l.mfspr r3,r4,0x0
    3504:	18 40 f0 00 	l.movhi r2,0xf000
    3508:	e0 63 10 03 	l.and r3,r3,r2
    350c:	e0 63 58 04 	l.or r3,r3,r11
    3510:	c0 04 18 00 	l.mtspr r4,r3,0x0
    3514:	18 60 00 00 	l.movhi r3,0x0
    3518:	a8 63 4a 00 	l.ori r3,r3,0x4a00
    351c:	d4 03 58 04 	l.sw 4(r3),r11
    3520:	9c 21 00 0c 	l.addi r1,r1,12
    3524:	85 21 ff fc 	l.lwz r9,-4(r1)
    3528:	84 21 ff f4 	l.lwz r1,-12(r1)
    352c:	44 00 48 00 	l.jr r9
    3530:	84 41 ff f8 	l.lwz r2,-8(r1)

00003534 <or1k_timer_set_handler>:
    3534:	d7 e1 4f fc 	l.sw -4(r1),r9
    3538:	d7 e1 0f f8 	l.sw -8(r1),r1
    353c:	a8 83 00 00 	l.ori r4,r3,0x0
    3540:	9c 21 ff f8 	l.addi r1,r1,-8
    3544:	07 ff ff 94 	l.jal 3394 <or1k_exception_handler_add>
    3548:	9c 60 00 05 	l.addi r3,r0,5
    354c:	9c 21 00 08 	l.addi r1,r1,8
    3550:	85 21 ff fc 	l.lwz r9,-4(r1)
    3554:	44 00 48 00 	l.jr r9
    3558:	84 21 ff f8 	l.lwz r1,-8(r1)

0000355c <or1k_timer_set_mode>:
    355c:	18 80 00 00 	l.movhi r4,0x0
    3560:	d7 e1 0f f8 	l.sw -8(r1),r1
    3564:	a8 84 4a 00 	l.ori r4,r4,0x4a00
    3568:	d7 e1 17 fc 	l.sw -4(r1),r2
    356c:	9c a0 50 00 	l.addi r5,r0,20480
    3570:	9c 21 ff f8 	l.addi r1,r1,-8
    3574:	d4 04 18 08 	l.sw 8(r4),r3
    3578:	b4 85 00 00 	l.mfspr r4,r5,0x0
    357c:	b8 c4 00 5e 	l.srli r6,r4,0x1e
    3580:	bc 06 00 00 	l.sfeqi r6,0
    3584:	10 00 00 07 	l.bf 35a0 <or1k_timer_set_mode+0x44>
    3588:	b8 63 00 1e 	l.slli r3,r3,0x1e
    358c:	18 40 3f ff 	l.movhi r2,0x3fff
    3590:	a8 42 ff ff 	l.ori r2,r2,0xffff
    3594:	e0 84 10 03 	l.and r4,r4,r2
    3598:	e0 64 18 04 	l.or r3,r4,r3
    359c:	c0 05 18 00 	l.mtspr r5,r3,0x0
    35a0:	9c 21 00 08 	l.addi r1,r1,8
    35a4:	84 21 ff f8 	l.lwz r1,-8(r1)
    35a8:	44 00 48 00 	l.jr r9
    35ac:	84 41 ff fc 	l.lwz r2,-4(r1)

000035b0 <or1k_timer_enable>:
    35b0:	d7 e1 0f f8 	l.sw -8(r1),r1
    35b4:	d7 e1 17 fc 	l.sw -4(r1),r2
    35b8:	9c a0 50 00 	l.addi r5,r0,20480
    35bc:	9c 21 ff f8 	l.addi r1,r1,-8
    35c0:	b4 65 00 00 	l.mfspr r3,r5,0x0
    35c4:	18 40 3f ff 	l.movhi r2,0x3fff
    35c8:	a8 42 ff ff 	l.ori r2,r2,0xffff
    35cc:	e0 83 10 03 	l.and r4,r3,r2
    35d0:	18 60 00 00 	l.movhi r3,0x0
    35d4:	18 40 20 00 	l.movhi r2,0x2000
    35d8:	a8 63 4a 00 	l.ori r3,r3,0x4a00
    35dc:	84 63 00 08 	l.lwz r3,8(r3)
    35e0:	b8 63 00 1e 	l.slli r3,r3,0x1e
    35e4:	e0 63 10 04 	l.or r3,r3,r2
    35e8:	e0 63 20 04 	l.or r3,r3,r4
    35ec:	c0 05 18 00 	l.mtspr r5,r3,0x0
    35f0:	9c 80 00 11 	l.addi r4,r0,17
    35f4:	b4 64 00 00 	l.mfspr r3,r4,0x0
    35f8:	a8 63 00 02 	l.ori r3,r3,0x2
    35fc:	c0 04 18 00 	l.mtspr r4,r3,0x0
    3600:	9c 21 00 08 	l.addi r1,r1,8
    3604:	84 21 ff f8 	l.lwz r1,-8(r1)
    3608:	44 00 48 00 	l.jr r9
    360c:	84 41 ff fc 	l.lwz r2,-4(r1)

00003610 <or1k_timer_disable>:
    3610:	d7 e1 0f f8 	l.sw -8(r1),r1
    3614:	d7 e1 17 fc 	l.sw -4(r1),r2
    3618:	9c 60 00 11 	l.addi r3,r0,17
    361c:	9c 21 ff f8 	l.addi r1,r1,-8
    3620:	b5 63 00 00 	l.mfspr r11,r3,0x0
    3624:	9c 40 ff fd 	l.addi r2,r0,-3
    3628:	e0 8b 10 03 	l.and r4,r11,r2
    362c:	c0 03 20 00 	l.mtspr r3,r4,0x0
    3630:	9c 21 00 08 	l.addi r1,r1,8
    3634:	b9 6b 00 41 	l.srli r11,r11,0x1
    3638:	84 21 ff f8 	l.lwz r1,-8(r1)
    363c:	a5 6b 00 01 	l.andi r11,r11,0x1
    3640:	44 00 48 00 	l.jr r9
    3644:	84 41 ff fc 	l.lwz r2,-4(r1)

00003648 <or1k_timer_restore>:
    3648:	d7 e1 0f fc 	l.sw -4(r1),r1
    364c:	9c 80 00 11 	l.addi r4,r0,17
    3650:	9c 21 ff fc 	l.addi r1,r1,-4
    3654:	b4 64 00 00 	l.mfspr r3,r4,0x0
    3658:	a8 63 00 02 	l.ori r3,r3,0x2
    365c:	c0 04 18 00 	l.mtspr r4,r3,0x0
    3660:	9c 21 00 04 	l.addi r1,r1,4
    3664:	44 00 48 00 	l.jr r9
    3668:	84 21 ff fc 	l.lwz r1,-4(r1)

0000366c <or1k_timer_pause>:
    366c:	d7 e1 0f f8 	l.sw -8(r1),r1
    3670:	d7 e1 17 fc 	l.sw -4(r1),r2
    3674:	9c 80 50 00 	l.addi r4,r0,20480
    3678:	9c 21 ff f8 	l.addi r1,r1,-8
    367c:	b4 64 00 00 	l.mfspr r3,r4,0x0
    3680:	18 40 3f ff 	l.movhi r2,0x3fff
    3684:	a8 42 ff ff 	l.ori r2,r2,0xffff
    3688:	e0 63 10 03 	l.and r3,r3,r2
    368c:	c0 04 18 00 	l.mtspr r4,r3,0x0
    3690:	9c 21 00 08 	l.addi r1,r1,8
    3694:	84 21 ff f8 	l.lwz r1,-8(r1)
    3698:	44 00 48 00 	l.jr r9
    369c:	84 41 ff fc 	l.lwz r2,-4(r1)

000036a0 <or1k_timer_reset>:
    36a0:	d7 e1 0f f8 	l.sw -8(r1),r1
    36a4:	d7 e1 17 fc 	l.sw -4(r1),r2
    36a8:	9c 80 50 00 	l.addi r4,r0,20480
    36ac:	9c 21 ff f8 	l.addi r1,r1,-8
    36b0:	b4 64 00 00 	l.mfspr r3,r4,0x0
    36b4:	18 40 ef ff 	l.movhi r2,0xefff
    36b8:	a8 42 ff ff 	l.ori r2,r2,0xffff
    36bc:	e0 63 10 03 	l.and r3,r3,r2
    36c0:	c0 04 18 00 	l.mtspr r4,r3,0x0
    36c4:	9c 80 00 00 	l.addi r4,r0,0
    36c8:	9c 60 50 01 	l.addi r3,r0,20481
    36cc:	c0 03 20 00 	l.mtspr r3,r4,0x0
    36d0:	9c 21 00 08 	l.addi r1,r1,8
    36d4:	84 21 ff f8 	l.lwz r1,-8(r1)
    36d8:	44 00 48 00 	l.jr r9
    36dc:	84 41 ff fc 	l.lwz r2,-4(r1)

000036e0 <or1k_timer_get_ticks>:
    36e0:	18 60 00 00 	l.movhi r3,0x0
    36e4:	d7 e1 0f fc 	l.sw -4(r1),r1
    36e8:	a8 63 4a 00 	l.ori r3,r3,0x4a00
    36ec:	9c 21 ff fc 	l.addi r1,r1,-4
    36f0:	85 63 00 00 	l.lwz r11,0(r3)
    36f4:	9c 21 00 04 	l.addi r1,r1,4
    36f8:	44 00 48 00 	l.jr r9
    36fc:	84 21 ff fc 	l.lwz r1,-4(r1)

00003700 <or1k_timer_reset_ticks>:
    3700:	18 60 00 00 	l.movhi r3,0x0
    3704:	d7 e1 17 fc 	l.sw -4(r1),r2
    3708:	a8 63 4a 00 	l.ori r3,r3,0x4a00
    370c:	9c 40 00 00 	l.addi r2,r0,0
    3710:	d7 e1 0f f8 	l.sw -8(r1),r1
    3714:	9c 21 ff f8 	l.addi r1,r1,-8
    3718:	d4 03 10 00 	l.sw 0(r3),r2
    371c:	9c 21 00 08 	l.addi r1,r1,8
    3720:	84 21 ff f8 	l.lwz r1,-8(r1)
    3724:	44 00 48 00 	l.jr r9
    3728:	84 41 ff fc 	l.lwz r2,-4(r1)

0000372c <_or1k_board_mem_base>:
    372c:	00 00 00 00 	l.j 372c <_or1k_board_mem_base>

00003730 <_or1k_board_mem_size>:
    3730:	00 80 00 00 	l.j 2003730 <_end+0x1ffec94>

00003734 <_or1k_board_clk_freq>:
    3734:	05 f5 e1 00 	l.jal 7d7bb34 <_end+0x7d77098>

00003738 <_or1k_board_uart_base>:
    3738:	00 00 00 00 	l.j 3738 <_or1k_board_uart_base>

0000373c <_or1k_board_uart_baud>:
    373c:	00 01 c2 00 	l.j 73f3c <_end+0x6f4a0>

00003740 <_or1k_board_uart_IRQ>:
    3740:	00 00 00 0d 	l.j 3774 <__errno+0x14>

00003744 <_or1k_board_exit>:
    3744:	15 00 00 0c 	l.nop 0xc
    3748:	00 00 00 00 	l.j 3748 <_or1k_board_exit+0x4>
    374c:	15 00 00 00 	l.nop 0x0

00003750 <_or1k_board_init_early>:
    3750:	44 00 48 00 	l.jr r9
    3754:	15 00 00 00 	l.nop 0x0

00003758 <_or1k_board_init>:
    3758:	44 00 48 00 	l.jr r9
    375c:	15 00 00 00 	l.nop 0x0

00003760 <__errno>:
    3760:	d7 e1 4f fc 	l.sw -4(r1),r9
    3764:	d7 e1 0f f8 	l.sw -8(r1),r1
    3768:	04 00 00 06 	l.jal 3780 <__getreent>
    376c:	9c 21 ff f8 	l.addi r1,r1,-8
    3770:	9c 21 00 08 	l.addi r1,r1,8
    3774:	85 21 ff fc 	l.lwz r9,-4(r1)
    3778:	44 00 48 00 	l.jr r9
    377c:	84 21 ff f8 	l.lwz r1,-8(r1)

00003780 <__getreent>:
    3780:	03 ff fe ce 	l.j 32b8 <_or1k_libc_getreent>
    3784:	15 00 00 00 	l.nop 0x0

00003788 <memset>:
    3788:	a4 c3 00 03 	l.andi r6,r3,0x3
    378c:	d7 e1 0f f8 	l.sw -8(r1),r1
    3790:	d7 e1 17 fc 	l.sw -4(r1),r2
    3794:	bc 06 00 00 	l.sfeqi r6,0
    3798:	10 00 00 54 	l.bf 38e8 <memset+0x160>
    379c:	9c 21 ff f8 	l.addi r1,r1,-8
    37a0:	bc 25 00 00 	l.sfnei r5,0
    37a4:	0c 00 00 4c 	l.bnf 38d4 <memset+0x14c>
    37a8:	9c a5 ff ff 	l.addi r5,r5,-1
    37ac:	b9 a4 00 18 	l.slli r13,r4,0x18
    37b0:	a8 e3 00 00 	l.ori r7,r3,0x0
    37b4:	a8 c3 00 00 	l.ori r6,r3,0x0
    37b8:	00 00 00 05 	l.j 37cc <memset+0x44>
    37bc:	b9 ad 00 98 	l.srai r13,r13,0x18
    37c0:	bc 05 00 00 	l.sfeqi r5,0
    37c4:	10 00 00 44 	l.bf 38d4 <memset+0x14c>
    37c8:	a8 ac 00 00 	l.ori r5,r12,0x0
    37cc:	9c c6 00 01 	l.addi r6,r6,1
    37d0:	d8 07 68 00 	l.sb 0(r7),r13
    37d4:	a5 06 00 03 	l.andi r8,r6,0x3
    37d8:	9d 85 ff ff 	l.addi r12,r5,-1
    37dc:	bc 28 00 00 	l.sfnei r8,0
    37e0:	13 ff ff f8 	l.bf 37c0 <memset+0x38>
    37e4:	9c e7 00 01 	l.addi r7,r7,1
    37e8:	bc a5 00 03 	l.sfleui r5,3
    37ec:	10 00 00 30 	l.bf 38ac <memset+0x124>
    37f0:	bc 05 00 00 	l.sfeqi r5,0
    37f4:	a4 e4 00 ff 	l.andi r7,r4,0xff
    37f8:	bc a5 00 0f 	l.sfleui r5,15
    37fc:	b9 07 00 08 	l.slli r8,r7,0x8
    3800:	e0 e8 38 04 	l.or r7,r8,r7
    3804:	b9 07 00 10 	l.slli r8,r7,0x10
    3808:	10 00 00 1b 	l.bf 3874 <memset+0xec>
    380c:	e0 e8 38 04 	l.or r7,r8,r7
    3810:	9e 25 ff f0 	l.addi r17,r5,-16
    3814:	9d 06 00 04 	l.addi r8,r6,4
    3818:	ba 31 00 44 	l.srli r17,r17,0x4
    381c:	9d e6 00 08 	l.addi r15,r6,8
    3820:	9d a6 00 0c 	l.addi r13,r6,12
    3824:	b9 71 00 04 	l.slli r11,r17,0x4
    3828:	a9 86 00 00 	l.ori r12,r6,0x0
    382c:	9d 6b 00 14 	l.addi r11,r11,20
    3830:	e1 66 58 00 	l.add r11,r6,r11
    3834:	d4 0c 38 00 	l.sw 0(r12),r7
    3838:	d4 08 38 00 	l.sw 0(r8),r7
    383c:	9d 08 00 10 	l.addi r8,r8,16
    3840:	d4 0f 38 00 	l.sw 0(r15),r7
    3844:	d4 0d 38 00 	l.sw 0(r13),r7
    3848:	e4 28 58 00 	l.sfne r8,r11
    384c:	9d 8c 00 10 	l.addi r12,r12,16
    3850:	9d ef 00 10 	l.addi r15,r15,16
    3854:	13 ff ff f8 	l.bf 3834 <memset+0xac>
    3858:	9d ad 00 10 	l.addi r13,r13,16
    385c:	9e 31 00 01 	l.addi r17,r17,1
    3860:	a4 a5 00 0f 	l.andi r5,r5,0xf
    3864:	ba 31 00 04 	l.slli r17,r17,0x4
    3868:	bc a5 00 03 	l.sfleui r5,3
    386c:	10 00 00 0f 	l.bf 38a8 <memset+0x120>
    3870:	e0 c6 88 00 	l.add r6,r6,r17
    3874:	a9 86 00 00 	l.ori r12,r6,0x0
    3878:	a9 05 00 00 	l.ori r8,r5,0x0
    387c:	9d 08 ff fc 	l.addi r8,r8,-4
    3880:	d4 0c 38 00 	l.sw 0(r12),r7
    3884:	bc 48 00 03 	l.sfgtui r8,3
    3888:	13 ff ff fd 	l.bf 387c <memset+0xf4>
    388c:	9d 8c 00 04 	l.addi r12,r12,4
    3890:	9c e5 ff fc 	l.addi r7,r5,-4
    3894:	9c 40 ff fc 	l.addi r2,r0,-4
    3898:	a4 a5 00 03 	l.andi r5,r5,0x3
    389c:	e0 e7 10 03 	l.and r7,r7,r2
    38a0:	9c e7 00 04 	l.addi r7,r7,4
    38a4:	e0 c6 38 00 	l.add r6,r6,r7
    38a8:	bc 05 00 00 	l.sfeqi r5,0
    38ac:	10 00 00 0a 	l.bf 38d4 <memset+0x14c>
    38b0:	15 00 00 00 	l.nop 0x0
    38b4:	b8 84 00 18 	l.slli r4,r4,0x18
    38b8:	e0 a6 28 00 	l.add r5,r6,r5
    38bc:	b8 84 00 98 	l.srai r4,r4,0x18
    38c0:	d8 06 20 00 	l.sb 0(r6),r4
    38c4:	9c c6 00 01 	l.addi r6,r6,1
    38c8:	e4 26 28 00 	l.sfne r6,r5
    38cc:	13 ff ff fd 	l.bf 38c0 <memset+0x138>
    38d0:	15 00 00 00 	l.nop 0x0
    38d4:	9c 21 00 08 	l.addi r1,r1,8
    38d8:	a9 63 00 00 	l.ori r11,r3,0x0
    38dc:	84 21 ff f8 	l.lwz r1,-8(r1)
    38e0:	44 00 48 00 	l.jr r9
    38e4:	84 41 ff fc 	l.lwz r2,-4(r1)
    38e8:	03 ff ff c0 	l.j 37e8 <memset+0x60>
    38ec:	a8 c3 00 00 	l.ori r6,r3,0x0

000038f0 <__udivsi3>:
    38f0:	9c 21 ff fc 	l.addi r1,r1,-4
    38f4:	d4 01 48 00 	l.sw 0(r1),r9
    38f8:	9d 60 00 00 	l.addi r11,r0,0
    38fc:	9d 04 00 00 	l.addi r8,r4,0
    3900:	9c a3 00 00 	l.addi r5,r3,0
    3904:	e4 28 58 00 	l.sfne r8,r11
    3908:	0c 00 00 36 	l.bnf 39e0 <__udivsi3+0xf0>
    390c:	9c e0 00 00 	l.addi r7,r0,0
    3910:	e4 48 28 00 	l.sfgtu r8,r5
    3914:	10 00 00 32 	l.bf 39dc <__udivsi3+0xec>
    3918:	e4 08 28 00 	l.sfeq r8,r5
    391c:	10 00 00 2e 	l.bf 39d4 <__udivsi3+0xe4>
    3920:	e4 8b 40 00 	l.sfltu r11,r8
    3924:	0c 00 00 0d 	l.bnf 3958 <__udivsi3+0x68>
    3928:	9d a0 00 20 	l.addi r13,r0,32
    392c:	19 20 80 00 	l.movhi r9,0x8000
    3930:	9c c0 ff ff 	l.addi r6,r0,-1
    3934:	e0 65 48 03 	l.and r3,r5,r9
    3938:	b8 87 00 01 	l.slli r4,r7,0x1
    393c:	9d e5 00 00 	l.addi r15,r5,0
    3940:	b8 63 00 5f 	l.srli r3,r3,0x1f
    3944:	e1 ad 30 00 	l.add r13,r13,r6
    3948:	e0 e4 18 04 	l.or r7,r4,r3
    394c:	e4 87 40 00 	l.sfltu r7,r8
    3950:	13 ff ff f9 	l.bf 3934 <__udivsi3+0x44>
    3954:	b8 a5 00 01 	l.slli r5,r5,0x1
    3958:	b8 e7 00 41 	l.srli r7,r7,0x1
    395c:	9d ad 00 01 	l.addi r13,r13,1
    3960:	9d 20 00 00 	l.addi r9,r0,0
    3964:	e4 89 68 00 	l.sfltu r9,r13
    3968:	0c 00 00 1e 	l.bnf 39e0 <__udivsi3+0xf0>
    396c:	9c af 00 00 	l.addi r5,r15,0
    3970:	19 e0 80 00 	l.movhi r15,0x8000
    3974:	9e 20 00 00 	l.addi r17,r0,0
    3978:	e0 65 78 03 	l.and r3,r5,r15
    397c:	b8 87 00 01 	l.slli r4,r7,0x1
    3980:	b8 63 00 5f 	l.srli r3,r3,0x1f
    3984:	e0 e4 18 04 	l.or r7,r4,r3
    3988:	e0 c7 40 02 	l.sub r6,r7,r8
    398c:	e0 66 78 03 	l.and r3,r6,r15
    3990:	b8 63 00 5f 	l.srli r3,r3,0x1f
    3994:	9c 80 00 00 	l.addi r4,r0,0
    3998:	e4 23 20 00 	l.sfne r3,r4
    399c:	10 00 00 03 	l.bf 39a8 <__udivsi3+0xb8>
    39a0:	b8 6b 00 01 	l.slli r3,r11,0x1
    39a4:	9c 80 00 01 	l.addi r4,r0,1
    39a8:	b8 a5 00 01 	l.slli r5,r5,0x1
    39ac:	e4 24 88 00 	l.sfne r4,r17
    39b0:	0c 00 00 03 	l.bnf 39bc <__udivsi3+0xcc>
    39b4:	e1 63 20 04 	l.or r11,r3,r4
    39b8:	9c e6 00 00 	l.addi r7,r6,0
    39bc:	9d 29 00 01 	l.addi r9,r9,1
    39c0:	e4 89 68 00 	l.sfltu r9,r13
    39c4:	13 ff ff ed 	l.bf 3978 <__udivsi3+0x88>
    39c8:	15 00 00 00 	l.nop 0x0
    39cc:	00 00 00 05 	l.j 39e0 <__udivsi3+0xf0>
    39d0:	15 00 00 00 	l.nop 0x0
    39d4:	00 00 00 03 	l.j 39e0 <__udivsi3+0xf0>
    39d8:	9d 60 00 01 	l.addi r11,r0,1
    39dc:	9c e5 00 00 	l.addi r7,r5,0
    39e0:	85 21 00 00 	l.lwz r9,0(r1)
    39e4:	44 00 48 00 	l.jr r9
    39e8:	9c 21 00 04 	l.addi r1,r1,4

000039ec <__do_global_ctors_aux>:
    39ec:	d7 e1 17 f8 	l.sw -8(r1),r2
    39f0:	18 40 00 00 	l.movhi r2,0x0
    39f4:	d7 e1 4f fc 	l.sw -4(r1),r9
    39f8:	a8 42 40 30 	l.ori r2,r2,0x4030
    39fc:	d7 e1 0f f4 	l.sw -12(r1),r1
    3a00:	84 62 ff fc 	l.lwz r3,-4(r2)
    3a04:	9c 21 ff f4 	l.addi r1,r1,-12
    3a08:	bc 23 ff ff 	l.sfnei r3,-1
    3a0c:	0c 00 00 08 	l.bnf 3a2c <__do_global_ctors_aux+0x40>
    3a10:	9c 42 ff fc 	l.addi r2,r2,-4
    3a14:	48 00 18 00 	l.jalr r3
    3a18:	9c 42 ff fc 	l.addi r2,r2,-4
    3a1c:	84 62 00 00 	l.lwz r3,0(r2)
    3a20:	bc 23 ff ff 	l.sfnei r3,-1
    3a24:	13 ff ff fc 	l.bf 3a14 <__do_global_ctors_aux+0x28>
    3a28:	15 00 00 00 	l.nop 0x0
    3a2c:	9c 21 00 0c 	l.addi r1,r1,12
    3a30:	85 21 ff fc 	l.lwz r9,-4(r1)
    3a34:	84 21 ff f4 	l.lwz r1,-12(r1)
    3a38:	44 00 48 00 	l.jr r9
    3a3c:	84 41 ff f8 	l.lwz r2,-8(r1)

00003a40 <call___do_global_ctors_aux>:
    3a40:	d7 e1 4f fc 	l.sw -4(r1),r9
    3a44:	d7 e1 0f f8 	l.sw -8(r1),r1
    3a48:	9c 21 ff f8 	l.addi r1,r1,-8
    3a4c:	9c 21 00 08 	l.addi r1,r1,8
    3a50:	85 21 ff fc 	l.lwz r9,-4(r1)
    3a54:	44 00 48 00 	l.jr r9
    3a58:	84 21 ff f8 	l.lwz r1,-8(r1)

Disassemblamento della sezione .fini:

00003a5c <_fini>:
    3a5c:	9c 21 ff fc 	l.addi r1,r1,-4
    3a60:	d4 01 48 00 	l.sw 0(r1),r9
    3a64:	07 ff f9 e9 	l.jal 2208 <__do_global_dtors_aux>
    3a68:	15 00 00 00 	l.nop 0x0
    3a6c:	85 21 00 00 	l.lwz r9,0(r1)
    3a70:	44 00 48 00 	l.jr r9
    3a74:	9c 21 00 04 	l.addi r1,r1,4
