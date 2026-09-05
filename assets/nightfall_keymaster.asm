
nightfall_keymaster:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <.init>:
    1000:	48 83 ec 08          	sub    $0x8,%rsp
    1004:	48 8b 05 c5 2f 00 00 	mov    0x2fc5(%rip),%rax        # 3fd0 <__cxa_finalize@plt+0x2eb0>
    100b:	48 85 c0             	test   %rax,%rax
    100e:	74 02                	je     1012 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x1e>
    1010:	ff d0                	call   *%rax
    1012:	48 83 c4 08          	add    $0x8,%rsp
    1016:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>:
    1020:	ff 35 ca 2f 00 00    	push   0x2fca(%rip)        # 3ff0 <__cxa_finalize@plt+0x2ed0>
    1026:	ff 25 cc 2f 00 00    	jmp    *0x2fcc(%rip)        # 3ff8 <__cxa_finalize@plt+0x2ed8>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt>:
    1030:	ff 25 ca 2f 00 00    	jmp    *0x2fca(%rip)        # 4000 <__cxa_finalize@plt+0x2ee0>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>

0000000000001040 <_ZNSt8ios_base15sync_with_stdioEb@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <__cxa_finalize@plt+0x2ee8>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>

0000000000001050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1ERKS4_@plt>:
    1050:	ff 25 ba 2f 00 00    	jmp    *0x2fba(%rip)        # 4010 <__cxa_finalize@plt+0x2ef0>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>

0000000000001060 <strlen@plt>:
    1060:	ff 25 b2 2f 00 00    	jmp    *0x2fb2(%rip)        # 4018 <__cxa_finalize@plt+0x2ef8>
    1066:	68 03 00 00 00       	push   $0x3
    106b:	e9 b0 ff ff ff       	jmp    1020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>

0000000000001070 <_ZSt19__throw_logic_errorPKc@plt>:
    1070:	ff 25 aa 2f 00 00    	jmp    *0x2faa(%rip)        # 4020 <__cxa_finalize@plt+0x2f00>
    1076:	68 04 00 00 00       	push   $0x4
    107b:	e9 a0 ff ff ff       	jmp    1020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>

0000000000001080 <memcpy@plt>:
    1080:	ff 25 a2 2f 00 00    	jmp    *0x2fa2(%rip)        # 4028 <__cxa_finalize@plt+0x2f08>
    1086:	68 05 00 00 00       	push   $0x5
    108b:	e9 90 ff ff ff       	jmp    1020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>

0000000000001090 <__cxa_atexit@plt>:
    1090:	ff 25 9a 2f 00 00    	jmp    *0x2f9a(%rip)        # 4030 <__cxa_finalize@plt+0x2f10>
    1096:	68 06 00 00 00       	push   $0x6
    109b:	e9 80 ff ff ff       	jmp    1020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>

00000000000010a0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>:
    10a0:	ff 25 92 2f 00 00    	jmp    *0x2f92(%rip)        # 4038 <__cxa_finalize@plt+0x2f18>
    10a6:	68 07 00 00 00       	push   $0x7
    10ab:	e9 70 ff ff ff       	jmp    1020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>

00000000000010b0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>:
    10b0:	ff 25 8a 2f 00 00    	jmp    *0x2f8a(%rip)        # 4040 <__cxa_finalize@plt+0x2f20>
    10b6:	68 08 00 00 00       	push   $0x8
    10bb:	e9 60 ff ff ff       	jmp    1020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>

00000000000010c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>:
    10c0:	ff 25 82 2f 00 00    	jmp    *0x2f82(%rip)        # 4048 <__cxa_finalize@plt+0x2f28>
    10c6:	68 09 00 00 00       	push   $0x9
    10cb:	e9 50 ff ff ff       	jmp    1020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>

00000000000010d0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEcm@plt>:
    10d0:	ff 25 7a 2f 00 00    	jmp    *0x2f7a(%rip)        # 4050 <__cxa_finalize@plt+0x2f30>
    10d6:	68 0a 00 00 00       	push   $0xa
    10db:	e9 40 ff ff ff       	jmp    1020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>

