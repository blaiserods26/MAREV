
night_cipher_game:     file format elf64-x86-64


Disassembly of section .init:

0000000000002000 <_init>:
    2000:	48 83 ec 08          	sub    $0x8,%rsp
    2004:	48 8b 05 cd 4f 00 00 	mov    0x4fcd(%rip),%rax        # 6fd8 <__gmon_start__@Base>
    200b:	48 85 c0             	test   %rax,%rax
    200e:	74 02                	je     2012 <_init+0x12>
    2010:	ff d0                	call   *%rax
    2012:	48 83 c4 08          	add    $0x8,%rsp
    2016:	c3                   	ret

Disassembly of section .plt:

0000000000002020 <isspace@plt-0x10>:
    2020:	ff 35 ca 4f 00 00    	push   0x4fca(%rip)        # 6ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    2026:	ff 25 cc 4f 00 00    	jmp    *0x4fcc(%rip)        # 6ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    202c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000002030 <isspace@plt>:
    2030:	ff 25 ca 4f 00 00    	jmp    *0x4fca(%rip)        # 7000 <isspace@GLIBC_2.2.5>
    2036:	68 00 00 00 00       	push   $0x0
    203b:	e9 e0 ff ff ff       	jmp    2020 <_init+0x20>

0000000000002040 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt>:
    2040:	ff 25 c2 4f 00 00    	jmp    *0x4fc2(%rip)        # 7008 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@GLIBCXX_3.4.21>
    2046:	68 01 00 00 00       	push   $0x1
    204b:	e9 d0 ff ff ff       	jmp    2020 <_init+0x20>

0000000000002050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm@plt>:
    2050:	ff 25 ba 4f 00 00    	jmp    *0x4fba(%rip)        # 7010 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm@GLIBCXX_3.4.21>
    2056:	68 02 00 00 00       	push   $0x2
    205b:	e9 c0 ff ff ff       	jmp    2020 <_init+0x20>

0000000000002060 <_ZNSt8ios_base15sync_with_stdioEb@plt>:
    2060:	ff 25 b2 4f 00 00    	jmp    *0x4fb2(%rip)        # 7018 <_ZNSt8ios_base15sync_with_stdioEb@GLIBCXX_3.4>
    2066:	68 03 00 00 00       	push   $0x3
    206b:	e9 b0 ff ff ff       	jmp    2020 <_init+0x20>

0000000000002070 <_ZSt20__throw_length_errorPKc@plt>:
    2070:	ff 25 aa 4f 00 00    	jmp    *0x4faa(%rip)        # 7020 <_ZSt20__throw_length_errorPKc@GLIBCXX_3.4>
    2076:	68 04 00 00 00       	push   $0x4
    207b:	e9 a0 ff ff ff       	jmp    2020 <_init+0x20>

0000000000002080 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_@plt>:
    2080:	ff 25 a2 4f 00 00    	jmp    *0x4fa2(%rip)        # 7028 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_@GLIBCXX_3.4.21>
    2086:	68 05 00 00 00       	push   $0x5
    208b:	e9 90 ff ff ff       	jmp    2020 <_init+0x20>

0000000000002090 <_ZNSo5flushEv@plt>:
    2090:	ff 25 9a 4f 00 00    	jmp    *0x4f9a(%rip)        # 7030 <_ZNSo5flushEv@GLIBCXX_3.4>
    2096:	68 06 00 00 00       	push   $0x6
    209b:	e9 80 ff ff ff       	jmp    2020 <_init+0x20>

00000000000020a0 <memcpy@plt>:
    20a0:	ff 25 92 4f 00 00    	jmp    *0x4f92(%rip)        # 7038 <memcpy@GLIBC_2.14>
    20a6:	68 07 00 00 00       	push   $0x7
    20ab:	e9 70 ff ff ff       	jmp    2020 <_init+0x20>

00000000000020b0 <__cxa_atexit@plt>:
    20b0:	ff 25 8a 4f 00 00    	jmp    *0x4f8a(%rip)        # 7040 <__cxa_atexit@GLIBC_2.2.5>
    20b6:	68 08 00 00 00       	push   $0x8
    20bb:	e9 60 ff ff ff       	jmp    2020 <_init+0x20>

00000000000020c0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>:
    20c0:	ff 25 82 4f 00 00    	jmp    *0x4f82(%rip)        # 7048 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@GLIBCXX_3.4>
    20c6:	68 09 00 00 00       	push   $0x9
    20cb:	e9 50 ff ff ff       	jmp    2020 <_init+0x20>

00000000000020d0 <_Znwm@plt>:
    20d0:	ff 25 7a 4f 00 00    	jmp    *0x4f7a(%rip)        # 7050 <_Znwm@GLIBCXX_3.4>
    20d6:	68 0a 00 00 00       	push   $0xa
    20db:	e9 40 ff ff ff       	jmp    2020 <_init+0x20>

00000000000020e0 <_ZdlPvm@plt>:
    20e0:	ff 25 72 4f 00 00    	jmp    *0x4f72(%rip)        # 7058 <_ZdlPvm@CXXABI_1.3.9>
    20e6:	68 0b 00 00 00       	push   $0xb
    20eb:	e9 30 ff ff ff       	jmp    2020 <_init+0x20>

00000000000020f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>:
    20f0:	ff 25 6a 4f 00 00    	jmp    *0x4f6a(%rip)        # 7060 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@GLIBCXX_3.4.9>
    20f6:	68 0c 00 00 00       	push   $0xc
    20fb:	e9 20 ff ff ff       	jmp    2020 <_init+0x20>

0000000000002100 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>:
    2100:	ff 25 62 4f 00 00    	jmp    *0x4f62(%rip)        # 7068 <_ZNKSt5ctypeIcE13_M_widen_initEv@GLIBCXX_3.4.11>
    2106:	68 0d 00 00 00       	push   $0xd
    210b:	e9 10 ff ff ff       	jmp    2020 <_init+0x20>

0000000000002110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>:
    2110:	ff 25 5a 4f 00 00    	jmp    *0x4f5a(%rip)        # 7070 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@GLIBCXX_3.4.21>
    2116:	68 0e 00 00 00       	push   $0xe
    211b:	e9 00 ff ff ff       	jmp    2020 <_init+0x20>

0000000000002120 <_ZSt16__throw_bad_castv@plt>:
    2120:	ff 25 52 4f 00 00    	jmp    *0x4f52(%rip)        # 7078 <_ZSt16__throw_bad_castv@GLIBCXX_3.4>
    2126:	68 0f 00 00 00       	push   $0xf
    212b:	e9 f0 fe ff ff       	jmp    2020 <_init+0x20>

0000000000002130 <_ZSt24__throw_out_of_range_fmtPKcz@plt>:
    2130:	ff 25 4a 4f 00 00    	jmp    *0x4f4a(%rip)        # 7080 <_ZSt24__throw_out_of_range_fmtPKcz@GLIBCXX_3.4.20>
    2136:	68 10 00 00 00       	push   $0x10
    213b:	e9 e0 fe ff ff       	jmp    2020 <_init+0x20>

0000000000002140 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm@plt>:
    2140:	ff 25 42 4f 00 00    	jmp    *0x4f42(%rip)        # 7088 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm@GLIBCXX_3.4.21>
    2146:	68 11 00 00 00       	push   $0x11
    214b:	e9 d0 fe ff ff       	jmp    2020 <_init+0x20>

0000000000002150 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm@plt>:
    2150:	ff 25 3a 4f 00 00    	jmp    *0x4f3a(%rip)        # 7090 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm@GLIBCXX_3.4.21>
    2156:	68 12 00 00 00       	push   $0x12
    215b:	e9 c0 fe ff ff       	jmp    2020 <_init+0x20>

0000000000002160 <_Unwind_Resume@plt>:
    2160:	ff 25 32 4f 00 00    	jmp    *0x4f32(%rip)        # 7098 <_Unwind_Resume@GCC_3.0>
    2166:	68 13 00 00 00       	push   $0x13
    216b:	e9 b0 fe ff ff       	jmp    2020 <_init+0x20>

0000000000002170 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@plt>:
    2170:	ff 25 2a 4f 00 00    	jmp    *0x4f2a(%rip)        # 70a0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@GLIBCXX_3.4.21>
    2176:	68 14 00 00 00       	push   $0x14
    217b:	e9 a0 fe ff ff       	jmp    2020 <_init+0x20>

0000000000002180 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm@plt>:
    2180:	ff 25 22 4f 00 00    	jmp    *0x4f22(%rip)        # 70a8 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm@GLIBCXX_3.4.21>
    2186:	68 15 00 00 00       	push   $0x15
    218b:	e9 90 fe ff ff       	jmp    2020 <_init+0x20>

0000000000002190 <_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EES4_@plt>:
    2190:	ff 25 1a 4f 00 00    	jmp    *0x4f1a(%rip)        # 70b0 <_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EES4_@GLIBCXX_3.4.21>
    2196:	68 16 00 00 00       	push   $0x16
    219b:	e9 80 fe ff ff       	jmp    2020 <_init+0x20>

Disassembly of section .plt.got:

00000000000021a0 <__cxa_finalize@plt>:
    21a0:	ff 25 12 4e 00 00    	jmp    *0x4e12(%rip)        # 6fb8 <__cxa_finalize@GLIBC_2.2.5>
    21a6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000000021c0 <_Z20xor_decrypt_with_keyB5cxx11PKhmRKSt6vectorIhSaIhEE.cold>:
    21c0:	48 89 df             	mov    %rbx,%rdi
    21c3:	e8 48 ff ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    21c8:	48 89 ef             	mov    %rbp,%rdi
    21cb:	e8 90 ff ff ff       	call   2160 <_Unwind_Resume@plt>

00000000000021d0 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>:
    21d0:	4c 89 e1             	mov    %r12,%rcx
    21d3:	4c 89 fa             	mov    %r15,%rdx
    21d6:	48 8d 35 27 2e 00 00 	lea    0x2e27(%rip),%rsi        # 5004 <_IO_stdin_used+0x4>
    21dd:	31 c0                	xor    %eax,%eax
    21df:	48 8d 3d 8a 2f 00 00 	lea    0x2f8a(%rip),%rdi        # 5170 <_IO_stdin_used+0x170>
    21e6:	e8 45 ff ff ff       	call   2130 <_ZSt24__throw_out_of_range_fmtPKcz@plt>
    21eb:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
    21f0:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    21f5:	e8 26 ff ff ff       	call   2120 <_ZSt16__throw_bad_castv@plt>
    21fa:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    21ff:	48 89 c3             	mov    %rax,%rbx
    2202:	e8 09 ff ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    2207:	48 89 df             	mov    %rbx,%rdi
    220a:	e8 51 ff ff ff       	call   2160 <_Unwind_Resume@plt>

000000000000220f <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>:
    220f:	48 89 e9             	mov    %rbp,%rcx
    2212:	4c 89 fa             	mov    %r15,%rdx
    2215:	48 8d 35 e8 2d 00 00 	lea    0x2de8(%rip),%rsi        # 5004 <_IO_stdin_used+0x4>
    221c:	31 c0                	xor    %eax,%eax
    221e:	48 8d 3d 4b 2f 00 00 	lea    0x2f4b(%rip),%rdi        # 5170 <_IO_stdin_used+0x170>
    2225:	e8 06 ff ff ff       	call   2130 <_ZSt24__throw_out_of_range_fmtPKcz@plt>
    222a:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
    222f:	48 89 04 24          	mov    %rax,(%rsp)
    2233:	e8 e8 fe ff ff       	call   2120 <_ZSt16__throw_bad_castv@plt>
    2238:	48 8b 3c 24          	mov    (%rsp),%rdi
    223c:	48 89 c3             	mov    %rax,%rbx
    223f:	e8 cc fe ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    2244:	48 89 df             	mov    %rbx,%rdi
    2247:	e8 14 ff ff ff       	call   2160 <_Unwind_Resume@plt>

000000000000224c <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>:
    224c:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
    2251:	48 89 04 24          	mov    %rax,(%rsp)
    2255:	e8 c6 fe ff ff       	call   2120 <_ZSt16__throw_bad_castv@plt>
    225a:	48 89 e9             	mov    %rbp,%rcx
    225d:	4c 89 fa             	mov    %r15,%rdx
    2260:	48 8d 35 9d 2d 00 00 	lea    0x2d9d(%rip),%rsi        # 5004 <_IO_stdin_used+0x4>
    2267:	31 c0                	xor    %eax,%eax
    2269:	48 8d 3d 00 2f 00 00 	lea    0x2f00(%rip),%rdi        # 5170 <_IO_stdin_used+0x170>
    2270:	e8 bb fe ff ff       	call   2130 <_ZSt24__throw_out_of_range_fmtPKcz@plt>
    2275:	48 8b 3c 24          	mov    (%rsp),%rdi
    2279:	48 89 c3             	mov    %rax,%rbx
    227c:	e8 8f fe ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    2281:	48 89 df             	mov    %rbx,%rdi
    2284:	e8 d7 fe ff ff       	call   2160 <_Unwind_Resume@plt>

0000000000002289 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>:
    2289:	48 89 e9             	mov    %rbp,%rcx
    228c:	4c 89 fa             	mov    %r15,%rdx
    228f:	48 8d 35 6e 2d 00 00 	lea    0x2d6e(%rip),%rsi        # 5004 <_IO_stdin_used+0x4>
    2296:	31 c0                	xor    %eax,%eax
    2298:	48 8d 3d d1 2e 00 00 	lea    0x2ed1(%rip),%rdi        # 5170 <_IO_stdin_used+0x170>
    229f:	e8 8c fe ff ff       	call   2130 <_ZSt24__throw_out_of_range_fmtPKcz@plt>
    22a4:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
    22a9:	48 89 04 24          	mov    %rax,(%rsp)
    22ad:	e8 6e fe ff ff       	call   2120 <_ZSt16__throw_bad_castv@plt>
    22b2:	48 8b 3c 24          	mov    (%rsp),%rdi
    22b6:	48 89 c3             	mov    %rax,%rbx
    22b9:	e8 52 fe ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    22be:	48 89 df             	mov    %rbx,%rdi
    22c1:	e8 9a fe ff ff       	call   2160 <_Unwind_Resume@plt>

00000000000022c6 <_Z10b64_decodeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>:
    22c6:	4c 89 e7             	mov    %r12,%rdi
    22c9:	e8 62 23 00 00       	call   4630 <_ZNSt12_Vector_baseIhSaIhEED1Ev>
    22ce:	48 89 df             	mov    %rbx,%rdi
    22d1:	be 00 04 00 00       	mov    $0x400,%esi
    22d6:	e8 05 fe ff ff       	call   20e0 <_ZdlPvm@plt>
    22db:	48 89 ef             	mov    %rbp,%rdi
    22de:	e8 7d fe ff ff       	call   2160 <_Unwind_Resume@plt>

00000000000022e3 <_Z16derive_key_bytesRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>:
    22e3:	48 89 ef             	mov    %rbp,%rdi
    22e6:	e8 45 23 00 00       	call   4630 <_ZNSt12_Vector_baseIhSaIhEED1Ev>
    22eb:	48 89 df             	mov    %rbx,%rdi
    22ee:	e8 6d fe ff ff       	call   2160 <_Unwind_Resume@plt>

00000000000022f3 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold>:
    22f3:	48 8d 84 24 00 01 00 	lea    0x100(%rsp),%rax
    22fa:	00 
    22fb:	48 8d 3d fe 2d 00 00 	lea    0x2dfe(%rip),%rdi        # 5100 <_IO_stdin_used+0x100>
    2302:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
    2307:	e8 64 fd ff ff       	call   2070 <_ZSt20__throw_length_errorPKc@plt>
    230c:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    2311:	e8 fa fd ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    2316:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
    231b:	e8 f0 fd ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    2320:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    2325:	e8 06 23 00 00       	call   4630 <_ZNSt12_Vector_baseIhSaIhEED1Ev>
    232a:	4c 89 e7             	mov    %r12,%rdi
    232d:	e8 de fd ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    2332:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
    2337:	e8 d4 fd ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    233c:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
    2341:	e8 ea 22 00 00       	call   4630 <_ZNSt12_Vector_baseIhSaIhEED1Ev>
    2346:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
    234b:	e8 c0 fd ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    2350:	48 89 df             	mov    %rbx,%rdi
    2353:	e8 08 fe ff ff       	call   2160 <_Unwind_Resume@plt>
    2358:	48 89 c3             	mov    %rax,%rbx
    235b:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
    2360:	e8 ab fd ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    2365:	4c 89 e7             	mov    %r12,%rdi
    2368:	e8 a3 fd ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    236d:	48 89 df             	mov    %rbx,%rdi
    2370:	e8 eb fd ff ff       	call   2160 <_Unwind_Resume@plt>
    2375:	48 8d 3d 84 2d 00 00 	lea    0x2d84(%rip),%rdi        # 5100 <_IO_stdin_used+0x100>
    237c:	e8 ef fc ff ff       	call   2070 <_ZSt20__throw_length_errorPKc@plt>
    2381:	48 89 c3             	mov    %rax,%rbx
    2384:	eb df                	jmp    2365 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0x72>
    2386:	48 8d 3d 73 2d 00 00 	lea    0x2d73(%rip),%rdi        # 5100 <_IO_stdin_used+0x100>
    238d:	e8 de fc ff ff       	call   2070 <_ZSt20__throw_length_errorPKc@plt>
    2392:	48 8d 3d 67 2d 00 00 	lea    0x2d67(%rip),%rdi        # 5100 <_IO_stdin_used+0x100>
    2399:	e8 d2 fc ff ff       	call   2070 <_ZSt20__throw_length_errorPKc@plt>
    239e:	48 89 c3             	mov    %rax,%rbx
    23a1:	4c 89 e7             	mov    %r12,%rdi
    23a4:	e8 67 fd ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    23a9:	48 89 df             	mov    %rbx,%rdi
    23ac:	e8 af fd ff ff       	call   2160 <_Unwind_Resume@plt>
    23b1:	48 8d 84 24 20 01 00 	lea    0x120(%rsp),%rax
    23b8:	00 
    23b9:	48 8d 3d 40 2d 00 00 	lea    0x2d40(%rip),%rdi        # 5100 <_IO_stdin_used+0x100>
    23c0:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    23c5:	e8 a6 fc ff ff       	call   2070 <_ZSt20__throw_length_errorPKc@plt>
    23ca:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    23cf:	48 89 c3             	mov    %rax,%rbx
    23d2:	e8 39 fd ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    23d7:	eb 82                	jmp    235b <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0x68>

00000000000023d9 <main.cold>:
    23d9:	48 89 ef             	mov    %rbp,%rdi
    23dc:	e8 2f fd ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    23e1:	4c 89 e7             	mov    %r12,%rdi
    23e4:	e8 27 fd ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    23e9:	4c 89 ef             	mov    %r13,%rdi
    23ec:	e8 1f fd ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    23f1:	48 89 df             	mov    %rbx,%rdi
    23f4:	e8 67 fd ff ff       	call   2160 <_Unwind_Resume@plt>
    23f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002400 <main>:
    2400:	41 56                	push   %r14
    2402:	31 ff                	xor    %edi,%edi
    2404:	41 55                	push   %r13
    2406:	41 54                	push   %r12
    2408:	55                   	push   %rbp
    2409:	53                   	push   %rbx
    240a:	bb 03 00 00 00       	mov    $0x3,%ebx
    240f:	48 83 ec 60          	sub    $0x60,%rsp
    2413:	e8 48 fc ff ff       	call   2060 <_ZNSt8ios_base15sync_with_stdioEb@plt>
    2418:	49 89 e5             	mov    %rsp,%r13
    241b:	4c 8d 74 24 20       	lea    0x20(%rsp),%r14
    2420:	48 c7 05 dd 4e 00 00 	movq   $0x0,0x4edd(%rip)        # 7308 <_ZSt3cin@GLIBCXX_3.4+0xe8>
    2427:	00 00 00 00 
    242b:	e8 00 0a 00 00       	call   2e30 <_Z5introv>
    2430:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
    2435:	c6 44 24 10 00       	movb   $0x0,0x10(%rsp)
    243a:	48 89 04 24          	mov    %rax,(%rsp)
    243e:	48 8d 44 24 30       	lea    0x30(%rsp),%rax
    2443:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    2448:	48 8d 44 24 50       	lea    0x50(%rsp),%rax
    244d:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    2454:	00 00 
    2456:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
    245d:	00 00 
    245f:	c6 44 24 30 00       	movb   $0x0,0x30(%rsp)
    2464:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
    2469:	48 c7 44 24 48 00 00 	movq   $0x0,0x48(%rsp)
    2470:	00 00 
    2472:	c6 44 24 50 00       	movb   $0x0,0x50(%rsp)
    2477:	4c 89 ef             	mov    %r13,%rdi
    247a:	4d 89 f4             	mov    %r14,%r12
    247d:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    2482:	e8 09 0a 00 00       	call   2e90 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    2487:	84 c0                	test   %al,%al
    2489:	75 4e                	jne    24d9 <main+0xd9>
    248b:	83 eb 01             	sub    $0x1,%ebx
    248e:	75 e7                	jne    2477 <main+0x77>
    2490:	48 8d 35 b1 2f 00 00 	lea    0x2fb1(%rip),%rsi        # 5448 <_IO_stdin_used+0x448>
    2497:	48 8d 3d 62 4c 00 00 	lea    0x4c62(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    249e:	4c 8d 64 24 20       	lea    0x20(%rsp),%r12
    24a3:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    24a8:	e8 13 fc ff ff       	call   20c0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    24ad:	bb 01 00 00 00       	mov    $0x1,%ebx
    24b2:	48 89 ef             	mov    %rbp,%rdi
    24b5:	e8 56 fc ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    24ba:	4c 89 e7             	mov    %r12,%rdi
    24bd:	e8 4e fc ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    24c2:	4c 89 ef             	mov    %r13,%rdi
    24c5:	e8 46 fc ff ff       	call   2110 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@plt>
    24ca:	48 83 c4 60          	add    $0x60,%rsp
    24ce:	89 d8                	mov    %ebx,%eax
    24d0:	5b                   	pop    %rbx
    24d1:	5d                   	pop    %rbp
    24d2:	41 5c                	pop    %r12
    24d4:	41 5d                	pop    %r13
    24d6:	41 5e                	pop    %r14
    24d8:	c3                   	ret
    24d9:	bb 03 00 00 00       	mov    $0x3,%ebx
    24de:	4c 8d 64 24 20       	lea    0x20(%rsp),%r12
    24e3:	4c 8d 74 24 40       	lea    0x40(%rsp),%r14
    24e8:	4c 89 e7             	mov    %r12,%rdi
    24eb:	4c 89 f5             	mov    %r14,%rbp
    24ee:	e8 0d 0e 00 00       	call   3300 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    24f3:	84 c0                	test   %al,%al
    24f5:	75 1f                	jne    2516 <main+0x116>
    24f7:	83 eb 01             	sub    $0x1,%ebx
    24fa:	75 ec                	jne    24e8 <main+0xe8>
    24fc:	48 8d 35 45 2f 00 00 	lea    0x2f45(%rip),%rsi        # 5448 <_IO_stdin_used+0x448>
    2503:	48 8d 3d f6 4b 00 00 	lea    0x4bf6(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    250a:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    250f:	e8 ac fb ff ff       	call   20c0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    2514:	eb 97                	jmp    24ad <main+0xad>
    2516:	bb 03 00 00 00       	mov    $0x3,%ebx
    251b:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
    2520:	48 89 ef             	mov    %rbp,%rdi
    2523:	e8 e8 11 00 00       	call   3710 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    2528:	84 c0                	test   %al,%al
    252a:	75 1d                	jne    2549 <main+0x149>
    252c:	83 eb 01             	sub    $0x1,%ebx
    252f:	75 ef                	jne    2520 <main+0x120>
    2531:	48 8d 35 10 2f 00 00 	lea    0x2f10(%rip),%rsi        # 5448 <_IO_stdin_used+0x448>
    2538:	48 8d 3d c1 4b 00 00 	lea    0x4bc1(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    253f:	e8 7c fb ff ff       	call   20c0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    2544:	e9 64 ff ff ff       	jmp    24ad <main+0xad>
    2549:	48 8d 1d b0 4b 00 00 	lea    0x4bb0(%rip),%rbx        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    2550:	48 8d 35 19 2f 00 00 	lea    0x2f19(%rip),%rsi        # 5470 <_IO_stdin_used+0x470>
    2557:	48 89 df             	mov    %rbx,%rdi
    255a:	e8 61 fb ff ff       	call   20c0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    255f:	48 89 ea             	mov    %rbp,%rdx
    2562:	4c 89 e6             	mov    %r12,%rsi
    2565:	4c 89 ef             	mov    %r13,%rdi
    2568:	e8 f3 17 00 00       	call   3d60 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_>
    256d:	84 c0                	test   %al,%al
    256f:	74 16                	je     2587 <main+0x187>
    2571:	48 8d 35 ce 2b 00 00 	lea    0x2bce(%rip),%rsi        # 5146 <_IO_stdin_used+0x146>
    2578:	48 89 df             	mov    %rbx,%rdi
    257b:	e8 40 fb ff ff       	call   20c0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    2580:	31 db                	xor    %ebx,%ebx
    2582:	e9 2b ff ff ff       	jmp    24b2 <main+0xb2>
    2587:	48 8d 35 12 2f 00 00 	lea    0x2f12(%rip),%rsi        # 54a0 <_IO_stdin_used+0x4a0>
    258e:	48 89 df             	mov    %rbx,%rdi
    2591:	e8 2a fb ff ff       	call   20c0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    2596:	e9 12 ff ff ff       	jmp    24ad <main+0xad>
    259b:	48 89 c3             	mov    %rax,%rbx
    259e:	e9 36 fe ff ff       	jmp    23d9 <main.cold>
    25a3:	66 90                	xchg   %ax,%ax
    25a5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    25ac:	00 00 00 00 

00000000000025b0 <_GLOBAL__sub_I__Z5rot13RKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
    25b0:	53                   	push   %rbx
    25b1:	48 8d 15 70 2f 00 00 	lea    0x2f70(%rip),%rdx        # 5528 <_IO_stdin_used+0x528>
    25b8:	48 8d 1d 81 4d 00 00 	lea    0x4d81(%rip),%rbx        # 7340 <_ZL10b64_digits>
    25bf:	48 8d 43 10          	lea    0x10(%rbx),%rax
    25c3:	48 8d 72 c0          	lea    -0x40(%rdx),%rsi
    25c7:	48 89 df             	mov    %rbx,%rdi
    25ca:	48 89 05 6f 4d 00 00 	mov    %rax,0x4d6f(%rip)        # 7340 <_ZL10b64_digits>
    25d1:	e8 2a 01 00 00       	call   2700 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0>
    25d6:	48 8b 3d e3 49 00 00 	mov    0x49e3(%rip),%rdi        # 6fc0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@GLIBCXX_3.4.21>
    25dd:	48 89 de             	mov    %rbx,%rsi
    25e0:	5b                   	pop    %rbx
    25e1:	48 8d 15 d8 4a 00 00 	lea    0x4ad8(%rip),%rdx        # 70c0 <__dso_handle>
    25e8:	e9 c3 fa ff ff       	jmp    20b0 <__cxa_atexit@plt>
    25ed:	0f 1f 00             	nopl   (%rax)

00000000000025f0 <_start>:
    25f0:	31 ed                	xor    %ebp,%ebp
    25f2:	49 89 d1             	mov    %rdx,%r9
    25f5:	5e                   	pop    %rsi
    25f6:	48 89 e2             	mov    %rsp,%rdx
    25f9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    25fd:	50                   	push   %rax
    25fe:	54                   	push   %rsp
    25ff:	45 31 c0             	xor    %r8d,%r8d
    2602:	31 c9                	xor    %ecx,%ecx
    2604:	48 8d 3d f5 fd ff ff 	lea    -0x20b(%rip),%rdi        # 2400 <main>
    260b:	ff 15 b7 49 00 00    	call   *0x49b7(%rip)        # 6fc8 <__libc_start_main@GLIBC_2.34>
    2611:	f4                   	hlt
    2612:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    2619:	00 00 00 
    261c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000002620 <deregister_tm_clones>:
    2620:	48 8d 3d a9 4a 00 00 	lea    0x4aa9(%rip),%rdi        # 70d0 <__TMC_END__>
    2627:	48 8d 05 a2 4a 00 00 	lea    0x4aa2(%rip),%rax        # 70d0 <__TMC_END__>
    262e:	48 39 f8             	cmp    %rdi,%rax
    2631:	74 15                	je     2648 <deregister_tm_clones+0x28>
    2633:	48 8b 05 96 49 00 00 	mov    0x4996(%rip),%rax        # 6fd0 <_ITM_deregisterTMCloneTable@Base>
    263a:	48 85 c0             	test   %rax,%rax
    263d:	74 09                	je     2648 <deregister_tm_clones+0x28>
    263f:	ff e0                	jmp    *%rax
    2641:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2648:	c3                   	ret
    2649:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002650 <register_tm_clones>:
    2650:	48 8d 3d 79 4a 00 00 	lea    0x4a79(%rip),%rdi        # 70d0 <__TMC_END__>
    2657:	48 8d 35 72 4a 00 00 	lea    0x4a72(%rip),%rsi        # 70d0 <__TMC_END__>
    265e:	48 29 fe             	sub    %rdi,%rsi
    2661:	48 89 f0             	mov    %rsi,%rax
    2664:	48 c1 ee 3f          	shr    $0x3f,%rsi
    2668:	48 c1 f8 03          	sar    $0x3,%rax
    266c:	48 01 c6             	add    %rax,%rsi
    266f:	48 d1 fe             	sar    $1,%rsi
    2672:	74 14                	je     2688 <register_tm_clones+0x38>
    2674:	48 8b 05 65 49 00 00 	mov    0x4965(%rip),%rax        # 6fe0 <_ITM_registerTMCloneTable@Base>
    267b:	48 85 c0             	test   %rax,%rax
    267e:	74 08                	je     2688 <register_tm_clones+0x38>
    2680:	ff e0                	jmp    *%rax
    2682:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    2688:	c3                   	ret
    2689:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002690 <__do_global_dtors_aux>:
    2690:	f3 0f 1e fa          	endbr64
    2694:	80 3d 9d 4c 00 00 00 	cmpb   $0x0,0x4c9d(%rip)        # 7338 <completed.0>
    269b:	75 2b                	jne    26c8 <__do_global_dtors_aux+0x38>
    269d:	55                   	push   %rbp
    269e:	48 83 3d 12 49 00 00 	cmpq   $0x0,0x4912(%rip)        # 6fb8 <__cxa_finalize@GLIBC_2.2.5>
    26a5:	00 
    26a6:	48 89 e5             	mov    %rsp,%rbp
    26a9:	74 0c                	je     26b7 <__do_global_dtors_aux+0x27>
    26ab:	48 8b 3d 0e 4a 00 00 	mov    0x4a0e(%rip),%rdi        # 70c0 <__dso_handle>
    26b2:	e8 e9 fa ff ff       	call   21a0 <__cxa_finalize@plt>
    26b7:	e8 64 ff ff ff       	call   2620 <deregister_tm_clones>
    26bc:	c6 05 75 4c 00 00 01 	movb   $0x1,0x4c75(%rip)        # 7338 <completed.0>
    26c3:	5d                   	pop    %rbp
    26c4:	c3                   	ret
    26c5:	0f 1f 00             	nopl   (%rax)
    26c8:	c3                   	ret
    26c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000026d0 <frame_dummy>:
    26d0:	f3 0f 1e fa          	endbr64
    26d4:	e9 77 ff ff ff       	jmp    2650 <register_tm_clones>
    26d9:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    26e0:	00 00 00 
    26e3:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    26ea:	00 00 00 
    26ed:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    26f4:	00 00 00 
    26f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    26fe:	00 00 

0000000000002700 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0>:
    2700:	41 54                	push   %r12
    2702:	48 29 f2             	sub    %rsi,%rdx
    2705:	49 89 f4             	mov    %rsi,%r12
    2708:	55                   	push   %rbp
    2709:	48 89 fd             	mov    %rdi,%rbp
    270c:	53                   	push   %rbx
    270d:	48 89 d3             	mov    %rdx,%rbx
    2710:	48 83 ec 10          	sub    $0x10,%rsp
    2714:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    2719:	48 83 fa 0f          	cmp    $0xf,%rdx
    271d:	77 41                	ja     2760 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0+0x60>
    271f:	48 8b 3f             	mov    (%rdi),%rdi
    2722:	48 83 fa 01          	cmp    $0x1,%rdx
    2726:	75 28                	jne    2750 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0+0x50>
    2728:	0f b6 06             	movzbl (%rsi),%eax
    272b:	88 07                	mov    %al,(%rdi)
    272d:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    2732:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
    2736:	48 89 5d 08          	mov    %rbx,0x8(%rbp)
    273a:	c6 04 1f 00          	movb   $0x0,(%rdi,%rbx,1)
    273e:	48 83 c4 10          	add    $0x10,%rsp
    2742:	5b                   	pop    %rbx
    2743:	5d                   	pop    %rbp
    2744:	41 5c                	pop    %r12
    2746:	c3                   	ret
    2747:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    274e:	00 00 
    2750:	48 85 d2             	test   %rdx,%rdx
    2753:	74 e1                	je     2736 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0+0x36>
    2755:	eb 25                	jmp    277c <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0+0x7c>
    2757:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    275e:	00 00 
    2760:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
    2765:	31 d2                	xor    %edx,%edx
    2767:	e8 04 fa ff ff       	call   2170 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@plt>
    276c:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2770:	48 89 c7             	mov    %rax,%rdi
    2773:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    2778:	48 89 45 10          	mov    %rax,0x10(%rbp)
    277c:	48 89 da             	mov    %rbx,%rdx
    277f:	4c 89 e6             	mov    %r12,%rsi
    2782:	e8 19 f9 ff ff       	call   20a0 <memcpy@plt>
    2787:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
    278c:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
    2790:	eb a4                	jmp    2736 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0+0x36>
    2792:	0f 1f 00             	nopl   (%rax)
    2795:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    279c:	00 00 00 00 

00000000000027a0 <_Z5rot13RKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
    27a0:	41 54                	push   %r12
    27a2:	55                   	push   %rbp
    27a3:	53                   	push   %rbx
    27a4:	48 89 fb             	mov    %rdi,%rbx
    27a7:	48 83 c7 10          	add    $0x10,%rdi
    27ab:	48 83 ec 10          	sub    $0x10,%rsp
    27af:	48 8b 6e 08          	mov    0x8(%rsi),%rbp
    27b3:	48 89 3b             	mov    %rdi,(%rbx)
    27b6:	4c 8b 26             	mov    (%rsi),%r12
    27b9:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
    27be:	48 83 fd 0f          	cmp    $0xf,%rbp
    27c2:	0f 87 b8 00 00 00    	ja     2880 <_Z5rot13RKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xe0>
    27c8:	48 83 fd 01          	cmp    $0x1,%rbp
    27cc:	0f 85 9e 00 00 00    	jne    2870 <_Z5rot13RKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xd0>
    27d2:	41 0f b6 04 24       	movzbl (%r12),%eax
    27d7:	88 43 10             	mov    %al,0x10(%rbx)
    27da:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
    27de:	31 d2                	xor    %edx,%edx
    27e0:	c6 04 2f 00          	movb   $0x0,(%rdi,%rbp,1)
    27e4:	48 83 7b 08 00       	cmpq   $0x0,0x8(%rbx)
    27e9:	75 3a                	jne    2825 <_Z5rot13RKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x85>
    27eb:	eb 76                	jmp    2863 <_Z5rot13RKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc3>
    27ed:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    27f4:	00 
    27f5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    27fc:	00 00 00 00 
    2800:	8d 48 ac             	lea    -0x54(%rax),%ecx
    2803:	48 89 c8             	mov    %rcx,%rax
    2806:	48 69 c9 4f ec c4 4e 	imul   $0x4ec4ec4f,%rcx,%rcx
    280d:	48 c1 e9 23          	shr    $0x23,%rcx
    2811:	6b c9 1a             	imul   $0x1a,%ecx,%ecx
    2814:	29 c8                	sub    %ecx,%eax
    2816:	83 c0 61             	add    $0x61,%eax
    2819:	88 06                	mov    %al,(%rsi)
    281b:	48 83 c2 01          	add    $0x1,%rdx
    281f:	48 3b 53 08          	cmp    0x8(%rbx),%rdx
    2823:	73 3e                	jae    2863 <_Z5rot13RKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc3>
    2825:	48 8b 33             	mov    (%rbx),%rsi
    2828:	48 01 d6             	add    %rdx,%rsi
    282b:	0f be 06             	movsbl (%rsi),%eax
    282e:	8d 48 9f             	lea    -0x61(%rax),%ecx
    2831:	80 f9 19             	cmp    $0x19,%cl
    2834:	76 ca                	jbe    2800 <_Z5rot13RKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x60>
    2836:	8d 48 bf             	lea    -0x41(%rax),%ecx
    2839:	80 f9 19             	cmp    $0x19,%cl
    283c:	77 dd                	ja     281b <_Z5rot13RKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x7b>
    283e:	8d 48 cc             	lea    -0x34(%rax),%ecx
    2841:	48 83 c2 01          	add    $0x1,%rdx
    2845:	48 89 c8             	mov    %rcx,%rax
    2848:	48 69 c9 4f ec c4 4e 	imul   $0x4ec4ec4f,%rcx,%rcx
    284f:	48 c1 e9 23          	shr    $0x23,%rcx
    2853:	6b c9 1a             	imul   $0x1a,%ecx,%ecx
    2856:	29 c8                	sub    %ecx,%eax
    2858:	83 c0 41             	add    $0x41,%eax
    285b:	88 06                	mov    %al,(%rsi)
    285d:	48 3b 53 08          	cmp    0x8(%rbx),%rdx
    2861:	72 c2                	jb     2825 <_Z5rot13RKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x85>
    2863:	48 83 c4 10          	add    $0x10,%rsp
    2867:	48 89 d8             	mov    %rbx,%rax
    286a:	5b                   	pop    %rbx
    286b:	5d                   	pop    %rbp
    286c:	41 5c                	pop    %r12
    286e:	c3                   	ret
    286f:	90                   	nop
    2870:	48 85 ed             	test   %rbp,%rbp
    2873:	0f 84 61 ff ff ff    	je     27da <_Z5rot13RKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3a>
    2879:	eb 23                	jmp    289e <_Z5rot13RKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xfe>
    287b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    2880:	48 89 df             	mov    %rbx,%rdi
    2883:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
    2888:	31 d2                	xor    %edx,%edx
    288a:	e8 e1 f8 ff ff       	call   2170 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@plt>
    288f:	48 89 03             	mov    %rax,(%rbx)
    2892:	48 89 c7             	mov    %rax,%rdi
    2895:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    289a:	48 89 43 10          	mov    %rax,0x10(%rbx)
    289e:	48 89 ea             	mov    %rbp,%rdx
    28a1:	4c 89 e6             	mov    %r12,%rsi
    28a4:	e8 f7 f7 ff ff       	call   20a0 <memcpy@plt>
    28a9:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
    28ae:	48 8b 3b             	mov    (%rbx),%rdi
    28b1:	e9 24 ff ff ff       	jmp    27da <_Z5rot13RKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3a>
    28b6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    28bd:	00 00 00 

00000000000028c0 <_Z20xor_decrypt_with_keyB5cxx11PKhmRKSt6vectorIhSaIhEE>:
    28c0:	41 55                	push   %r13
    28c2:	48 8d 47 10          	lea    0x10(%rdi),%rax
    28c6:	49 89 d5             	mov    %rdx,%r13
    28c9:	31 d2                	xor    %edx,%edx
    28cb:	41 54                	push   %r12
    28cd:	49 89 f4             	mov    %rsi,%r12
    28d0:	4c 89 ee             	mov    %r13,%rsi
    28d3:	55                   	push   %rbp
    28d4:	48 89 cd             	mov    %rcx,%rbp
    28d7:	53                   	push   %rbx
    28d8:	48 89 fb             	mov    %rdi,%rbx
    28db:	48 83 ec 08          	sub    $0x8,%rsp
    28df:	48 89 07             	mov    %rax,(%rdi)
    28e2:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
    28e9:	00 
    28ea:	c6 47 10 00          	movb   $0x0,0x10(%rdi)
    28ee:	e8 4d f7 ff ff       	call   2040 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt>
    28f3:	4d 85 ed             	test   %r13,%r13
    28f6:	74 33                	je     292b <_Z20xor_decrypt_with_keyB5cxx11PKhmRKSt6vectorIhSaIhEE+0x6b>
    28f8:	31 c9                	xor    %ecx,%ecx
    28fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    2900:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
    2904:	48 8b 75 08          	mov    0x8(%rbp),%rsi
    2908:	48 89 c8             	mov    %rcx,%rax
    290b:	31 d2                	xor    %edx,%edx
    290d:	4c 8b 03             	mov    (%rbx),%r8
    2910:	48 29 fe             	sub    %rdi,%rsi
    2913:	48 f7 f6             	div    %rsi
    2916:	0f b6 04 17          	movzbl (%rdi,%rdx,1),%eax
    291a:	41 32 04 0c          	xor    (%r12,%rcx,1),%al
    291e:	41 88 04 08          	mov    %al,(%r8,%rcx,1)
    2922:	48 83 c1 01          	add    $0x1,%rcx
    2926:	49 39 cd             	cmp    %rcx,%r13
    2929:	75 d5                	jne    2900 <_Z20xor_decrypt_with_keyB5cxx11PKhmRKSt6vectorIhSaIhEE+0x40>
    292b:	48 83 c4 08          	add    $0x8,%rsp
    292f:	48 89 d8             	mov    %rbx,%rax
    2932:	5b                   	pop    %rbx
    2933:	5d                   	pop    %rbp
    2934:	41 5c                	pop    %r12
    2936:	41 5d                	pop    %r13
    2938:	c3                   	ret
    2939:	48 89 c5             	mov    %rax,%rbp
    293c:	e9 7f f8 ff ff       	jmp    21c0 <_Z20xor_decrypt_with_keyB5cxx11PKhmRKSt6vectorIhSaIhEE.cold>
    2941:	0f 1f 40 00          	nopl   0x0(%rax)
    2945:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    294c:	00 00 00 00 

0000000000002950 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
    2950:	41 57                	push   %r15
    2952:	41 56                	push   %r14
    2954:	41 55                	push   %r13
    2956:	41 54                	push   %r12
    2958:	4c 8d 25 c1 48 00 00 	lea    0x48c1(%rip),%r12        # 7220 <_ZSt3cin@GLIBCXX_3.4>
    295f:	55                   	push   %rbp
    2960:	48 89 fd             	mov    %rdi,%rbp
    2963:	53                   	push   %rbx
    2964:	48 8d 1d 95 47 00 00 	lea    0x4795(%rip),%rbx        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    296b:	48 89 df             	mov    %rbx,%rdi
    296e:	48 83 ec 58          	sub    $0x58,%rsp
    2972:	48 8b 56 08          	mov    0x8(%rsi),%rdx
    2976:	48 8b 36             	mov    (%rsi),%rsi
    2979:	e8 72 f7 ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    297e:	48 89 df             	mov    %rbx,%rdi
    2981:	e8 0a f7 ff ff       	call   2090 <_ZNSo5flushEv@plt>
    2986:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
    298b:	c6 44 24 20 00       	movb   $0x0,0x20(%rsp)
    2990:	48 89 04 24          	mov    %rax,(%rsp)
    2994:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    2999:	48 8b 05 80 48 00 00 	mov    0x4880(%rip),%rax        # 7220 <_ZSt3cin@GLIBCXX_3.4>
    29a0:	48 c7 44 24 18 00 00 	movq   $0x0,0x18(%rsp)
    29a7:	00 00 
    29a9:	48 8b 40 e8          	mov    -0x18(%rax),%rax
    29ad:	49 8b 9c 04 f0 00 00 	mov    0xf0(%r12,%rax,1),%rbx
    29b4:	00 
    29b5:	48 85 db             	test   %rbx,%rbx
    29b8:	0f 84 2d f8 ff ff    	je     21eb <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold+0x1b>
    29be:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
    29c2:	74 74                	je     2a38 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xe8>
    29c4:	0f be 53 43          	movsbl 0x43(%rbx),%edx
    29c8:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
    29cd:	4c 89 e7             	mov    %r12,%rdi
    29d0:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
    29d5:	e8 b6 f7 ff ff       	call   2190 <_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EES4_@plt>
    29da:	48 8b 10             	mov    (%rax),%rdx
    29dd:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    29e2:	48 8b 52 e8          	mov    -0x18(%rdx),%rdx
    29e6:	f6 44 10 20 05       	testb  $0x5,0x20(%rax,%rdx,1)
    29eb:	0f 84 97 00 00 00    	je     2a88 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x138>
    29f1:	48 8d 45 10          	lea    0x10(%rbp),%rax
    29f5:	48 c7 45 08 00 00 00 	movq   $0x0,0x8(%rbp)
    29fc:	00 
    29fd:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2a01:	48 8b 04 24          	mov    (%rsp),%rax
    2a05:	c6 45 10 00          	movb   $0x0,0x10(%rbp)
    2a09:	48 39 c3             	cmp    %rax,%rbx
    2a0c:	74 11                	je     2a1f <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xcf>
    2a0e:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    2a13:	48 89 df             	mov    %rbx,%rdi
    2a16:	48 8d 70 01          	lea    0x1(%rax),%rsi
    2a1a:	e8 c1 f6 ff ff       	call   20e0 <_ZdlPvm@plt>
    2a1f:	48 83 c4 58          	add    $0x58,%rsp
    2a23:	48 89 e8             	mov    %rbp,%rax
    2a26:	5b                   	pop    %rbx
    2a27:	5d                   	pop    %rbp
    2a28:	41 5c                	pop    %r12
    2a2a:	41 5d                	pop    %r13
    2a2c:	41 5e                	pop    %r14
    2a2e:	41 5f                	pop    %r15
    2a30:	c3                   	ret
    2a31:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    2a38:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
    2a3d:	48 89 df             	mov    %rbx,%rdi
    2a40:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    2a45:	e8 b6 f6 ff ff       	call   2100 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
    2a4a:	48 8b 03             	mov    (%rbx),%rax
    2a4d:	48 8d 0d cc 1b 00 00 	lea    0x1bcc(%rip),%rcx        # 4620 <_ZNKSt5ctypeIcE8do_widenEc>
    2a54:	ba 0a 00 00 00       	mov    $0xa,%edx
    2a59:	48 8b 40 30          	mov    0x30(%rax),%rax
    2a5d:	48 39 c8             	cmp    %rcx,%rax
    2a60:	0f 84 62 ff ff ff    	je     29c8 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x78>
    2a66:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
    2a6b:	be 0a 00 00 00       	mov    $0xa,%esi
    2a70:	48 89 df             	mov    %rbx,%rdi
    2a73:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    2a78:	ff d0                	call   *%rax
    2a7a:	0f be d0             	movsbl %al,%edx
    2a7d:	e9 46 ff ff ff       	jmp    29c8 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x78>
    2a82:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    2a88:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
    2a8d:	4d 85 e4             	test   %r12,%r12
    2a90:	0f 84 6e 02 00 00    	je     2d04 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3b4>
    2a96:	45 31 ff             	xor    %r15d,%r15d
    2a99:	eb 12                	jmp    2aad <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x15d>
    2a9b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    2aa0:	49 83 c7 01          	add    $0x1,%r15
    2aa4:	4d 39 fc             	cmp    %r15,%r12
    2aa7:	0f 84 13 01 00 00    	je     2bc0 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x270>
    2aad:	42 0f b6 3c 3b       	movzbl (%rbx,%r15,1),%edi
    2ab2:	e8 79 f5 ff ff       	call   2030 <isspace@plt>
    2ab7:	85 c0                	test   %eax,%eax
    2ab9:	75 e5                	jne    2aa0 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x150>
    2abb:	4d 89 e6             	mov    %r12,%r14
    2abe:	eb 03                	jmp    2ac3 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x173>
    2ac0:	4d 89 ee             	mov    %r13,%r14
    2ac3:	4d 39 f7             	cmp    %r14,%r15
    2ac6:	73 13                	jae    2adb <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x18b>
    2ac8:	42 0f b6 7c 33 ff    	movzbl -0x1(%rbx,%r14,1),%edi
    2ace:	4d 8d 6e ff          	lea    -0x1(%r14),%r13
    2ad2:	e8 59 f5 ff ff       	call   2030 <isspace@plt>
    2ad7:	85 c0                	test   %eax,%eax
    2ad9:	75 e5                	jne    2ac0 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x170>
    2adb:	4c 89 f2             	mov    %r14,%rdx
    2ade:	4c 29 fa             	sub    %r15,%rdx
    2ae1:	4d 39 fc             	cmp    %r15,%r12
    2ae4:	0f 82 e6 f6 ff ff    	jb     21d0 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>
    2aea:	4d 29 fc             	sub    %r15,%r12
    2aed:	4c 8d 6c 24 40       	lea    0x40(%rsp),%r13
    2af2:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    2af7:	4c 01 fb             	add    %r15,%rbx
    2afa:	49 39 d4             	cmp    %rdx,%r12
    2afd:	48 89 de             	mov    %rbx,%rsi
    2b00:	4c 89 6c 24 30       	mov    %r13,0x30(%rsp)
    2b05:	4c 0f 47 e2          	cmova  %rdx,%r12
    2b09:	4a 8d 14 23          	lea    (%rbx,%r12,1),%rdx
    2b0d:	e8 ee fb ff ff       	call   2700 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0>
    2b12:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    2b17:	48 8b 0c 24          	mov    (%rsp),%rcx
    2b1b:	48 89 c7             	mov    %rax,%rdi
    2b1e:	48 39 c8             	cmp    %rcx,%rax
    2b21:	0f 84 a9 00 00 00    	je     2bd0 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x280>
    2b27:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    2b2c:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
    2b31:	48 89 d6             	mov    %rdx,%rsi
    2b34:	4c 39 e9             	cmp    %r13,%rcx
    2b37:	0f 84 13 01 00 00    	je     2c50 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x300>
    2b3d:	66 48 0f 6e c2       	movq   %rdx,%xmm0
    2b42:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    2b47:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    2b4c:	0f 16 44 24 40       	movhps 0x40(%rsp),%xmm0
    2b51:	0f 11 44 24 18       	movups %xmm0,0x18(%rsp)
    2b56:	48 85 c0             	test   %rax,%rax
    2b59:	0f 84 8b 00 00 00    	je     2bea <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x29a>
    2b5f:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    2b64:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
    2b69:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
    2b70:	00 00 
    2b72:	c6 00 00             	movb   $0x0,(%rax)
    2b75:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    2b7a:	4c 39 ef             	cmp    %r13,%rdi
    2b7d:	74 0e                	je     2b8d <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x23d>
    2b7f:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
    2b84:	48 8d 70 01          	lea    0x1(%rax),%rsi
    2b88:	e8 53 f5 ff ff       	call   20e0 <_ZdlPvm@plt>
    2b8d:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    2b92:	48 8b 14 24          	mov    (%rsp),%rdx
    2b96:	48 8d 4d 10          	lea    0x10(%rbp),%rcx
    2b9a:	48 89 4d 00          	mov    %rcx,0x0(%rbp)
    2b9e:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    2ba3:	48 39 d0             	cmp    %rdx,%rax
    2ba6:	74 58                	je     2c00 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2b0>
    2ba8:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2bac:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    2bb1:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2bb5:	48 89 75 08          	mov    %rsi,0x8(%rbp)
    2bb9:	e9 61 fe ff ff       	jmp    2a1f <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xcf>
    2bbe:	66 90                	xchg   %ax,%ax
    2bc0:	4d 89 e6             	mov    %r12,%r14
    2bc3:	e9 13 ff ff ff       	jmp    2adb <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x18b>
    2bc8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    2bcf:	00 
    2bd0:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
    2bd5:	4c 39 ea             	cmp    %r13,%rdx
    2bd8:	74 64                	je     2c3e <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2ee>
    2bda:	f3 0f 6f 44 24 38    	movdqu 0x38(%rsp),%xmm0
    2be0:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
    2be5:	0f 11 44 24 18       	movups %xmm0,0x18(%rsp)
    2bea:	4c 89 6c 24 30       	mov    %r13,0x30(%rsp)
    2bef:	4c 8d 6c 24 40       	lea    0x40(%rsp),%r13
    2bf4:	4c 89 e8             	mov    %r13,%rax
    2bf7:	e9 6d ff ff ff       	jmp    2b69 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x219>
    2bfc:	0f 1f 40 00          	nopl   0x0(%rax)
    2c00:	48 8d 56 01          	lea    0x1(%rsi),%rdx
    2c04:	83 fa 08             	cmp    $0x8,%edx
    2c07:	0f 83 a3 00 00 00    	jae    2cb0 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x360>
    2c0d:	f6 c2 04             	test   $0x4,%dl
    2c10:	0f 85 5f 01 00 00    	jne    2d75 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x425>
    2c16:	85 d2                	test   %edx,%edx
    2c18:	74 9b                	je     2bb5 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x265>
    2c1a:	48 8b 04 24          	mov    (%rsp),%rax
    2c1e:	0f b6 00             	movzbl (%rax),%eax
    2c21:	88 45 10             	mov    %al,0x10(%rbp)
    2c24:	f6 c2 02             	test   $0x2,%dl
    2c27:	74 8c                	je     2bb5 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x265>
    2c29:	48 8b 04 24          	mov    (%rsp),%rax
    2c2d:	89 d2                	mov    %edx,%edx
    2c2f:	0f b7 44 10 fe       	movzwl -0x2(%rax,%rdx,1),%eax
    2c34:	66 89 44 11 fe       	mov    %ax,-0x2(%rcx,%rdx,1)
    2c39:	e9 77 ff ff ff       	jmp    2bb5 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x265>
    2c3e:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    2c43:	48 89 d6             	mov    %rdx,%rsi
    2c46:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    2c4d:	00 00 00 
    2c50:	48 85 d2             	test   %rdx,%rdx
    2c53:	74 42                	je     2c97 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x347>
    2c55:	48 83 fa 01          	cmp    $0x1,%rdx
    2c59:	0f 84 af 00 00 00    	je     2d0e <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3be>
    2c5f:	89 d0                	mov    %edx,%eax
    2c61:	83 fa 08             	cmp    $0x8,%edx
    2c64:	0f 83 ba 00 00 00    	jae    2d24 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3d4>
    2c6a:	f6 c2 04             	test   $0x4,%dl
    2c6d:	0f 85 1a 01 00 00    	jne    2d8d <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x43d>
    2c73:	85 d2                	test   %edx,%edx
    2c75:	74 1a                	je     2c91 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x341>
    2c77:	0f b6 4c 24 40       	movzbl 0x40(%rsp),%ecx
    2c7c:	83 e2 02             	and    $0x2,%edx
    2c7f:	88 0f                	mov    %cl,(%rdi)
    2c81:	0f 85 24 01 00 00    	jne    2dab <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x45b>
    2c87:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    2c8c:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    2c91:	48 89 d6             	mov    %rdx,%rsi
    2c94:	48 89 f8             	mov    %rdi,%rax
    2c97:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
    2c9c:	c6 04 30 00          	movb   $0x0,(%rax,%rsi,1)
    2ca0:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
    2ca5:	e9 bf fe ff ff       	jmp    2b69 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x219>
    2caa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    2cb0:	48 8b 1c 24          	mov    (%rsp),%rbx
    2cb4:	48 8b 03             	mov    (%rbx),%rax
    2cb7:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2cbb:	89 d0                	mov    %edx,%eax
    2cbd:	48 8b 7c 03 f8       	mov    -0x8(%rbx,%rax,1),%rdi
    2cc2:	48 89 7c 01 f8       	mov    %rdi,-0x8(%rcx,%rax,1)
    2cc7:	48 8d 7d 18          	lea    0x18(%rbp),%rdi
    2ccb:	48 89 c8             	mov    %rcx,%rax
    2cce:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
    2cd2:	48 29 f8             	sub    %rdi,%rax
    2cd5:	01 c2                	add    %eax,%edx
    2cd7:	48 29 c3             	sub    %rax,%rbx
    2cda:	83 e2 f8             	and    $0xfffffff8,%edx
    2cdd:	49 89 de             	mov    %rbx,%r14
    2ce0:	83 fa 08             	cmp    $0x8,%edx
    2ce3:	0f 82 cc fe ff ff    	jb     2bb5 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x265>
    2ce9:	83 e2 f8             	and    $0xfffffff8,%edx
    2cec:	31 c0                	xor    %eax,%eax
    2cee:	89 c1                	mov    %eax,%ecx
    2cf0:	83 c0 08             	add    $0x8,%eax
    2cf3:	4d 8b 04 0e          	mov    (%r14,%rcx,1),%r8
    2cf7:	4c 89 04 0f          	mov    %r8,(%rdi,%rcx,1)
    2cfb:	39 d0                	cmp    %edx,%eax
    2cfd:	72 ef                	jb     2cee <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x39e>
    2cff:	e9 b1 fe ff ff       	jmp    2bb5 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x265>
    2d04:	31 d2                	xor    %edx,%edx
    2d06:	45 31 ff             	xor    %r15d,%r15d
    2d09:	e9 dc fd ff ff       	jmp    2aea <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x19a>
    2d0e:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
    2d13:	88 07                	mov    %al,(%rdi)
    2d15:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
    2d1a:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    2d1f:	e9 73 ff ff ff       	jmp    2c97 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x347>
    2d24:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
    2d29:	48 89 07             	mov    %rax,(%rdi)
    2d2c:	89 d0                	mov    %edx,%eax
    2d2e:	49 8b 4c 05 f8       	mov    -0x8(%r13,%rax,1),%rcx
    2d33:	48 89 4c 07 f8       	mov    %rcx,-0x8(%rdi,%rax,1)
    2d38:	48 8d 4f 08          	lea    0x8(%rdi),%rcx
    2d3c:	48 89 f8             	mov    %rdi,%rax
    2d3f:	4c 89 ef             	mov    %r13,%rdi
    2d42:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    2d46:	48 29 c8             	sub    %rcx,%rax
    2d49:	48 29 c7             	sub    %rax,%rdi
    2d4c:	01 d0                	add    %edx,%eax
    2d4e:	83 e0 f8             	and    $0xfffffff8,%eax
    2d51:	83 f8 08             	cmp    $0x8,%eax
    2d54:	0f 82 2d ff ff ff    	jb     2c87 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x337>
    2d5a:	83 e0 f8             	and    $0xfffffff8,%eax
    2d5d:	31 d2                	xor    %edx,%edx
    2d5f:	89 d6                	mov    %edx,%esi
    2d61:	83 c2 08             	add    $0x8,%edx
    2d64:	4c 8b 04 37          	mov    (%rdi,%rsi,1),%r8
    2d68:	4c 89 04 31          	mov    %r8,(%rcx,%rsi,1)
    2d6c:	39 c2                	cmp    %eax,%edx
    2d6e:	72 ef                	jb     2d5f <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x40f>
    2d70:	e9 12 ff ff ff       	jmp    2c87 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x337>
    2d75:	48 8b 1c 24          	mov    (%rsp),%rbx
    2d79:	89 d2                	mov    %edx,%edx
    2d7b:	8b 03                	mov    (%rbx),%eax
    2d7d:	89 45 10             	mov    %eax,0x10(%rbp)
    2d80:	8b 44 13 fc          	mov    -0x4(%rbx,%rdx,1),%eax
    2d84:	89 44 11 fc          	mov    %eax,-0x4(%rcx,%rdx,1)
    2d88:	e9 28 fe ff ff       	jmp    2bb5 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x265>
    2d8d:	8b 54 24 40          	mov    0x40(%rsp),%edx
    2d91:	89 17                	mov    %edx,(%rdi)
    2d93:	41 8b 54 05 fc       	mov    -0x4(%r13,%rax,1),%edx
    2d98:	89 54 07 fc          	mov    %edx,-0x4(%rdi,%rax,1)
    2d9c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    2da1:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    2da6:	e9 e6 fe ff ff       	jmp    2c91 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x341>
    2dab:	41 0f b7 54 05 fe    	movzwl -0x2(%r13,%rax,1),%edx
    2db1:	66 89 54 07 fe       	mov    %dx,-0x2(%rdi,%rax,1)
    2db6:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    2dbb:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    2dc0:	e9 cc fe ff ff       	jmp    2c91 <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x341>
    2dc5:	e9 30 f4 ff ff       	jmp    21fa <_Z8ask_lineRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold+0x2a>
    2dca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000002dd0 <_Z17looks_like_numberRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
    2dd0:	48 8b 07             	mov    (%rdi),%rax
    2dd3:	48 8b 77 08          	mov    0x8(%rdi),%rsi
    2dd7:	48 8d 0c 30          	lea    (%rax,%rsi,1),%rcx
    2ddb:	48 39 c1             	cmp    %rax,%rcx
    2dde:	75 29                	jne    2e09 <_Z17looks_like_numberRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x39>
    2de0:	eb 3e                	jmp    2e20 <_Z17looks_like_numberRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x50>
    2de2:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    2de9:	00 
    2dea:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    2df1:	00 00 00 00 
    2df5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    2dfc:	00 00 00 00 
    2e00:	48 83 c0 01          	add    $0x1,%rax
    2e04:	48 39 c1             	cmp    %rax,%rcx
    2e07:	74 17                	je     2e20 <_Z17looks_like_numberRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x50>
    2e09:	0f b6 10             	movzbl (%rax),%edx
    2e0c:	83 ea 30             	sub    $0x30,%edx
    2e0f:	83 fa 09             	cmp    $0x9,%edx
    2e12:	76 ec                	jbe    2e00 <_Z17looks_like_numberRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x30>
    2e14:	31 c0                	xor    %eax,%eax
    2e16:	c3                   	ret
    2e17:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    2e1e:	00 00 
    2e20:	48 85 f6             	test   %rsi,%rsi
    2e23:	0f 95 c0             	setne  %al
    2e26:	c3                   	ret
    2e27:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    2e2e:	00 00 

0000000000002e30 <_Z5introv>:
    2e30:	53                   	push   %rbx
    2e31:	48 8d 1d c8 42 00 00 	lea    0x42c8(%rip),%rbx        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    2e38:	ba 27 00 00 00       	mov    $0x27,%edx
    2e3d:	48 8d 35 6c 23 00 00 	lea    0x236c(%rip),%rsi        # 51b0 <_IO_stdin_used+0x1b0>
    2e44:	48 89 df             	mov    %rbx,%rdi
    2e47:	e8 a4 f2 ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    2e4c:	48 89 df             	mov    %rbx,%rdi
    2e4f:	ba 44 00 00 00       	mov    $0x44,%edx
    2e54:	48 8d 35 7d 23 00 00 	lea    0x237d(%rip),%rsi        # 51d8 <_IO_stdin_used+0x1d8>
    2e5b:	e8 90 f2 ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    2e60:	48 89 df             	mov    %rbx,%rdi
    2e63:	ba 42 00 00 00       	mov    $0x42,%edx
    2e68:	48 8d 35 b1 23 00 00 	lea    0x23b1(%rip),%rsi        # 5220 <_IO_stdin_used+0x220>
    2e6f:	e8 7c f2 ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    2e74:	48 89 df             	mov    %rbx,%rdi
    2e77:	5b                   	pop    %rbx
    2e78:	ba 13 00 00 00       	mov    $0x13,%edx
    2e7d:	48 8d 35 95 21 00 00 	lea    0x2195(%rip),%rsi        # 5019 <_IO_stdin_used+0x19>
    2e84:	e9 67 f2 ff ff       	jmp    20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    2e89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002e90 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
    2e90:	41 57                	push   %r15
    2e92:	ba 18 00 00 00       	mov    $0x18,%edx
    2e97:	48 8d 35 8f 21 00 00 	lea    0x218f(%rip),%rsi        # 502d <_IO_stdin_used+0x2d>
    2e9e:	41 56                	push   %r14
    2ea0:	41 55                	push   %r13
    2ea2:	41 54                	push   %r12
    2ea4:	55                   	push   %rbp
    2ea5:	48 8d 2d 74 43 00 00 	lea    0x4374(%rip),%rbp        # 7220 <_ZSt3cin@GLIBCXX_3.4>
    2eac:	53                   	push   %rbx
    2ead:	48 83 ec 58          	sub    $0x58,%rsp
    2eb1:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    2eb6:	48 8d 3d 43 42 00 00 	lea    0x4243(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    2ebd:	4c 8d 74 24 20       	lea    0x20(%rsp),%r14
    2ec2:	e8 29 f2 ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    2ec7:	ba 42 00 00 00       	mov    $0x42,%edx
    2ecc:	48 8d 35 95 23 00 00 	lea    0x2395(%rip),%rsi        # 5268 <_IO_stdin_used+0x268>
    2ed3:	48 8d 3d 26 42 00 00 	lea    0x4226(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    2eda:	e8 11 f2 ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    2edf:	ba 12 00 00 00       	mov    $0x12,%edx
    2ee4:	48 8d 35 5b 21 00 00 	lea    0x215b(%rip),%rsi        # 5046 <_IO_stdin_used+0x46>
    2eeb:	48 8d 3d 0e 42 00 00 	lea    0x420e(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    2ef2:	e8 f9 f1 ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    2ef7:	48 8b 05 22 43 00 00 	mov    0x4322(%rip),%rax        # 7220 <_ZSt3cin@GLIBCXX_3.4>
    2efe:	c6 44 24 20 00       	movb   $0x0,0x20(%rsp)
    2f03:	48 c7 44 24 18 00 00 	movq   $0x0,0x18(%rsp)
    2f0a:	00 00 
    2f0c:	48 8b 40 e8          	mov    -0x18(%rax),%rax
    2f10:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
    2f15:	48 8b 9c 05 f0 00 00 	mov    0xf0(%rbp,%rax,1),%rbx
    2f1c:	00 
    2f1d:	48 85 db             	test   %rbx,%rbx
    2f20:	0f 84 04 f3 ff ff    	je     222a <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold+0x1b>
    2f26:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
    2f2a:	0f 84 a8 01 00 00    	je     30d8 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x248>
    2f30:	0f be 53 43          	movsbl 0x43(%rbx),%edx
    2f34:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
    2f39:	48 89 ef             	mov    %rbp,%rdi
    2f3c:	48 89 34 24          	mov    %rsi,(%rsp)
    2f40:	e8 4b f2 ff ff       	call   2190 <_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EES4_@plt>
    2f45:	48 8b 10             	mov    (%rax),%rdx
    2f48:	48 8b 52 e8          	mov    -0x18(%rdx),%rdx
    2f4c:	f6 44 10 20 05       	testb  $0x5,0x20(%rax,%rdx,1)
    2f51:	74 2d                	je     2f80 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xf0>
    2f53:	31 db                	xor    %ebx,%ebx
    2f55:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    2f5a:	4c 39 f7             	cmp    %r14,%rdi
    2f5d:	74 0e                	je     2f6d <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xdd>
    2f5f:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    2f64:	48 8d 70 01          	lea    0x1(%rax),%rsi
    2f68:	e8 73 f1 ff ff       	call   20e0 <_ZdlPvm@plt>
    2f6d:	48 83 c4 58          	add    $0x58,%rsp
    2f71:	89 d8                	mov    %ebx,%eax
    2f73:	5b                   	pop    %rbx
    2f74:	5d                   	pop    %rbp
    2f75:	41 5c                	pop    %r12
    2f77:	41 5d                	pop    %r13
    2f79:	41 5e                	pop    %r14
    2f7b:	41 5f                	pop    %r15
    2f7d:	c3                   	ret
    2f7e:	66 90                	xchg   %ax,%ax
    2f80:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    2f85:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    2f8a:	48 85 ed             	test   %rbp,%rbp
    2f8d:	0f 84 b3 02 00 00    	je     3246 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3b6>
    2f93:	45 31 ff             	xor    %r15d,%r15d
    2f96:	eb 15                	jmp    2fad <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x11d>
    2f98:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    2f9f:	00 
    2fa0:	49 83 c7 01          	add    $0x1,%r15
    2fa4:	4c 39 fd             	cmp    %r15,%rbp
    2fa7:	0f 84 a3 01 00 00    	je     3150 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2c0>
    2fad:	42 0f b6 3c 3b       	movzbl (%rbx,%r15,1),%edi
    2fb2:	e8 79 f0 ff ff       	call   2030 <isspace@plt>
    2fb7:	85 c0                	test   %eax,%eax
    2fb9:	75 e5                	jne    2fa0 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x110>
    2fbb:	49 89 ed             	mov    %rbp,%r13
    2fbe:	eb 03                	jmp    2fc3 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x133>
    2fc0:	4d 89 e5             	mov    %r12,%r13
    2fc3:	4d 39 ef             	cmp    %r13,%r15
    2fc6:	73 13                	jae    2fdb <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x14b>
    2fc8:	42 0f b6 7c 2b ff    	movzbl -0x1(%rbx,%r13,1),%edi
    2fce:	4d 8d 65 ff          	lea    -0x1(%r13),%r12
    2fd2:	e8 59 f0 ff ff       	call   2030 <isspace@plt>
    2fd7:	85 c0                	test   %eax,%eax
    2fd9:	75 e5                	jne    2fc0 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x130>
    2fdb:	4c 89 ea             	mov    %r13,%rdx
    2fde:	4c 29 fa             	sub    %r15,%rdx
    2fe1:	4c 39 fd             	cmp    %r15,%rbp
    2fe4:	0f 82 25 f2 ff ff    	jb     220f <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>
    2fea:	4c 29 fd             	sub    %r15,%rbp
    2fed:	4a 8d 34 3b          	lea    (%rbx,%r15,1),%rsi
    2ff1:	4c 8d 64 24 40       	lea    0x40(%rsp),%r12
    2ff6:	48 39 d5             	cmp    %rdx,%rbp
    2ff9:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    2ffe:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
    3003:	48 0f 47 ea          	cmova  %rdx,%rbp
    3007:	48 8d 14 2e          	lea    (%rsi,%rbp,1),%rdx
    300b:	e8 f0 f6 ff ff       	call   2700 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0>
    3010:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    3015:	48 89 c7             	mov    %rax,%rdi
    3018:	4c 39 f0             	cmp    %r14,%rax
    301b:	0f 84 3f 01 00 00    	je     3160 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2d0>
    3021:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    3026:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
    302b:	48 89 d6             	mov    %rdx,%rsi
    302e:	4c 39 e1             	cmp    %r12,%rcx
    3031:	0f 84 69 01 00 00    	je     31a0 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x310>
    3037:	66 48 0f 6e c2       	movq   %rdx,%xmm0
    303c:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    3041:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    3046:	0f 16 44 24 40       	movhps 0x40(%rsp),%xmm0
    304b:	0f 11 44 24 18       	movups %xmm0,0x18(%rsp)
    3050:	48 85 c0             	test   %rax,%rax
    3053:	0f 84 21 01 00 00    	je     317a <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2ea>
    3059:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    305e:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
    3063:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
    306a:	00 00 
    306c:	c6 00 00             	movb   $0x0,(%rax)
    306f:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    3074:	4c 39 e7             	cmp    %r12,%rdi
    3077:	74 0e                	je     3087 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x1f7>
    3079:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
    307e:	48 8d 70 01          	lea    0x1(%rax),%rsi
    3082:	e8 59 f0 ff ff       	call   20e0 <_ZdlPvm@plt>
    3087:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
    308c:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
    3091:	48 8d 0c 3e          	lea    (%rsi,%rdi,1),%rcx
    3095:	48 39 ce             	cmp    %rcx,%rsi
    3098:	74 1a                	je     30b4 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x224>
    309a:	48 89 f2             	mov    %rsi,%rdx
    309d:	eb 0a                	jmp    30a9 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x219>
    309f:	90                   	nop
    30a0:	48 83 c2 01          	add    $0x1,%rdx
    30a4:	48 39 d1             	cmp    %rdx,%rcx
    30a7:	74 77                	je     3120 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x290>
    30a9:	0f b6 02             	movzbl (%rdx),%eax
    30ac:	83 e8 30             	sub    $0x30,%eax
    30af:	83 f8 09             	cmp    $0x9,%eax
    30b2:	76 ec                	jbe    30a0 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x210>
    30b4:	ba 31 00 00 00       	mov    $0x31,%edx
    30b9:	48 8d 35 f0 21 00 00 	lea    0x21f0(%rip),%rsi        # 52b0 <_IO_stdin_used+0x2b0>
    30c0:	48 8d 3d 39 40 00 00 	lea    0x4039(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    30c7:	e8 24 f0 ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    30cc:	e9 82 fe ff ff       	jmp    2f53 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc3>
    30d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    30d8:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
    30dd:	48 89 df             	mov    %rbx,%rdi
    30e0:	48 89 04 24          	mov    %rax,(%rsp)
    30e4:	e8 17 f0 ff ff       	call   2100 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
    30e9:	48 8b 03             	mov    (%rbx),%rax
    30ec:	48 8d 0d 2d 15 00 00 	lea    0x152d(%rip),%rcx        # 4620 <_ZNKSt5ctypeIcE8do_widenEc>
    30f3:	ba 0a 00 00 00       	mov    $0xa,%edx
    30f8:	48 8b 40 30          	mov    0x30(%rax),%rax
    30fc:	48 39 c8             	cmp    %rcx,%rax
    30ff:	0f 84 2f fe ff ff    	je     2f34 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xa4>
    3105:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
    310a:	be 0a 00 00 00       	mov    $0xa,%esi
    310f:	48 89 df             	mov    %rbx,%rdi
    3112:	48 89 0c 24          	mov    %rcx,(%rsp)
    3116:	ff d0                	call   *%rax
    3118:	0f be d0             	movsbl %al,%edx
    311b:	e9 14 fe ff ff       	jmp    2f34 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xa4>
    3120:	48 83 ff 05          	cmp    $0x5,%rdi
    3124:	0f 84 d6 00 00 00    	je     3200 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x370>
    312a:	ba 0b 00 00 00       	mov    $0xb,%edx
    312f:	48 8d 35 3a 1f 00 00 	lea    0x1f3a(%rip),%rsi        # 5070 <_IO_stdin_used+0x70>
    3136:	48 8d 3d c3 3f 00 00 	lea    0x3fc3(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    313d:	e8 ae ef ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    3142:	e9 0c fe ff ff       	jmp    2f53 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc3>
    3147:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    314e:	00 00 
    3150:	49 89 ed             	mov    %rbp,%r13
    3153:	e9 83 fe ff ff       	jmp    2fdb <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x14b>
    3158:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    315f:	00 
    3160:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
    3165:	4c 39 e2             	cmp    %r12,%rdx
    3168:	74 22                	je     318c <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2fc>
    316a:	f3 0f 6f 44 24 38    	movdqu 0x38(%rsp),%xmm0
    3170:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
    3175:	0f 11 44 24 18       	movups %xmm0,0x18(%rsp)
    317a:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
    317f:	4c 8d 64 24 40       	lea    0x40(%rsp),%r12
    3184:	4c 89 e0             	mov    %r12,%rax
    3187:	e9 d7 fe ff ff       	jmp    3063 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x1d3>
    318c:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    3191:	48 89 d6             	mov    %rdx,%rsi
    3194:	90                   	nop
    3195:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    319c:	00 00 00 00 
    31a0:	48 85 d2             	test   %rdx,%rdx
    31a3:	74 42                	je     31e7 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x357>
    31a5:	48 83 fa 01          	cmp    $0x1,%rdx
    31a9:	0f 84 a1 00 00 00    	je     3250 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3c0>
    31af:	89 d0                	mov    %edx,%eax
    31b1:	83 fa 08             	cmp    $0x8,%edx
    31b4:	0f 83 a9 00 00 00    	jae    3263 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3d3>
    31ba:	f6 c2 04             	test   $0x4,%dl
    31bd:	0f 85 f1 00 00 00    	jne    32b4 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x424>
    31c3:	85 d2                	test   %edx,%edx
    31c5:	74 1a                	je     31e1 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x351>
    31c7:	0f b6 4c 24 40       	movzbl 0x40(%rsp),%ecx
    31cc:	83 e2 02             	and    $0x2,%edx
    31cf:	88 0f                	mov    %cl,(%rdi)
    31d1:	0f 85 fb 00 00 00    	jne    32d2 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x442>
    31d7:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    31dc:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    31e1:	48 89 d6             	mov    %rdx,%rsi
    31e4:	48 89 f8             	mov    %rdi,%rax
    31e7:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
    31ec:	c6 04 30 00          	movb   $0x0,(%rax,%rsi,1)
    31f0:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
    31f5:	e9 69 fe ff ff       	jmp    3063 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x1d3>
    31fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    3200:	81 3e 34 36 31 38    	cmpl   $0x38313634,(%rsi)
    3206:	0f 85 1e ff ff ff    	jne    312a <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x29a>
    320c:	80 7e 04 39          	cmpb   $0x39,0x4(%rsi)
    3210:	0f 85 14 ff ff ff    	jne    312a <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x29a>
    3216:	ba 10 00 00 00       	mov    $0x10,%edx
    321b:	48 8d 35 3d 1e 00 00 	lea    0x1e3d(%rip),%rsi        # 505f <_IO_stdin_used+0x5f>
    3222:	48 8d 3d d7 3e 00 00 	lea    0x3ed7(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    3229:	e8 c2 ee ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    322e:	48 8b 34 24          	mov    (%rsp),%rsi
    3232:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    3237:	e8 44 ee ff ff       	call   2080 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_@plt>
    323c:	bb 01 00 00 00       	mov    $0x1,%ebx
    3241:	e9 0f fd ff ff       	jmp    2f55 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc5>
    3246:	31 d2                	xor    %edx,%edx
    3248:	45 31 ff             	xor    %r15d,%r15d
    324b:	e9 9a fd ff ff       	jmp    2fea <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x15a>
    3250:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
    3255:	88 07                	mov    %al,(%rdi)
    3257:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
    325c:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    3261:	eb 84                	jmp    31e7 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x357>
    3263:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
    3268:	48 89 07             	mov    %rax,(%rdi)
    326b:	89 d0                	mov    %edx,%eax
    326d:	49 8b 4c 04 f8       	mov    -0x8(%r12,%rax,1),%rcx
    3272:	48 89 4c 07 f8       	mov    %rcx,-0x8(%rdi,%rax,1)
    3277:	48 8d 4f 08          	lea    0x8(%rdi),%rcx
    327b:	48 89 f8             	mov    %rdi,%rax
    327e:	4c 89 e7             	mov    %r12,%rdi
    3281:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    3285:	48 29 c8             	sub    %rcx,%rax
    3288:	48 29 c7             	sub    %rax,%rdi
    328b:	01 d0                	add    %edx,%eax
    328d:	83 e0 f8             	and    $0xfffffff8,%eax
    3290:	83 f8 08             	cmp    $0x8,%eax
    3293:	0f 82 3e ff ff ff    	jb     31d7 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x347>
    3299:	83 e0 f8             	and    $0xfffffff8,%eax
    329c:	31 d2                	xor    %edx,%edx
    329e:	89 d6                	mov    %edx,%esi
    32a0:	83 c2 08             	add    $0x8,%edx
    32a3:	4c 8b 04 37          	mov    (%rdi,%rsi,1),%r8
    32a7:	4c 89 04 31          	mov    %r8,(%rcx,%rsi,1)
    32ab:	39 c2                	cmp    %eax,%edx
    32ad:	72 ef                	jb     329e <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x40e>
    32af:	e9 23 ff ff ff       	jmp    31d7 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x347>
    32b4:	8b 54 24 40          	mov    0x40(%rsp),%edx
    32b8:	89 17                	mov    %edx,(%rdi)
    32ba:	41 8b 54 04 fc       	mov    -0x4(%r12,%rax,1),%edx
    32bf:	89 54 07 fc          	mov    %edx,-0x4(%rdi,%rax,1)
    32c3:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    32c8:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    32cd:	e9 0f ff ff ff       	jmp    31e1 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x351>
    32d2:	41 0f b7 54 04 fe    	movzwl -0x2(%r12,%rax,1),%edx
    32d8:	66 89 54 07 fe       	mov    %dx,-0x2(%rdi,%rax,1)
    32dd:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    32e2:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    32e7:	e9 f5 fe ff ff       	jmp    31e1 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x351>
    32ec:	e9 47 ef ff ff       	jmp    2238 <_Z7puzzle1RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold+0x29>
    32f1:	0f 1f 40 00          	nopl   0x0(%rax)
    32f5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    32fc:	00 00 00 00 

0000000000003300 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
    3300:	41 57                	push   %r15
    3302:	ba 16 00 00 00       	mov    $0x16,%edx
    3307:	48 8d 35 6e 1d 00 00 	lea    0x1d6e(%rip),%rsi        # 507c <_IO_stdin_used+0x7c>
    330e:	41 56                	push   %r14
    3310:	41 55                	push   %r13
    3312:	41 54                	push   %r12
    3314:	55                   	push   %rbp
    3315:	48 8d 2d 04 3f 00 00 	lea    0x3f04(%rip),%rbp        # 7220 <_ZSt3cin@GLIBCXX_3.4>
    331c:	53                   	push   %rbx
    331d:	48 83 ec 58          	sub    $0x58,%rsp
    3321:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    3326:	48 8d 3d d3 3d 00 00 	lea    0x3dd3(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    332d:	4c 8d 74 24 20       	lea    0x20(%rsp),%r14
    3332:	e8 b9 ed ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    3337:	ba 54 00 00 00       	mov    $0x54,%edx
    333c:	48 8d 35 a5 1f 00 00 	lea    0x1fa5(%rip),%rsi        # 52e8 <_IO_stdin_used+0x2e8>
    3343:	48 8d 3d b6 3d 00 00 	lea    0x3db6(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    334a:	e8 a1 ed ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    334f:	ba 24 00 00 00       	mov    $0x24,%edx
    3354:	48 8d 35 e5 1f 00 00 	lea    0x1fe5(%rip),%rsi        # 5340 <_IO_stdin_used+0x340>
    335b:	48 8d 3d 9e 3d 00 00 	lea    0x3d9e(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    3362:	e8 89 ed ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    3367:	48 8b 05 b2 3e 00 00 	mov    0x3eb2(%rip),%rax        # 7220 <_ZSt3cin@GLIBCXX_3.4>
    336e:	c6 44 24 20 00       	movb   $0x0,0x20(%rsp)
    3373:	48 c7 44 24 18 00 00 	movq   $0x0,0x18(%rsp)
    337a:	00 00 
    337c:	48 8b 40 e8          	mov    -0x18(%rax),%rax
    3380:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
    3385:	48 8b 9c 05 f0 00 00 	mov    0xf0(%rbp,%rax,1),%rbx
    338c:	00 
    338d:	48 85 db             	test   %rbx,%rbx
    3390:	0f 84 b6 ee ff ff    	je     224c <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>
    3396:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
    339a:	0f 84 80 01 00 00    	je     3520 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x220>
    33a0:	0f be 53 43          	movsbl 0x43(%rbx),%edx
    33a4:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
    33a9:	48 89 ef             	mov    %rbp,%rdi
    33ac:	48 89 34 24          	mov    %rsi,(%rsp)
    33b0:	e8 db ed ff ff       	call   2190 <_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EES4_@plt>
    33b5:	48 8b 10             	mov    (%rax),%rdx
    33b8:	48 8b 52 e8          	mov    -0x18(%rdx),%rdx
    33bc:	f6 44 10 20 05       	testb  $0x5,0x20(%rax,%rdx,1)
    33c1:	74 2d                	je     33f0 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xf0>
    33c3:	31 db                	xor    %ebx,%ebx
    33c5:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    33ca:	4c 39 f7             	cmp    %r14,%rdi
    33cd:	74 0e                	je     33dd <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xdd>
    33cf:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    33d4:	48 8d 70 01          	lea    0x1(%rax),%rsi
    33d8:	e8 03 ed ff ff       	call   20e0 <_ZdlPvm@plt>
    33dd:	48 83 c4 58          	add    $0x58,%rsp
    33e1:	89 d8                	mov    %ebx,%eax
    33e3:	5b                   	pop    %rbx
    33e4:	5d                   	pop    %rbp
    33e5:	41 5c                	pop    %r12
    33e7:	41 5d                	pop    %r13
    33e9:	41 5e                	pop    %r14
    33eb:	41 5f                	pop    %r15
    33ed:	c3                   	ret
    33ee:	66 90                	xchg   %ax,%ax
    33f0:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    33f5:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    33fa:	45 31 ff             	xor    %r15d,%r15d
    33fd:	48 85 ed             	test   %rbp,%rbp
    3400:	75 1b                	jne    341d <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x11d>
    3402:	e9 5b 02 00 00       	jmp    3662 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x362>
    3407:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    340e:	00 00 
    3410:	49 83 c7 01          	add    $0x1,%r15
    3414:	4c 39 fd             	cmp    %r15,%rbp
    3417:	0f 84 53 01 00 00    	je     3570 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x270>
    341d:	42 0f b6 3c 3b       	movzbl (%rbx,%r15,1),%edi
    3422:	e8 09 ec ff ff       	call   2030 <isspace@plt>
    3427:	85 c0                	test   %eax,%eax
    3429:	75 e5                	jne    3410 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x110>
    342b:	49 89 ed             	mov    %rbp,%r13
    342e:	eb 03                	jmp    3433 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x133>
    3430:	4d 89 e5             	mov    %r12,%r13
    3433:	4d 39 ef             	cmp    %r13,%r15
    3436:	73 13                	jae    344b <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x14b>
    3438:	42 0f b6 7c 2b ff    	movzbl -0x1(%rbx,%r13,1),%edi
    343e:	4d 8d 65 ff          	lea    -0x1(%r13),%r12
    3442:	e8 e9 eb ff ff       	call   2030 <isspace@plt>
    3447:	85 c0                	test   %eax,%eax
    3449:	75 e5                	jne    3430 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x130>
    344b:	4c 89 ea             	mov    %r13,%rdx
    344e:	4c 29 fa             	sub    %r15,%rdx
    3451:	4c 39 fd             	cmp    %r15,%rbp
    3454:	0f 82 00 ee ff ff    	jb     225a <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold+0xe>
    345a:	4c 29 fd             	sub    %r15,%rbp
    345d:	4a 8d 34 3b          	lea    (%rbx,%r15,1),%rsi
    3461:	4c 8d 64 24 40       	lea    0x40(%rsp),%r12
    3466:	48 39 d5             	cmp    %rdx,%rbp
    3469:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    346e:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
    3473:	48 0f 47 ea          	cmova  %rdx,%rbp
    3477:	48 8d 14 2e          	lea    (%rsi,%rbp,1),%rdx
    347b:	e8 80 f2 ff ff       	call   2700 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0>
    3480:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    3485:	48 89 c7             	mov    %rax,%rdi
    3488:	4c 39 f0             	cmp    %r14,%rax
    348b:	0f 84 3f 01 00 00    	je     35d0 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2d0>
    3491:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    3496:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
    349b:	48 89 d6             	mov    %rdx,%rsi
    349e:	4c 39 e1             	cmp    %r12,%rcx
    34a1:	0f 84 69 01 00 00    	je     3610 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x310>
    34a7:	66 48 0f 6e c2       	movq   %rdx,%xmm0
    34ac:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    34b1:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    34b6:	0f 16 44 24 40       	movhps 0x40(%rsp),%xmm0
    34bb:	0f 11 44 24 18       	movups %xmm0,0x18(%rsp)
    34c0:	48 85 c0             	test   %rax,%rax
    34c3:	0f 84 21 01 00 00    	je     35ea <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2ea>
    34c9:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    34ce:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
    34d3:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
    34da:	00 00 
    34dc:	c6 00 00             	movb   $0x0,(%rax)
    34df:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    34e4:	4c 39 e7             	cmp    %r12,%rdi
    34e7:	74 0e                	je     34f7 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x1f7>
    34e9:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
    34ee:	48 8d 70 01          	lea    0x1(%rax),%rsi
    34f2:	e8 e9 eb ff ff       	call   20e0 <_ZdlPvm@plt>
    34f7:	48 83 7c 24 18 05    	cmpq   $0x5,0x18(%rsp)
    34fd:	0f 84 7d 00 00 00    	je     3580 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x280>
    3503:	ba 0b 00 00 00       	mov    $0xb,%edx
    3508:	48 8d 35 61 1b 00 00 	lea    0x1b61(%rip),%rsi        # 5070 <_IO_stdin_used+0x70>
    350f:	48 8d 3d ea 3b 00 00 	lea    0x3bea(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    3516:	e8 d5 eb ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    351b:	e9 a3 fe ff ff       	jmp    33c3 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc3>
    3520:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
    3525:	48 89 df             	mov    %rbx,%rdi
    3528:	48 89 04 24          	mov    %rax,(%rsp)
    352c:	e8 cf eb ff ff       	call   2100 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
    3531:	48 8b 03             	mov    (%rbx),%rax
    3534:	48 8d 0d e5 10 00 00 	lea    0x10e5(%rip),%rcx        # 4620 <_ZNKSt5ctypeIcE8do_widenEc>
    353b:	ba 0a 00 00 00       	mov    $0xa,%edx
    3540:	48 8b 40 30          	mov    0x30(%rax),%rax
    3544:	48 39 c8             	cmp    %rcx,%rax
    3547:	0f 84 57 fe ff ff    	je     33a4 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xa4>
    354d:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
    3552:	be 0a 00 00 00       	mov    $0xa,%esi
    3557:	48 89 df             	mov    %rbx,%rdi
    355a:	48 89 0c 24          	mov    %rcx,(%rsp)
    355e:	ff d0                	call   *%rax
    3560:	0f be d0             	movsbl %al,%edx
    3563:	e9 3c fe ff ff       	jmp    33a4 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xa4>
    3568:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    356f:	00 
    3570:	49 89 ed             	mov    %rbp,%r13
    3573:	e9 d3 fe ff ff       	jmp    344b <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x14b>
    3578:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    357f:	00 
    3580:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    3585:	81 38 71 6f 67 69    	cmpl   $0x69676f71,(%rax)
    358b:	0f 85 72 ff ff ff    	jne    3503 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x203>
    3591:	80 78 04 63          	cmpb   $0x63,0x4(%rax)
    3595:	0f 85 68 ff ff ff    	jne    3503 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x203>
    359b:	ba 10 00 00 00       	mov    $0x10,%edx
    35a0:	48 8d 35 f2 1a 00 00 	lea    0x1af2(%rip),%rsi        # 5099 <_IO_stdin_used+0x99>
    35a7:	48 8d 3d 52 3b 00 00 	lea    0x3b52(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    35ae:	e8 3d eb ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    35b3:	48 8b 34 24          	mov    (%rsp),%rsi
    35b7:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    35bc:	e8 bf ea ff ff       	call   2080 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_@plt>
    35c1:	bb 01 00 00 00       	mov    $0x1,%ebx
    35c6:	e9 fa fd ff ff       	jmp    33c5 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc5>
    35cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    35d0:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
    35d5:	4c 39 e2             	cmp    %r12,%rdx
    35d8:	74 22                	je     35fc <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2fc>
    35da:	f3 0f 6f 44 24 38    	movdqu 0x38(%rsp),%xmm0
    35e0:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
    35e5:	0f 11 44 24 18       	movups %xmm0,0x18(%rsp)
    35ea:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
    35ef:	4c 8d 64 24 40       	lea    0x40(%rsp),%r12
    35f4:	4c 89 e0             	mov    %r12,%rax
    35f7:	e9 d7 fe ff ff       	jmp    34d3 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x1d3>
    35fc:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    3601:	48 89 d6             	mov    %rdx,%rsi
    3604:	90                   	nop
    3605:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    360c:	00 00 00 00 
    3610:	48 85 d2             	test   %rdx,%rdx
    3613:	74 3a                	je     364f <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x34f>
    3615:	48 83 fa 01          	cmp    $0x1,%rdx
    3619:	74 4e                	je     3669 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x369>
    361b:	89 d0                	mov    %edx,%eax
    361d:	83 fa 08             	cmp    $0x8,%edx
    3620:	73 5a                	jae    367c <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x37c>
    3622:	f6 c2 04             	test   $0x4,%dl
    3625:	0f 85 9e 00 00 00    	jne    36c9 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3c9>
    362b:	85 d2                	test   %edx,%edx
    362d:	74 1a                	je     3649 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x349>
    362f:	0f b6 4c 24 40       	movzbl 0x40(%rsp),%ecx
    3634:	83 e2 02             	and    $0x2,%edx
    3637:	88 0f                	mov    %cl,(%rdi)
    3639:	0f 85 a8 00 00 00    	jne    36e7 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3e7>
    363f:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    3644:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    3649:	48 89 d6             	mov    %rdx,%rsi
    364c:	48 89 f8             	mov    %rdi,%rax
    364f:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
    3654:	c6 04 30 00          	movb   $0x0,(%rax,%rsi,1)
    3658:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
    365d:	e9 71 fe ff ff       	jmp    34d3 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x1d3>
    3662:	31 d2                	xor    %edx,%edx
    3664:	e9 f1 fd ff ff       	jmp    345a <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x15a>
    3669:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
    366e:	88 07                	mov    %al,(%rdi)
    3670:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
    3675:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    367a:	eb d3                	jmp    364f <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x34f>
    367c:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
    3681:	48 89 07             	mov    %rax,(%rdi)
    3684:	89 d0                	mov    %edx,%eax
    3686:	49 8b 4c 04 f8       	mov    -0x8(%r12,%rax,1),%rcx
    368b:	48 89 4c 07 f8       	mov    %rcx,-0x8(%rdi,%rax,1)
    3690:	48 8d 4f 08          	lea    0x8(%rdi),%rcx
    3694:	48 89 f8             	mov    %rdi,%rax
    3697:	4c 89 e7             	mov    %r12,%rdi
    369a:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    369e:	48 29 c8             	sub    %rcx,%rax
    36a1:	48 29 c7             	sub    %rax,%rdi
    36a4:	01 d0                	add    %edx,%eax
    36a6:	83 e0 f8             	and    $0xfffffff8,%eax
    36a9:	83 f8 08             	cmp    $0x8,%eax
    36ac:	72 91                	jb     363f <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x33f>
    36ae:	83 e0 f8             	and    $0xfffffff8,%eax
    36b1:	31 d2                	xor    %edx,%edx
    36b3:	89 d6                	mov    %edx,%esi
    36b5:	83 c2 08             	add    $0x8,%edx
    36b8:	4c 8b 04 37          	mov    (%rdi,%rsi,1),%r8
    36bc:	4c 89 04 31          	mov    %r8,(%rcx,%rsi,1)
    36c0:	39 c2                	cmp    %eax,%edx
    36c2:	72 ef                	jb     36b3 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3b3>
    36c4:	e9 76 ff ff ff       	jmp    363f <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x33f>
    36c9:	8b 54 24 40          	mov    0x40(%rsp),%edx
    36cd:	89 17                	mov    %edx,(%rdi)
    36cf:	41 8b 54 04 fc       	mov    -0x4(%r12,%rax,1),%edx
    36d4:	89 54 07 fc          	mov    %edx,-0x4(%rdi,%rax,1)
    36d8:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    36dd:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    36e2:	e9 62 ff ff ff       	jmp    3649 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x349>
    36e7:	41 0f b7 54 04 fe    	movzwl -0x2(%r12,%rax,1),%edx
    36ed:	66 89 54 07 fe       	mov    %dx,-0x2(%rdi,%rax,1)
    36f2:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    36f7:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    36fc:	e9 48 ff ff ff       	jmp    3649 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x349>
    3701:	e9 6f eb ff ff       	jmp    2275 <_Z7puzzle2RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold+0x29>
    3706:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    370d:	00 00 00 

0000000000003710 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
    3710:	41 57                	push   %r15
    3712:	ba 18 00 00 00       	mov    $0x18,%edx
    3717:	48 8d 35 8c 19 00 00 	lea    0x198c(%rip),%rsi        # 50aa <_IO_stdin_used+0xaa>
    371e:	41 56                	push   %r14
    3720:	41 55                	push   %r13
    3722:	41 54                	push   %r12
    3724:	55                   	push   %rbp
    3725:	48 8d 2d f4 3a 00 00 	lea    0x3af4(%rip),%rbp        # 7220 <_ZSt3cin@GLIBCXX_3.4>
    372c:	53                   	push   %rbx
    372d:	48 83 ec 58          	sub    $0x58,%rsp
    3731:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    3736:	48 8d 3d c3 39 00 00 	lea    0x39c3(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    373d:	4c 8d 74 24 20       	lea    0x20(%rsp),%r14
    3742:	e8 a9 e9 ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    3747:	ba 52 00 00 00       	mov    $0x52,%edx
    374c:	48 8d 35 15 1c 00 00 	lea    0x1c15(%rip),%rsi        # 5368 <_IO_stdin_used+0x368>
    3753:	48 8d 3d a6 39 00 00 	lea    0x39a6(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    375a:	e8 91 e9 ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    375f:	ba 0f 00 00 00       	mov    $0xf,%edx
    3764:	48 8d 35 58 19 00 00 	lea    0x1958(%rip),%rsi        # 50c3 <_IO_stdin_used+0xc3>
    376b:	48 8d 3d 8e 39 00 00 	lea    0x398e(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    3772:	e8 79 e9 ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    3777:	48 8b 05 a2 3a 00 00 	mov    0x3aa2(%rip),%rax        # 7220 <_ZSt3cin@GLIBCXX_3.4>
    377e:	c6 44 24 20 00       	movb   $0x0,0x20(%rsp)
    3783:	48 c7 44 24 18 00 00 	movq   $0x0,0x18(%rsp)
    378a:	00 00 
    378c:	48 8b 40 e8          	mov    -0x18(%rax),%rax
    3790:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
    3795:	48 8b 9c 05 f0 00 00 	mov    0xf0(%rbp,%rax,1),%rbx
    379c:	00 
    379d:	48 85 db             	test   %rbx,%rbx
    37a0:	0f 84 fe ea ff ff    	je     22a4 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold+0x1b>
    37a6:	80 7b 38 00          	cmpb   $0x0,0x38(%rbx)
    37aa:	0f 84 a8 01 00 00    	je     3958 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x248>
    37b0:	0f be 53 43          	movsbl 0x43(%rbx),%edx
    37b4:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
    37b9:	48 89 ef             	mov    %rbp,%rdi
    37bc:	48 89 34 24          	mov    %rsi,(%rsp)
    37c0:	e8 cb e9 ff ff       	call   2190 <_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EES4_@plt>
    37c5:	48 8b 10             	mov    (%rax),%rdx
    37c8:	48 8b 52 e8          	mov    -0x18(%rdx),%rdx
    37cc:	f6 44 10 20 05       	testb  $0x5,0x20(%rax,%rdx,1)
    37d1:	74 2d                	je     3800 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xf0>
    37d3:	31 db                	xor    %ebx,%ebx
    37d5:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    37da:	4c 39 f7             	cmp    %r14,%rdi
    37dd:	74 0e                	je     37ed <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xdd>
    37df:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    37e4:	48 8d 70 01          	lea    0x1(%rax),%rsi
    37e8:	e8 f3 e8 ff ff       	call   20e0 <_ZdlPvm@plt>
    37ed:	48 83 c4 58          	add    $0x58,%rsp
    37f1:	89 d8                	mov    %ebx,%eax
    37f3:	5b                   	pop    %rbx
    37f4:	5d                   	pop    %rbp
    37f5:	41 5c                	pop    %r12
    37f7:	41 5d                	pop    %r13
    37f9:	41 5e                	pop    %r14
    37fb:	41 5f                	pop    %r15
    37fd:	c3                   	ret
    37fe:	66 90                	xchg   %ax,%ax
    3800:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
    3805:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
    380a:	48 85 ed             	test   %rbp,%rbp
    380d:	0f 84 b2 02 00 00    	je     3ac5 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3b5>
    3813:	45 31 ff             	xor    %r15d,%r15d
    3816:	eb 15                	jmp    382d <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x11d>
    3818:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    381f:	00 
    3820:	49 83 c7 01          	add    $0x1,%r15
    3824:	4c 39 fd             	cmp    %r15,%rbp
    3827:	0f 84 a3 01 00 00    	je     39d0 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2c0>
    382d:	42 0f b6 3c 3b       	movzbl (%rbx,%r15,1),%edi
    3832:	e8 f9 e7 ff ff       	call   2030 <isspace@plt>
    3837:	85 c0                	test   %eax,%eax
    3839:	75 e5                	jne    3820 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x110>
    383b:	49 89 ed             	mov    %rbp,%r13
    383e:	eb 03                	jmp    3843 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x133>
    3840:	4d 89 e5             	mov    %r12,%r13
    3843:	4d 39 ef             	cmp    %r13,%r15
    3846:	73 13                	jae    385b <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x14b>
    3848:	42 0f b6 7c 2b ff    	movzbl -0x1(%rbx,%r13,1),%edi
    384e:	4d 8d 65 ff          	lea    -0x1(%r13),%r12
    3852:	e8 d9 e7 ff ff       	call   2030 <isspace@plt>
    3857:	85 c0                	test   %eax,%eax
    3859:	75 e5                	jne    3840 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x130>
    385b:	4c 89 ea             	mov    %r13,%rdx
    385e:	4c 29 fa             	sub    %r15,%rdx
    3861:	4c 39 fd             	cmp    %r15,%rbp
    3864:	0f 82 1f ea ff ff    	jb     2289 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>
    386a:	4c 29 fd             	sub    %r15,%rbp
    386d:	4a 8d 34 3b          	lea    (%rbx,%r15,1),%rsi
    3871:	4c 8d 64 24 40       	lea    0x40(%rsp),%r12
    3876:	48 39 d5             	cmp    %rdx,%rbp
    3879:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    387e:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
    3883:	48 0f 47 ea          	cmova  %rdx,%rbp
    3887:	48 8d 14 2e          	lea    (%rsi,%rbp,1),%rdx
    388b:	e8 70 ee ff ff       	call   2700 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag.isra.0>
    3890:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    3895:	48 89 c7             	mov    %rax,%rdi
    3898:	4c 39 f0             	cmp    %r14,%rax
    389b:	0f 84 3f 01 00 00    	je     39e0 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2d0>
    38a1:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    38a6:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
    38ab:	48 89 d6             	mov    %rdx,%rsi
    38ae:	4c 39 e1             	cmp    %r12,%rcx
    38b1:	0f 84 69 01 00 00    	je     3a20 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x310>
    38b7:	66 48 0f 6e c2       	movq   %rdx,%xmm0
    38bc:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    38c1:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    38c6:	0f 16 44 24 40       	movhps 0x40(%rsp),%xmm0
    38cb:	0f 11 44 24 18       	movups %xmm0,0x18(%rsp)
    38d0:	48 85 c0             	test   %rax,%rax
    38d3:	0f 84 21 01 00 00    	je     39fa <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2ea>
    38d9:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    38de:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
    38e3:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
    38ea:	00 00 
    38ec:	c6 00 00             	movb   $0x0,(%rax)
    38ef:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    38f4:	4c 39 e7             	cmp    %r12,%rdi
    38f7:	74 0e                	je     3907 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x1f7>
    38f9:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
    38fe:	48 8d 70 01          	lea    0x1(%rax),%rsi
    3902:	e8 d9 e7 ff ff       	call   20e0 <_ZdlPvm@plt>
    3907:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
    390c:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
    3911:	48 8d 0c 3e          	lea    (%rsi,%rdi,1),%rcx
    3915:	48 39 ce             	cmp    %rcx,%rsi
    3918:	74 1a                	je     3934 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x224>
    391a:	48 89 f2             	mov    %rsi,%rdx
    391d:	eb 0a                	jmp    3929 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x219>
    391f:	90                   	nop
    3920:	48 83 c2 01          	add    $0x1,%rdx
    3924:	48 39 d1             	cmp    %rdx,%rcx
    3927:	74 77                	je     39a0 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x290>
    3929:	0f b6 02             	movzbl (%rdx),%eax
    392c:	83 e8 30             	sub    $0x30,%eax
    392f:	83 f8 09             	cmp    $0x9,%eax
    3932:	76 ec                	jbe    3920 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x210>
    3934:	ba 17 00 00 00       	mov    $0x17,%edx
    3939:	48 8d 35 93 17 00 00 	lea    0x1793(%rip),%rsi        # 50d3 <_IO_stdin_used+0xd3>
    3940:	48 8d 3d b9 37 00 00 	lea    0x37b9(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    3947:	e8 a4 e7 ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    394c:	e9 82 fe ff ff       	jmp    37d3 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc3>
    3951:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3958:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
    395d:	48 89 df             	mov    %rbx,%rdi
    3960:	48 89 04 24          	mov    %rax,(%rsp)
    3964:	e8 97 e7 ff ff       	call   2100 <_ZNKSt5ctypeIcE13_M_widen_initEv@plt>
    3969:	48 8b 03             	mov    (%rbx),%rax
    396c:	48 8d 0d ad 0c 00 00 	lea    0xcad(%rip),%rcx        # 4620 <_ZNKSt5ctypeIcE8do_widenEc>
    3973:	ba 0a 00 00 00       	mov    $0xa,%edx
    3978:	48 8b 40 30          	mov    0x30(%rax),%rax
    397c:	48 39 c8             	cmp    %rcx,%rax
    397f:	0f 84 2f fe ff ff    	je     37b4 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xa4>
    3985:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
    398a:	be 0a 00 00 00       	mov    $0xa,%esi
    398f:	48 89 df             	mov    %rbx,%rdi
    3992:	48 89 0c 24          	mov    %rcx,(%rsp)
    3996:	ff d0                	call   *%rax
    3998:	0f be d0             	movsbl %al,%edx
    399b:	e9 14 fe ff ff       	jmp    37b4 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xa4>
    39a0:	48 83 ff 03          	cmp    $0x3,%rdi
    39a4:	0f 84 d6 00 00 00    	je     3a80 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x370>
    39aa:	ba 0b 00 00 00       	mov    $0xb,%edx
    39af:	48 8d 35 ba 16 00 00 	lea    0x16ba(%rip),%rsi        # 5070 <_IO_stdin_used+0x70>
    39b6:	48 8d 3d 43 37 00 00 	lea    0x3743(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    39bd:	e8 2e e7 ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    39c2:	e9 0c fe ff ff       	jmp    37d3 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc3>
    39c7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    39ce:	00 00 
    39d0:	49 89 ed             	mov    %rbp,%r13
    39d3:	e9 83 fe ff ff       	jmp    385b <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x14b>
    39d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    39df:	00 
    39e0:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
    39e5:	4c 39 e2             	cmp    %r12,%rdx
    39e8:	74 22                	je     3a0c <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x2fc>
    39ea:	f3 0f 6f 44 24 38    	movdqu 0x38(%rsp),%xmm0
    39f0:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
    39f5:	0f 11 44 24 18       	movups %xmm0,0x18(%rsp)
    39fa:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
    39ff:	4c 8d 64 24 40       	lea    0x40(%rsp),%r12
    3a04:	4c 89 e0             	mov    %r12,%rax
    3a07:	e9 d7 fe ff ff       	jmp    38e3 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x1d3>
    3a0c:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    3a11:	48 89 d6             	mov    %rdx,%rsi
    3a14:	90                   	nop
    3a15:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    3a1c:	00 00 00 00 
    3a20:	48 85 d2             	test   %rdx,%rdx
    3a23:	74 42                	je     3a67 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x357>
    3a25:	48 83 fa 01          	cmp    $0x1,%rdx
    3a29:	0f 84 a0 00 00 00    	je     3acf <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3bf>
    3a2f:	89 d0                	mov    %edx,%eax
    3a31:	83 fa 08             	cmp    $0x8,%edx
    3a34:	0f 83 a8 00 00 00    	jae    3ae2 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x3d2>
    3a3a:	f6 c2 04             	test   $0x4,%dl
    3a3d:	0f 85 f0 00 00 00    	jne    3b33 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x423>
    3a43:	85 d2                	test   %edx,%edx
    3a45:	74 1a                	je     3a61 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x351>
    3a47:	0f b6 4c 24 40       	movzbl 0x40(%rsp),%ecx
    3a4c:	83 e2 02             	and    $0x2,%edx
    3a4f:	88 0f                	mov    %cl,(%rdi)
    3a51:	0f 85 fa 00 00 00    	jne    3b51 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x441>
    3a57:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    3a5c:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    3a61:	48 89 d6             	mov    %rdx,%rsi
    3a64:	48 89 f8             	mov    %rdi,%rax
    3a67:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
    3a6c:	c6 04 30 00          	movb   $0x0,(%rax,%rsi,1)
    3a70:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
    3a75:	e9 69 fe ff ff       	jmp    38e3 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x1d3>
    3a7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    3a80:	66 81 3e 32 32       	cmpw   $0x3232,(%rsi)
    3a85:	0f 85 1f ff ff ff    	jne    39aa <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x29a>
    3a8b:	80 7e 02 31          	cmpb   $0x31,0x2(%rsi)
    3a8f:	0f 85 15 ff ff ff    	jne    39aa <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x29a>
    3a95:	ba 10 00 00 00       	mov    $0x10,%edx
    3a9a:	48 8d 35 4e 16 00 00 	lea    0x164e(%rip),%rsi        # 50ef <_IO_stdin_used+0xef>
    3aa1:	48 8d 3d 58 36 00 00 	lea    0x3658(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    3aa8:	e8 43 e6 ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    3aad:	48 8b 34 24          	mov    (%rsp),%rsi
    3ab1:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    3ab6:	e8 c5 e5 ff ff       	call   2080 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_@plt>
    3abb:	bb 01 00 00 00       	mov    $0x1,%ebx
    3ac0:	e9 10 fd ff ff       	jmp    37d5 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xc5>
    3ac5:	31 d2                	xor    %edx,%edx
    3ac7:	45 31 ff             	xor    %r15d,%r15d
    3aca:	e9 9b fd ff ff       	jmp    386a <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x15a>
    3acf:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
    3ad4:	88 07                	mov    %al,(%rdi)
    3ad6:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
    3adb:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    3ae0:	eb 85                	jmp    3a67 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x357>
    3ae2:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
    3ae7:	48 89 07             	mov    %rax,(%rdi)
    3aea:	89 d0                	mov    %edx,%eax
    3aec:	49 8b 4c 04 f8       	mov    -0x8(%r12,%rax,1),%rcx
    3af1:	48 89 4c 07 f8       	mov    %rcx,-0x8(%rdi,%rax,1)
    3af6:	48 8d 4f 08          	lea    0x8(%rdi),%rcx
    3afa:	48 89 f8             	mov    %rdi,%rax
    3afd:	4c 89 e7             	mov    %r12,%rdi
    3b00:	48 83 e1 f8          	and    $0xfffffffffffffff8,%rcx
    3b04:	48 29 c8             	sub    %rcx,%rax
    3b07:	48 29 c7             	sub    %rax,%rdi
    3b0a:	01 d0                	add    %edx,%eax
    3b0c:	83 e0 f8             	and    $0xfffffff8,%eax
    3b0f:	83 f8 08             	cmp    $0x8,%eax
    3b12:	0f 82 3f ff ff ff    	jb     3a57 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x347>
    3b18:	83 e0 f8             	and    $0xfffffff8,%eax
    3b1b:	31 d2                	xor    %edx,%edx
    3b1d:	89 d6                	mov    %edx,%esi
    3b1f:	83 c2 08             	add    $0x8,%edx
    3b22:	4c 8b 04 37          	mov    (%rdi,%rsi,1),%r8
    3b26:	4c 89 04 31          	mov    %r8,(%rcx,%rsi,1)
    3b2a:	39 c2                	cmp    %eax,%edx
    3b2c:	72 ef                	jb     3b1d <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x40d>
    3b2e:	e9 24 ff ff ff       	jmp    3a57 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x347>
    3b33:	8b 54 24 40          	mov    0x40(%rsp),%edx
    3b37:	89 17                	mov    %edx,(%rdi)
    3b39:	41 8b 54 04 fc       	mov    -0x4(%r12,%rax,1),%edx
    3b3e:	89 54 07 fc          	mov    %edx,-0x4(%rdi,%rax,1)
    3b42:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    3b47:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    3b4c:	e9 10 ff ff ff       	jmp    3a61 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x351>
    3b51:	41 0f b7 54 04 fe    	movzwl -0x2(%r12,%rax,1),%edx
    3b57:	66 89 54 07 fe       	mov    %dx,-0x2(%rdi,%rax,1)
    3b5c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    3b61:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    3b66:	e9 f6 fe ff ff       	jmp    3a61 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x351>
    3b6b:	e9 42 e7 ff ff       	jmp    22b2 <_Z7puzzle3RNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold+0x29>

0000000000003b70 <_Z10b64_decodeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
    3b70:	41 57                	push   %r15
    3b72:	41 56                	push   %r14
    3b74:	41 55                	push   %r13
    3b76:	49 89 f5             	mov    %rsi,%r13
    3b79:	41 54                	push   %r12
    3b7b:	49 89 fc             	mov    %rdi,%r12
    3b7e:	bf 00 04 00 00       	mov    $0x400,%edi
    3b83:	55                   	push   %rbp
    3b84:	53                   	push   %rbx
    3b85:	48 83 ec 18          	sub    $0x18,%rsp
    3b89:	e8 42 e5 ff ff       	call   20d0 <_Znwm@plt>
    3b8e:	48 8d 78 08          	lea    0x8(%rax),%rdi
    3b92:	48 89 c1             	mov    %rax,%rcx
    3b95:	48 c7 00 ff ff ff ff 	movq   $0xffffffffffffffff,(%rax)
    3b9c:	48 89 c3             	mov    %rax,%rbx
    3b9f:	48 c7 80 f8 03 00 00 	movq   $0xffffffffffffffff,0x3f8(%rax)
    3ba6:	ff ff ff ff 
    3baa:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
    3bae:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    3bb5:	48 29 f9             	sub    %rdi,%rcx
    3bb8:	81 c1 00 04 00 00    	add    $0x400,%ecx
    3bbe:	c1 e9 03             	shr    $0x3,%ecx
    3bc1:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    3bc4:	31 c0                	xor    %eax,%eax
    3bc6:	48 8b 0d 73 37 00 00 	mov    0x3773(%rip),%rcx        # 7340 <_ZL10b64_digits>
    3bcd:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    3bd4:	00 
    3bd5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    3bdc:	00 00 00 00 
    3be0:	0f b6 14 01          	movzbl (%rcx,%rax,1),%edx
    3be4:	89 04 93             	mov    %eax,(%rbx,%rdx,4)
    3be7:	48 83 c0 01          	add    $0x1,%rax
    3beb:	48 83 f8 40          	cmp    $0x40,%rax
    3bef:	75 ef                	jne    3be0 <_Z10b64_decodeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x70>
    3bf1:	49 8b 6d 00          	mov    0x0(%r13),%rbp
    3bf5:	4d 8b 7d 08          	mov    0x8(%r13),%r15
    3bf9:	66 0f ef c0          	pxor   %xmm0,%xmm0
    3bfd:	49 c7 44 24 10 00 00 	movq   $0x0,0x10(%r12)
    3c04:	00 00 
    3c06:	41 0f 11 04 24       	movups %xmm0,(%r12)
    3c0b:	49 01 ef             	add    %rbp,%r15
    3c0e:	4c 39 fd             	cmp    %r15,%rbp
    3c11:	74 5e                	je     3c71 <_Z10b64_decodeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x101>
    3c13:	41 be f8 ff ff ff    	mov    $0xfffffff8,%r14d
    3c19:	45 31 ed             	xor    %r13d,%r13d
    3c1c:	eb 0e                	jmp    3c2c <_Z10b64_decodeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xbc>
    3c1e:	66 90                	xchg   %ax,%ax
    3c20:	48 83 c5 01          	add    $0x1,%rbp
    3c24:	41 89 ce             	mov    %ecx,%r14d
    3c27:	49 39 ef             	cmp    %rbp,%r15
    3c2a:	74 45                	je     3c71 <_Z10b64_decodeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x101>
    3c2c:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
    3c30:	8b 04 83             	mov    (%rbx,%rax,4),%eax
    3c33:	83 f8 ff             	cmp    $0xffffffff,%eax
    3c36:	74 39                	je     3c71 <_Z10b64_decodeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x101>
    3c38:	41 c1 e5 06          	shl    $0x6,%r13d
    3c3c:	44 89 f1             	mov    %r14d,%ecx
    3c3f:	41 01 c5             	add    %eax,%r13d
    3c42:	83 c1 06             	add    $0x6,%ecx
    3c45:	78 d9                	js     3c20 <_Z10b64_decodeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xb0>
    3c47:	44 89 ea             	mov    %r13d,%edx
    3c4a:	49 8b 44 24 08       	mov    0x8(%r12),%rax
    3c4f:	d3 fa                	sar    %cl,%edx
    3c51:	88 54 24 0f          	mov    %dl,0xf(%rsp)
    3c55:	49 3b 44 24 10       	cmp    0x10(%r12),%rax
    3c5a:	74 34                	je     3c90 <_Z10b64_decodeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x120>
    3c5c:	88 10                	mov    %dl,(%rax)
    3c5e:	49 83 44 24 08 01    	addq   $0x1,0x8(%r12)
    3c64:	48 83 c5 01          	add    $0x1,%rbp
    3c68:	41 83 ee 02          	sub    $0x2,%r14d
    3c6c:	49 39 ef             	cmp    %rbp,%r15
    3c6f:	75 bb                	jne    3c2c <_Z10b64_decodeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xbc>
    3c71:	48 89 df             	mov    %rbx,%rdi
    3c74:	be 00 04 00 00       	mov    $0x400,%esi
    3c79:	e8 62 e4 ff ff       	call   20e0 <_ZdlPvm@plt>
    3c7e:	48 83 c4 18          	add    $0x18,%rsp
    3c82:	4c 89 e0             	mov    %r12,%rax
    3c85:	5b                   	pop    %rbx
    3c86:	5d                   	pop    %rbp
    3c87:	41 5c                	pop    %r12
    3c89:	41 5d                	pop    %r13
    3c8b:	41 5e                	pop    %r14
    3c8d:	41 5f                	pop    %r15
    3c8f:	c3                   	ret
    3c90:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
    3c95:	4c 89 e7             	mov    %r12,%rdi
    3c98:	e8 c3 09 00 00       	call   4660 <_ZNSt6vectorIhSaIhEE17_M_realloc_appendIJhEEEvDpOT_>
    3c9d:	eb c5                	jmp    3c64 <_Z10b64_decodeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0xf4>
    3c9f:	48 89 c5             	mov    %rax,%rbp
    3ca2:	e9 1f e6 ff ff       	jmp    22c6 <_Z10b64_decodeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>
    3ca7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    3cae:	00 00 

0000000000003cb0 <_Z16derive_key_bytesRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>:
    3cb0:	41 56                	push   %r14
    3cb2:	66 0f ef c0          	pxor   %xmm0,%xmm0
    3cb6:	41 55                	push   %r13
    3cb8:	41 54                	push   %r12
    3cba:	55                   	push   %rbp
    3cbb:	48 89 fd             	mov    %rdi,%rbp
    3cbe:	53                   	push   %rbx
    3cbf:	48 83 ec 10          	sub    $0x10,%rsp
    3cc3:	48 8b 1e             	mov    (%rsi),%rbx
    3cc6:	4c 8b 76 08          	mov    0x8(%rsi),%r14
    3cca:	0f 11 07             	movups %xmm0,(%rdi)
    3ccd:	48 c7 47 10 00 00 00 	movq   $0x0,0x10(%rdi)
    3cd4:	00 
    3cd5:	49 01 de             	add    %rbx,%r14
    3cd8:	49 39 de             	cmp    %rbx,%r14
    3cdb:	74 69                	je     3d46 <_Z16derive_key_bytesRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x96>
    3cdd:	31 c9                	xor    %ecx,%ecx
    3cdf:	31 d2                	xor    %edx,%edx
    3ce1:	4c 8d 6c 24 0f       	lea    0xf(%rsp),%r13
    3ce6:	45 31 e4             	xor    %r12d,%r12d
    3ce9:	eb 2d                	jmp    3d18 <_Z16derive_key_bytesRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x68>
    3ceb:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    3cf2:	00 00 00 
    3cf5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    3cfc:	00 00 00 00 
    3d00:	48 83 c3 01          	add    $0x1,%rbx
    3d04:	88 02                	mov    %al,(%rdx)
    3d06:	48 83 45 08 01       	addq   $0x1,0x8(%rbp)
    3d0b:	49 39 de             	cmp    %rbx,%r14
    3d0e:	74 36                	je     3d46 <_Z16derive_key_bytesRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x96>
    3d10:	48 8b 55 08          	mov    0x8(%rbp),%rdx
    3d14:	48 8b 4d 10          	mov    0x10(%rbp),%rcx
    3d18:	45 69 e4 83 00 00 00 	imul   $0x83,%r12d,%r12d
    3d1f:	0f b6 03             	movzbl (%rbx),%eax
    3d22:	44 01 e0             	add    %r12d,%eax
    3d25:	88 44 24 0f          	mov    %al,0xf(%rsp)
    3d29:	44 0f b6 e0          	movzbl %al,%r12d
    3d2d:	48 39 ca             	cmp    %rcx,%rdx
    3d30:	75 ce                	jne    3d00 <_Z16derive_key_bytesRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x50>
    3d32:	4c 89 ee             	mov    %r13,%rsi
    3d35:	48 89 ef             	mov    %rbp,%rdi
    3d38:	e8 23 09 00 00       	call   4660 <_ZNSt6vectorIhSaIhEE17_M_realloc_appendIJhEEEvDpOT_>
    3d3d:	48 83 c3 01          	add    $0x1,%rbx
    3d41:	49 39 de             	cmp    %rbx,%r14
    3d44:	75 ca                	jne    3d10 <_Z16derive_key_bytesRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE+0x60>
    3d46:	48 83 c4 10          	add    $0x10,%rsp
    3d4a:	48 89 e8             	mov    %rbp,%rax
    3d4d:	5b                   	pop    %rbx
    3d4e:	5d                   	pop    %rbp
    3d4f:	41 5c                	pop    %r12
    3d51:	41 5d                	pop    %r13
    3d53:	41 5e                	pop    %r14
    3d55:	c3                   	ret
    3d56:	48 89 c3             	mov    %rax,%rbx
    3d59:	e9 85 e5 ff ff       	jmp    22e3 <_Z16derive_key_bytesRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.cold>
    3d5e:	66 90                	xchg   %ax,%ax

0000000000003d60 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_>:
    3d60:	41 57                	push   %r15
    3d62:	41 56                	push   %r14
    3d64:	41 55                	push   %r13
    3d66:	49 89 f5             	mov    %rsi,%r13
    3d69:	41 54                	push   %r12
    3d6b:	55                   	push   %rbp
    3d6c:	48 89 d5             	mov    %rdx,%rbp
    3d6f:	53                   	push   %rbx
    3d70:	48 81 ec 48 01 00 00 	sub    $0x148,%rsp
    3d77:	4c 8b 7f 08          	mov    0x8(%rdi),%r15
    3d7b:	4c 8b 37             	mov    (%rdi),%r14
    3d7e:	4c 8d a4 24 e0 00 00 	lea    0xe0(%rsp),%r12
    3d85:	00 
    3d86:	48 8d 9c 24 f0 00 00 	lea    0xf0(%rsp),%rbx
    3d8d:	00 
    3d8e:	48 c7 84 24 e8 00 00 	movq   $0x0,0xe8(%rsp)
    3d95:	00 00 00 00 00 
    3d9a:	49 8d 77 01          	lea    0x1(%r15),%rsi
    3d9e:	4c 89 e7             	mov    %r12,%rdi
    3da1:	48 89 9c 24 e0 00 00 	mov    %rbx,0xe0(%rsp)
    3da8:	00 
    3da9:	c6 84 24 f0 00 00 00 	movb   $0x0,0xf0(%rsp)
    3db0:	00 
    3db1:	e8 8a e3 ff ff       	call   2140 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm@plt>
    3db6:	48 b8 ff ff ff ff ff 	movabs $0x3fffffffffffffff,%rax
    3dbd:	ff ff 3f 
    3dc0:	48 2b 84 24 e8 00 00 	sub    0xe8(%rsp),%rax
    3dc7:	00 
    3dc8:	4c 39 f8             	cmp    %r15,%rax
    3dcb:	0f 82 c1 e5 ff ff    	jb     2392 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0x9f>
    3dd1:	4c 89 fa             	mov    %r15,%rdx
    3dd4:	4c 89 f6             	mov    %r14,%rsi
    3dd7:	4c 89 e7             	mov    %r12,%rdi
    3dda:	e8 71 e2 ff ff       	call   2050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm@plt>
    3ddf:	48 b8 ff ff ff ff ff 	movabs $0x3fffffffffffffff,%rax
    3de6:	ff ff 3f 
    3de9:	48 39 84 24 e8 00 00 	cmp    %rax,0xe8(%rsp)
    3df0:	00 
    3df1:	0f 84 8f e5 ff ff    	je     2386 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0x93>
    3df7:	4c 8d 35 17 13 00 00 	lea    0x1317(%rip),%r14        # 5115 <_IO_stdin_used+0x115>
    3dfe:	ba 01 00 00 00       	mov    $0x1,%edx
    3e03:	4c 89 e7             	mov    %r12,%rdi
    3e06:	4c 89 f6             	mov    %r14,%rsi
    3e09:	e8 42 e2 ff ff       	call   2050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm@plt>
    3e0e:	49 8b 55 08          	mov    0x8(%r13),%rdx
    3e12:	49 8b 75 00          	mov    0x0(%r13),%rsi
    3e16:	48 b8 ff ff ff ff ff 	movabs $0x3fffffffffffffff,%rax
    3e1d:	ff ff 3f 
    3e20:	48 2b 84 24 e8 00 00 	sub    0xe8(%rsp),%rax
    3e27:	00 
    3e28:	48 39 d0             	cmp    %rdx,%rax
    3e2b:	0f 82 44 e5 ff ff    	jb     2375 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0x82>
    3e31:	4c 89 e7             	mov    %r12,%rdi
    3e34:	e8 17 e2 ff ff       	call   2050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm@plt>
    3e39:	4c 8d ac 24 10 01 00 	lea    0x110(%rsp),%r13
    3e40:	00 
    3e41:	48 8d 48 10          	lea    0x10(%rax),%rcx
    3e45:	4c 89 ac 24 00 01 00 	mov    %r13,0x100(%rsp)
    3e4c:	00 
    3e4d:	48 8b 10             	mov    (%rax),%rdx
    3e50:	48 39 ca             	cmp    %rcx,%rdx
    3e53:	0f 84 07 06 00 00    	je     4460 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x700>
    3e59:	48 89 94 24 00 01 00 	mov    %rdx,0x100(%rsp)
    3e60:	00 
    3e61:	48 8b 50 10          	mov    0x10(%rax),%rdx
    3e65:	48 89 94 24 10 01 00 	mov    %rdx,0x110(%rsp)
    3e6c:	00 
    3e6d:	48 8b 50 08          	mov    0x8(%rax),%rdx
    3e71:	48 89 08             	mov    %rcx,(%rax)
    3e74:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    3e7b:	00 
    3e7c:	48 89 94 24 08 01 00 	mov    %rdx,0x108(%rsp)
    3e83:	00 
    3e84:	c6 40 10 00          	movb   $0x0,0x10(%rax)
    3e88:	48 b8 ff ff ff ff ff 	movabs $0x3fffffffffffffff,%rax
    3e8f:	ff ff 3f 
    3e92:	48 39 84 24 08 01 00 	cmp    %rax,0x108(%rsp)
    3e99:	00 
    3e9a:	0f 84 53 e4 ff ff    	je     22f3 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold>
    3ea0:	48 8d 84 24 00 01 00 	lea    0x100(%rsp),%rax
    3ea7:	00 
    3ea8:	ba 01 00 00 00       	mov    $0x1,%edx
    3ead:	4c 89 f6             	mov    %r14,%rsi
    3eb0:	48 89 c7             	mov    %rax,%rdi
    3eb3:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
    3eb8:	e8 93 e1 ff ff       	call   2050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm@plt>
    3ebd:	48 8d bc 24 30 01 00 	lea    0x130(%rsp),%rdi
    3ec4:	00 
    3ec5:	48 8d 48 10          	lea    0x10(%rax),%rcx
    3ec9:	48 89 bc 24 20 01 00 	mov    %rdi,0x120(%rsp)
    3ed0:	00 
    3ed1:	48 8b 10             	mov    (%rax),%rdx
    3ed4:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    3ed9:	48 39 ca             	cmp    %rcx,%rdx
    3edc:	0f 84 d6 05 00 00    	je     44b8 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x758>
    3ee2:	48 89 94 24 20 01 00 	mov    %rdx,0x120(%rsp)
    3ee9:	00 
    3eea:	48 8b 50 10          	mov    0x10(%rax),%rdx
    3eee:	48 89 94 24 30 01 00 	mov    %rdx,0x130(%rsp)
    3ef5:	00 
    3ef6:	48 8b 50 08          	mov    0x8(%rax),%rdx
    3efa:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    3f01:	00 
    3f02:	48 89 08             	mov    %rcx,(%rax)
    3f05:	48 89 94 24 28 01 00 	mov    %rdx,0x128(%rsp)
    3f0c:	00 
    3f0d:	c6 40 10 00          	movb   $0x0,0x10(%rax)
    3f11:	48 8b 55 08          	mov    0x8(%rbp),%rdx
    3f15:	48 b8 ff ff ff ff ff 	movabs $0x3fffffffffffffff,%rax
    3f1c:	ff ff 3f 
    3f1f:	48 2b 84 24 28 01 00 	sub    0x128(%rsp),%rax
    3f26:	00 
    3f27:	48 8b 75 00          	mov    0x0(%rbp),%rsi
    3f2b:	48 39 d0             	cmp    %rdx,%rax
    3f2e:	0f 82 7d e4 ff ff    	jb     23b1 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0xbe>
    3f34:	48 8d 84 24 20 01 00 	lea    0x120(%rsp),%rax
    3f3b:	00 
    3f3c:	48 89 c7             	mov    %rax,%rdi
    3f3f:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    3f44:	e8 07 e1 ff ff       	call   2050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm@plt>
    3f49:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
    3f50:	00 
    3f51:	48 8d 48 10          	lea    0x10(%rax),%rcx
    3f55:	48 89 b4 24 a0 00 00 	mov    %rsi,0xa0(%rsp)
    3f5c:	00 
    3f5d:	48 8b 10             	mov    (%rax),%rdx
    3f60:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
    3f65:	48 39 ca             	cmp    %rcx,%rdx
    3f68:	0f 84 a2 05 00 00    	je     4510 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x7b0>
    3f6e:	48 89 94 24 a0 00 00 	mov    %rdx,0xa0(%rsp)
    3f75:	00 
    3f76:	48 8b 50 10          	mov    0x10(%rax),%rdx
    3f7a:	48 89 94 24 b0 00 00 	mov    %rdx,0xb0(%rsp)
    3f81:	00 
    3f82:	48 8b 50 08          	mov    0x8(%rax),%rdx
    3f86:	48 89 08             	mov    %rcx,(%rax)
    3f89:	c6 40 10 00          	movb   $0x0,0x10(%rax)
    3f8d:	48 8b bc 24 20 01 00 	mov    0x120(%rsp),%rdi
    3f94:	00 
    3f95:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    3f9c:	00 
    3f9d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    3fa2:	48 89 94 24 a8 00 00 	mov    %rdx,0xa8(%rsp)
    3fa9:	00 
    3faa:	48 39 c7             	cmp    %rax,%rdi
    3fad:	74 11                	je     3fc0 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x260>
    3faf:	48 8b 84 24 30 01 00 	mov    0x130(%rsp),%rax
    3fb6:	00 
    3fb7:	48 8d 70 01          	lea    0x1(%rax),%rsi
    3fbb:	e8 20 e1 ff ff       	call   20e0 <_ZdlPvm@plt>
    3fc0:	48 8b bc 24 00 01 00 	mov    0x100(%rsp),%rdi
    3fc7:	00 
    3fc8:	4c 39 ef             	cmp    %r13,%rdi
    3fcb:	74 11                	je     3fde <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x27e>
    3fcd:	48 8b 84 24 10 01 00 	mov    0x110(%rsp),%rax
    3fd4:	00 
    3fd5:	48 8d 70 01          	lea    0x1(%rax),%rsi
    3fd9:	e8 02 e1 ff ff       	call   20e0 <_ZdlPvm@plt>
    3fde:	48 8b bc 24 e0 00 00 	mov    0xe0(%rsp),%rdi
    3fe5:	00 
    3fe6:	48 39 df             	cmp    %rbx,%rdi
    3fe9:	74 11                	je     3ffc <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x29c>
    3feb:	48 8b 84 24 f0 00 00 	mov    0xf0(%rsp),%rax
    3ff2:	00 
    3ff3:	48 8d 70 01          	lea    0x1(%rax),%rsi
    3ff7:	e8 e4 e0 ff ff       	call   20e0 <_ZdlPvm@plt>
    3ffc:	48 8d 84 24 a0 00 00 	lea    0xa0(%rsp),%rax
    4003:	00 
    4004:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
    4009:	48 89 c6             	mov    %rax,%rsi
    400c:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
    4011:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
    4016:	e8 95 fc ff ff       	call   3cb0 <_Z16derive_key_bytesRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    401b:	48 8d 84 24 d0 00 00 	lea    0xd0(%rsp),%rax
    4022:	00 
    4023:	48 8d bc 24 c0 00 00 	lea    0xc0(%rsp),%rdi
    402a:	00 
    402b:	31 d2                	xor    %edx,%edx
    402d:	be 24 00 00 00       	mov    $0x24,%esi
    4032:	48 89 7c 24 40       	mov    %rdi,0x40(%rsp)
    4037:	48 8b 6c 24 60       	mov    0x60(%rsp),%rbp
    403c:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
    4041:	48 89 84 24 c0 00 00 	mov    %rax,0xc0(%rsp)
    4048:	00 
    4049:	48 c7 84 24 c8 00 00 	movq   $0x0,0xc8(%rsp)
    4050:	00 00 00 00 00 
    4055:	c6 84 24 d0 00 00 00 	movb   $0x0,0xd0(%rsp)
    405c:	00 
    405d:	e8 de df ff ff       	call   2040 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@plt>
    4062:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
    4067:	31 c9                	xor    %ecx,%ecx
    4069:	48 8d 3d d0 14 00 00 	lea    0x14d0(%rip),%rdi        # 5540 <_ZL4OBFS>
    4070:	48 29 ee             	sub    %rbp,%rsi
    4073:	66 90                	xchg   %ax,%ax
    4075:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
    407c:	00 00 00 00 
    4080:	48 89 c8             	mov    %rcx,%rax
    4083:	31 d2                	xor    %edx,%edx
    4085:	48 f7 f6             	div    %rsi
    4088:	0f b6 44 15 00       	movzbl 0x0(%rbp,%rdx,1),%eax
    408d:	48 8b 94 24 c0 00 00 	mov    0xc0(%rsp),%rdx
    4094:	00 
    4095:	32 04 0f             	xor    (%rdi,%rcx,1),%al
    4098:	88 04 0a             	mov    %al,(%rdx,%rcx,1)
    409b:	48 83 c1 01          	add    $0x1,%rcx
    409f:	48 83 f9 24          	cmp    $0x24,%rcx
    40a3:	75 db                	jne    4080 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x320>
    40a5:	4c 8b 8c 24 c0 00 00 	mov    0xc0(%rsp),%r9
    40ac:	00 
    40ad:	4c 8b bc 24 c8 00 00 	mov    0xc8(%rsp),%r15
    40b4:	00 
    40b5:	48 89 9c 24 e0 00 00 	mov    %rbx,0xe0(%rsp)
    40bc:	00 
    40bd:	48 c7 84 24 e8 00 00 	movq   $0x0,0xe8(%rsp)
    40c4:	00 00 00 00 00 
    40c9:	4d 01 cf             	add    %r9,%r15
    40cc:	c6 84 24 f0 00 00 00 	movb   $0x0,0xf0(%rsp)
    40d3:	00 
    40d4:	4d 39 cf             	cmp    %r9,%r15
    40d7:	0f 84 b3 00 00 00    	je     4190 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x430>
    40dd:	48 89 da             	mov    %rbx,%rdx
    40e0:	45 31 f6             	xor    %r14d,%r14d
    40e3:	eb 39                	jmp    411e <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x3be>
    40e5:	0f 1f 00             	nopl   (%rax)
    40e8:	42 88 04 32          	mov    %al,(%rdx,%r14,1)
    40ec:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
    40f3:	00 
    40f4:	49 83 c1 01          	add    $0x1,%r9
    40f8:	4c 89 94 24 e8 00 00 	mov    %r10,0xe8(%rsp)
    40ff:	00 
    4100:	42 c6 04 10 00       	movb   $0x0,(%rax,%r10,1)
    4105:	4d 39 cf             	cmp    %r9,%r15
    4108:	0f 84 82 00 00 00    	je     4190 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x430>
    410e:	4c 8b b4 24 e8 00 00 	mov    0xe8(%rsp),%r14
    4115:	00 
    4116:	48 8b 94 24 e0 00 00 	mov    0xe0(%rsp),%rdx
    411d:	00 
    411e:	41 0f b6 01          	movzbl (%r9),%eax
    4122:	4d 8d 56 01          	lea    0x1(%r14),%r10
    4126:	3c 7a                	cmp    $0x7a,%al
    4128:	7f 00                	jg     412a <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x3ca>
    412a:	48 39 da             	cmp    %rbx,%rdx
    412d:	74 51                	je     4180 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x420>
    412f:	48 8b 8c 24 f0 00 00 	mov    0xf0(%rsp),%rcx
    4136:	00 
    4137:	4c 39 d1             	cmp    %r10,%rcx
    413a:	73 ac                	jae    40e8 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x388>
    413c:	41 b8 01 00 00 00    	mov    $0x1,%r8d
    4142:	31 c9                	xor    %ecx,%ecx
    4144:	31 d2                	xor    %edx,%edx
    4146:	4c 89 f6             	mov    %r14,%rsi
    4149:	4c 89 e7             	mov    %r12,%rdi
    414c:	4c 89 54 24 20       	mov    %r10,0x20(%rsp)
    4151:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
    4156:	88 44 24 10          	mov    %al,0x10(%rsp)
    415a:	e8 21 e0 ff ff       	call   2180 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm@plt>
    415f:	48 8b 94 24 e0 00 00 	mov    0xe0(%rsp),%rdx
    4166:	00 
    4167:	4c 8b 54 24 20       	mov    0x20(%rsp),%r10
    416c:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
    4171:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
    4176:	e9 6d ff ff ff       	jmp    40e8 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x388>
    417b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    4180:	b9 0f 00 00 00       	mov    $0xf,%ecx
    4185:	eb b0                	jmp    4137 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x3d7>
    4187:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    418e:	00 00 
    4190:	48 8d 84 24 80 00 00 	lea    0x80(%rsp),%rax
    4197:	00 
    4198:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
    419d:	48 89 c7             	mov    %rax,%rdi
    41a0:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    41a5:	e8 c6 f9 ff ff       	call   3b70 <_Z10b64_decodeRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    41aa:	4c 8b bc 24 88 00 00 	mov    0x88(%rsp),%r15
    41b1:	00 
    41b2:	4c 8b b4 24 80 00 00 	mov    0x80(%rsp),%r14
    41b9:	00 
    41ba:	4d 39 f7             	cmp    %r14,%r15
    41bd:	0f 84 6d 02 00 00    	je     4430 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x6d0>
    41c3:	4c 89 fa             	mov    %r15,%rdx
    41c6:	4c 89 ac 24 00 01 00 	mov    %r13,0x100(%rsp)
    41cd:	00 
    41ce:	4c 89 e8             	mov    %r13,%rax
    41d1:	48 c7 84 24 08 01 00 	movq   $0x0,0x108(%rsp)
    41d8:	00 00 00 00 00 
    41dd:	4c 29 f2             	sub    %r14,%rdx
    41e0:	48 89 94 24 20 01 00 	mov    %rdx,0x120(%rsp)
    41e7:	00 
    41e8:	48 83 fa 0f          	cmp    $0xf,%rdx
    41ec:	0f 87 0e 02 00 00    	ja     4400 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x6a0>
    41f2:	4c 89 fe             	mov    %r15,%rsi
    41f5:	31 d2                	xor    %edx,%edx
    41f7:	4c 29 f6             	sub    %r14,%rsi
    41fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    4200:	41 0f b6 0c 16       	movzbl (%r14,%rdx,1),%ecx
    4205:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
    4208:	48 83 c2 01          	add    $0x1,%rdx
    420c:	48 39 d6             	cmp    %rdx,%rsi
    420f:	75 ef                	jne    4200 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x4a0>
    4211:	48 8b 84 24 20 01 00 	mov    0x120(%rsp),%rax
    4218:	00 
    4219:	48 8b 94 24 00 01 00 	mov    0x100(%rsp),%rdx
    4220:	00 
    4221:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
    4226:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
    422b:	48 89 84 24 08 01 00 	mov    %rax,0x108(%rsp)
    4232:	00 
    4233:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
    4237:	4c 89 ff             	mov    %r15,%rdi
    423a:	e8 61 e5 ff ff       	call   27a0 <_Z5rot13RKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE>
    423f:	31 d2                	xor    %edx,%edx
    4241:	b9 09 00 00 00       	mov    $0x9,%ecx
    4246:	48 8d 35 ca 0e 00 00 	lea    0xeca(%rip),%rsi        # 5117 <_IO_stdin_used+0x117>
    424d:	4c 89 ff             	mov    %r15,%rdi
    4250:	e8 fb de ff ff       	call   2150 <_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm@plt>
    4255:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    4259:	0f 84 49 01 00 00    	je     43a8 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x648>
    425f:	4c 8d 3d 9a 2e 00 00 	lea    0x2e9a(%rip),%r15        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    4266:	ba 15 00 00 00       	mov    $0x15,%edx
    426b:	48 8d 35 af 0e 00 00 	lea    0xeaf(%rip),%rsi        # 5121 <_IO_stdin_used+0x121>
    4272:	4c 89 ff             	mov    %r15,%rdi
    4275:	e8 76 de ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    427a:	ba 0e 00 00 00       	mov    $0xe,%edx
    427f:	48 8d 35 b1 0e 00 00 	lea    0xeb1(%rip),%rsi        # 5137 <_IO_stdin_used+0x137>
    4286:	4c 89 ff             	mov    %r15,%rdi
    4289:	e8 62 de ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    428e:	48 8b 94 24 28 01 00 	mov    0x128(%rsp),%rdx
    4295:	00 
    4296:	48 8b b4 24 20 01 00 	mov    0x120(%rsp),%rsi
    429d:	00 
    429e:	4c 89 ff             	mov    %r15,%rdi
    42a1:	e8 4a de ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    42a6:	48 89 c7             	mov    %rax,%rdi
    42a9:	ba 01 00 00 00       	mov    $0x1,%edx
    42ae:	48 8d 35 b9 0d 00 00 	lea    0xdb9(%rip),%rsi        # 506e <_IO_stdin_used+0x6e>
    42b5:	e8 36 de ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    42ba:	41 bc 01 00 00 00    	mov    $0x1,%r12d
    42c0:	48 8b bc 24 20 01 00 	mov    0x120(%rsp),%rdi
    42c7:	00 
    42c8:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    42cd:	48 39 c7             	cmp    %rax,%rdi
    42d0:	74 11                	je     42e3 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x583>
    42d2:	48 8b 84 24 30 01 00 	mov    0x130(%rsp),%rax
    42d9:	00 
    42da:	48 8d 70 01          	lea    0x1(%rax),%rsi
    42de:	e8 fd dd ff ff       	call   20e0 <_ZdlPvm@plt>
    42e3:	48 8b bc 24 00 01 00 	mov    0x100(%rsp),%rdi
    42ea:	00 
    42eb:	4c 39 ef             	cmp    %r13,%rdi
    42ee:	74 11                	je     4301 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x5a1>
    42f0:	48 8b 84 24 10 01 00 	mov    0x110(%rsp),%rax
    42f7:	00 
    42f8:	48 8d 70 01          	lea    0x1(%rax),%rsi
    42fc:	e8 df dd ff ff       	call   20e0 <_ZdlPvm@plt>
    4301:	48 8b b4 24 90 00 00 	mov    0x90(%rsp),%rsi
    4308:	00 
    4309:	4c 89 f7             	mov    %r14,%rdi
    430c:	4c 29 f6             	sub    %r14,%rsi
    430f:	e8 cc dd ff ff       	call   20e0 <_ZdlPvm@plt>
    4314:	48 8b bc 24 e0 00 00 	mov    0xe0(%rsp),%rdi
    431b:	00 
    431c:	48 39 df             	cmp    %rbx,%rdi
    431f:	74 11                	je     4332 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x5d2>
    4321:	48 8b 84 24 f0 00 00 	mov    0xf0(%rsp),%rax
    4328:	00 
    4329:	48 8d 70 01          	lea    0x1(%rax),%rsi
    432d:	e8 ae dd ff ff       	call   20e0 <_ZdlPvm@plt>
    4332:	48 8b bc 24 c0 00 00 	mov    0xc0(%rsp),%rdi
    4339:	00 
    433a:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
    433f:	48 39 c7             	cmp    %rax,%rdi
    4342:	74 11                	je     4355 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x5f5>
    4344:	48 8b 84 24 d0 00 00 	mov    0xd0(%rsp),%rax
    434b:	00 
    434c:	48 8d 70 01          	lea    0x1(%rax),%rsi
    4350:	e8 8b dd ff ff       	call   20e0 <_ZdlPvm@plt>
    4355:	48 85 ed             	test   %rbp,%rbp
    4358:	74 10                	je     436a <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x60a>
    435a:	48 8b 74 24 70       	mov    0x70(%rsp),%rsi
    435f:	48 89 ef             	mov    %rbp,%rdi
    4362:	48 29 ee             	sub    %rbp,%rsi
    4365:	e8 76 dd ff ff       	call   20e0 <_ZdlPvm@plt>
    436a:	48 8b bc 24 a0 00 00 	mov    0xa0(%rsp),%rdi
    4371:	00 
    4372:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    4377:	48 39 c7             	cmp    %rax,%rdi
    437a:	74 11                	je     438d <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x62d>
    437c:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
    4383:	00 
    4384:	48 8d 70 01          	lea    0x1(%rax),%rsi
    4388:	e8 53 dd ff ff       	call   20e0 <_ZdlPvm@plt>
    438d:	48 81 c4 48 01 00 00 	add    $0x148,%rsp
    4394:	44 89 e0             	mov    %r12d,%eax
    4397:	5b                   	pop    %rbx
    4398:	5d                   	pop    %rbp
    4399:	41 5c                	pop    %r12
    439b:	41 5d                	pop    %r13
    439d:	41 5e                	pop    %r14
    439f:	41 5f                	pop    %r15
    43a1:	c3                   	ret
    43a2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    43a8:	4c 8d 3d 51 2d 00 00 	lea    0x2d51(%rip),%r15        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    43af:	ba 39 00 00 00       	mov    $0x39,%edx
    43b4:	48 8d 35 4d 10 00 00 	lea    0x104d(%rip),%rsi        # 5408 <_IO_stdin_used+0x408>
    43bb:	4c 89 ff             	mov    %r15,%rdi
    43be:	e8 2d dd ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    43c3:	48 8b 94 24 28 01 00 	mov    0x128(%rsp),%rdx
    43ca:	00 
    43cb:	48 8b b4 24 20 01 00 	mov    0x120(%rsp),%rsi
    43d2:	00 
    43d3:	4c 89 ff             	mov    %r15,%rdi
    43d6:	e8 15 dd ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    43db:	48 89 c7             	mov    %rax,%rdi
    43de:	ba 01 00 00 00       	mov    $0x1,%edx
    43e3:	48 8d 35 84 0c 00 00 	lea    0xc84(%rip),%rsi        # 506e <_IO_stdin_used+0x6e>
    43ea:	e8 01 dd ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    43ef:	45 31 e4             	xor    %r12d,%r12d
    43f2:	e9 c9 fe ff ff       	jmp    42c0 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x560>
    43f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    43fe:	00 00 
    4400:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
    4405:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
    440a:	31 d2                	xor    %edx,%edx
    440c:	e8 5f dd ff ff       	call   2170 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@plt>
    4411:	48 8b 94 24 20 01 00 	mov    0x120(%rsp),%rdx
    4418:	00 
    4419:	48 89 84 24 00 01 00 	mov    %rax,0x100(%rsp)
    4420:	00 
    4421:	48 89 94 24 10 01 00 	mov    %rdx,0x110(%rsp)
    4428:	00 
    4429:	e9 c4 fd ff ff       	jmp    41f2 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x492>
    442e:	66 90                	xchg   %ax,%ax
    4430:	ba 47 00 00 00       	mov    $0x47,%edx
    4435:	48 8d 35 84 0f 00 00 	lea    0xf84(%rip),%rsi        # 53c0 <_IO_stdin_used+0x3c0>
    443c:	48 8d 3d bd 2c 00 00 	lea    0x2cbd(%rip),%rdi        # 7100 <_ZSt4cout@GLIBCXX_3.4>
    4443:	e8 a8 dc ff ff       	call   20f0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    4448:	45 31 e4             	xor    %r12d,%r12d
    444b:	4d 85 f6             	test   %r14,%r14
    444e:	0f 84 c0 fe ff ff    	je     4314 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x5b4>
    4454:	e9 a8 fe ff ff       	jmp    4301 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x5a1>
    4459:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    4460:	48 8b 78 08          	mov    0x8(%rax),%rdi
    4464:	4d 89 e8             	mov    %r13,%r8
    4467:	48 89 ce             	mov    %rcx,%rsi
    446a:	48 8d 57 01          	lea    0x1(%rdi),%rdx
    446e:	83 fa 08             	cmp    $0x8,%edx
    4471:	0f 83 3b 01 00 00    	jae    45b2 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x852>
    4477:	31 ff                	xor    %edi,%edi
    4479:	f6 c2 04             	test   $0x4,%dl
    447c:	74 0a                	je     4488 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x728>
    447e:	8b 3e                	mov    (%rsi),%edi
    4480:	41 89 38             	mov    %edi,(%r8)
    4483:	bf 04 00 00 00       	mov    $0x4,%edi
    4488:	f6 c2 02             	test   $0x2,%dl
    448b:	74 0e                	je     449b <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x73b>
    448d:	44 0f b7 0c 3e       	movzwl (%rsi,%rdi,1),%r9d
    4492:	66 45 89 0c 38       	mov    %r9w,(%r8,%rdi,1)
    4497:	48 83 c7 02          	add    $0x2,%rdi
    449b:	83 e2 01             	and    $0x1,%edx
    449e:	0f 84 c9 f9 ff ff    	je     3e6d <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x10d>
    44a4:	0f b6 14 3e          	movzbl (%rsi,%rdi,1),%edx
    44a8:	41 88 14 38          	mov    %dl,(%r8,%rdi,1)
    44ac:	e9 bc f9 ff ff       	jmp    3e6d <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x10d>
    44b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    44b8:	48 8b 78 08          	mov    0x8(%rax),%rdi
    44bc:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
    44c1:	48 89 ce             	mov    %rcx,%rsi
    44c4:	48 8d 57 01          	lea    0x1(%rdi),%rdx
    44c8:	83 fa 08             	cmp    $0x8,%edx
    44cb:	0f 83 b5 00 00 00    	jae    4586 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x826>
    44d1:	31 ff                	xor    %edi,%edi
    44d3:	f6 c2 04             	test   $0x4,%dl
    44d6:	74 0a                	je     44e2 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x782>
    44d8:	8b 3e                	mov    (%rsi),%edi
    44da:	41 89 38             	mov    %edi,(%r8)
    44dd:	bf 04 00 00 00       	mov    $0x4,%edi
    44e2:	f6 c2 02             	test   $0x2,%dl
    44e5:	74 0e                	je     44f5 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x795>
    44e7:	44 0f b7 0c 3e       	movzwl (%rsi,%rdi,1),%r9d
    44ec:	66 45 89 0c 38       	mov    %r9w,(%r8,%rdi,1)
    44f1:	48 83 c7 02          	add    $0x2,%rdi
    44f5:	83 e2 01             	and    $0x1,%edx
    44f8:	0f 84 f8 f9 ff ff    	je     3ef6 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x196>
    44fe:	0f b6 14 3e          	movzbl (%rsi,%rdi,1),%edx
    4502:	41 88 14 38          	mov    %dl,(%r8,%rdi,1)
    4506:	e9 eb f9 ff ff       	jmp    3ef6 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x196>
    450b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
    4510:	48 8b 78 08          	mov    0x8(%rax),%rdi
    4514:	49 89 f0             	mov    %rsi,%r8
    4517:	48 89 ce             	mov    %rcx,%rsi
    451a:	48 8d 57 01          	lea    0x1(%rdi),%rdx
    451e:	83 fa 08             	cmp    $0x8,%edx
    4521:	73 3a                	jae    455d <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x7fd>
    4523:	31 ff                	xor    %edi,%edi
    4525:	f6 c2 04             	test   $0x4,%dl
    4528:	74 0a                	je     4534 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x7d4>
    452a:	8b 3e                	mov    (%rsi),%edi
    452c:	41 89 38             	mov    %edi,(%r8)
    452f:	bf 04 00 00 00       	mov    $0x4,%edi
    4534:	f6 c2 02             	test   $0x2,%dl
    4537:	74 0e                	je     4547 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x7e7>
    4539:	44 0f b7 0c 3e       	movzwl (%rsi,%rdi,1),%r9d
    453e:	66 45 89 0c 38       	mov    %r9w,(%r8,%rdi,1)
    4543:	48 83 c7 02          	add    $0x2,%rdi
    4547:	83 e2 01             	and    $0x1,%edx
    454a:	0f 84 32 fa ff ff    	je     3f82 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x222>
    4550:	0f b6 14 3e          	movzbl (%rsi,%rdi,1),%edx
    4554:	41 88 14 38          	mov    %dl,(%r8,%rdi,1)
    4558:	e9 25 fa ff ff       	jmp    3f82 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x222>
    455d:	41 89 d0             	mov    %edx,%r8d
    4560:	31 f6                	xor    %esi,%esi
    4562:	41 83 e0 f8          	and    $0xfffffff8,%r8d
    4566:	89 f7                	mov    %esi,%edi
    4568:	4c 8b 5c 24 28       	mov    0x28(%rsp),%r11
    456d:	83 c6 08             	add    $0x8,%esi
    4570:	4c 8b 0c 39          	mov    (%rcx,%rdi,1),%r9
    4574:	4d 89 0c 3b          	mov    %r9,(%r11,%rdi,1)
    4578:	44 39 c6             	cmp    %r8d,%esi
    457b:	72 e9                	jb     4566 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x806>
    457d:	4d 8d 04 33          	lea    (%r11,%rsi,1),%r8
    4581:	48 01 ce             	add    %rcx,%rsi
    4584:	eb 9d                	jmp    4523 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x7c3>
    4586:	41 89 d0             	mov    %edx,%r8d
    4589:	31 f6                	xor    %esi,%esi
    458b:	41 83 e0 f8          	and    $0xfffffff8,%r8d
    458f:	89 f7                	mov    %esi,%edi
    4591:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
    4596:	83 c6 08             	add    $0x8,%esi
    4599:	4c 8b 0c 39          	mov    (%rcx,%rdi,1),%r9
    459d:	4d 89 0c 3b          	mov    %r9,(%r11,%rdi,1)
    45a1:	44 39 c6             	cmp    %r8d,%esi
    45a4:	72 e9                	jb     458f <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x82f>
    45a6:	4d 8d 04 33          	lea    (%r11,%rsi,1),%r8
    45aa:	48 01 ce             	add    %rcx,%rsi
    45ad:	e9 1f ff ff ff       	jmp    44d1 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x771>
    45b2:	41 89 d0             	mov    %edx,%r8d
    45b5:	31 f6                	xor    %esi,%esi
    45b7:	41 83 e0 f8          	and    $0xfffffff8,%r8d
    45bb:	89 f7                	mov    %esi,%edi
    45bd:	83 c6 08             	add    $0x8,%esi
    45c0:	4c 8b 0c 39          	mov    (%rcx,%rdi,1),%r9
    45c4:	4d 89 4c 3d 00       	mov    %r9,0x0(%r13,%rdi,1)
    45c9:	44 39 c6             	cmp    %r8d,%esi
    45cc:	72 ed                	jb     45bb <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x85b>
    45ce:	4d 8d 44 35 00       	lea    0x0(%r13,%rsi,1),%r8
    45d3:	48 01 ce             	add    %rcx,%rsi
    45d6:	e9 9c fe ff ff       	jmp    4477 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_+0x717>
    45db:	48 89 c3             	mov    %rax,%rbx
    45de:	e9 4f dd ff ff       	jmp    2332 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0x3f>
    45e3:	e9 70 dd ff ff       	jmp    2358 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0x65>
    45e8:	e9 94 dd ff ff       	jmp    2381 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0x8e>
    45ed:	e9 ac dd ff ff       	jmp    239e <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0xab>
    45f2:	48 89 c3             	mov    %rax,%rbx
    45f5:	e9 30 dd ff ff       	jmp    232a <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0x37>
    45fa:	48 89 c3             	mov    %rax,%rbx
    45fd:	e9 0a dd ff ff       	jmp    230c <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0x19>
    4602:	48 89 c3             	mov    %rax,%rbx
    4605:	e9 16 dd ff ff       	jmp    2320 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0x2d>
    460a:	e9 bb dd ff ff       	jmp    23ca <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0xd7>
    460f:	48 89 c3             	mov    %rax,%rbx
    4612:	e9 ff dc ff ff       	jmp    2316 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0x23>
    4617:	48 89 c3             	mov    %rax,%rbx
    461a:	e9 27 dd ff ff       	jmp    2346 <_Z11reveal_flagRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEES6_S6_.cold+0x53>
    461f:	90                   	nop

0000000000004620 <_ZNKSt5ctypeIcE8do_widenEc>:
    4620:	89 f0                	mov    %esi,%eax
    4622:	c3                   	ret
    4623:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    462a:	00 00 00 
    462d:	0f 1f 00             	nopl   (%rax)

0000000000004630 <_ZNSt12_Vector_baseIhSaIhEED1Ev>:
    4630:	48 8b 07             	mov    (%rdi),%rax
    4633:	48 85 c0             	test   %rax,%rax
    4636:	74 18                	je     4650 <_ZNSt12_Vector_baseIhSaIhEED1Ev+0x20>
    4638:	48 8b 77 10          	mov    0x10(%rdi),%rsi
    463c:	48 89 c7             	mov    %rax,%rdi
    463f:	48 29 c6             	sub    %rax,%rsi
    4642:	e9 99 da ff ff       	jmp    20e0 <_ZdlPvm@plt>
    4647:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    464e:	00 00 
    4650:	c3                   	ret
    4651:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    4658:	00 00 00 
    465b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000004660 <_ZNSt6vectorIhSaIhEE17_M_realloc_appendIJhEEEvDpOT_>:
    4660:	48 b8 ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rax
    4667:	ff ff 7f 
    466a:	41 57                	push   %r15
    466c:	41 56                	push   %r14
    466e:	41 55                	push   %r13
    4670:	41 54                	push   %r12
    4672:	55                   	push   %rbp
    4673:	53                   	push   %rbx
    4674:	48 83 ec 08          	sub    $0x8,%rsp
    4678:	4c 8b 37             	mov    (%rdi),%r14
    467b:	48 8b 5f 08          	mov    0x8(%rdi),%rbx
    467f:	4c 29 f3             	sub    %r14,%rbx
    4682:	48 39 c3             	cmp    %rax,%rbx
    4685:	0f 84 a3 00 00 00    	je     472e <_ZNSt6vectorIhSaIhEE17_M_realloc_appendIJhEEEvDpOT_+0xce>
    468b:	48 85 db             	test   %rbx,%rbx
    468e:	bd 01 00 00 00       	mov    $0x1,%ebp
    4693:	49 89 fd             	mov    %rdi,%r13
    4696:	49 89 f7             	mov    %rsi,%r15
    4699:	48 0f 45 eb          	cmovne %rbx,%rbp
    469d:	48 01 dd             	add    %rbx,%rbp
    46a0:	0f 82 83 00 00 00    	jb     4729 <_ZNSt6vectorIhSaIhEE17_M_realloc_appendIJhEEEvDpOT_+0xc9>
    46a6:	48 b8 ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rax
    46ad:	ff ff 7f 
    46b0:	48 39 c5             	cmp    %rax,%rbp
    46b3:	48 0f 47 e8          	cmova  %rax,%rbp
    46b7:	48 89 ef             	mov    %rbp,%rdi
    46ba:	e8 11 da ff ff       	call   20d0 <_Znwm@plt>
    46bf:	49 89 c4             	mov    %rax,%r12
    46c2:	41 0f b6 07          	movzbl (%r15),%eax
    46c6:	4d 8d 7c 1c 01       	lea    0x1(%r12,%rbx,1),%r15
    46cb:	41 88 04 1c          	mov    %al,(%r12,%rbx,1)
    46cf:	48 85 db             	test   %rbx,%rbx
    46d2:	7f 2c                	jg     4700 <_ZNSt6vectorIhSaIhEE17_M_realloc_appendIJhEEEvDpOT_+0xa0>
    46d4:	4d 85 f6             	test   %r14,%r14
    46d7:	75 47                	jne    4720 <_ZNSt6vectorIhSaIhEE17_M_realloc_appendIJhEEEvDpOT_+0xc0>
    46d9:	4d 89 65 00          	mov    %r12,0x0(%r13)
    46dd:	49 01 ec             	add    %rbp,%r12
    46e0:	4d 89 7d 08          	mov    %r15,0x8(%r13)
    46e4:	4d 89 65 10          	mov    %r12,0x10(%r13)
    46e8:	48 83 c4 08          	add    $0x8,%rsp
    46ec:	5b                   	pop    %rbx
    46ed:	5d                   	pop    %rbp
    46ee:	41 5c                	pop    %r12
    46f0:	41 5d                	pop    %r13
    46f2:	41 5e                	pop    %r14
    46f4:	41 5f                	pop    %r15
    46f6:	c3                   	ret
    46f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    46fe:	00 00 
    4700:	4c 89 f6             	mov    %r14,%rsi
    4703:	48 89 da             	mov    %rbx,%rdx
    4706:	4c 89 e7             	mov    %r12,%rdi
    4709:	e8 92 d9 ff ff       	call   20a0 <memcpy@plt>
    470e:	49 8b 75 10          	mov    0x10(%r13),%rsi
    4712:	4c 29 f6             	sub    %r14,%rsi
    4715:	4c 89 f7             	mov    %r14,%rdi
    4718:	e8 c3 d9 ff ff       	call   20e0 <_ZdlPvm@plt>
    471d:	eb ba                	jmp    46d9 <_ZNSt6vectorIhSaIhEE17_M_realloc_appendIJhEEEvDpOT_+0x79>
    471f:	90                   	nop
    4720:	49 8b 75 10          	mov    0x10(%r13),%rsi
    4724:	4c 29 f6             	sub    %r14,%rsi
    4727:	eb ec                	jmp    4715 <_ZNSt6vectorIhSaIhEE17_M_realloc_appendIJhEEEvDpOT_+0xb5>
    4729:	48 89 c5             	mov    %rax,%rbp
    472c:	eb 89                	jmp    46b7 <_ZNSt6vectorIhSaIhEE17_M_realloc_appendIJhEEEvDpOT_+0x57>
    472e:	48 8d 3d 1e 0a 00 00 	lea    0xa1e(%rip),%rdi        # 5153 <_IO_stdin_used+0x153>
    4735:	e8 36 d9 ff ff       	call   2070 <_ZSt20__throw_length_errorPKc@plt>

Disassembly of section .fini:

000000000000473c <_fini>:
    473c:	48 83 ec 08          	sub    $0x8,%rsp
    4740:	48 83 c4 08          	add    $0x8,%rsp
    4744:	c3                   	ret