00000000000010e0 <_ZNSt8ios_base4InitC1Ev@plt>:
    10e0:	ff 25 72 2f 00 00    	jmp    *0x2f72(%rip)        # 4058 <__cxa_finalize@plt+0x2f38>
    10e6:	68 0b 00 00 00       	push   $0xb
    10eb:	e9 30 ff ff ff       	jmp    1020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>

00000000000010f0 <_Unwind_Resume@plt>:
    10f0:	ff 25 6a 2f 00 00    	jmp    *0x2f6a(%rip)        # 4060 <__cxa_finalize@plt+0x2f40>
    10f6:	68 0c 00 00 00       	push   $0xc
    10fb:	e9 20 ff ff ff       	jmp    1020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>

0000000000001100 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@plt>:
    1100:	ff 25 62 2f 00 00    	jmp    *0x2f62(%rip)        # 4068 <__cxa_finalize@plt+0x2f48>
    1106:	68 0d 00 00 00       	push   $0xd
    110b:	e9 10 ff ff ff       	jmp    1020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>

0000000000001110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm@plt>:
    1110:	ff 25 5a 2f 00 00    	jmp    *0x2f5a(%rip)        # 4070 <__cxa_finalize@plt+0x2f50>
    1116:	68 0e 00 00 00       	push   $0xe
    111b:	e9 00 ff ff ff       	jmp    1020 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt-0x10>

Disassembly of section .plt.got:

0000000000001120 <__cxa_finalize@plt>:
    1120:	ff 25 92 2e 00 00    	jmp    *0x2e92(%rip)        # 3fb8 <__cxa_finalize@plt+0x2e98>
    1126:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000001130 <.text>:
    1130:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    1135:	e8 86 ff ff ff       	call   10c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    113a:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
    113f:	e8 7c ff ff ff       	call   10c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    1144:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    1149:	e8 72 ff ff ff       	call   10c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    114e:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    1153:	e8 68 ff ff ff       	call   10c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    1158:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
    115d:	e8 5e ff ff ff       	call   10c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    1162:	48 89 df             	mov    %rbx,%rdi
    1165:	e8 86 ff ff ff       	call   10f0 <_Unwind_Resume@plt>
    116a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1170:	41 57                	push   %r15
    1172:	41 56                	push   %r14
    1174:	41 55                	push   %r13
    1176:	41 54                	push   %r12
    1178:	55                   	push   %rbp
    1179:	48 89 f5             	mov    %rsi,%rbp
    117c:	53                   	push   %rbx
    117d:	89 fb                	mov    %edi,%ebx
    117f:	31 ff                	xor    %edi,%edi
    1181:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
    1188:	e8 b3 fe ff ff       	call   1040 <_ZNSt8ios_base15sync_with_stdioEb@plt>
    118d:	48 c7 05 30 31 00 00 	movq   $0x0,0x3130(%rip)        # 42c8 <_ZSt3cin@GLIBCXX_3.4+0xe8>
    1194:	00 00 00 00 
    1198:	83 fb 01             	cmp    $0x1,%ebx
    119b:	0f 8e 1a 04 00 00    	jle    15bb <__cxa_finalize@plt+0x49b>
    11a1:	4c 8b 65 08          	mov    0x8(%rbp),%r12
    11a5:	48 8d 44 24 30       	lea    0x30(%rsp),%rax
    11aa:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    11af:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    11b4:	48 89 6c 24 30       	mov    %rbp,0x30(%rsp)
    11b9:	4d 85 e4             	test   %r12,%r12
    11bc:	0f 84 4c 04 00 00    	je     160e <__cxa_finalize@plt+0x4ee>
    11c2:	4c 89 e7             	mov    %r12,%rdi
    11c5:	e8 96 fe ff ff       	call   1060 <strlen@plt>
    11ca:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
    11d1:	00 
    11d2:	48 89 c3             	mov    %rax,%rbx
    11d5:	48 83 f8 0f          	cmp    $0xf,%rax
    11d9:	0f 87 c3 00 00 00    	ja     12a2 <__cxa_finalize@plt+0x182>
    11df:	48 83 f8 01          	cmp    $0x1,%rax
    11e3:	0f 85 e7 03 00 00    	jne    15d0 <__cxa_finalize@plt+0x4b0>
    11e9:	41 0f b6 04 24       	movzbl (%r12),%eax
    11ee:	88 44 24 40          	mov    %al,0x40(%rsp)
    11f2:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
    11f9:	00 
    11fa:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
    11ff:	45 31 ed             	xor    %r13d,%r13d
    1202:	4c 8d 74 24 60       	lea    0x60(%rsp),%r14
    1207:	48 8d 1d b2 0e 00 00 	lea    0xeb2(%rip),%rbx        # 20c0 <__cxa_finalize@plt+0xfa0>
    120e:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
    1213:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
    1218:	4c 8d 7b 0d          	lea    0xd(%rbx),%r15
    121c:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
    1220:	4c 89 f0             	mov    %r14,%rax
    1223:	4c 89 74 24 50       	mov    %r14,0x50(%rsp)
    1228:	48 c7 44 24 58 00 00 	movq   $0x0,0x58(%rsp)
    122f:	00 00 
    1231:	c6 44 24 60 00       	movb   $0x0,0x60(%rsp)
    1236:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
    123b:	eb 2c                	jmp    1269 <__cxa_finalize@plt+0x149>
    123d:	0f 1f 00             	nopl   (%rax)
    1240:	46 88 24 28          	mov    %r12b,(%rax,%r13,1)
    1244:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    1249:	48 83 c3 01          	add    $0x1,%rbx
    124d:	48 89 6c 24 58       	mov    %rbp,0x58(%rsp)
    1252:	c6 04 28 00          	movb   $0x0,(%rax,%rbp,1)
    1256:	49 39 df             	cmp    %rbx,%r15
    1259:	0f 84 91 00 00 00    	je     12f0 <__cxa_finalize@plt+0x1d0>
    125f:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
    1264:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    1269:	44 0f b6 23          	movzbl (%rbx),%r12d
    126d:	49 8d 6d 01          	lea    0x1(%r13),%rbp
    1271:	41 83 f4 aa          	xor    $0xffffffaa,%r12d
    1275:	4c 39 f0             	cmp    %r14,%rax
    1278:	74 66                	je     12e0 <__cxa_finalize@plt+0x1c0>
    127a:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
    127f:	48 39 ea             	cmp    %rbp,%rdx
    1282:	73 bc                	jae    1240 <__cxa_finalize@plt+0x120>
    1284:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    1289:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    128f:	31 c9                	xor    %ecx,%ecx
    1291:	31 d2                	xor    %edx,%edx
    1293:	4c 89 ee             	mov    %r13,%rsi
    1296:	e8 75 fe ff ff       	call   1110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm@plt>
    129b:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    12a0:	eb 9e                	jmp    1240 <__cxa_finalize@plt+0x120>
    12a2:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
    12a7:	48 8d 84 24 b0 00 00 	lea    0xb0(%rsp),%rax
    12ae:	00 
    12af:	31 d2                	xor    %edx,%edx
    12b1:	48 89 c6             	mov    %rax,%rsi
    12b4:	e8 47 fe ff ff       	call   1100 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@plt>
    12b9:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    12be:	48 89 c7             	mov    %rax,%rdi
    12c1:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
    12c8:	00 
    12c9:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    12ce:	48 89 da             	mov    %rbx,%rdx
    12d1:	4c 89 e6             	mov    %r12,%rsi
    12d4:	e8 a7 fd ff ff       	call   1080 <memcpy@plt>
    12d9:	e9 14 ff ff ff       	jmp    11f2 <__cxa_finalize@plt+0xd2>
    12de:	66 90                	xchg   %ax,%ax
    12e0:	ba 0f 00 00 00       	mov    $0xf,%edx
    12e5:	eb 98                	jmp    127f <__cxa_finalize@plt+0x15f>
    12e7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    12ee:	00 00 
    12f0:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    12f5:	48 3b 4c 24 38       	cmp    0x38(%rsp),%rcx
    12fa:	0f 85 e1 02 00 00    	jne    15e1 <__cxa_finalize@plt+0x4c1>
    1300:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    1305:	bb 37 13 ef be       	mov    $0xbeef1337,%ebx
    130a:	48 01 c1             	add    %rax,%rcx
    130d:	48 39 c8             	cmp    %rcx,%rax
    1310:	74 1a                	je     132c <__cxa_finalize@plt+0x20c>
    1312:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1318:	0f b6 10             	movzbl (%rax),%edx
    131b:	48 83 c0 01          	add    $0x1,%rax
    131f:	81 c2 34 12 00 00    	add    $0x1234,%edx
    1325:	31 d3                	xor    %edx,%ebx
    1327:	48 39 c1             	cmp    %rax,%rcx
    132a:	75 ec                	jne    1318 <__cxa_finalize@plt+0x1f8>
    132c:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
    1331:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    1336:	48 89 c7             	mov    %rax,%rdi
    1339:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    133e:	e8 0d fd ff ff       	call   1050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1ERKS4_@plt>
    1343:	31 c0                	xor    %eax,%eax
    1345:	48 83 7c 24 78 00    	cmpq   $0x0,0x78(%rsp)
    134b:	74 33                	je     1380 <__cxa_finalize@plt+0x260>
    134d:	0f 1f 00             	nopl   (%rax)
    1350:	69 db 0d 66 19 00    	imul   $0x19660d,%ebx,%ebx
    1356:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
    135b:	48 89 c1             	mov    %rax,%rcx
    135e:	83 e1 03             	and    $0x3,%ecx
    1361:	48 01 c2             	add    %rax,%rdx
    1364:	48 c1 e1 03          	shl    $0x3,%rcx
    1368:	48 83 c0 01          	add    $0x1,%rax
    136c:	81 c3 5f f3 6e 3c    	add    $0x3c6ef35f,%ebx
    1372:	89 de                	mov    %ebx,%esi
    1374:	d3 ee                	shr    %cl,%esi
    1376:	40 30 32             	xor    %sil,(%rdx)
    1379:	48 3b 44 24 78       	cmp    0x78(%rsp),%rax
    137e:	72 d0                	jb     1350 <__cxa_finalize@plt+0x230>
    1380:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    1385:	bb 37 13 ef be       	mov    $0xbeef1337,%ebx
    138a:	e8 e1 03 00 00       	call   1770 <__cxa_finalize@plt+0x650>
    138f:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    1394:	89 c5                	mov    %eax,%ebp
    1396:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    139b:	48 01 c1             	add    %rax,%rcx
    139e:	48 39 c1             	cmp    %rax,%rcx
    13a1:	74 19                	je     13bc <__cxa_finalize@plt+0x29c>
    13a3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    13a8:	0f b6 10             	movzbl (%rax),%edx
    13ab:	48 83 c0 01          	add    $0x1,%rax
    13af:	81 c2 34 12 00 00    	add    $0x1234,%edx
    13b5:	31 d3                	xor    %edx,%ebx
    13b7:	48 39 c1             	cmp    %rax,%rcx
    13ba:	75 ec                	jne    13a8 <__cxa_finalize@plt+0x288>
    13bc:	48 8d 84 24 90 00 00 	lea    0x90(%rsp),%rax
    13c3:	00 
    13c4:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    13c9:	48 89 c7             	mov    %rax,%rdi
    13cc:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
    13d1:	e8 7a fc ff ff       	call   1050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1ERKS4_@plt>
    13d6:	48 83 bc 24 98 00 00 	cmpq   $0x0,0x98(%rsp)
    13dd:	00 00 
    13df:	74 3d                	je     141e <__cxa_finalize@plt+0x2fe>
    13e1:	31 c0                	xor    %eax,%eax
    13e3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    13e8:	69 db 0d 66 19 00    	imul   $0x19660d,%ebx,%ebx
    13ee:	48 8b 94 24 90 00 00 	mov    0x90(%rsp),%rdx
    13f5:	00 
    13f6:	48 89 c1             	mov    %rax,%rcx
    13f9:	83 e1 03             	and    $0x3,%ecx
    13fc:	48 01 c2             	add    %rax,%rdx
    13ff:	48 c1 e1 03          	shl    $0x3,%rcx
    1403:	48 83 c0 01          	add    $0x1,%rax
    1407:	81 c3 5f f3 6e 3c    	add    $0x3c6ef35f,%ebx
    140d:	89 df                	mov    %ebx,%edi
    140f:	d3 ef                	shr    %cl,%edi
    1411:	40 30 3a             	xor    %dil,(%rdx)
    1414:	48 3b 84 24 98 00 00 	cmp    0x98(%rsp),%rax
    141b:	00 
    141c:	72 ca                	jb     13e8 <__cxa_finalize@plt+0x2c8>
    141e:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
    1423:	e8 48 03 00 00       	call   1770 <__cxa_finalize@plt+0x650>
    1428:	39 c5                	cmp    %eax,%ebp
    142a:	0f 85 c6 01 00 00    	jne    15f6 <__cxa_finalize@plt+0x4d6>
    1430:	31 c0                	xor    %eax,%eax
    1432:	4c 8d bc 24 c0 00 00 	lea    0xc0(%rsp),%r15
    1439:	00 
    143a:	81 f3 be ba fe ca    	xor    $0xcafebabe,%ebx
    1440:	31 ed                	xor    %ebp,%ebp
    1442:	48 89 84 24 b8 00 00 	mov    %rax,0xb8(%rsp)
    1449:	00 
    144a:	48 8d 84 24 b0 00 00 	lea    0xb0(%rsp),%rax
    1451:	00 
    1452:	4c 89 bc 24 b0 00 00 	mov    %r15,0xb0(%rsp)
    1459:	00 
    145a:	c6 84 24 c0 00 00 00 	movb   $0x0,0xc0(%rsp)
    1461:	00 
    1462:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    1467:	eb 2f                	jmp    1498 <__cxa_finalize@plt+0x378>
    1469:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1470:	46 88 2c 20          	mov    %r13b,(%rax,%r12,1)
    1474:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
    147b:	00 
    147c:	48 83 c5 01          	add    $0x1,%rbp
    1480:	4c 89 b4 24 b8 00 00 	mov    %r14,0xb8(%rsp)
    1487:	00 
    1488:	42 c6 44 20 01 00    	movb   $0x0,0x1(%rax,%r12,1)
    148e:	48 83 fd 20          	cmp    $0x20,%rbp
    1492:	0f 84 7f 00 00 00    	je     1517 <__cxa_finalize@plt+0x3f7>
    1498:	69 db 0d 66 19 00    	imul   $0x19660d,%ebx,%ebx
    149e:	48 89 e9             	mov    %rbp,%rcx
    14a1:	48 8d 05 f8 0b 00 00 	lea    0xbf8(%rip),%rax        # 20a0 <__cxa_finalize@plt+0xf80>
    14a8:	4c 8b a4 24 b8 00 00 	mov    0xb8(%rsp),%r12
    14af:	00 
    14b0:	83 e1 03             	and    $0x3,%ecx
    14b3:	48 c1 e1 03          	shl    $0x3,%rcx
    14b7:	4d 8d 74 24 01       	lea    0x1(%r12),%r14
    14bc:	81 c3 5f f3 6e 3c    	add    $0x3c6ef35f,%ebx
    14c2:	41 89 dd             	mov    %ebx,%r13d
    14c5:	41 d3 ed             	shr    %cl,%r13d
    14c8:	44 32 2c 28          	xor    (%rax,%rbp,1),%r13b
    14cc:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
    14d3:	00 
    14d4:	4c 39 f8             	cmp    %r15,%rax
    14d7:	74 37                	je     1510 <__cxa_finalize@plt+0x3f0>
    14d9:	48 8b 94 24 c0 00 00 	mov    0xc0(%rsp),%rdx
    14e0:	00 
    14e1:	4c 39 f2             	cmp    %r14,%rdx
    14e4:	73 8a                	jae    1470 <__cxa_finalize@plt+0x350>
    14e6:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    14eb:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    14f1:	31 c9                	xor    %ecx,%ecx
    14f3:	31 d2                	xor    %edx,%edx
    14f5:	4c 89 e6             	mov    %r12,%rsi
    14f8:	e8 13 fc ff ff       	call   1110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm@plt>
    14fd:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
    1504:	00 
    1505:	e9 66 ff ff ff       	jmp    1470 <__cxa_finalize@plt+0x350>
    150a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1510:	ba 0f 00 00 00       	mov    $0xf,%edx
    1515:	eb ca                	jmp    14e1 <__cxa_finalize@plt+0x3c1>
    1517:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    151c:	31 f6                	xor    %esi,%esi
    151e:	31 d2                	xor    %edx,%edx
    1520:	48 89 df             	mov    %rbx,%rdi
    1523:	e8 a8 fb ff ff       	call   10d0 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEcm@plt>
    1528:	48 89 c6             	mov    %rax,%rsi
    152b:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    152f:	74 0a                	je     153b <__cxa_finalize@plt+0x41b>
    1531:	31 d2                	xor    %edx,%edx
    1533:	48 89 df             	mov    %rbx,%rdi
    1536:	e8 f5 fa ff ff       	call   1030 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt>
    153b:	48 8d 35 3e 0b 00 00 	lea    0xb3e(%rip),%rsi        # 2080 <__cxa_finalize@plt+0xf60>
    1542:	48 8d 3d 77 2b 00 00 	lea    0x2b77(%rip),%rdi        # 40c0 <_ZSt4cout@GLIBCXX_3.4>
    1549:	e8 52 fb ff ff       	call   10a0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    154e:	48 8b 94 24 b8 00 00 	mov    0xb8(%rsp),%rdx
    1555:	00 
    1556:	48 8b b4 24 b0 00 00 	mov    0xb0(%rsp),%rsi
    155d:	00 
    155e:	48 89 c7             	mov    %rax,%rdi
    1561:	e8 4a fb ff ff       	call   10b0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    1566:	48 89 c7             	mov    %rax,%rdi
    1569:	48 8d 35 0e 0b 00 00 	lea    0xb0e(%rip),%rsi        # 207e <__cxa_finalize@plt+0xf5e>
    1570:	e8 2b fb ff ff       	call   10a0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1575:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    157a:	e8 41 fb ff ff       	call   10c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    157f:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
    1584:	e8 37 fb ff ff       	call   10c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    1589:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    158e:	e8 2d fb ff ff       	call   10c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    1593:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    1598:	e8 23 fb ff ff       	call   10c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    159d:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
    15a2:	e8 19 fb ff ff       	call   10c0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    15a7:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
    15ae:	31 c0                	xor    %eax,%eax
    15b0:	5b                   	pop    %rbx
    15b1:	5d                   	pop    %rbp
    15b2:	41 5c                	pop    %r12
    15b4:	41 5d                	pop    %r13
    15b6:	41 5e                	pop    %r14
    15b8:	41 5f                	pop    %r15
    15ba:	c3                   	ret
    15bb:	48 8d 35 46 0a 00 00 	lea    0xa46(%rip),%rsi        # 2008 <__cxa_finalize@plt+0xee8>
    15c2:	48 8d 3d f7 2a 00 00 	lea    0x2af7(%rip),%rdi        # 40c0 <_ZSt4cout@GLIBCXX_3.4>
    15c9:	e8 d2 fa ff ff       	call   10a0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    15ce:	eb d7                	jmp    15a7 <__cxa_finalize@plt+0x487>
    15d0:	48 85 c0             	test   %rax,%rax
    15d3:	0f 84 19 fc ff ff    	je     11f2 <__cxa_finalize@plt+0xd2>
    15d9:	48 89 ef             	mov    %rbp,%rdi
    15dc:	e9 ed fc ff ff       	jmp    12ce <__cxa_finalize@plt+0x1ae>
    15e1:	48 8d 35 7a 0a 00 00 	lea    0xa7a(%rip),%rsi        # 2062 <__cxa_finalize@plt+0xf42>
    15e8:	48 8d 3d d1 2a 00 00 	lea    0x2ad1(%rip),%rdi        # 40c0 <_ZSt4cout@GLIBCXX_3.4>
    15ef:	e8 ac fa ff ff       	call   10a0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    15f4:	eb 9d                	jmp    1593 <__cxa_finalize@plt+0x473>
    15f6:	48 8d 35 73 0a 00 00 	lea    0xa73(%rip),%rsi        # 2070 <__cxa_finalize@plt+0xf50>
    15fd:	48 8d 3d bc 2a 00 00 	lea    0x2abc(%rip),%rdi        # 40c0 <_ZSt4cout@GLIBCXX_3.4>
    1604:	e8 97 fa ff ff       	call   10a0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1609:	e9 71 ff ff ff       	jmp    157f <__cxa_finalize@plt+0x45f>
    160e:	48 8d 3d 1b 0a 00 00 	lea    0xa1b(%rip),%rdi        # 2030 <__cxa_finalize@plt+0xf10>
    1615:	e8 56 fa ff ff       	call   1070 <_ZSt19__throw_logic_errorPKc@plt>
    161a:	48 89 c3             	mov    %rax,%rbx
    161d:	e9 18 fb ff ff       	jmp    113a <__cxa_finalize@plt+0x1a>
    1622:	48 89 c3             	mov    %rax,%rbx
    1625:	e9 06 fb ff ff       	jmp    1130 <__cxa_finalize@plt+0x10>
    162a:	48 89 c3             	mov    %rax,%rbx
    162d:	e9 1c fb ff ff       	jmp    114e <__cxa_finalize@plt+0x2e>
    1632:	48 89 c3             	mov    %rax,%rbx
    1635:	e9 0a fb ff ff       	jmp    1144 <__cxa_finalize@plt+0x24>
    163a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1640:	53                   	push   %rbx
    1641:	48 8d 1d b1 2c 00 00 	lea    0x2cb1(%rip),%rbx        # 42f9 <_ZSt3cin@GLIBCXX_3.4+0x119>
    1648:	48 89 df             	mov    %rbx,%rdi
    164b:	e8 90 fa ff ff       	call   10e0 <_ZNSt8ios_base4InitC1Ev@plt>
    1650:	48 8b 3d 89 29 00 00 	mov    0x2989(%rip),%rdi        # 3fe0 <__cxa_finalize@plt+0x2ec0>
    1657:	48 89 de             	mov    %rbx,%rsi
    165a:	5b                   	pop    %rbx
    165b:	48 8d 15 1e 2a 00 00 	lea    0x2a1e(%rip),%rdx        # 4080 <__cxa_finalize@plt+0x2f60>
    1662:	e9 29 fa ff ff       	jmp    1090 <__cxa_atexit@plt>
    1667:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    166e:	00 00 
    1670:	31 ed                	xor    %ebp,%ebp
    1672:	49 89 d1             	mov    %rdx,%r9
    1675:	5e                   	pop    %rsi
    1676:	48 89 e2             	mov    %rsp,%rdx
    1679:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    167d:	50                   	push   %rax
    167e:	54                   	push   %rsp
    167f:	45 31 c0             	xor    %r8d,%r8d
    1682:	31 c9                	xor    %ecx,%ecx
    1684:	48 8d 3d e5 fa ff ff 	lea    -0x51b(%rip),%rdi        # 1170 <__cxa_finalize@plt+0x50>
    168b:	ff 15 2f 29 00 00    	call   *0x292f(%rip)        # 3fc0 <__cxa_finalize@plt+0x2ea0>
    1691:	f4                   	hlt
    1692:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    1699:	00 00 00 
    169c:	0f 1f 40 00          	nopl   0x0(%rax)
    16a0:	48 8d 3d e9 29 00 00 	lea    0x29e9(%rip),%rdi        # 4090 <__cxa_finalize@plt+0x2f70>
    16a7:	48 8d 05 e2 29 00 00 	lea    0x29e2(%rip),%rax        # 4090 <__cxa_finalize@plt+0x2f70>
    16ae:	48 39 f8             	cmp    %rdi,%rax
    16b1:	74 15                	je     16c8 <__cxa_finalize@plt+0x5a8>
    16b3:	48 8b 05 0e 29 00 00 	mov    0x290e(%rip),%rax        # 3fc8 <__cxa_finalize@plt+0x2ea8>
    16ba:	48 85 c0             	test   %rax,%rax
    16bd:	74 09                	je     16c8 <__cxa_finalize@plt+0x5a8>
    16bf:	ff e0                	jmp    *%rax
    16c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    16c8:	c3                   	ret
    16c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    16d0:	48 8d 3d b9 29 00 00 	lea    0x29b9(%rip),%rdi        # 4090 <__cxa_finalize@plt+0x2f70>
    16d7:	48 8d 35 b2 29 00 00 	lea    0x29b2(%rip),%rsi        # 4090 <__cxa_finalize@plt+0x2f70>
    16de:	48 29 fe             	sub    %rdi,%rsi
    16e1:	48 89 f0             	mov    %rsi,%rax
    16e4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    16e8:	48 c1 f8 03          	sar    $0x3,%rax
    16ec:	48 01 c6             	add    %rax,%rsi
    16ef:	48 d1 fe             	sar    $1,%rsi
    16f2:	74 14                	je     1708 <__cxa_finalize@plt+0x5e8>
    16f4:	48 8b 05 dd 28 00 00 	mov    0x28dd(%rip),%rax        # 3fd8 <__cxa_finalize@plt+0x2eb8>
    16fb:	48 85 c0             	test   %rax,%rax
    16fe:	74 08                	je     1708 <__cxa_finalize@plt+0x5e8>
    1700:	ff e0                	jmp    *%rax
    1702:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1708:	c3                   	ret
    1709:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1710:	f3 0f 1e fa          	endbr64
    1714:	80 3d dd 2b 00 00 00 	cmpb   $0x0,0x2bdd(%rip)        # 42f8 <_ZSt3cin@GLIBCXX_3.4+0x118>
    171b:	75 2b                	jne    1748 <__cxa_finalize@plt+0x628>
    171d:	55                   	push   %rbp
    171e:	48 83 3d 92 28 00 00 	cmpq   $0x0,0x2892(%rip)        # 3fb8 <__cxa_finalize@plt+0x2e98>
    1725:	00 
    1726:	48 89 e5             	mov    %rsp,%rbp
    1729:	74 0c                	je     1737 <__cxa_finalize@plt+0x617>
    172b:	48 8b 3d 4e 29 00 00 	mov    0x294e(%rip),%rdi        # 4080 <__cxa_finalize@plt+0x2f60>
    1732:	e8 e9 f9 ff ff       	call   1120 <__cxa_finalize@plt>
    1737:	e8 64 ff ff ff       	call   16a0 <__cxa_finalize@plt+0x580>
    173c:	c6 05 b5 2b 00 00 01 	movb   $0x1,0x2bb5(%rip)        # 42f8 <_ZSt3cin@GLIBCXX_3.4+0x118>
    1743:	5d                   	pop    %rbp
    1744:	c3                   	ret
    1745:	0f 1f 00             	nopl   (%rax)
    1748:	c3                   	ret
    1749:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1750:	f3 0f 1e fa          	endbr64
    1754:	e9 77 ff ff ff       	jmp    16d0 <__cxa_finalize@plt+0x5b0>
    1759:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1760:	69 07 0d 66 19 00    	imul   $0x19660d,(%rdi),%eax
    1766:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    176b:	89 07                	mov    %eax,(%rdi)
    176d:	c3                   	ret
    176e:	66 90                	xchg   %ax,%ax
    1770:	48 8b 77 08          	mov    0x8(%rdi),%rsi
    1774:	48 85 f6             	test   %rsi,%rsi
    1777:	74 37                	je     17b0 <__cxa_finalize@plt+0x690>
    1779:	48 8b 3f             	mov    (%rdi),%rdi
    177c:	31 c9                	xor    %ecx,%ecx
    177e:	ba ef be ad de       	mov    $0xdeadbeef,%edx
    1783:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    1788:	0f b6 04 0f          	movzbl (%rdi,%rcx,1),%eax
    178c:	c1 c2 05             	rol    $0x5,%edx
    178f:	31 c2                	xor    %eax,%edx
    1791:	8d 04 c9             	lea    (%rcx,%rcx,8),%eax
    1794:	48 83 c1 01          	add    $0x1,%rcx
    1798:	01 c2                	add    %eax,%edx
    179a:	48 39 f1             	cmp    %rsi,%rcx
    179d:	75 e9                	jne    1788 <__cxa_finalize@plt+0x668>
    179f:	89 d0                	mov    %edx,%eax
    17a1:	c1 e8 10             	shr    $0x10,%eax
    17a4:	31 d0                	xor    %edx,%eax
    17a6:	c3                   	ret
    17a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    17ae:	00 00 
    17b0:	b8 42 60 ad de       	mov    $0xdead6042,%eax
    17b5:	c3                   	ret

Disassembly of section .fini:

00000000000017b8 <.fini>:
    17b8:	48 83 ec 08          	sub    $0x8,%rsp
    17bc:	48 83 c4 08          	add    $0x8,%rsp
    17c0:	c3                   	ret
