
VoidWalker:     file format elf64-x86-64


Disassembly of section .init:

0000000000401760 <.init>:
  401760:	48 83 ec 08          	sub    $0x8,%rsp
  401764:	48 8b 05 85 d8 20 00 	mov    0x20d885(%rip),%rax        # 60eff0 <dlerror@plt+0x20d360>
  40176b:	48 85 c0             	test   %rax,%rax
  40176e:	74 02                	je     401772 <getenv@plt-0x1e>
  401770:	ff d0                	call   *%rax
  401772:	48 83 c4 08          	add    $0x8,%rsp
  401776:	c3                   	ret

Disassembly of section .plt:

0000000000401780 <getenv@plt-0x10>:
  401780:	ff 35 82 d8 20 00    	push   0x20d882(%rip)        # 60f008 <dlerror@plt+0x20d378>
  401786:	ff 25 84 d8 20 00    	jmp    *0x20d884(%rip)        # 60f010 <dlerror@plt+0x20d380>
  40178c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401790 <getenv@plt>:
  401790:	ff 25 82 d8 20 00    	jmp    *0x20d882(%rip)        # 60f018 <dlerror@plt+0x20d388>
  401796:	68 00 00 00 00       	push   $0x0
  40179b:	e9 e0 ff ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004017a0 <__snprintf_chk@plt>:
  4017a0:	ff 25 7a d8 20 00    	jmp    *0x20d87a(%rip)        # 60f020 <dlerror@plt+0x20d390>
  4017a6:	68 01 00 00 00       	push   $0x1
  4017ab:	e9 d0 ff ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004017b0 <raise@plt>:
  4017b0:	ff 25 72 d8 20 00    	jmp    *0x20d872(%rip)        # 60f028 <dlerror@plt+0x20d398>
  4017b6:	68 02 00 00 00       	push   $0x2
  4017bb:	e9 c0 ff ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004017c0 <free@plt>:
  4017c0:	ff 25 6a d8 20 00    	jmp    *0x20d86a(%rip)        # 60f030 <dlerror@plt+0x20d3a0>
  4017c6:	68 03 00 00 00       	push   $0x3
  4017cb:	e9 b0 ff ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004017d0 <__errno_location@plt>:
  4017d0:	ff 25 62 d8 20 00    	jmp    *0x20d862(%rip)        # 60f038 <dlerror@plt+0x20d3a8>
  4017d6:	68 04 00 00 00       	push   $0x4
  4017db:	e9 a0 ff ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004017e0 <unlink@plt>:
  4017e0:	ff 25 5a d8 20 00    	jmp    *0x20d85a(%rip)        # 60f040 <dlerror@plt+0x20d3b0>
  4017e6:	68 05 00 00 00       	push   $0x5
  4017eb:	e9 90 ff ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004017f0 <strncpy@plt>:
  4017f0:	ff 25 52 d8 20 00    	jmp    *0x20d852(%rip)        # 60f048 <dlerror@plt+0x20d3b8>
  4017f6:	68 06 00 00 00       	push   $0x6
  4017fb:	e9 80 ff ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401800 <strncmp@plt>:
  401800:	ff 25 4a d8 20 00    	jmp    *0x20d84a(%rip)        # 60f050 <dlerror@plt+0x20d3c0>
  401806:	68 07 00 00 00       	push   $0x7
  40180b:	e9 70 ff ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401810 <strcpy@plt>:
  401810:	ff 25 42 d8 20 00    	jmp    *0x20d842(%rip)        # 60f058 <dlerror@plt+0x20d3c8>
  401816:	68 08 00 00 00       	push   $0x8
  40181b:	e9 60 ff ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401820 <ftello@plt>:
  401820:	ff 25 3a d8 20 00    	jmp    *0x20d83a(%rip)        # 60f060 <dlerror@plt+0x20d3d0>
  401826:	68 09 00 00 00       	push   $0x9
  40182b:	e9 50 ff ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401830 <inflate@plt>:
  401830:	ff 25 32 d8 20 00    	jmp    *0x20d832(%rip)        # 60f068 <dlerror@plt+0x20d3d8>
  401836:	68 0a 00 00 00       	push   $0xa
  40183b:	e9 40 ff ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401840 <mkdir@plt>:
  401840:	ff 25 2a d8 20 00    	jmp    *0x20d82a(%rip)        # 60f070 <dlerror@plt+0x20d3e0>
  401846:	68 0b 00 00 00       	push   $0xb
  40184b:	e9 30 ff ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401850 <ferror@plt>:
  401850:	ff 25 22 d8 20 00    	jmp    *0x20d822(%rip)        # 60f078 <dlerror@plt+0x20d3e8>
  401856:	68 0c 00 00 00       	push   $0xc
  40185b:	e9 20 ff ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401860 <fread@plt>:
  401860:	ff 25 1a d8 20 00    	jmp    *0x20d81a(%rip)        # 60f080 <dlerror@plt+0x20d3f0>
  401866:	68 0d 00 00 00       	push   $0xd
  40186b:	e9 10 ff ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401870 <mbstowcs@plt>:
  401870:	ff 25 12 d8 20 00    	jmp    *0x20d812(%rip)        # 60f088 <dlerror@plt+0x20d3f8>
  401876:	68 0e 00 00 00       	push   $0xe
  40187b:	e9 00 ff ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401880 <readlink@plt>:
  401880:	ff 25 0a d8 20 00    	jmp    *0x20d80a(%rip)        # 60f090 <dlerror@plt+0x20d400>
  401886:	68 0f 00 00 00       	push   $0xf
  40188b:	e9 f0 fe ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401890 <setenv@plt>:
  401890:	ff 25 02 d8 20 00    	jmp    *0x20d802(%rip)        # 60f098 <dlerror@plt+0x20d408>
  401896:	68 10 00 00 00       	push   $0x10
  40189b:	e9 e0 fe ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004018a0 <getpid@plt>:
  4018a0:	ff 25 fa d7 20 00    	jmp    *0x20d7fa(%rip)        # 60f0a0 <dlerror@plt+0x20d410>
  4018a6:	68 11 00 00 00       	push   $0x11
  4018ab:	e9 d0 fe ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004018b0 <fclose@plt>:
  4018b0:	ff 25 f2 d7 20 00    	jmp    *0x20d7f2(%rip)        # 60f0a8 <dlerror@plt+0x20d418>
  4018b6:	68 12 00 00 00       	push   $0x12
  4018bb:	e9 c0 fe ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004018c0 <opendir@plt>:
  4018c0:	ff 25 ea d7 20 00    	jmp    *0x20d7ea(%rip)        # 60f0b0 <dlerror@plt+0x20d420>
  4018c6:	68 13 00 00 00       	push   $0x13
  4018cb:	e9 b0 fe ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004018d0 <rmdir@plt>:
  4018d0:	ff 25 e2 d7 20 00    	jmp    *0x20d7e2(%rip)        # 60f0b8 <dlerror@plt+0x20d428>
  4018d6:	68 14 00 00 00       	push   $0x14
  4018db:	e9 a0 fe ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004018e0 <strlen@plt>:
  4018e0:	ff 25 da d7 20 00    	jmp    *0x20d7da(%rip)        # 60f0c0 <dlerror@plt+0x20d430>
  4018e6:	68 15 00 00 00       	push   $0x15
  4018eb:	e9 90 fe ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004018f0 <__lxstat@plt>:
  4018f0:	ff 25 d2 d7 20 00    	jmp    *0x20d7d2(%rip)        # 60f0c8 <dlerror@plt+0x20d438>
  4018f6:	68 16 00 00 00       	push   $0x16
  4018fb:	e9 80 fe ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401900 <__stack_chk_fail@plt>:
  401900:	ff 25 ca d7 20 00    	jmp    *0x20d7ca(%rip)        # 60f0d0 <dlerror@plt+0x20d440>
  401906:	68 17 00 00 00       	push   $0x17
  40190b:	e9 70 fe ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401910 <mmap@plt>:
  401910:	ff 25 c2 d7 20 00    	jmp    *0x20d7c2(%rip)        # 60f0d8 <dlerror@plt+0x20d448>
  401916:	68 18 00 00 00       	push   $0x18
  40191b:	e9 60 fe ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401920 <strchr@plt>:
  401920:	ff 25 ba d7 20 00    	jmp    *0x20d7ba(%rip)        # 60f0e0 <dlerror@plt+0x20d450>
  401926:	68 19 00 00 00       	push   $0x19
  40192b:	e9 50 fe ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401930 <wcslen@plt>:
  401930:	ff 25 b2 d7 20 00    	jmp    *0x20d7b2(%rip)        # 60f0e8 <dlerror@plt+0x20d458>
  401936:	68 1a 00 00 00       	push   $0x1a
  40193b:	e9 40 fe ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401940 <symlink@plt>:
  401940:	ff 25 aa d7 20 00    	jmp    *0x20d7aa(%rip)        # 60f0f0 <dlerror@plt+0x20d460>
  401946:	68 1b 00 00 00       	push   $0x1b
  40194b:	e9 30 fe ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401950 <snprintf@plt>:
  401950:	ff 25 a2 d7 20 00    	jmp    *0x20d7a2(%rip)        # 60f0f8 <dlerror@plt+0x20d468>
  401956:	68 1c 00 00 00       	push   $0x1c
  40195b:	e9 20 fe ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401960 <dirname@plt>:
  401960:	ff 25 9a d7 20 00    	jmp    *0x20d79a(%rip)        # 60f100 <dlerror@plt+0x20d470>
  401966:	68 1d 00 00 00       	push   $0x1d
  40196b:	e9 10 fe ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401970 <fputs@plt>:
  401970:	ff 25 92 d7 20 00    	jmp    *0x20d792(%rip)        # 60f108 <dlerror@plt+0x20d478>
  401976:	68 1e 00 00 00       	push   $0x1e
  40197b:	e9 00 fe ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401980 <strncat@plt>:
  401980:	ff 25 8a d7 20 00    	jmp    *0x20d78a(%rip)        # 60f110 <dlerror@plt+0x20d480>
  401986:	68 1f 00 00 00       	push   $0x1f
  40198b:	e9 f0 fd ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401990 <__realpath_chk@plt>:
  401990:	ff 25 82 d7 20 00    	jmp    *0x20d782(%rip)        # 60f118 <dlerror@plt+0x20d488>
  401996:	68 20 00 00 00       	push   $0x20
  40199b:	e9 e0 fd ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004019a0 <closedir@plt>:
  4019a0:	ff 25 7a d7 20 00    	jmp    *0x20d77a(%rip)        # 60f120 <dlerror@plt+0x20d490>
  4019a6:	68 21 00 00 00       	push   $0x21
  4019ab:	e9 d0 fd ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004019b0 <memcmp@plt>:
  4019b0:	ff 25 72 d7 20 00    	jmp    *0x20d772(%rip)        # 60f128 <dlerror@plt+0x20d498>
  4019b6:	68 22 00 00 00       	push   $0x22
  4019bb:	e9 c0 fd ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004019c0 <calloc@plt>:
  4019c0:	ff 25 6a d7 20 00    	jmp    *0x20d76a(%rip)        # 60f130 <dlerror@plt+0x20d4a0>
  4019c6:	68 23 00 00 00       	push   $0x23
  4019cb:	e9 b0 fd ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004019d0 <strcmp@plt>:
  4019d0:	ff 25 62 d7 20 00    	jmp    *0x20d762(%rip)        # 60f138 <dlerror@plt+0x20d4a8>
  4019d6:	68 24 00 00 00       	push   $0x24
  4019db:	e9 a0 fd ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004019e0 <signal@plt>:
  4019e0:	ff 25 5a d7 20 00    	jmp    *0x20d75a(%rip)        # 60f140 <dlerror@plt+0x20d4b0>
  4019e6:	68 25 00 00 00       	push   $0x25
  4019eb:	e9 90 fd ff ff       	jmp    401780 <getenv@plt-0x10>

00000000004019f0 <sem_wait@plt>:
  4019f0:	ff 25 52 d7 20 00    	jmp    *0x20d752(%rip)        # 60f148 <dlerror@plt+0x20d4b8>
  4019f6:	68 26 00 00 00       	push   $0x26
  4019fb:	e9 80 fd ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401a00 <feof@plt>:
  401a00:	ff 25 4a d7 20 00    	jmp    *0x20d74a(%rip)        # 60f150 <dlerror@plt+0x20d4c0>
  401a06:	68 27 00 00 00       	push   $0x27
  401a0b:	e9 70 fd ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401a10 <strtol@plt>:
  401a10:	ff 25 42 d7 20 00    	jmp    *0x20d742(%rip)        # 60f158 <dlerror@plt+0x20d4c8>
  401a16:	68 28 00 00 00       	push   $0x28
  401a1b:	e9 60 fd ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401a20 <clearerr@plt>:
  401a20:	ff 25 3a d7 20 00    	jmp    *0x20d73a(%rip)        # 60f160 <dlerror@plt+0x20d4d0>
  401a26:	68 29 00 00 00       	push   $0x29
  401a2b:	e9 50 fd ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401a30 <realpath@plt>:
  401a30:	ff 25 32 d7 20 00    	jmp    *0x20d732(%rip)        # 60f168 <dlerror@plt+0x20d4d8>
  401a36:	68 2a 00 00 00       	push   $0x2a
  401a3b:	e9 40 fd ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401a40 <memcpy@plt>:
  401a40:	ff 25 2a d7 20 00    	jmp    *0x20d72a(%rip)        # 60f170 <dlerror@plt+0x20d4e0>
  401a46:	68 2b 00 00 00       	push   $0x2b
  401a4b:	e9 30 fd ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401a50 <prctl@plt>:
  401a50:	ff 25 22 d7 20 00    	jmp    *0x20d722(%rip)        # 60f178 <dlerror@plt+0x20d4e8>
  401a56:	68 2c 00 00 00       	push   $0x2c
  401a5b:	e9 20 fd ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401a60 <inflateEnd@plt>:
  401a60:	ff 25 1a d7 20 00    	jmp    *0x20d71a(%rip)        # 60f180 <dlerror@plt+0x20d4f0>
  401a66:	68 2d 00 00 00       	push   $0x2d
  401a6b:	e9 10 fd ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401a70 <kill@plt>:
  401a70:	ff 25 12 d7 20 00    	jmp    *0x20d712(%rip)        # 60f188 <dlerror@plt+0x20d4f8>
  401a76:	68 2e 00 00 00       	push   $0x2e
  401a7b:	e9 00 fd ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401a80 <__xpg_basename@plt>:
  401a80:	ff 25 0a d7 20 00    	jmp    *0x20d70a(%rip)        # 60f190 <dlerror@plt+0x20d500>
  401a86:	68 2f 00 00 00       	push   $0x2f
  401a8b:	e9 f0 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401a90 <fileno@plt>:
  401a90:	ff 25 02 d7 20 00    	jmp    *0x20d702(%rip)        # 60f198 <dlerror@plt+0x20d508>
  401a96:	68 30 00 00 00       	push   $0x30
  401a9b:	e9 e0 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401aa0 <__xstat@plt>:
  401aa0:	ff 25 fa d6 20 00    	jmp    *0x20d6fa(%rip)        # 60f1a0 <dlerror@plt+0x20d510>
  401aa6:	68 31 00 00 00       	push   $0x31
  401aab:	e9 d0 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401ab0 <readdir@plt>:
  401ab0:	ff 25 f2 d6 20 00    	jmp    *0x20d6f2(%rip)        # 60f1a8 <dlerror@plt+0x20d518>
  401ab6:	68 32 00 00 00       	push   $0x32
  401abb:	e9 c0 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401ac0 <dlopen@plt>:
  401ac0:	ff 25 ea d6 20 00    	jmp    *0x20d6ea(%rip)        # 60f1b0 <dlerror@plt+0x20d520>
  401ac6:	68 33 00 00 00       	push   $0x33
  401acb:	e9 b0 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401ad0 <malloc@plt>:
  401ad0:	ff 25 e2 d6 20 00    	jmp    *0x20d6e2(%rip)        # 60f1b8 <dlerror@plt+0x20d528>
  401ad6:	68 34 00 00 00       	push   $0x34
  401adb:	e9 a0 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401ae0 <fflush@plt>:
  401ae0:	ff 25 da d6 20 00    	jmp    *0x20d6da(%rip)        # 60f1c0 <dlerror@plt+0x20d530>
  401ae6:	68 35 00 00 00       	push   $0x35
  401aeb:	e9 90 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401af0 <__isoc99_sscanf@plt>:
  401af0:	ff 25 d2 d6 20 00    	jmp    *0x20d6d2(%rip)        # 60f1c8 <dlerror@plt+0x20d538>
  401af6:	68 36 00 00 00       	push   $0x36
  401afb:	e9 80 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401b00 <wcsdup@plt>:
  401b00:	ff 25 ca d6 20 00    	jmp    *0x20d6ca(%rip)        # 60f1d0 <dlerror@plt+0x20d540>
  401b06:	68 37 00 00 00       	push   $0x37
  401b0b:	e9 70 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401b10 <sem_post@plt>:
  401b10:	ff 25 c2 d6 20 00    	jmp    *0x20d6c2(%rip)        # 60f1d8 <dlerror@plt+0x20d548>
  401b16:	68 38 00 00 00       	push   $0x38
  401b1b:	e9 60 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401b20 <__vsnprintf_chk@plt>:
  401b20:	ff 25 ba d6 20 00    	jmp    *0x20d6ba(%rip)        # 60f1e0 <dlerror@plt+0x20d550>
  401b26:	68 39 00 00 00       	push   $0x39
  401b2b:	e9 50 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401b30 <dlclose@plt>:
  401b30:	ff 25 b2 d6 20 00    	jmp    *0x20d6b2(%rip)        # 60f1e8 <dlerror@plt+0x20d558>
  401b36:	68 3a 00 00 00       	push   $0x3a
  401b3b:	e9 40 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401b40 <realloc@plt>:
  401b40:	ff 25 aa d6 20 00    	jmp    *0x20d6aa(%rip)        # 60f1f0 <dlerror@plt+0x20d560>
  401b46:	68 3b 00 00 00       	push   $0x3b
  401b4b:	e9 30 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401b50 <mkdtemp@plt>:
  401b50:	ff 25 a2 d6 20 00    	jmp    *0x20d6a2(%rip)        # 60f1f8 <dlerror@plt+0x20d568>
  401b56:	68 3c 00 00 00       	push   $0x3c
  401b5b:	e9 20 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401b60 <munmap@plt>:
  401b60:	ff 25 9a d6 20 00    	jmp    *0x20d69a(%rip)        # 60f200 <dlerror@plt+0x20d570>
  401b66:	68 3d 00 00 00       	push   $0x3d
  401b6b:	e9 10 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401b70 <fchmod@plt>:
  401b70:	ff 25 92 d6 20 00    	jmp    *0x20d692(%rip)        # 60f208 <dlerror@plt+0x20d578>
  401b76:	68 3e 00 00 00       	push   $0x3e
  401b7b:	e9 00 fc ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401b80 <inflateInit_@plt>:
  401b80:	ff 25 8a d6 20 00    	jmp    *0x20d68a(%rip)        # 60f210 <dlerror@plt+0x20d580>
  401b86:	68 3f 00 00 00       	push   $0x3f
  401b8b:	e9 f0 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401b90 <__fread_chk@plt>:
  401b90:	ff 25 82 d6 20 00    	jmp    *0x20d682(%rip)        # 60f218 <dlerror@plt+0x20d588>
  401b96:	68 40 00 00 00       	push   $0x40
  401b9b:	e9 e0 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401ba0 <waitpid@plt>:
  401ba0:	ff 25 7a d6 20 00    	jmp    *0x20d67a(%rip)        # 60f220 <dlerror@plt+0x20d590>
  401ba6:	68 41 00 00 00       	push   $0x41
  401bab:	e9 d0 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401bb0 <sem_init@plt>:
  401bb0:	ff 25 72 d6 20 00    	jmp    *0x20d672(%rip)        # 60f228 <dlerror@plt+0x20d598>
  401bb6:	68 42 00 00 00       	push   $0x42
  401bbb:	e9 c0 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401bc0 <fseeko@plt>:
  401bc0:	ff 25 6a d6 20 00    	jmp    *0x20d66a(%rip)        # 60f230 <dlerror@plt+0x20d5a0>
  401bc6:	68 43 00 00 00       	push   $0x43
  401bcb:	e9 b0 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401bd0 <fopen@plt>:
  401bd0:	ff 25 62 d6 20 00    	jmp    *0x20d662(%rip)        # 60f238 <dlerror@plt+0x20d5a8>
  401bd6:	68 44 00 00 00       	push   $0x44
  401bdb:	e9 a0 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401be0 <strtok@plt>:
  401be0:	ff 25 5a d6 20 00    	jmp    *0x20d65a(%rip)        # 60f240 <dlerror@plt+0x20d5b0>
  401be6:	68 45 00 00 00       	push   $0x45
  401beb:	e9 90 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401bf0 <unsetenv@plt>:
  401bf0:	ff 25 52 d6 20 00    	jmp    *0x20d652(%rip)        # 60f248 <dlerror@plt+0x20d5b8>
  401bf6:	68 46 00 00 00       	push   $0x46
  401bfb:	e9 80 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401c00 <strtoul@plt>:
  401c00:	ff 25 4a d6 20 00    	jmp    *0x20d64a(%rip)        # 60f250 <dlerror@plt+0x20d5c0>
  401c06:	68 47 00 00 00       	push   $0x47
  401c0b:	e9 70 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401c10 <execvp@plt>:
  401c10:	ff 25 42 d6 20 00    	jmp    *0x20d642(%rip)        # 60f258 <dlerror@plt+0x20d5c8>
  401c16:	68 48 00 00 00       	push   $0x48
  401c1b:	e9 60 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401c20 <exit@plt>:
  401c20:	ff 25 3a d6 20 00    	jmp    *0x20d63a(%rip)        # 60f260 <dlerror@plt+0x20d5d0>
  401c26:	68 49 00 00 00       	push   $0x49
  401c2b:	e9 50 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401c30 <fwrite@plt>:
  401c30:	ff 25 32 d6 20 00    	jmp    *0x20d632(%rip)        # 60f268 <dlerror@plt+0x20d5d8>
  401c36:	68 4a 00 00 00       	push   $0x4a
  401c3b:	e9 40 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401c40 <strdup@plt>:
  401c40:	ff 25 2a d6 20 00    	jmp    *0x20d62a(%rip)        # 60f270 <dlerror@plt+0x20d5e0>
  401c46:	68 4b 00 00 00       	push   $0x4b
  401c4b:	e9 30 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401c50 <sem_destroy@plt>:
  401c50:	ff 25 22 d6 20 00    	jmp    *0x20d622(%rip)        # 60f278 <dlerror@plt+0x20d5e8>
  401c56:	68 4c 00 00 00       	push   $0x4c
  401c5b:	e9 20 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401c60 <strerror@plt>:
  401c60:	ff 25 1a d6 20 00    	jmp    *0x20d61a(%rip)        # 60f280 <dlerror@plt+0x20d5f0>
  401c66:	68 4d 00 00 00       	push   $0x4d
  401c6b:	e9 10 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401c70 <dlsym@plt>:
  401c70:	ff 25 12 d6 20 00    	jmp    *0x20d612(%rip)        # 60f288 <dlerror@plt+0x20d5f8>
  401c76:	68 4e 00 00 00       	push   $0x4e
  401c7b:	e9 00 fb ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401c80 <fork@plt>:
  401c80:	ff 25 0a d6 20 00    	jmp    *0x20d60a(%rip)        # 60f290 <dlerror@plt+0x20d600>
  401c86:	68 4f 00 00 00       	push   $0x4f
  401c8b:	e9 f0 fa ff ff       	jmp    401780 <getenv@plt-0x10>

0000000000401c90 <dlerror@plt>:
  401c90:	ff 25 02 d6 20 00    	jmp    *0x20d602(%rip)        # 60f298 <dlerror@plt+0x20d608>
  401c96:	68 50 00 00 00       	push   $0x50
  401c9b:	e9 e0 fa ff ff       	jmp    401780 <getenv@plt-0x10>

Disassembly of section .text:

0000000000401ca0 <.text>:
  401ca0:	48 8b 05 f9 d0 20 00 	mov    0x20d0f9(%rip),%rax        # 60eda0 <dlerror@plt+0x20d110>
  401ca7:	89 38                	mov    %edi,(%rax)
  401ca9:	48 89 70 08          	mov    %rsi,0x8(%rax)
  401cad:	48 89 c7             	mov    %rax,%rdi
  401cb0:	e9 db 30 00 00       	jmp    404d90 <dlerror@plt+0x3100>
  401cb5:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  401cbc:	00 00 00 
  401cbf:	90                   	nop
  401cc0:	31 ed                	xor    %ebp,%ebp
  401cc2:	49 89 d1             	mov    %rdx,%r9
  401cc5:	5e                   	pop    %rsi
  401cc6:	48 89 e2             	mov    %rsp,%rdx
  401cc9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  401ccd:	50                   	push   %rax
  401cce:	54                   	push   %rsp
  401ccf:	49 c7 c0 20 a5 40 00 	mov    $0x40a520,%r8
  401cd6:	48 c7 c1 b0 a4 40 00 	mov    $0x40a4b0,%rcx
  401cdd:	48 c7 c7 a0 1c 40 00 	mov    $0x401ca0,%rdi
  401ce4:	ff 15 fe d2 20 00    	call   *0x20d2fe(%rip)        # 60efe8 <dlerror@plt+0x20d358>
  401cea:	f4                   	hlt
  401ceb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401cf0:	f3 c3                	repz ret
  401cf2:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  401cf9:	00 00 00 
  401cfc:	0f 1f 40 00          	nopl   0x0(%rax)
  401d00:	55                   	push   %rbp
  401d01:	b8 b0 f2 60 00       	mov    $0x60f2b0,%eax
  401d06:	48 3d b0 f2 60 00    	cmp    $0x60f2b0,%rax
  401d0c:	48 89 e5             	mov    %rsp,%rbp
  401d0f:	74 17                	je     401d28 <dlerror@plt+0x98>
  401d11:	b8 00 00 00 00       	mov    $0x0,%eax
  401d16:	48 85 c0             	test   %rax,%rax
  401d19:	74 0d                	je     401d28 <dlerror@plt+0x98>
  401d1b:	5d                   	pop    %rbp
  401d1c:	bf b0 f2 60 00       	mov    $0x60f2b0,%edi
  401d21:	ff e0                	jmp    *%rax
  401d23:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401d28:	5d                   	pop    %rbp
  401d29:	c3                   	ret
  401d2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401d30:	be b0 f2 60 00       	mov    $0x60f2b0,%esi
  401d35:	55                   	push   %rbp
  401d36:	48 81 ee b0 f2 60 00 	sub    $0x60f2b0,%rsi
  401d3d:	48 89 e5             	mov    %rsp,%rbp
  401d40:	48 c1 fe 03          	sar    $0x3,%rsi
  401d44:	48 89 f0             	mov    %rsi,%rax
  401d47:	48 c1 e8 3f          	shr    $0x3f,%rax
  401d4b:	48 01 c6             	add    %rax,%rsi
  401d4e:	48 d1 fe             	sar    $1,%rsi
  401d51:	74 15                	je     401d68 <dlerror@plt+0xd8>
  401d53:	b8 00 00 00 00       	mov    $0x0,%eax
  401d58:	48 85 c0             	test   %rax,%rax
  401d5b:	74 0b                	je     401d68 <dlerror@plt+0xd8>
  401d5d:	5d                   	pop    %rbp
  401d5e:	bf b0 f2 60 00       	mov    $0x60f2b0,%edi
  401d63:	ff e0                	jmp    *%rax
  401d65:	0f 1f 00             	nopl   (%rax)
  401d68:	5d                   	pop    %rbp
  401d69:	c3                   	ret
  401d6a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401d70:	80 3d 71 d5 20 00 00 	cmpb   $0x0,0x20d571(%rip)        # 60f2e8 <stderr@GLIBC_2.2.5+0x8>
  401d77:	75 17                	jne    401d90 <dlerror@plt+0x100>
  401d79:	55                   	push   %rbp
  401d7a:	48 89 e5             	mov    %rsp,%rbp
  401d7d:	e8 7e ff ff ff       	call   401d00 <dlerror@plt+0x70>
  401d82:	c6 05 5f d5 20 00 01 	movb   $0x1,0x20d55f(%rip)        # 60f2e8 <stderr@GLIBC_2.2.5+0x8>
  401d89:	5d                   	pop    %rbp
  401d8a:	c3                   	ret
  401d8b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401d90:	f3 c3                	repz ret
  401d92:	0f 1f 40 00          	nopl   0x0(%rax)
  401d96:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  401d9d:	00 00 00 
  401da0:	55                   	push   %rbp
  401da1:	48 89 e5             	mov    %rsp,%rbp
  401da4:	5d                   	pop    %rbp
  401da5:	eb 89                	jmp    401d30 <dlerror@plt+0xa0>
  401da7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  401dae:	00 00 
  401db0:	41 57                	push   %r15
  401db2:	41 56                	push   %r14
  401db4:	41 55                	push   %r13
  401db6:	41 54                	push   %r12
  401db8:	55                   	push   %rbp
  401db9:	53                   	push   %rbx
  401dba:	48 89 f5             	mov    %rsi,%rbp
  401dbd:	48 8d 35 70 87 00 00 	lea    0x8770(%rip),%rsi        # 40a534 <dlerror@plt+0x88a4>
  401dc4:	48 81 ec b8 00 00 00 	sub    $0xb8,%rsp
  401dcb:	4c 8d 6c 24 30       	lea    0x30(%rsp),%r13
  401dd0:	48 89 3c 24          	mov    %rdi,(%rsp)
  401dd4:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
  401dd9:	ba 70 00 00 00       	mov    $0x70,%edx
  401dde:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
  401de3:	48 c7 44 24 70 00 00 	movq   $0x0,0x70(%rsp)
  401dea:	00 00 
  401dec:	4c 89 ef             	mov    %r13,%rdi
  401def:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
  401df6:	00 00 
  401df8:	48 c7 84 24 80 00 00 	movq   $0x0,0x80(%rsp)
  401dff:	00 00 00 00 00 
  401e04:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401e0b:	00 00 
  401e0d:	48 89 84 24 a8 00 00 	mov    %rax,0xa8(%rsp)
  401e14:	00 
  401e15:	31 c0                	xor    %eax,%eax
  401e17:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%rsp)
  401e1e:	00 
  401e1f:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
  401e26:	00 00 
  401e28:	e8 53 fd ff ff       	call   401b80 <inflateInit_@plt>
  401e2d:	85 c0                	test   %eax,%eax
  401e2f:	89 c3                	mov    %eax,%ebx
  401e31:	0f 85 c1 02 00 00    	jne    4020f8 <dlerror@plt+0x468>
  401e37:	bf 00 20 00 00       	mov    $0x2000,%edi
  401e3c:	e8 8f fc ff ff       	call   401ad0 <malloc@plt>
  401e41:	48 85 c0             	test   %rax,%rax
  401e44:	49 89 c4             	mov    %rax,%r12
  401e47:	0f 84 33 01 00 00    	je     401f80 <dlerror@plt+0x2f0>
  401e4d:	bf 00 20 00 00       	mov    $0x2000,%edi
  401e52:	e8 79 fc ff ff       	call   401ad0 <malloc@plt>
  401e57:	48 85 c0             	test   %rax,%rax
  401e5a:	49 89 c6             	mov    %rax,%r14
  401e5d:	0f 84 1d 02 00 00    	je     402080 <dlerror@plt+0x3f0>
  401e63:	8b 45 08             	mov    0x8(%rbp),%eax
  401e66:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  401e6b:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  401e70:	48 8b 1c 24          	mov    (%rsp),%rbx
  401e74:	41 bf 00 20 00 00    	mov    $0x2000,%r15d
  401e7a:	ba 01 00 00 00       	mov    $0x1,%edx
  401e7f:	be 00 20 00 00       	mov    $0x2000,%esi
  401e84:	4c 89 e7             	mov    %r12,%rdi
  401e87:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  401e8d:	49 89 d8             	mov    %rbx,%r8
  401e90:	4c 0f 46 f8          	cmovbe %rax,%r15
  401e94:	4c 89 f9             	mov    %r15,%rcx
  401e97:	e8 f4 fc ff ff       	call   401b90 <__fread_chk@plt>
  401e9c:	49 39 c7             	cmp    %rax,%r15
  401e9f:	0f 85 43 02 00 00    	jne    4020e8 <dlerror@plt+0x458>
  401ea5:	48 89 df             	mov    %rbx,%rdi
  401ea8:	e8 a3 f9 ff ff       	call   401850 <ferror@plt>
  401ead:	85 c0                	test   %eax,%eax
  401eaf:	0f 85 33 02 00 00    	jne    4020e8 <dlerror@plt+0x458>
  401eb5:	89 44 24 24          	mov    %eax,0x24(%rsp)
  401eb9:	48 89 e8             	mov    %rbp,%rax
  401ebc:	44 89 7c 24 38       	mov    %r15d,0x38(%rsp)
  401ec1:	4c 89 f5             	mov    %r14,%rbp
  401ec4:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
  401ec9:	49 89 c6             	mov    %rax,%r14
  401ecc:	31 f6                	xor    %esi,%esi
  401ece:	4c 89 ef             	mov    %r13,%rdi
  401ed1:	c7 44 24 50 00 20 00 	movl   $0x2000,0x50(%rsp)
  401ed8:	00 
  401ed9:	48 89 6c 24 48       	mov    %rbp,0x48(%rsp)
  401ede:	e8 4d f9 ff ff       	call   401830 <inflate@plt>
  401ee3:	83 f8 fc             	cmp    $0xfffffffc,%eax
  401ee6:	89 c3                	mov    %eax,%ebx
  401ee8:	0f 8c ba 00 00 00    	jl     401fa8 <dlerror@plt+0x318>
  401eee:	83 f8 fe             	cmp    $0xfffffffe,%eax
  401ef1:	7e 7d                	jle    401f70 <dlerror@plt+0x2e0>
  401ef3:	83 f8 02             	cmp    $0x2,%eax
  401ef6:	0f 85 ac 00 00 00    	jne    401fa8 <dlerror@plt+0x318>
  401efc:	4c 89 f0             	mov    %r14,%rax
  401eff:	41 b8 fd ff ff ff    	mov    $0xfffffffd,%r8d
  401f05:	49 89 ee             	mov    %rbp,%r14
  401f08:	48 89 c5             	mov    %rax,%rbp
  401f0b:	48 8d 75 12          	lea    0x12(%rbp),%rsi
  401f0f:	48 8d 3d 72 87 00 00 	lea    0x8772(%rip),%rdi        # 40a688 <dlerror@plt+0x89f8>
  401f16:	44 89 c2             	mov    %r8d,%edx
  401f19:	31 c0                	xor    %eax,%eax
  401f1b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  401f20:	e8 cb 25 00 00       	call   4044f0 <dlerror@plt+0x2860>
  401f25:	4c 89 ef             	mov    %r13,%rdi
  401f28:	e8 33 fb ff ff       	call   401a60 <inflateEnd@plt>
  401f2d:	4c 89 e7             	mov    %r12,%rdi
  401f30:	e8 8b f8 ff ff       	call   4017c0 <free@plt>
  401f35:	4c 89 f7             	mov    %r14,%rdi
  401f38:	e8 83 f8 ff ff       	call   4017c0 <free@plt>
  401f3d:	48 8b 8c 24 a8 00 00 	mov    0xa8(%rsp),%rcx
  401f44:	00 
  401f45:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  401f4c:	00 00 
  401f4e:	89 d8                	mov    %ebx,%eax
  401f50:	0f 85 03 02 00 00    	jne    402159 <dlerror@plt+0x4c9>
  401f56:	48 81 c4 b8 00 00 00 	add    $0xb8,%rsp
  401f5d:	5b                   	pop    %rbx
  401f5e:	5d                   	pop    %rbp
  401f5f:	41 5c                	pop    %r12
  401f61:	41 5d                	pop    %r13
  401f63:	41 5e                	pop    %r14
  401f65:	41 5f                	pop    %r15
  401f67:	c3                   	ret
  401f68:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  401f6f:	00 
  401f70:	41 89 c0             	mov    %eax,%r8d
  401f73:	4c 89 f0             	mov    %r14,%rax
  401f76:	49 89 ee             	mov    %rbp,%r14
  401f79:	48 89 c5             	mov    %rax,%rbp
  401f7c:	eb 8d                	jmp    401f0b <dlerror@plt+0x27b>
  401f7e:	66 90                	xchg   %ax,%ax
  401f80:	e8 4b f8 ff ff       	call   4017d0 <__errno_location@plt>
  401f85:	8b 30                	mov    (%rax),%esi
  401f87:	48 8d 4d 12          	lea    0x12(%rbp),%rcx
  401f8b:	48 8d 15 66 86 00 00 	lea    0x8666(%rip),%rdx        # 40a5f8 <dlerror@plt+0x8968>
  401f92:	48 8d 3d a1 85 00 00 	lea    0x85a1(%rip),%rdi        # 40a53a <dlerror@plt+0x88aa>
  401f99:	31 c0                	xor    %eax,%eax
  401f9b:	45 31 f6             	xor    %r14d,%r14d
  401f9e:	e8 0d 26 00 00       	call   4045b0 <dlerror@plt+0x2920>
  401fa3:	eb 80                	jmp    401f25 <dlerror@plt+0x295>
  401fa5:	0f 1f 00             	nopl   (%rax)
  401fa8:	8b 54 24 50          	mov    0x50(%rsp),%edx
  401fac:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  401fb1:	41 b9 00 20 00 00    	mov    $0x2000,%r9d
  401fb7:	49 29 d1             	sub    %rdx,%r9
  401fba:	48 85 c9             	test   %rcx,%rcx
  401fbd:	48 89 d0             	mov    %rdx,%rax
  401fc0:	74 7e                	je     402040 <dlerror@plt+0x3b0>
  401fc2:	4c 89 ca             	mov    %r9,%rdx
  401fc5:	be 01 00 00 00       	mov    $0x1,%esi
  401fca:	48 89 ef             	mov    %rbp,%rdi
  401fcd:	4c 89 4c 24 28       	mov    %r9,0x28(%rsp)
  401fd2:	e8 59 fc ff ff       	call   401c30 <fwrite@plt>
  401fd7:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
  401fdc:	4c 39 c8             	cmp    %r9,%rax
  401fdf:	0f 85 31 01 00 00    	jne    402116 <dlerror@plt+0x486>
  401fe5:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  401fea:	e8 61 f8 ff ff       	call   401850 <ferror@plt>
  401fef:	85 c0                	test   %eax,%eax
  401ff1:	0f 85 1f 01 00 00    	jne    402116 <dlerror@plt+0x486>
  401ff7:	8b 44 24 50          	mov    0x50(%rsp),%eax
  401ffb:	85 c0                	test   %eax,%eax
  401ffd:	0f 84 c9 fe ff ff    	je     401ecc <dlerror@plt+0x23c>
  402003:	41 89 d8             	mov    %ebx,%r8d
  402006:	4c 89 f0             	mov    %r14,%rax
  402009:	4c 29 7c 24 18       	sub    %r15,0x18(%rsp)
  40200e:	41 83 f8 01          	cmp    $0x1,%r8d
  402012:	49 89 ee             	mov    %rbp,%r14
  402015:	8b 5c 24 24          	mov    0x24(%rsp),%ebx
  402019:	48 89 c5             	mov    %rax,%rbp
  40201c:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  402021:	74 09                	je     40202c <dlerror@plt+0x39c>
  402023:	48 85 c0             	test   %rax,%rax
  402026:	0f 85 3f fe ff ff    	jne    401e6b <dlerror@plt+0x1db>
  40202c:	41 83 f8 01          	cmp    $0x1,%r8d
  402030:	0f 84 ef fe ff ff    	je     401f25 <dlerror@plt+0x295>
  402036:	e9 d0 fe ff ff       	jmp    401f0b <dlerror@plt+0x27b>
  40203b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402040:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
  402046:	74 b3                	je     401ffb <dlerror@plt+0x36b>
  402048:	49 83 f9 08          	cmp    $0x8,%r9
  40204c:	73 5a                	jae    4020a8 <dlerror@plt+0x418>
  40204e:	41 f6 c1 04          	test   $0x4,%r9b
  402052:	0f 85 d2 00 00 00    	jne    40212a <dlerror@plt+0x49a>
  402058:	4d 85 c9             	test   %r9,%r9
  40205b:	74 15                	je     402072 <dlerror@plt+0x3e2>
  40205d:	0f b6 55 00          	movzbl 0x0(%rbp),%edx
  402061:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  402066:	41 f6 c1 02          	test   $0x2,%r9b
  40206a:	88 16                	mov    %dl,(%rsi)
  40206c:	0f 85 d1 00 00 00    	jne    402143 <dlerror@plt+0x4b3>
  402072:	4c 01 4c 24 10       	add    %r9,0x10(%rsp)
  402077:	eb 82                	jmp    401ffb <dlerror@plt+0x36b>
  402079:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402080:	e8 4b f7 ff ff       	call   4017d0 <__errno_location@plt>
  402085:	8b 30                	mov    (%rax),%esi
  402087:	48 8d 4d 12          	lea    0x12(%rbp),%rcx
  40208b:	48 8d 15 ae 85 00 00 	lea    0x85ae(%rip),%rdx        # 40a640 <dlerror@plt+0x89b0>
  402092:	48 8d 3d a1 84 00 00 	lea    0x84a1(%rip),%rdi        # 40a53a <dlerror@plt+0x88aa>
  402099:	31 c0                	xor    %eax,%eax
  40209b:	e8 10 25 00 00       	call   4045b0 <dlerror@plt+0x2920>
  4020a0:	e9 80 fe ff ff       	jmp    401f25 <dlerror@plt+0x295>
  4020a5:	0f 1f 00             	nopl   (%rax)
  4020a8:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  4020ad:	48 8b 55 00          	mov    0x0(%rbp),%rdx
  4020b1:	48 89 ee             	mov    %rbp,%rsi
  4020b4:	48 89 11             	mov    %rdx,(%rcx)
  4020b7:	4a 8b 54 0d f8       	mov    -0x8(%rbp,%r9,1),%rdx
  4020bc:	48 8d 79 08          	lea    0x8(%rcx),%rdi
  4020c0:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  4020c4:	4a 89 54 09 f8       	mov    %rdx,-0x8(%rcx,%r9,1)
  4020c9:	48 89 ca             	mov    %rcx,%rdx
  4020cc:	48 29 fa             	sub    %rdi,%rdx
  4020cf:	48 89 d1             	mov    %rdx,%rcx
  4020d2:	48 29 d6             	sub    %rdx,%rsi
  4020d5:	4c 01 c9             	add    %r9,%rcx
  4020d8:	48 c1 e9 03          	shr    $0x3,%rcx
  4020dc:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  4020df:	eb 91                	jmp    402072 <dlerror@plt+0x3e2>
  4020e1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4020e8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  4020ed:	e9 33 fe ff ff       	jmp    401f25 <dlerror@plt+0x295>
  4020f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4020f8:	48 8d 75 12          	lea    0x12(%rbp),%rsi
  4020fc:	48 8d 3d ad 84 00 00 	lea    0x84ad(%rip),%rdi        # 40a5b0 <dlerror@plt+0x8920>
  402103:	89 c2                	mov    %eax,%edx
  402105:	31 c0                	xor    %eax,%eax
  402107:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  40210c:	e8 df 23 00 00       	call   4044f0 <dlerror@plt+0x2860>
  402111:	e9 27 fe ff ff       	jmp    401f3d <dlerror@plt+0x2ad>
  402116:	4c 89 f0             	mov    %r14,%rax
  402119:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  40211f:	49 89 ee             	mov    %rbp,%r14
  402122:	48 89 c5             	mov    %rax,%rbp
  402125:	e9 e1 fd ff ff       	jmp    401f0b <dlerror@plt+0x27b>
  40212a:	8b 55 00             	mov    0x0(%rbp),%edx
  40212d:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  402132:	89 16                	mov    %edx,(%rsi)
  402134:	42 8b 54 0d fc       	mov    -0x4(%rbp,%r9,1),%edx
  402139:	42 89 54 0e fc       	mov    %edx,-0x4(%rsi,%r9,1)
  40213e:	e9 2f ff ff ff       	jmp    402072 <dlerror@plt+0x3e2>
  402143:	42 0f b7 54 0d fe    	movzwl -0x2(%rbp,%r9,1),%edx
  402149:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  40214e:	66 42 89 54 0e fe    	mov    %dx,-0x2(%rsi,%r9,1)
  402154:	e9 19 ff ff ff       	jmp    402072 <dlerror@plt+0x3e2>
  402159:	e8 a2 f7 ff ff       	call   401900 <__stack_chk_fail@plt>
  40215e:	66 90                	xchg   %ax,%ax
  402160:	8b 06                	mov    (%rsi),%eax
  402162:	48 01 f0             	add    %rsi,%rax
  402165:	c3                   	ret
  402166:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40216d:	00 00 00 
  402170:	41 57                	push   %r15
  402172:	41 56                	push   %r14
  402174:	41 55                	push   %r13
  402176:	41 54                	push   %r12
  402178:	49 89 f5             	mov    %rsi,%r13
  40217b:	55                   	push   %rbp
  40217c:	53                   	push   %rbx
  40217d:	48 8d 35 bd 83 00 00 	lea    0x83bd(%rip),%rsi        # 40a541 <dlerror@plt+0x88b1>
  402184:	48 89 fb             	mov    %rdi,%rbx
  402187:	48 83 ec 08          	sub    $0x8,%rsp
  40218b:	e8 40 fa ff ff       	call   401bd0 <fopen@plt>
  402190:	48 85 c0             	test   %rax,%rax
  402193:	0f 84 47 01 00 00    	je     4022e0 <dlerror@plt+0x650>
  402199:	41 8b 75 04          	mov    0x4(%r13),%esi
  40219d:	31 d2                	xor    %edx,%edx
  40219f:	48 89 c7             	mov    %rax,%rdi
  4021a2:	48 03 b3 00 10 00 00 	add    0x1000(%rbx),%rsi
  4021a9:	49 89 c4             	mov    %rax,%r12
  4021ac:	e8 0f fa ff ff       	call   401bc0 <fseeko@plt>
  4021b1:	85 c0                	test   %eax,%eax
  4021b3:	0f 88 b7 00 00 00    	js     402270 <dlerror@plt+0x5e0>
  4021b9:	41 8b 5d 0c          	mov    0xc(%r13),%ebx
  4021bd:	48 89 df             	mov    %rbx,%rdi
  4021c0:	e8 0b f9 ff ff       	call   401ad0 <malloc@plt>
  4021c5:	48 85 c0             	test   %rax,%rax
  4021c8:	49 89 c6             	mov    %rax,%r14
  4021cb:	0f 84 df 00 00 00    	je     4022b0 <dlerror@plt+0x620>
  4021d1:	41 80 7d 10 01       	cmpb   $0x1,0x10(%r13)
  4021d6:	0f 84 bc 00 00 00    	je     402298 <dlerror@plt+0x608>
  4021dc:	48 85 db             	test   %rbx,%rbx
  4021df:	49 89 c7             	mov    %rax,%r15
  4021e2:	75 14                	jne    4021f8 <dlerror@plt+0x568>
  4021e4:	eb 6a                	jmp    402250 <dlerror@plt+0x5c0>
  4021e6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4021ed:	00 00 00 
  4021f0:	49 01 ef             	add    %rbp,%r15
  4021f3:	48 29 eb             	sub    %rbp,%rbx
  4021f6:	74 58                	je     402250 <dlerror@plt+0x5c0>
  4021f8:	48 81 fb 00 20 00 00 	cmp    $0x2000,%rbx
  4021ff:	bd 00 20 00 00       	mov    $0x2000,%ebp
  402204:	4c 89 e1             	mov    %r12,%rcx
  402207:	48 0f 46 eb          	cmovbe %rbx,%rbp
  40220b:	ba 01 00 00 00       	mov    $0x1,%edx
  402210:	4c 89 ff             	mov    %r15,%rdi
  402213:	48 89 ee             	mov    %rbp,%rsi
  402216:	e8 45 f6 ff ff       	call   401860 <fread@plt>
  40221b:	48 85 c0             	test   %rax,%rax
  40221e:	75 d0                	jne    4021f0 <dlerror@plt+0x560>
  402220:	e8 ab f5 ff ff       	call   4017d0 <__errno_location@plt>
  402225:	8b 30                	mov    (%rax),%esi
  402227:	49 8d 4d 12          	lea    0x12(%r13),%rcx
  40222b:	48 8d 15 5e 85 00 00 	lea    0x855e(%rip),%rdx        # 40a790 <dlerror@plt+0x8b00>
  402232:	48 8d 3d 11 83 00 00 	lea    0x8311(%rip),%rdi        # 40a54a <dlerror@plt+0x88ba>
  402239:	31 c0                	xor    %eax,%eax
  40223b:	e8 70 23 00 00       	call   4045b0 <dlerror@plt+0x2920>
  402240:	4c 89 f7             	mov    %r14,%rdi
  402243:	45 31 f6             	xor    %r14d,%r14d
  402246:	e8 75 f5 ff ff       	call   4017c0 <free@plt>
  40224b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402250:	4c 89 e7             	mov    %r12,%rdi
  402253:	e8 58 f6 ff ff       	call   4018b0 <fclose@plt>
  402258:	48 83 c4 08          	add    $0x8,%rsp
  40225c:	4c 89 f0             	mov    %r14,%rax
  40225f:	5b                   	pop    %rbx
  402260:	5d                   	pop    %rbp
  402261:	41 5c                	pop    %r12
  402263:	41 5d                	pop    %r13
  402265:	41 5e                	pop    %r14
  402267:	41 5f                	pop    %r15
  402269:	c3                   	ret
  40226a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402270:	e8 5b f5 ff ff       	call   4017d0 <__errno_location@plt>
  402275:	8b 30                	mov    (%rax),%esi
  402277:	49 8d 4d 12          	lea    0x12(%r13),%rcx
  40227b:	48 8d 15 86 84 00 00 	lea    0x8486(%rip),%rdx        # 40a708 <dlerror@plt+0x8a78>
  402282:	48 8d 3d bb 82 00 00 	lea    0x82bb(%rip),%rdi        # 40a544 <dlerror@plt+0x88b4>
  402289:	31 c0                	xor    %eax,%eax
  40228b:	45 31 f6             	xor    %r14d,%r14d
  40228e:	e8 1d 23 00 00       	call   4045b0 <dlerror@plt+0x2920>
  402293:	eb bb                	jmp    402250 <dlerror@plt+0x5c0>
  402295:	0f 1f 00             	nopl   (%rax)
  402298:	31 d2                	xor    %edx,%edx
  40229a:	48 89 c1             	mov    %rax,%rcx
  40229d:	4c 89 ee             	mov    %r13,%rsi
  4022a0:	4c 89 e7             	mov    %r12,%rdi
  4022a3:	e8 08 fb ff ff       	call   401db0 <dlerror@plt+0x120>
  4022a8:	85 c0                	test   %eax,%eax
  4022aa:	74 a4                	je     402250 <dlerror@plt+0x5c0>
  4022ac:	eb 92                	jmp    402240 <dlerror@plt+0x5b0>
  4022ae:	66 90                	xchg   %ax,%ax
  4022b0:	e8 1b f5 ff ff       	call   4017d0 <__errno_location@plt>
  4022b5:	8b 30                	mov    (%rax),%esi
  4022b7:	49 8d 4d 12          	lea    0x12(%r13),%rcx
  4022bb:	48 8d 15 86 84 00 00 	lea    0x8486(%rip),%rdx        # 40a748 <dlerror@plt+0x8ab8>
  4022c2:	48 8d 3d 71 82 00 00 	lea    0x8271(%rip),%rdi        # 40a53a <dlerror@plt+0x88aa>
  4022c9:	41 89 d8             	mov    %ebx,%r8d
  4022cc:	31 c0                	xor    %eax,%eax
  4022ce:	e8 dd 22 00 00       	call   4045b0 <dlerror@plt+0x2920>
  4022d3:	e9 78 ff ff ff       	jmp    402250 <dlerror@plt+0x5c0>
  4022d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4022df:	00 
  4022e0:	49 8d 75 12          	lea    0x12(%r13),%rsi
  4022e4:	48 8d 3d e5 83 00 00 	lea    0x83e5(%rip),%rdi        # 40a6d0 <dlerror@plt+0x8a40>
  4022eb:	31 c0                	xor    %eax,%eax
  4022ed:	45 31 f6             	xor    %r14d,%r14d
  4022f0:	e8 fb 21 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4022f5:	e9 5e ff ff ff       	jmp    402258 <dlerror@plt+0x5c8>
  4022fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402300:	41 57                	push   %r15
  402302:	41 56                	push   %r14
  402304:	41 55                	push   %r13
  402306:	41 54                	push   %r12
  402308:	49 89 f4             	mov    %rsi,%r12
  40230b:	55                   	push   %rbp
  40230c:	53                   	push   %rbx
  40230d:	48 89 fb             	mov    %rdi,%rbx
  402310:	48 83 ec 18          	sub    $0x18,%rsp
  402314:	80 7e 11 6e          	cmpb   $0x6e,0x11(%rsi)
  402318:	0f 84 3a 01 00 00    	je     402458 <dlerror@plt+0x7c8>
  40231e:	48 8d 35 2b 82 00 00 	lea    0x822b(%rip),%rsi        # 40a550 <dlerror@plt+0x88c0>
  402325:	48 89 d7             	mov    %rdx,%rdi
  402328:	e8 a3 f8 ff ff       	call   401bd0 <fopen@plt>
  40232d:	48 85 c0             	test   %rax,%rax
  402330:	49 89 c5             	mov    %rax,%r13
  402333:	0f 84 5f 02 00 00    	je     402598 <dlerror@plt+0x908>
  402339:	48 8d 35 01 82 00 00 	lea    0x8201(%rip),%rsi        # 40a541 <dlerror@plt+0x88b1>
  402340:	48 89 df             	mov    %rbx,%rdi
  402343:	e8 88 f8 ff ff       	call   401bd0 <fopen@plt>
  402348:	48 85 c0             	test   %rax,%rax
  40234b:	49 89 c6             	mov    %rax,%r14
  40234e:	0f 84 54 01 00 00    	je     4024a8 <dlerror@plt+0x818>
  402354:	41 8b 74 24 04       	mov    0x4(%r12),%esi
  402359:	31 d2                	xor    %edx,%edx
  40235b:	48 89 c7             	mov    %rax,%rdi
  40235e:	48 03 b3 00 10 00 00 	add    0x1000(%rbx),%rsi
  402365:	e8 56 f8 ff ff       	call   401bc0 <fseeko@plt>
  40236a:	85 c0                	test   %eax,%eax
  40236c:	0f 88 9e 01 00 00    	js     402510 <dlerror@plt+0x880>
  402372:	41 80 7c 24 10 01    	cmpb   $0x1,0x10(%r12)
  402378:	0f 84 52 01 00 00    	je     4024d0 <dlerror@plt+0x840>
  40237e:	bf 00 20 00 00       	mov    $0x2000,%edi
  402383:	e8 48 f7 ff ff       	call   401ad0 <malloc@plt>
  402388:	48 85 c0             	test   %rax,%rax
  40238b:	49 89 c7             	mov    %rax,%r15
  40238e:	0f 84 2f 02 00 00    	je     4025c3 <dlerror@plt+0x933>
  402394:	41 8b 5c 24 0c       	mov    0xc(%r12),%ebx
  402399:	48 85 db             	test   %rbx,%rbx
  40239c:	75 2f                	jne    4023cd <dlerror@plt+0x73d>
  40239e:	e9 9d 01 00 00       	jmp    402540 <dlerror@plt+0x8b0>
  4023a3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4023a8:	4c 89 e9             	mov    %r13,%rcx
  4023ab:	ba 01 00 00 00       	mov    $0x1,%edx
  4023b0:	48 89 ee             	mov    %rbp,%rsi
  4023b3:	4c 89 ff             	mov    %r15,%rdi
  4023b6:	e8 75 f8 ff ff       	call   401c30 <fwrite@plt>
  4023bb:	48 85 c0             	test   %rax,%rax
  4023be:	0f 84 8c 01 00 00    	je     402550 <dlerror@plt+0x8c0>
  4023c4:	48 29 eb             	sub    %rbp,%rbx
  4023c7:	0f 84 73 01 00 00    	je     402540 <dlerror@plt+0x8b0>
  4023cd:	48 81 fb 00 20 00 00 	cmp    $0x2000,%rbx
  4023d4:	bd 00 20 00 00       	mov    $0x2000,%ebp
  4023d9:	4d 89 f0             	mov    %r14,%r8
  4023dc:	48 0f 46 eb          	cmovbe %rbx,%rbp
  4023e0:	b9 01 00 00 00       	mov    $0x1,%ecx
  4023e5:	be 00 20 00 00       	mov    $0x2000,%esi
  4023ea:	48 89 ea             	mov    %rbp,%rdx
  4023ed:	4c 89 ff             	mov    %r15,%rdi
  4023f0:	e8 9b f7 ff ff       	call   401b90 <__fread_chk@plt>
  4023f5:	48 85 c0             	test   %rax,%rax
  4023f8:	75 ae                	jne    4023a8 <dlerror@plt+0x718>
  4023fa:	e8 d1 f3 ff ff       	call   4017d0 <__errno_location@plt>
  4023ff:	8b 30                	mov    (%rax),%esi
  402401:	49 8d 4c 24 12       	lea    0x12(%r12),%rcx
  402406:	48 8d 15 83 83 00 00 	lea    0x8383(%rip),%rdx        # 40a790 <dlerror@plt+0x8b00>
  40240d:	48 8d 3d 36 81 00 00 	lea    0x8136(%rip),%rdi        # 40a54a <dlerror@plt+0x88ba>
  402414:	31 c0                	xor    %eax,%eax
  402416:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  40241b:	e8 90 21 00 00       	call   4045b0 <dlerror@plt+0x2920>
  402420:	4c 89 ff             	mov    %r15,%rdi
  402423:	e8 98 f3 ff ff       	call   4017c0 <free@plt>
  402428:	41 80 7c 24 11 62    	cmpb   $0x62,0x11(%r12)
  40242e:	4c 89 ef             	mov    %r13,%rdi
  402431:	0f 84 ba 00 00 00    	je     4024f1 <dlerror@plt+0x861>
  402437:	e8 54 f6 ff ff       	call   401a90 <fileno@plt>
  40243c:	be 80 01 00 00       	mov    $0x180,%esi
  402441:	89 c7                	mov    %eax,%edi
  402443:	e8 28 f7 ff ff       	call   401b70 <fchmod@plt>
  402448:	4c 89 f7             	mov    %r14,%rdi
  40244b:	e8 60 f4 ff ff       	call   4018b0 <fclose@plt>
  402450:	eb 6e                	jmp    4024c0 <dlerror@plt+0x830>
  402452:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402458:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
  40245d:	e8 0e fd ff ff       	call   402170 <dlerror@plt+0x4e0>
  402462:	48 85 c0             	test   %rax,%rax
  402465:	48 89 c5             	mov    %rax,%rbp
  402468:	0f 84 0d 01 00 00    	je     40257b <dlerror@plt+0x8eb>
  40246e:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  402473:	48 89 c7             	mov    %rax,%rdi
  402476:	48 89 d6             	mov    %rdx,%rsi
  402479:	e8 a2 3b 00 00       	call   406020 <dlerror@plt+0x4390>
  40247e:	48 89 ef             	mov    %rbp,%rdi
  402481:	89 c3                	mov    %eax,%ebx
  402483:	e8 38 f3 ff ff       	call   4017c0 <free@plt>
  402488:	85 db                	test   %ebx,%ebx
  40248a:	0f 88 f0 00 00 00    	js     402580 <dlerror@plt+0x8f0>
  402490:	48 83 c4 18          	add    $0x18,%rsp
  402494:	89 d8                	mov    %ebx,%eax
  402496:	5b                   	pop    %rbx
  402497:	5d                   	pop    %rbp
  402498:	41 5c                	pop    %r12
  40249a:	41 5d                	pop    %r13
  40249c:	41 5e                	pop    %r14
  40249e:	41 5f                	pop    %r15
  4024a0:	c3                   	ret
  4024a1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4024a8:	49 8d 74 24 12       	lea    0x12(%r12),%rsi
  4024ad:	48 8d 3d 1c 82 00 00 	lea    0x821c(%rip),%rdi        # 40a6d0 <dlerror@plt+0x8a40>
  4024b4:	31 c0                	xor    %eax,%eax
  4024b6:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  4024bb:	e8 30 20 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4024c0:	4c 89 ef             	mov    %r13,%rdi
  4024c3:	e8 e8 f3 ff ff       	call   4018b0 <fclose@plt>
  4024c8:	eb c6                	jmp    402490 <dlerror@plt+0x800>
  4024ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4024d0:	31 c9                	xor    %ecx,%ecx
  4024d2:	4c 89 f7             	mov    %r14,%rdi
  4024d5:	4c 89 ea             	mov    %r13,%rdx
  4024d8:	4c 89 e6             	mov    %r12,%rsi
  4024db:	e8 d0 f8 ff ff       	call   401db0 <dlerror@plt+0x120>
  4024e0:	41 80 7c 24 11 62    	cmpb   $0x62,0x11(%r12)
  4024e6:	89 c3                	mov    %eax,%ebx
  4024e8:	4c 89 ef             	mov    %r13,%rdi
  4024eb:	0f 85 46 ff ff ff    	jne    402437 <dlerror@plt+0x7a7>
  4024f1:	e8 9a f5 ff ff       	call   401a90 <fileno@plt>
  4024f6:	be c0 01 00 00       	mov    $0x1c0,%esi
  4024fb:	89 c7                	mov    %eax,%edi
  4024fd:	e8 6e f6 ff ff       	call   401b70 <fchmod@plt>
  402502:	e9 41 ff ff ff       	jmp    402448 <dlerror@plt+0x7b8>
  402507:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40250e:	00 00 
  402510:	e8 bb f2 ff ff       	call   4017d0 <__errno_location@plt>
  402515:	8b 30                	mov    (%rax),%esi
  402517:	49 8d 4c 24 12       	lea    0x12(%r12),%rcx
  40251c:	48 8d 15 e5 81 00 00 	lea    0x81e5(%rip),%rdx        # 40a708 <dlerror@plt+0x8a78>
  402523:	48 8d 3d 1a 80 00 00 	lea    0x801a(%rip),%rdi        # 40a544 <dlerror@plt+0x88b4>
  40252a:	31 c0                	xor    %eax,%eax
  40252c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  402531:	e8 7a 20 00 00       	call   4045b0 <dlerror@plt+0x2920>
  402536:	e9 0d ff ff ff       	jmp    402448 <dlerror@plt+0x7b8>
  40253b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402540:	31 db                	xor    %ebx,%ebx
  402542:	e9 d9 fe ff ff       	jmp    402420 <dlerror@plt+0x790>
  402547:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40254e:	00 00 
  402550:	e8 7b f2 ff ff       	call   4017d0 <__errno_location@plt>
  402555:	8b 30                	mov    (%rax),%esi
  402557:	49 8d 4c 24 12       	lea    0x12(%r12),%rcx
  40255c:	48 8d 15 05 83 00 00 	lea    0x8305(%rip),%rdx        # 40a868 <dlerror@plt+0x8bd8>
  402563:	48 8d 3d ef 7f 00 00 	lea    0x7fef(%rip),%rdi        # 40a559 <dlerror@plt+0x88c9>
  40256a:	31 c0                	xor    %eax,%eax
  40256c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  402571:	e8 3a 20 00 00       	call   4045b0 <dlerror@plt+0x2920>
  402576:	e9 a5 fe ff ff       	jmp    402420 <dlerror@plt+0x790>
  40257b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  402580:	49 8d 74 24 12       	lea    0x12(%r12),%rsi
  402585:	48 8d 3d 3c 82 00 00 	lea    0x823c(%rip),%rdi        # 40a7c8 <dlerror@plt+0x8b38>
  40258c:	31 c0                	xor    %eax,%eax
  40258e:	e8 5d 1f 00 00       	call   4044f0 <dlerror@plt+0x2860>
  402593:	e9 f8 fe ff ff       	jmp    402490 <dlerror@plt+0x800>
  402598:	e8 33 f2 ff ff       	call   4017d0 <__errno_location@plt>
  40259d:	8b 30                	mov    (%rax),%esi
  40259f:	49 8d 4c 24 12       	lea    0x12(%r12),%rcx
  4025a4:	48 8d 15 45 82 00 00 	lea    0x8245(%rip),%rdx        # 40a7f0 <dlerror@plt+0x8b60>
  4025ab:	48 8d 3d a1 7f 00 00 	lea    0x7fa1(%rip),%rdi        # 40a553 <dlerror@plt+0x88c3>
  4025b2:	31 c0                	xor    %eax,%eax
  4025b4:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  4025b9:	e8 f2 1f 00 00       	call   4045b0 <dlerror@plt+0x2920>
  4025be:	e9 cd fe ff ff       	jmp    402490 <dlerror@plt+0x800>
  4025c3:	e8 08 f2 ff ff       	call   4017d0 <__errno_location@plt>
  4025c8:	8b 30                	mov    (%rax),%esi
  4025ca:	49 8d 4c 24 12       	lea    0x12(%r12),%rcx
  4025cf:	48 8d 15 52 82 00 00 	lea    0x8252(%rip),%rdx        # 40a828 <dlerror@plt+0x8b98>
  4025d6:	48 8d 3d 5d 7f 00 00 	lea    0x7f5d(%rip),%rdi        # 40a53a <dlerror@plt+0x88aa>
  4025dd:	31 c0                	xor    %eax,%eax
  4025df:	83 cb ff             	or     $0xffffffff,%ebx
  4025e2:	e8 c9 1f 00 00       	call   4045b0 <dlerror@plt+0x2920>
  4025e7:	e9 3c fe ff ff       	jmp    402428 <dlerror@plt+0x798>
  4025ec:	0f 1f 40 00          	nopl   0x0(%rax)
  4025f0:	41 56                	push   %r14
  4025f2:	41 55                	push   %r13
  4025f4:	48 8d 35 46 7f 00 00 	lea    0x7f46(%rip),%rsi        # 40a541 <dlerror@plt+0x88b1>
  4025fb:	41 54                	push   %r12
  4025fd:	55                   	push   %rbp
  4025fe:	49 89 fc             	mov    %rdi,%r12
  402601:	53                   	push   %rbx
  402602:	48 83 ec 70          	sub    $0x70,%rsp
  402606:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40260d:	00 00 
  40260f:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  402614:	31 c0                	xor    %eax,%eax
  402616:	e8 b5 f5 ff ff       	call   401bd0 <fopen@plt>
  40261b:	48 85 c0             	test   %rax,%rax
  40261e:	0f 84 6c 02 00 00    	je     402890 <dlerror@plt+0xc00>
  402624:	48 89 c3             	mov    %rax,%rbx
  402627:	48 8b 05 da a1 00 00 	mov    0xa1da(%rip),%rax        # 40c808 <dlerror@plt+0xab78>
  40262e:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  402633:	ba 08 00 00 00       	mov    $0x8,%edx
  402638:	48 89 df             	mov    %rbx,%rdi
  40263b:	31 ed                	xor    %ebp,%ebp
  40263d:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
  402642:	48 c1 e8 18          	shr    $0x18,%rax
  402646:	83 c0 0c             	add    $0xc,%eax
  402649:	88 44 24 63          	mov    %al,0x63(%rsp)
  40264d:	e8 be 70 00 00       	call   409710 <dlerror@plt+0x7a80>
  402652:	48 85 c0             	test   %rax,%rax
  402655:	49 89 c5             	mov    %rax,%r13
  402658:	75 36                	jne    402690 <dlerror@plt+0xa00>
  40265a:	48 89 df             	mov    %rbx,%rdi
  40265d:	e8 4e f2 ff ff       	call   4018b0 <fclose@plt>
  402662:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
  402667:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  40266e:	00 00 
  402670:	48 89 e8             	mov    %rbp,%rax
  402673:	0f 85 ab 02 00 00    	jne    402924 <dlerror@plt+0xc94>
  402679:	48 83 c4 70          	add    $0x70,%rsp
  40267d:	5b                   	pop    %rbx
  40267e:	5d                   	pop    %rbp
  40267f:	41 5c                	pop    %r12
  402681:	41 5d                	pop    %r13
  402683:	41 5e                	pop    %r14
  402685:	c3                   	ret
  402686:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40268d:	00 00 00 
  402690:	31 d2                	xor    %edx,%edx
  402692:	48 89 c6             	mov    %rax,%rsi
  402695:	48 89 df             	mov    %rbx,%rdi
  402698:	e8 23 f5 ff ff       	call   401bc0 <fseeko@plt>
  40269d:	85 c0                	test   %eax,%eax
  40269f:	78 3f                	js     4026e0 <dlerror@plt+0xa50>
  4026a1:	49 89 e6             	mov    %rsp,%r14
  4026a4:	48 89 d9             	mov    %rbx,%rcx
  4026a7:	ba 01 00 00 00       	mov    $0x1,%edx
  4026ac:	be 58 00 00 00       	mov    $0x58,%esi
  4026b1:	4c 89 f7             	mov    %r14,%rdi
  4026b4:	e8 a7 f1 ff ff       	call   401860 <fread@plt>
  4026b9:	48 85 c0             	test   %rax,%rax
  4026bc:	75 4a                	jne    402708 <dlerror@plt+0xa78>
  4026be:	e8 0d f1 ff ff       	call   4017d0 <__errno_location@plt>
  4026c3:	8b 30                	mov    (%rax),%esi
  4026c5:	48 8d 15 94 7e 00 00 	lea    0x7e94(%rip),%rdx        # 40a560 <dlerror@plt+0x88d0>
  4026cc:	48 8d 3d 77 7e 00 00 	lea    0x7e77(%rip),%rdi        # 40a54a <dlerror@plt+0x88ba>
  4026d3:	31 c0                	xor    %eax,%eax
  4026d5:	e8 d6 1e 00 00       	call   4045b0 <dlerror@plt+0x2920>
  4026da:	e9 7b ff ff ff       	jmp    40265a <dlerror@plt+0x9ca>
  4026df:	90                   	nop
  4026e0:	e8 eb f0 ff ff       	call   4017d0 <__errno_location@plt>
  4026e5:	8b 30                	mov    (%rax),%esi
  4026e7:	48 8d 15 b2 81 00 00 	lea    0x81b2(%rip),%rdx        # 40a8a0 <dlerror@plt+0x8c10>
  4026ee:	48 8d 3d 4f 7e 00 00 	lea    0x7e4f(%rip),%rdi        # 40a544 <dlerror@plt+0x88b4>
  4026f5:	31 c0                	xor    %eax,%eax
  4026f7:	e8 b4 1e 00 00       	call   4045b0 <dlerror@plt+0x2920>
  4026fc:	e9 59 ff ff ff       	jmp    40265a <dlerror@plt+0x9ca>
  402701:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402708:	be 70 10 00 00       	mov    $0x1070,%esi
  40270d:	bf 01 00 00 00       	mov    $0x1,%edi
  402712:	e8 a9 f2 ff ff       	call   4019c0 <calloc@plt>
  402717:	48 85 c0             	test   %rax,%rax
  40271a:	48 89 c5             	mov    %rax,%rbp
  40271d:	0f 84 a5 01 00 00    	je     4028c8 <dlerror@plt+0xc38>
  402723:	48 8d 15 fd 81 00 00 	lea    0x81fd(%rip),%rdx        # 40a927 <dlerror@plt+0x8c97>
  40272a:	4c 89 e1             	mov    %r12,%rcx
  40272d:	48 89 c7             	mov    %rax,%rdi
  402730:	be 00 10 00 00       	mov    $0x1000,%esi
  402735:	31 c0                	xor    %eax,%eax
  402737:	e8 14 f2 ff ff       	call   401950 <snprintf@plt>
  40273c:	8b 44 24 08          	mov    0x8(%rsp),%eax
  402740:	49 8d 4e 18          	lea    0x18(%r14),%rcx
  402744:	48 8d bd 2c 10 00 00 	lea    0x102c(%rbp),%rdi
  40274b:	48 8d 15 d5 81 00 00 	lea    0x81d5(%rip),%rdx        # 40a927 <dlerror@plt+0x8c97>
  402752:	be 40 00 00 00       	mov    $0x40,%esi
  402757:	0f c8                	bswap  %eax
  402759:	89 44 24 08          	mov    %eax,0x8(%rsp)
  40275d:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  402761:	0f c8                	bswap  %eax
  402763:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  402767:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40276b:	0f c8                	bswap  %eax
  40276d:	89 44 24 10          	mov    %eax,0x10(%rsp)
  402771:	8b 44 24 14          	mov    0x14(%rsp),%eax
  402775:	0f c8                	bswap  %eax
  402777:	89 44 24 14          	mov    %eax,0x14(%rsp)
  40277b:	89 85 28 10 00 00    	mov    %eax,0x1028(%rbp)
  402781:	31 c0                	xor    %eax,%eax
  402783:	e8 c8 f1 ff ff       	call   401950 <snprintf@plt>
  402788:	8b 44 24 08          	mov    0x8(%rsp),%eax
  40278c:	8b 74 24 0c          	mov    0xc(%rsp),%esi
  402790:	31 d2                	xor    %edx,%edx
  402792:	48 89 df             	mov    %rbx,%rdi
  402795:	49 29 c5             	sub    %rax,%r13
  402798:	49 8d 45 58          	lea    0x58(%r13),%rax
  40279c:	48 01 c6             	add    %rax,%rsi
  40279f:	48 89 85 00 10 00 00 	mov    %rax,0x1000(%rbp)
  4027a6:	e8 15 f4 ff ff       	call   401bc0 <fseeko@plt>
  4027ab:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
  4027b0:	4c 89 e7             	mov    %r12,%rdi
  4027b3:	e8 18 f3 ff ff       	call   401ad0 <malloc@plt>
  4027b8:	48 85 c0             	test   %rax,%rax
  4027bb:	48 89 85 08 10 00 00 	mov    %rax,0x1008(%rbp)
  4027c2:	0f 84 28 01 00 00    	je     4028f0 <dlerror@plt+0xc60>
  4027c8:	48 89 d9             	mov    %rbx,%rcx
  4027cb:	ba 01 00 00 00       	mov    $0x1,%edx
  4027d0:	4c 89 e6             	mov    %r12,%rsi
  4027d3:	48 89 c7             	mov    %rax,%rdi
  4027d6:	e8 85 f0 ff ff       	call   401860 <fread@plt>
  4027db:	48 85 c0             	test   %rax,%rax
  4027de:	0f 84 bc 00 00 00    	je     4028a0 <dlerror@plt+0xc10>
  4027e4:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4027e8:	48 89 df             	mov    %rbx,%rdi
  4027eb:	48 03 85 08 10 00 00 	add    0x1008(%rbp),%rax
  4027f2:	48 89 85 10 10 00 00 	mov    %rax,0x1010(%rbp)
  4027f9:	e8 52 f0 ff ff       	call   401850 <ferror@plt>
  4027fe:	85 c0                	test   %eax,%eax
  402800:	0f 85 0b 01 00 00    	jne    402911 <dlerror@plt+0xc81>
  402806:	48 8b 85 08 10 00 00 	mov    0x1008(%rbp),%rax
  40280d:	48 8b b5 10 10 00 00 	mov    0x1010(%rbp),%rsi
  402814:	48 39 f0             	cmp    %rsi,%rax
  402817:	0f 83 3d fe ff ff    	jae    40265a <dlerror@plt+0x9ca>
  40281d:	0f b6 bd 18 10 00 00 	movzbl 0x1018(%rbp),%edi
  402824:	41 b9 01 00 00 00    	mov    $0x1,%r9d
  40282a:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  402830:	8b 48 04             	mov    0x4(%rax),%ecx
  402833:	44 0f b6 50 11       	movzbl 0x11(%rax),%r10d
  402838:	8b 10                	mov    (%rax),%edx
  40283a:	0f c9                	bswap  %ecx
  40283c:	89 48 04             	mov    %ecx,0x4(%rax)
  40283f:	8b 48 08             	mov    0x8(%rax),%ecx
  402842:	0f ca                	bswap  %edx
  402844:	89 10                	mov    %edx,(%rax)
  402846:	0f c9                	bswap  %ecx
  402848:	89 48 08             	mov    %ecx,0x8(%rax)
  40284b:	8b 48 0c             	mov    0xc(%rax),%ecx
  40284e:	0f c9                	bswap  %ecx
  402850:	89 48 0c             	mov    %ecx,0xc(%rax)
  402853:	41 8d 4a a6          	lea    -0x5a(%r10),%ecx
  402857:	80 f9 1e             	cmp    $0x1e,%cl
  40285a:	77 1e                	ja     40287a <dlerror@plt+0xbea>
  40285c:	4d 89 cb             	mov    %r9,%r11
  40285f:	49 d3 e3             	shl    %cl,%r11
  402862:	41 f7 c3 01 05 10 40 	test   $0x40100501,%r11d
  402869:	41 0f 45 f8          	cmovne %r8d,%edi
  40286d:	41 80 fa 6c          	cmp    $0x6c,%r10b
  402871:	75 07                	jne    40287a <dlerror@plt+0xbea>
  402873:	48 89 85 20 10 00 00 	mov    %rax,0x1020(%rbp)
  40287a:	89 d2                	mov    %edx,%edx
  40287c:	48 01 d0             	add    %rdx,%rax
  40287f:	48 39 f0             	cmp    %rsi,%rax
  402882:	72 ac                	jb     402830 <dlerror@plt+0xba0>
  402884:	40 88 bd 18 10 00 00 	mov    %dil,0x1018(%rbp)
  40288b:	e9 ca fd ff ff       	jmp    40265a <dlerror@plt+0x9ca>
  402890:	31 ed                	xor    %ebp,%ebp
  402892:	e9 cb fd ff ff       	jmp    402662 <dlerror@plt+0x9d2>
  402897:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40289e:	00 00 
  4028a0:	e8 2b ef ff ff       	call   4017d0 <__errno_location@plt>
  4028a5:	8b 30                	mov    (%rax),%esi
  4028a7:	48 8d 15 d1 7c 00 00 	lea    0x7cd1(%rip),%rdx        # 40a57f <dlerror@plt+0x88ef>
  4028ae:	48 8d 3d 95 7c 00 00 	lea    0x7c95(%rip),%rdi        # 40a54a <dlerror@plt+0x88ba>
  4028b5:	31 c0                	xor    %eax,%eax
  4028b7:	e8 f4 1c 00 00       	call   4045b0 <dlerror@plt+0x2920>
  4028bc:	e9 99 fd ff ff       	jmp    40265a <dlerror@plt+0x9ca>
  4028c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4028c8:	e8 03 ef ff ff       	call   4017d0 <__errno_location@plt>
  4028cd:	8b 30                	mov    (%rax),%esi
  4028cf:	48 8d 15 f2 7f 00 00 	lea    0x7ff2(%rip),%rdx        # 40a8c8 <dlerror@plt+0x8c38>
  4028d6:	48 8d 3d 9b 7c 00 00 	lea    0x7c9b(%rip),%rdi        # 40a578 <dlerror@plt+0x88e8>
  4028dd:	31 c0                	xor    %eax,%eax
  4028df:	e8 cc 1c 00 00       	call   4045b0 <dlerror@plt+0x2920>
  4028e4:	e9 71 fd ff ff       	jmp    40265a <dlerror@plt+0x9ca>
  4028e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4028f0:	e8 db ee ff ff       	call   4017d0 <__errno_location@plt>
  4028f5:	8b 30                	mov    (%rax),%esi
  4028f7:	48 8d 15 02 80 00 00 	lea    0x8002(%rip),%rdx        # 40a900 <dlerror@plt+0x8c70>
  4028fe:	48 8d 3d 35 7c 00 00 	lea    0x7c35(%rip),%rdi        # 40a53a <dlerror@plt+0x88aa>
  402905:	31 c0                	xor    %eax,%eax
  402907:	e8 a4 1c 00 00       	call   4045b0 <dlerror@plt+0x2920>
  40290c:	e9 49 fd ff ff       	jmp    40265a <dlerror@plt+0x9ca>
  402911:	48 8d 3d 81 7c 00 00 	lea    0x7c81(%rip),%rdi        # 40a599 <dlerror@plt+0x8909>
  402918:	31 c0                	xor    %eax,%eax
  40291a:	e8 d1 1b 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40291f:	e9 36 fd ff ff       	jmp    40265a <dlerror@plt+0x9ca>
  402924:	e8 d7 ef ff ff       	call   401900 <__stack_chk_fail@plt>
  402929:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402930:	53                   	push   %rbx
  402931:	48 8b 1f             	mov    (%rdi),%rbx
  402934:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
  40293b:	48 85 db             	test   %rbx,%rbx
  40293e:	74 18                	je     402958 <dlerror@plt+0xcc8>
  402940:	48 8b bb 08 10 00 00 	mov    0x1008(%rbx),%rdi
  402947:	e8 74 ee ff ff       	call   4017c0 <free@plt>
  40294c:	48 89 df             	mov    %rbx,%rdi
  40294f:	5b                   	pop    %rbx
  402950:	e9 6b ee ff ff       	jmp    4017c0 <free@plt>
  402955:	0f 1f 00             	nopl   (%rax)
  402958:	5b                   	pop    %rbx
  402959:	c3                   	ret
  40295a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402960:	41 54                	push   %r12
  402962:	55                   	push   %rbp
  402963:	53                   	push   %rbx
  402964:	48 8b 9f 08 10 00 00 	mov    0x1008(%rdi),%rbx
  40296b:	48 8b af 10 10 00 00 	mov    0x1010(%rdi),%rbp
  402972:	48 39 eb             	cmp    %rbp,%rbx
  402975:	73 31                	jae    4029a8 <dlerror@plt+0xd18>
  402977:	49 89 f4             	mov    %rsi,%r12
  40297a:	eb 0e                	jmp    40298a <dlerror@plt+0xcfa>
  40297c:	0f 1f 40 00          	nopl   0x0(%rax)
  402980:	8b 03                	mov    (%rbx),%eax
  402982:	48 01 c3             	add    %rax,%rbx
  402985:	48 39 eb             	cmp    %rbp,%rbx
  402988:	73 1e                	jae    4029a8 <dlerror@plt+0xd18>
  40298a:	48 8d 7b 12          	lea    0x12(%rbx),%rdi
  40298e:	4c 89 e6             	mov    %r12,%rsi
  402991:	e8 3a f0 ff ff       	call   4019d0 <strcmp@plt>
  402996:	85 c0                	test   %eax,%eax
  402998:	75 e6                	jne    402980 <dlerror@plt+0xcf0>
  40299a:	48 89 d8             	mov    %rbx,%rax
  40299d:	5b                   	pop    %rbx
  40299e:	5d                   	pop    %rbp
  40299f:	41 5c                	pop    %r12
  4029a1:	c3                   	ret
  4029a2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4029a8:	31 db                	xor    %ebx,%ebx
  4029aa:	48 89 d8             	mov    %rbx,%rax
  4029ad:	5b                   	pop    %rbx
  4029ae:	5d                   	pop    %rbp
  4029af:	41 5c                	pop    %r12
  4029b1:	c3                   	ret
  4029b2:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4029b9:	00 00 00 
  4029bc:	0f 1f 40 00          	nopl   0x0(%rax)
  4029c0:	41 55                	push   %r13
  4029c2:	41 54                	push   %r12
  4029c4:	4c 8d 05 59 7f 00 00 	lea    0x7f59(%rip),%r8        # 40a924 <dlerror@plt+0x8c94>
  4029cb:	55                   	push   %rbp
  4029cc:	53                   	push   %rbx
  4029cd:	49 89 f1             	mov    %rsi,%r9
  4029d0:	b9 00 10 00 00       	mov    $0x1000,%ecx
  4029d5:	49 89 fd             	mov    %rdi,%r13
  4029d8:	48 89 f5             	mov    %rsi,%rbp
  4029db:	48 81 ec 18 10 00 00 	sub    $0x1018,%rsp
  4029e2:	49 89 d4             	mov    %rdx,%r12
  4029e5:	be 00 10 00 00       	mov    $0x1000,%esi
  4029ea:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4029f1:	00 00 
  4029f3:	48 89 84 24 08 10 00 	mov    %rax,0x1008(%rsp)
  4029fa:	00 
  4029fb:	31 c0                	xor    %eax,%eax
  4029fd:	48 89 e3             	mov    %rsp,%rbx
  402a00:	48 83 ec 08          	sub    $0x8,%rsp
  402a04:	52                   	push   %rdx
  402a05:	48 89 df             	mov    %rbx,%rdi
  402a08:	ba 01 00 00 00       	mov    $0x1,%edx
  402a0d:	e8 8e ed ff ff       	call   4017a0 <__snprintf_chk@plt>
  402a12:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  402a17:	5a                   	pop    %rdx
  402a18:	59                   	pop    %rcx
  402a19:	7f 3d                	jg     402a58 <dlerror@plt+0xdc8>
  402a1b:	be 02 01 00 00       	mov    $0x102,%esi
  402a20:	48 89 df             	mov    %rbx,%rdi
  402a23:	e8 98 f0 ff ff       	call   401ac0 <dlopen@plt>
  402a28:	48 85 c0             	test   %rax,%rax
  402a2b:	49 89 45 00          	mov    %rax,0x0(%r13)
  402a2f:	74 47                	je     402a78 <dlerror@plt+0xde8>
  402a31:	31 c0                	xor    %eax,%eax
  402a33:	48 8b 8c 24 08 10 00 	mov    0x1008(%rsp),%rcx
  402a3a:	00 
  402a3b:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402a42:	00 00 
  402a44:	75 52                	jne    402a98 <dlerror@plt+0xe08>
  402a46:	48 81 c4 18 10 00 00 	add    $0x1018,%rsp
  402a4d:	5b                   	pop    %rbx
  402a4e:	5d                   	pop    %rbp
  402a4f:	41 5c                	pop    %r12
  402a51:	41 5d                	pop    %r13
  402a53:	c3                   	ret
  402a54:	0f 1f 40 00          	nopl   0x0(%rax)
  402a58:	48 8d 3d 71 82 00 00 	lea    0x8271(%rip),%rdi        # 40acd0 <dlerror@plt+0x9040>
  402a5f:	31 c0                	xor    %eax,%eax
  402a61:	b9 00 10 00 00       	mov    $0x1000,%ecx
  402a66:	4c 89 e2             	mov    %r12,%rdx
  402a69:	48 89 ee             	mov    %rbp,%rsi
  402a6c:	e8 7f 1a 00 00       	call   4044f0 <dlerror@plt+0x2860>
  402a71:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a76:	eb bb                	jmp    402a33 <dlerror@plt+0xda3>
  402a78:	e8 13 f2 ff ff       	call   401c90 <dlerror@plt>
  402a7d:	48 8d 3d 9c 82 00 00 	lea    0x829c(%rip),%rdi        # 40ad20 <dlerror@plt+0x9090>
  402a84:	48 89 c2             	mov    %rax,%rdx
  402a87:	48 89 de             	mov    %rbx,%rsi
  402a8a:	31 c0                	xor    %eax,%eax
  402a8c:	e8 5f 1a 00 00       	call   4044f0 <dlerror@plt+0x2860>
  402a91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a96:	eb 9b                	jmp    402a33 <dlerror@plt+0xda3>
  402a98:	e8 63 ee ff ff       	call   401900 <__stack_chk_fail@plt>
  402a9d:	0f 1f 00             	nopl   (%rax)
  402aa0:	53                   	push   %rbx
  402aa1:	48 8b 1f             	mov    (%rdi),%rbx
  402aa4:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
  402aab:	48 85 db             	test   %rbx,%rbx
  402aae:	74 20                	je     402ad0 <dlerror@plt+0xe40>
  402ab0:	48 8b 3b             	mov    (%rbx),%rdi
  402ab3:	48 85 ff             	test   %rdi,%rdi
  402ab6:	74 05                	je     402abd <dlerror@plt+0xe2d>
  402ab8:	e8 73 f0 ff ff       	call   401b30 <dlclose@plt>
  402abd:	48 89 df             	mov    %rbx,%rdi
  402ac0:	5b                   	pop    %rbx
  402ac1:	e9 fa ec ff ff       	jmp    4017c0 <free@plt>
  402ac6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  402acd:	00 00 00 
  402ad0:	5b                   	pop    %rbx
  402ad1:	c3                   	ret
  402ad2:	0f 1f 40 00          	nopl   0x0(%rax)
  402ad6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  402add:	00 00 00 
  402ae0:	41 55                	push   %r13
  402ae2:	41 54                	push   %r12
  402ae4:	49 89 f4             	mov    %rsi,%r12
  402ae7:	55                   	push   %rbp
  402ae8:	53                   	push   %rbx
  402ae9:	48 89 fd             	mov    %rdi,%rbp
  402aec:	be a8 01 00 00       	mov    $0x1a8,%esi
  402af1:	bf 01 00 00 00       	mov    $0x1,%edi
  402af6:	41 89 d5             	mov    %edx,%r13d
  402af9:	48 83 ec 18          	sub    $0x18,%rsp
  402afd:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402b04:	00 00 
  402b06:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  402b0b:	31 c0                	xor    %eax,%eax
  402b0d:	e8 ae ee ff ff       	call   4019c0 <calloc@plt>
  402b12:	48 85 c0             	test   %rax,%rax
  402b15:	48 89 c3             	mov    %rax,%rbx
  402b18:	48 89 04 24          	mov    %rax,(%rsp)
  402b1c:	0f 84 96 06 00 00    	je     4031b8 <dlerror@plt+0x1528>
  402b22:	44 89 68 08          	mov    %r13d,0x8(%rax)
  402b26:	4c 89 e2             	mov    %r12,%rdx
  402b29:	48 89 ee             	mov    %rbp,%rsi
  402b2c:	48 89 c7             	mov    %rax,%rdi
  402b2f:	e8 8c fe ff ff       	call   4029c0 <dlerror@plt+0xd30>
  402b34:	85 c0                	test   %eax,%eax
  402b36:	0f 85 44 05 00 00    	jne    403080 <dlerror@plt+0x13f0>
  402b3c:	48 8b 1c 24          	mov    (%rsp),%rbx
  402b40:	48 8d 35 e3 7d 00 00 	lea    0x7de3(%rip),%rsi        # 40a92a <dlerror@plt+0x8c9a>
  402b47:	48 8b 3b             	mov    (%rbx),%rdi
  402b4a:	e8 21 f1 ff ff       	call   401c70 <dlsym@plt>
  402b4f:	48 85 c0             	test   %rax,%rax
  402b52:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402b56:	0f 84 7d 06 00 00    	je     4031d9 <dlerror@plt+0x1549>
  402b5c:	48 8b 3b             	mov    (%rbx),%rdi
  402b5f:	48 8d 35 ce 7d 00 00 	lea    0x7dce(%rip),%rsi        # 40a934 <dlerror@plt+0x8ca4>
  402b66:	e8 05 f1 ff ff       	call   401c70 <dlsym@plt>
  402b6b:	48 85 c0             	test   %rax,%rax
  402b6e:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402b72:	0f 84 83 06 00 00    	je     4031fb <dlerror@plt+0x156b>
  402b78:	48 8b 3b             	mov    (%rbx),%rdi
  402b7b:	48 8d 35 c2 7d 00 00 	lea    0x7dc2(%rip),%rsi        # 40a944 <dlerror@plt+0x8cb4>
  402b82:	e8 e9 f0 ff ff       	call   401c70 <dlsym@plt>
  402b87:	48 85 c0             	test   %rax,%rax
  402b8a:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402b8e:	0f 84 89 06 00 00    	je     40321d <dlerror@plt+0x158d>
  402b94:	48 8b 3b             	mov    (%rbx),%rdi
  402b97:	48 8d 35 b2 7d 00 00 	lea    0x7db2(%rip),%rsi        # 40a950 <dlerror@plt+0x8cc0>
  402b9e:	e8 cd f0 ff ff       	call   401c70 <dlsym@plt>
  402ba3:	48 85 c0             	test   %rax,%rax
  402ba6:	48 89 43 40          	mov    %rax,0x40(%rbx)
  402baa:	0f 84 8f 06 00 00    	je     40323f <dlerror@plt+0x15af>
  402bb0:	48 8b 3b             	mov    (%rbx),%rdi
  402bb3:	48 8d 35 a7 7d 00 00 	lea    0x7da7(%rip),%rsi        # 40a961 <dlerror@plt+0x8cd1>
  402bba:	e8 b1 f0 ff ff       	call   401c70 <dlsym@plt>
  402bbf:	48 85 c0             	test   %rax,%rax
  402bc2:	48 89 43 48          	mov    %rax,0x48(%rbx)
  402bc6:	0f 84 95 06 00 00    	je     403261 <dlerror@plt+0x15d1>
  402bcc:	48 8b 3b             	mov    (%rbx),%rdi
  402bcf:	48 8d 35 9c 7d 00 00 	lea    0x7d9c(%rip),%rsi        # 40a972 <dlerror@plt+0x8ce2>
  402bd6:	e8 95 f0 ff ff       	call   401c70 <dlsym@plt>
  402bdb:	48 85 c0             	test   %rax,%rax
  402bde:	48 89 83 80 00 00 00 	mov    %rax,0x80(%rbx)
  402be5:	0f 95 43 0c          	setne  0xc(%rbx)
  402be9:	0f 84 c1 04 00 00    	je     4030b0 <dlerror@plt+0x1420>
  402bef:	48 8b 3b             	mov    (%rbx),%rdi
  402bf2:	48 8d 35 8d 7d 00 00 	lea    0x7d8d(%rip),%rsi        # 40a986 <dlerror@plt+0x8cf6>
  402bf9:	e8 72 f0 ff ff       	call   401c70 <dlsym@plt>
  402bfe:	48 85 c0             	test   %rax,%rax
  402c01:	48 89 83 88 00 00 00 	mov    %rax,0x88(%rbx)
  402c08:	0f 84 71 0a 00 00    	je     40367f <dlerror@plt+0x19ef>
  402c0e:	48 8b 3b             	mov    (%rbx),%rdi
  402c11:	48 8d 35 80 7d 00 00 	lea    0x7d80(%rip),%rsi        # 40a998 <dlerror@plt+0x8d08>
  402c18:	e8 53 f0 ff ff       	call   401c70 <dlsym@plt>
  402c1d:	48 85 c0             	test   %rax,%rax
  402c20:	48 89 83 90 00 00 00 	mov    %rax,0x90(%rbx)
  402c27:	0f 84 74 0a 00 00    	je     4036a1 <dlerror@plt+0x1a11>
  402c2d:	48 8b 3b             	mov    (%rbx),%rdi
  402c30:	48 8d 35 75 7d 00 00 	lea    0x7d75(%rip),%rsi        # 40a9ac <dlerror@plt+0x8d1c>
  402c37:	e8 34 f0 ff ff       	call   401c70 <dlsym@plt>
  402c3c:	48 85 c0             	test   %rax,%rax
  402c3f:	48 89 83 98 00 00 00 	mov    %rax,0x98(%rbx)
  402c46:	0f 84 77 0a 00 00    	je     4036c3 <dlerror@plt+0x1a33>
  402c4c:	48 8b 3b             	mov    (%rbx),%rdi
  402c4f:	48 8d 35 6a 7d 00 00 	lea    0x7d6a(%rip),%rsi        # 40a9c0 <dlerror@plt+0x8d30>
  402c56:	e8 15 f0 ff ff       	call   401c70 <dlsym@plt>
  402c5b:	48 85 c0             	test   %rax,%rax
  402c5e:	48 89 83 a0 00 00 00 	mov    %rax,0xa0(%rbx)
  402c65:	0f 84 8a 0b 00 00    	je     4037f5 <dlerror@plt+0x1b65>
  402c6b:	48 8b 3b             	mov    (%rbx),%rdi
  402c6e:	48 8d 35 63 7d 00 00 	lea    0x7d63(%rip),%rsi        # 40a9d8 <dlerror@plt+0x8d48>
  402c75:	e8 f6 ef ff ff       	call   401c70 <dlsym@plt>
  402c7a:	48 85 c0             	test   %rax,%rax
  402c7d:	48 89 83 a8 00 00 00 	mov    %rax,0xa8(%rbx)
  402c84:	0f 84 e3 0a 00 00    	je     40376d <dlerror@plt+0x1add>
  402c8a:	48 8b 3b             	mov    (%rbx),%rdi
  402c8d:	48 8d 35 5a 7d 00 00 	lea    0x7d5a(%rip),%rsi        # 40a9ee <dlerror@plt+0x8d5e>
  402c94:	e8 d7 ef ff ff       	call   401c70 <dlsym@plt>
  402c99:	48 85 c0             	test   %rax,%rax
  402c9c:	48 89 43 38          	mov    %rax,0x38(%rbx)
  402ca0:	0f 84 71 0b 00 00    	je     403817 <dlerror@plt+0x1b87>
  402ca6:	48 8b 3b             	mov    (%rbx),%rdi
  402ca9:	48 8d 35 08 7e 00 00 	lea    0x7e08(%rip),%rsi        # 40aab8 <dlerror@plt+0x8e28>
  402cb0:	e8 bb ef ff ff       	call   401c70 <dlsym@plt>
  402cb5:	48 85 c0             	test   %rax,%rax
  402cb8:	48 89 83 b0 00 00 00 	mov    %rax,0xb0(%rbx)
  402cbf:	0f 84 be 05 00 00    	je     403283 <dlerror@plt+0x15f3>
  402cc5:	48 8b 3b             	mov    (%rbx),%rdi
  402cc8:	48 8d 35 f5 7d 00 00 	lea    0x7df5(%rip),%rsi        # 40aac4 <dlerror@plt+0x8e34>
  402ccf:	e8 9c ef ff ff       	call   401c70 <dlsym@plt>
  402cd4:	48 85 c0             	test   %rax,%rax
  402cd7:	48 89 83 b8 00 00 00 	mov    %rax,0xb8(%rbx)
  402cde:	0f 84 e3 05 00 00    	je     4032c7 <dlerror@plt+0x1637>
  402ce4:	48 8b 3b             	mov    (%rbx),%rdi
  402ce7:	48 8d 35 e2 7d 00 00 	lea    0x7de2(%rip),%rsi        # 40aad0 <dlerror@plt+0x8e40>
  402cee:	e8 7d ef ff ff       	call   401c70 <dlsym@plt>
  402cf3:	48 85 c0             	test   %rax,%rax
  402cf6:	48 89 83 c0 00 00 00 	mov    %rax,0xc0(%rbx)
  402cfd:	0f 84 e6 05 00 00    	je     4032e9 <dlerror@plt+0x1659>
  402d03:	48 8b 3b             	mov    (%rbx),%rdi
  402d06:	48 8d 35 dc 7d 00 00 	lea    0x7ddc(%rip),%rsi        # 40aae9 <dlerror@plt+0x8e59>
  402d0d:	e8 5e ef ff ff       	call   401c70 <dlsym@plt>
  402d12:	48 85 c0             	test   %rax,%rax
  402d15:	48 89 83 c8 00 00 00 	mov    %rax,0xc8(%rbx)
  402d1c:	0f 84 83 05 00 00    	je     4032a5 <dlerror@plt+0x1615>
  402d22:	48 8b 3b             	mov    (%rbx),%rdi
  402d25:	48 8d 35 cc 7d 00 00 	lea    0x7dcc(%rip),%rsi        # 40aaf8 <dlerror@plt+0x8e68>
  402d2c:	e8 3f ef ff ff       	call   401c70 <dlsym@plt>
  402d31:	48 85 c0             	test   %rax,%rax
  402d34:	48 89 83 d0 00 00 00 	mov    %rax,0xd0(%rbx)
  402d3b:	0f 84 ca 05 00 00    	je     40330b <dlerror@plt+0x167b>
  402d41:	48 8b 3b             	mov    (%rbx),%rdi
  402d44:	48 8d 35 b9 7d 00 00 	lea    0x7db9(%rip),%rsi        # 40ab04 <dlerror@plt+0x8e74>
  402d4b:	e8 20 ef ff ff       	call   401c70 <dlsym@plt>
  402d50:	48 85 c0             	test   %rax,%rax
  402d53:	48 89 83 d8 00 00 00 	mov    %rax,0xd8(%rbx)
  402d5a:	0f 84 ef 05 00 00    	je     40334f <dlerror@plt+0x16bf>
  402d60:	48 8b 3b             	mov    (%rbx),%rdi
  402d63:	48 8d 35 a8 7d 00 00 	lea    0x7da8(%rip),%rsi        # 40ab12 <dlerror@plt+0x8e82>
  402d6a:	e8 01 ef ff ff       	call   401c70 <dlsym@plt>
  402d6f:	48 85 c0             	test   %rax,%rax
  402d72:	48 89 83 e0 00 00 00 	mov    %rax,0xe0(%rbx)
  402d79:	0f 84 f2 05 00 00    	je     403371 <dlerror@plt+0x16e1>
  402d7f:	48 8b 3b             	mov    (%rbx),%rdi
  402d82:	48 8d 35 99 7d 00 00 	lea    0x7d99(%rip),%rsi        # 40ab22 <dlerror@plt+0x8e92>
  402d89:	e8 e2 ee ff ff       	call   401c70 <dlsym@plt>
  402d8e:	48 85 c0             	test   %rax,%rax
  402d91:	48 89 83 e8 00 00 00 	mov    %rax,0xe8(%rbx)
  402d98:	0f 84 8f 05 00 00    	je     40332d <dlerror@plt+0x169d>
  402d9e:	48 8b 3b             	mov    (%rbx),%rdi
  402da1:	48 8d 35 8d 7d 00 00 	lea    0x7d8d(%rip),%rsi        # 40ab35 <dlerror@plt+0x8ea5>
  402da8:	e8 c3 ee ff ff       	call   401c70 <dlsym@plt>
  402dad:	48 85 c0             	test   %rax,%rax
  402db0:	48 89 83 f0 00 00 00 	mov    %rax,0xf0(%rbx)
  402db7:	0f 84 d6 05 00 00    	je     403393 <dlerror@plt+0x1703>
  402dbd:	48 8b 3b             	mov    (%rbx),%rdi
  402dc0:	48 8d 35 86 7d 00 00 	lea    0x7d86(%rip),%rsi        # 40ab4d <dlerror@plt+0x8ebd>
  402dc7:	e8 a4 ee ff ff       	call   401c70 <dlsym@plt>
  402dcc:	48 85 c0             	test   %rax,%rax
  402dcf:	48 89 83 f8 00 00 00 	mov    %rax,0xf8(%rbx)
  402dd6:	0f 84 d9 05 00 00    	je     4033b5 <dlerror@plt+0x1725>
  402ddc:	48 8b 3b             	mov    (%rbx),%rdi
  402ddf:	48 8d 35 7d 7d 00 00 	lea    0x7d7d(%rip),%rsi        # 40ab63 <dlerror@plt+0x8ed3>
  402de6:	e8 85 ee ff ff       	call   401c70 <dlsym@plt>
  402deb:	48 85 c0             	test   %rax,%rax
  402dee:	48 89 83 00 01 00 00 	mov    %rax,0x100(%rbx)
  402df5:	0f 84 dc 05 00 00    	je     4033d7 <dlerror@plt+0x1747>
  402dfb:	48 8b 3b             	mov    (%rbx),%rdi
  402dfe:	48 8d 35 c3 7f 00 00 	lea    0x7fc3(%rip),%rsi        # 40adc8 <dlerror@plt+0x9138>
  402e05:	e8 66 ee ff ff       	call   401c70 <dlsym@plt>
  402e0a:	48 85 c0             	test   %rax,%rax
  402e0d:	48 89 83 08 01 00 00 	mov    %rax,0x108(%rbx)
  402e14:	0f 84 23 06 00 00    	je     40343d <dlerror@plt+0x17ad>
  402e1a:	48 8b 3b             	mov    (%rbx),%rdi
  402e1d:	48 8d 35 4d 7d 00 00 	lea    0x7d4d(%rip),%rsi        # 40ab71 <dlerror@plt+0x8ee1>
  402e24:	e8 47 ee ff ff       	call   401c70 <dlsym@plt>
  402e29:	48 85 c0             	test   %rax,%rax
  402e2c:	48 89 83 10 01 00 00 	mov    %rax,0x110(%rbx)
  402e33:	0f 84 c0 05 00 00    	je     4033f9 <dlerror@plt+0x1769>
  402e39:	48 8b 3b             	mov    (%rbx),%rdi
  402e3c:	48 8d 35 3c 7d 00 00 	lea    0x7d3c(%rip),%rsi        # 40ab7f <dlerror@plt+0x8eef>
  402e43:	e8 28 ee ff ff       	call   401c70 <dlsym@plt>
  402e48:	48 85 c0             	test   %rax,%rax
  402e4b:	48 89 83 18 01 00 00 	mov    %rax,0x118(%rbx)
  402e52:	0f 84 c3 05 00 00    	je     40341b <dlerror@plt+0x178b>
  402e58:	48 8b 3b             	mov    (%rbx),%rdi
  402e5b:	48 8d 35 2e 7d 00 00 	lea    0x7d2e(%rip),%rsi        # 40ab90 <dlerror@plt+0x8f00>
  402e62:	e8 09 ee ff ff       	call   401c70 <dlsym@plt>
  402e67:	48 85 c0             	test   %rax,%rax
  402e6a:	48 89 83 20 01 00 00 	mov    %rax,0x120(%rbx)
  402e71:	0f 84 e8 05 00 00    	je     40345f <dlerror@plt+0x17cf>
  402e77:	48 8b 3b             	mov    (%rbx),%rdi
  402e7a:	48 8d 35 25 7d 00 00 	lea    0x7d25(%rip),%rsi        # 40aba6 <dlerror@plt+0x8f16>
  402e81:	e8 ea ed ff ff       	call   401c70 <dlsym@plt>
  402e86:	48 85 c0             	test   %rax,%rax
  402e89:	48 89 83 28 01 00 00 	mov    %rax,0x128(%rbx)
  402e90:	0f 84 2f 06 00 00    	je     4034c5 <dlerror@plt+0x1835>
  402e96:	48 8b 3b             	mov    (%rbx),%rdi
  402e99:	48 8d 35 23 7d 00 00 	lea    0x7d23(%rip),%rsi        # 40abc3 <dlerror@plt+0x8f33>
  402ea0:	e8 cb ed ff ff       	call   401c70 <dlsym@plt>
  402ea5:	48 85 c0             	test   %rax,%rax
  402ea8:	48 89 83 30 01 00 00 	mov    %rax,0x130(%rbx)
  402eaf:	0f 84 cc 05 00 00    	je     403481 <dlerror@plt+0x17f1>
  402eb5:	48 8b 3b             	mov    (%rbx),%rdi
  402eb8:	48 8d 35 1b 7d 00 00 	lea    0x7d1b(%rip),%rsi        # 40abda <dlerror@plt+0x8f4a>
  402ebf:	e8 ac ed ff ff       	call   401c70 <dlsym@plt>
  402ec4:	48 85 c0             	test   %rax,%rax
  402ec7:	48 89 83 38 01 00 00 	mov    %rax,0x138(%rbx)
  402ece:	0f 84 cf 05 00 00    	je     4034a3 <dlerror@plt+0x1813>
  402ed4:	48 8b 3b             	mov    (%rbx),%rdi
  402ed7:	48 8d 35 13 7d 00 00 	lea    0x7d13(%rip),%rsi        # 40abf1 <dlerror@plt+0x8f61>
  402ede:	e8 8d ed ff ff       	call   401c70 <dlsym@plt>
  402ee3:	48 85 c0             	test   %rax,%rax
  402ee6:	48 89 83 40 01 00 00 	mov    %rax,0x140(%rbx)
  402eed:	0f 84 f4 05 00 00    	je     4034e7 <dlerror@plt+0x1857>
  402ef3:	48 8b 3b             	mov    (%rbx),%rdi
  402ef6:	48 8d 35 eb 7e 00 00 	lea    0x7eeb(%rip),%rsi        # 40ade8 <dlerror@plt+0x9158>
  402efd:	e8 6e ed ff ff       	call   401c70 <dlsym@plt>
  402f02:	48 85 c0             	test   %rax,%rax
  402f05:	48 89 83 48 01 00 00 	mov    %rax,0x148(%rbx)
  402f0c:	0f 84 f7 05 00 00    	je     403509 <dlerror@plt+0x1879>
  402f12:	48 8b 3b             	mov    (%rbx),%rdi
  402f15:	48 8d 35 e2 7c 00 00 	lea    0x7ce2(%rip),%rsi        # 40abfe <dlerror@plt+0x8f6e>
  402f1c:	e8 4f ed ff ff       	call   401c70 <dlsym@plt>
  402f21:	48 85 c0             	test   %rax,%rax
  402f24:	48 89 83 50 01 00 00 	mov    %rax,0x150(%rbx)
  402f2b:	0f 84 fa 05 00 00    	je     40352b <dlerror@plt+0x189b>
  402f31:	48 8b 3b             	mov    (%rbx),%rdi
  402f34:	48 8d 35 db 7c 00 00 	lea    0x7cdb(%rip),%rsi        # 40ac16 <dlerror@plt+0x8f86>
  402f3b:	e8 30 ed ff ff       	call   401c70 <dlsym@plt>
  402f40:	48 85 c0             	test   %rax,%rax
  402f43:	48 89 83 58 01 00 00 	mov    %rax,0x158(%rbx)
  402f4a:	0f 84 41 06 00 00    	je     403591 <dlerror@plt+0x1901>
  402f50:	48 8b 3b             	mov    (%rbx),%rdi
  402f53:	48 8d 35 cf 7c 00 00 	lea    0x7ccf(%rip),%rsi        # 40ac29 <dlerror@plt+0x8f99>
  402f5a:	e8 11 ed ff ff       	call   401c70 <dlsym@plt>
  402f5f:	48 85 c0             	test   %rax,%rax
  402f62:	48 89 83 60 01 00 00 	mov    %rax,0x160(%rbx)
  402f69:	0f 84 44 06 00 00    	je     4035b3 <dlerror@plt+0x1923>
  402f6f:	48 8b 3b             	mov    (%rbx),%rdi
  402f72:	48 8d 35 c0 7c 00 00 	lea    0x7cc0(%rip),%rsi        # 40ac39 <dlerror@plt+0x8fa9>
  402f79:	e8 f2 ec ff ff       	call   401c70 <dlsym@plt>
  402f7e:	48 85 c0             	test   %rax,%rax
  402f81:	48 89 83 68 01 00 00 	mov    %rax,0x168(%rbx)
  402f88:	0f 84 bf 05 00 00    	je     40354d <dlerror@plt+0x18bd>
  402f8e:	48 8b 3b             	mov    (%rbx),%rdi
  402f91:	48 8d 35 b1 7c 00 00 	lea    0x7cb1(%rip),%rsi        # 40ac49 <dlerror@plt+0x8fb9>
  402f98:	e8 d3 ec ff ff       	call   401c70 <dlsym@plt>
  402f9d:	48 85 c0             	test   %rax,%rax
  402fa0:	48 89 83 70 01 00 00 	mov    %rax,0x170(%rbx)
  402fa7:	0f 84 c2 05 00 00    	je     40356f <dlerror@plt+0x18df>
  402fad:	48 8b 3b             	mov    (%rbx),%rdi
  402fb0:	48 8d 35 a3 7c 00 00 	lea    0x7ca3(%rip),%rsi        # 40ac5a <dlerror@plt+0x8fca>
  402fb7:	e8 b4 ec ff ff       	call   401c70 <dlsym@plt>
  402fbc:	48 85 c0             	test   %rax,%rax
  402fbf:	48 89 83 78 01 00 00 	mov    %rax,0x178(%rbx)
  402fc6:	0f 84 4d 06 00 00    	je     403619 <dlerror@plt+0x1989>
  402fcc:	48 8b 3b             	mov    (%rbx),%rdi
  402fcf:	48 8d 35 95 7c 00 00 	lea    0x7c95(%rip),%rsi        # 40ac6b <dlerror@plt+0x8fdb>
  402fd6:	e8 95 ec ff ff       	call   401c70 <dlsym@plt>
  402fdb:	48 85 c0             	test   %rax,%rax
  402fde:	48 89 83 80 01 00 00 	mov    %rax,0x180(%rbx)
  402fe5:	0f 84 50 06 00 00    	je     40363b <dlerror@plt+0x19ab>
  402feb:	48 8b 3b             	mov    (%rbx),%rdi
  402fee:	48 8d 35 90 7c 00 00 	lea    0x7c90(%rip),%rsi        # 40ac85 <dlerror@plt+0x8ff5>
  402ff5:	e8 76 ec ff ff       	call   401c70 <dlsym@plt>
  402ffa:	48 85 c0             	test   %rax,%rax
  402ffd:	48 89 83 88 01 00 00 	mov    %rax,0x188(%rbx)
  403004:	0f 84 cb 05 00 00    	je     4035d5 <dlerror@plt+0x1945>
  40300a:	48 8b 3b             	mov    (%rbx),%rdi
  40300d:	48 8d 35 86 7c 00 00 	lea    0x7c86(%rip),%rsi        # 40ac9a <dlerror@plt+0x900a>
  403014:	e8 57 ec ff ff       	call   401c70 <dlsym@plt>
  403019:	48 85 c0             	test   %rax,%rax
  40301c:	48 89 83 90 01 00 00 	mov    %rax,0x190(%rbx)
  403023:	0f 84 ce 05 00 00    	je     4035f7 <dlerror@plt+0x1967>
  403029:	48 8b 3b             	mov    (%rbx),%rdi
  40302c:	48 8d 35 7c 7c 00 00 	lea    0x7c7c(%rip),%rsi        # 40acaf <dlerror@plt+0x901f>
  403033:	e8 38 ec ff ff       	call   401c70 <dlsym@plt>
  403038:	48 85 c0             	test   %rax,%rax
  40303b:	48 89 83 98 01 00 00 	mov    %rax,0x198(%rbx)
  403042:	0f 84 15 06 00 00    	je     40365d <dlerror@plt+0x19cd>
  403048:	48 8b 3b             	mov    (%rbx),%rdi
  40304b:	48 8d 35 6c 7c 00 00 	lea    0x7c6c(%rip),%rsi        # 40acbe <dlerror@plt+0x902e>
  403052:	e8 19 ec ff ff       	call   401c70 <dlsym@plt>
  403057:	48 85 c0             	test   %rax,%rax
  40305a:	48 89 83 a0 01 00 00 	mov    %rax,0x1a0(%rbx)
  403061:	75 25                	jne    403088 <dlerror@plt+0x13f8>
  403063:	e8 28 ec ff ff       	call   401c90 <dlerror@plt>
  403068:	48 8d 35 4f 7c 00 00 	lea    0x7c4f(%rip),%rsi        # 40acbe <dlerror@plt+0x902e>
  40306f:	48 8d 3d 12 7d 00 00 	lea    0x7d12(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403076:	48 89 c2             	mov    %rax,%rdx
  403079:	31 c0                	xor    %eax,%eax
  40307b:	e8 70 14 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403080:	48 89 e7             	mov    %rsp,%rdi
  403083:	e8 18 fa ff ff       	call   402aa0 <dlerror@plt+0xe10>
  403088:	48 8b 1c 24          	mov    (%rsp),%rbx
  40308c:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  403091:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  403098:	00 00 
  40309a:	48 89 d8             	mov    %rbx,%rax
  40309d:	0f 85 96 07 00 00    	jne    403839 <dlerror@plt+0x1ba9>
  4030a3:	48 83 c4 18          	add    $0x18,%rsp
  4030a7:	5b                   	pop    %rbx
  4030a8:	5d                   	pop    %rbp
  4030a9:	41 5c                	pop    %r12
  4030ab:	41 5d                	pop    %r13
  4030ad:	c3                   	ret
  4030ae:	66 90                	xchg   %ax,%ax
  4030b0:	48 8b 3b             	mov    (%rbx),%rdi
  4030b3:	48 8d 35 50 79 00 00 	lea    0x7950(%rip),%rsi        # 40aa0a <dlerror@plt+0x8d7a>
  4030ba:	e8 b1 eb ff ff       	call   401c70 <dlsym@plt>
  4030bf:	48 85 c0             	test   %rax,%rax
  4030c2:	48 89 43 50          	mov    %rax,0x50(%rbx)
  4030c6:	0f 84 19 06 00 00    	je     4036e5 <dlerror@plt+0x1a55>
  4030cc:	48 8b 3b             	mov    (%rbx),%rdi
  4030cf:	48 8d 35 43 79 00 00 	lea    0x7943(%rip),%rsi        # 40aa19 <dlerror@plt+0x8d89>
  4030d6:	e8 95 eb ff ff       	call   401c70 <dlsym@plt>
  4030db:	48 85 c0             	test   %rax,%rax
  4030de:	48 89 43 58          	mov    %rax,0x58(%rbx)
  4030e2:	0f 84 1f 06 00 00    	je     403707 <dlerror@plt+0x1a77>
  4030e8:	48 8b 3b             	mov    (%rbx),%rdi
  4030eb:	48 8d 35 43 79 00 00 	lea    0x7943(%rip),%rsi        # 40aa35 <dlerror@plt+0x8da5>
  4030f2:	e8 79 eb ff ff       	call   401c70 <dlsym@plt>
  4030f7:	48 85 c0             	test   %rax,%rax
  4030fa:	48 89 43 60          	mov    %rax,0x60(%rbx)
  4030fe:	0f 84 25 06 00 00    	je     403729 <dlerror@plt+0x1a99>
  403104:	48 8b 3b             	mov    (%rbx),%rdi
  403107:	48 8d 35 35 79 00 00 	lea    0x7935(%rip),%rsi        # 40aa43 <dlerror@plt+0x8db3>
  40310e:	e8 5d eb ff ff       	call   401c70 <dlsym@plt>
  403113:	48 85 c0             	test   %rax,%rax
  403116:	48 89 43 68          	mov    %rax,0x68(%rbx)
  40311a:	0f 84 b3 06 00 00    	je     4037d3 <dlerror@plt+0x1b43>
  403120:	48 8b 3b             	mov    (%rbx),%rdi
  403123:	48 8d 35 31 79 00 00 	lea    0x7931(%rip),%rsi        # 40aa5b <dlerror@plt+0x8dcb>
  40312a:	e8 41 eb ff ff       	call   401c70 <dlsym@plt>
  40312f:	48 85 c0             	test   %rax,%rax
  403132:	48 89 43 70          	mov    %rax,0x70(%rbx)
  403136:	0f 84 0f 06 00 00    	je     40374b <dlerror@plt+0x1abb>
  40313c:	48 8b 3b             	mov    (%rbx),%rdi
  40313f:	48 8d 35 28 79 00 00 	lea    0x7928(%rip),%rsi        # 40aa6e <dlerror@plt+0x8dde>
  403146:	e8 25 eb ff ff       	call   401c70 <dlsym@plt>
  40314b:	48 85 c0             	test   %rax,%rax
  40314e:	48 89 43 78          	mov    %rax,0x78(%rbx)
  403152:	0f 84 37 06 00 00    	je     40378f <dlerror@plt+0x1aff>
  403158:	48 8b 3b             	mov    (%rbx),%rdi
  40315b:	48 8d 35 27 79 00 00 	lea    0x7927(%rip),%rsi        # 40aa89 <dlerror@plt+0x8df9>
  403162:	e8 09 eb ff ff       	call   401c70 <dlsym@plt>
  403167:	48 85 c0             	test   %rax,%rax
  40316a:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40316e:	0f 84 3d 06 00 00    	je     4037b1 <dlerror@plt+0x1b21>
  403174:	48 8b 3b             	mov    (%rbx),%rdi
  403177:	48 8d 35 23 79 00 00 	lea    0x7923(%rip),%rsi        # 40aaa1 <dlerror@plt+0x8e11>
  40317e:	e8 ed ea ff ff       	call   401c70 <dlsym@plt>
  403183:	48 85 c0             	test   %rax,%rax
  403186:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40318a:	0f 85 16 fb ff ff    	jne    402ca6 <dlerror@plt+0x1016>
  403190:	e8 fb ea ff ff       	call   401c90 <dlerror@plt>
  403195:	48 8d 35 05 79 00 00 	lea    0x7905(%rip),%rsi        # 40aaa1 <dlerror@plt+0x8e11>
  40319c:	48 8d 3d e5 7b 00 00 	lea    0x7be5(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4031a3:	48 89 c2             	mov    %rax,%rdx
  4031a6:	31 c0                	xor    %eax,%eax
  4031a8:	e8 43 13 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4031ad:	e9 ce fe ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4031b2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4031b8:	e8 13 e6 ff ff       	call   4017d0 <__errno_location@plt>
  4031bd:	8b 30                	mov    (%rax),%esi
  4031bf:	48 8d 15 8a 7b 00 00 	lea    0x7b8a(%rip),%rdx        # 40ad50 <dlerror@plt+0x90c0>
  4031c6:	48 8d 3d ab 73 00 00 	lea    0x73ab(%rip),%rdi        # 40a578 <dlerror@plt+0x88e8>
  4031cd:	31 c0                	xor    %eax,%eax
  4031cf:	e8 dc 13 00 00       	call   4045b0 <dlerror@plt+0x2920>
  4031d4:	e9 b3 fe ff ff       	jmp    40308c <dlerror@plt+0x13fc>
  4031d9:	e8 b2 ea ff ff       	call   401c90 <dlerror@plt>
  4031de:	48 8d 35 45 77 00 00 	lea    0x7745(%rip),%rsi        # 40a92a <dlerror@plt+0x8c9a>
  4031e5:	48 8d 3d 9c 7b 00 00 	lea    0x7b9c(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4031ec:	48 89 c2             	mov    %rax,%rdx
  4031ef:	31 c0                	xor    %eax,%eax
  4031f1:	e8 fa 12 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4031f6:	e9 85 fe ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4031fb:	e8 90 ea ff ff       	call   401c90 <dlerror@plt>
  403200:	48 8d 35 2d 77 00 00 	lea    0x772d(%rip),%rsi        # 40a934 <dlerror@plt+0x8ca4>
  403207:	48 8d 3d 7a 7b 00 00 	lea    0x7b7a(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  40320e:	48 89 c2             	mov    %rax,%rdx
  403211:	31 c0                	xor    %eax,%eax
  403213:	e8 d8 12 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403218:	e9 63 fe ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40321d:	e8 6e ea ff ff       	call   401c90 <dlerror@plt>
  403222:	48 8d 35 1b 77 00 00 	lea    0x771b(%rip),%rsi        # 40a944 <dlerror@plt+0x8cb4>
  403229:	48 8d 3d 58 7b 00 00 	lea    0x7b58(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403230:	48 89 c2             	mov    %rax,%rdx
  403233:	31 c0                	xor    %eax,%eax
  403235:	e8 b6 12 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40323a:	e9 41 fe ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40323f:	e8 4c ea ff ff       	call   401c90 <dlerror@plt>
  403244:	48 8d 35 05 77 00 00 	lea    0x7705(%rip),%rsi        # 40a950 <dlerror@plt+0x8cc0>
  40324b:	48 8d 3d 36 7b 00 00 	lea    0x7b36(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403252:	48 89 c2             	mov    %rax,%rdx
  403255:	31 c0                	xor    %eax,%eax
  403257:	e8 94 12 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40325c:	e9 1f fe ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  403261:	e8 2a ea ff ff       	call   401c90 <dlerror@plt>
  403266:	48 8d 35 f4 76 00 00 	lea    0x76f4(%rip),%rsi        # 40a961 <dlerror@plt+0x8cd1>
  40326d:	48 8d 3d 14 7b 00 00 	lea    0x7b14(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403274:	48 89 c2             	mov    %rax,%rdx
  403277:	31 c0                	xor    %eax,%eax
  403279:	e8 72 12 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40327e:	e9 fd fd ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  403283:	e8 08 ea ff ff       	call   401c90 <dlerror@plt>
  403288:	48 8d 35 29 78 00 00 	lea    0x7829(%rip),%rsi        # 40aab8 <dlerror@plt+0x8e28>
  40328f:	48 8d 3d f2 7a 00 00 	lea    0x7af2(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403296:	48 89 c2             	mov    %rax,%rdx
  403299:	31 c0                	xor    %eax,%eax
  40329b:	e8 50 12 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4032a0:	e9 db fd ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4032a5:	e8 e6 e9 ff ff       	call   401c90 <dlerror@plt>
  4032aa:	48 8d 35 38 78 00 00 	lea    0x7838(%rip),%rsi        # 40aae9 <dlerror@plt+0x8e59>
  4032b1:	48 8d 3d d0 7a 00 00 	lea    0x7ad0(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4032b8:	48 89 c2             	mov    %rax,%rdx
  4032bb:	31 c0                	xor    %eax,%eax
  4032bd:	e8 2e 12 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4032c2:	e9 b9 fd ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4032c7:	e8 c4 e9 ff ff       	call   401c90 <dlerror@plt>
  4032cc:	48 8d 35 f1 77 00 00 	lea    0x77f1(%rip),%rsi        # 40aac4 <dlerror@plt+0x8e34>
  4032d3:	48 8d 3d ae 7a 00 00 	lea    0x7aae(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4032da:	48 89 c2             	mov    %rax,%rdx
  4032dd:	31 c0                	xor    %eax,%eax
  4032df:	e8 0c 12 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4032e4:	e9 97 fd ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4032e9:	e8 a2 e9 ff ff       	call   401c90 <dlerror@plt>
  4032ee:	48 8d 35 db 77 00 00 	lea    0x77db(%rip),%rsi        # 40aad0 <dlerror@plt+0x8e40>
  4032f5:	48 8d 3d 8c 7a 00 00 	lea    0x7a8c(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4032fc:	48 89 c2             	mov    %rax,%rdx
  4032ff:	31 c0                	xor    %eax,%eax
  403301:	e8 ea 11 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403306:	e9 75 fd ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40330b:	e8 80 e9 ff ff       	call   401c90 <dlerror@plt>
  403310:	48 8d 35 e1 77 00 00 	lea    0x77e1(%rip),%rsi        # 40aaf8 <dlerror@plt+0x8e68>
  403317:	48 8d 3d 6a 7a 00 00 	lea    0x7a6a(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  40331e:	48 89 c2             	mov    %rax,%rdx
  403321:	31 c0                	xor    %eax,%eax
  403323:	e8 c8 11 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403328:	e9 53 fd ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40332d:	e8 5e e9 ff ff       	call   401c90 <dlerror@plt>
  403332:	48 8d 35 e9 77 00 00 	lea    0x77e9(%rip),%rsi        # 40ab22 <dlerror@plt+0x8e92>
  403339:	48 8d 3d 48 7a 00 00 	lea    0x7a48(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403340:	48 89 c2             	mov    %rax,%rdx
  403343:	31 c0                	xor    %eax,%eax
  403345:	e8 a6 11 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40334a:	e9 31 fd ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40334f:	e8 3c e9 ff ff       	call   401c90 <dlerror@plt>
  403354:	48 8d 35 a9 77 00 00 	lea    0x77a9(%rip),%rsi        # 40ab04 <dlerror@plt+0x8e74>
  40335b:	48 8d 3d 26 7a 00 00 	lea    0x7a26(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403362:	48 89 c2             	mov    %rax,%rdx
  403365:	31 c0                	xor    %eax,%eax
  403367:	e8 84 11 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40336c:	e9 0f fd ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  403371:	e8 1a e9 ff ff       	call   401c90 <dlerror@plt>
  403376:	48 8d 35 95 77 00 00 	lea    0x7795(%rip),%rsi        # 40ab12 <dlerror@plt+0x8e82>
  40337d:	48 8d 3d 04 7a 00 00 	lea    0x7a04(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403384:	48 89 c2             	mov    %rax,%rdx
  403387:	31 c0                	xor    %eax,%eax
  403389:	e8 62 11 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40338e:	e9 ed fc ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  403393:	e8 f8 e8 ff ff       	call   401c90 <dlerror@plt>
  403398:	48 8d 35 96 77 00 00 	lea    0x7796(%rip),%rsi        # 40ab35 <dlerror@plt+0x8ea5>
  40339f:	48 8d 3d e2 79 00 00 	lea    0x79e2(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4033a6:	48 89 c2             	mov    %rax,%rdx
  4033a9:	31 c0                	xor    %eax,%eax
  4033ab:	e8 40 11 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4033b0:	e9 cb fc ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4033b5:	e8 d6 e8 ff ff       	call   401c90 <dlerror@plt>
  4033ba:	48 8d 35 8c 77 00 00 	lea    0x778c(%rip),%rsi        # 40ab4d <dlerror@plt+0x8ebd>
  4033c1:	48 8d 3d c0 79 00 00 	lea    0x79c0(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4033c8:	48 89 c2             	mov    %rax,%rdx
  4033cb:	31 c0                	xor    %eax,%eax
  4033cd:	e8 1e 11 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4033d2:	e9 a9 fc ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4033d7:	e8 b4 e8 ff ff       	call   401c90 <dlerror@plt>
  4033dc:	48 8d 35 80 77 00 00 	lea    0x7780(%rip),%rsi        # 40ab63 <dlerror@plt+0x8ed3>
  4033e3:	48 8d 3d 9e 79 00 00 	lea    0x799e(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4033ea:	48 89 c2             	mov    %rax,%rdx
  4033ed:	31 c0                	xor    %eax,%eax
  4033ef:	e8 fc 10 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4033f4:	e9 87 fc ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4033f9:	e8 92 e8 ff ff       	call   401c90 <dlerror@plt>
  4033fe:	48 8d 35 6c 77 00 00 	lea    0x776c(%rip),%rsi        # 40ab71 <dlerror@plt+0x8ee1>
  403405:	48 8d 3d 7c 79 00 00 	lea    0x797c(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  40340c:	48 89 c2             	mov    %rax,%rdx
  40340f:	31 c0                	xor    %eax,%eax
  403411:	e8 da 10 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403416:	e9 65 fc ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40341b:	e8 70 e8 ff ff       	call   401c90 <dlerror@plt>
  403420:	48 8d 35 58 77 00 00 	lea    0x7758(%rip),%rsi        # 40ab7f <dlerror@plt+0x8eef>
  403427:	48 8d 3d 5a 79 00 00 	lea    0x795a(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  40342e:	48 89 c2             	mov    %rax,%rdx
  403431:	31 c0                	xor    %eax,%eax
  403433:	e8 b8 10 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403438:	e9 43 fc ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40343d:	e8 4e e8 ff ff       	call   401c90 <dlerror@plt>
  403442:	48 8d 35 7f 79 00 00 	lea    0x797f(%rip),%rsi        # 40adc8 <dlerror@plt+0x9138>
  403449:	48 8d 3d 38 79 00 00 	lea    0x7938(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403450:	48 89 c2             	mov    %rax,%rdx
  403453:	31 c0                	xor    %eax,%eax
  403455:	e8 96 10 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40345a:	e9 21 fc ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40345f:	e8 2c e8 ff ff       	call   401c90 <dlerror@plt>
  403464:	48 8d 35 25 77 00 00 	lea    0x7725(%rip),%rsi        # 40ab90 <dlerror@plt+0x8f00>
  40346b:	48 8d 3d 16 79 00 00 	lea    0x7916(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403472:	48 89 c2             	mov    %rax,%rdx
  403475:	31 c0                	xor    %eax,%eax
  403477:	e8 74 10 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40347c:	e9 ff fb ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  403481:	e8 0a e8 ff ff       	call   401c90 <dlerror@plt>
  403486:	48 8d 35 36 77 00 00 	lea    0x7736(%rip),%rsi        # 40abc3 <dlerror@plt+0x8f33>
  40348d:	48 8d 3d f4 78 00 00 	lea    0x78f4(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403494:	48 89 c2             	mov    %rax,%rdx
  403497:	31 c0                	xor    %eax,%eax
  403499:	e8 52 10 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40349e:	e9 dd fb ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4034a3:	e8 e8 e7 ff ff       	call   401c90 <dlerror@plt>
  4034a8:	48 8d 35 2b 77 00 00 	lea    0x772b(%rip),%rsi        # 40abda <dlerror@plt+0x8f4a>
  4034af:	48 8d 3d d2 78 00 00 	lea    0x78d2(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4034b6:	48 89 c2             	mov    %rax,%rdx
  4034b9:	31 c0                	xor    %eax,%eax
  4034bb:	e8 30 10 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4034c0:	e9 bb fb ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4034c5:	e8 c6 e7 ff ff       	call   401c90 <dlerror@plt>
  4034ca:	48 8d 35 d5 76 00 00 	lea    0x76d5(%rip),%rsi        # 40aba6 <dlerror@plt+0x8f16>
  4034d1:	48 8d 3d b0 78 00 00 	lea    0x78b0(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4034d8:	48 89 c2             	mov    %rax,%rdx
  4034db:	31 c0                	xor    %eax,%eax
  4034dd:	e8 0e 10 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4034e2:	e9 99 fb ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4034e7:	e8 a4 e7 ff ff       	call   401c90 <dlerror@plt>
  4034ec:	48 8d 35 fe 76 00 00 	lea    0x76fe(%rip),%rsi        # 40abf1 <dlerror@plt+0x8f61>
  4034f3:	48 8d 3d 8e 78 00 00 	lea    0x788e(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4034fa:	48 89 c2             	mov    %rax,%rdx
  4034fd:	31 c0                	xor    %eax,%eax
  4034ff:	e8 ec 0f 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403504:	e9 77 fb ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  403509:	e8 82 e7 ff ff       	call   401c90 <dlerror@plt>
  40350e:	48 8d 35 d3 78 00 00 	lea    0x78d3(%rip),%rsi        # 40ade8 <dlerror@plt+0x9158>
  403515:	48 8d 3d 6c 78 00 00 	lea    0x786c(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  40351c:	48 89 c2             	mov    %rax,%rdx
  40351f:	31 c0                	xor    %eax,%eax
  403521:	e8 ca 0f 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403526:	e9 55 fb ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40352b:	e8 60 e7 ff ff       	call   401c90 <dlerror@plt>
  403530:	48 8d 35 c7 76 00 00 	lea    0x76c7(%rip),%rsi        # 40abfe <dlerror@plt+0x8f6e>
  403537:	48 8d 3d 4a 78 00 00 	lea    0x784a(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  40353e:	48 89 c2             	mov    %rax,%rdx
  403541:	31 c0                	xor    %eax,%eax
  403543:	e8 a8 0f 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403548:	e9 33 fb ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40354d:	e8 3e e7 ff ff       	call   401c90 <dlerror@plt>
  403552:	48 8d 35 e0 76 00 00 	lea    0x76e0(%rip),%rsi        # 40ac39 <dlerror@plt+0x8fa9>
  403559:	48 8d 3d 28 78 00 00 	lea    0x7828(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403560:	48 89 c2             	mov    %rax,%rdx
  403563:	31 c0                	xor    %eax,%eax
  403565:	e8 86 0f 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40356a:	e9 11 fb ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40356f:	e8 1c e7 ff ff       	call   401c90 <dlerror@plt>
  403574:	48 8d 35 ce 76 00 00 	lea    0x76ce(%rip),%rsi        # 40ac49 <dlerror@plt+0x8fb9>
  40357b:	48 8d 3d 06 78 00 00 	lea    0x7806(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403582:	48 89 c2             	mov    %rax,%rdx
  403585:	31 c0                	xor    %eax,%eax
  403587:	e8 64 0f 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40358c:	e9 ef fa ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  403591:	e8 fa e6 ff ff       	call   401c90 <dlerror@plt>
  403596:	48 8d 35 79 76 00 00 	lea    0x7679(%rip),%rsi        # 40ac16 <dlerror@plt+0x8f86>
  40359d:	48 8d 3d e4 77 00 00 	lea    0x77e4(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4035a4:	48 89 c2             	mov    %rax,%rdx
  4035a7:	31 c0                	xor    %eax,%eax
  4035a9:	e8 42 0f 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4035ae:	e9 cd fa ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4035b3:	e8 d8 e6 ff ff       	call   401c90 <dlerror@plt>
  4035b8:	48 8d 35 6a 76 00 00 	lea    0x766a(%rip),%rsi        # 40ac29 <dlerror@plt+0x8f99>
  4035bf:	48 8d 3d c2 77 00 00 	lea    0x77c2(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4035c6:	48 89 c2             	mov    %rax,%rdx
  4035c9:	31 c0                	xor    %eax,%eax
  4035cb:	e8 20 0f 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4035d0:	e9 ab fa ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4035d5:	e8 b6 e6 ff ff       	call   401c90 <dlerror@plt>
  4035da:	48 8d 35 a4 76 00 00 	lea    0x76a4(%rip),%rsi        # 40ac85 <dlerror@plt+0x8ff5>
  4035e1:	48 8d 3d a0 77 00 00 	lea    0x77a0(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4035e8:	48 89 c2             	mov    %rax,%rdx
  4035eb:	31 c0                	xor    %eax,%eax
  4035ed:	e8 fe 0e 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4035f2:	e9 89 fa ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4035f7:	e8 94 e6 ff ff       	call   401c90 <dlerror@plt>
  4035fc:	48 8d 35 97 76 00 00 	lea    0x7697(%rip),%rsi        # 40ac9a <dlerror@plt+0x900a>
  403603:	48 8d 3d 7e 77 00 00 	lea    0x777e(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  40360a:	48 89 c2             	mov    %rax,%rdx
  40360d:	31 c0                	xor    %eax,%eax
  40360f:	e8 dc 0e 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403614:	e9 67 fa ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  403619:	e8 72 e6 ff ff       	call   401c90 <dlerror@plt>
  40361e:	48 8d 35 35 76 00 00 	lea    0x7635(%rip),%rsi        # 40ac5a <dlerror@plt+0x8fca>
  403625:	48 8d 3d 5c 77 00 00 	lea    0x775c(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  40362c:	48 89 c2             	mov    %rax,%rdx
  40362f:	31 c0                	xor    %eax,%eax
  403631:	e8 ba 0e 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403636:	e9 45 fa ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40363b:	e8 50 e6 ff ff       	call   401c90 <dlerror@plt>
  403640:	48 8d 35 24 76 00 00 	lea    0x7624(%rip),%rsi        # 40ac6b <dlerror@plt+0x8fdb>
  403647:	48 8d 3d 3a 77 00 00 	lea    0x773a(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  40364e:	48 89 c2             	mov    %rax,%rdx
  403651:	31 c0                	xor    %eax,%eax
  403653:	e8 98 0e 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403658:	e9 23 fa ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40365d:	e8 2e e6 ff ff       	call   401c90 <dlerror@plt>
  403662:	48 8d 35 46 76 00 00 	lea    0x7646(%rip),%rsi        # 40acaf <dlerror@plt+0x901f>
  403669:	48 8d 3d 18 77 00 00 	lea    0x7718(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403670:	48 89 c2             	mov    %rax,%rdx
  403673:	31 c0                	xor    %eax,%eax
  403675:	e8 76 0e 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40367a:	e9 01 fa ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40367f:	e8 0c e6 ff ff       	call   401c90 <dlerror@plt>
  403684:	48 8d 35 fb 72 00 00 	lea    0x72fb(%rip),%rsi        # 40a986 <dlerror@plt+0x8cf6>
  40368b:	48 8d 3d f6 76 00 00 	lea    0x76f6(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403692:	48 89 c2             	mov    %rax,%rdx
  403695:	31 c0                	xor    %eax,%eax
  403697:	e8 54 0e 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40369c:	e9 df f9 ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4036a1:	e8 ea e5 ff ff       	call   401c90 <dlerror@plt>
  4036a6:	48 8d 35 eb 72 00 00 	lea    0x72eb(%rip),%rsi        # 40a998 <dlerror@plt+0x8d08>
  4036ad:	48 8d 3d d4 76 00 00 	lea    0x76d4(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4036b4:	48 89 c2             	mov    %rax,%rdx
  4036b7:	31 c0                	xor    %eax,%eax
  4036b9:	e8 32 0e 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4036be:	e9 bd f9 ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4036c3:	e8 c8 e5 ff ff       	call   401c90 <dlerror@plt>
  4036c8:	48 8d 35 dd 72 00 00 	lea    0x72dd(%rip),%rsi        # 40a9ac <dlerror@plt+0x8d1c>
  4036cf:	48 8d 3d b2 76 00 00 	lea    0x76b2(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4036d6:	48 89 c2             	mov    %rax,%rdx
  4036d9:	31 c0                	xor    %eax,%eax
  4036db:	e8 10 0e 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4036e0:	e9 9b f9 ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4036e5:	e8 a6 e5 ff ff       	call   401c90 <dlerror@plt>
  4036ea:	48 8d 35 19 73 00 00 	lea    0x7319(%rip),%rsi        # 40aa0a <dlerror@plt+0x8d7a>
  4036f1:	48 8d 3d 90 76 00 00 	lea    0x7690(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4036f8:	48 89 c2             	mov    %rax,%rdx
  4036fb:	31 c0                	xor    %eax,%eax
  4036fd:	e8 ee 0d 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403702:	e9 79 f9 ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  403707:	e8 84 e5 ff ff       	call   401c90 <dlerror@plt>
  40370c:	48 8d 35 06 73 00 00 	lea    0x7306(%rip),%rsi        # 40aa19 <dlerror@plt+0x8d89>
  403713:	48 8d 3d 6e 76 00 00 	lea    0x766e(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  40371a:	48 89 c2             	mov    %rax,%rdx
  40371d:	31 c0                	xor    %eax,%eax
  40371f:	e8 cc 0d 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403724:	e9 57 f9 ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  403729:	e8 62 e5 ff ff       	call   401c90 <dlerror@plt>
  40372e:	48 8d 35 00 73 00 00 	lea    0x7300(%rip),%rsi        # 40aa35 <dlerror@plt+0x8da5>
  403735:	48 8d 3d 4c 76 00 00 	lea    0x764c(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  40373c:	48 89 c2             	mov    %rax,%rdx
  40373f:	31 c0                	xor    %eax,%eax
  403741:	e8 aa 0d 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403746:	e9 35 f9 ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40374b:	e8 40 e5 ff ff       	call   401c90 <dlerror@plt>
  403750:	48 8d 35 04 73 00 00 	lea    0x7304(%rip),%rsi        # 40aa5b <dlerror@plt+0x8dcb>
  403757:	48 8d 3d 2a 76 00 00 	lea    0x762a(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  40375e:	48 89 c2             	mov    %rax,%rdx
  403761:	31 c0                	xor    %eax,%eax
  403763:	e8 88 0d 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403768:	e9 13 f9 ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40376d:	e8 1e e5 ff ff       	call   401c90 <dlerror@plt>
  403772:	48 8d 35 5f 72 00 00 	lea    0x725f(%rip),%rsi        # 40a9d8 <dlerror@plt+0x8d48>
  403779:	48 8d 3d 08 76 00 00 	lea    0x7608(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403780:	48 89 c2             	mov    %rax,%rdx
  403783:	31 c0                	xor    %eax,%eax
  403785:	e8 66 0d 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40378a:	e9 f1 f8 ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  40378f:	e8 fc e4 ff ff       	call   401c90 <dlerror@plt>
  403794:	48 8d 35 d3 72 00 00 	lea    0x72d3(%rip),%rsi        # 40aa6e <dlerror@plt+0x8dde>
  40379b:	48 8d 3d e6 75 00 00 	lea    0x75e6(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4037a2:	48 89 c2             	mov    %rax,%rdx
  4037a5:	31 c0                	xor    %eax,%eax
  4037a7:	e8 44 0d 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4037ac:	e9 cf f8 ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4037b1:	e8 da e4 ff ff       	call   401c90 <dlerror@plt>
  4037b6:	48 8d 35 cc 72 00 00 	lea    0x72cc(%rip),%rsi        # 40aa89 <dlerror@plt+0x8df9>
  4037bd:	48 8d 3d c4 75 00 00 	lea    0x75c4(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4037c4:	48 89 c2             	mov    %rax,%rdx
  4037c7:	31 c0                	xor    %eax,%eax
  4037c9:	e8 22 0d 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4037ce:	e9 ad f8 ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4037d3:	e8 b8 e4 ff ff       	call   401c90 <dlerror@plt>
  4037d8:	48 8d 35 64 72 00 00 	lea    0x7264(%rip),%rsi        # 40aa43 <dlerror@plt+0x8db3>
  4037df:	48 8d 3d a2 75 00 00 	lea    0x75a2(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  4037e6:	48 89 c2             	mov    %rax,%rdx
  4037e9:	31 c0                	xor    %eax,%eax
  4037eb:	e8 00 0d 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4037f0:	e9 8b f8 ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  4037f5:	e8 96 e4 ff ff       	call   401c90 <dlerror@plt>
  4037fa:	48 8d 35 bf 71 00 00 	lea    0x71bf(%rip),%rsi        # 40a9c0 <dlerror@plt+0x8d30>
  403801:	48 8d 3d 80 75 00 00 	lea    0x7580(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  403808:	48 89 c2             	mov    %rax,%rdx
  40380b:	31 c0                	xor    %eax,%eax
  40380d:	e8 de 0c 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403812:	e9 69 f8 ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  403817:	e8 74 e4 ff ff       	call   401c90 <dlerror@plt>
  40381c:	48 8d 35 cb 71 00 00 	lea    0x71cb(%rip),%rsi        # 40a9ee <dlerror@plt+0x8d5e>
  403823:	48 8d 3d 5e 75 00 00 	lea    0x755e(%rip),%rdi        # 40ad88 <dlerror@plt+0x90f8>
  40382a:	48 89 c2             	mov    %rax,%rdx
  40382d:	31 c0                	xor    %eax,%eax
  40382f:	e8 bc 0c 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403834:	e9 47 f8 ff ff       	jmp    403080 <dlerror@plt+0x13f0>
  403839:	e8 c2 e0 ff ff       	call   401900 <__stack_chk_fail@plt>
  40383e:	66 90                	xchg   %ax,%ax
  403840:	53                   	push   %rbx
  403841:	48 8b 1f             	mov    (%rdi),%rbx
  403844:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
  40384b:	48 85 db             	test   %rbx,%rbx
  40384e:	74 28                	je     403878 <dlerror@plt+0x1be8>
  403850:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  403854:	48 85 ff             	test   %rdi,%rdi
  403857:	74 05                	je     40385e <dlerror@plt+0x1bce>
  403859:	e8 d2 e2 ff ff       	call   401b30 <dlclose@plt>
  40385e:	48 8b 3b             	mov    (%rbx),%rdi
  403861:	48 85 ff             	test   %rdi,%rdi
  403864:	74 05                	je     40386b <dlerror@plt+0x1bdb>
  403866:	e8 c5 e2 ff ff       	call   401b30 <dlclose@plt>
  40386b:	48 89 df             	mov    %rbx,%rdi
  40386e:	5b                   	pop    %rbx
  40386f:	e9 4c df ff ff       	jmp    4017c0 <free@plt>
  403874:	0f 1f 40 00          	nopl   0x0(%rax)
  403878:	5b                   	pop    %rbx
  403879:	c3                   	ret
  40387a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  403880:	41 54                	push   %r12
  403882:	55                   	push   %rbp
  403883:	49 89 f4             	mov    %rsi,%r12
  403886:	53                   	push   %rbx
  403887:	48 89 fd             	mov    %rdi,%rbp
  40388a:	be 68 01 00 00       	mov    $0x168,%esi
  40388f:	bf 01 00 00 00       	mov    $0x1,%edi
  403894:	48 83 ec 10          	sub    $0x10,%rsp
  403898:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40389f:	00 00 
  4038a1:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4038a6:	31 c0                	xor    %eax,%eax
  4038a8:	e8 13 e1 ff ff       	call   4019c0 <calloc@plt>
  4038ad:	48 85 c0             	test   %rax,%rax
  4038b0:	48 89 c3             	mov    %rax,%rbx
  4038b3:	48 89 04 24          	mov    %rax,(%rsp)
  4038b7:	0f 84 03 06 00 00    	je     403ec0 <dlerror@plt+0x2230>
  4038bd:	be 02 01 00 00       	mov    $0x102,%esi
  4038c2:	48 89 ef             	mov    %rbp,%rdi
  4038c5:	e8 f6 e1 ff ff       	call   401ac0 <dlopen@plt>
  4038ca:	48 85 c0             	test   %rax,%rax
  4038cd:	48 89 03             	mov    %rax,(%rbx)
  4038d0:	0f 84 0b 06 00 00    	je     403ee1 <dlerror@plt+0x2251>
  4038d6:	be 02 01 00 00       	mov    $0x102,%esi
  4038db:	4c 89 e7             	mov    %r12,%rdi
  4038de:	e8 dd e1 ff ff       	call   401ac0 <dlopen@plt>
  4038e3:	48 85 c0             	test   %rax,%rax
  4038e6:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4038ea:	0f 84 0c 06 00 00    	je     403efc <dlerror@plt+0x226c>
  4038f0:	48 8b 1c 24          	mov    (%rsp),%rbx
  4038f4:	48 8d 35 14 76 00 00 	lea    0x7614(%rip),%rsi        # 40af0f <dlerror@plt+0x927f>
  4038fb:	48 8b 3b             	mov    (%rbx),%rdi
  4038fe:	e8 6d e3 ff ff       	call   401c70 <dlsym@plt>
  403903:	48 85 c0             	test   %rax,%rax
  403906:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40390a:	0f 84 2a 0a 00 00    	je     40433a <dlerror@plt+0x26aa>
  403910:	31 c9                	xor    %ecx,%ecx
  403912:	31 d2                	xor    %edx,%edx
  403914:	31 f6                	xor    %esi,%esi
  403916:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
  40391a:	ff d0                	call   *%rax
  40391c:	48 8b 3b             	mov    (%rbx),%rdi
  40391f:	48 8d 35 f8 75 00 00 	lea    0x75f8(%rip),%rsi        # 40af1e <dlerror@plt+0x928e>
  403926:	e8 45 e3 ff ff       	call   401c70 <dlsym@plt>
  40392b:	48 85 c0             	test   %rax,%rax
  40392e:	48 89 43 20          	mov    %rax,0x20(%rbx)
  403932:	0f 84 5a 05 00 00    	je     403e92 <dlerror@plt+0x2202>
  403938:	48 8b 3b             	mov    (%rbx),%rdi
  40393b:	48 8d 35 e5 75 00 00 	lea    0x75e5(%rip),%rsi        # 40af27 <dlerror@plt+0x9297>
  403942:	e8 29 e3 ff ff       	call   401c70 <dlsym@plt>
  403947:	48 85 c0             	test   %rax,%rax
  40394a:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40394e:	0f 84 c3 05 00 00    	je     403f17 <dlerror@plt+0x2287>
  403954:	48 8b 3b             	mov    (%rbx),%rdi
  403957:	48 8d 35 da 75 00 00 	lea    0x75da(%rip),%rsi        # 40af38 <dlerror@plt+0x92a8>
  40395e:	e8 0d e3 ff ff       	call   401c70 <dlsym@plt>
  403963:	48 85 c0             	test   %rax,%rax
  403966:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40396a:	0f 84 c9 05 00 00    	je     403f39 <dlerror@plt+0x22a9>
  403970:	48 8b 3b             	mov    (%rbx),%rdi
  403973:	48 8d 35 d1 75 00 00 	lea    0x75d1(%rip),%rsi        # 40af4b <dlerror@plt+0x92bb>
  40397a:	e8 f1 e2 ff ff       	call   401c70 <dlsym@plt>
  40397f:	48 85 c0             	test   %rax,%rax
  403982:	48 89 43 38          	mov    %rax,0x38(%rbx)
  403986:	0f 84 cf 05 00 00    	je     403f5b <dlerror@plt+0x22cb>
  40398c:	48 8b 3b             	mov    (%rbx),%rdi
  40398f:	48 8d 35 c4 75 00 00 	lea    0x75c4(%rip),%rsi        # 40af5a <dlerror@plt+0x92ca>
  403996:	e8 d5 e2 ff ff       	call   401c70 <dlsym@plt>
  40399b:	48 85 c0             	test   %rax,%rax
  40399e:	48 89 43 40          	mov    %rax,0x40(%rbx)
  4039a2:	0f 84 f7 05 00 00    	je     403f9f <dlerror@plt+0x230f>
  4039a8:	48 8b 3b             	mov    (%rbx),%rdi
  4039ab:	48 8d 35 b5 75 00 00 	lea    0x75b5(%rip),%rsi        # 40af67 <dlerror@plt+0x92d7>
  4039b2:	e8 b9 e2 ff ff       	call   401c70 <dlsym@plt>
  4039b7:	48 85 c0             	test   %rax,%rax
  4039ba:	48 89 43 48          	mov    %rax,0x48(%rbx)
  4039be:	0f 84 b9 05 00 00    	je     403f7d <dlerror@plt+0x22ed>
  4039c4:	48 8b 3b             	mov    (%rbx),%rdi
  4039c7:	48 8d 35 ac 75 00 00 	lea    0x75ac(%rip),%rsi        # 40af7a <dlerror@plt+0x92ea>
  4039ce:	e8 9d e2 ff ff       	call   401c70 <dlsym@plt>
  4039d3:	48 85 c0             	test   %rax,%rax
  4039d6:	48 89 43 50          	mov    %rax,0x50(%rbx)
  4039da:	0f 84 89 08 00 00    	je     404269 <dlerror@plt+0x25d9>
  4039e0:	83 7b 10 08          	cmpl   $0x8,0x10(%rbx)
  4039e4:	48 8b 3b             	mov    (%rbx),%rdi
  4039e7:	48 8d 35 9d 75 00 00 	lea    0x759d(%rip),%rsi        # 40af8b <dlerror@plt+0x92fb>
  4039ee:	0f 8e 94 03 00 00    	jle    403d88 <dlerror@plt+0x20f8>
  4039f4:	e8 77 e2 ff ff       	call   401c70 <dlsym@plt>
  4039f9:	48 85 c0             	test   %rax,%rax
  4039fc:	48 89 43 60          	mov    %rax,0x60(%rbx)
  403a00:	0f 84 94 03 00 00    	je     403d9a <dlerror@plt+0x210a>
  403a06:	48 8b 3b             	mov    (%rbx),%rdi
  403a09:	48 8d 35 8c 75 00 00 	lea    0x758c(%rip),%rsi        # 40af9c <dlerror@plt+0x930c>
  403a10:	e8 5b e2 ff ff       	call   401c70 <dlsym@plt>
  403a15:	48 85 c0             	test   %rax,%rax
  403a18:	48 89 43 68          	mov    %rax,0x68(%rbx)
  403a1c:	0f 84 c1 05 00 00    	je     403fe3 <dlerror@plt+0x2353>
  403a22:	48 8b 3b             	mov    (%rbx),%rdi
  403a25:	48 8d 35 85 75 00 00 	lea    0x7585(%rip),%rsi        # 40afb1 <dlerror@plt+0x9321>
  403a2c:	e8 3f e2 ff ff       	call   401c70 <dlsym@plt>
  403a31:	48 85 c0             	test   %rax,%rax
  403a34:	48 89 43 70          	mov    %rax,0x70(%rbx)
  403a38:	0f 84 c7 05 00 00    	je     404005 <dlerror@plt+0x2375>
  403a3e:	48 8b 3b             	mov    (%rbx),%rdi
  403a41:	48 8d 35 78 75 00 00 	lea    0x7578(%rip),%rsi        # 40afc0 <dlerror@plt+0x9330>
  403a48:	e8 23 e2 ff ff       	call   401c70 <dlsym@plt>
  403a4d:	48 85 c0             	test   %rax,%rax
  403a50:	48 89 43 78          	mov    %rax,0x78(%rbx)
  403a54:	0f 84 67 05 00 00    	je     403fc1 <dlerror@plt+0x2331>
  403a5a:	48 8b 3b             	mov    (%rbx),%rdi
  403a5d:	48 8d 35 6a 75 00 00 	lea    0x756a(%rip),%rsi        # 40afce <dlerror@plt+0x933e>
  403a64:	e8 07 e2 ff ff       	call   401c70 <dlsym@plt>
  403a69:	48 85 c0             	test   %rax,%rax
  403a6c:	48 89 83 80 00 00 00 	mov    %rax,0x80(%rbx)
  403a73:	0f 84 f2 05 00 00    	je     40406b <dlerror@plt+0x23db>
  403a79:	48 8b 3b             	mov    (%rbx),%rdi
  403a7c:	48 8d 35 5b 75 00 00 	lea    0x755b(%rip),%rsi        # 40afde <dlerror@plt+0x934e>
  403a83:	e8 e8 e1 ff ff       	call   401c70 <dlsym@plt>
  403a88:	48 85 c0             	test   %rax,%rax
  403a8b:	48 89 83 88 00 00 00 	mov    %rax,0x88(%rbx)
  403a92:	0f 84 8f 05 00 00    	je     404027 <dlerror@plt+0x2397>
  403a98:	48 8b 3b             	mov    (%rbx),%rdi
  403a9b:	48 8d 35 4e 75 00 00 	lea    0x754e(%rip),%rsi        # 40aff0 <dlerror@plt+0x9360>
  403aa2:	e8 c9 e1 ff ff       	call   401c70 <dlsym@plt>
  403aa7:	48 85 c0             	test   %rax,%rax
  403aaa:	48 89 83 90 00 00 00 	mov    %rax,0x90(%rbx)
  403ab1:	0f 84 92 05 00 00    	je     404049 <dlerror@plt+0x23b9>
  403ab7:	48 8b 3b             	mov    (%rbx),%rdi
  403aba:	48 8d 35 45 75 00 00 	lea    0x7545(%rip),%rsi        # 40b006 <dlerror@plt+0x9376>
  403ac1:	e8 aa e1 ff ff       	call   401c70 <dlsym@plt>
  403ac6:	48 85 c0             	test   %rax,%rax
  403ac9:	48 89 83 98 00 00 00 	mov    %rax,0x98(%rbx)
  403ad0:	0f 84 fb 05 00 00    	je     4040d1 <dlerror@plt+0x2441>
  403ad6:	48 8b 3b             	mov    (%rbx),%rdi
  403ad9:	48 8d 35 3a 75 00 00 	lea    0x753a(%rip),%rsi        # 40b01a <dlerror@plt+0x938a>
  403ae0:	e8 8b e1 ff ff       	call   401c70 <dlsym@plt>
  403ae5:	48 85 c0             	test   %rax,%rax
  403ae8:	48 89 83 a0 00 00 00 	mov    %rax,0xa0(%rbx)
  403aef:	0f 84 98 05 00 00    	je     40408d <dlerror@plt+0x23fd>
  403af5:	48 8b 3b             	mov    (%rbx),%rdi
  403af8:	48 8d 35 2d 75 00 00 	lea    0x752d(%rip),%rsi        # 40b02c <dlerror@plt+0x939c>
  403aff:	e8 6c e1 ff ff       	call   401c70 <dlsym@plt>
  403b04:	48 85 c0             	test   %rax,%rax
  403b07:	48 89 83 a8 00 00 00 	mov    %rax,0xa8(%rbx)
  403b0e:	0f 84 9b 05 00 00    	je     4040af <dlerror@plt+0x241f>
  403b14:	48 8b 3b             	mov    (%rbx),%rdi
  403b17:	48 8d 35 23 75 00 00 	lea    0x7523(%rip),%rsi        # 40b041 <dlerror@plt+0x93b1>
  403b1e:	e8 4d e1 ff ff       	call   401c70 <dlsym@plt>
  403b23:	48 85 c0             	test   %rax,%rax
  403b26:	48 89 83 b0 00 00 00 	mov    %rax,0xb0(%rbx)
  403b2d:	0f 84 e2 05 00 00    	je     404115 <dlerror@plt+0x2485>
  403b33:	48 8b 3b             	mov    (%rbx),%rdi
  403b36:	48 8d 35 14 75 00 00 	lea    0x7514(%rip),%rsi        # 40b051 <dlerror@plt+0x93c1>
  403b3d:	e8 2e e1 ff ff       	call   401c70 <dlsym@plt>
  403b42:	48 85 c0             	test   %rax,%rax
  403b45:	48 89 83 b8 00 00 00 	mov    %rax,0xb8(%rbx)
  403b4c:	0f 84 e5 05 00 00    	je     404137 <dlerror@plt+0x24a7>
  403b52:	48 8b 3b             	mov    (%rbx),%rdi
  403b55:	48 8d 35 01 75 00 00 	lea    0x7501(%rip),%rsi        # 40b05d <dlerror@plt+0x93cd>
  403b5c:	e8 0f e1 ff ff       	call   401c70 <dlsym@plt>
  403b61:	48 85 c0             	test   %rax,%rax
  403b64:	48 89 83 c0 00 00 00 	mov    %rax,0xc0(%rbx)
  403b6b:	0f 84 82 05 00 00    	je     4040f3 <dlerror@plt+0x2463>
  403b71:	48 8b 3b             	mov    (%rbx),%rdi
  403b74:	48 8d 35 ee 74 00 00 	lea    0x74ee(%rip),%rsi        # 40b069 <dlerror@plt+0x93d9>
  403b7b:	e8 f0 e0 ff ff       	call   401c70 <dlsym@plt>
  403b80:	48 85 c0             	test   %rax,%rax
  403b83:	48 89 83 c8 00 00 00 	mov    %rax,0xc8(%rbx)
  403b8a:	0f 84 eb 05 00 00    	je     40417b <dlerror@plt+0x24eb>
  403b90:	48 8b 3b             	mov    (%rbx),%rdi
  403b93:	48 8d 35 dd 74 00 00 	lea    0x74dd(%rip),%rsi        # 40b077 <dlerror@plt+0x93e7>
  403b9a:	e8 d1 e0 ff ff       	call   401c70 <dlsym@plt>
  403b9f:	48 85 c0             	test   %rax,%rax
  403ba2:	48 89 83 d0 00 00 00 	mov    %rax,0xd0(%rbx)
  403ba9:	0f 84 aa 05 00 00    	je     404159 <dlerror@plt+0x24c9>
  403baf:	48 8b 3b             	mov    (%rbx),%rdi
  403bb2:	48 8d 35 d3 74 00 00 	lea    0x74d3(%rip),%rsi        # 40b08c <dlerror@plt+0x93fc>
  403bb9:	e8 b2 e0 ff ff       	call   401c70 <dlsym@plt>
  403bbe:	48 85 c0             	test   %rax,%rax
  403bc1:	48 89 83 d8 00 00 00 	mov    %rax,0xd8(%rbx)
  403bc8:	0f 84 bd 06 00 00    	je     40428b <dlerror@plt+0x25fb>
  403bce:	83 7b 10 08          	cmpl   $0x8,0x10(%rbx)
  403bd2:	48 8b 3b             	mov    (%rbx),%rdi
  403bd5:	48 8d 35 be 74 00 00 	lea    0x74be(%rip),%rsi        # 40b09a <dlerror@plt+0x940a>
  403bdc:	0f 8f de 01 00 00    	jg     403dc0 <dlerror@plt+0x2130>
  403be2:	e8 89 e0 ff ff       	call   401c70 <dlsym@plt>
  403be7:	48 85 c0             	test   %rax,%rax
  403bea:	48 89 83 e0 00 00 00 	mov    %rax,0xe0(%rbx)
  403bf1:	0f 84 c8 05 00 00    	je     4041bf <dlerror@plt+0x252f>
  403bf7:	48 8b 3b             	mov    (%rbx),%rdi
  403bfa:	48 8d 35 aa 74 00 00 	lea    0x74aa(%rip),%rsi        # 40b0ab <dlerror@plt+0x941b>
  403c01:	e8 6a e0 ff ff       	call   401c70 <dlsym@plt>
  403c06:	48 85 c0             	test   %rax,%rax
  403c09:	48 89 83 f0 00 00 00 	mov    %rax,0xf0(%rbx)
  403c10:	0f 84 de 01 00 00    	je     403df4 <dlerror@plt+0x2164>
  403c16:	48 8b 3b             	mov    (%rbx),%rdi
  403c19:	48 8d 35 9f 74 00 00 	lea    0x749f(%rip),%rsi        # 40b0bf <dlerror@plt+0x942f>
  403c20:	e8 4b e0 ff ff       	call   401c70 <dlsym@plt>
  403c25:	48 85 c0             	test   %rax,%rax
  403c28:	48 89 83 00 01 00 00 	mov    %rax,0x100(%rbx)
  403c2f:	0f 84 f0 05 00 00    	je     404225 <dlerror@plt+0x2595>
  403c35:	48 8b 3b             	mov    (%rbx),%rdi
  403c38:	48 8d 35 8e 74 00 00 	lea    0x748e(%rip),%rsi        # 40b0cd <dlerror@plt+0x943d>
  403c3f:	e8 2c e0 ff ff       	call   401c70 <dlsym@plt>
  403c44:	48 85 c0             	test   %rax,%rax
  403c47:	48 89 83 08 01 00 00 	mov    %rax,0x108(%rbx)
  403c4e:	0f 84 af 05 00 00    	je     404203 <dlerror@plt+0x2573>
  403c54:	48 8b 3b             	mov    (%rbx),%rdi
  403c57:	48 8d 35 80 74 00 00 	lea    0x7480(%rip),%rsi        # 40b0de <dlerror@plt+0x944e>
  403c5e:	e8 0d e0 ff ff       	call   401c70 <dlsym@plt>
  403c63:	48 85 c0             	test   %rax,%rax
  403c66:	48 89 83 10 01 00 00 	mov    %rax,0x110(%rbx)
  403c6d:	0f 84 6e 05 00 00    	je     4041e1 <dlerror@plt+0x2551>
  403c73:	48 8b 3b             	mov    (%rbx),%rdi
  403c76:	48 8d 35 72 74 00 00 	lea    0x7472(%rip),%rsi        # 40b0ef <dlerror@plt+0x945f>
  403c7d:	e8 ee df ff ff       	call   401c70 <dlsym@plt>
  403c82:	48 85 c0             	test   %rax,%rax
  403c85:	48 89 83 18 01 00 00 	mov    %rax,0x118(%rbx)
  403c8c:	0f 84 1b 06 00 00    	je     4042ad <dlerror@plt+0x261d>
  403c92:	83 7b 10 08          	cmpl   $0x8,0x10(%rbx)
  403c96:	48 8b 3b             	mov    (%rbx),%rdi
  403c99:	48 8d 35 5c 74 00 00 	lea    0x745c(%rip),%rsi        # 40b0fc <dlerror@plt+0x946c>
  403ca0:	0f 8e 7a 01 00 00    	jle    403e20 <dlerror@plt+0x2190>
  403ca6:	e8 c5 df ff ff       	call   401c70 <dlsym@plt>
  403cab:	48 85 c0             	test   %rax,%rax
  403cae:	48 89 83 28 01 00 00 	mov    %rax,0x128(%rbx)
  403cb5:	0f 84 e2 04 00 00    	je     40419d <dlerror@plt+0x250d>
  403cbb:	48 8b 3b             	mov    (%rbx),%rdi
  403cbe:	48 8d 35 42 74 00 00 	lea    0x7442(%rip),%rsi        # 40b107 <dlerror@plt+0x9477>
  403cc5:	e8 a6 df ff ff       	call   401c70 <dlsym@plt>
  403cca:	48 85 c0             	test   %rax,%rax
  403ccd:	48 89 83 38 01 00 00 	mov    %rax,0x138(%rbx)
  403cd4:	0f 84 6d 05 00 00    	je     404247 <dlerror@plt+0x25b7>
  403cda:	48 8b 3b             	mov    (%rbx),%rdi
  403cdd:	48 8d 35 30 74 00 00 	lea    0x7430(%rip),%rsi        # 40b114 <dlerror@plt+0x9484>
  403ce4:	e8 87 df ff ff       	call   401c70 <dlsym@plt>
  403ce9:	48 85 c0             	test   %rax,%rax
  403cec:	48 89 83 48 01 00 00 	mov    %rax,0x148(%rbx)
  403cf3:	0f 84 7a 01 00 00    	je     403e73 <dlerror@plt+0x21e3>
  403cf9:	48 8b 3b             	mov    (%rbx),%rdi
  403cfc:	48 8d 35 1b 74 00 00 	lea    0x741b(%rip),%rsi        # 40b11e <dlerror@plt+0x948e>
  403d03:	e8 68 df ff ff       	call   401c70 <dlsym@plt>
  403d08:	48 85 c0             	test   %rax,%rax
  403d0b:	48 89 83 50 01 00 00 	mov    %rax,0x150(%rbx)
  403d12:	0f 84 b7 05 00 00    	je     4042cf <dlerror@plt+0x263f>
  403d18:	48 8b 1c 24          	mov    (%rsp),%rbx
  403d1c:	48 8d 35 04 74 00 00 	lea    0x7404(%rip),%rsi        # 40b127 <dlerror@plt+0x9497>
  403d23:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  403d27:	e8 44 df ff ff       	call   401c70 <dlsym@plt>
  403d2c:	48 85 c0             	test   %rax,%rax
  403d2f:	48 89 83 58 01 00 00 	mov    %rax,0x158(%rbx)
  403d36:	0f 84 b5 05 00 00    	je     4042f1 <dlerror@plt+0x2661>
  403d3c:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  403d40:	48 8d 35 e8 73 00 00 	lea    0x73e8(%rip),%rsi        # 40b12f <dlerror@plt+0x949f>
  403d47:	e8 24 df ff ff       	call   401c70 <dlsym@plt>
  403d4c:	48 85 c0             	test   %rax,%rax
  403d4f:	48 89 83 60 01 00 00 	mov    %rax,0x160(%rbx)
  403d56:	0f 84 b7 05 00 00    	je     404313 <dlerror@plt+0x2683>
  403d5c:	0f 1f 40 00          	nopl   0x0(%rax)
  403d60:	48 8b 1c 24          	mov    (%rsp),%rbx
  403d64:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  403d69:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  403d70:	00 00 
  403d72:	48 89 d8             	mov    %rbx,%rax
  403d75:	0f 85 ba 05 00 00    	jne    404335 <dlerror@plt+0x26a5>
  403d7b:	48 83 c4 10          	add    $0x10,%rsp
  403d7f:	5b                   	pop    %rbx
  403d80:	5d                   	pop    %rbp
  403d81:	41 5c                	pop    %r12
  403d83:	c3                   	ret
  403d84:	0f 1f 40 00          	nopl   0x0(%rax)
  403d88:	e8 e3 de ff ff       	call   401c70 <dlsym@plt>
  403d8d:	48 85 c0             	test   %rax,%rax
  403d90:	48 89 43 58          	mov    %rax,0x58(%rbx)
  403d94:	0f 85 6c fc ff ff    	jne    403a06 <dlerror@plt+0x1d76>
  403d9a:	e8 f1 de ff ff       	call   401c90 <dlerror@plt>
  403d9f:	48 8d 35 e5 71 00 00 	lea    0x71e5(%rip),%rsi        # 40af8b <dlerror@plt+0x92fb>
  403da6:	48 8d 3d f3 70 00 00 	lea    0x70f3(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  403dad:	48 89 c2             	mov    %rax,%rdx
  403db0:	31 c0                	xor    %eax,%eax
  403db2:	e8 39 07 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403db7:	e9 f4 00 00 00       	jmp    403eb0 <dlerror@plt+0x2220>
  403dbc:	0f 1f 40 00          	nopl   0x0(%rax)
  403dc0:	e8 ab de ff ff       	call   401c70 <dlsym@plt>
  403dc5:	48 85 c0             	test   %rax,%rax
  403dc8:	48 89 83 e8 00 00 00 	mov    %rax,0xe8(%rbx)
  403dcf:	0f 84 ea 03 00 00    	je     4041bf <dlerror@plt+0x252f>
  403dd5:	48 8b 3b             	mov    (%rbx),%rdi
  403dd8:	48 8d 35 cc 72 00 00 	lea    0x72cc(%rip),%rsi        # 40b0ab <dlerror@plt+0x941b>
  403ddf:	e8 8c de ff ff       	call   401c70 <dlsym@plt>
  403de4:	48 85 c0             	test   %rax,%rax
  403de7:	48 89 83 f8 00 00 00 	mov    %rax,0xf8(%rbx)
  403dee:	0f 85 22 fe ff ff    	jne    403c16 <dlerror@plt+0x1f86>
  403df4:	e8 97 de ff ff       	call   401c90 <dlerror@plt>
  403df9:	48 8d 35 ab 72 00 00 	lea    0x72ab(%rip),%rsi        # 40b0ab <dlerror@plt+0x941b>
  403e00:	48 8d 3d 99 70 00 00 	lea    0x7099(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  403e07:	48 89 c2             	mov    %rax,%rdx
  403e0a:	31 c0                	xor    %eax,%eax
  403e0c:	e8 df 06 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403e11:	e9 9a 00 00 00       	jmp    403eb0 <dlerror@plt+0x2220>
  403e16:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  403e1d:	00 00 00 
  403e20:	e8 4b de ff ff       	call   401c70 <dlsym@plt>
  403e25:	48 85 c0             	test   %rax,%rax
  403e28:	48 89 83 20 01 00 00 	mov    %rax,0x120(%rbx)
  403e2f:	0f 84 68 03 00 00    	je     40419d <dlerror@plt+0x250d>
  403e35:	48 8b 3b             	mov    (%rbx),%rdi
  403e38:	48 8d 35 c8 72 00 00 	lea    0x72c8(%rip),%rsi        # 40b107 <dlerror@plt+0x9477>
  403e3f:	e8 2c de ff ff       	call   401c70 <dlsym@plt>
  403e44:	48 85 c0             	test   %rax,%rax
  403e47:	48 89 83 30 01 00 00 	mov    %rax,0x130(%rbx)
  403e4e:	0f 84 f3 03 00 00    	je     404247 <dlerror@plt+0x25b7>
  403e54:	48 8b 3b             	mov    (%rbx),%rdi
  403e57:	48 8d 35 b6 72 00 00 	lea    0x72b6(%rip),%rsi        # 40b114 <dlerror@plt+0x9484>
  403e5e:	e8 0d de ff ff       	call   401c70 <dlsym@plt>
  403e63:	48 85 c0             	test   %rax,%rax
  403e66:	48 89 83 40 01 00 00 	mov    %rax,0x140(%rbx)
  403e6d:	0f 85 86 fe ff ff    	jne    403cf9 <dlerror@plt+0x2069>
  403e73:	e8 18 de ff ff       	call   401c90 <dlerror@plt>
  403e78:	48 8d 35 95 72 00 00 	lea    0x7295(%rip),%rsi        # 40b114 <dlerror@plt+0x9484>
  403e7f:	48 8d 3d 1a 70 00 00 	lea    0x701a(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  403e86:	48 89 c2             	mov    %rax,%rdx
  403e89:	31 c0                	xor    %eax,%eax
  403e8b:	e8 60 06 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403e90:	eb 1e                	jmp    403eb0 <dlerror@plt+0x2220>
  403e92:	e8 f9 dd ff ff       	call   401c90 <dlerror@plt>
  403e97:	48 8d 35 80 70 00 00 	lea    0x7080(%rip),%rsi        # 40af1e <dlerror@plt+0x928e>
  403e9e:	48 8d 3d fb 6f 00 00 	lea    0x6ffb(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  403ea5:	48 89 c2             	mov    %rax,%rdx
  403ea8:	31 c0                	xor    %eax,%eax
  403eaa:	e8 41 06 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403eaf:	90                   	nop
  403eb0:	48 89 e7             	mov    %rsp,%rdi
  403eb3:	e8 88 f9 ff ff       	call   403840 <dlerror@plt+0x1bb0>
  403eb8:	e9 a3 fe ff ff       	jmp    403d60 <dlerror@plt+0x20d0>
  403ebd:	0f 1f 00             	nopl   (%rax)
  403ec0:	e8 0b d9 ff ff       	call   4017d0 <__errno_location@plt>
  403ec5:	8b 30                	mov    (%rax),%esi
  403ec7:	48 8d 15 3a 6f 00 00 	lea    0x6f3a(%rip),%rdx        # 40ae08 <dlerror@plt+0x9178>
  403ece:	48 8d 3d a3 66 00 00 	lea    0x66a3(%rip),%rdi        # 40a578 <dlerror@plt+0x88e8>
  403ed5:	31 c0                	xor    %eax,%eax
  403ed7:	e8 d4 06 00 00       	call   4045b0 <dlerror@plt+0x2920>
  403edc:	e9 83 fe ff ff       	jmp    403d64 <dlerror@plt+0x20d4>
  403ee1:	e8 aa dd ff ff       	call   401c90 <dlerror@plt>
  403ee6:	48 8d 3d 53 6f 00 00 	lea    0x6f53(%rip),%rdi        # 40ae40 <dlerror@plt+0x91b0>
  403eed:	48 89 c2             	mov    %rax,%rdx
  403ef0:	48 89 ee             	mov    %rbp,%rsi
  403ef3:	31 c0                	xor    %eax,%eax
  403ef5:	e8 f6 05 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403efa:	eb b4                	jmp    403eb0 <dlerror@plt+0x2220>
  403efc:	e8 8f dd ff ff       	call   401c90 <dlerror@plt>
  403f01:	48 8d 3d 68 6f 00 00 	lea    0x6f68(%rip),%rdi        # 40ae70 <dlerror@plt+0x91e0>
  403f08:	48 89 c2             	mov    %rax,%rdx
  403f0b:	4c 89 e6             	mov    %r12,%rsi
  403f0e:	31 c0                	xor    %eax,%eax
  403f10:	e8 db 05 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403f15:	eb 99                	jmp    403eb0 <dlerror@plt+0x2220>
  403f17:	e8 74 dd ff ff       	call   401c90 <dlerror@plt>
  403f1c:	48 8d 35 04 70 00 00 	lea    0x7004(%rip),%rsi        # 40af27 <dlerror@plt+0x9297>
  403f23:	48 8d 3d 76 6f 00 00 	lea    0x6f76(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  403f2a:	48 89 c2             	mov    %rax,%rdx
  403f2d:	31 c0                	xor    %eax,%eax
  403f2f:	e8 bc 05 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403f34:	e9 77 ff ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  403f39:	e8 52 dd ff ff       	call   401c90 <dlerror@plt>
  403f3e:	48 8d 35 f3 6f 00 00 	lea    0x6ff3(%rip),%rsi        # 40af38 <dlerror@plt+0x92a8>
  403f45:	48 8d 3d 54 6f 00 00 	lea    0x6f54(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  403f4c:	48 89 c2             	mov    %rax,%rdx
  403f4f:	31 c0                	xor    %eax,%eax
  403f51:	e8 9a 05 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403f56:	e9 55 ff ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  403f5b:	e8 30 dd ff ff       	call   401c90 <dlerror@plt>
  403f60:	48 8d 35 e4 6f 00 00 	lea    0x6fe4(%rip),%rsi        # 40af4b <dlerror@plt+0x92bb>
  403f67:	48 8d 3d 32 6f 00 00 	lea    0x6f32(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  403f6e:	48 89 c2             	mov    %rax,%rdx
  403f71:	31 c0                	xor    %eax,%eax
  403f73:	e8 78 05 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403f78:	e9 33 ff ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  403f7d:	e8 0e dd ff ff       	call   401c90 <dlerror@plt>
  403f82:	48 8d 35 de 6f 00 00 	lea    0x6fde(%rip),%rsi        # 40af67 <dlerror@plt+0x92d7>
  403f89:	48 8d 3d 10 6f 00 00 	lea    0x6f10(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  403f90:	48 89 c2             	mov    %rax,%rdx
  403f93:	31 c0                	xor    %eax,%eax
  403f95:	e8 56 05 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403f9a:	e9 11 ff ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  403f9f:	e8 ec dc ff ff       	call   401c90 <dlerror@plt>
  403fa4:	48 8d 35 af 6f 00 00 	lea    0x6faf(%rip),%rsi        # 40af5a <dlerror@plt+0x92ca>
  403fab:	48 8d 3d ee 6e 00 00 	lea    0x6eee(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  403fb2:	48 89 c2             	mov    %rax,%rdx
  403fb5:	31 c0                	xor    %eax,%eax
  403fb7:	e8 34 05 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403fbc:	e9 ef fe ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  403fc1:	e8 ca dc ff ff       	call   401c90 <dlerror@plt>
  403fc6:	48 8d 35 f3 6f 00 00 	lea    0x6ff3(%rip),%rsi        # 40afc0 <dlerror@plt+0x9330>
  403fcd:	48 8d 3d cc 6e 00 00 	lea    0x6ecc(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  403fd4:	48 89 c2             	mov    %rax,%rdx
  403fd7:	31 c0                	xor    %eax,%eax
  403fd9:	e8 12 05 00 00       	call   4044f0 <dlerror@plt+0x2860>
  403fde:	e9 cd fe ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  403fe3:	e8 a8 dc ff ff       	call   401c90 <dlerror@plt>
  403fe8:	48 8d 35 ad 6f 00 00 	lea    0x6fad(%rip),%rsi        # 40af9c <dlerror@plt+0x930c>
  403fef:	48 8d 3d aa 6e 00 00 	lea    0x6eaa(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  403ff6:	48 89 c2             	mov    %rax,%rdx
  403ff9:	31 c0                	xor    %eax,%eax
  403ffb:	e8 f0 04 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404000:	e9 ab fe ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  404005:	e8 86 dc ff ff       	call   401c90 <dlerror@plt>
  40400a:	48 8d 35 a0 6f 00 00 	lea    0x6fa0(%rip),%rsi        # 40afb1 <dlerror@plt+0x9321>
  404011:	48 8d 3d 88 6e 00 00 	lea    0x6e88(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  404018:	48 89 c2             	mov    %rax,%rdx
  40401b:	31 c0                	xor    %eax,%eax
  40401d:	e8 ce 04 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404022:	e9 89 fe ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  404027:	e8 64 dc ff ff       	call   401c90 <dlerror@plt>
  40402c:	48 8d 35 ab 6f 00 00 	lea    0x6fab(%rip),%rsi        # 40afde <dlerror@plt+0x934e>
  404033:	48 8d 3d 66 6e 00 00 	lea    0x6e66(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  40403a:	48 89 c2             	mov    %rax,%rdx
  40403d:	31 c0                	xor    %eax,%eax
  40403f:	e8 ac 04 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404044:	e9 67 fe ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  404049:	e8 42 dc ff ff       	call   401c90 <dlerror@plt>
  40404e:	48 8d 35 9b 6f 00 00 	lea    0x6f9b(%rip),%rsi        # 40aff0 <dlerror@plt+0x9360>
  404055:	48 8d 3d 44 6e 00 00 	lea    0x6e44(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  40405c:	48 89 c2             	mov    %rax,%rdx
  40405f:	31 c0                	xor    %eax,%eax
  404061:	e8 8a 04 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404066:	e9 45 fe ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  40406b:	e8 20 dc ff ff       	call   401c90 <dlerror@plt>
  404070:	48 8d 35 57 6f 00 00 	lea    0x6f57(%rip),%rsi        # 40afce <dlerror@plt+0x933e>
  404077:	48 8d 3d 22 6e 00 00 	lea    0x6e22(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  40407e:	48 89 c2             	mov    %rax,%rdx
  404081:	31 c0                	xor    %eax,%eax
  404083:	e8 68 04 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404088:	e9 23 fe ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  40408d:	e8 fe db ff ff       	call   401c90 <dlerror@plt>
  404092:	48 8d 35 81 6f 00 00 	lea    0x6f81(%rip),%rsi        # 40b01a <dlerror@plt+0x938a>
  404099:	48 8d 3d 00 6e 00 00 	lea    0x6e00(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  4040a0:	48 89 c2             	mov    %rax,%rdx
  4040a3:	31 c0                	xor    %eax,%eax
  4040a5:	e8 46 04 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4040aa:	e9 01 fe ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  4040af:	e8 dc db ff ff       	call   401c90 <dlerror@plt>
  4040b4:	48 8d 35 71 6f 00 00 	lea    0x6f71(%rip),%rsi        # 40b02c <dlerror@plt+0x939c>
  4040bb:	48 8d 3d de 6d 00 00 	lea    0x6dde(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  4040c2:	48 89 c2             	mov    %rax,%rdx
  4040c5:	31 c0                	xor    %eax,%eax
  4040c7:	e8 24 04 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4040cc:	e9 df fd ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  4040d1:	e8 ba db ff ff       	call   401c90 <dlerror@plt>
  4040d6:	48 8d 35 29 6f 00 00 	lea    0x6f29(%rip),%rsi        # 40b006 <dlerror@plt+0x9376>
  4040dd:	48 8d 3d bc 6d 00 00 	lea    0x6dbc(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  4040e4:	48 89 c2             	mov    %rax,%rdx
  4040e7:	31 c0                	xor    %eax,%eax
  4040e9:	e8 02 04 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4040ee:	e9 bd fd ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  4040f3:	e8 98 db ff ff       	call   401c90 <dlerror@plt>
  4040f8:	48 8d 35 5e 6f 00 00 	lea    0x6f5e(%rip),%rsi        # 40b05d <dlerror@plt+0x93cd>
  4040ff:	48 8d 3d 9a 6d 00 00 	lea    0x6d9a(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  404106:	48 89 c2             	mov    %rax,%rdx
  404109:	31 c0                	xor    %eax,%eax
  40410b:	e8 e0 03 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404110:	e9 9b fd ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  404115:	e8 76 db ff ff       	call   401c90 <dlerror@plt>
  40411a:	48 8d 35 20 6f 00 00 	lea    0x6f20(%rip),%rsi        # 40b041 <dlerror@plt+0x93b1>
  404121:	48 8d 3d 78 6d 00 00 	lea    0x6d78(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  404128:	48 89 c2             	mov    %rax,%rdx
  40412b:	31 c0                	xor    %eax,%eax
  40412d:	e8 be 03 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404132:	e9 79 fd ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  404137:	e8 54 db ff ff       	call   401c90 <dlerror@plt>
  40413c:	48 8d 35 0e 6f 00 00 	lea    0x6f0e(%rip),%rsi        # 40b051 <dlerror@plt+0x93c1>
  404143:	48 8d 3d 56 6d 00 00 	lea    0x6d56(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  40414a:	48 89 c2             	mov    %rax,%rdx
  40414d:	31 c0                	xor    %eax,%eax
  40414f:	e8 9c 03 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404154:	e9 57 fd ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  404159:	e8 32 db ff ff       	call   401c90 <dlerror@plt>
  40415e:	48 8d 35 12 6f 00 00 	lea    0x6f12(%rip),%rsi        # 40b077 <dlerror@plt+0x93e7>
  404165:	48 8d 3d 34 6d 00 00 	lea    0x6d34(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  40416c:	48 89 c2             	mov    %rax,%rdx
  40416f:	31 c0                	xor    %eax,%eax
  404171:	e8 7a 03 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404176:	e9 35 fd ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  40417b:	e8 10 db ff ff       	call   401c90 <dlerror@plt>
  404180:	48 8d 35 e2 6e 00 00 	lea    0x6ee2(%rip),%rsi        # 40b069 <dlerror@plt+0x93d9>
  404187:	48 8d 3d 12 6d 00 00 	lea    0x6d12(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  40418e:	48 89 c2             	mov    %rax,%rdx
  404191:	31 c0                	xor    %eax,%eax
  404193:	e8 58 03 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404198:	e9 13 fd ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  40419d:	e8 ee da ff ff       	call   401c90 <dlerror@plt>
  4041a2:	48 8d 35 53 6f 00 00 	lea    0x6f53(%rip),%rsi        # 40b0fc <dlerror@plt+0x946c>
  4041a9:	48 8d 3d f0 6c 00 00 	lea    0x6cf0(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  4041b0:	48 89 c2             	mov    %rax,%rdx
  4041b3:	31 c0                	xor    %eax,%eax
  4041b5:	e8 36 03 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4041ba:	e9 f1 fc ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  4041bf:	e8 cc da ff ff       	call   401c90 <dlerror@plt>
  4041c4:	48 8d 35 cf 6e 00 00 	lea    0x6ecf(%rip),%rsi        # 40b09a <dlerror@plt+0x940a>
  4041cb:	48 8d 3d ce 6c 00 00 	lea    0x6cce(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  4041d2:	48 89 c2             	mov    %rax,%rdx
  4041d5:	31 c0                	xor    %eax,%eax
  4041d7:	e8 14 03 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4041dc:	e9 cf fc ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  4041e1:	e8 aa da ff ff       	call   401c90 <dlerror@plt>
  4041e6:	48 8d 35 f1 6e 00 00 	lea    0x6ef1(%rip),%rsi        # 40b0de <dlerror@plt+0x944e>
  4041ed:	48 8d 3d ac 6c 00 00 	lea    0x6cac(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  4041f4:	48 89 c2             	mov    %rax,%rdx
  4041f7:	31 c0                	xor    %eax,%eax
  4041f9:	e8 f2 02 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4041fe:	e9 ad fc ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  404203:	e8 88 da ff ff       	call   401c90 <dlerror@plt>
  404208:	48 8d 35 be 6e 00 00 	lea    0x6ebe(%rip),%rsi        # 40b0cd <dlerror@plt+0x943d>
  40420f:	48 8d 3d 8a 6c 00 00 	lea    0x6c8a(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  404216:	48 89 c2             	mov    %rax,%rdx
  404219:	31 c0                	xor    %eax,%eax
  40421b:	e8 d0 02 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404220:	e9 8b fc ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  404225:	e8 66 da ff ff       	call   401c90 <dlerror@plt>
  40422a:	48 8d 35 8e 6e 00 00 	lea    0x6e8e(%rip),%rsi        # 40b0bf <dlerror@plt+0x942f>
  404231:	48 8d 3d 68 6c 00 00 	lea    0x6c68(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  404238:	48 89 c2             	mov    %rax,%rdx
  40423b:	31 c0                	xor    %eax,%eax
  40423d:	e8 ae 02 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404242:	e9 69 fc ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  404247:	e8 44 da ff ff       	call   401c90 <dlerror@plt>
  40424c:	48 8d 35 b4 6e 00 00 	lea    0x6eb4(%rip),%rsi        # 40b107 <dlerror@plt+0x9477>
  404253:	48 8d 3d 46 6c 00 00 	lea    0x6c46(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  40425a:	48 89 c2             	mov    %rax,%rdx
  40425d:	31 c0                	xor    %eax,%eax
  40425f:	e8 8c 02 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404264:	e9 47 fc ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  404269:	e8 22 da ff ff       	call   401c90 <dlerror@plt>
  40426e:	48 8d 35 05 6d 00 00 	lea    0x6d05(%rip),%rsi        # 40af7a <dlerror@plt+0x92ea>
  404275:	48 8d 3d 24 6c 00 00 	lea    0x6c24(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  40427c:	48 89 c2             	mov    %rax,%rdx
  40427f:	31 c0                	xor    %eax,%eax
  404281:	e8 6a 02 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404286:	e9 25 fc ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  40428b:	e8 00 da ff ff       	call   401c90 <dlerror@plt>
  404290:	48 8d 35 f5 6d 00 00 	lea    0x6df5(%rip),%rsi        # 40b08c <dlerror@plt+0x93fc>
  404297:	48 8d 3d 02 6c 00 00 	lea    0x6c02(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  40429e:	48 89 c2             	mov    %rax,%rdx
  4042a1:	31 c0                	xor    %eax,%eax
  4042a3:	e8 48 02 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4042a8:	e9 03 fc ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  4042ad:	e8 de d9 ff ff       	call   401c90 <dlerror@plt>
  4042b2:	48 8d 35 36 6e 00 00 	lea    0x6e36(%rip),%rsi        # 40b0ef <dlerror@plt+0x945f>
  4042b9:	48 8d 3d e0 6b 00 00 	lea    0x6be0(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  4042c0:	48 89 c2             	mov    %rax,%rdx
  4042c3:	31 c0                	xor    %eax,%eax
  4042c5:	e8 26 02 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4042ca:	e9 e1 fb ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  4042cf:	e8 bc d9 ff ff       	call   401c90 <dlerror@plt>
  4042d4:	48 8d 35 43 6e 00 00 	lea    0x6e43(%rip),%rsi        # 40b11e <dlerror@plt+0x948e>
  4042db:	48 8d 3d be 6b 00 00 	lea    0x6bbe(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  4042e2:	48 89 c2             	mov    %rax,%rdx
  4042e5:	31 c0                	xor    %eax,%eax
  4042e7:	e8 04 02 00 00       	call   4044f0 <dlerror@plt+0x2860>
  4042ec:	e9 bf fb ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  4042f1:	e8 9a d9 ff ff       	call   401c90 <dlerror@plt>
  4042f6:	48 8d 35 2a 6e 00 00 	lea    0x6e2a(%rip),%rsi        # 40b127 <dlerror@plt+0x9497>
  4042fd:	48 8d 3d d4 6b 00 00 	lea    0x6bd4(%rip),%rdi        # 40aed8 <dlerror@plt+0x9248>
  404304:	48 89 c2             	mov    %rax,%rdx
  404307:	31 c0                	xor    %eax,%eax
  404309:	e8 e2 01 00 00       	call   4044f0 <dlerror@plt+0x2860>
  40430e:	e9 9d fb ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  404313:	e8 78 d9 ff ff       	call   401c90 <dlerror@plt>
  404318:	48 8d 35 10 6e 00 00 	lea    0x6e10(%rip),%rsi        # 40b12f <dlerror@plt+0x949f>
  40431f:	48 8d 3d b2 6b 00 00 	lea    0x6bb2(%rip),%rdi        # 40aed8 <dlerror@plt+0x9248>
  404326:	48 89 c2             	mov    %rax,%rdx
  404329:	31 c0                	xor    %eax,%eax
  40432b:	e8 c0 01 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404330:	e9 7b fb ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  404335:	e8 c6 d5 ff ff       	call   401900 <__stack_chk_fail@plt>
  40433a:	e8 51 d9 ff ff       	call   401c90 <dlerror@plt>
  40433f:	48 8d 35 c9 6b 00 00 	lea    0x6bc9(%rip),%rsi        # 40af0f <dlerror@plt+0x927f>
  404346:	48 8d 3d 53 6b 00 00 	lea    0x6b53(%rip),%rdi        # 40aea0 <dlerror@plt+0x9210>
  40434d:	48 89 c2             	mov    %rax,%rdx
  404350:	31 c0                	xor    %eax,%eax
  404352:	e8 99 01 00 00       	call   4044f0 <dlerror@plt+0x2860>
  404357:	e9 54 fb ff ff       	jmp    403eb0 <dlerror@plt+0x2220>
  40435c:	0f 1f 40 00          	nopl   0x0(%rax)
  404360:	41 55                	push   %r13
  404362:	41 54                	push   %r12
  404364:	49 89 fd             	mov    %rdi,%r13
  404367:	55                   	push   %rbp
  404368:	53                   	push   %rbx
  404369:	48 89 f5             	mov    %rsi,%rbp
  40436c:	49 89 d4             	mov    %rdx,%r12
  40436f:	48 81 ec 18 10 00 00 	sub    $0x1018,%rsp
  404376:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40437d:	00 00 
  40437f:	48 89 84 24 08 10 00 	mov    %rax,0x1008(%rsp)
  404386:	00 
  404387:	31 c0                	xor    %eax,%eax
  404389:	48 89 e3             	mov    %rsp,%rbx
  40438c:	e8 0f d5 ff ff       	call   4018a0 <getpid@plt>
  404391:	48 83 ec 08          	sub    $0x8,%rsp
  404395:	4c 8d 05 a8 6d 00 00 	lea    0x6da8(%rip),%r8        # 40b144 <dlerror@plt+0x94b4>
  40439c:	41 89 c1             	mov    %eax,%r9d
  40439f:	41 55                	push   %r13
  4043a1:	b9 00 10 00 00       	mov    $0x1000,%ecx
  4043a6:	ba 01 00 00 00       	mov    $0x1,%edx
  4043ab:	31 c0                	xor    %eax,%eax
  4043ad:	be 00 10 00 00       	mov    $0x1000,%esi
  4043b2:	48 89 df             	mov    %rbx,%rdi
  4043b5:	e8 e6 d3 ff ff       	call   4017a0 <__snprintf_chk@plt>
  4043ba:	85 c0                	test   %eax,%eax
  4043bc:	5a                   	pop    %rdx
  4043bd:	59                   	pop    %rcx
  4043be:	78 60                	js     404420 <dlerror@plt+0x2790>
  4043c0:	48 63 f8             	movslq %eax,%rdi
  4043c3:	be 00 10 00 00       	mov    $0x1000,%esi
  4043c8:	48 01 df             	add    %rbx,%rdi
  4043cb:	29 c6                	sub    %eax,%esi
  4043cd:	b8 00 00 00 00       	mov    $0x0,%eax
  4043d2:	0f 48 f0             	cmovs  %eax,%esi
  4043d5:	48 63 f6             	movslq %esi,%rsi
  4043d8:	4d 89 e1             	mov    %r12,%r9
  4043db:	49 89 e8             	mov    %rbp,%r8
  4043de:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4043e5:	ba 01 00 00 00       	mov    $0x1,%edx
  4043ea:	e8 31 d7 ff ff       	call   401b20 <__vsnprintf_chk@plt>
  4043ef:	48 8b 35 ea ae 20 00 	mov    0x20aeea(%rip),%rsi        # 60f2e0 <stderr@GLIBC_2.2.5>
  4043f6:	48 89 df             	mov    %rbx,%rdi
  4043f9:	e8 72 d5 ff ff       	call   401970 <fputs@plt>
  4043fe:	48 8b 84 24 08 10 00 	mov    0x1008(%rsp),%rax
  404405:	00 
  404406:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40440d:	00 00 
  40440f:	75 19                	jne    40442a <dlerror@plt+0x279a>
  404411:	48 81 c4 18 10 00 00 	add    $0x1018,%rsp
  404418:	5b                   	pop    %rbx
  404419:	5d                   	pop    %rbp
  40441a:	41 5c                	pop    %r12
  40441c:	41 5d                	pop    %r13
  40441e:	c3                   	ret
  40441f:	90                   	nop
  404420:	be 00 10 00 00       	mov    $0x1000,%esi
  404425:	48 89 df             	mov    %rbx,%rdi
  404428:	eb ae                	jmp    4043d8 <dlerror@plt+0x2748>
  40442a:	e8 d1 d4 ff ff       	call   401900 <__stack_chk_fail@plt>
  40442f:	90                   	nop
  404430:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
  404437:	84 c0                	test   %al,%al
  404439:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
  40443e:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
  404443:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  404448:	4c 89 44 24 40       	mov    %r8,0x40(%rsp)
  40444d:	4c 89 4c 24 48       	mov    %r9,0x48(%rsp)
  404452:	74 37                	je     40448b <dlerror@plt+0x27fb>
  404454:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  404459:	0f 29 4c 24 60       	movaps %xmm1,0x60(%rsp)
  40445e:	0f 29 54 24 70       	movaps %xmm2,0x70(%rsp)
  404463:	0f 29 9c 24 80 00 00 	movaps %xmm3,0x80(%rsp)
  40446a:	00 
  40446b:	0f 29 a4 24 90 00 00 	movaps %xmm4,0x90(%rsp)
  404472:	00 
  404473:	0f 29 ac 24 a0 00 00 	movaps %xmm5,0xa0(%rsp)
  40447a:	00 
  40447b:	0f 29 b4 24 b0 00 00 	movaps %xmm6,0xb0(%rsp)
  404482:	00 
  404483:	0f 29 bc 24 c0 00 00 	movaps %xmm7,0xc0(%rsp)
  40448a:	00 
  40448b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  404492:	00 00 
  404494:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  404499:	31 c0                	xor    %eax,%eax
  40449b:	48 8d 84 24 e0 00 00 	lea    0xe0(%rsp),%rax
  4044a2:	00 
  4044a3:	48 89 fe             	mov    %rdi,%rsi
  4044a6:	48 8d 3d a4 6c 00 00 	lea    0x6ca4(%rip),%rdi        # 40b151 <dlerror@plt+0x94c1>
  4044ad:	48 89 e2             	mov    %rsp,%rdx
  4044b0:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4044b5:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
  4044ba:	c7 04 24 08 00 00 00 	movl   $0x8,(%rsp)
  4044c1:	c7 44 24 04 30 00 00 	movl   $0x30,0x4(%rsp)
  4044c8:	00 
  4044c9:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  4044ce:	e8 8d fe ff ff       	call   404360 <dlerror@plt+0x26d0>
  4044d3:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  4044d8:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4044df:	00 00 
  4044e1:	75 08                	jne    4044eb <dlerror@plt+0x285b>
  4044e3:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
  4044ea:	c3                   	ret
  4044eb:	e8 10 d4 ff ff       	call   401900 <__stack_chk_fail@plt>
  4044f0:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
  4044f7:	84 c0                	test   %al,%al
  4044f9:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
  4044fe:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
  404503:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  404508:	4c 89 44 24 40       	mov    %r8,0x40(%rsp)
  40450d:	4c 89 4c 24 48       	mov    %r9,0x48(%rsp)
  404512:	74 37                	je     40454b <dlerror@plt+0x28bb>
  404514:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  404519:	0f 29 4c 24 60       	movaps %xmm1,0x60(%rsp)
  40451e:	0f 29 54 24 70       	movaps %xmm2,0x70(%rsp)
  404523:	0f 29 9c 24 80 00 00 	movaps %xmm3,0x80(%rsp)
  40452a:	00 
  40452b:	0f 29 a4 24 90 00 00 	movaps %xmm4,0x90(%rsp)
  404532:	00 
  404533:	0f 29 ac 24 a0 00 00 	movaps %xmm5,0xa0(%rsp)
  40453a:	00 
  40453b:	0f 29 b4 24 b0 00 00 	movaps %xmm6,0xb0(%rsp)
  404542:	00 
  404543:	0f 29 bc 24 c0 00 00 	movaps %xmm7,0xc0(%rsp)
  40454a:	00 
  40454b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  404552:	00 00 
  404554:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  404559:	31 c0                	xor    %eax,%eax
  40455b:	48 8d 84 24 e0 00 00 	lea    0xe0(%rsp),%rax
  404562:	00 
  404563:	48 89 fe             	mov    %rdi,%rsi
  404566:	48 8d 3d ec 6b 00 00 	lea    0x6bec(%rip),%rdi        # 40b159 <dlerror@plt+0x94c9>
  40456d:	48 89 e2             	mov    %rsp,%rdx
  404570:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  404575:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
  40457a:	c7 04 24 08 00 00 00 	movl   $0x8,(%rsp)
  404581:	c7 44 24 04 30 00 00 	movl   $0x30,0x4(%rsp)
  404588:	00 
  404589:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  40458e:	e8 cd fd ff ff       	call   404360 <dlerror@plt+0x26d0>
  404593:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  404598:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40459f:	00 00 
  4045a1:	75 08                	jne    4045ab <dlerror@plt+0x291b>
  4045a3:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
  4045aa:	c3                   	ret
  4045ab:	e8 50 d3 ff ff       	call   401900 <__stack_chk_fail@plt>
  4045b0:	41 57                	push   %r15
  4045b2:	41 56                	push   %r14
  4045b4:	49 89 d7             	mov    %rdx,%r15
  4045b7:	41 55                	push   %r13
  4045b9:	41 54                	push   %r12
  4045bb:	49 89 fd             	mov    %rdi,%r13
  4045be:	55                   	push   %rbp
  4045bf:	53                   	push   %rbx
  4045c0:	41 89 f6             	mov    %esi,%r14d
  4045c3:	48 81 ec f8 10 00 00 	sub    $0x10f8,%rsp
  4045ca:	84 c0                	test   %al,%al
  4045cc:	48 89 8c 24 58 10 00 	mov    %rcx,0x1058(%rsp)
  4045d3:	00 
  4045d4:	4c 89 84 24 60 10 00 	mov    %r8,0x1060(%rsp)
  4045db:	00 
  4045dc:	4c 89 8c 24 68 10 00 	mov    %r9,0x1068(%rsp)
  4045e3:	00 
  4045e4:	74 40                	je     404626 <dlerror@plt+0x2996>
  4045e6:	0f 29 84 24 70 10 00 	movaps %xmm0,0x1070(%rsp)
  4045ed:	00 
  4045ee:	0f 29 8c 24 80 10 00 	movaps %xmm1,0x1080(%rsp)
  4045f5:	00 
  4045f6:	0f 29 94 24 90 10 00 	movaps %xmm2,0x1090(%rsp)
  4045fd:	00 
  4045fe:	0f 29 9c 24 a0 10 00 	movaps %xmm3,0x10a0(%rsp)
  404605:	00 
  404606:	0f 29 a4 24 b0 10 00 	movaps %xmm4,0x10b0(%rsp)
  40460d:	00 
  40460e:	0f 29 ac 24 c0 10 00 	movaps %xmm5,0x10c0(%rsp)
  404615:	00 
  404616:	0f 29 b4 24 d0 10 00 	movaps %xmm6,0x10d0(%rsp)
  40461d:	00 
  40461e:	0f 29 bc 24 e0 10 00 	movaps %xmm7,0x10e0(%rsp)
  404625:	00 
  404626:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
  40462b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  404632:	00 00 
  404634:	48 89 84 24 38 10 00 	mov    %rax,0x1038(%rsp)
  40463b:	00 
  40463c:	31 c0                	xor    %eax,%eax
  40463e:	e8 5d d2 ff ff       	call   4018a0 <getpid@plt>
  404643:	4c 8d 05 15 6b 00 00 	lea    0x6b15(%rip),%r8        # 40b15f <dlerror@plt+0x94cf>
  40464a:	41 89 c1             	mov    %eax,%r9d
  40464d:	b9 00 10 00 00       	mov    $0x1000,%ecx
  404652:	ba 01 00 00 00       	mov    $0x1,%edx
  404657:	be 00 10 00 00       	mov    $0x1000,%esi
  40465c:	48 89 ef             	mov    %rbp,%rdi
  40465f:	31 c0                	xor    %eax,%eax
  404661:	e8 3a d1 ff ff       	call   4017a0 <__snprintf_chk@plt>
  404666:	41 ba 00 10 00 00    	mov    $0x1000,%r10d
  40466c:	48 63 d8             	movslq %eax,%rbx
  40466f:	4c 8d 4c 24 18       	lea    0x18(%rsp),%r9
  404674:	41 29 c2             	sub    %eax,%r10d
  404677:	48 8d 84 24 30 11 00 	lea    0x1130(%rsp),%rax
  40467e:	00 
  40467f:	48 01 eb             	add    %rbp,%rbx
  404682:	4d 63 e2             	movslq %r10d,%r12
  404685:	4d 89 f8             	mov    %r15,%r8
  404688:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40468f:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
  404694:	48 8d 84 24 40 10 00 	lea    0x1040(%rsp),%rax
  40469b:	00 
  40469c:	ba 01 00 00 00       	mov    $0x1,%edx
  4046a1:	4c 89 e6             	mov    %r12,%rsi
  4046a4:	48 89 df             	mov    %rbx,%rdi
  4046a7:	44 89 54 24 0c       	mov    %r10d,0xc(%rsp)
  4046ac:	c7 44 24 18 18 00 00 	movl   $0x18,0x18(%rsp)
  4046b3:	00 
  4046b4:	c7 44 24 1c 30 00 00 	movl   $0x30,0x1c(%rsp)
  4046bb:	00 
  4046bc:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  4046c1:	e8 5a d4 ff ff       	call   401b20 <__vsnprintf_chk@plt>
  4046c6:	85 c0                	test   %eax,%eax
  4046c8:	78 1a                	js     4046e4 <dlerror@plt+0x2a54>
  4046ca:	44 8b 54 24 0c       	mov    0xc(%rsp),%r10d
  4046cf:	48 63 d0             	movslq %eax,%rdx
  4046d2:	48 01 d3             	add    %rdx,%rbx
  4046d5:	41 29 c2             	sub    %eax,%r10d
  4046d8:	b8 00 00 00 00       	mov    $0x0,%eax
  4046dd:	44 0f 48 d0          	cmovs  %eax,%r10d
  4046e1:	4d 63 e2             	movslq %r10d,%r12
  4046e4:	44 89 f7             	mov    %r14d,%edi
  4046e7:	e8 74 d5 ff ff       	call   401c60 <strerror@plt>
  4046ec:	48 83 ec 08          	sub    $0x8,%rsp
  4046f0:	4c 8d 05 78 6a 00 00 	lea    0x6a78(%rip),%r8        # 40b16f <dlerror@plt+0x94df>
  4046f7:	ba 01 00 00 00       	mov    $0x1,%edx
  4046fc:	50                   	push   %rax
  4046fd:	4d 89 e9             	mov    %r13,%r9
  404700:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  404707:	4c 89 e6             	mov    %r12,%rsi
  40470a:	48 89 df             	mov    %rbx,%rdi
  40470d:	31 c0                	xor    %eax,%eax
  40470f:	e8 8c d0 ff ff       	call   4017a0 <__snprintf_chk@plt>
  404714:	48 8b 35 c5 ab 20 00 	mov    0x20abc5(%rip),%rsi        # 60f2e0 <stderr@GLIBC_2.2.5>
  40471b:	48 89 ef             	mov    %rbp,%rdi
  40471e:	e8 4d d2 ff ff       	call   401970 <fputs@plt>
  404723:	58                   	pop    %rax
  404724:	5a                   	pop    %rdx
  404725:	48 8b 84 24 38 10 00 	mov    0x1038(%rsp),%rax
  40472c:	00 
  40472d:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  404734:	00 00 
  404736:	75 12                	jne    40474a <dlerror@plt+0x2aba>
  404738:	48 81 c4 f8 10 00 00 	add    $0x10f8,%rsp
  40473f:	5b                   	pop    %rbx
  404740:	5d                   	pop    %rbp
  404741:	41 5c                	pop    %r12
  404743:	41 5d                	pop    %r13
  404745:	41 5e                	pop    %r14
  404747:	41 5f                	pop    %r15
  404749:	c3                   	ret
  40474a:	e8 b1 d1 ff ff       	call   401900 <__stack_chk_fail@plt>
  40474f:	90                   	nop
  404750:	41 57                	push   %r15
  404752:	41 56                	push   %r14
  404754:	41 55                	push   %r13
  404756:	41 54                	push   %r12
  404758:	55                   	push   %rbp
  404759:	53                   	push   %rbx
  40475a:	48 81 ec 38 10 00 00 	sub    $0x1038,%rsp
  404761:	48 8b af 40 30 00 00 	mov    0x3040(%rdi),%rbp
  404768:	48 8b 9f 20 20 00 00 	mov    0x2020(%rdi),%rbx
  40476f:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
  404774:	48 8d 3d fc 69 00 00 	lea    0x69fc(%rip),%rdi        # 40b177 <dlerror@plt+0x94e7>
  40477b:	64 48 8b 0c 25 28 00 	mov    %fs:0x28,%rcx
  404782:	00 00 
  404784:	48 89 8c 24 28 10 00 	mov    %rcx,0x1028(%rsp)
  40478b:	00 
  40478c:	31 c9                	xor    %ecx,%ecx
  40478e:	ff 95 e8 00 00 00    	call   *0xe8(%rbp)
  404794:	48 85 c0             	test   %rax,%rax
  404797:	48 89 04 24          	mov    %rax,(%rsp)
  40479b:	0f 84 e5 01 00 00    	je     404986 <dlerror@plt+0x2cf6>
  4047a1:	48 8b 3c 24          	mov    (%rsp),%rdi
  4047a5:	ff 95 18 01 00 00    	call   *0x118(%rbp)
  4047ab:	48 85 c0             	test   %rax,%rax
  4047ae:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  4047b3:	0f 84 b7 01 00 00    	je     404970 <dlerror@plt+0x2ce0>
  4047b9:	4c 8b b3 08 10 00 00 	mov    0x1008(%rbx),%r14
  4047c0:	4c 3b b3 10 10 00 00 	cmp    0x1010(%rbx),%r14
  4047c7:	0f 83 2b 01 00 00    	jae    4048f8 <dlerror@plt+0x2c68>
  4047cd:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
  4047d2:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4047d7:	eb 22                	jmp    4047fb <dlerror@plt+0x2b6b>
  4047d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4047e0:	4c 89 f6             	mov    %r14,%rsi
  4047e3:	48 89 df             	mov    %rbx,%rdi
  4047e6:	e8 75 d9 ff ff       	call   402160 <dlerror@plt+0x4d0>
  4047eb:	48 39 83 10 10 00 00 	cmp    %rax,0x1010(%rbx)
  4047f2:	49 89 c6             	mov    %rax,%r14
  4047f5:	0f 86 fd 00 00 00    	jbe    4048f8 <dlerror@plt+0x2c68>
  4047fb:	41 80 7e 11 73       	cmpb   $0x73,0x11(%r14)
  404800:	75 de                	jne    4047e0 <dlerror@plt+0x2b50>
  404802:	4c 89 f6             	mov    %r14,%rsi
  404805:	48 89 df             	mov    %rbx,%rdi
  404808:	e8 63 d9 ff ff       	call   402170 <dlerror@plt+0x4e0>
  40480d:	48 85 c0             	test   %rax,%rax
  404810:	49 89 c4             	mov    %rax,%r12
  404813:	0f 84 0f 01 00 00    	je     404928 <dlerror@plt+0x2c98>
  404819:	4d 8d 7e 12          	lea    0x12(%r14),%r15
  40481d:	4c 8d 05 5c 69 00 00 	lea    0x695c(%rip),%r8        # 40b180 <dlerror@plt+0x94f0>
  404824:	b9 00 10 00 00       	mov    $0x1000,%ecx
  404829:	ba 01 00 00 00       	mov    $0x1,%edx
  40482e:	be 00 10 00 00       	mov    $0x1000,%esi
  404833:	41 57                	push   %r15
  404835:	6a 2f                	push   $0x2f
  404837:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  40483c:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  404841:	4c 8d 88 3b 20 00 00 	lea    0x203b(%rax),%r9
  404848:	31 c0                	xor    %eax,%eax
  40484a:	e8 51 cf ff ff       	call   4017a0 <__snprintf_chk@plt>
  40484f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  404854:	5a                   	pop    %rdx
  404855:	59                   	pop    %rcx
  404856:	0f 8f e1 00 00 00    	jg     40493d <dlerror@plt+0x2cad>
  40485c:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  404861:	ff 95 90 01 00 00    	call   *0x190(%rbp)
  404867:	49 89 c5             	mov    %rax,%r13
  40486a:	48 89 c2             	mov    %rax,%rdx
  40486d:	48 8d 35 16 69 00 00 	lea    0x6916(%rip),%rsi        # 40b18a <dlerror@plt+0x94fa>
  404874:	48 8b 3c 24          	mov    (%rsp),%rdi
  404878:	ff 95 38 01 00 00    	call   *0x138(%rbp)
  40487e:	4c 89 ef             	mov    %r13,%rdi
  404881:	ff 55 10             	call   *0x10(%rbp)
  404884:	41 8b 76 0c          	mov    0xc(%r14),%esi
  404888:	4c 89 e7             	mov    %r12,%rdi
  40488b:	ff 95 08 01 00 00    	call   *0x108(%rbp)
  404891:	4c 89 e7             	mov    %r12,%rdi
  404894:	49 89 c5             	mov    %rax,%r13
  404897:	e8 24 cf ff ff       	call   4017c0 <free@plt>
  40489c:	4d 85 ed             	test   %r13,%r13
  40489f:	0f 84 ad 00 00 00    	je     404952 <dlerror@plt+0x2cc2>
  4048a5:	4c 89 ea             	mov    %r13,%rdx
  4048a8:	48 8d 35 e4 68 00 00 	lea    0x68e4(%rip),%rsi        # 40b193 <dlerror@plt+0x9503>
  4048af:	48 8b 3c 24          	mov    (%rsp),%rdi
  4048b3:	ff 95 38 01 00 00    	call   *0x138(%rbp)
  4048b9:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  4048be:	4c 89 ef             	mov    %r13,%rdi
  4048c1:	48 89 f2             	mov    %rsi,%rdx
  4048c4:	ff 95 e0 00 00 00    	call   *0xe0(%rbp)
  4048ca:	48 85 c0             	test   %rax,%rax
  4048cd:	0f 85 0d ff ff ff    	jne    4047e0 <dlerror@plt+0x2b50>
  4048d3:	ff 95 d0 00 00 00    	call   *0xd0(%rbp)
  4048d9:	48 8d 3d a8 69 00 00 	lea    0x69a8(%rip),%rdi        # 40b288 <dlerror@plt+0x95f8>
  4048e0:	31 c0                	xor    %eax,%eax
  4048e2:	4c 89 fe             	mov    %r15,%rsi
  4048e5:	e8 06 fc ff ff       	call   4044f0 <dlerror@plt+0x2860>
  4048ea:	b8 01 00 00 00       	mov    $0x1,%eax
  4048ef:	eb 09                	jmp    4048fa <dlerror@plt+0x2c6a>
  4048f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4048f8:	31 c0                	xor    %eax,%eax
  4048fa:	48 8b 8c 24 28 10 00 	mov    0x1028(%rsp),%rcx
  404901:	00 
  404902:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  404909:	00 00 
  40490b:	0f 85 89 00 00 00    	jne    40499a <dlerror@plt+0x2d0a>
  404911:	48 81 c4 38 10 00 00 	add    $0x1038,%rsp
  404918:	5b                   	pop    %rbx
  404919:	5d                   	pop    %rbp
  40491a:	41 5c                	pop    %r12
  40491c:	41 5d                	pop    %r13
  40491e:	41 5e                	pop    %r14
  404920:	41 5f                	pop    %r15
  404922:	c3                   	ret
  404923:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  404928:	48 8d 3d d9 68 00 00 	lea    0x68d9(%rip),%rdi        # 40b208 <dlerror@plt+0x9578>
  40492f:	31 c0                	xor    %eax,%eax
  404931:	e8 ba fb ff ff       	call   4044f0 <dlerror@plt+0x2860>
  404936:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40493b:	eb bd                	jmp    4048fa <dlerror@plt+0x2c6a>
  40493d:	48 8d 3d ec 68 00 00 	lea    0x68ec(%rip),%rdi        # 40b230 <dlerror@plt+0x95a0>
  404944:	31 c0                	xor    %eax,%eax
  404946:	e8 a5 fb ff ff       	call   4044f0 <dlerror@plt+0x2860>
  40494b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  404950:	eb a8                	jmp    4048fa <dlerror@plt+0x2c6a>
  404952:	48 8d 3d 07 69 00 00 	lea    0x6907(%rip),%rdi        # 40b260 <dlerror@plt+0x95d0>
  404959:	31 c0                	xor    %eax,%eax
  40495b:	4c 89 fe             	mov    %r15,%rsi
  40495e:	e8 8d fb ff ff       	call   4044f0 <dlerror@plt+0x2860>
  404963:	ff 95 d0 00 00 00    	call   *0xd0(%rbp)
  404969:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40496e:	eb 8a                	jmp    4048fa <dlerror@plt+0x2c6a>
  404970:	48 8d 3d 69 68 00 00 	lea    0x6869(%rip),%rdi        # 40b1e0 <dlerror@plt+0x9550>
  404977:	e8 74 fb ff ff       	call   4044f0 <dlerror@plt+0x2860>
  40497c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  404981:	e9 74 ff ff ff       	jmp    4048fa <dlerror@plt+0x2c6a>
  404986:	48 8d 3d 33 68 00 00 	lea    0x6833(%rip),%rdi        # 40b1c0 <dlerror@plt+0x9530>
  40498d:	e8 5e fb ff ff       	call   4044f0 <dlerror@plt+0x2860>
  404992:	83 c8 ff             	or     $0xffffffff,%eax
  404995:	e9 60 ff ff ff       	jmp    4048fa <dlerror@plt+0x2c6a>
  40499a:	e8 61 cf ff ff       	call   401900 <__stack_chk_fail@plt>
  40499f:	90                   	nop
  4049a0:	41 57                	push   %r15
  4049a2:	41 56                	push   %r14
  4049a4:	b9 14 00 00 00       	mov    $0x14,%ecx
  4049a9:	41 55                	push   %r13
  4049ab:	41 54                	push   %r12
  4049ad:	55                   	push   %rbp
  4049ae:	53                   	push   %rbx
  4049af:	48 89 fd             	mov    %rdi,%rbp
  4049b2:	48 81 ec d8 30 00 00 	sub    $0x30d8,%rsp
  4049b9:	48 8b 9f 20 20 00 00 	mov    0x2020(%rdi),%rbx
  4049c0:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4049c7:	00 00 
  4049c9:	48 89 84 24 c8 30 00 	mov    %rax,0x30c8(%rsp)
  4049d0:	00 
  4049d1:	31 c0                	xor    %eax,%eax
  4049d3:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  4049d8:	4c 8b bb 08 10 00 00 	mov    0x1008(%rbx),%r15
  4049df:	4c 3b bb 10 10 00 00 	cmp    0x1010(%rbx),%r15
  4049e6:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
  4049eb:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4049ee:	0f 83 6d 02 00 00    	jae    404c61 <dlerror@plt+0x2fd1>
  4049f4:	48 8d 84 24 c0 20 00 	lea    0x20c0(%rsp),%rax
  4049fb:	00 
  4049fc:	4c 8d ac 24 c0 00 00 	lea    0xc0(%rsp),%r13
  404a03:	00 
  404a04:	48 89 04 24          	mov    %rax,(%rsp)
  404a08:	48 8d 84 24 c0 10 00 	lea    0x10c0(%rsp),%rax
  404a0f:	00 
  404a10:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  404a15:	e9 13 01 00 00       	jmp    404b2d <dlerror@plt+0x2e9d>
  404a1a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  404a20:	f6 c4 04             	test   $0x4,%ah
  404a23:	0f 84 e9 00 00 00    	je     404b12 <dlerror@plt+0x2e82>
  404a29:	49 8d 47 12          	lea    0x12(%r15),%rax
  404a2d:	48 8b 34 24          	mov    (%rsp),%rsi
  404a31:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  404a36:	48 89 c2             	mov    %rax,%rdx
  404a39:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  404a3e:	e8 8d 10 00 00       	call   405ad0 <dlerror@plt+0x3e40>
  404a43:	83 f8 ff             	cmp    $0xffffffff,%eax
  404a46:	0f 84 08 02 00 00    	je     404c54 <dlerror@plt+0x2fc4>
  404a4c:	4c 8b 24 24          	mov    (%rsp),%r12
  404a50:	48 8b bd 30 20 00 00 	mov    0x2030(%rbp),%rdi
  404a57:	48 85 ff             	test   %rdi,%rdi
  404a5a:	74 08                	je     404a64 <dlerror@plt+0x2dd4>
  404a5c:	4c 89 e6             	mov    %r12,%rsi
  404a5f:	e8 ac 49 00 00       	call   409410 <dlerror@plt+0x7780>
  404a64:	4c 8d b5 3b 20 00 00 	lea    0x203b(%rbp),%r14
  404a6b:	41 54                	push   %r12
  404a6d:	4c 8d 05 f4 6d 00 00 	lea    0x6df4(%rip),%r8        # 40b868 <dlerror@plt+0x9bd8>
  404a74:	6a 2f                	push   $0x2f
  404a76:	b9 00 10 00 00       	mov    $0x1000,%ecx
  404a7b:	ba 01 00 00 00       	mov    $0x1,%edx
  404a80:	31 c0                	xor    %eax,%eax
  404a82:	4d 89 f1             	mov    %r14,%r9
  404a85:	be 00 10 00 00       	mov    $0x1000,%esi
  404a8a:	4c 89 ef             	mov    %r13,%rdi
  404a8d:	e8 0e cd ff ff       	call   4017a0 <__snprintf_chk@plt>
  404a92:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  404a97:	5a                   	pop    %rdx
  404a98:	59                   	pop    %rcx
  404a99:	0f 8f 61 01 00 00    	jg     404c00 <dlerror@plt+0x2f70>
  404a9f:	4c 89 ef             	mov    %r13,%rdi
  404aa2:	e8 a9 14 00 00       	call   405f50 <dlerror@plt+0x42c0>
  404aa7:	83 f8 01             	cmp    $0x1,%eax
  404aaa:	75 37                	jne    404ae3 <dlerror@plt+0x2e53>
  404aac:	48 8b bd 30 20 00 00 	mov    0x2030(%rbp),%rdi
  404ab3:	48 85 ff             	test   %rdi,%rdi
  404ab6:	74 0d                	je     404ac5 <dlerror@plt+0x2e35>
  404ab8:	4c 89 e6             	mov    %r12,%rsi
  404abb:	e8 00 45 00 00       	call   408fc0 <dlerror@plt+0x7330>
  404ac0:	83 f8 01             	cmp    $0x1,%eax
  404ac3:	74 4d                	je     404b12 <dlerror@plt+0x2e82>
  404ac5:	80 bd 48 30 00 00 00 	cmpb   $0x0,0x3048(%rbp)
  404acc:	0f 85 64 01 00 00    	jne    404c36 <dlerror@plt+0x2fa6>
  404ad2:	48 8d 3d 27 68 00 00 	lea    0x6827(%rip),%rdi        # 40b300 <dlerror@plt+0x9670>
  404ad9:	4c 89 ee             	mov    %r13,%rsi
  404adc:	31 c0                	xor    %eax,%eax
  404ade:	e8 4d f9 ff ff       	call   404430 <dlerror@plt+0x27a0>
  404ae3:	4c 89 e2             	mov    %r12,%rdx
  404ae6:	4c 89 f6             	mov    %r14,%rsi
  404ae9:	48 89 ef             	mov    %rbp,%rdi
  404aec:	e8 3f 49 00 00       	call   409430 <dlerror@plt+0x77a0>
  404af1:	85 c0                	test   %eax,%eax
  404af3:	0f 88 22 01 00 00    	js     404c1b <dlerror@plt+0x2f8b>
  404af9:	41 80 7f 11 64       	cmpb   $0x64,0x11(%r15)
  404afe:	74 60                	je     404b60 <dlerror@plt+0x2ed0>
  404b00:	4c 89 ea             	mov    %r13,%rdx
  404b03:	4c 89 fe             	mov    %r15,%rsi
  404b06:	48 89 df             	mov    %rbx,%rdi
  404b09:	e8 f2 d7 ff ff       	call   402300 <dlerror@plt+0x670>
  404b0e:	85 c0                	test   %eax,%eax
  404b10:	75 6b                	jne    404b7d <dlerror@plt+0x2eed>
  404b12:	4c 89 fe             	mov    %r15,%rsi
  404b15:	48 89 df             	mov    %rbx,%rdi
  404b18:	e8 43 d6 ff ff       	call   402160 <dlerror@plt+0x4d0>
  404b1d:	48 39 83 10 10 00 00 	cmp    %rax,0x1010(%rbx)
  404b24:	49 89 c7             	mov    %rax,%r15
  404b27:	0f 86 a3 00 00 00    	jbe    404bd0 <dlerror@plt+0x2f40>
  404b2d:	41 0f b6 47 11       	movzbl 0x11(%r15),%eax
  404b32:	8d 48 a6             	lea    -0x5a(%rax),%ecx
  404b35:	80 f9 1e             	cmp    $0x1e,%cl
  404b38:	77 d8                	ja     404b12 <dlerror@plt+0x2e82>
  404b3a:	b8 01 00 00 00       	mov    $0x1,%eax
  404b3f:	48 d3 e0             	shl    %cl,%rax
  404b42:	a9 01 01 10 40       	test   $0x40100101,%eax
  404b47:	0f 84 d3 fe ff ff    	je     404a20 <dlerror@plt+0x2d90>
  404b4d:	49 8d 47 12          	lea    0x12(%r15),%rax
  404b51:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  404b56:	49 89 c4             	mov    %rax,%r12
  404b59:	e9 f2 fe ff ff       	jmp    404a50 <dlerror@plt+0x2dc0>
  404b5e:	66 90                	xchg   %ax,%ax
  404b60:	48 8b 0c 24          	mov    (%rsp),%rcx
  404b64:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  404b69:	4d 89 e8             	mov    %r13,%r8
  404b6c:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  404b71:	48 89 ef             	mov    %rbp,%rdi
  404b74:	e8 c7 0f 00 00       	call   405b40 <dlerror@plt+0x3eb0>
  404b79:	85 c0                	test   %eax,%eax
  404b7b:	74 95                	je     404b12 <dlerror@plt+0x2e82>
  404b7d:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  404b82:	48 8d 3d 17 66 00 00 	lea    0x6617(%rip),%rdi        # 40b1a0 <dlerror@plt+0x9510>
  404b89:	41 89 c4             	mov    %eax,%r12d
  404b8c:	31 c0                	xor    %eax,%eax
  404b8e:	e8 5d f9 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  404b93:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  404b98:	48 85 c0             	test   %rax,%rax
  404b9b:	75 40                	jne    404bdd <dlerror@plt+0x2f4d>
  404b9d:	0f 1f 00             	nopl   (%rax)
  404ba0:	48 8b 94 24 c8 30 00 	mov    0x30c8(%rsp),%rdx
  404ba7:	00 
  404ba8:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  404baf:	00 00 
  404bb1:	44 89 e0             	mov    %r12d,%eax
  404bb4:	0f 85 af 00 00 00    	jne    404c69 <dlerror@plt+0x2fd9>
  404bba:	48 81 c4 d8 30 00 00 	add    $0x30d8,%rsp
  404bc1:	5b                   	pop    %rbx
  404bc2:	5d                   	pop    %rbp
  404bc3:	41 5c                	pop    %r12
  404bc5:	41 5d                	pop    %r13
  404bc7:	41 5e                	pop    %r14
  404bc9:	41 5f                	pop    %r15
  404bcb:	c3                   	ret
  404bcc:	0f 1f 40 00          	nopl   0x0(%rax)
  404bd0:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  404bd5:	45 31 e4             	xor    %r12d,%r12d
  404bd8:	48 85 c0             	test   %rax,%rax
  404bdb:	74 c3                	je     404ba0 <dlerror@plt+0x2f10>
  404bdd:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
  404be2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  404be8:	48 89 df             	mov    %rbx,%rdi
  404beb:	48 83 c3 08          	add    $0x8,%rbx
  404bef:	e8 3c dd ff ff       	call   402930 <dlerror@plt+0xca0>
  404bf4:	48 83 3b 00          	cmpq   $0x0,(%rbx)
  404bf8:	75 ee                	jne    404be8 <dlerror@plt+0x2f58>
  404bfa:	eb a4                	jmp    404ba0 <dlerror@plt+0x2f10>
  404bfc:	0f 1f 40 00          	nopl   0x0(%rax)
  404c00:	48 8d 3d c1 66 00 00 	lea    0x66c1(%rip),%rdi        # 40b2c8 <dlerror@plt+0x9638>
  404c07:	31 c0                	xor    %eax,%eax
  404c09:	41 bc ff ff ff ff    	mov    $0xffffffff,%r12d
  404c0f:	e8 dc f8 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  404c14:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  404c19:	eb bd                	jmp    404bd8 <dlerror@plt+0x2f48>
  404c1b:	48 8d 3d 06 67 00 00 	lea    0x6706(%rip),%rdi        # 40b328 <dlerror@plt+0x9698>
  404c22:	31 c0                	xor    %eax,%eax
  404c24:	41 bc ff ff ff ff    	mov    $0xffffffff,%r12d
  404c2a:	e8 c1 f8 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  404c2f:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  404c34:	eb a2                	jmp    404bd8 <dlerror@plt+0x2f48>
  404c36:	48 8d 3d c3 66 00 00 	lea    0x66c3(%rip),%rdi        # 40b300 <dlerror@plt+0x9670>
  404c3d:	31 c0                	xor    %eax,%eax
  404c3f:	4c 89 ee             	mov    %r13,%rsi
  404c42:	41 bc ff ff ff ff    	mov    $0xffffffff,%r12d
  404c48:	e8 a3 f8 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  404c4d:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  404c52:	eb 84                	jmp    404bd8 <dlerror@plt+0x2f48>
  404c54:	41 89 c4             	mov    %eax,%r12d
  404c57:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  404c5c:	e9 77 ff ff ff       	jmp    404bd8 <dlerror@plt+0x2f48>
  404c61:	45 31 e4             	xor    %r12d,%r12d
  404c64:	e9 37 ff ff ff       	jmp    404ba0 <dlerror@plt+0x2f10>
  404c69:	e8 92 cc ff ff       	call   401900 <__stack_chk_fail@plt>
  404c6e:	66 90                	xchg   %ax,%ax
  404c70:	f3 c3                	repz ret
  404c72:	0f 1f 40 00          	nopl   0x0(%rax)
  404c76:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  404c7d:	00 00 00 
  404c80:	53                   	push   %rbx
  404c81:	48 8b b7 20 20 00 00 	mov    0x2020(%rdi),%rsi
  404c88:	48 89 fb             	mov    %rdi,%rbx
  404c8b:	48 81 c7 3b 20 00 00 	add    $0x203b,%rdi
  404c92:	8b 96 28 10 00 00    	mov    0x1028(%rsi),%edx
  404c98:	48 81 c6 2c 10 00 00 	add    $0x102c,%rsi
  404c9f:	e8 3c de ff ff       	call   402ae0 <dlerror@plt+0xe50>
  404ca4:	48 85 c0             	test   %rax,%rax
  404ca7:	48 89 83 40 30 00 00 	mov    %rax,0x3040(%rbx)
  404cae:	74 30                	je     404ce0 <dlerror@plt+0x3050>
  404cb0:	48 89 df             	mov    %rbx,%rdi
  404cb3:	e8 38 31 00 00       	call   407df0 <dlerror@plt+0x6160>
  404cb8:	85 c0                	test   %eax,%eax
  404cba:	75 24                	jne    404ce0 <dlerror@plt+0x3050>
  404cbc:	48 89 df             	mov    %rbx,%rdi
  404cbf:	e8 3c 35 00 00       	call   408200 <dlerror@plt+0x6570>
  404cc4:	85 c0                	test   %eax,%eax
  404cc6:	75 18                	jne    404ce0 <dlerror@plt+0x3050>
  404cc8:	48 89 df             	mov    %rbx,%rdi
  404ccb:	e8 90 36 00 00       	call   408360 <dlerror@plt+0x66d0>
  404cd0:	85 c0                	test   %eax,%eax
  404cd2:	75 0c                	jne    404ce0 <dlerror@plt+0x3050>
  404cd4:	48 89 df             	mov    %rbx,%rdi
  404cd7:	5b                   	pop    %rbx
  404cd8:	e9 73 fa ff ff       	jmp    404750 <dlerror@plt+0x2ac0>
  404cdd:	0f 1f 00             	nopl   (%rax)
  404ce0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  404ce5:	5b                   	pop    %rbx
  404ce6:	c3                   	ret
  404ce7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  404cee:	00 00 
  404cf0:	53                   	push   %rbx
  404cf1:	48 89 fb             	mov    %rdi,%rbx
  404cf4:	e8 87 37 00 00       	call   408480 <dlerror@plt+0x67f0>
  404cf9:	48 8d bb 40 30 00 00 	lea    0x3040(%rbx),%rdi
  404d00:	5b                   	pop    %rbx
  404d01:	e9 9a dd ff ff       	jmp    402aa0 <dlerror@plt+0xe10>
  404d06:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  404d0d:	00 00 00 
  404d10:	41 54                	push   %r12
  404d12:	55                   	push   %rbp
  404d13:	45 31 e4             	xor    %r12d,%r12d
  404d16:	53                   	push   %rbx
  404d17:	48 89 fb             	mov    %rdi,%rbx
  404d1a:	48 8b bf 30 20 00 00 	mov    0x2030(%rdi),%rdi
  404d21:	48 8d ab 3b 20 00 00 	lea    0x203b(%rbx),%rbp
  404d28:	e8 13 45 00 00       	call   409240 <dlerror@plt+0x75b0>
  404d2d:	48 8d bb 30 20 00 00 	lea    0x2030(%rbx),%rdi
  404d34:	e8 87 43 00 00       	call   4090c0 <dlerror@plt+0x7430>
  404d39:	48 89 ef             	mov    %rbp,%rdi
  404d3c:	e8 bf 4e 00 00       	call   409c00 <dlerror@plt+0x7f70>
  404d41:	85 c0                	test   %eax,%eax
  404d43:	78 1b                	js     404d60 <dlerror@plt+0x30d0>
  404d45:	48 8d bb 20 20 00 00 	lea    0x2020(%rbx),%rdi
  404d4c:	e8 df db ff ff       	call   402930 <dlerror@plt+0xca0>
  404d51:	44 89 e0             	mov    %r12d,%eax
  404d54:	5b                   	pop    %rbx
  404d55:	5d                   	pop    %rbp
  404d56:	41 5c                	pop    %r12
  404d58:	c3                   	ret
  404d59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  404d60:	31 c0                	xor    %eax,%eax
  404d62:	80 bb 48 30 00 00 00 	cmpb   $0x0,0x3048(%rbx)
  404d69:	48 89 ee             	mov    %rbp,%rsi
  404d6c:	48 8d 3d e5 65 00 00 	lea    0x65e5(%rip),%rdi        # 40b358 <dlerror@plt+0x96c8>
  404d73:	75 07                	jne    404d7c <dlerror@plt+0x30ec>
  404d75:	e8 b6 f6 ff ff       	call   404430 <dlerror@plt+0x27a0>
  404d7a:	eb c9                	jmp    404d45 <dlerror@plt+0x30b5>
  404d7c:	e8 6f f7 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  404d81:	41 bc ff ff ff ff    	mov    $0xffffffff,%r12d
  404d87:	eb bc                	jmp    404d45 <dlerror@plt+0x30b5>
  404d89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  404d90:	41 57                	push   %r15
  404d92:	41 56                	push   %r14
  404d94:	4c 8d bf 49 30 00 00 	lea    0x3049(%rdi),%r15
  404d9b:	41 55                	push   %r13
  404d9d:	41 54                	push   %r12
  404d9f:	ba ff 0f 00 00       	mov    $0xfff,%edx
  404da4:	55                   	push   %rbp
  404da5:	53                   	push   %rbx
  404da6:	48 8d 6f 20          	lea    0x20(%rdi),%rbp
  404daa:	48 89 fb             	mov    %rdi,%rbx
  404dad:	48 81 ec 88 10 00 00 	sub    $0x1088,%rsp
  404db4:	48 89 ee             	mov    %rbp,%rsi
  404db7:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  404dbe:	00 00 
  404dc0:	48 89 84 24 78 10 00 	mov    %rax,0x1078(%rsp)
  404dc7:	00 
  404dc8:	31 c0                	xor    %eax,%eax
  404dca:	48 8b 47 08          	mov    0x8(%rdi),%rax
  404dce:	48 8d 3d 73 69 00 00 	lea    0x6973(%rip),%rdi        # 40b748 <dlerror@plt+0x9ab8>
  404dd5:	4c 8b 28             	mov    (%rax),%r13
  404dd8:	e8 a3 ca ff ff       	call   401880 <readlink@plt>
  404ddd:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  404de1:	0f 84 11 02 00 00    	je     404ff8 <dlerror@plt+0x3368>
  404de7:	66 0f ef c0          	pxor   %xmm0,%xmm0
  404deb:	4c 8d 64 24 70       	lea    0x70(%rsp),%r12
  404df0:	48 89 ee             	mov    %rbp,%rsi
  404df3:	c6 44 03 20 00       	movb   $0x0,0x20(%rbx,%rax,1)
  404df8:	4c 8d 74 24 18       	lea    0x18(%rsp),%r14
  404dfd:	c6 44 24 60 00       	movb   $0x0,0x60(%rsp)
  404e02:	4c 89 e7             	mov    %r12,%rdi
  404e05:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%rsp)
  404e0c:	00 
  404e0d:	0f 29 44 24 20       	movaps %xmm0,0x20(%rsp)
  404e12:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
  404e17:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
  404e1c:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  404e21:	e8 6a 10 00 00       	call   405e90 <dlerror@plt+0x4200>
  404e26:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
  404e2b:	48 8d 35 25 69 00 00 	lea    0x6925(%rip),%rsi        # 40b757 <dlerror@plt+0x9ac7>
  404e32:	31 c0                	xor    %eax,%eax
  404e34:	4c 89 f1             	mov    %r14,%rcx
  404e37:	4c 89 e7             	mov    %r12,%rdi
  404e3a:	e8 b1 cc ff ff       	call   401af0 <__isoc99_sscanf@plt>
  404e3f:	83 f8 02             	cmp    $0x2,%eax
  404e42:	0f 84 08 02 00 00    	je     405050 <dlerror@plt+0x33c0>
  404e48:	48 89 ef             	mov    %rbp,%rdi
  404e4b:	e8 a0 d7 ff ff       	call   4025f0 <dlerror@plt+0x960>
  404e50:	48 85 c0             	test   %rax,%rax
  404e53:	48 89 83 20 20 00 00 	mov    %rax,0x2020(%rbx)
  404e5a:	0f 84 40 02 00 00    	je     4050a0 <dlerror@plt+0x3410>
  404e60:	4c 8d ab 20 10 00 00 	lea    0x1020(%rbx),%r13
  404e67:	48 8d 15 b9 5a 00 00 	lea    0x5ab9(%rip),%rdx        # 40a927 <dlerror@plt+0x8c97>
  404e6e:	48 89 e9             	mov    %rbp,%rcx
  404e71:	be 00 10 00 00       	mov    $0x1000,%esi
  404e76:	31 c0                	xor    %eax,%eax
  404e78:	4c 89 ef             	mov    %r13,%rdi
  404e7b:	e8 d0 ca ff ff       	call   401950 <snprintf@plt>
  404e80:	48 8b 83 20 20 00 00 	mov    0x2020(%rbx),%rax
  404e87:	0f b6 90 18 10 00 00 	movzbl 0x1018(%rax),%edx
  404e8e:	88 93 38 20 00 00    	mov    %dl,0x2038(%rbx)
  404e94:	48 8b 80 20 10 00 00 	mov    0x1020(%rax),%rax
  404e9b:	48 85 c0             	test   %rax,%rax
  404e9e:	0f 95 83 28 20 00 00 	setne  0x2028(%rbx)
  404ea5:	0f 85 ad 02 00 00    	jne    405158 <dlerror@plt+0x34c8>
  404eab:	48 8d 3d b8 68 00 00 	lea    0x68b8(%rip),%rdi        # 40b76a <dlerror@plt+0x9ada>
  404eb2:	e8 69 4b 00 00       	call   409a20 <dlerror@plt+0x7d90>
  404eb7:	48 85 c0             	test   %rax,%rax
  404eba:	48 89 c2             	mov    %rax,%rdx
  404ebd:	0f 84 ef 00 00 00    	je     404fb2 <dlerror@plt+0x3322>
  404ec3:	48 8d 3d 6e 56 00 00 	lea    0x566e(%rip),%rdi        # 40a538 <dlerror@plt+0x88a8>
  404eca:	48 89 c6             	mov    %rax,%rsi
  404ecd:	b9 02 00 00 00       	mov    $0x2,%ecx
  404ed2:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
  404ed7:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  404ed9:	48 8d 3d 8a 68 00 00 	lea    0x688a(%rip),%rdi        # 40b76a <dlerror@plt+0x9ada>
  404ee0:	0f 97 c0             	seta   %al
  404ee3:	1c 00                	sbb    $0x0,%al
  404ee5:	84 c0                	test   %al,%al
  404ee7:	0f 85 b3 00 00 00    	jne    404fa0 <dlerror@plt+0x3310>
  404eed:	e8 6e 4b 00 00       	call   409a60 <dlerror@plt+0x7dd0>
  404ef2:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  404ef7:	48 89 d7             	mov    %rdx,%rdi
  404efa:	e8 c1 c8 ff ff       	call   4017c0 <free@plt>
  404eff:	48 8d 3d 82 68 00 00 	lea    0x6882(%rip),%rdi        # 40b788 <dlerror@plt+0x9af8>
  404f06:	4c 89 ee             	mov    %r13,%rsi
  404f09:	e8 42 4b 00 00       	call   409a50 <dlerror@plt+0x7dc0>
  404f0e:	48 8d 3d 85 68 00 00 	lea    0x6885(%rip),%rdi        # 40b79a <dlerror@plt+0x9b0a>
  404f15:	e8 46 4b 00 00       	call   409a60 <dlerror@plt+0x7dd0>
  404f1a:	48 8d 3d 93 68 00 00 	lea    0x6893(%rip),%rdi        # 40b7b4 <dlerror@plt+0x9b24>
  404f21:	e8 3a 4b 00 00       	call   409a60 <dlerror@plt+0x7dd0>
  404f26:	48 8d 3d a1 68 00 00 	lea    0x68a1(%rip),%rdi        # 40b7ce <dlerror@plt+0x9b3e>
  404f2d:	e8 2e 4b 00 00       	call   409a60 <dlerror@plt+0x7dd0>
  404f32:	48 8d 3d a5 68 00 00 	lea    0x68a5(%rip),%rdi        # 40b7de <dlerror@plt+0x9b4e>
  404f39:	e8 22 4b 00 00       	call   409a60 <dlerror@plt+0x7dd0>
  404f3e:	48 8d 3d 6f 68 00 00 	lea    0x686f(%rip),%rdi        # 40b7b4 <dlerror@plt+0x9b24>
  404f45:	e8 d6 4a 00 00       	call   409a20 <dlerror@plt+0x7d90>
  404f4a:	48 85 c0             	test   %rax,%rax
  404f4d:	49 89 c5             	mov    %rax,%r13
  404f50:	74 09                	je     404f5b <dlerror@plt+0x32cb>
  404f52:	80 38 00             	cmpb   $0x0,(%rax)
  404f55:	0f 85 7d 07 00 00    	jne    4056d8 <dlerror@plt+0x3a48>
  404f5b:	c6 83 3a 20 00 00 fe 	movb   $0xfe,0x203a(%rbx)
  404f62:	4c 89 ef             	mov    %r13,%rdi
  404f65:	e8 56 c8 ff ff       	call   4017c0 <free@plt>
  404f6a:	0f be b3 3a 20 00 00 	movsbl 0x203a(%rbx),%esi
  404f71:	40 80 fe ff          	cmp    $0xff,%sil
  404f75:	0f 84 25 02 00 00    	je     4051a0 <dlerror@plt+0x3510>
  404f7b:	0f 8e af 06 00 00    	jle    405630 <dlerror@plt+0x39a0>
  404f81:	40 84 f6             	test   %sil,%sil
  404f84:	0f 84 23 02 00 00    	je     4051ad <dlerror@plt+0x351d>
  404f8a:	40 80 fe 01          	cmp    $0x1,%sil
  404f8e:	0f 85 cc 07 00 00    	jne    405760 <dlerror@plt+0x3ad0>
  404f94:	c6 83 39 20 00 00 02 	movb   $0x2,0x2039(%rbx)
  404f9b:	e9 51 02 00 00       	jmp    4051f1 <dlerror@plt+0x3561>
  404fa0:	e8 bb 4a 00 00       	call   409a60 <dlerror@plt+0x7dd0>
  404fa5:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  404faa:	48 89 d7             	mov    %rdx,%rdi
  404fad:	e8 0e c8 ff ff       	call   4017c0 <free@plt>
  404fb2:	48 8d 3d cf 67 00 00 	lea    0x67cf(%rip),%rdi        # 40b788 <dlerror@plt+0x9af8>
  404fb9:	e8 62 4a 00 00       	call   409a20 <dlerror@plt+0x7d90>
  404fbe:	48 85 c0             	test   %rax,%rax
  404fc1:	0f 84 38 ff ff ff    	je     404eff <dlerror@plt+0x326f>
  404fc7:	4c 89 ef             	mov    %r13,%rdi
  404fca:	48 89 c6             	mov    %rax,%rsi
  404fcd:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  404fd2:	e8 f9 c9 ff ff       	call   4019d0 <strcmp@plt>
  404fd7:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  404fdc:	85 c0                	test   %eax,%eax
  404fde:	48 89 d7             	mov    %rdx,%rdi
  404fe1:	0f 85 69 07 00 00    	jne    405750 <dlerror@plt+0x3ac0>
  404fe7:	e8 d4 c7 ff ff       	call   4017c0 <free@plt>
  404fec:	e9 4d ff ff ff       	jmp    404f3e <dlerror@plt+0x32ae>
  404ff1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  404ff8:	66 0f ef c0          	pxor   %xmm0,%xmm0
  404ffc:	4c 8d 64 24 70       	lea    0x70(%rsp),%r12
  405001:	48 89 ee             	mov    %rbp,%rsi
  405004:	4c 8d 74 24 18       	lea    0x18(%rsp),%r14
  405009:	c6 44 24 60 00       	movb   $0x0,0x60(%rsp)
  40500e:	4c 89 e7             	mov    %r12,%rdi
  405011:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%rsp)
  405018:	00 
  405019:	0f 29 44 24 20       	movaps %xmm0,0x20(%rsp)
  40501e:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
  405023:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
  405028:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  40502d:	e8 5e 0e 00 00       	call   405e90 <dlerror@plt+0x4200>
  405032:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
  405037:	48 8d 35 19 67 00 00 	lea    0x6719(%rip),%rsi        # 40b757 <dlerror@plt+0x9ac7>
  40503e:	31 c0                	xor    %eax,%eax
  405040:	4c 89 f1             	mov    %r14,%rcx
  405043:	4c 89 e7             	mov    %r12,%rdi
  405046:	e8 a5 ca ff ff       	call   401af0 <__isoc99_sscanf@plt>
  40504b:	83 f8 02             	cmp    $0x2,%eax
  40504e:	75 10                	jne    405060 <dlerror@plt+0x33d0>
  405050:	ba 00 10 00 00       	mov    $0x1000,%edx
  405055:	48 89 ee             	mov    %rbp,%rsi
  405058:	4c 89 ff             	mov    %r15,%rdi
  40505b:	e8 90 c7 ff ff       	call   4017f0 <strncpy@plt>
  405060:	be 2f 00 00 00       	mov    $0x2f,%esi
  405065:	4c 89 ef             	mov    %r13,%rdi
  405068:	e8 b3 c8 ff ff       	call   401920 <strchr@plt>
  40506d:	48 85 c0             	test   %rax,%rax
  405070:	0f 84 b2 07 00 00    	je     405828 <dlerror@plt+0x3b98>
  405076:	ba 00 10 00 00       	mov    $0x1000,%edx
  40507b:	48 89 ee             	mov    %rbp,%rsi
  40507e:	4c 89 ef             	mov    %r13,%rdi
  405081:	e8 0a c9 ff ff       	call   401990 <__realpath_chk@plt>
  405086:	48 85 c0             	test   %rax,%rax
  405089:	0f 85 b9 fd ff ff    	jne    404e48 <dlerror@plt+0x31b8>
  40508f:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
  405094:	e9 54 05 00 00       	jmp    4055ed <dlerror@plt+0x395d>
  405099:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4050a0:	48 8d 35 9a 54 00 00 	lea    0x549a(%rip),%rsi        # 40a541 <dlerror@plt+0x88b1>
  4050a7:	48 89 ef             	mov    %rbp,%rdi
  4050aa:	e8 21 cb ff ff       	call   401bd0 <fopen@plt>
  4050af:	48 85 c0             	test   %rax,%rax
  4050b2:	49 89 c5             	mov    %rax,%r13
  4050b5:	0f 84 4d 07 00 00    	je     405808 <dlerror@plt+0x3b78>
  4050bb:	48 8b 05 46 77 00 00 	mov    0x7746(%rip),%rax        # 40c808 <dlerror@plt+0xab78>
  4050c2:	ba 08 00 00 00       	mov    $0x8,%edx
  4050c7:	4c 89 e6             	mov    %r12,%rsi
  4050ca:	4c 89 ef             	mov    %r13,%rdi
  4050cd:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  4050d2:	48 c1 e8 18          	shr    $0x18,%rax
  4050d6:	83 c0 0d             	add    $0xd,%eax
  4050d9:	88 44 24 73          	mov    %al,0x73(%rsp)
  4050dd:	e8 2e 46 00 00       	call   409710 <dlerror@plt+0x7a80>
  4050e2:	48 85 c0             	test   %rax,%rax
  4050e5:	0f 84 15 07 00 00    	je     405800 <dlerror@plt+0x3b70>
  4050eb:	4c 8d ab 20 10 00 00 	lea    0x1020(%rbx),%r13
  4050f2:	4c 8d 05 7a 67 00 00 	lea    0x677a(%rip),%r8        # 40b873 <dlerror@plt+0x9be3>
  4050f9:	31 c0                	xor    %eax,%eax
  4050fb:	49 89 e9             	mov    %rbp,%r9
  4050fe:	b9 00 10 00 00       	mov    $0x1000,%ecx
  405103:	ba 01 00 00 00       	mov    $0x1,%edx
  405108:	be 00 10 00 00       	mov    $0x1000,%esi
  40510d:	4c 89 ef             	mov    %r13,%rdi
  405110:	e8 8b c6 ff ff       	call   4017a0 <__snprintf_chk@plt>
  405115:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  40511a:	0f 8f 6f ff ff ff    	jg     40508f <dlerror@plt+0x33ff>
  405120:	4c 89 ef             	mov    %r13,%rdi
  405123:	e8 c8 d4 ff ff       	call   4025f0 <dlerror@plt+0x960>
  405128:	48 85 c0             	test   %rax,%rax
  40512b:	48 89 83 20 20 00 00 	mov    %rax,0x2020(%rbx)
  405132:	0f 85 4f fd ff ff    	jne    404e87 <dlerror@plt+0x31f7>
  405138:	48 8d 3d 99 62 00 00 	lea    0x6299(%rip),%rdi        # 40b3d8 <dlerror@plt+0x9748>
  40513f:	4c 89 ee             	mov    %r13,%rsi
  405142:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
  405147:	e8 a4 f3 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  40514c:	e9 9c 04 00 00       	jmp    4055ed <dlerror@plt+0x395d>
  405151:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  405158:	48 8d 3d c1 62 00 00 	lea    0x62c1(%rip),%rdi        # 40b420 <dlerror@plt+0x9790>
  40515f:	e8 bc 48 00 00       	call   409a20 <dlerror@plt+0x7d90>
  405164:	48 85 c0             	test   %rax,%rax
  405167:	74 20                	je     405189 <dlerror@plt+0x34f9>
  405169:	48 8d 3d c8 53 00 00 	lea    0x53c8(%rip),%rdi        # 40a538 <dlerror@plt+0x88a8>
  405170:	b9 02 00 00 00       	mov    $0x2,%ecx
  405175:	48 89 c6             	mov    %rax,%rsi
  405178:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  40517a:	0f 97 c2             	seta   %dl
  40517d:	80 da 00             	sbb    $0x0,%dl
  405180:	84 d2                	test   %dl,%dl
  405182:	0f 94 83 29 20 00 00 	sete   0x2029(%rbx)
  405189:	48 89 c7             	mov    %rax,%rdi
  40518c:	e8 2f c6 ff ff       	call   4017c0 <free@plt>
  405191:	e9 15 fd ff ff       	jmp    404eab <dlerror@plt+0x321b>
  405196:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40519d:	00 00 00 
  4051a0:	80 bb 38 20 00 00 00 	cmpb   $0x0,0x2038(%rbx)
  4051a7:	0f 85 f3 05 00 00    	jne    4057a0 <dlerror@plt+0x3b10>
  4051ad:	c6 83 39 20 00 00 01 	movb   $0x1,0x2039(%rbx)
  4051b4:	41 b9 01 00 00 00    	mov    $0x1,%r9d
  4051ba:	4c 8d 05 a4 65 00 00 	lea    0x65a4(%rip),%r8        # 40b765 <dlerror@plt+0x9ad5>
  4051c1:	b9 08 00 00 00       	mov    $0x8,%ecx
  4051c6:	ba 01 00 00 00       	mov    $0x1,%edx
  4051cb:	be 08 00 00 00       	mov    $0x8,%esi
  4051d0:	4c 89 e7             	mov    %r12,%rdi
  4051d3:	31 c0                	xor    %eax,%eax
  4051d5:	e8 c6 c5 ff ff       	call   4017a0 <__snprintf_chk@plt>
  4051da:	48 8d 3d d3 65 00 00 	lea    0x65d3(%rip),%rdi        # 40b7b4 <dlerror@plt+0x9b24>
  4051e1:	4c 89 e6             	mov    %r12,%rsi
  4051e4:	e8 67 48 00 00       	call   409a50 <dlerror@plt+0x7dc0>
  4051e9:	85 c0                	test   %eax,%eax
  4051eb:	0f 88 ad 07 00 00    	js     40599e <dlerror@plt+0x3d0e>
  4051f1:	4c 8b b3 20 20 00 00 	mov    0x2020(%rbx),%r14
  4051f8:	49 8b 86 08 10 00 00 	mov    0x1008(%r14),%rax
  4051ff:	49 39 86 10 10 00 00 	cmp    %rax,0x1010(%r14)
  405206:	0f 86 e4 00 00 00    	jbe    4052f0 <dlerror@plt+0x3660>
  40520c:	4c 8d 2d e3 65 00 00 	lea    0x65e3(%rip),%r13        # 40b7f6 <dlerror@plt+0x9b66>
  405213:	e9 87 00 00 00       	jmp    40529f <dlerror@plt+0x360f>
  405218:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40521f:	00 
  405220:	48 8d 3d ef 65 00 00 	lea    0x65ef(%rip),%rdi        # 40b816 <dlerror@plt+0x9b86>
  405227:	b9 12 00 00 00       	mov    $0x12,%ecx
  40522c:	4c 89 c6             	mov    %r8,%rsi
  40522f:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  405231:	0f 97 c1             	seta   %cl
  405234:	80 d9 00             	sbb    $0x0,%cl
  405237:	84 c9                	test   %cl,%cl
  405239:	75 0b                	jne    405246 <dlerror@plt+0x35b6>
  40523b:	48 8d 48 25          	lea    0x25(%rax),%rcx
  40523f:	48 89 8b 58 40 00 00 	mov    %rcx,0x4058(%rbx)
  405246:	48 8d 3d dc 65 00 00 	lea    0x65dc(%rip),%rdi        # 40b829 <dlerror@plt+0x9b99>
  40524d:	b9 16 00 00 00       	mov    $0x16,%ecx
  405252:	4c 89 c6             	mov    %r8,%rsi
  405255:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  405257:	0f 97 c1             	seta   %cl
  40525a:	80 d9 00             	sbb    $0x0,%cl
  40525d:	84 c9                	test   %cl,%cl
  40525f:	75 0b                	jne    40526c <dlerror@plt+0x35dc>
  405261:	48 8d 48 29          	lea    0x29(%rax),%rcx
  405265:	48 89 8b 60 40 00 00 	mov    %rcx,0x4060(%rbx)
  40526c:	48 8d 3d cd 65 00 00 	lea    0x65cd(%rip),%rdi        # 40b840 <dlerror@plt+0x9bb0>
  405273:	b9 1d 00 00 00       	mov    $0x1d,%ecx
  405278:	4c 89 c6             	mov    %r8,%rsi
  40527b:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  40527d:	0f 97 c1             	seta   %cl
  405280:	80 d9 00             	sbb    $0x0,%cl
  405283:	84 c9                	test   %cl,%cl
  405285:	0f 84 95 03 00 00    	je     405620 <dlerror@plt+0x3990>
  40528b:	48 89 c6             	mov    %rax,%rsi
  40528e:	4c 89 f7             	mov    %r14,%rdi
  405291:	e8 ca ce ff ff       	call   402160 <dlerror@plt+0x4d0>
  405296:	49 3b 86 10 10 00 00 	cmp    0x1010(%r14),%rax
  40529d:	73 51                	jae    4052f0 <dlerror@plt+0x3660>
  40529f:	80 78 11 6f          	cmpb   $0x6f,0x11(%rax)
  4052a3:	75 e6                	jne    40528b <dlerror@plt+0x35fb>
  4052a5:	4c 8d 40 12          	lea    0x12(%rax),%r8
  4052a9:	b9 0f 00 00 00       	mov    $0xf,%ecx
  4052ae:	4c 89 ef             	mov    %r13,%rdi
  4052b1:	4c 89 c6             	mov    %r8,%rsi
  4052b4:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  4052b6:	0f 97 c1             	seta   %cl
  4052b9:	80 d9 00             	sbb    $0x0,%cl
  4052bc:	84 c9                	test   %cl,%cl
  4052be:	0f 85 5c ff ff ff    	jne    405220 <dlerror@plt+0x3590>
  4052c4:	48 8d 70 22          	lea    0x22(%rax),%rsi
  4052c8:	48 8d 3d 37 65 00 00 	lea    0x6537(%rip),%rdi        # 40b806 <dlerror@plt+0x9b76>
  4052cf:	b9 0f 00 00 00       	mov    $0xf,%ecx
  4052d4:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  4052d6:	0f 97 c1             	seta   %cl
  4052d9:	80 d9 00             	sbb    $0x0,%cl
  4052dc:	84 c9                	test   %cl,%cl
  4052de:	75 ab                	jne    40528b <dlerror@plt+0x35fb>
  4052e0:	c6 83 69 40 00 00 01 	movb   $0x1,0x4069(%rbx)
  4052e7:	eb a2                	jmp    40528b <dlerror@plt+0x35fb>
  4052e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4052f0:	48 8d 3d e9 61 00 00 	lea    0x61e9(%rip),%rdi        # 40b4e0 <dlerror@plt+0x9850>
  4052f7:	e8 24 47 00 00       	call   409a20 <dlerror@plt+0x7d90>
  4052fc:	48 85 c0             	test   %rax,%rax
  4052ff:	74 20                	je     405321 <dlerror@plt+0x3691>
  405301:	48 8d 3d 56 65 00 00 	lea    0x6556(%rip),%rdi        # 40b85e <dlerror@plt+0x9bce>
  405308:	b9 02 00 00 00       	mov    $0x2,%ecx
  40530d:	48 89 c6             	mov    %rax,%rsi
  405310:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  405312:	0f 97 c2             	seta   %dl
  405315:	80 da 00             	sbb    $0x0,%dl
  405318:	84 d2                	test   %dl,%dl
  40531a:	0f 95 83 48 30 00 00 	setne  0x3048(%rbx)
  405321:	48 89 c7             	mov    %rax,%rdi
  405324:	e8 97 c4 ff ff       	call   4017c0 <free@plt>
  405329:	80 bb 3a 20 00 00 fe 	cmpb   $0xfe,0x203a(%rbx)
  405330:	0f 84 3a 03 00 00    	je     405670 <dlerror@plt+0x39e0>
  405336:	48 8d 3d a1 64 00 00 	lea    0x64a1(%rip),%rdi        # 40b7de <dlerror@plt+0x9b4e>
  40533d:	e8 de 46 00 00       	call   409a20 <dlerror@plt+0x7d90>
  405342:	48 85 c0             	test   %rax,%rax
  405345:	49 89 c5             	mov    %rax,%r13
  405348:	74 13                	je     40535d <dlerror@plt+0x36cd>
  40534a:	48 89 c6             	mov    %rax,%rsi
  40534d:	31 c9                	xor    %ecx,%ecx
  40534f:	31 d2                	xor    %edx,%edx
  405351:	bf 0f 00 00 00       	mov    $0xf,%edi
  405356:	31 c0                	xor    %eax,%eax
  405358:	e8 f3 c6 ff ff       	call   401a50 <prctl@plt>
  40535d:	4c 89 ef             	mov    %r13,%rdi
  405360:	e8 5b c4 ff ff       	call   4017c0 <free@plt>
  405365:	80 bb 38 20 00 00 00 	cmpb   $0x0,0x2038(%rbx)
  40536c:	0f 84 2e 03 00 00    	je     4056a0 <dlerror@plt+0x3a10>
  405372:	0f b6 93 39 20 00 00 	movzbl 0x2039(%rbx),%edx
  405379:	80 fa ff             	cmp    $0xff,%dl
  40537c:	74 1e                	je     40539c <dlerror@plt+0x370c>
  40537e:	8b 83 38 20 00 00    	mov    0x2038(%rbx),%eax
  405384:	25 00 ff ff 00       	and    $0xffff00,%eax
  405389:	3d 00 00 ff 00       	cmp    $0xff0000,%eax
  40538e:	0f 84 8c 00 00 00    	je     405420 <dlerror@plt+0x3790>
  405394:	84 d2                	test   %dl,%dl
  405396:	0f 85 84 00 00 00    	jne    405420 <dlerror@plt+0x3790>
  40539c:	48 89 df             	mov    %rbx,%rdi
  40539f:	e8 cc 46 00 00       	call   409a70 <dlerror@plt+0x7de0>
  4053a4:	85 c0                	test   %eax,%eax
  4053a6:	0f 88 c4 05 00 00    	js     405970 <dlerror@plt+0x3ce0>
  4053ac:	4c 8d ab 3b 20 00 00 	lea    0x203b(%rbx),%r13
  4053b3:	48 8d 3d e0 63 00 00 	lea    0x63e0(%rip),%rdi        # 40b79a <dlerror@plt+0x9b0a>
  4053ba:	4c 89 ee             	mov    %r13,%rsi
  4053bd:	e8 8e 46 00 00       	call   409a50 <dlerror@plt+0x7dc0>
  4053c2:	85 c0                	test   %eax,%eax
  4053c4:	0f 88 ec 05 00 00    	js     4059b6 <dlerror@plt+0x3d26>
  4053ca:	0f b6 83 39 20 00 00 	movzbl 0x2039(%rbx),%eax
  4053d1:	3c ff                	cmp    $0xff,%al
  4053d3:	0f 84 aa 00 00 00    	je     405483 <dlerror@plt+0x37f3>
  4053d9:	84 c0                	test   %al,%al
  4053db:	0f 85 ea 00 00 00    	jne    4054cb <dlerror@plt+0x383b>
  4053e1:	80 bb 3a 20 00 00 ff 	cmpb   $0xff,0x203a(%rbx)
  4053e8:	0f 84 dd 00 00 00    	je     4054cb <dlerror@plt+0x383b>
  4053ee:	4c 89 ef             	mov    %r13,%rdi
  4053f1:	e8 aa 49 00 00       	call   409da0 <dlerror@plt+0x8110>
  4053f6:	83 f8 ff             	cmp    $0xffffffff,%eax
  4053f9:	0f 85 cc 00 00 00    	jne    4054cb <dlerror@plt+0x383b>
  4053ff:	48 8d 3d d2 61 00 00 	lea    0x61d2(%rip),%rdi        # 40b5d8 <dlerror@plt+0x9948>
  405406:	31 c0                	xor    %eax,%eax
  405408:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
  40540d:	e8 de f0 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  405412:	e9 d6 01 00 00       	jmp    4055ed <dlerror@plt+0x395d>
  405417:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40541e:	00 00 
  405420:	48 8d 3d 73 63 00 00 	lea    0x6373(%rip),%rdi        # 40b79a <dlerror@plt+0x9b0a>
  405427:	e8 f4 45 00 00       	call   409a20 <dlerror@plt+0x7d90>
  40542c:	48 85 c0             	test   %rax,%rax
  40542f:	49 89 c4             	mov    %rax,%r12
  405432:	0f 84 ed 04 00 00    	je     405925 <dlerror@plt+0x3c95>
  405438:	80 38 00             	cmpb   $0x0,(%rax)
  40543b:	0f 84 e4 04 00 00    	je     405925 <dlerror@plt+0x3c95>
  405441:	4c 8d ab 3b 20 00 00 	lea    0x203b(%rbx),%r13
  405448:	48 8d 15 d8 54 00 00 	lea    0x54d8(%rip),%rdx        # 40a927 <dlerror@plt+0x8c97>
  40544f:	48 89 c1             	mov    %rax,%rcx
  405452:	be 00 10 00 00       	mov    $0x1000,%esi
  405457:	31 c0                	xor    %eax,%eax
  405459:	4c 89 ef             	mov    %r13,%rdi
  40545c:	e8 ef c4 ff ff       	call   401950 <snprintf@plt>
  405461:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  405466:	0f 8f e4 04 00 00    	jg     405950 <dlerror@plt+0x3cc0>
  40546c:	4c 89 e7             	mov    %r12,%rdi
  40546f:	e8 4c c3 ff ff       	call   4017c0 <free@plt>
  405474:	0f b6 83 39 20 00 00 	movzbl 0x2039(%rbx),%eax
  40547b:	3c ff                	cmp    $0xff,%al
  40547d:	0f 85 56 ff ff ff    	jne    4053d9 <dlerror@plt+0x3749>
  405483:	4c 89 ef             	mov    %r13,%rdi
  405486:	e8 15 49 00 00       	call   409da0 <dlerror@plt+0x8110>
  40548b:	83 f8 ff             	cmp    $0xffffffff,%eax
  40548e:	0f 84 6b ff ff ff    	je     4053ff <dlerror@plt+0x376f>
  405494:	80 bb 49 30 00 00 00 	cmpb   $0x0,0x3049(%rbx)
  40549b:	0f 84 77 02 00 00    	je     405718 <dlerror@plt+0x3a88>
  4054a1:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  4054a5:	8b 3b                	mov    (%rbx),%edi
  4054a7:	4c 89 fa             	mov    %r15,%rdx
  4054aa:	e8 91 4b 00 00       	call   40a040 <dlerror@plt+0x83b0>
  4054af:	48 85 c0             	test   %rax,%rax
  4054b2:	0f 84 d0 04 00 00    	je     405988 <dlerror@plt+0x3cf8>
  4054b8:	48 89 c6             	mov    %rax,%rsi
  4054bb:	4c 89 ff             	mov    %r15,%rdi
  4054be:	e8 4d c7 ff ff       	call   401c10 <execvp@plt>
  4054c3:	85 c0                	test   %eax,%eax
  4054c5:	0f 88 61 02 00 00    	js     40572c <dlerror@plt+0x3a9c>
  4054cb:	80 bb 28 20 00 00 00 	cmpb   $0x0,0x2028(%rbx)
  4054d2:	0f 84 a8 00 00 00    	je     405580 <dlerror@plt+0x38f0>
  4054d8:	80 bb 29 20 00 00 00 	cmpb   $0x0,0x2029(%rbx)
  4054df:	0f 85 ab 00 00 00    	jne    405590 <dlerror@plt+0x3900>
  4054e5:	0f b6 93 39 20 00 00 	movzbl 0x2039(%rbx),%edx
  4054ec:	80 fa 01             	cmp    $0x1,%dl
  4054ef:	0f 8f 9b 00 00 00    	jg     405590 <dlerror@plt+0x3900>
  4054f5:	0f b6 83 38 20 00 00 	movzbl 0x2038(%rbx),%eax
  4054fc:	84 c0                	test   %al,%al
  4054fe:	74 04                	je     405504 <dlerror@plt+0x3874>
  405500:	84 d2                	test   %dl,%dl
  405502:	74 0f                	je     405513 <dlerror@plt+0x3883>
  405504:	66 81 bb 38 20 00 00 	cmpw   $0x100,0x2038(%rbx)
  40550b:	00 01 
  40550d:	0f 85 97 00 00 00    	jne    4055aa <dlerror@plt+0x391a>
  405513:	31 c0                	xor    %eax,%eax
  405515:	e8 56 3b 00 00       	call   409070 <dlerror@plt+0x73e0>
  40551a:	48 89 de             	mov    %rbx,%rsi
  40551d:	48 89 83 30 20 00 00 	mov    %rax,0x2030(%rbx)
  405524:	48 89 c7             	mov    %rax,%rdi
  405527:	e8 54 36 00 00       	call   408b80 <dlerror@plt+0x6ef0>
  40552c:	85 c0                	test   %eax,%eax
  40552e:	0f 85 b4 03 00 00    	jne    4058e8 <dlerror@plt+0x3c58>
  405534:	80 bb 38 20 00 00 00 	cmpb   $0x0,0x2038(%rbx)
  40553b:	48 8b bb 30 20 00 00 	mov    0x2030(%rbx),%rdi
  405542:	0f 85 88 03 00 00    	jne    4058d0 <dlerror@plt+0x3c40>
  405548:	e8 e3 3a 00 00       	call   409030 <dlerror@plt+0x73a0>
  40554d:	85 c0                	test   %eax,%eax
  40554f:	0f 84 a6 03 00 00    	je     4058fb <dlerror@plt+0x3c6b>
  405555:	48 8d 3d 8c 61 00 00 	lea    0x618c(%rip),%rdi        # 40b6e8 <dlerror@plt+0x9a58>
  40555c:	31 c0                	xor    %eax,%eax
  40555e:	e8 cd ee ff ff       	call   404430 <dlerror@plt+0x27a0>
  405563:	48 8b bb 30 20 00 00 	mov    0x2030(%rbx),%rdi
  40556a:	e8 d1 3c 00 00       	call   409240 <dlerror@plt+0x75b0>
  40556f:	48 8d bb 30 20 00 00 	lea    0x2030(%rbx),%rdi
  405576:	e8 45 3b 00 00       	call   4090c0 <dlerror@plt+0x7430>
  40557b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  405580:	0f b6 83 38 20 00 00 	movzbl 0x2038(%rbx),%eax
  405587:	eb 21                	jmp    4055aa <dlerror@plt+0x391a>
  405589:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  405590:	48 8d 35 c7 62 00 00 	lea    0x62c7(%rip),%rsi        # 40b85e <dlerror@plt+0x9bce>
  405597:	48 8d 3d 30 62 00 00 	lea    0x6230(%rip),%rdi        # 40b7ce <dlerror@plt+0x9b3e>
  40559e:	e8 ad 44 00 00       	call   409a50 <dlerror@plt+0x7dc0>
  4055a3:	0f b6 83 38 20 00 00 	movzbl 0x2038(%rbx),%eax
  4055aa:	84 c0                	test   %al,%al
  4055ac:	48 89 df             	mov    %rbx,%rdi
  4055af:	74 0d                	je     4055be <dlerror@plt+0x392e>
  4055b1:	80 bb 39 20 00 00 00 	cmpb   $0x0,0x2039(%rbx)
  4055b8:	0f 84 f2 01 00 00    	je     4057b0 <dlerror@plt+0x3b20>
  4055be:	e8 ad f6 ff ff       	call   404c70 <dlerror@plt+0x2fe0>
  4055c3:	48 89 df             	mov    %rbx,%rdi
  4055c6:	e8 b5 f6 ff ff       	call   404c80 <dlerror@plt+0x2ff0>
  4055cb:	48 89 df             	mov    %rbx,%rdi
  4055ce:	89 c5                	mov    %eax,%ebp
  4055d0:	e8 1b f7 ff ff       	call   404cf0 <dlerror@plt+0x3060>
  4055d5:	48 8b bb 30 20 00 00 	mov    0x2030(%rbx),%rdi
  4055dc:	e8 5f 3c 00 00       	call   409240 <dlerror@plt+0x75b0>
  4055e1:	48 8d bb 30 20 00 00 	lea    0x2030(%rbx),%rdi
  4055e8:	e8 d3 3a 00 00       	call   4090c0 <dlerror@plt+0x7430>
  4055ed:	48 8b 94 24 78 10 00 	mov    0x1078(%rsp),%rdx
  4055f4:	00 
  4055f5:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  4055fc:	00 00 
  4055fe:	89 e8                	mov    %ebp,%eax
  405600:	0f 85 c8 03 00 00    	jne    4059ce <dlerror@plt+0x3d3e>
  405606:	48 81 c4 88 10 00 00 	add    $0x1088,%rsp
  40560d:	5b                   	pop    %rbx
  40560e:	5d                   	pop    %rbp
  40560f:	41 5c                	pop    %r12
  405611:	41 5d                	pop    %r13
  405613:	41 5e                	pop    %r14
  405615:	41 5f                	pop    %r15
  405617:	c3                   	ret
  405618:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40561f:	00 
  405620:	c6 83 68 40 00 00 01 	movb   $0x1,0x4068(%rbx)
  405627:	e9 5f fc ff ff       	jmp    40528b <dlerror@plt+0x35fb>
  40562c:	0f 1f 40 00          	nopl   0x0(%rax)
  405630:	40 80 fe fe          	cmp    $0xfe,%sil
  405634:	0f 85 26 01 00 00    	jne    405760 <dlerror@plt+0x3ad0>
  40563a:	80 bb 38 20 00 00 00 	cmpb   $0x0,0x2038(%rbx)
  405641:	74 1a                	je     40565d <dlerror@plt+0x39cd>
  405643:	80 bb 28 20 00 00 00 	cmpb   $0x0,0x2028(%rbx)
  40564a:	0f 84 50 01 00 00    	je     4057a0 <dlerror@plt+0x3b10>
  405650:	80 bb 29 20 00 00 00 	cmpb   $0x0,0x2029(%rbx)
  405657:	0f 85 43 01 00 00    	jne    4057a0 <dlerror@plt+0x3b10>
  40565d:	c6 83 39 20 00 00 ff 	movb   $0xff,0x2039(%rbx)
  405664:	41 b9 ff ff ff ff    	mov    $0xffffffff,%r9d
  40566a:	e9 4b fb ff ff       	jmp    4051ba <dlerror@plt+0x352a>
  40566f:	90                   	nop
  405670:	31 c9                	xor    %ecx,%ecx
  405672:	31 d2                	xor    %edx,%edx
  405674:	31 c0                	xor    %eax,%eax
  405676:	4c 89 e6             	mov    %r12,%rsi
  405679:	bf 10 00 00 00       	mov    $0x10,%edi
  40567e:	e8 cd c3 ff ff       	call   401a50 <prctl@plt>
  405683:	85 c0                	test   %eax,%eax
  405685:	0f 85 da fc ff ff    	jne    405365 <dlerror@plt+0x36d5>
  40568b:	48 8d 3d 4c 61 00 00 	lea    0x614c(%rip),%rdi        # 40b7de <dlerror@plt+0x9b4e>
  405692:	4c 89 e6             	mov    %r12,%rsi
  405695:	e8 b6 43 00 00       	call   409a50 <dlerror@plt+0x7dc0>
  40569a:	e9 c6 fc ff ff       	jmp    405365 <dlerror@plt+0x36d5>
  40569f:	90                   	nop
  4056a0:	48 89 ee             	mov    %rbp,%rsi
  4056a3:	4c 89 e7             	mov    %r12,%rdi
  4056a6:	4c 8d ab 3b 20 00 00 	lea    0x203b(%rbx),%r13
  4056ad:	e8 4e 07 00 00       	call   405e00 <dlerror@plt+0x4170>
  4056b2:	48 8b 93 60 40 00 00 	mov    0x4060(%rbx),%rdx
  4056b9:	48 85 d2             	test   %rdx,%rdx
  4056bc:	0f 84 be 00 00 00    	je     405780 <dlerror@plt+0x3af0>
  4056c2:	4c 89 e6             	mov    %r12,%rsi
  4056c5:	4c 89 ef             	mov    %r13,%rdi
  4056c8:	e8 e3 07 00 00       	call   405eb0 <dlerror@plt+0x4220>
  4056cd:	e9 f8 fc ff ff       	jmp    4053ca <dlerror@plt+0x373a>
  4056d2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4056d8:	31 d2                	xor    %edx,%edx
  4056da:	4c 89 f6             	mov    %r14,%rsi
  4056dd:	48 89 c7             	mov    %rax,%rdi
  4056e0:	e8 2b c3 ff ff       	call   401a10 <strtol@plt>
  4056e5:	88 83 3a 20 00 00    	mov    %al,0x203a(%rbx)
  4056eb:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  4056f0:	80 38 00             	cmpb   $0x0,(%rax)
  4056f3:	0f 84 69 f8 ff ff    	je     404f62 <dlerror@plt+0x32d2>
  4056f9:	48 8d 3d 48 5d 00 00 	lea    0x5d48(%rip),%rdi        # 40b448 <dlerror@plt+0x97b8>
  405700:	4c 89 ee             	mov    %r13,%rsi
  405703:	31 c0                	xor    %eax,%eax
  405705:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
  40570a:	e8 e1 ed ff ff       	call   4044f0 <dlerror@plt+0x2860>
  40570f:	e9 d9 fe ff ff       	jmp    4055ed <dlerror@plt+0x395d>
  405714:	0f 1f 40 00          	nopl   0x0(%rax)
  405718:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  40571c:	48 89 ef             	mov    %rbp,%rdi
  40571f:	e8 ec c4 ff ff       	call   401c10 <execvp@plt>
  405724:	85 c0                	test   %eax,%eax
  405726:	0f 89 9f fd ff ff    	jns    4054cb <dlerror@plt+0x383b>
  40572c:	e8 9f c0 ff ff       	call   4017d0 <__errno_location@plt>
  405731:	8b 38                	mov    (%rax),%edi
  405733:	e8 28 c5 ff ff       	call   401c60 <strerror@plt>
  405738:	48 8d 3d 11 5f 00 00 	lea    0x5f11(%rip),%rdi        # 40b650 <dlerror@plt+0x99c0>
  40573f:	48 89 c6             	mov    %rax,%rsi
  405742:	31 c0                	xor    %eax,%eax
  405744:	e8 a7 ed ff ff       	call   4044f0 <dlerror@plt+0x2860>
  405749:	e9 41 f9 ff ff       	jmp    40508f <dlerror@plt+0x33ff>
  40574e:	66 90                	xchg   %ax,%ax
  405750:	e8 6b c0 ff ff       	call   4017c0 <free@plt>
  405755:	e9 a5 f7 ff ff       	jmp    404eff <dlerror@plt+0x326f>
  40575a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  405760:	48 8d 3d 11 5d 00 00 	lea    0x5d11(%rip),%rdi        # 40b478 <dlerror@plt+0x97e8>
  405767:	31 c0                	xor    %eax,%eax
  405769:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
  40576e:	e8 7d ed ff ff       	call   4044f0 <dlerror@plt+0x2860>
  405773:	e9 75 fe ff ff       	jmp    4055ed <dlerror@plt+0x395d>
  405778:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40577f:	00 
  405780:	48 8d 15 a0 51 00 00 	lea    0x51a0(%rip),%rdx        # 40a927 <dlerror@plt+0x8c97>
  405787:	4c 89 e1             	mov    %r12,%rcx
  40578a:	be 00 10 00 00       	mov    $0x1000,%esi
  40578f:	4c 89 ef             	mov    %r13,%rdi
  405792:	31 c0                	xor    %eax,%eax
  405794:	e8 b7 c1 ff ff       	call   401950 <snprintf@plt>
  405799:	e9 2c fc ff ff       	jmp    4053ca <dlerror@plt+0x373a>
  40579e:	66 90                	xchg   %ax,%ax
  4057a0:	c6 83 39 20 00 00 00 	movb   $0x0,0x2039(%rbx)
  4057a7:	45 31 c9             	xor    %r9d,%r9d
  4057aa:	e9 0b fa ff ff       	jmp    4051ba <dlerror@plt+0x352a>
  4057af:	90                   	nop
  4057b0:	e8 eb f1 ff ff       	call   4049a0 <dlerror@plt+0x2d10>
  4057b5:	85 c0                	test   %eax,%eax
  4057b7:	0f 88 d2 f8 ff ff    	js     40508f <dlerror@plt+0x33ff>
  4057bd:	48 89 df             	mov    %rbx,%rdi
  4057c0:	e8 cb 48 00 00       	call   40a090 <dlerror@plt+0x8400>
  4057c5:	48 89 df             	mov    %rbx,%rdi
  4057c8:	89 c5                	mov    %eax,%ebp
  4057ca:	e8 41 f5 ff ff       	call   404d10 <dlerror@plt+0x3080>
  4057cf:	85 c0                	test   %eax,%eax
  4057d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4057d6:	0f 48 e8             	cmovs  %eax,%ebp
  4057d9:	8b 83 50 40 00 00    	mov    0x4050(%rbx),%eax
  4057df:	85 c0                	test   %eax,%eax
  4057e1:	0f 84 06 fe ff ff    	je     4055ed <dlerror@plt+0x395d>
  4057e7:	8b bb 54 40 00 00    	mov    0x4054(%rbx),%edi
  4057ed:	e8 be bf ff ff       	call   4017b0 <raise@plt>
  4057f2:	e9 f6 fd ff ff       	jmp    4055ed <dlerror@plt+0x395d>
  4057f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4057fe:	00 00 
  405800:	4c 89 ef             	mov    %r13,%rdi
  405803:	e8 a8 c0 ff ff       	call   4018b0 <fclose@plt>
  405808:	48 8d 3d 79 5b 00 00 	lea    0x5b79(%rip),%rdi        # 40b388 <dlerror@plt+0x96f8>
  40580f:	48 89 ee             	mov    %rbp,%rsi
  405812:	31 c0                	xor    %eax,%eax
  405814:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
  405819:	e8 d2 ec ff ff       	call   4044f0 <dlerror@plt+0x2860>
  40581e:	e9 ca fd ff ff       	jmp    4055ed <dlerror@plt+0x395d>
  405823:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  405828:	48 8d 3d f6 72 00 00 	lea    0x72f6(%rip),%rdi        # 40cb25 <dlerror@plt+0xae95>
  40582f:	e8 ec 41 00 00       	call   409a20 <dlerror@plt+0x7d90>
  405834:	48 85 c0             	test   %rax,%rax
  405837:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  40583c:	0f 84 34 f8 ff ff    	je     405076 <dlerror@plt+0x33e6>
  405842:	48 8d 35 1f 5f 00 00 	lea    0x5f1f(%rip),%rsi        # 40b768 <dlerror@plt+0x9ad8>
  405849:	48 89 c7             	mov    %rax,%rdi
  40584c:	e8 8f c3 ff ff       	call   401be0 <strtok@plt>
  405851:	48 85 c0             	test   %rax,%rax
  405854:	74 3c                	je     405892 <dlerror@plt+0x3c02>
  405856:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40585d:	00 00 00 
  405860:	4c 89 ea             	mov    %r13,%rdx
  405863:	48 89 c6             	mov    %rax,%rsi
  405866:	4c 89 e7             	mov    %r12,%rdi
  405869:	e8 42 06 00 00       	call   405eb0 <dlerror@plt+0x4220>
  40586e:	48 85 c0             	test   %rax,%rax
  405871:	74 0c                	je     40587f <dlerror@plt+0x3bef>
  405873:	4c 89 e7             	mov    %r12,%rdi
  405876:	e8 d5 06 00 00       	call   405f50 <dlerror@plt+0x42c0>
  40587b:	85 c0                	test   %eax,%eax
  40587d:	75 22                	jne    4058a1 <dlerror@plt+0x3c11>
  40587f:	48 8d 35 e2 5e 00 00 	lea    0x5ee2(%rip),%rsi        # 40b768 <dlerror@plt+0x9ad8>
  405886:	31 ff                	xor    %edi,%edi
  405888:	e8 53 c3 ff ff       	call   401be0 <strtok@plt>
  40588d:	48 85 c0             	test   %rax,%rax
  405890:	75 ce                	jne    405860 <dlerror@plt+0x3bd0>
  405892:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  405897:	e8 24 bf ff ff       	call   4017c0 <free@plt>
  40589c:	e9 d5 f7 ff ff       	jmp    405076 <dlerror@plt+0x33e6>
  4058a1:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  4058a6:	e8 15 bf ff ff       	call   4017c0 <free@plt>
  4058ab:	ba 00 10 00 00       	mov    $0x1000,%edx
  4058b0:	48 89 ee             	mov    %rbp,%rsi
  4058b3:	4c 89 e7             	mov    %r12,%rdi
  4058b6:	e8 d5 c0 ff ff       	call   401990 <__realpath_chk@plt>
  4058bb:	48 85 c0             	test   %rax,%rax
  4058be:	0f 85 84 f5 ff ff    	jne    404e48 <dlerror@plt+0x31b8>
  4058c4:	e9 c6 f7 ff ff       	jmp    40508f <dlerror@plt+0x33ff>
  4058c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4058d0:	48 89 de             	mov    %rbx,%rsi
  4058d3:	e8 f8 34 00 00       	call   408dd0 <dlerror@plt+0x7140>
  4058d8:	85 c0                	test   %eax,%eax
  4058da:	75 61                	jne    40593d <dlerror@plt+0x3cad>
  4058dc:	48 8b bb 30 20 00 00 	mov    0x2030(%rbx),%rdi
  4058e3:	e9 60 fc ff ff       	jmp    405548 <dlerror@plt+0x38b8>
  4058e8:	48 8d 3d 89 5d 00 00 	lea    0x5d89(%rip),%rdi        # 40b678 <dlerror@plt+0x99e8>
  4058ef:	31 c0                	xor    %eax,%eax
  4058f1:	e8 3a eb ff ff       	call   404430 <dlerror@plt+0x27a0>
  4058f6:	e9 68 fc ff ff       	jmp    405563 <dlerror@plt+0x38d3>
  4058fb:	48 8b bb 30 20 00 00 	mov    0x2030(%rbx),%rdi
  405902:	48 89 ee             	mov    %rbp,%rsi
  405905:	e8 16 3a 00 00       	call   409320 <dlerror@plt+0x7690>
  40590a:	85 c0                	test   %eax,%eax
  40590c:	0f 84 6e fc ff ff    	je     405580 <dlerror@plt+0x38f0>
  405912:	48 8d 3d 0f 5e 00 00 	lea    0x5e0f(%rip),%rdi        # 40b728 <dlerror@plt+0x9a98>
  405919:	31 c0                	xor    %eax,%eax
  40591b:	e8 10 eb ff ff       	call   404430 <dlerror@plt+0x27a0>
  405920:	e9 3e fc ff ff       	jmp    405563 <dlerror@plt+0x38d3>
  405925:	48 8d 3d 44 5c 00 00 	lea    0x5c44(%rip),%rdi        # 40b570 <dlerror@plt+0x98e0>
  40592c:	31 c0                	xor    %eax,%eax
  40592e:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
  405933:	e8 b8 eb ff ff       	call   4044f0 <dlerror@plt+0x2860>
  405938:	e9 b0 fc ff ff       	jmp    4055ed <dlerror@plt+0x395d>
  40593d:	48 8d 3d 64 5d 00 00 	lea    0x5d64(%rip),%rdi        # 40b6a8 <dlerror@plt+0x9a18>
  405944:	31 c0                	xor    %eax,%eax
  405946:	e8 e5 ea ff ff       	call   404430 <dlerror@plt+0x27a0>
  40594b:	e9 13 fc ff ff       	jmp    405563 <dlerror@plt+0x38d3>
  405950:	48 8d 3d 59 5c 00 00 	lea    0x5c59(%rip),%rdi        # 40b5b0 <dlerror@plt+0x9920>
  405957:	31 c0                	xor    %eax,%eax
  405959:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
  40595e:	e8 8d eb ff ff       	call   4044f0 <dlerror@plt+0x2860>
  405963:	4c 89 e7             	mov    %r12,%rdi
  405966:	e8 55 be ff ff       	call   4017c0 <free@plt>
  40596b:	e9 7d fc ff ff       	jmp    4055ed <dlerror@plt+0x395d>
  405970:	48 8d 3d 89 5b 00 00 	lea    0x5b89(%rip),%rdi        # 40b500 <dlerror@plt+0x9870>
  405977:	31 c0                	xor    %eax,%eax
  405979:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
  40597e:	e8 6d eb ff ff       	call   4044f0 <dlerror@plt+0x2860>
  405983:	e9 65 fc ff ff       	jmp    4055ed <dlerror@plt+0x395d>
  405988:	48 8d 3d 89 5c 00 00 	lea    0x5c89(%rip),%rdi        # 40b618 <dlerror@plt+0x9988>
  40598f:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
  405994:	e8 57 eb ff ff       	call   4044f0 <dlerror@plt+0x2860>
  405999:	e9 4f fc ff ff       	jmp    4055ed <dlerror@plt+0x395d>
  40599e:	48 8d 3d fb 5a 00 00 	lea    0x5afb(%rip),%rdi        # 40b4a0 <dlerror@plt+0x9810>
  4059a5:	31 c0                	xor    %eax,%eax
  4059a7:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
  4059ac:	e8 3f eb ff ff       	call   4044f0 <dlerror@plt+0x2860>
  4059b1:	e9 37 fc ff ff       	jmp    4055ed <dlerror@plt+0x395d>
  4059b6:	48 8d 3d 6b 5b 00 00 	lea    0x5b6b(%rip),%rdi        # 40b528 <dlerror@plt+0x9898>
  4059bd:	31 c0                	xor    %eax,%eax
  4059bf:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
  4059c4:	e8 27 eb ff ff       	call   4044f0 <dlerror@plt+0x2860>
  4059c9:	e9 1f fc ff ff       	jmp    4055ed <dlerror@plt+0x395d>
  4059ce:	e8 2d bf ff ff       	call   401900 <__stack_chk_fail@plt>
  4059d3:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4059da:	00 00 00 
  4059dd:	0f 1f 00             	nopl   (%rax)
  4059e0:	53                   	push   %rbx
  4059e1:	48 89 fb             	mov    %rdi,%rbx
  4059e4:	48 81 ec d0 00 00 00 	sub    $0xd0,%rsp
  4059eb:	84 c0                	test   %al,%al
  4059ed:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
  4059f2:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  4059f7:	4c 89 44 24 40       	mov    %r8,0x40(%rsp)
  4059fc:	4c 89 4c 24 48       	mov    %r9,0x48(%rsp)
  405a01:	74 37                	je     405a3a <dlerror@plt+0x3daa>
  405a03:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  405a08:	0f 29 4c 24 60       	movaps %xmm1,0x60(%rsp)
  405a0d:	0f 29 54 24 70       	movaps %xmm2,0x70(%rsp)
  405a12:	0f 29 9c 24 80 00 00 	movaps %xmm3,0x80(%rsp)
  405a19:	00 
  405a1a:	0f 29 a4 24 90 00 00 	movaps %xmm4,0x90(%rsp)
  405a21:	00 
  405a22:	0f 29 ac 24 a0 00 00 	movaps %xmm5,0xa0(%rsp)
  405a29:	00 
  405a2a:	0f 29 b4 24 b0 00 00 	movaps %xmm6,0xb0(%rsp)
  405a31:	00 
  405a32:	0f 29 bc 24 c0 00 00 	movaps %xmm7,0xc0(%rsp)
  405a39:	00 
  405a3a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  405a41:	00 00 
  405a43:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  405a48:	31 c0                	xor    %eax,%eax
  405a4a:	48 8d 84 24 e0 00 00 	lea    0xe0(%rsp),%rax
  405a51:	00 
  405a52:	49 89 f0             	mov    %rsi,%r8
  405a55:	49 89 e1             	mov    %rsp,%r9
  405a58:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  405a5f:	ba 01 00 00 00       	mov    $0x1,%edx
  405a64:	be 00 10 00 00       	mov    $0x1000,%esi
  405a69:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  405a6e:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
  405a73:	48 89 df             	mov    %rbx,%rdi
  405a76:	c7 04 24 10 00 00 00 	movl   $0x10,(%rsp)
  405a7d:	c7 44 24 04 30 00 00 	movl   $0x30,0x4(%rsp)
  405a84:	00 
  405a85:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  405a8a:	e8 91 c0 ff ff       	call   401b20 <__vsnprintf_chk@plt>
  405a8f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  405a94:	7f 2a                	jg     405ac0 <dlerror@plt+0x3e30>
  405a96:	48 89 df             	mov    %rbx,%rdi
  405a99:	e8 b2 04 00 00       	call   405f50 <dlerror@plt+0x42c0>
  405a9e:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
  405aa3:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  405aaa:	00 00 
  405aac:	75 19                	jne    405ac7 <dlerror@plt+0x3e37>
  405aae:	48 81 c4 d0 00 00 00 	add    $0xd0,%rsp
  405ab5:	5b                   	pop    %rbx
  405ab6:	c3                   	ret
  405ab7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  405abe:	00 00 
  405ac0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  405ac5:	eb d7                	jmp    405a9e <dlerror@plt+0x3e0e>
  405ac7:	e8 34 be ff ff       	call   401900 <__stack_chk_fail@plt>
  405acc:	0f 1f 40 00          	nopl   0x0(%rax)
  405ad0:	55                   	push   %rbp
  405ad1:	53                   	push   %rbx
  405ad2:	48 89 d1             	mov    %rdx,%rcx
  405ad5:	48 8d 15 4b 4e 00 00 	lea    0x4e4b(%rip),%rdx        # 40a927 <dlerror@plt+0x8c97>
  405adc:	31 c0                	xor    %eax,%eax
  405ade:	48 89 f5             	mov    %rsi,%rbp
  405ae1:	48 83 ec 08          	sub    $0x8,%rsp
  405ae5:	be 00 10 00 00       	mov    $0x1000,%esi
  405aea:	48 89 fb             	mov    %rdi,%rbx
  405aed:	e8 5e be ff ff       	call   401950 <snprintf@plt>
  405af2:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  405af7:	7f 3f                	jg     405b38 <dlerror@plt+0x3ea8>
  405af9:	be 3a 00 00 00       	mov    $0x3a,%esi
  405afe:	48 89 df             	mov    %rbx,%rdi
  405b01:	e8 1a be ff ff       	call   401920 <strchr@plt>
  405b06:	48 85 c0             	test   %rax,%rax
  405b09:	74 2d                	je     405b38 <dlerror@plt+0x3ea8>
  405b0b:	48 8d 70 01          	lea    0x1(%rax),%rsi
  405b0f:	c6 00 00             	movb   $0x0,(%rax)
  405b12:	48 89 ef             	mov    %rbp,%rdi
  405b15:	e8 f6 bc ff ff       	call   401810 <strcpy@plt>
  405b1a:	80 3b 00             	cmpb   $0x0,(%rbx)
  405b1d:	74 19                	je     405b38 <dlerror@plt+0x3ea8>
  405b1f:	31 c0                	xor    %eax,%eax
  405b21:	80 7d 00 00          	cmpb   $0x0,0x0(%rbp)
  405b25:	0f 94 c0             	sete   %al
  405b28:	f7 d8                	neg    %eax
  405b2a:	48 83 c4 08          	add    $0x8,%rsp
  405b2e:	5b                   	pop    %rbx
  405b2f:	5d                   	pop    %rbp
  405b30:	c3                   	ret
  405b31:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  405b38:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  405b3d:	eb eb                	jmp    405b2a <dlerror@plt+0x3e9a>
  405b3f:	90                   	nop
  405b40:	41 57                	push   %r15
  405b42:	41 56                	push   %r14
  405b44:	49 89 ce             	mov    %rcx,%r14
  405b47:	41 55                	push   %r13
  405b49:	41 54                	push   %r12
  405b4b:	49 89 f5             	mov    %rsi,%r13
  405b4e:	55                   	push   %rbp
  405b4f:	53                   	push   %rbx
  405b50:	48 8d 77 20          	lea    0x20(%rdi),%rsi
  405b54:	49 89 fc             	mov    %rdi,%r12
  405b57:	48 89 d5             	mov    %rdx,%rbp
  405b5a:	48 81 ec 28 40 00 00 	sub    $0x4028,%rsp
  405b61:	48 8d 9c 24 10 10 00 	lea    0x1010(%rsp),%rbx
  405b68:	00 
  405b69:	4c 8d 7c 24 10       	lea    0x10(%rsp),%r15
  405b6e:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
  405b73:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  405b7a:	00 00 
  405b7c:	48 89 84 24 18 40 00 	mov    %rax,0x4018(%rsp)
  405b83:	00 
  405b84:	31 c0                	xor    %eax,%eax
  405b86:	48 89 df             	mov    %rbx,%rdi
  405b89:	e8 72 02 00 00       	call   405e00 <dlerror@plt+0x4170>
  405b8e:	48 89 ee             	mov    %rbp,%rsi
  405b91:	4c 89 ff             	mov    %r15,%rdi
  405b94:	e8 67 02 00 00       	call   405e00 <dlerror@plt+0x4170>
  405b99:	49 8b 84 24 60 40 00 	mov    0x4060(%r12),%rax
  405ba0:	00 
  405ba1:	4c 8d a4 24 10 20 00 	lea    0x2010(%rsp),%r12
  405ba8:	00 
  405ba9:	48 85 c0             	test   %rax,%rax
  405bac:	0f 84 96 01 00 00    	je     405d48 <dlerror@plt+0x40b8>
  405bb2:	48 83 ec 08          	sub    $0x8,%rsp
  405bb6:	48 8d 35 a3 5c 00 00 	lea    0x5ca3(%rip),%rsi        # 40b860 <dlerror@plt+0x9bd0>
  405bbd:	41 b9 2f 00 00 00    	mov    $0x2f,%r9d
  405bc3:	41 56                	push   %r14
  405bc5:	6a 2f                	push   $0x2f
  405bc7:	4d 89 f8             	mov    %r15,%r8
  405bca:	50                   	push   %rax
  405bcb:	b9 2f 00 00 00       	mov    $0x2f,%ecx
  405bd0:	48 89 da             	mov    %rbx,%rdx
  405bd3:	4c 89 e7             	mov    %r12,%rdi
  405bd6:	31 c0                	xor    %eax,%eax
  405bd8:	e8 03 fe ff ff       	call   4059e0 <dlerror@plt+0x3d50>
  405bdd:	48 83 c4 20          	add    $0x20,%rsp
  405be1:	83 f8 01             	cmp    $0x1,%eax
  405be4:	0f 84 06 01 00 00    	je     405cf0 <dlerror@plt+0x4060>
  405bea:	4c 8d a4 24 10 30 00 	lea    0x3010(%rsp),%r12
  405bf1:	00 
  405bf2:	48 8d 35 76 5c 00 00 	lea    0x5c76(%rip),%rsi        # 40b86f <dlerror@plt+0x9bdf>
  405bf9:	31 c0                	xor    %eax,%eax
  405bfb:	49 89 e8             	mov    %rbp,%r8
  405bfe:	b9 2f 00 00 00       	mov    $0x2f,%ecx
  405c03:	48 89 da             	mov    %rbx,%rdx
  405c06:	4c 89 e7             	mov    %r12,%rdi
  405c09:	e8 d2 fd ff ff       	call   4059e0 <dlerror@plt+0x3d50>
  405c0e:	83 f8 01             	cmp    $0x1,%eax
  405c11:	74 46                	je     405c59 <dlerror@plt+0x3fc9>
  405c13:	48 8d 35 60 5c 00 00 	lea    0x5c60(%rip),%rsi        # 40b87a <dlerror@plt+0x9bea>
  405c1a:	31 c0                	xor    %eax,%eax
  405c1c:	49 89 e8             	mov    %rbp,%r8
  405c1f:	b9 2f 00 00 00       	mov    $0x2f,%ecx
  405c24:	48 89 da             	mov    %rbx,%rdx
  405c27:	4c 89 e7             	mov    %r12,%rdi
  405c2a:	e8 b1 fd ff ff       	call   4059e0 <dlerror@plt+0x3d50>
  405c2f:	83 f8 01             	cmp    $0x1,%eax
  405c32:	74 25                	je     405c59 <dlerror@plt+0x3fc9>
  405c34:	48 8d 35 2d 5c 00 00 	lea    0x5c2d(%rip),%rsi        # 40b868 <dlerror@plt+0x9bd8>
  405c3b:	31 c0                	xor    %eax,%eax
  405c3d:	49 89 e8             	mov    %rbp,%r8
  405c40:	b9 2f 00 00 00       	mov    $0x2f,%ecx
  405c45:	48 89 da             	mov    %rbx,%rdx
  405c48:	4c 89 e7             	mov    %r12,%rdi
  405c4b:	e8 90 fd ff ff       	call   4059e0 <dlerror@plt+0x3d50>
  405c50:	83 f8 01             	cmp    $0x1,%eax
  405c53:	0f 85 47 01 00 00    	jne    405da0 <dlerror@plt+0x4110>
  405c59:	4d 8b 7d 00          	mov    0x0(%r13),%r15
  405c5d:	4d 85 ff             	test   %r15,%r15
  405c60:	0f 84 bf 00 00 00    	je     405d25 <dlerror@plt+0x4095>
  405c66:	49 8d 5d 08          	lea    0x8(%r13),%rbx
  405c6a:	31 ed                	xor    %ebp,%ebp
  405c6c:	eb 19                	jmp    405c87 <dlerror@plt+0x3ff7>
  405c6e:	66 90                	xchg   %ax,%ax
  405c70:	49 89 dd             	mov    %rbx,%r13
  405c73:	48 83 c3 08          	add    $0x8,%rbx
  405c77:	4c 8b 7b f8          	mov    -0x8(%rbx),%r15
  405c7b:	83 c5 01             	add    $0x1,%ebp
  405c7e:	4d 85 ff             	test   %r15,%r15
  405c81:	0f 84 99 00 00 00    	je     405d20 <dlerror@plt+0x4090>
  405c87:	4c 89 e6             	mov    %r12,%rsi
  405c8a:	4c 89 ff             	mov    %r15,%rdi
  405c8d:	e8 3e bd ff ff       	call   4019d0 <strcmp@plt>
  405c92:	85 c0                	test   %eax,%eax
  405c94:	75 da                	jne    405c70 <dlerror@plt+0x3fe0>
  405c96:	4c 89 f6             	mov    %r14,%rsi
  405c99:	4c 89 ff             	mov    %r15,%rdi
  405c9c:	e8 bf cc ff ff       	call   402960 <dlerror@plt+0xcd0>
  405ca1:	48 85 c0             	test   %rax,%rax
  405ca4:	0f 84 32 01 00 00    	je     405ddc <dlerror@plt+0x414c>
  405caa:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  405caf:	48 89 c6             	mov    %rax,%rsi
  405cb2:	4c 89 ff             	mov    %r15,%rdi
  405cb5:	e8 46 c6 ff ff       	call   402300 <dlerror@plt+0x670>
  405cba:	85 c0                	test   %eax,%eax
  405cbc:	0f 88 f1 00 00 00    	js     405db3 <dlerror@plt+0x4123>
  405cc2:	31 db                	xor    %ebx,%ebx
  405cc4:	48 8b 8c 24 18 40 00 	mov    0x4018(%rsp),%rcx
  405ccb:	00 
  405ccc:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  405cd3:	00 00 
  405cd5:	89 d8                	mov    %ebx,%eax
  405cd7:	0f 85 15 01 00 00    	jne    405df2 <dlerror@plt+0x4162>
  405cdd:	48 81 c4 28 40 00 00 	add    $0x4028,%rsp
  405ce4:	5b                   	pop    %rbx
  405ce5:	5d                   	pop    %rbp
  405ce6:	41 5c                	pop    %r12
  405ce8:	41 5d                	pop    %r13
  405cea:	41 5e                	pop    %r14
  405cec:	41 5f                	pop    %r15
  405cee:	c3                   	ret
  405cef:	90                   	nop
  405cf0:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  405cf5:	4c 89 e7             	mov    %r12,%rdi
  405cf8:	e8 83 38 00 00       	call   409580 <dlerror@plt+0x78f0>
  405cfd:	83 f8 ff             	cmp    $0xffffffff,%eax
  405d00:	89 c3                	mov    %eax,%ebx
  405d02:	75 be                	jne    405cc2 <dlerror@plt+0x4032>
  405d04:	48 8d 3d 9d 5b 00 00 	lea    0x5b9d(%rip),%rdi        # 40b8a8 <dlerror@plt+0x9c18>
  405d0b:	4c 89 e2             	mov    %r12,%rdx
  405d0e:	4c 89 f6             	mov    %r14,%rsi
  405d11:	31 c0                	xor    %eax,%eax
  405d13:	e8 d8 e7 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  405d18:	eb aa                	jmp    405cc4 <dlerror@plt+0x4034>
  405d1a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  405d20:	83 fd 13             	cmp    $0x13,%ebp
  405d23:	7f 52                	jg     405d77 <dlerror@plt+0x40e7>
  405d25:	4c 89 e7             	mov    %r12,%rdi
  405d28:	e8 c3 c8 ff ff       	call   4025f0 <dlerror@plt+0x960>
  405d2d:	48 85 c0             	test   %rax,%rax
  405d30:	49 89 c7             	mov    %rax,%r15
  405d33:	0f 84 90 00 00 00    	je     405dc9 <dlerror@plt+0x4139>
  405d39:	49 89 45 00          	mov    %rax,0x0(%r13)
  405d3d:	e9 54 ff ff ff       	jmp    405c96 <dlerror@plt+0x4006>
  405d42:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  405d48:	48 83 ec 08          	sub    $0x8,%rsp
  405d4c:	48 8d 35 11 5b 00 00 	lea    0x5b11(%rip),%rsi        # 40b864 <dlerror@plt+0x9bd4>
  405d53:	b9 2f 00 00 00       	mov    $0x2f,%ecx
  405d58:	41 56                	push   %r14
  405d5a:	48 89 da             	mov    %rbx,%rdx
  405d5d:	41 b9 2f 00 00 00    	mov    $0x2f,%r9d
  405d63:	4d 89 f8             	mov    %r15,%r8
  405d66:	4c 89 e7             	mov    %r12,%rdi
  405d69:	31 c0                	xor    %eax,%eax
  405d6b:	e8 70 fc ff ff       	call   4059e0 <dlerror@plt+0x3d50>
  405d70:	5a                   	pop    %rdx
  405d71:	59                   	pop    %rcx
  405d72:	e9 6a fe ff ff       	jmp    405be1 <dlerror@plt+0x3f51>
  405d77:	48 8d 3d 82 5b 00 00 	lea    0x5b82(%rip),%rdi        # 40b900 <dlerror@plt+0x9c70>
  405d7e:	31 c0                	xor    %eax,%eax
  405d80:	e8 6b e7 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  405d85:	48 8d 3d 9c 5b 00 00 	lea    0x5b9c(%rip),%rdi        # 40b928 <dlerror@plt+0x9c98>
  405d8c:	4c 89 e6             	mov    %r12,%rsi
  405d8f:	31 c0                	xor    %eax,%eax
  405d91:	e8 5a e7 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  405d96:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  405d9b:	e9 24 ff ff ff       	jmp    405cc4 <dlerror@plt+0x4034>
  405da0:	48 8d 3d 29 5b 00 00 	lea    0x5b29(%rip),%rdi        # 40b8d0 <dlerror@plt+0x9c40>
  405da7:	48 89 ee             	mov    %rbp,%rsi
  405daa:	31 c0                	xor    %eax,%eax
  405dac:	e8 3f e7 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  405db1:	eb e3                	jmp    405d96 <dlerror@plt+0x4106>
  405db3:	48 8d 3d e6 5b 00 00 	lea    0x5be6(%rip),%rdi        # 40b9a0 <dlerror@plt+0x9d10>
  405dba:	4c 89 e2             	mov    %r12,%rdx
  405dbd:	4c 89 f6             	mov    %r14,%rsi
  405dc0:	31 c0                	xor    %eax,%eax
  405dc2:	e8 29 e7 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  405dc7:	eb cd                	jmp    405d96 <dlerror@plt+0x4106>
  405dc9:	48 8d 3d b5 5a 00 00 	lea    0x5ab5(%rip),%rdi        # 40b885 <dlerror@plt+0x9bf5>
  405dd0:	4c 89 e6             	mov    %r12,%rsi
  405dd3:	31 c0                	xor    %eax,%eax
  405dd5:	e8 16 e7 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  405dda:	eb a9                	jmp    405d85 <dlerror@plt+0x40f5>
  405ddc:	48 8d 3d 7d 5b 00 00 	lea    0x5b7d(%rip),%rdi        # 40b960 <dlerror@plt+0x9cd0>
  405de3:	4c 89 e2             	mov    %r12,%rdx
  405de6:	4c 89 f6             	mov    %r14,%rsi
  405de9:	31 c0                	xor    %eax,%eax
  405deb:	e8 00 e7 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  405df0:	eb a4                	jmp    405d96 <dlerror@plt+0x4106>
  405df2:	e8 09 bb ff ff       	call   401900 <__stack_chk_fail@plt>
  405df7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  405dfe:	00 00 
  405e00:	55                   	push   %rbp
  405e01:	53                   	push   %rbx
  405e02:	48 8d 15 1e 4b 00 00 	lea    0x4b1e(%rip),%rdx        # 40a927 <dlerror@plt+0x8c97>
  405e09:	48 89 f1             	mov    %rsi,%rcx
  405e0c:	48 89 fd             	mov    %rdi,%rbp
  405e0f:	be 00 10 00 00       	mov    $0x1000,%esi
  405e14:	48 81 ec 18 10 00 00 	sub    $0x1018,%rsp
  405e1b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  405e22:	00 00 
  405e24:	48 89 84 24 08 10 00 	mov    %rax,0x1008(%rsp)
  405e2b:	00 
  405e2c:	31 c0                	xor    %eax,%eax
  405e2e:	48 89 e3             	mov    %rsp,%rbx
  405e31:	48 89 df             	mov    %rbx,%rdi
  405e34:	e8 17 bb ff ff       	call   401950 <snprintf@plt>
  405e39:	31 d2                	xor    %edx,%edx
  405e3b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  405e40:	7f 29                	jg     405e6b <dlerror@plt+0x41db>
  405e42:	48 89 df             	mov    %rbx,%rdi
  405e45:	e8 16 bb ff ff       	call   401960 <dirname@plt>
  405e4a:	48 8d 15 d6 4a 00 00 	lea    0x4ad6(%rip),%rdx        # 40a927 <dlerror@plt+0x8c97>
  405e51:	48 89 c1             	mov    %rax,%rcx
  405e54:	be 00 10 00 00       	mov    $0x1000,%esi
  405e59:	31 c0                	xor    %eax,%eax
  405e5b:	48 89 ef             	mov    %rbp,%rdi
  405e5e:	e8 ed ba ff ff       	call   401950 <snprintf@plt>
  405e63:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  405e68:	0f 9e c2             	setle  %dl
  405e6b:	48 8b b4 24 08 10 00 	mov    0x1008(%rsp),%rsi
  405e72:	00 
  405e73:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  405e7a:	00 00 
  405e7c:	89 d0                	mov    %edx,%eax
  405e7e:	75 0a                	jne    405e8a <dlerror@plt+0x41fa>
  405e80:	48 81 c4 18 10 00 00 	add    $0x1018,%rsp
  405e87:	5b                   	pop    %rbx
  405e88:	5d                   	pop    %rbp
  405e89:	c3                   	ret
  405e8a:	e8 71 ba ff ff       	call   401900 <__stack_chk_fail@plt>
  405e8f:	90                   	nop
  405e90:	53                   	push   %rbx
  405e91:	48 89 fb             	mov    %rdi,%rbx
  405e94:	48 89 f7             	mov    %rsi,%rdi
  405e97:	e8 e4 bb ff ff       	call   401a80 <__xpg_basename@plt>
  405e9c:	48 89 df             	mov    %rbx,%rdi
  405e9f:	48 89 c6             	mov    %rax,%rsi
  405ea2:	e8 69 b9 ff ff       	call   401810 <strcpy@plt>
  405ea7:	b8 01 00 00 00       	mov    $0x1,%eax
  405eac:	5b                   	pop    %rbx
  405ead:	c3                   	ret
  405eae:	66 90                	xchg   %ax,%ax
  405eb0:	41 54                	push   %r12
  405eb2:	49 89 d4             	mov    %rdx,%r12
  405eb5:	55                   	push   %rbp
  405eb6:	48 8d 15 6a 4a 00 00 	lea    0x4a6a(%rip),%rdx        # 40a927 <dlerror@plt+0x8c97>
  405ebd:	53                   	push   %rbx
  405ebe:	48 89 f1             	mov    %rsi,%rcx
  405ec1:	31 c0                	xor    %eax,%eax
  405ec3:	be 00 10 00 00       	mov    $0x1000,%esi
  405ec8:	48 89 fb             	mov    %rdi,%rbx
  405ecb:	e8 80 ba ff ff       	call   401950 <snprintf@plt>
  405ed0:	48 98                	cltq
  405ed2:	48 3d fe 0f 00 00    	cmp    $0xffe,%rax
  405ed8:	77 6e                	ja     405f48 <dlerror@plt+0x42b8>
  405eda:	80 7c 03 ff 2f       	cmpb   $0x2f,-0x1(%rbx,%rax,1)
  405edf:	74 10                	je     405ef1 <dlerror@plt+0x4261>
  405ee1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  405ee5:	c6 04 03 2f          	movb   $0x2f,(%rbx,%rax,1)
  405ee9:	48 83 c0 02          	add    $0x2,%rax
  405eed:	c6 04 13 00          	movb   $0x0,(%rbx,%rdx,1)
  405ef1:	bd 00 10 00 00       	mov    $0x1000,%ebp
  405ef6:	4c 89 e7             	mov    %r12,%rdi
  405ef9:	48 29 c5             	sub    %rax,%rbp
  405efc:	e8 df b9 ff ff       	call   4018e0 <strlen@plt>
  405f01:	48 39 c5             	cmp    %rax,%rbp
  405f04:	76 42                	jbe    405f48 <dlerror@plt+0x42b8>
  405f06:	41 80 7c 04 ff 2f    	cmpb   $0x2f,-0x1(%r12,%rax,1)
  405f0c:	48 89 ea             	mov    %rbp,%rdx
  405f0f:	4c 89 e6             	mov    %r12,%rsi
  405f12:	48 89 df             	mov    %rbx,%rdi
  405f15:	74 11                	je     405f28 <dlerror@plt+0x4298>
  405f17:	e8 64 ba ff ff       	call   401980 <strncat@plt>
  405f1c:	5b                   	pop    %rbx
  405f1d:	5d                   	pop    %rbp
  405f1e:	41 5c                	pop    %r12
  405f20:	c3                   	ret
  405f21:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  405f28:	e8 53 ba ff ff       	call   401980 <strncat@plt>
  405f2d:	48 89 df             	mov    %rbx,%rdi
  405f30:	e8 ab b9 ff ff       	call   4018e0 <strlen@plt>
  405f35:	c6 44 03 ff 00       	movb   $0x0,-0x1(%rbx,%rax,1)
  405f3a:	48 89 d8             	mov    %rbx,%rax
  405f3d:	5b                   	pop    %rbx
  405f3e:	5d                   	pop    %rbp
  405f3f:	41 5c                	pop    %r12
  405f41:	c3                   	ret
  405f42:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  405f48:	5b                   	pop    %rbx
  405f49:	31 c0                	xor    %eax,%eax
  405f4b:	5d                   	pop    %rbp
  405f4c:	41 5c                	pop    %r12
  405f4e:	c3                   	ret
  405f4f:	90                   	nop
  405f50:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
  405f57:	48 89 fe             	mov    %rdi,%rsi
  405f5a:	bf 01 00 00 00       	mov    $0x1,%edi
  405f5f:	48 89 e2             	mov    %rsp,%rdx
  405f62:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  405f69:	00 00 
  405f6b:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
  405f72:	00 
  405f73:	31 c0                	xor    %eax,%eax
  405f75:	e8 26 bb ff ff       	call   401aa0 <__xstat@plt>
  405f7a:	85 c0                	test   %eax,%eax
  405f7c:	0f 94 c0             	sete   %al
  405f7f:	48 8b 8c 24 98 00 00 	mov    0x98(%rsp),%rcx
  405f86:	00 
  405f87:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  405f8e:	00 00 
  405f90:	75 0b                	jne    405f9d <dlerror@plt+0x430d>
  405f92:	0f b6 c0             	movzbl %al,%eax
  405f95:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
  405f9c:	c3                   	ret
  405f9d:	e8 5e b9 ff ff       	call   401900 <__stack_chk_fail@plt>
  405fa2:	0f 1f 40 00          	nopl   0x0(%rax)
  405fa6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  405fad:	00 00 00 
  405fb0:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
  405fb7:	48 89 fe             	mov    %rdi,%rsi
  405fba:	bf 01 00 00 00       	mov    $0x1,%edi
  405fbf:	48 89 e2             	mov    %rsp,%rdx
  405fc2:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  405fc9:	00 00 
  405fcb:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
  405fd2:	00 
  405fd3:	31 c0                	xor    %eax,%eax
  405fd5:	e8 16 b9 ff ff       	call   4018f0 <__lxstat@plt>
  405fda:	31 d2                	xor    %edx,%edx
  405fdc:	85 c0                	test   %eax,%eax
  405fde:	78 11                	js     405ff1 <dlerror@plt+0x4361>
  405fe0:	8b 44 24 18          	mov    0x18(%rsp),%eax
  405fe4:	25 00 f0 00 00       	and    $0xf000,%eax
  405fe9:	3d 00 a0 00 00       	cmp    $0xa000,%eax
  405fee:	0f 94 c2             	sete   %dl
  405ff1:	48 8b 8c 24 98 00 00 	mov    0x98(%rsp),%rcx
  405ff8:	00 
  405ff9:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  406000:	00 00 
  406002:	89 d0                	mov    %edx,%eax
  406004:	75 08                	jne    40600e <dlerror@plt+0x437e>
  406006:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
  40600d:	c3                   	ret
  40600e:	e8 ed b8 ff ff       	call   401900 <__stack_chk_fail@plt>
  406013:	0f 1f 00             	nopl   (%rax)
  406016:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40601d:	00 00 00 
  406020:	e9 1b b9 ff ff       	jmp    401940 <symlink@plt>
  406025:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40602c:	00 00 00 
  40602f:	90                   	nop
  406030:	41 54                	push   %r12
  406032:	55                   	push   %rbp
  406033:	49 89 f4             	mov    %rsi,%r12
  406036:	53                   	push   %rbx
  406037:	48 89 fd             	mov    %rdi,%rbp
  40603a:	48 89 f7             	mov    %rsi,%rdi
  40603d:	e8 9e b8 ff ff       	call   4018e0 <strlen@plt>
  406042:	4c 89 e6             	mov    %r12,%rsi
  406045:	48 89 c2             	mov    %rax,%rdx
  406048:	48 89 ef             	mov    %rbp,%rdi
  40604b:	48 89 c3             	mov    %rax,%rbx
  40604e:	e8 ad b7 ff ff       	call   401800 <strncmp@plt>
  406053:	85 c0                	test   %eax,%eax
  406055:	75 29                	jne    406080 <dlerror@plt+0x43f0>
  406057:	48 8d 44 1d 00       	lea    0x0(%rbp,%rbx,1),%rax
  40605c:	0f b6 10             	movzbl (%rax),%edx
  40605f:	84 d2                	test   %dl,%dl
  406061:	74 0f                	je     406072 <dlerror@plt+0x43e2>
  406063:	80 fa 3d             	cmp    $0x3d,%dl
  406066:	74 05                	je     40606d <dlerror@plt+0x43dd>
  406068:	80 fa 20             	cmp    $0x20,%dl
  40606b:	75 13                	jne    406080 <dlerror@plt+0x43f0>
  40606d:	48 8d 44 1d 01       	lea    0x1(%rbp,%rbx,1),%rax
  406072:	5b                   	pop    %rbx
  406073:	5d                   	pop    %rbp
  406074:	41 5c                	pop    %r12
  406076:	c3                   	ret
  406077:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40607e:	00 00 
  406080:	5b                   	pop    %rbx
  406081:	31 c0                	xor    %eax,%eax
  406083:	5d                   	pop    %rbp
  406084:	41 5c                	pop    %r12
  406086:	c3                   	ret
  406087:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40608e:	00 00 
  406090:	53                   	push   %rbx
  406091:	48 89 d3             	mov    %rdx,%rbx
  406094:	e8 97 ff ff ff       	call   406030 <dlerror@plt+0x43a0>
  406099:	48 85 c0             	test   %rax,%rax
  40609c:	74 25                	je     4060c3 <dlerror@plt+0x4433>
  40609e:	80 38 00             	cmpb   $0x0,(%rax)
  4060a1:	74 25                	je     4060c8 <dlerror@plt+0x4438>
  4060a3:	48 8d 3d b4 57 00 00 	lea    0x57b4(%rip),%rdi        # 40b85e <dlerror@plt+0x9bce>
  4060aa:	48 89 c6             	mov    %rax,%rsi
  4060ad:	b9 02 00 00 00       	mov    $0x2,%ecx
  4060b2:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  4060b4:	0f 97 c0             	seta   %al
  4060b7:	1c 00                	sbb    $0x0,%al
  4060b9:	84 c0                	test   %al,%al
  4060bb:	0f 95 c0             	setne  %al
  4060be:	0f b6 c0             	movzbl %al,%eax
  4060c1:	89 03                	mov    %eax,(%rbx)
  4060c3:	5b                   	pop    %rbx
  4060c4:	c3                   	ret
  4060c5:	0f 1f 00             	nopl   (%rax)
  4060c8:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
  4060ce:	5b                   	pop    %rbx
  4060cf:	c3                   	ret
  4060d0:	55                   	push   %rbp
  4060d1:	53                   	push   %rbx
  4060d2:	48 89 f5             	mov    %rsi,%rbp
  4060d5:	ba 00 10 00 00       	mov    $0x1000,%edx
  4060da:	48 89 fe             	mov    %rdi,%rsi
  4060dd:	48 81 ec 18 40 00 00 	sub    $0x4018,%rsp
  4060e4:	48 89 e3             	mov    %rsp,%rbx
  4060e7:	48 89 df             	mov    %rbx,%rdi
  4060ea:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4060f1:	00 00 
  4060f3:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  4060fa:	00 
  4060fb:	31 c0                	xor    %eax,%eax
  4060fd:	e8 6e b7 ff ff       	call   401870 <mbstowcs@plt>
  406102:	48 89 df             	mov    %rbx,%rdi
  406105:	e8 f6 b9 ff ff       	call   401b00 <wcsdup@plt>
  40610a:	48 85 c0             	test   %rax,%rax
  40610d:	48 89 45 00          	mov    %rax,0x0(%rbp)
  406111:	0f 94 c0             	sete   %al
  406114:	0f b6 c0             	movzbl %al,%eax
  406117:	f7 d8                	neg    %eax
  406119:	48 8b 8c 24 08 40 00 	mov    0x4008(%rsp),%rcx
  406120:	00 
  406121:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  406128:	00 00 
  40612a:	75 0a                	jne    406136 <dlerror@plt+0x44a6>
  40612c:	48 81 c4 18 40 00 00 	add    $0x4018,%rsp
  406133:	5b                   	pop    %rbx
  406134:	5d                   	pop    %rbp
  406135:	c3                   	ret
  406136:	e8 c5 b7 ff ff       	call   401900 <__stack_chk_fail@plt>
  40613b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  406140:	48 85 ff             	test   %rdi,%rdi
  406143:	0f 84 27 01 00 00    	je     406270 <dlerror@plt+0x45e0>
  406149:	41 54                	push   %r12
  40614b:	55                   	push   %rbp
  40614c:	53                   	push   %rbx
  40614d:	8b 47 20             	mov    0x20(%rdi),%eax
  406150:	48 89 fb             	mov    %rdi,%rbx
  406153:	48 8b 7f 28          	mov    0x28(%rdi),%rdi
  406157:	85 c0                	test   %eax,%eax
  406159:	48 89 fa             	mov    %rdi,%rdx
  40615c:	74 6f                	je     4061cd <dlerror@plt+0x453d>
  40615e:	48 85 ff             	test   %rdi,%rdi
  406161:	74 2e                	je     406191 <dlerror@plt+0x4501>
  406163:	85 c0                	test   %eax,%eax
  406165:	0f 8e 11 01 00 00    	jle    40627c <dlerror@plt+0x45ec>
  40616b:	45 31 e4             	xor    %r12d,%r12d
  40616e:	31 ed                	xor    %ebp,%ebp
  406170:	eb 0a                	jmp    40617c <dlerror@plt+0x44ec>
  406172:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  406178:	48 8b 7b 28          	mov    0x28(%rbx),%rdi
  40617c:	4a 8b 3c 27          	mov    (%rdi,%r12,1),%rdi
  406180:	83 c5 01             	add    $0x1,%ebp
  406183:	49 83 c4 08          	add    $0x8,%r12
  406187:	e8 34 b6 ff ff       	call   4017c0 <free@plt>
  40618c:	39 6b 20             	cmp    %ebp,0x20(%rbx)
  40618f:	7f e7                	jg     406178 <dlerror@plt+0x44e8>
  406191:	48 8b 43 30          	mov    0x30(%rbx),%rax
  406195:	48 85 c0             	test   %rax,%rax
  406198:	0f 84 da 00 00 00    	je     406278 <dlerror@plt+0x45e8>
  40619e:	8b 4b 20             	mov    0x20(%rbx),%ecx
  4061a1:	45 31 e4             	xor    %r12d,%r12d
  4061a4:	31 ed                	xor    %ebp,%ebp
  4061a6:	85 c9                	test   %ecx,%ecx
  4061a8:	7f 0a                	jg     4061b4 <dlerror@plt+0x4524>
  4061aa:	e9 c9 00 00 00       	jmp    406278 <dlerror@plt+0x45e8>
  4061af:	90                   	nop
  4061b0:	48 8b 43 30          	mov    0x30(%rbx),%rax
  4061b4:	4a 8b 3c 20          	mov    (%rax,%r12,1),%rdi
  4061b8:	83 c5 01             	add    $0x1,%ebp
  4061bb:	49 83 c4 08          	add    $0x8,%r12
  4061bf:	e8 fc b5 ff ff       	call   4017c0 <free@plt>
  4061c4:	39 6b 20             	cmp    %ebp,0x20(%rbx)
  4061c7:	7f e7                	jg     4061b0 <dlerror@plt+0x4520>
  4061c9:	48 8b 7b 28          	mov    0x28(%rbx),%rdi
  4061cd:	e8 ee b5 ff ff       	call   4017c0 <free@plt>
  4061d2:	48 8b 7b 30          	mov    0x30(%rbx),%rdi
  4061d6:	e8 e5 b5 ff ff       	call   4017c0 <free@plt>
  4061db:	8b 53 38             	mov    0x38(%rbx),%edx
  4061de:	85 d2                	test   %edx,%edx
  4061e0:	74 67                	je     406249 <dlerror@plt+0x45b9>
  4061e2:	48 8b 43 40          	mov    0x40(%rbx),%rax
  4061e6:	48 85 c0             	test   %rax,%rax
  4061e9:	48 89 c7             	mov    %rax,%rdi
  4061ec:	74 2b                	je     406219 <dlerror@plt+0x4589>
  4061ee:	85 d2                	test   %edx,%edx
  4061f0:	7e 5b                	jle    40624d <dlerror@plt+0x45bd>
  4061f2:	45 31 e4             	xor    %r12d,%r12d
  4061f5:	31 ed                	xor    %ebp,%ebp
  4061f7:	eb 0b                	jmp    406204 <dlerror@plt+0x4574>
  4061f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  406200:	48 8b 43 40          	mov    0x40(%rbx),%rax
  406204:	4a 8b 3c 20          	mov    (%rax,%r12,1),%rdi
  406208:	83 c5 01             	add    $0x1,%ebp
  40620b:	49 83 c4 08          	add    $0x8,%r12
  40620f:	e8 ac b5 ff ff       	call   4017c0 <free@plt>
  406214:	39 6b 38             	cmp    %ebp,0x38(%rbx)
  406217:	7f e7                	jg     406200 <dlerror@plt+0x4570>
  406219:	48 8b 43 48          	mov    0x48(%rbx),%rax
  40621d:	48 85 c0             	test   %rax,%rax
  406220:	74 27                	je     406249 <dlerror@plt+0x45b9>
  406222:	8b 53 38             	mov    0x38(%rbx),%edx
  406225:	45 31 e4             	xor    %r12d,%r12d
  406228:	31 ed                	xor    %ebp,%ebp
  40622a:	85 d2                	test   %edx,%edx
  40622c:	7f 06                	jg     406234 <dlerror@plt+0x45a4>
  40622e:	eb 19                	jmp    406249 <dlerror@plt+0x45b9>
  406230:	48 8b 43 48          	mov    0x48(%rbx),%rax
  406234:	4a 8b 3c 20          	mov    (%rax,%r12,1),%rdi
  406238:	83 c5 01             	add    $0x1,%ebp
  40623b:	49 83 c4 08          	add    $0x8,%r12
  40623f:	e8 7c b5 ff ff       	call   4017c0 <free@plt>
  406244:	39 6b 38             	cmp    %ebp,0x38(%rbx)
  406247:	7f e7                	jg     406230 <dlerror@plt+0x45a0>
  406249:	48 8b 7b 40          	mov    0x40(%rbx),%rdi
  40624d:	e8 6e b5 ff ff       	call   4017c0 <free@plt>
  406252:	48 8b 7b 48          	mov    0x48(%rbx),%rdi
  406256:	e8 65 b5 ff ff       	call   4017c0 <free@plt>
  40625b:	48 89 df             	mov    %rbx,%rdi
  40625e:	5b                   	pop    %rbx
  40625f:	5d                   	pop    %rbp
  406260:	41 5c                	pop    %r12
  406262:	e9 59 b5 ff ff       	jmp    4017c0 <free@plt>
  406267:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40626e:	00 00 
  406270:	f3 c3                	repz ret
  406272:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  406278:	48 8b 53 28          	mov    0x28(%rbx),%rdx
  40627c:	48 89 d7             	mov    %rdx,%rdi
  40627f:	e9 49 ff ff ff       	jmp    4061cd <dlerror@plt+0x453d>
  406284:	66 90                	xchg   %ax,%ax
  406286:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40628d:	00 00 00 
  406290:	41 57                	push   %r15
  406292:	41 56                	push   %r14
  406294:	be 50 00 00 00       	mov    $0x50,%esi
  406299:	41 55                	push   %r13
  40629b:	41 54                	push   %r12
  40629d:	55                   	push   %rbp
  40629e:	53                   	push   %rbx
  40629f:	48 83 ec 18          	sub    $0x18,%rsp
  4062a3:	48 8b 87 40 30 00 00 	mov    0x3040(%rdi),%rax
  4062aa:	48 8b 9f 20 20 00 00 	mov    0x2020(%rdi),%rbx
  4062b1:	bf 01 00 00 00       	mov    $0x1,%edi
  4062b6:	44 0f b6 70 0c       	movzbl 0xc(%rax),%r14d
  4062bb:	e8 00 b7 ff ff       	call   4019c0 <calloc@plt>
  4062c0:	48 85 c0             	test   %rax,%rax
  4062c3:	48 89 c5             	mov    %rax,%rbp
  4062c6:	0f 84 46 03 00 00    	je     406612 <dlerror@plt+0x4982>
  4062cc:	4c 8b 83 08 10 00 00 	mov    0x1008(%rbx),%r8
  4062d3:	4c 3b 83 10 10 00 00 	cmp    0x1010(%rbx),%r8
  4062da:	c7 40 18 ff ff ff ff 	movl   $0xffffffff,0x18(%rax)
  4062e1:	0f 83 c3 03 00 00    	jae    4066aa <dlerror@plt+0x4a1a>
  4062e7:	4c 8d 25 ef 56 00 00 	lea    0x56ef(%rip),%r12        # 40b9dd <dlerror@plt+0x9d4d>
  4062ee:	45 31 ff             	xor    %r15d,%r15d
  4062f1:	45 31 ed             	xor    %r13d,%r13d
  4062f4:	0f 1f 40 00          	nopl   0x0(%rax)
  4062f8:	41 80 78 11 6f       	cmpb   $0x6f,0x11(%r8)
  4062fd:	0f 85 4d 01 00 00    	jne    406450 <dlerror@plt+0x47c0>
  406303:	49 8d 50 12          	lea    0x12(%r8),%rdx
  406307:	b9 04 00 00 00       	mov    $0x4,%ecx
  40630c:	4c 89 e7             	mov    %r12,%rdi
  40630f:	48 89 d6             	mov    %rdx,%rsi
  406312:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  406314:	0f 97 c0             	seta   %al
  406317:	1c 00                	sbb    $0x0,%al
  406319:	84 c0                	test   %al,%al
  40631b:	0f 84 2f 01 00 00    	je     406450 <dlerror@plt+0x47c0>
  406321:	48 8d 3d e5 56 00 00 	lea    0x56e5(%rip),%rdi        # 40ba0d <dlerror@plt+0x9d7d>
  406328:	b9 02 00 00 00       	mov    $0x2,%ecx
  40632d:	48 89 d6             	mov    %rdx,%rsi
  406330:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  406332:	0f 97 c0             	seta   %al
  406335:	1c 00                	sbb    $0x0,%al
  406337:	84 c0                	test   %al,%al
  406339:	0f 84 e9 02 00 00    	je     406628 <dlerror@plt+0x4998>
  40633f:	48 8d 3d 9c 56 00 00 	lea    0x569c(%rip),%rdi        # 40b9e2 <dlerror@plt+0x9d52>
  406346:	b9 08 00 00 00       	mov    $0x8,%ecx
  40634b:	48 89 d6             	mov    %rdx,%rsi
  40634e:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  406350:	0f 97 c0             	seta   %al
  406353:	1c 00                	sbb    $0x0,%al
  406355:	84 c0                	test   %al,%al
  406357:	0f 84 cb 02 00 00    	je     406628 <dlerror@plt+0x4998>
  40635d:	48 8d 3d a3 60 00 00 	lea    0x60a3(%rip),%rdi        # 40c407 <dlerror@plt+0xa777>
  406364:	b9 02 00 00 00       	mov    $0x2,%ecx
  406369:	48 89 d6             	mov    %rdx,%rsi
  40636c:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  40636e:	0f 97 c0             	seta   %al
  406371:	1c 00                	sbb    $0x0,%al
  406373:	84 c0                	test   %al,%al
  406375:	0f 84 bd 02 00 00    	je     406638 <dlerror@plt+0x49a8>
  40637b:	48 8d 3d 68 56 00 00 	lea    0x5668(%rip),%rdi        # 40b9ea <dlerror@plt+0x9d5a>
  406382:	b9 0b 00 00 00       	mov    $0xb,%ecx
  406387:	48 89 d6             	mov    %rdx,%rsi
  40638a:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  40638c:	0f 97 c0             	seta   %al
  40638f:	1c 00                	sbb    $0x0,%al
  406391:	84 c0                	test   %al,%al
  406393:	0f 84 9f 02 00 00    	je     406638 <dlerror@plt+0x49a8>
  406399:	48 8d 3d 55 56 00 00 	lea    0x5655(%rip),%rdi        # 40b9f5 <dlerror@plt+0x9d65>
  4063a0:	b9 02 00 00 00       	mov    $0x2,%ecx
  4063a5:	48 89 d6             	mov    %rdx,%rsi
  4063a8:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  4063aa:	0f 97 c0             	seta   %al
  4063ad:	1c 00                	sbb    $0x0,%al
  4063af:	84 c0                	test   %al,%al
  4063b1:	0f 84 ea 02 00 00    	je     4066a1 <dlerror@plt+0x4a11>
  4063b7:	48 8d 3d 39 56 00 00 	lea    0x5639(%rip),%rdi        # 40b9f7 <dlerror@plt+0x9d67>
  4063be:	b9 09 00 00 00       	mov    $0x9,%ecx
  4063c3:	48 89 d6             	mov    %rdx,%rsi
  4063c6:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  4063c8:	0f 97 c0             	seta   %al
  4063cb:	1c 00                	sbb    $0x0,%al
  4063cd:	84 c0                	test   %al,%al
  4063cf:	0f 84 cc 02 00 00    	je     4066a1 <dlerror@plt+0x4a11>
  4063d5:	48 8d 3d 24 56 00 00 	lea    0x5624(%rip),%rdi        # 40ba00 <dlerror@plt+0x9d70>
  4063dc:	b9 02 00 00 00       	mov    $0x2,%ecx
  4063e1:	48 89 d6             	mov    %rdx,%rsi
  4063e4:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  4063e6:	0f 97 c0             	seta   %al
  4063e9:	1c 00                	sbb    $0x0,%al
  4063eb:	84 c0                	test   %al,%al
  4063ed:	0f 84 ff 02 00 00    	je     4066f2 <dlerror@plt+0x4a62>
  4063f3:	48 8d 3d 09 56 00 00 	lea    0x5609(%rip),%rdi        # 40ba03 <dlerror@plt+0x9d73>
  4063fa:	b9 02 00 00 00       	mov    $0x2,%ecx
  4063ff:	48 89 d6             	mov    %rdx,%rsi
  406402:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  406404:	0f 97 c0             	seta   %al
  406407:	1c 00                	sbb    $0x0,%al
  406409:	84 c0                	test   %al,%al
  40640b:	0f 84 ea 02 00 00    	je     4066fb <dlerror@plt+0x4a6b>
  406411:	48 8d 35 2e 58 00 00 	lea    0x582e(%rip),%rsi        # 40bc46 <dlerror@plt+0x9fb6>
  406418:	48 89 d7             	mov    %rdx,%rdi
  40641b:	4c 89 04 24          	mov    %r8,(%rsp)
  40641f:	e8 0c fc ff ff       	call   406030 <dlerror@plt+0x43a0>
  406424:	48 85 c0             	test   %rax,%rax
  406427:	4c 8b 04 24          	mov    (%rsp),%r8
  40642b:	74 23                	je     406450 <dlerror@plt+0x47c0>
  40642d:	80 38 00             	cmpb   $0x0,(%rax)
  406430:	74 1e                	je     406450 <dlerror@plt+0x47c0>
  406432:	c7 45 0c 01 00 00 00 	movl   $0x1,0xc(%rbp)
  406439:	ba 0a 00 00 00       	mov    $0xa,%edx
  40643e:	31 f6                	xor    %esi,%esi
  406440:	48 89 c7             	mov    %rax,%rdi
  406443:	e8 b8 b7 ff ff       	call   401c00 <strtoul@plt>
  406448:	4c 8b 04 24          	mov    (%rsp),%r8
  40644c:	48 89 45 10          	mov    %rax,0x10(%rbp)
  406450:	4c 89 c6             	mov    %r8,%rsi
  406453:	48 89 df             	mov    %rbx,%rdi
  406456:	e8 05 bd ff ff       	call   402160 <dlerror@plt+0x4d0>
  40645b:	48 39 83 10 10 00 00 	cmp    %rax,0x1010(%rbx)
  406462:	49 89 c0             	mov    %rax,%r8
  406465:	0f 87 8d fe ff ff    	ja     4062f8 <dlerror@plt+0x4668>
  40646b:	45 85 ed             	test   %r13d,%r13d
  40646e:	49 63 fd             	movslq %r13d,%rdi
  406471:	4d 63 e7             	movslq %r15d,%r12
  406474:	41 0f 95 c5          	setne  %r13b
  406478:	45 84 f6             	test   %r14b,%r14b
  40647b:	be 08 00 00 00       	mov    $0x8,%esi
  406480:	0f 84 52 01 00 00    	je     4065d8 <dlerror@plt+0x4948>
  406486:	e8 35 b5 ff ff       	call   4019c0 <calloc@plt>
  40648b:	be 08 00 00 00       	mov    $0x8,%esi
  406490:	48 89 45 28          	mov    %rax,0x28(%rbp)
  406494:	4c 89 e7             	mov    %r12,%rdi
  406497:	48 89 04 24          	mov    %rax,(%rsp)
  40649b:	e8 20 b5 ff ff       	call   4019c0 <calloc@plt>
  4064a0:	48 8b 14 24          	mov    (%rsp),%rdx
  4064a4:	48 89 45 40          	mov    %rax,0x40(%rbp)
  4064a8:	48 85 d2             	test   %rdx,%rdx
  4064ab:	75 09                	jne    4064b6 <dlerror@plt+0x4826>
  4064ad:	45 84 ed             	test   %r13b,%r13b
  4064b0:	0f 85 52 01 00 00    	jne    406608 <dlerror@plt+0x4978>
  4064b6:	45 85 ff             	test   %r15d,%r15d
  4064b9:	74 09                	je     4064c4 <dlerror@plt+0x4834>
  4064bb:	48 85 c0             	test   %rax,%rax
  4064be:	0f 84 44 01 00 00    	je     406608 <dlerror@plt+0x4978>
  4064c4:	4c 8b bb 08 10 00 00 	mov    0x1008(%rbx),%r15
  4064cb:	4c 3b bb 10 10 00 00 	cmp    0x1010(%rbx),%r15
  4064d2:	0f 83 3a 01 00 00    	jae    406612 <dlerror@plt+0x4982>
  4064d8:	48 8d 45 18          	lea    0x18(%rbp),%rax
  4064dc:	4c 8d 25 1d 55 00 00 	lea    0x551d(%rip),%r12        # 40ba00 <dlerror@plt+0x9d70>
  4064e3:	48 89 04 24          	mov    %rax,(%rsp)
  4064e7:	48 8d 45 1c          	lea    0x1c(%rbp),%rax
  4064eb:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4064f0:	eb 51                	jmp    406543 <dlerror@plt+0x48b3>
  4064f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4064f8:	45 84 f6             	test   %r14b,%r14b
  4064fb:	49 8d 7f 14          	lea    0x14(%r15),%rdi
  4064ff:	0f 84 5b 01 00 00    	je     406660 <dlerror@plt+0x49d0>
  406505:	e8 36 b7 ff ff       	call   401c40 <strdup@plt>
  40650a:	48 85 c0             	test   %rax,%rax
  40650d:	0f 84 f5 00 00 00    	je     406608 <dlerror@plt+0x4978>
  406513:	48 63 75 20          	movslq 0x20(%rbp),%rsi
  406517:	48 8b 4d 28          	mov    0x28(%rbp),%rcx
  40651b:	48 89 f2             	mov    %rsi,%rdx
  40651e:	48 89 04 f1          	mov    %rax,(%rcx,%rsi,8)
  406522:	83 c2 01             	add    $0x1,%edx
  406525:	89 55 20             	mov    %edx,0x20(%rbp)
  406528:	4c 89 fe             	mov    %r15,%rsi
  40652b:	48 89 df             	mov    %rbx,%rdi
  40652e:	e8 2d bc ff ff       	call   402160 <dlerror@plt+0x4d0>
  406533:	48 39 83 10 10 00 00 	cmp    %rax,0x1010(%rbx)
  40653a:	49 89 c7             	mov    %rax,%r15
  40653d:	0f 86 cf 00 00 00    	jbe    406612 <dlerror@plt+0x4982>
  406543:	41 80 7f 11 6f       	cmpb   $0x6f,0x11(%r15)
  406548:	75 de                	jne    406528 <dlerror@plt+0x4898>
  40654a:	49 8d 57 12          	lea    0x12(%r15),%rdx
  40654e:	b9 02 00 00 00       	mov    $0x2,%ecx
  406553:	4c 89 e7             	mov    %r12,%rdi
  406556:	48 89 d6             	mov    %rdx,%rsi
  406559:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  40655b:	0f 97 c0             	seta   %al
  40655e:	1c 00                	sbb    $0x0,%al
  406560:	84 c0                	test   %al,%al
  406562:	74 94                	je     4064f8 <dlerror@plt+0x4868>
  406564:	48 8d 3d 98 54 00 00 	lea    0x5498(%rip),%rdi        # 40ba03 <dlerror@plt+0x9d73>
  40656b:	b9 02 00 00 00       	mov    $0x2,%ecx
  406570:	48 89 d6             	mov    %rdx,%rsi
  406573:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  406575:	0f 97 c0             	seta   %al
  406578:	1c 00                	sbb    $0x0,%al
  40657a:	84 c0                	test   %al,%al
  40657c:	75 aa                	jne    406528 <dlerror@plt+0x4898>
  40657e:	45 84 f6             	test   %r14b,%r14b
  406581:	4d 8d 6f 14          	lea    0x14(%r15),%r13
  406585:	0f 84 f5 00 00 00    	je     406680 <dlerror@plt+0x49f0>
  40658b:	4c 89 ef             	mov    %r13,%rdi
  40658e:	e8 ad b6 ff ff       	call   401c40 <strdup@plt>
  406593:	48 85 c0             	test   %rax,%rax
  406596:	74 70                	je     406608 <dlerror@plt+0x4978>
  406598:	48 63 4d 20          	movslq 0x20(%rbp),%rcx
  40659c:	48 8b 55 40          	mov    0x40(%rbp),%rdx
  4065a0:	48 89 04 ca          	mov    %rax,(%rdx,%rcx,8)
  4065a4:	83 45 38 01          	addl   $0x1,0x38(%rbp)
  4065a8:	48 8b 14 24          	mov    (%rsp),%rdx
  4065ac:	48 8d 35 53 54 00 00 	lea    0x5453(%rip),%rsi        # 40ba06 <dlerror@plt+0x9d76>
  4065b3:	4c 89 ef             	mov    %r13,%rdi
  4065b6:	e8 d5 fa ff ff       	call   406090 <dlerror@plt+0x4400>
  4065bb:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  4065c0:	48 8d 35 44 54 00 00 	lea    0x5444(%rip),%rsi        # 40ba0b <dlerror@plt+0x9d7b>
  4065c7:	4c 89 ef             	mov    %r13,%rdi
  4065ca:	e8 c1 fa ff ff       	call   406090 <dlerror@plt+0x4400>
  4065cf:	e9 54 ff ff ff       	jmp    406528 <dlerror@plt+0x4898>
  4065d4:	0f 1f 40 00          	nopl   0x0(%rax)
  4065d8:	e8 e3 b3 ff ff       	call   4019c0 <calloc@plt>
  4065dd:	be 08 00 00 00       	mov    $0x8,%esi
  4065e2:	48 89 45 30          	mov    %rax,0x30(%rbp)
  4065e6:	4c 89 e7             	mov    %r12,%rdi
  4065e9:	48 89 04 24          	mov    %rax,(%rsp)
  4065ed:	e8 ce b3 ff ff       	call   4019c0 <calloc@plt>
  4065f2:	48 8b 14 24          	mov    (%rsp),%rdx
  4065f6:	48 89 45 48          	mov    %rax,0x48(%rbp)
  4065fa:	48 85 d2             	test   %rdx,%rdx
  4065fd:	75 49                	jne    406648 <dlerror@plt+0x49b8>
  4065ff:	45 84 ed             	test   %r13b,%r13b
  406602:	74 44                	je     406648 <dlerror@plt+0x49b8>
  406604:	0f 1f 40 00          	nopl   0x0(%rax)
  406608:	48 89 ef             	mov    %rbp,%rdi
  40660b:	31 ed                	xor    %ebp,%ebp
  40660d:	e8 2e fb ff ff       	call   406140 <dlerror@plt+0x44b0>
  406612:	48 83 c4 18          	add    $0x18,%rsp
  406616:	48 89 e8             	mov    %rbp,%rax
  406619:	5b                   	pop    %rbx
  40661a:	5d                   	pop    %rbp
  40661b:	41 5c                	pop    %r12
  40661d:	41 5d                	pop    %r13
  40661f:	41 5e                	pop    %r14
  406621:	41 5f                	pop    %r15
  406623:	c3                   	ret
  406624:	0f 1f 40 00          	nopl   0x0(%rax)
  406628:	83 45 00 01          	addl   $0x1,0x0(%rbp)
  40662c:	e9 1f fe ff ff       	jmp    406450 <dlerror@plt+0x47c0>
  406631:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  406638:	c7 45 04 01 00 00 00 	movl   $0x1,0x4(%rbp)
  40663f:	e9 0c fe ff ff       	jmp    406450 <dlerror@plt+0x47c0>
  406644:	0f 1f 40 00          	nopl   0x0(%rax)
  406648:	48 85 c0             	test   %rax,%rax
  40664b:	0f 85 73 fe ff ff    	jne    4064c4 <dlerror@plt+0x4834>
  406651:	45 85 ff             	test   %r15d,%r15d
  406654:	0f 84 6a fe ff ff    	je     4064c4 <dlerror@plt+0x4834>
  40665a:	eb ac                	jmp    406608 <dlerror@plt+0x4978>
  40665c:	0f 1f 40 00          	nopl   0x0(%rax)
  406660:	48 63 55 20          	movslq 0x20(%rbp),%rdx
  406664:	48 8b 45 30          	mov    0x30(%rbp),%rax
  406668:	48 8d 34 d0          	lea    (%rax,%rdx,8),%rsi
  40666c:	e8 5f fa ff ff       	call   4060d0 <dlerror@plt+0x4440>
  406671:	85 c0                	test   %eax,%eax
  406673:	78 93                	js     406608 <dlerror@plt+0x4978>
  406675:	8b 55 20             	mov    0x20(%rbp),%edx
  406678:	e9 a5 fe ff ff       	jmp    406522 <dlerror@plt+0x4892>
  40667d:	0f 1f 00             	nopl   (%rax)
  406680:	48 63 55 38          	movslq 0x38(%rbp),%rdx
  406684:	48 8b 45 48          	mov    0x48(%rbp),%rax
  406688:	4c 89 ef             	mov    %r13,%rdi
  40668b:	48 8d 34 d0          	lea    (%rax,%rdx,8),%rsi
  40668f:	e8 3c fa ff ff       	call   4060d0 <dlerror@plt+0x4440>
  406694:	85 c0                	test   %eax,%eax
  406696:	0f 89 08 ff ff ff    	jns    4065a4 <dlerror@plt+0x4914>
  40669c:	e9 67 ff ff ff       	jmp    406608 <dlerror@plt+0x4978>
  4066a1:	83 45 08 01          	addl   $0x1,0x8(%rbp)
  4066a5:	e9 a6 fd ff ff       	jmp    406450 <dlerror@plt+0x47c0>
  4066aa:	31 ff                	xor    %edi,%edi
  4066ac:	45 84 f6             	test   %r14b,%r14b
  4066af:	be 08 00 00 00       	mov    $0x8,%esi
  4066b4:	75 1e                	jne    4066d4 <dlerror@plt+0x4a44>
  4066b6:	e8 05 b3 ff ff       	call   4019c0 <calloc@plt>
  4066bb:	be 08 00 00 00       	mov    $0x8,%esi
  4066c0:	48 89 45 30          	mov    %rax,0x30(%rbp)
  4066c4:	31 ff                	xor    %edi,%edi
  4066c6:	e8 f5 b2 ff ff       	call   4019c0 <calloc@plt>
  4066cb:	48 89 45 48          	mov    %rax,0x48(%rbp)
  4066cf:	e9 f0 fd ff ff       	jmp    4064c4 <dlerror@plt+0x4834>
  4066d4:	e8 e7 b2 ff ff       	call   4019c0 <calloc@plt>
  4066d9:	be 08 00 00 00       	mov    $0x8,%esi
  4066de:	48 89 45 28          	mov    %rax,0x28(%rbp)
  4066e2:	31 ff                	xor    %edi,%edi
  4066e4:	e8 d7 b2 ff ff       	call   4019c0 <calloc@plt>
  4066e9:	48 89 45 40          	mov    %rax,0x40(%rbp)
  4066ed:	e9 20 ff ff ff       	jmp    406612 <dlerror@plt+0x4982>
  4066f2:	41 83 c5 01          	add    $0x1,%r13d
  4066f6:	e9 55 fd ff ff       	jmp    406450 <dlerror@plt+0x47c0>
  4066fb:	41 83 c7 01          	add    $0x1,%r15d
  4066ff:	e9 4c fd ff ff       	jmp    406450 <dlerror@plt+0x47c0>
  406704:	66 90                	xchg   %ax,%ax
  406706:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40670d:	00 00 00 
  406710:	41 54                	push   %r12
  406712:	55                   	push   %rbp
  406713:	49 89 fc             	mov    %rdi,%r12
  406716:	53                   	push   %rbx
  406717:	48 83 ec 50          	sub    $0x50,%rsp
  40671b:	48 8b 9e 40 30 00 00 	mov    0x3040(%rsi),%rbx
  406722:	48 8d 6c 24 20       	lea    0x20(%rsp),%rbp
  406727:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40672e:	00 00 
  406730:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  406735:	31 c0                	xor    %eax,%eax
  406737:	48 89 ef             	mov    %rbp,%rdi
  40673a:	ff 93 48 01 00 00    	call   *0x148(%rbx)
  406740:	41 8b 44 24 18       	mov    0x18(%r12),%eax
  406745:	48 89 e7             	mov    %rsp,%rdi
  406748:	c7 44 24 30 01 00 00 	movl   $0x1,0x30(%rsp)
  40674f:	00 
  406750:	48 89 ee             	mov    %rbp,%rsi
  406753:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
  406757:	41 8b 44 24 1c       	mov    0x1c(%r12),%eax
  40675c:	89 44 24 40          	mov    %eax,0x40(%rsp)
  406760:	ff 53 48             	call   *0x48(%rbx)
  406763:	ff 74 24 18          	push   0x18(%rsp)
  406767:	ff 74 24 18          	push   0x18(%rsp)
  40676b:	ff 74 24 18          	push   0x18(%rsp)
  40676f:	ff 74 24 18          	push   0x18(%rsp)
  406773:	ff 93 58 01 00 00    	call   *0x158(%rbx)
  406779:	48 83 c4 20          	add    $0x20,%rsp
  40677d:	85 c0                	test   %eax,%eax
  40677f:	0f 95 c0             	setne  %al
  406782:	0f b6 c0             	movzbl %al,%eax
  406785:	f7 d8                	neg    %eax
  406787:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
  40678c:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  406793:	00 00 
  406795:	75 09                	jne    4067a0 <dlerror@plt+0x4b10>
  406797:	48 83 c4 50          	add    $0x50,%rsp
  40679b:	5b                   	pop    %rbx
  40679c:	5d                   	pop    %rbp
  40679d:	41 5c                	pop    %r12
  40679f:	c3                   	ret
  4067a0:	e8 5b b1 ff ff       	call   401900 <__stack_chk_fail@plt>
  4067a5:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4067ac:	00 00 00 
  4067af:	90                   	nop
  4067b0:	48 8b 87 40 30 00 00 	mov    0x3040(%rdi),%rax
  4067b7:	0f b6 97 69 40 00 00 	movzbl 0x4069(%rdi),%edx
  4067be:	8b 40 08             	mov    0x8(%rax),%eax
  4067c1:	01 c0                	add    %eax,%eax
  4067c3:	09 d0                	or     %edx,%eax
  4067c5:	2d 68 02 00 00       	sub    $0x268,%eax
  4067ca:	83 f8 0b             	cmp    $0xb,%eax
  4067cd:	77 61                	ja     406830 <dlerror@plt+0x4ba0>
  4067cf:	48 8d 15 3a 52 00 00 	lea    0x523a(%rip),%rdx        # 40ba10 <dlerror@plt+0x9d80>
  4067d6:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  4067da:	48 01 d0             	add    %rdx,%rax
  4067dd:	ff e0                	jmp    *%rax
  4067df:	90                   	nop
  4067e0:	be 88 01 00 00       	mov    $0x188,%esi
  4067e5:	bf 01 00 00 00       	mov    $0x1,%edi
  4067ea:	e9 d1 b1 ff ff       	jmp    4019c0 <calloc@plt>
  4067ef:	90                   	nop
  4067f0:	be c8 01 00 00       	mov    $0x1c8,%esi
  4067f5:	bf 01 00 00 00       	mov    $0x1,%edi
  4067fa:	e9 c1 b1 ff ff       	jmp    4019c0 <calloc@plt>
  4067ff:	90                   	nop
  406800:	be 68 01 00 00       	mov    $0x168,%esi
  406805:	bf 01 00 00 00       	mov    $0x1,%edi
  40680a:	e9 b1 b1 ff ff       	jmp    4019c0 <calloc@plt>
  40680f:	90                   	nop
  406810:	be a8 01 00 00       	mov    $0x1a8,%esi
  406815:	bf 01 00 00 00       	mov    $0x1,%edi
  40681a:	e9 a1 b1 ff ff       	jmp    4019c0 <calloc@plt>
  40681f:	90                   	nop
  406820:	be b0 01 00 00       	mov    $0x1b0,%esi
  406825:	bf 01 00 00 00       	mov    $0x1,%edi
  40682a:	e9 91 b1 ff ff       	jmp    4019c0 <calloc@plt>
  40682f:	90                   	nop
  406830:	31 c0                	xor    %eax,%eax
  406832:	c3                   	ret
  406833:	0f 1f 00             	nopl   (%rax)
  406836:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40683d:	00 00 00 
  406840:	48 85 ff             	test   %rdi,%rdi
  406843:	48 8b 86 40 30 00 00 	mov    0x3040(%rsi),%rax
  40684a:	74 14                	je     406860 <dlerror@plt+0x4bd0>
  40684c:	53                   	push   %rbx
  40684d:	48 89 fb             	mov    %rdi,%rbx
  406850:	ff 50 50             	call   *0x50(%rax)
  406853:	48 89 df             	mov    %rbx,%rdi
  406856:	5b                   	pop    %rbx
  406857:	e9 64 af ff ff       	jmp    4017c0 <free@plt>
  40685c:	0f 1f 40 00          	nopl   0x0(%rax)
  406860:	f3 c3                	repz ret
  406862:	0f 1f 40 00          	nopl   0x0(%rax)
  406866:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40686d:	00 00 00 
  406870:	53                   	push   %rbx
  406871:	48 83 ec 30          	sub    $0x30,%rsp
  406875:	48 8b 9e 40 30 00 00 	mov    0x3040(%rsi),%rbx
  40687c:	0f b6 96 69 40 00 00 	movzbl 0x4069(%rsi),%edx
  406883:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40688a:	00 00 
  40688c:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  406891:	31 c0                	xor    %eax,%eax
  406893:	8b 43 08             	mov    0x8(%rbx),%eax
  406896:	01 c0                	add    %eax,%eax
  406898:	09 d0                	or     %edx,%eax
  40689a:	2d 68 02 00 00       	sub    $0x268,%eax
  40689f:	83 f8 0b             	cmp    $0xb,%eax
  4068a2:	0f 87 b0 00 00 00    	ja     406958 <dlerror@plt+0x4cc8>
  4068a8:	48 8d 15 91 51 00 00 	lea    0x5191(%rip),%rdx        # 40ba40 <dlerror@plt+0x9db0>
  4068af:	49 89 f8             	mov    %rdi,%r8
  4068b2:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  4068b6:	48 01 d0             	add    %rdx,%rax
  4068b9:	ff e0                	jmp    *%rax
  4068bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4068c0:	48 8d 4e 20          	lea    0x20(%rsi),%rcx
  4068c4:	49 8d 50 70          	lea    0x70(%r8),%rdx
  4068c8:	48 89 e7             	mov    %rsp,%rdi
  4068cb:	4c 89 c6             	mov    %r8,%rsi
  4068ce:	ff 53 68             	call   *0x68(%rbx)
  4068d1:	ff 74 24 18          	push   0x18(%rsp)
  4068d5:	ff 74 24 18          	push   0x18(%rsp)
  4068d9:	ff 74 24 18          	push   0x18(%rsp)
  4068dd:	ff 74 24 18          	push   0x18(%rsp)
  4068e1:	ff 93 58 01 00 00    	call   *0x158(%rbx)
  4068e7:	48 83 c4 20          	add    $0x20,%rsp
  4068eb:	85 c0                	test   %eax,%eax
  4068ed:	75 69                	jne    406958 <dlerror@plt+0x4cc8>
  4068ef:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  4068f4:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  4068fb:	00 00 
  4068fd:	75 60                	jne    40695f <dlerror@plt+0x4ccf>
  4068ff:	48 83 c4 30          	add    $0x30,%rsp
  406903:	5b                   	pop    %rbx
  406904:	c3                   	ret
  406905:	0f 1f 00             	nopl   (%rax)
  406908:	48 89 e7             	mov    %rsp,%rdi
  40690b:	48 8d 4e 20          	lea    0x20(%rsi),%rcx
  40690f:	49 8d 90 18 01 00 00 	lea    0x118(%r8),%rdx
  406916:	eb b3                	jmp    4068cb <dlerror@plt+0x4c3b>
  406918:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40691f:	00 
  406920:	48 89 e7             	mov    %rsp,%rdi
  406923:	48 8d 4e 20          	lea    0x20(%rsi),%rcx
  406927:	49 8d 90 10 01 00 00 	lea    0x110(%r8),%rdx
  40692e:	eb 9b                	jmp    4068cb <dlerror@plt+0x4c3b>
  406930:	48 89 e7             	mov    %rsp,%rdi
  406933:	48 8d 4e 20          	lea    0x20(%rsi),%rcx
  406937:	49 8d 90 f0 00 00 00 	lea    0xf0(%r8),%rdx
  40693e:	eb 8b                	jmp    4068cb <dlerror@plt+0x4c3b>
  406940:	48 89 e7             	mov    %rsp,%rdi
  406943:	48 8d 4e 20          	lea    0x20(%rsi),%rcx
  406947:	49 8d 90 08 01 00 00 	lea    0x108(%r8),%rdx
  40694e:	e9 78 ff ff ff       	jmp    4068cb <dlerror@plt+0x4c3b>
  406953:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  406958:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40695d:	eb 90                	jmp    4068ef <dlerror@plt+0x4c5f>
  40695f:	e8 9c af ff ff       	call   401900 <__stack_chk_fail@plt>
  406964:	66 90                	xchg   %ax,%ax
  406966:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40696d:	00 00 00 
  406970:	53                   	push   %rbx
  406971:	48 83 ec 30          	sub    $0x30,%rsp
  406975:	48 8b 9e 40 30 00 00 	mov    0x3040(%rsi),%rbx
  40697c:	0f b6 96 69 40 00 00 	movzbl 0x4069(%rsi),%edx
  406983:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40698a:	00 00 
  40698c:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  406991:	31 c0                	xor    %eax,%eax
  406993:	8b 43 08             	mov    0x8(%rbx),%eax
  406996:	01 c0                	add    %eax,%eax
  406998:	09 d0                	or     %edx,%eax
  40699a:	2d 68 02 00 00       	sub    $0x268,%eax
  40699f:	83 f8 0b             	cmp    $0xb,%eax
  4069a2:	0f 87 d8 00 00 00    	ja     406a80 <dlerror@plt+0x4df0>
  4069a8:	48 8d 15 c1 50 00 00 	lea    0x50c1(%rip),%rdx        # 40ba70 <dlerror@plt+0x9de0>
  4069af:	49 89 f8             	mov    %rdi,%r8
  4069b2:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  4069b6:	48 01 d0             	add    %rdx,%rax
  4069b9:	ff e0                	jmp    *%rax
  4069bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4069c0:	48 8d 8e 3b 20 00 00 	lea    0x203b(%rsi),%rcx
  4069c7:	49 8d 90 f0 00 00 00 	lea    0xf0(%r8),%rdx
  4069ce:	48 89 e7             	mov    %rsp,%rdi
  4069d1:	4c 89 c6             	mov    %r8,%rsi
  4069d4:	ff 53 68             	call   *0x68(%rbx)
  4069d7:	ff 74 24 18          	push   0x18(%rsp)
  4069db:	ff 74 24 18          	push   0x18(%rsp)
  4069df:	ff 74 24 18          	push   0x18(%rsp)
  4069e3:	ff 74 24 18          	push   0x18(%rsp)
  4069e7:	ff 93 58 01 00 00    	call   *0x158(%rbx)
  4069ed:	48 83 c4 20          	add    $0x20,%rsp
  4069f1:	85 c0                	test   %eax,%eax
  4069f3:	0f 95 c0             	setne  %al
  4069f6:	0f b6 c0             	movzbl %al,%eax
  4069f9:	f7 d8                	neg    %eax
  4069fb:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  406a00:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  406a07:	00 00 
  406a09:	75 7f                	jne    406a8a <dlerror@plt+0x4dfa>
  406a0b:	48 83 c4 30          	add    $0x30,%rsp
  406a0f:	5b                   	pop    %rbx
  406a10:	c3                   	ret
  406a11:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  406a18:	48 89 e7             	mov    %rsp,%rdi
  406a1b:	48 8d 8e 3b 20 00 00 	lea    0x203b(%rsi),%rcx
  406a22:	49 8d 90 28 01 00 00 	lea    0x128(%r8),%rdx
  406a29:	eb a6                	jmp    4069d1 <dlerror@plt+0x4d41>
  406a2b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  406a30:	48 89 e7             	mov    %rsp,%rdi
  406a33:	48 8d 8e 3b 20 00 00 	lea    0x203b(%rsi),%rcx
  406a3a:	49 8d 90 20 01 00 00 	lea    0x120(%r8),%rdx
  406a41:	eb 8e                	jmp    4069d1 <dlerror@plt+0x4d41>
  406a43:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  406a48:	48 89 e7             	mov    %rsp,%rdi
  406a4b:	48 8d 8e 3b 20 00 00 	lea    0x203b(%rsi),%rcx
  406a52:	49 8d 90 00 01 00 00 	lea    0x100(%r8),%rdx
  406a59:	e9 73 ff ff ff       	jmp    4069d1 <dlerror@plt+0x4d41>
  406a5e:	66 90                	xchg   %ax,%ax
  406a60:	48 89 e7             	mov    %rsp,%rdi
  406a63:	48 8d 8e 3b 20 00 00 	lea    0x203b(%rsi),%rcx
  406a6a:	49 8d 90 18 01 00 00 	lea    0x118(%r8),%rdx
  406a71:	e9 5b ff ff ff       	jmp    4069d1 <dlerror@plt+0x4d41>
  406a76:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  406a7d:	00 00 00 
  406a80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  406a85:	e9 71 ff ff ff       	jmp    4069fb <dlerror@plt+0x4d6b>
  406a8a:	e8 71 ae ff ff       	call   401900 <__stack_chk_fail@plt>
  406a8f:	90                   	nop
  406a90:	41 57                	push   %r15
  406a92:	41 56                	push   %r14
  406a94:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  406a99:	41 55                	push   %r13
  406a9b:	41 54                	push   %r12
  406a9d:	4c 8d ae 3b 20 00 00 	lea    0x203b(%rsi),%r13
  406aa4:	55                   	push   %rbp
  406aa5:	53                   	push   %rbx
  406aa6:	4c 8d 05 b3 50 00 00 	lea    0x50b3(%rip),%r8        # 40bb60 <dlerror@plt+0x9ed0>
  406aad:	49 89 f6             	mov    %rsi,%r14
  406ab0:	4d 89 e9             	mov    %r13,%r9
  406ab3:	b9 01 10 00 00       	mov    $0x1001,%ecx
  406ab8:	48 81 ec 98 20 00 00 	sub    $0x2098,%rsp
  406abf:	48 8b ae 40 30 00 00 	mov    0x3040(%rsi),%rbp
  406ac6:	be 00 10 00 00       	mov    $0x1000,%esi
  406acb:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  406ad2:	00 00 
  406ad4:	48 89 84 24 88 20 00 	mov    %rax,0x2088(%rsp)
  406adb:	00 
  406adc:	31 c0                	xor    %eax,%eax
  406ade:	4c 8d 64 24 70       	lea    0x70(%rsp),%r12
  406ae3:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
  406ae8:	8b 5d 08             	mov    0x8(%rbp),%ebx
  406aeb:	4c 89 e7             	mov    %r12,%rdi
  406aee:	89 d8                	mov    %ebx,%eax
  406af0:	f7 ea                	imul   %edx
  406af2:	89 d8                	mov    %ebx,%eax
  406af4:	c1 f8 1f             	sar    $0x1f,%eax
  406af7:	c1 fa 05             	sar    $0x5,%edx
  406afa:	29 c2                	sub    %eax,%edx
  406afc:	6b c2 64             	imul   $0x64,%edx,%eax
  406aff:	89 54 24 04          	mov    %edx,0x4(%rsp)
  406b03:	ba 01 00 00 00       	mov    $0x1,%edx
  406b08:	29 c3                	sub    %eax,%ebx
  406b0a:	31 c0                	xor    %eax,%eax
  406b0c:	e8 8f ac ff ff       	call   4017a0 <__snprintf_chk@plt>
  406b11:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  406b16:	0f 8f 94 01 00 00    	jg     406cb0 <dlerror@plt+0x5020>
  406b1c:	4c 8d bc 24 80 10 00 	lea    0x1080(%rsp),%r15
  406b23:	00 
  406b24:	53                   	push   %rbx
  406b25:	44 8b 54 24 0c       	mov    0xc(%rsp),%r10d
  406b2a:	4c 8d 05 43 50 00 00 	lea    0x5043(%rip),%r8        # 40bb74 <dlerror@plt+0x9ee4>
  406b31:	b9 01 10 00 00       	mov    $0x1001,%ecx
  406b36:	ba 01 00 00 00       	mov    $0x1,%edx
  406b3b:	31 c0                	xor    %eax,%eax
  406b3d:	4d 89 e9             	mov    %r13,%r9
  406b40:	be 00 10 00 00       	mov    $0x1000,%esi
  406b45:	41 52                	push   %r10
  406b47:	4c 89 ff             	mov    %r15,%rdi
  406b4a:	e8 51 ac ff ff       	call   4017a0 <__snprintf_chk@plt>
  406b4f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  406b54:	5a                   	pop    %rdx
  406b55:	59                   	pop    %rcx
  406b56:	0f 8f 54 01 00 00    	jg     406cb0 <dlerror@plt+0x5020>
  406b5c:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
  406b61:	4c 89 e7             	mov    %r12,%rdi
  406b64:	4c 8d 64 24 50       	lea    0x50(%rsp),%r12
  406b69:	4c 89 7c 24 38       	mov    %r15,0x38(%rsp)
  406b6e:	4c 89 6c 24 40       	mov    %r13,0x40(%rsp)
  406b73:	31 db                	xor    %ebx,%ebx
  406b75:	45 31 ff             	xor    %r15d,%r15d
  406b78:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  406b7e:	31 f6                	xor    %esi,%esi
  406b80:	ff 55 18             	call   *0x18(%rbp)
  406b83:	48 85 c0             	test   %rax,%rax
  406b86:	49 89 04 1c          	mov    %rax,(%r12,%rbx,1)
  406b8a:	45 0f 44 fd          	cmove  %r13d,%r15d
  406b8e:	48 83 c3 08          	add    $0x8,%rbx
  406b92:	48 83 fb 18          	cmp    $0x18,%rbx
  406b96:	74 08                	je     406ba0 <dlerror@plt+0x4f10>
  406b98:	48 8b 7c 1c 30       	mov    0x30(%rsp,%rbx,1),%rdi
  406b9d:	eb df                	jmp    406b7e <dlerror@plt+0x4eee>
  406b9f:	90                   	nop
  406ba0:	45 85 ff             	test   %r15d,%r15d
  406ba3:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  406ba9:	74 45                	je     406bf0 <dlerror@plt+0x4f60>
  406bab:	31 db                	xor    %ebx,%ebx
  406bad:	49 8b 3c dc          	mov    (%r12,%rbx,8),%rdi
  406bb1:	48 83 c3 01          	add    $0x1,%rbx
  406bb5:	ff 95 10 01 00 00    	call   *0x110(%rbp)
  406bbb:	48 83 fb 03          	cmp    $0x3,%rbx
  406bbf:	75 ec                	jne    406bad <dlerror@plt+0x4f1d>
  406bc1:	48 8b 8c 24 88 20 00 	mov    0x2088(%rsp),%rcx
  406bc8:	00 
  406bc9:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  406bd0:	00 00 
  406bd2:	44 89 e8             	mov    %r13d,%eax
  406bd5:	0f 85 80 01 00 00    	jne    406d5b <dlerror@plt+0x50cb>
  406bdb:	48 81 c4 98 20 00 00 	add    $0x2098,%rsp
  406be2:	5b                   	pop    %rbx
  406be3:	5d                   	pop    %rbp
  406be4:	41 5c                	pop    %r12
  406be6:	41 5d                	pop    %r13
  406be8:	41 5e                	pop    %r14
  406bea:	41 5f                	pop    %r15
  406bec:	c3                   	ret
  406bed:	0f 1f 00             	nopl   (%rax)
  406bf0:	49 8b 9e 40 30 00 00 	mov    0x3040(%r14),%rbx
  406bf7:	41 0f b6 96 69 40 00 	movzbl 0x4069(%r14),%edx
  406bfe:	00 
  406bff:	8b 43 08             	mov    0x8(%rbx),%eax
  406c02:	01 c0                	add    %eax,%eax
  406c04:	09 d0                	or     %edx,%eax
  406c06:	2d 68 02 00 00       	sub    $0x268,%eax
  406c0b:	83 f8 0b             	cmp    $0xb,%eax
  406c0e:	0f 87 3c 01 00 00    	ja     406d50 <dlerror@plt+0x50c0>
  406c14:	48 8d 15 85 4e 00 00 	lea    0x4e85(%rip),%rdx        # 40baa0 <dlerror@plt+0x9e10>
  406c1b:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  406c1f:	48 01 d0             	add    %rdx,%rax
  406c22:	ff e0                	jmp    *%rax
  406c24:	0f 1f 40 00          	nopl   0x0(%rax)
  406c28:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  406c2d:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  406c32:	4d 89 e0             	mov    %r12,%r8
  406c35:	b9 03 00 00 00       	mov    $0x3,%ecx
  406c3a:	49 8d 96 00 01 00 00 	lea    0x100(%r14),%rdx
  406c41:	4c 89 f6             	mov    %r14,%rsi
  406c44:	ff 53 78             	call   *0x78(%rbx)
  406c47:	41 c7 86 f8 00 00 00 	movl   $0x1,0xf8(%r14)
  406c4e:	01 00 00 00 
  406c52:	ff 74 24 28          	push   0x28(%rsp)
  406c56:	ff 74 24 28          	push   0x28(%rsp)
  406c5a:	45 31 ed             	xor    %r13d,%r13d
  406c5d:	ff 74 24 28          	push   0x28(%rsp)
  406c61:	ff 74 24 28          	push   0x28(%rsp)
  406c65:	ff 93 58 01 00 00    	call   *0x158(%rbx)
  406c6b:	48 83 c4 20          	add    $0x20,%rsp
  406c6f:	85 c0                	test   %eax,%eax
  406c71:	41 0f 95 c5          	setne  %r13b
  406c75:	41 f7 dd             	neg    %r13d
  406c78:	e9 2e ff ff ff       	jmp    406bab <dlerror@plt+0x4f1b>
  406c7d:	0f 1f 00             	nopl   (%rax)
  406c80:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  406c85:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  406c8a:	4d 89 e0             	mov    %r12,%r8
  406c8d:	b9 03 00 00 00       	mov    $0x3,%ecx
  406c92:	49 8d 96 40 01 00 00 	lea    0x140(%r14),%rdx
  406c99:	4c 89 f6             	mov    %r14,%rsi
  406c9c:	ff 53 78             	call   *0x78(%rbx)
  406c9f:	41 c7 86 38 01 00 00 	movl   $0x1,0x138(%r14)
  406ca6:	01 00 00 00 
  406caa:	eb a6                	jmp    406c52 <dlerror@plt+0x4fc2>
  406cac:	0f 1f 40 00          	nopl   0x0(%rax)
  406cb0:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  406cb6:	e9 06 ff ff ff       	jmp    406bc1 <dlerror@plt+0x4f31>
  406cbb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  406cc0:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  406cc5:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  406cca:	4d 89 e0             	mov    %r12,%r8
  406ccd:	b9 03 00 00 00       	mov    $0x3,%ecx
  406cd2:	49 8d 96 38 01 00 00 	lea    0x138(%r14),%rdx
  406cd9:	4c 89 f6             	mov    %r14,%rsi
  406cdc:	ff 53 78             	call   *0x78(%rbx)
  406cdf:	41 c7 86 30 01 00 00 	movl   $0x1,0x130(%r14)
  406ce6:	01 00 00 00 
  406cea:	e9 63 ff ff ff       	jmp    406c52 <dlerror@plt+0x4fc2>
  406cef:	90                   	nop
  406cf0:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  406cf5:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  406cfa:	4d 89 e0             	mov    %r12,%r8
  406cfd:	b9 03 00 00 00       	mov    $0x3,%ecx
  406d02:	49 8d 96 18 01 00 00 	lea    0x118(%r14),%rdx
  406d09:	4c 89 f6             	mov    %r14,%rsi
  406d0c:	ff 53 78             	call   *0x78(%rbx)
  406d0f:	41 c7 86 10 01 00 00 	movl   $0x1,0x110(%r14)
  406d16:	01 00 00 00 
  406d1a:	e9 33 ff ff ff       	jmp    406c52 <dlerror@plt+0x4fc2>
  406d1f:	90                   	nop
  406d20:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  406d25:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  406d2a:	4d 89 e0             	mov    %r12,%r8
  406d2d:	b9 03 00 00 00       	mov    $0x3,%ecx
  406d32:	49 8d 96 30 01 00 00 	lea    0x130(%r14),%rdx
  406d39:	4c 89 f6             	mov    %r14,%rsi
  406d3c:	ff 53 78             	call   *0x78(%rbx)
  406d3f:	41 c7 86 28 01 00 00 	movl   $0x1,0x128(%r14)
  406d46:	01 00 00 00 
  406d4a:	e9 03 ff ff ff       	jmp    406c52 <dlerror@plt+0x4fc2>
  406d4f:	90                   	nop
  406d50:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  406d56:	e9 50 fe ff ff       	jmp    406bab <dlerror@plt+0x4f1b>
  406d5b:	e8 a0 ab ff ff       	call   401900 <__stack_chk_fail@plt>
  406d60:	41 57                	push   %r15
  406d62:	41 56                	push   %r14
  406d64:	41 55                	push   %r13
  406d66:	41 54                	push   %r12
  406d68:	55                   	push   %rbp
  406d69:	53                   	push   %rbx
  406d6a:	48 83 ec 58          	sub    $0x58,%rsp
  406d6e:	4c 8b 7e 18          	mov    0x18(%rsi),%r15
  406d72:	48 8b 9e 40 30 00 00 	mov    0x3040(%rsi),%rbx
  406d79:	64 48 8b 0c 25 28 00 	mov    %fs:0x28,%rcx
  406d80:	00 00 
  406d82:	48 89 4c 24 48       	mov    %rcx,0x48(%rsp)
  406d87:	31 c9                	xor    %ecx,%ecx
  406d89:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
  406d8e:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  406d93:	4d 85 ff             	test   %r15,%r15
  406d96:	0f 84 e4 00 00 00    	je     406e80 <dlerror@plt+0x51f0>
  406d9c:	8b 6e 10             	mov    0x10(%rsi),%ebp
  406d9f:	48 63 c5             	movslq %ebp,%rax
  406da2:	be 08 00 00 00       	mov    $0x8,%esi
  406da7:	48 89 c7             	mov    %rax,%rdi
  406daa:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  406daf:	e8 0c ac ff ff       	call   4019c0 <calloc@plt>
  406db4:	48 85 c0             	test   %rax,%rax
  406db7:	49 89 c4             	mov    %rax,%r12
  406dba:	0f 84 b3 01 00 00    	je     406f73 <dlerror@plt+0x52e3>
  406dc0:	85 ed                	test   %ebp,%ebp
  406dc2:	0f 8e 70 01 00 00    	jle    406f38 <dlerror@plt+0x52a8>
  406dc8:	49 89 c6             	mov    %rax,%r14
  406dcb:	8d 45 ff             	lea    -0x1(%rbp),%eax
  406dce:	4d 8d 6c c7 08       	lea    0x8(%r15,%rax,8),%r13
  406dd3:	eb 10                	jmp    406de5 <dlerror@plt+0x5155>
  406dd5:	0f 1f 00             	nopl   (%rax)
  406dd8:	49 83 c7 08          	add    $0x8,%r15
  406ddc:	49 83 c6 08          	add    $0x8,%r14
  406de0:	4d 39 ef             	cmp    %r13,%r15
  406de3:	74 63                	je     406e48 <dlerror@plt+0x51b8>
  406de5:	31 f6                	xor    %esi,%esi
  406de7:	49 8b 3f             	mov    (%r15),%rdi
  406dea:	ff 53 18             	call   *0x18(%rbx)
  406ded:	48 85 c0             	test   %rax,%rax
  406df0:	49 89 06             	mov    %rax,(%r14)
  406df3:	75 e3                	jne    406dd8 <dlerror@plt+0x5148>
  406df5:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  406dfb:	45 31 ed             	xor    %r13d,%r13d
  406dfe:	66 90                	xchg   %ax,%ax
  406e00:	4b 8b 3c ec          	mov    (%r12,%r13,8),%rdi
  406e04:	49 83 c5 01          	add    $0x1,%r13
  406e08:	ff 93 10 01 00 00    	call   *0x110(%rbx)
  406e0e:	44 39 ed             	cmp    %r13d,%ebp
  406e11:	7f ed                	jg     406e00 <dlerror@plt+0x5170>
  406e13:	4c 89 e7             	mov    %r12,%rdi
  406e16:	e8 a5 a9 ff ff       	call   4017c0 <free@plt>
  406e1b:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
  406e20:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  406e27:	00 00 
  406e29:	44 89 f0             	mov    %r14d,%eax
  406e2c:	0f 85 4c 01 00 00    	jne    406f7e <dlerror@plt+0x52ee>
  406e32:	48 83 c4 58          	add    $0x58,%rsp
  406e36:	5b                   	pop    %rbx
  406e37:	5d                   	pop    %rbp
  406e38:	41 5c                	pop    %r12
  406e3a:	41 5d                	pop    %r13
  406e3c:	41 5e                	pop    %r14
  406e3e:	41 5f                	pop    %r15
  406e40:	c3                   	ret
  406e41:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  406e48:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  406e4d:	4c 8b a9 40 30 00 00 	mov    0x3040(%rcx),%r13
  406e54:	0f b6 91 69 40 00 00 	movzbl 0x4069(%rcx),%edx
  406e5b:	41 8b 45 08          	mov    0x8(%r13),%eax
  406e5f:	01 c0                	add    %eax,%eax
  406e61:	09 d0                	or     %edx,%eax
  406e63:	2d 68 02 00 00       	sub    $0x268,%eax
  406e68:	83 f8 0b             	cmp    $0xb,%eax
  406e6b:	77 88                	ja     406df5 <dlerror@plt+0x5165>
  406e6d:	48 8d 15 5c 4c 00 00 	lea    0x4c5c(%rip),%rdx        # 40bad0 <dlerror@plt+0x9e40>
  406e74:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  406e78:	48 01 d0             	add    %rdx,%rax
  406e7b:	ff e0                	jmp    *%rax
  406e7d:	0f 1f 00             	nopl   (%rax)
  406e80:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  406e85:	8b 28                	mov    (%rax),%ebp
  406e87:	4c 8b 78 08          	mov    0x8(%rax),%r15
  406e8b:	e9 0f ff ff ff       	jmp    406d9f <dlerror@plt+0x510f>
  406e90:	49 89 dd             	mov    %rbx,%r13
  406e93:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  406e98:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  406e9d:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  406ea2:	48 8d 96 80 00 00 00 	lea    0x80(%rsi),%rdx
  406ea9:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  406eae:	4d 89 e0             	mov    %r12,%r8
  406eb1:	45 31 f6             	xor    %r14d,%r14d
  406eb4:	41 ff 55 78          	call   *0x78(%r13)
  406eb8:	ff 74 24 38          	push   0x38(%rsp)
  406ebc:	ff 74 24 38          	push   0x38(%rsp)
  406ec0:	ff 74 24 38          	push   0x38(%rsp)
  406ec4:	ff 74 24 38          	push   0x38(%rsp)
  406ec8:	41 ff 95 58 01 00 00 	call   *0x158(%r13)
  406ecf:	48 83 c4 20          	add    $0x20,%rsp
  406ed3:	85 c0                	test   %eax,%eax
  406ed5:	41 0f 95 c6          	setne  %r14b
  406ed9:	41 f7 de             	neg    %r14d
  406edc:	85 ed                	test   %ebp,%ebp
  406ede:	0f 8f 17 ff ff ff    	jg     406dfb <dlerror@plt+0x516b>
  406ee4:	e9 2a ff ff ff       	jmp    406e13 <dlerror@plt+0x5183>
  406ee9:	49 89 dd             	mov    %rbx,%r13
  406eec:	0f 1f 40 00          	nopl   0x0(%rax)
  406ef0:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  406ef5:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  406efa:	48 8d 56 60          	lea    0x60(%rsi),%rdx
  406efe:	eb a9                	jmp    406ea9 <dlerror@plt+0x5219>
  406f00:	49 89 dd             	mov    %rbx,%r13
  406f03:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  406f08:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  406f0d:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  406f12:	48 8d 56 68          	lea    0x68(%rsi),%rdx
  406f16:	eb 91                	jmp    406ea9 <dlerror@plt+0x5219>
  406f18:	49 89 dd             	mov    %rbx,%r13
  406f1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  406f20:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  406f25:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  406f2a:	48 8d 56 78          	lea    0x78(%rsi),%rdx
  406f2e:	e9 76 ff ff ff       	jmp    406ea9 <dlerror@plt+0x5219>
  406f33:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  406f38:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  406f3d:	8b 43 08             	mov    0x8(%rbx),%eax
  406f40:	0f b6 91 69 40 00 00 	movzbl 0x4069(%rcx),%edx
  406f47:	01 c0                	add    %eax,%eax
  406f49:	09 d0                	or     %edx,%eax
  406f4b:	2d 68 02 00 00       	sub    $0x268,%eax
  406f50:	83 f8 0b             	cmp    $0xb,%eax
  406f53:	77 13                	ja     406f68 <dlerror@plt+0x52d8>
  406f55:	48 8d 15 a4 4b 00 00 	lea    0x4ba4(%rip),%rdx        # 40bb00 <dlerror@plt+0x9e70>
  406f5c:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  406f60:	48 01 d0             	add    %rdx,%rax
  406f63:	ff e0                	jmp    *%rax
  406f65:	0f 1f 00             	nopl   (%rax)
  406f68:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  406f6e:	e9 a0 fe ff ff       	jmp    406e13 <dlerror@plt+0x5183>
  406f73:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  406f79:	e9 9d fe ff ff       	jmp    406e1b <dlerror@plt+0x518b>
  406f7e:	e8 7d a9 ff ff       	call   401900 <__stack_chk_fail@plt>
  406f83:	0f 1f 00             	nopl   (%rax)
  406f86:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  406f8d:	00 00 00 
  406f90:	41 54                	push   %r12
  406f92:	55                   	push   %rbp
  406f93:	48 89 d5             	mov    %rdx,%rbp
  406f96:	53                   	push   %rbx
  406f97:	48 83 ec 30          	sub    $0x30,%rsp
  406f9b:	4c 8b a6 40 30 00 00 	mov    0x3040(%rsi),%r12
  406fa2:	0f b6 96 69 40 00 00 	movzbl 0x4069(%rsi),%edx
  406fa9:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  406fb0:	00 00 
  406fb2:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  406fb7:	31 c0                	xor    %eax,%eax
  406fb9:	41 8b 44 24 08       	mov    0x8(%r12),%eax
  406fbe:	01 c0                	add    %eax,%eax
  406fc0:	09 d0                	or     %edx,%eax
  406fc2:	2d 68 02 00 00       	sub    $0x268,%eax
  406fc7:	83 f8 0b             	cmp    $0xb,%eax
  406fca:	0f 87 b2 00 00 00    	ja     407082 <dlerror@plt+0x53f2>
  406fd0:	48 8d 15 59 4b 00 00 	lea    0x4b59(%rip),%rdx        # 40bb30 <dlerror@plt+0x9ea0>
  406fd7:	48 89 fb             	mov    %rdi,%rbx
  406fda:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  406fde:	48 01 d0             	add    %rdx,%rax
  406fe1:	ff e0                	jmp    *%rax
  406fe3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  406fe8:	c7 87 b0 00 00 00 00 	movl   $0x0,0xb0(%rdi)
  406fef:	00 00 00 
  406ff2:	c7 87 cc 00 00 00 00 	movl   $0x0,0xcc(%rdi)
  406ff9:	00 00 00 
  406ffc:	c7 87 dc 00 00 00 01 	movl   $0x1,0xdc(%rdi)
  407003:	00 00 00 
  407006:	8b 45 08             	mov    0x8(%rbp),%eax
  407009:	89 87 c4 00 00 00    	mov    %eax,0xc4(%rdi)
  40700f:	8b 55 04             	mov    0x4(%rbp),%edx
  407012:	31 c0                	xor    %eax,%eax
  407014:	85 d2                	test   %edx,%edx
  407016:	0f 94 c0             	sete   %al
  407019:	89 87 e0 00 00 00    	mov    %eax,0xe0(%rdi)
  40701f:	8b 45 00             	mov    0x0(%rbp),%eax
  407022:	89 87 d0 00 00 00    	mov    %eax,0xd0(%rdi)
  407028:	8b 45 0c             	mov    0xc(%rbp),%eax
  40702b:	89 47 14             	mov    %eax,0x14(%rdi)
  40702e:	48 8b 45 10          	mov    0x10(%rbp),%rax
  407032:	48 89 47 18          	mov    %rax,0x18(%rdi)
  407036:	8b 45 1c             	mov    0x1c(%rbp),%eax
  407039:	89 47 0c             	mov    %eax,0xc(%rdi)
  40703c:	48 63 4d 20          	movslq 0x20(%rbp),%rcx
  407040:	85 c9                	test   %ecx,%ecx
  407042:	0f 84 48 01 00 00    	je     407190 <dlerror@plt+0x5500>
  407048:	48 89 e7             	mov    %rsp,%rdi
  40704b:	48 8d 93 a0 00 00 00 	lea    0xa0(%rbx),%rdx
  407052:	4c 8b 45 30          	mov    0x30(%rbp),%r8
  407056:	48 89 de             	mov    %rbx,%rsi
  407059:	41 ff 54 24 78       	call   *0x78(%r12)
  40705e:	ff 74 24 18          	push   0x18(%rsp)
  407062:	ff 74 24 18          	push   0x18(%rsp)
  407066:	ff 74 24 18          	push   0x18(%rsp)
  40706a:	ff 74 24 18          	push   0x18(%rsp)
  40706e:	41 ff 94 24 58 01 00 	call   *0x158(%r12)
  407075:	00 
  407076:	48 83 c4 20          	add    $0x20,%rsp
  40707a:	85 c0                	test   %eax,%eax
  40707c:	0f 84 0e 01 00 00    	je     407190 <dlerror@plt+0x5500>
  407082:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  407087:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
  40708c:	64 48 33 3c 25 28 00 	xor    %fs:0x28,%rdi
  407093:	00 00 
  407095:	0f 85 06 02 00 00    	jne    4072a1 <dlerror@plt+0x5611>
  40709b:	48 83 c4 30          	add    $0x30,%rsp
  40709f:	5b                   	pop    %rbx
  4070a0:	5d                   	pop    %rbp
  4070a1:	41 5c                	pop    %r12
  4070a3:	c3                   	ret
  4070a4:	0f 1f 40 00          	nopl   0x0(%rax)
  4070a8:	c7 87 98 00 00 00 00 	movl   $0x0,0x98(%rdi)
  4070af:	00 00 00 
  4070b2:	c7 87 b0 00 00 00 00 	movl   $0x0,0xb0(%rdi)
  4070b9:	00 00 00 
  4070bc:	c7 87 c0 00 00 00 01 	movl   $0x1,0xc0(%rdi)
  4070c3:	00 00 00 
  4070c6:	8b 45 08             	mov    0x8(%rbp),%eax
  4070c9:	89 87 a8 00 00 00    	mov    %eax,0xa8(%rdi)
  4070cf:	8b 7d 04             	mov    0x4(%rbp),%edi
  4070d2:	31 c0                	xor    %eax,%eax
  4070d4:	85 ff                	test   %edi,%edi
  4070d6:	0f 94 c0             	sete   %al
  4070d9:	89 83 c4 00 00 00    	mov    %eax,0xc4(%rbx)
  4070df:	8b 45 00             	mov    0x0(%rbp),%eax
  4070e2:	89 83 b4 00 00 00    	mov    %eax,0xb4(%rbx)
  4070e8:	8b 45 0c             	mov    0xc(%rbp),%eax
  4070eb:	89 43 14             	mov    %eax,0x14(%rbx)
  4070ee:	48 8b 45 10          	mov    0x10(%rbp),%rax
  4070f2:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4070f6:	8b 45 1c             	mov    0x1c(%rbp),%eax
  4070f9:	89 43 0c             	mov    %eax,0xc(%rbx)
  4070fc:	48 63 4d 20          	movslq 0x20(%rbp),%rcx
  407100:	85 c9                	test   %ecx,%ecx
  407102:	74 3a                	je     40713e <dlerror@plt+0x54ae>
  407104:	48 89 e7             	mov    %rsp,%rdi
  407107:	48 8d 93 88 00 00 00 	lea    0x88(%rbx),%rdx
  40710e:	4c 8b 45 30          	mov    0x30(%rbp),%r8
  407112:	48 89 de             	mov    %rbx,%rsi
  407115:	41 ff 54 24 78       	call   *0x78(%r12)
  40711a:	ff 74 24 18          	push   0x18(%rsp)
  40711e:	ff 74 24 18          	push   0x18(%rsp)
  407122:	ff 74 24 18          	push   0x18(%rsp)
  407126:	ff 74 24 18          	push   0x18(%rsp)
  40712a:	41 ff 94 24 58 01 00 	call   *0x158(%r12)
  407131:	00 
  407132:	48 83 c4 20          	add    $0x20,%rsp
  407136:	85 c0                	test   %eax,%eax
  407138:	0f 85 44 ff ff ff    	jne    407082 <dlerror@plt+0x53f2>
  40713e:	48 63 4d 38          	movslq 0x38(%rbp),%rcx
  407142:	48 89 e7             	mov    %rsp,%rdi
  407145:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  407149:	85 c9                	test   %ecx,%ecx
  40714b:	74 30                	je     40717d <dlerror@plt+0x54ed>
  40714d:	4c 8b 45 48          	mov    0x48(%rbp),%r8
  407151:	48 89 de             	mov    %rbx,%rsi
  407154:	41 ff 54 24 78       	call   *0x78(%r12)
  407159:	ff 74 24 18          	push   0x18(%rsp)
  40715d:	ff 74 24 18          	push   0x18(%rsp)
  407161:	ff 74 24 18          	push   0x18(%rsp)
  407165:	ff 74 24 18          	push   0x18(%rsp)
  407169:	41 ff 94 24 58 01 00 	call   *0x158(%r12)
  407170:	00 
  407171:	48 83 c4 20          	add    $0x20,%rsp
  407175:	85 c0                	test   %eax,%eax
  407177:	0f 85 05 ff ff ff    	jne    407082 <dlerror@plt+0x53f2>
  40717d:	c7 43 10 01 00 00 00 	movl   $0x1,0x10(%rbx)
  407184:	31 c0                	xor    %eax,%eax
  407186:	e9 fc fe ff ff       	jmp    407087 <dlerror@plt+0x53f7>
  40718b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  407190:	48 63 4d 38          	movslq 0x38(%rbp),%rcx
  407194:	48 89 e7             	mov    %rsp,%rdi
  407197:	48 8d 93 90 00 00 00 	lea    0x90(%rbx),%rdx
  40719e:	85 c9                	test   %ecx,%ecx
  4071a0:	75 ab                	jne    40714d <dlerror@plt+0x54bd>
  4071a2:	eb d9                	jmp    40717d <dlerror@plt+0x54ed>
  4071a4:	0f 1f 40 00          	nopl   0x0(%rax)
  4071a8:	8b 45 08             	mov    0x8(%rbp),%eax
  4071ab:	8b 75 04             	mov    0x4(%rbp),%esi
  4071ae:	c7 87 98 00 00 00 00 	movl   $0x0,0x98(%rdi)
  4071b5:	00 00 00 
  4071b8:	c7 87 b4 00 00 00 00 	movl   $0x0,0xb4(%rdi)
  4071bf:	00 00 00 
  4071c2:	c7 87 c4 00 00 00 01 	movl   $0x1,0xc4(%rdi)
  4071c9:	00 00 00 
  4071cc:	89 87 ac 00 00 00    	mov    %eax,0xac(%rdi)
  4071d2:	31 c0                	xor    %eax,%eax
  4071d4:	85 f6                	test   %esi,%esi
  4071d6:	0f 94 c0             	sete   %al
  4071d9:	89 87 c8 00 00 00    	mov    %eax,0xc8(%rdi)
  4071df:	8b 45 00             	mov    0x0(%rbp),%eax
  4071e2:	89 87 b8 00 00 00    	mov    %eax,0xb8(%rdi)
  4071e8:	e9 fb fe ff ff       	jmp    4070e8 <dlerror@plt+0x5458>
  4071ed:	0f 1f 00             	nopl   (%rax)
  4071f0:	8b 45 08             	mov    0x8(%rbp),%eax
  4071f3:	8b 4d 04             	mov    0x4(%rbp),%ecx
  4071f6:	c7 87 a8 00 00 00 00 	movl   $0x0,0xa8(%rdi)
  4071fd:	00 00 00 
  407200:	c7 87 c4 00 00 00 00 	movl   $0x0,0xc4(%rdi)
  407207:	00 00 00 
  40720a:	c7 87 d4 00 00 00 01 	movl   $0x1,0xd4(%rdi)
  407211:	00 00 00 
  407214:	89 87 bc 00 00 00    	mov    %eax,0xbc(%rdi)
  40721a:	31 c0                	xor    %eax,%eax
  40721c:	85 c9                	test   %ecx,%ecx
  40721e:	0f 94 c0             	sete   %al
  407221:	48 63 4d 20          	movslq 0x20(%rbp),%rcx
  407225:	89 87 d8 00 00 00    	mov    %eax,0xd8(%rdi)
  40722b:	8b 45 00             	mov    0x0(%rbp),%eax
  40722e:	89 87 c8 00 00 00    	mov    %eax,0xc8(%rdi)
  407234:	8b 45 0c             	mov    0xc(%rbp),%eax
  407237:	85 c9                	test   %ecx,%ecx
  407239:	89 47 14             	mov    %eax,0x14(%rdi)
  40723c:	48 8b 45 10          	mov    0x10(%rbp),%rax
  407240:	48 89 47 18          	mov    %rax,0x18(%rdi)
  407244:	8b 45 1c             	mov    0x1c(%rbp),%eax
  407247:	89 47 0c             	mov    %eax,0xc(%rdi)
  40724a:	74 3a                	je     407286 <dlerror@plt+0x55f6>
  40724c:	48 89 e7             	mov    %rsp,%rdi
  40724f:	48 8d 93 98 00 00 00 	lea    0x98(%rbx),%rdx
  407256:	4c 8b 45 30          	mov    0x30(%rbp),%r8
  40725a:	48 89 de             	mov    %rbx,%rsi
  40725d:	41 ff 54 24 78       	call   *0x78(%r12)
  407262:	ff 74 24 18          	push   0x18(%rsp)
  407266:	ff 74 24 18          	push   0x18(%rsp)
  40726a:	ff 74 24 18          	push   0x18(%rsp)
  40726e:	ff 74 24 18          	push   0x18(%rsp)
  407272:	41 ff 94 24 58 01 00 	call   *0x158(%r12)
  407279:	00 
  40727a:	48 83 c4 20          	add    $0x20,%rsp
  40727e:	85 c0                	test   %eax,%eax
  407280:	0f 85 fc fd ff ff    	jne    407082 <dlerror@plt+0x53f2>
  407286:	48 63 4d 38          	movslq 0x38(%rbp),%rcx
  40728a:	48 89 e7             	mov    %rsp,%rdi
  40728d:	48 8d 93 88 00 00 00 	lea    0x88(%rbx),%rdx
  407294:	85 c9                	test   %ecx,%ecx
  407296:	0f 85 b1 fe ff ff    	jne    40714d <dlerror@plt+0x54bd>
  40729c:	e9 dc fe ff ff       	jmp    40717d <dlerror@plt+0x54ed>
  4072a1:	e8 5a a6 ff ff       	call   401900 <__stack_chk_fail@plt>
  4072a6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4072ad:	00 00 00 
  4072b0:	41 57                	push   %r15
  4072b2:	41 56                	push   %r14
  4072b4:	41 55                	push   %r13
  4072b6:	41 54                	push   %r12
  4072b8:	4d 89 c4             	mov    %r8,%r12
  4072bb:	55                   	push   %rbp
  4072bc:	53                   	push   %rbx
  4072bd:	48 89 d5             	mov    %rdx,%rbp
  4072c0:	48 89 f3             	mov    %rsi,%rbx
  4072c3:	31 f6                	xor    %esi,%esi
  4072c5:	48 83 ec 08          	sub    $0x8,%rsp
  4072c9:	ff d1                	call   *%rcx
  4072cb:	48 85 c0             	test   %rax,%rax
  4072ce:	0f 84 7c 01 00 00    	je     407450 <dlerror@plt+0x57c0>
  4072d4:	48 89 c7             	mov    %rax,%rdi
  4072d7:	49 89 c6             	mov    %rax,%r14
  4072da:	e8 51 a6 ff ff       	call   401930 <wcslen@plt>
  4072df:	48 8d 78 01          	lea    0x1(%rax),%rdi
  4072e3:	49 89 c7             	mov    %rax,%r15
  4072e6:	48 b8 ff ff ff ff ff 	movabs $0x3fffffffffffffff,%rax
  4072ed:	ff ff 3f 
  4072f0:	48 39 c7             	cmp    %rax,%rdi
  4072f3:	0f 87 5f 01 00 00    	ja     407458 <dlerror@plt+0x57c8>
  4072f9:	48 c1 e7 02          	shl    $0x2,%rdi
  4072fd:	e8 ce a7 ff ff       	call   401ad0 <malloc@plt>
  407302:	48 85 c0             	test   %rax,%rax
  407305:	49 89 c5             	mov    %rax,%r13
  407308:	0f 84 4a 01 00 00    	je     407458 <dlerror@plt+0x57c8>
  40730e:	4d 85 ff             	test   %r15,%r15
  407311:	48 89 c1             	mov    %rax,%rcx
  407314:	0f 84 b2 00 00 00    	je     4073cc <dlerror@plt+0x573c>
  40731a:	31 d2                	xor    %edx,%edx
  40731c:	eb 75                	jmp    407393 <dlerror@plt+0x5703>
  40731e:	66 90                	xchg   %ax,%ax
  407320:	49 39 f7             	cmp    %rsi,%r15
  407323:	76 2f                	jbe    407354 <dlerror@plt+0x56c4>
  407325:	43 8b 7c 06 04       	mov    0x4(%r14,%r8,1),%edi
  40732a:	44 8d 87 00 24 ff ff 	lea    -0xdc00(%rdi),%r8d
  407331:	41 81 f8 ff 03 00 00 	cmp    $0x3ff,%r8d
  407338:	77 1a                	ja     407354 <dlerror@plt+0x56c4>
  40733a:	c1 e0 0a             	shl    $0xa,%eax
  40733d:	81 e7 ff 03 00 00    	and    $0x3ff,%edi
  407343:	48 8d 72 02          	lea    0x2(%rdx),%rsi
  407347:	25 00 fc 0f 00       	and    $0xffc00,%eax
  40734c:	09 c7                	or     %eax,%edi
  40734e:	8d 87 00 00 01 00    	lea    0x10000(%rdi),%eax
  407354:	89 c7                	mov    %eax,%edi
  407356:	89 c2                	mov    %eax,%edx
  407358:	83 e7 3f             	and    $0x3f,%edi
  40735b:	c1 fa 06             	sar    $0x6,%edx
  40735e:	83 cf 80             	or     $0xffffff80,%edi
  407361:	83 e2 3f             	and    $0x3f,%edx
  407364:	41 89 c0             	mov    %eax,%r8d
  407367:	41 c1 f8 0c          	sar    $0xc,%r8d
  40736b:	83 ca 80             	or     $0xffffff80,%edx
  40736e:	3d ff ff 00 00       	cmp    $0xffff,%eax
  407373:	0f 8f a7 00 00 00    	jg     407420 <dlerror@plt+0x5790>
  407379:	41 83 c8 e0          	or     $0xffffffe0,%r8d
  40737d:	88 51 01             	mov    %dl,0x1(%rcx)
  407380:	40 88 79 02          	mov    %dil,0x2(%rcx)
  407384:	44 88 01             	mov    %r8b,(%rcx)
  407387:	48 89 f2             	mov    %rsi,%rdx
  40738a:	48 83 c1 03          	add    $0x3,%rcx
  40738e:	49 39 f7             	cmp    %rsi,%r15
  407391:	76 39                	jbe    4073cc <dlerror@plt+0x573c>
  407393:	41 8b 04 96          	mov    (%r14,%rdx,4),%eax
  407397:	4c 8d 04 95 00 00 00 	lea    0x0(,%rdx,4),%r8
  40739e:	00 
  40739f:	48 8d 72 01          	lea    0x1(%rdx),%rsi
  4073a3:	8d b8 00 28 ff ff    	lea    -0xd800(%rax),%edi
  4073a9:	81 ff ff 03 00 00    	cmp    $0x3ff,%edi
  4073af:	0f 86 6b ff ff ff    	jbe    407320 <dlerror@plt+0x5690>
  4073b5:	83 f8 7f             	cmp    $0x7f,%eax
  4073b8:	0f 8f a2 00 00 00    	jg     407460 <dlerror@plt+0x57d0>
  4073be:	88 01                	mov    %al,(%rcx)
  4073c0:	48 83 c1 01          	add    $0x1,%rcx
  4073c4:	49 39 f7             	cmp    %rsi,%r15
  4073c7:	48 89 f2             	mov    %rsi,%rdx
  4073ca:	77 c7                	ja     407393 <dlerror@plt+0x5703>
  4073cc:	c6 01 00             	movb   $0x0,(%rcx)
  4073cf:	4c 89 f7             	mov    %r14,%rdi
  4073d2:	41 ff 14 24          	call   *(%r12)
  4073d6:	48 85 db             	test   %rbx,%rbx
  4073d9:	74 2f                	je     40740a <dlerror@plt+0x577a>
  4073db:	48 8d 15 45 35 00 00 	lea    0x3545(%rip),%rdx        # 40a927 <dlerror@plt+0x8c97>
  4073e2:	4c 89 e9             	mov    %r13,%rcx
  4073e5:	48 89 ee             	mov    %rbp,%rsi
  4073e8:	48 89 df             	mov    %rbx,%rdi
  4073eb:	31 c0                	xor    %eax,%eax
  4073ed:	e8 5e a5 ff ff       	call   401950 <snprintf@plt>
  4073f2:	4c 89 ef             	mov    %r13,%rdi
  4073f5:	4c 63 e0             	movslq %eax,%r12
  4073f8:	e8 c3 a3 ff ff       	call   4017c0 <free@plt>
  4073fd:	45 85 e4             	test   %r12d,%r12d
  407400:	78 4e                	js     407450 <dlerror@plt+0x57c0>
  407402:	4c 39 e5             	cmp    %r12,%rbp
  407405:	76 49                	jbe    407450 <dlerror@plt+0x57c0>
  407407:	49 89 dd             	mov    %rbx,%r13
  40740a:	48 83 c4 08          	add    $0x8,%rsp
  40740e:	4c 89 e8             	mov    %r13,%rax
  407411:	5b                   	pop    %rbx
  407412:	5d                   	pop    %rbp
  407413:	41 5c                	pop    %r12
  407415:	41 5d                	pop    %r13
  407417:	41 5e                	pop    %r14
  407419:	41 5f                	pop    %r15
  40741b:	c3                   	ret
  40741c:	0f 1f 40 00          	nopl   0x0(%rax)
  407420:	c1 f8 12             	sar    $0x12,%eax
  407423:	41 83 e0 3f          	and    $0x3f,%r8d
  407427:	88 51 02             	mov    %dl,0x2(%rcx)
  40742a:	83 c8 f0             	or     $0xfffffff0,%eax
  40742d:	41 83 c8 80          	or     $0xffffff80,%r8d
  407431:	40 88 79 03          	mov    %dil,0x3(%rcx)
  407435:	88 01                	mov    %al,(%rcx)
  407437:	44 88 41 01          	mov    %r8b,0x1(%rcx)
  40743b:	48 89 f2             	mov    %rsi,%rdx
  40743e:	48 83 c1 04          	add    $0x4,%rcx
  407442:	e9 47 ff ff ff       	jmp    40738e <dlerror@plt+0x56fe>
  407447:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40744e:	00 00 
  407450:	45 31 ed             	xor    %r13d,%r13d
  407453:	eb b5                	jmp    40740a <dlerror@plt+0x577a>
  407455:	0f 1f 00             	nopl   (%rax)
  407458:	45 31 ed             	xor    %r13d,%r13d
  40745b:	e9 6f ff ff ff       	jmp    4073cf <dlerror@plt+0x573f>
  407460:	89 c7                	mov    %eax,%edi
  407462:	41 89 c0             	mov    %eax,%r8d
  407465:	83 e7 3f             	and    $0x3f,%edi
  407468:	41 c1 f8 06          	sar    $0x6,%r8d
  40746c:	83 cf 80             	or     $0xffffff80,%edi
  40746f:	3d ff 07 00 00       	cmp    $0x7ff,%eax
  407474:	44 89 c2             	mov    %r8d,%edx
  407477:	0f 8f e4 fe ff ff    	jg     407361 <dlerror@plt+0x56d1>
  40747d:	44 89 c0             	mov    %r8d,%eax
  407480:	40 88 79 01          	mov    %dil,0x1(%rcx)
  407484:	48 89 f2             	mov    %rsi,%rdx
  407487:	83 c8 c0             	or     $0xffffffc0,%eax
  40748a:	48 83 c1 02          	add    $0x2,%rcx
  40748e:	88 41 fe             	mov    %al,-0x2(%rcx)
  407491:	e9 f8 fe ff ff       	jmp    40738e <dlerror@plt+0x56fe>
  407496:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40749d:	00 00 00 
  4074a0:	41 54                	push   %r12
  4074a2:	55                   	push   %rbp
  4074a3:	49 89 fc             	mov    %rdi,%r12
  4074a6:	53                   	push   %rbx
  4074a7:	48 8d 7e 20          	lea    0x20(%rsi),%rdi
  4074ab:	ba 00 10 00 00       	mov    $0x1000,%edx
  4074b0:	48 81 ec 20 10 00 00 	sub    $0x1020,%rsp
  4074b7:	48 8b 9e 40 30 00 00 	mov    0x3040(%rsi),%rbx
  4074be:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
  4074c3:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4074ca:	00 00 
  4074cc:	48 89 84 24 18 10 00 	mov    %rax,0x1018(%rsp)
  4074d3:	00 
  4074d4:	31 c0                	xor    %eax,%eax
  4074d6:	48 8b 4b 18          	mov    0x18(%rbx),%rcx
  4074da:	4c 8d 83 10 01 00 00 	lea    0x110(%rbx),%r8
  4074e1:	48 89 ee             	mov    %rbp,%rsi
  4074e4:	e8 c7 fd ff ff       	call   4072b0 <dlerror@plt+0x5620>
  4074e9:	48 85 c0             	test   %rax,%rax
  4074ec:	74 73                	je     407561 <dlerror@plt+0x58d1>
  4074ee:	48 89 ea             	mov    %rbp,%rdx
  4074f1:	48 8d 35 97 46 00 00 	lea    0x4697(%rip),%rsi        # 40bb8f <dlerror@plt+0x9eff>
  4074f8:	4c 89 e7             	mov    %r12,%rdi
  4074fb:	ff 93 98 00 00 00    	call   *0x98(%rbx)
  407501:	31 d2                	xor    %edx,%edx
  407503:	85 c0                	test   %eax,%eax
  407505:	78 29                	js     407530 <dlerror@plt+0x58a0>
  407507:	48 8b 8c 24 18 10 00 	mov    0x1018(%rsp),%rcx
  40750e:	00 
  40750f:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  407516:	00 00 
  407518:	89 d0                	mov    %edx,%eax
  40751a:	75 56                	jne    407572 <dlerror@plt+0x58e2>
  40751c:	48 81 c4 20 10 00 00 	add    $0x1020,%rsp
  407523:	5b                   	pop    %rbx
  407524:	5d                   	pop    %rbp
  407525:	41 5c                	pop    %r12
  407527:	c3                   	ret
  407528:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40752f:	00 
  407530:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
  407535:	4c 89 e7             	mov    %r12,%rdi
  407538:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  40753f:	00 00 
  407541:	ff 93 a8 00 00 00    	call   *0xa8(%rbx)
  407547:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  40754c:	48 8d 3d ad 47 00 00 	lea    0x47ad(%rip),%rdi        # 40bd00 <dlerror@plt+0xa070>
  407553:	31 c0                	xor    %eax,%eax
  407555:	e8 96 cf ff ff       	call   4044f0 <dlerror@plt+0x2860>
  40755a:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  40755f:	eb a6                	jmp    407507 <dlerror@plt+0x5877>
  407561:	48 8d 3d 60 47 00 00 	lea    0x4760(%rip),%rdi        # 40bcc8 <dlerror@plt+0xa038>
  407568:	e8 83 cf ff ff       	call   4044f0 <dlerror@plt+0x2860>
  40756d:	83 ca ff             	or     $0xffffffff,%edx
  407570:	eb 95                	jmp    407507 <dlerror@plt+0x5877>
  407572:	e8 89 a3 ff ff       	call   401900 <__stack_chk_fail@plt>
  407577:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40757e:	00 00 
  407580:	41 54                	push   %r12
  407582:	55                   	push   %rbp
  407583:	49 89 fc             	mov    %rdi,%r12
  407586:	53                   	push   %rbx
  407587:	48 8d be 3b 20 00 00 	lea    0x203b(%rsi),%rdi
  40758e:	ba 00 10 00 00       	mov    $0x1000,%edx
  407593:	48 81 ec 20 10 00 00 	sub    $0x1020,%rsp
  40759a:	48 8b 9e 40 30 00 00 	mov    0x3040(%rsi),%rbx
  4075a1:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
  4075a6:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4075ad:	00 00 
  4075af:	48 89 84 24 18 10 00 	mov    %rax,0x1018(%rsp)
  4075b6:	00 
  4075b7:	31 c0                	xor    %eax,%eax
  4075b9:	48 8b 4b 18          	mov    0x18(%rbx),%rcx
  4075bd:	4c 8d 83 10 01 00 00 	lea    0x110(%rbx),%r8
  4075c4:	48 89 ee             	mov    %rbp,%rsi
  4075c7:	e8 e4 fc ff ff       	call   4072b0 <dlerror@plt+0x5620>
  4075cc:	48 85 c0             	test   %rax,%rax
  4075cf:	74 70                	je     407641 <dlerror@plt+0x59b1>
  4075d1:	48 89 ea             	mov    %rbp,%rdx
  4075d4:	48 8d 35 c1 45 00 00 	lea    0x45c1(%rip),%rsi        # 40bb9c <dlerror@plt+0x9f0c>
  4075db:	4c 89 e7             	mov    %r12,%rdi
  4075de:	ff 93 98 00 00 00    	call   *0x98(%rbx)
  4075e4:	31 d2                	xor    %edx,%edx
  4075e6:	85 c0                	test   %eax,%eax
  4075e8:	78 26                	js     407610 <dlerror@plt+0x5980>
  4075ea:	48 8b 8c 24 18 10 00 	mov    0x1018(%rsp),%rcx
  4075f1:	00 
  4075f2:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  4075f9:	00 00 
  4075fb:	89 d0                	mov    %edx,%eax
  4075fd:	75 53                	jne    407652 <dlerror@plt+0x59c2>
  4075ff:	48 81 c4 20 10 00 00 	add    $0x1020,%rsp
  407606:	5b                   	pop    %rbx
  407607:	5d                   	pop    %rbp
  407608:	41 5c                	pop    %r12
  40760a:	c3                   	ret
  40760b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  407610:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
  407615:	4c 89 e7             	mov    %r12,%rdi
  407618:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  40761f:	00 00 
  407621:	ff 93 a8 00 00 00    	call   *0xa8(%rbx)
  407627:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  40762c:	48 8d 3d 25 47 00 00 	lea    0x4725(%rip),%rdi        # 40bd58 <dlerror@plt+0xa0c8>
  407633:	31 c0                	xor    %eax,%eax
  407635:	e8 b6 ce ff ff       	call   4044f0 <dlerror@plt+0x2860>
  40763a:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  40763f:	eb a9                	jmp    4075ea <dlerror@plt+0x595a>
  407641:	48 8d 3d d8 46 00 00 	lea    0x46d8(%rip),%rdi        # 40bd20 <dlerror@plt+0xa090>
  407648:	e8 a3 ce ff ff       	call   4044f0 <dlerror@plt+0x2860>
  40764d:	83 ca ff             	or     $0xffffffff,%edx
  407650:	eb 98                	jmp    4075ea <dlerror@plt+0x595a>
  407652:	e8 a9 a2 ff ff       	call   401900 <__stack_chk_fail@plt>
  407657:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40765e:	00 00 
  407660:	41 57                	push   %r15
  407662:	41 56                	push   %r14
  407664:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  407669:	41 55                	push   %r13
  40766b:	41 54                	push   %r12
  40766d:	55                   	push   %rbp
  40766e:	53                   	push   %rbx
  40766f:	48 81 ec 58 30 00 00 	sub    $0x3058,%rsp
  407676:	48 8b ae 40 30 00 00 	mov    0x3040(%rsi),%rbp
  40767d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  407684:	00 00 
  407686:	48 89 84 24 48 30 00 	mov    %rax,0x3048(%rsp)
  40768d:	00 
  40768e:	31 c0                	xor    %eax,%eax
  407690:	4c 8d 74 24 40       	lea    0x40(%rsp),%r14
  407695:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
  40769a:	48 8d be 3b 20 00 00 	lea    0x203b(%rsi),%rdi
  4076a1:	44 8b 6d 08          	mov    0x8(%rbp),%r13d
  4076a5:	48 8b 4d 18          	mov    0x18(%rbp),%rcx
  4076a9:	4c 8d 85 10 01 00 00 	lea    0x110(%rbp),%r8
  4076b0:	4c 89 f6             	mov    %r14,%rsi
  4076b3:	44 89 e8             	mov    %r13d,%eax
  4076b6:	f7 ea                	imul   %edx
  4076b8:	44 89 e8             	mov    %r13d,%eax
  4076bb:	c1 f8 1f             	sar    $0x1f,%eax
  4076be:	c1 fa 05             	sar    $0x5,%edx
  4076c1:	89 d3                	mov    %edx,%ebx
  4076c3:	ba 00 10 00 00       	mov    $0x1000,%edx
  4076c8:	29 c3                	sub    %eax,%ebx
  4076ca:	6b c3 64             	imul   $0x64,%ebx,%eax
  4076cd:	41 29 c5             	sub    %eax,%r13d
  4076d0:	e8 db fb ff ff       	call   4072b0 <dlerror@plt+0x5620>
  4076d5:	48 85 c0             	test   %rax,%rax
  4076d8:	0f 84 1f 01 00 00    	je     4077fd <dlerror@plt+0x5b6d>
  4076de:	4c 8d bc 24 40 10 00 	lea    0x1040(%rsp),%r15
  4076e5:	00 
  4076e6:	4c 8d 05 73 44 00 00 	lea    0x4473(%rip),%r8        # 40bb60 <dlerror@plt+0x9ed0>
  4076ed:	31 c0                	xor    %eax,%eax
  4076ef:	4d 89 f1             	mov    %r14,%r9
  4076f2:	b9 00 10 00 00       	mov    $0x1000,%ecx
  4076f7:	ba 01 00 00 00       	mov    $0x1,%edx
  4076fc:	be 00 10 00 00       	mov    $0x1000,%esi
  407701:	4c 89 ff             	mov    %r15,%rdi
  407704:	e8 97 a0 ff ff       	call   4017a0 <__snprintf_chk@plt>
  407709:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  40770e:	0f 8f d4 00 00 00    	jg     4077e8 <dlerror@plt+0x5b58>
  407714:	4c 8d a4 24 40 20 00 	lea    0x2040(%rsp),%r12
  40771b:	00 
  40771c:	4c 8d 05 51 44 00 00 	lea    0x4451(%rip),%r8        # 40bb74 <dlerror@plt+0x9ee4>
  407723:	41 55                	push   %r13
  407725:	53                   	push   %rbx
  407726:	b9 00 10 00 00       	mov    $0x1000,%ecx
  40772b:	ba 01 00 00 00       	mov    $0x1,%edx
  407730:	31 c0                	xor    %eax,%eax
  407732:	4d 89 f1             	mov    %r14,%r9
  407735:	be 00 10 00 00       	mov    $0x1000,%esi
  40773a:	4c 89 e7             	mov    %r12,%rdi
  40773d:	e8 5e a0 ff ff       	call   4017a0 <__snprintf_chk@plt>
  407742:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  407747:	5a                   	pop    %rdx
  407748:	59                   	pop    %rcx
  407749:	0f 8f c4 00 00 00    	jg     407813 <dlerror@plt+0x5b83>
  40774f:	ba 03 00 00 00       	mov    $0x3,%edx
  407754:	4c 89 7c 24 20       	mov    %r15,0x20(%rsp)
  407759:	4c 89 64 24 28       	mov    %r12,0x28(%rsp)
  40775e:	4c 89 74 24 30       	mov    %r14,0x30(%rsp)
  407763:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  407768:	48 8d 35 32 44 00 00 	lea    0x4432(%rip),%rsi        # 40bba1 <dlerror@plt+0x9f11>
  40776f:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  407774:	ff 95 a0 00 00 00    	call   *0xa0(%rbp)
  40777a:	31 d2                	xor    %edx,%edx
  40777c:	85 c0                	test   %eax,%eax
  40777e:	78 30                	js     4077b0 <dlerror@plt+0x5b20>
  407780:	48 8b 9c 24 48 30 00 	mov    0x3048(%rsp),%rbx
  407787:	00 
  407788:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  40778f:	00 00 
  407791:	89 d0                	mov    %edx,%eax
  407793:	0f 85 92 00 00 00    	jne    40782b <dlerror@plt+0x5b9b>
  407799:	48 81 c4 58 30 00 00 	add    $0x3058,%rsp
  4077a0:	5b                   	pop    %rbx
  4077a1:	5d                   	pop    %rbp
  4077a2:	41 5c                	pop    %r12
  4077a4:	41 5d                	pop    %r13
  4077a6:	41 5e                	pop    %r14
  4077a8:	41 5f                	pop    %r15
  4077aa:	c3                   	ret
  4077ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4077b0:	48 8d 74 24 18       	lea    0x18(%rsp),%rsi
  4077b5:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  4077ba:	48 c7 44 24 18 00 00 	movq   $0x0,0x18(%rsp)
  4077c1:	00 00 
  4077c3:	ff 95 a8 00 00 00    	call   *0xa8(%rbp)
  4077c9:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  4077ce:	48 8d 3d 7b 46 00 00 	lea    0x467b(%rip),%rdi        # 40be50 <dlerror@plt+0xa1c0>
  4077d5:	31 c0                	xor    %eax,%eax
  4077d7:	e8 14 cd ff ff       	call   4044f0 <dlerror@plt+0x2860>
  4077dc:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  4077e1:	eb 9d                	jmp    407780 <dlerror@plt+0x5af0>
  4077e3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4077e8:	48 8d 3d d1 45 00 00 	lea    0x45d1(%rip),%rdi        # 40bdc0 <dlerror@plt+0xa130>
  4077ef:	31 c0                	xor    %eax,%eax
  4077f1:	e8 fa cc ff ff       	call   4044f0 <dlerror@plt+0x2860>
  4077f6:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  4077fb:	eb 83                	jmp    407780 <dlerror@plt+0x5af0>
  4077fd:	48 8d 3d 7c 45 00 00 	lea    0x457c(%rip),%rdi        # 40bd80 <dlerror@plt+0xa0f0>
  407804:	e8 e7 cc ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407809:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  40780e:	e9 6d ff ff ff       	jmp    407780 <dlerror@plt+0x5af0>
  407813:	48 8d 3d ee 45 00 00 	lea    0x45ee(%rip),%rdi        # 40be08 <dlerror@plt+0xa178>
  40781a:	31 c0                	xor    %eax,%eax
  40781c:	e8 cf cc ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407821:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  407826:	e9 55 ff ff ff       	jmp    407780 <dlerror@plt+0x5af0>
  40782b:	e8 d0 a0 ff ff       	call   401900 <__stack_chk_fail@plt>
  407830:	41 57                	push   %r15
  407832:	41 56                	push   %r14
  407834:	41 55                	push   %r13
  407836:	41 54                	push   %r12
  407838:	55                   	push   %rbp
  407839:	53                   	push   %rbx
  40783a:	48 83 ec 38          	sub    $0x38,%rsp
  40783e:	4c 8b 7e 18          	mov    0x18(%rsi),%r15
  407842:	4c 8b a6 40 30 00 00 	mov    0x3040(%rsi),%r12
  407849:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  407850:	00 00 
  407852:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  407857:	31 c0                	xor    %eax,%eax
  407859:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
  40785e:	4d 85 ff             	test   %r15,%r15
  407861:	0f 84 29 01 00 00    	je     407990 <dlerror@plt+0x5d00>
  407867:	8b 6e 10             	mov    0x10(%rsi),%ebp
  40786a:	48 63 c5             	movslq %ebp,%rax
  40786d:	be 08 00 00 00       	mov    $0x8,%esi
  407872:	48 89 c7             	mov    %rax,%rdi
  407875:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  40787a:	e8 41 a1 ff ff       	call   4019c0 <calloc@plt>
  40787f:	48 85 c0             	test   %rax,%rax
  407882:	48 89 c3             	mov    %rax,%rbx
  407885:	0f 84 3d 01 00 00    	je     4079c8 <dlerror@plt+0x5d38>
  40788b:	85 ed                	test   %ebp,%ebp
  40788d:	0f 8e 0d 01 00 00    	jle    4079a0 <dlerror@plt+0x5d10>
  407893:	49 89 c6             	mov    %rax,%r14
  407896:	8d 45 ff             	lea    -0x1(%rbp),%eax
  407899:	4d 8d ac 24 10 01 00 	lea    0x110(%r12),%r13
  4078a0:	00 
  4078a1:	49 8d 44 c7 08       	lea    0x8(%r15,%rax,8),%rax
  4078a6:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4078ab:	eb 12                	jmp    4078bf <dlerror@plt+0x5c2f>
  4078ad:	0f 1f 00             	nopl   (%rax)
  4078b0:	49 83 c7 08          	add    $0x8,%r15
  4078b4:	49 83 c6 08          	add    $0x8,%r14
  4078b8:	4c 3b 7c 24 08       	cmp    0x8(%rsp),%r15
  4078bd:	74 71                	je     407930 <dlerror@plt+0x5ca0>
  4078bf:	49 8b 4c 24 18       	mov    0x18(%r12),%rcx
  4078c4:	49 8b 3f             	mov    (%r15),%rdi
  4078c7:	31 d2                	xor    %edx,%edx
  4078c9:	31 f6                	xor    %esi,%esi
  4078cb:	4d 89 e8             	mov    %r13,%r8
  4078ce:	e8 dd f9 ff ff       	call   4072b0 <dlerror@plt+0x5620>
  4078d3:	48 85 c0             	test   %rax,%rax
  4078d6:	49 89 06             	mov    %rax,(%r14)
  4078d9:	75 d5                	jne    4078b0 <dlerror@plt+0x5c20>
  4078db:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  4078e1:	45 31 e4             	xor    %r12d,%r12d
  4078e4:	0f 1f 40 00          	nopl   0x0(%rax)
  4078e8:	4a 8b 3c e3          	mov    (%rbx,%r12,8),%rdi
  4078ec:	49 83 c4 01          	add    $0x1,%r12
  4078f0:	e8 cb 9e ff ff       	call   4017c0 <free@plt>
  4078f5:	44 39 e5             	cmp    %r12d,%ebp
  4078f8:	7f ee                	jg     4078e8 <dlerror@plt+0x5c58>
  4078fa:	48 89 df             	mov    %rbx,%rdi
  4078fd:	e8 be 9e ff ff       	call   4017c0 <free@plt>
  407902:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  407907:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  40790e:	00 00 
  407910:	44 89 e8             	mov    %r13d,%eax
  407913:	0f 85 ba 00 00 00    	jne    4079d3 <dlerror@plt+0x5d43>
  407919:	48 83 c4 38          	add    $0x38,%rsp
  40791d:	5b                   	pop    %rbx
  40791e:	5d                   	pop    %rbp
  40791f:	41 5c                	pop    %r12
  407921:	41 5d                	pop    %r13
  407923:	41 5e                	pop    %r14
  407925:	41 5f                	pop    %r15
  407927:	c3                   	ret
  407928:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40792f:	00 
  407930:	48 89 d9             	mov    %rbx,%rcx
  407933:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
  407938:	48 8d 35 76 42 00 00 	lea    0x4276(%rip),%rsi        # 40bbb5 <dlerror@plt+0x9f25>
  40793f:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  407944:	45 31 ed             	xor    %r13d,%r13d
  407947:	41 ff 94 24 a0 00 00 	call   *0xa0(%r12)
  40794e:	00 
  40794f:	85 c0                	test   %eax,%eax
  407951:	79 8e                	jns    4078e1 <dlerror@plt+0x5c51>
  407953:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
  407958:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  40795d:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
  407964:	00 00 
  407966:	41 ff 94 24 a8 00 00 	call   *0xa8(%r12)
  40796d:	00 
  40796e:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
  407973:	48 8d 3d 40 42 00 00 	lea    0x4240(%rip),%rdi        # 40bbba <dlerror@plt+0x9f2a>
  40797a:	31 c0                	xor    %eax,%eax
  40797c:	e8 6f cb ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407981:	e9 55 ff ff ff       	jmp    4078db <dlerror@plt+0x5c4b>
  407986:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40798d:	00 00 00 
  407990:	8b 2e                	mov    (%rsi),%ebp
  407992:	4c 8b 7e 08          	mov    0x8(%rsi),%r15
  407996:	e9 cf fe ff ff       	jmp    40786a <dlerror@plt+0x5bda>
  40799b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4079a0:	48 89 c1             	mov    %rax,%rcx
  4079a3:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
  4079a8:	48 8d 35 06 42 00 00 	lea    0x4206(%rip),%rsi        # 40bbb5 <dlerror@plt+0x9f25>
  4079af:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  4079b4:	41 ff 94 24 a0 00 00 	call   *0xa0(%r12)
  4079bb:	00 
  4079bc:	85 c0                	test   %eax,%eax
  4079be:	78 18                	js     4079d8 <dlerror@plt+0x5d48>
  4079c0:	45 31 ed             	xor    %r13d,%r13d
  4079c3:	e9 32 ff ff ff       	jmp    4078fa <dlerror@plt+0x5c6a>
  4079c8:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  4079ce:	e9 2f ff ff ff       	jmp    407902 <dlerror@plt+0x5c72>
  4079d3:	e8 28 9f ff ff       	call   401900 <__stack_chk_fail@plt>
  4079d8:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
  4079dd:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  4079e2:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
  4079e9:	00 00 
  4079eb:	41 ff 94 24 a8 00 00 	call   *0xa8(%r12)
  4079f2:	00 
  4079f3:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
  4079f8:	48 8d 3d bb 41 00 00 	lea    0x41bb(%rip),%rdi        # 40bbba <dlerror@plt+0x9f2a>
  4079ff:	31 c0                	xor    %eax,%eax
  407a01:	41 83 cd ff          	or     $0xffffffff,%r13d
  407a05:	e8 e6 ca ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407a0a:	e9 eb fe ff ff       	jmp    4078fa <dlerror@plt+0x5c6a>
  407a0f:	90                   	nop
  407a10:	41 54                	push   %r12
  407a12:	55                   	push   %rbp
  407a13:	49 89 d4             	mov    %rdx,%r12
  407a16:	53                   	push   %rbx
  407a17:	31 d2                	xor    %edx,%edx
  407a19:	48 89 fd             	mov    %rdi,%rbp
  407a1c:	48 83 ec 10          	sub    $0x10,%rsp
  407a20:	48 8b 9e 40 30 00 00 	mov    0x3040(%rsi),%rbx
  407a27:	48 8d 35 a8 41 00 00 	lea    0x41a8(%rip),%rsi        # 40bbd6 <dlerror@plt+0x9f46>
  407a2e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  407a35:	00 00 
  407a37:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  407a3c:	31 c0                	xor    %eax,%eax
  407a3e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  407a45:	00 
  407a46:	ff 93 90 00 00 00    	call   *0x90(%rbx)
  407a4c:	85 c0                	test   %eax,%eax
  407a4e:	0f 88 94 01 00 00    	js     407be8 <dlerror@plt+0x5f58>
  407a54:	31 d2                	xor    %edx,%edx
  407a56:	48 8d 35 85 41 00 00 	lea    0x4185(%rip),%rsi        # 40bbe2 <dlerror@plt+0x9f52>
  407a5d:	48 89 ef             	mov    %rbp,%rdi
  407a60:	ff 93 90 00 00 00    	call   *0x90(%rbx)
  407a66:	85 c0                	test   %eax,%eax
  407a68:	0f 88 a2 01 00 00    	js     407c10 <dlerror@plt+0x5f80>
  407a6e:	31 d2                	xor    %edx,%edx
  407a70:	48 8d 35 7a 41 00 00 	lea    0x417a(%rip),%rsi        # 40bbf1 <dlerror@plt+0x9f61>
  407a77:	48 89 ef             	mov    %rbp,%rdi
  407a7a:	ff 93 90 00 00 00    	call   *0x90(%rbx)
  407a80:	85 c0                	test   %eax,%eax
  407a82:	0f 88 b8 01 00 00    	js     407c40 <dlerror@plt+0x5fb0>
  407a88:	49 63 54 24 08       	movslq 0x8(%r12),%rdx
  407a8d:	48 8d 35 6f 41 00 00 	lea    0x416f(%rip),%rsi        # 40bc03 <dlerror@plt+0x9f73>
  407a94:	48 89 ef             	mov    %rbp,%rdi
  407a97:	ff 93 90 00 00 00    	call   *0x90(%rbx)
  407a9d:	85 c0                	test   %eax,%eax
  407a9f:	0f 88 cb 01 00 00    	js     407c70 <dlerror@plt+0x5fe0>
  407aa5:	41 8b 44 24 04       	mov    0x4(%r12),%eax
  407aaa:	31 d2                	xor    %edx,%edx
  407aac:	48 8d 35 63 41 00 00 	lea    0x4163(%rip),%rsi        # 40bc16 <dlerror@plt+0x9f86>
  407ab3:	48 89 ef             	mov    %rbp,%rdi
  407ab6:	85 c0                	test   %eax,%eax
  407ab8:	0f 94 c2             	sete   %dl
  407abb:	ff 93 90 00 00 00    	call   *0x90(%rbx)
  407ac1:	85 c0                	test   %eax,%eax
  407ac3:	0f 88 d7 01 00 00    	js     407ca0 <dlerror@plt+0x6010>
  407ac9:	49 63 14 24          	movslq (%r12),%rdx
  407acd:	48 8d 35 0e 3f 00 00 	lea    0x3f0e(%rip),%rsi        # 40b9e2 <dlerror@plt+0x9d52>
  407ad4:	48 89 ef             	mov    %rbp,%rdi
  407ad7:	ff 93 90 00 00 00    	call   *0x90(%rbx)
  407add:	85 c0                	test   %eax,%eax
  407adf:	0f 88 eb 01 00 00    	js     407cd0 <dlerror@plt+0x6040>
  407ae5:	49 63 54 24 0c       	movslq 0xc(%r12),%rdx
  407aea:	48 8d 35 51 41 00 00 	lea    0x4151(%rip),%rsi        # 40bc42 <dlerror@plt+0x9fb2>
  407af1:	48 89 ef             	mov    %rbp,%rdi
  407af4:	ff 93 90 00 00 00    	call   *0x90(%rbx)
  407afa:	85 c0                	test   %eax,%eax
  407afc:	0f 88 fe 01 00 00    	js     407d00 <dlerror@plt+0x6070>
  407b02:	49 8b 54 24 10       	mov    0x10(%r12),%rdx
  407b07:	48 8d 35 38 41 00 00 	lea    0x4138(%rip),%rsi        # 40bc46 <dlerror@plt+0x9fb6>
  407b0e:	48 89 ef             	mov    %rbp,%rdi
  407b11:	ff 93 90 00 00 00    	call   *0x90(%rbx)
  407b17:	85 c0                	test   %eax,%eax
  407b19:	0f 88 11 02 00 00    	js     407d30 <dlerror@plt+0x60a0>
  407b1f:	49 63 54 24 1c       	movslq 0x1c(%r12),%rdx
  407b24:	48 8d 35 25 41 00 00 	lea    0x4125(%rip),%rsi        # 40bc50 <dlerror@plt+0x9fc0>
  407b2b:	48 89 ef             	mov    %rbp,%rdi
  407b2e:	ff 93 90 00 00 00    	call   *0x90(%rbx)
  407b34:	85 c0                	test   %eax,%eax
  407b36:	0f 88 24 02 00 00    	js     407d60 <dlerror@plt+0x60d0>
  407b3c:	ba 01 00 00 00       	mov    $0x1,%edx
  407b41:	48 8d 35 2f 41 00 00 	lea    0x412f(%rip),%rsi        # 40bc77 <dlerror@plt+0x9fe7>
  407b48:	48 89 ef             	mov    %rbp,%rdi
  407b4b:	ff 93 90 00 00 00    	call   *0x90(%rbx)
  407b51:	85 c0                	test   %eax,%eax
  407b53:	0f 88 37 02 00 00    	js     407d90 <dlerror@plt+0x6100>
  407b59:	49 63 54 24 20       	movslq 0x20(%r12),%rdx
  407b5e:	49 8b 4c 24 28       	mov    0x28(%r12),%rcx
  407b63:	48 8d 35 25 41 00 00 	lea    0x4125(%rip),%rsi        # 40bc8f <dlerror@plt+0x9fff>
  407b6a:	48 89 ef             	mov    %rbp,%rdi
  407b6d:	ff 93 a0 00 00 00    	call   *0xa0(%rbx)
  407b73:	85 c0                	test   %eax,%eax
  407b75:	0f 88 45 02 00 00    	js     407dc0 <dlerror@plt+0x6130>
  407b7b:	49 63 54 24 38       	movslq 0x38(%r12),%rdx
  407b80:	49 8b 4c 24 40       	mov    0x40(%r12),%rcx
  407b85:	48 8d 35 0f 41 00 00 	lea    0x410f(%rip),%rsi        # 40bc9b <dlerror@plt+0xa00b>
  407b8c:	48 89 ef             	mov    %rbp,%rdi
  407b8f:	ff 93 a0 00 00 00    	call   *0xa0(%rbx)
  407b95:	31 d2                	xor    %edx,%edx
  407b97:	85 c0                	test   %eax,%eax
  407b99:	78 25                	js     407bc0 <dlerror@plt+0x5f30>
  407b9b:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  407ba0:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  407ba7:	00 00 
  407ba9:	89 d0                	mov    %edx,%eax
  407bab:	0f 85 37 02 00 00    	jne    407de8 <dlerror@plt+0x6158>
  407bb1:	48 83 c4 10          	add    $0x10,%rsp
  407bb5:	5b                   	pop    %rbx
  407bb6:	5d                   	pop    %rbp
  407bb7:	41 5c                	pop    %r12
  407bb9:	c3                   	ret
  407bba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  407bc0:	48 89 e6             	mov    %rsp,%rsi
  407bc3:	48 89 ef             	mov    %rbp,%rdi
  407bc6:	ff 93 a8 00 00 00    	call   *0xa8(%rbx)
  407bcc:	48 8b 34 24          	mov    (%rsp),%rsi
  407bd0:	48 8d 3d cd 40 00 00 	lea    0x40cd(%rip),%rdi        # 40bca4 <dlerror@plt+0xa014>
  407bd7:	31 c0                	xor    %eax,%eax
  407bd9:	e8 12 c9 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407bde:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  407be3:	eb b6                	jmp    407b9b <dlerror@plt+0x5f0b>
  407be5:	0f 1f 00             	nopl   (%rax)
  407be8:	48 89 e6             	mov    %rsp,%rsi
  407beb:	48 89 ef             	mov    %rbp,%rdi
  407bee:	ff 93 a8 00 00 00    	call   *0xa8(%rbx)
  407bf4:	48 8b 34 24          	mov    (%rsp),%rsi
  407bf8:	48 8d 3d 79 42 00 00 	lea    0x4279(%rip),%rdi        # 40be78 <dlerror@plt+0xa1e8>
  407bff:	31 c0                	xor    %eax,%eax
  407c01:	e8 ea c8 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407c06:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  407c0b:	eb 8e                	jmp    407b9b <dlerror@plt+0x5f0b>
  407c0d:	0f 1f 00             	nopl   (%rax)
  407c10:	48 89 e6             	mov    %rsp,%rsi
  407c13:	48 89 ef             	mov    %rbp,%rdi
  407c16:	ff 93 a8 00 00 00    	call   *0xa8(%rbx)
  407c1c:	48 8b 34 24          	mov    (%rsp),%rsi
  407c20:	48 8d 3d 79 42 00 00 	lea    0x4279(%rip),%rdi        # 40bea0 <dlerror@plt+0xa210>
  407c27:	31 c0                	xor    %eax,%eax
  407c29:	e8 c2 c8 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407c2e:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  407c33:	e9 63 ff ff ff       	jmp    407b9b <dlerror@plt+0x5f0b>
  407c38:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  407c3f:	00 
  407c40:	48 89 e6             	mov    %rsp,%rsi
  407c43:	48 89 ef             	mov    %rbp,%rdi
  407c46:	ff 93 a8 00 00 00    	call   *0xa8(%rbx)
  407c4c:	48 8b 34 24          	mov    (%rsp),%rsi
  407c50:	48 8d 3d 71 42 00 00 	lea    0x4271(%rip),%rdi        # 40bec8 <dlerror@plt+0xa238>
  407c57:	31 c0                	xor    %eax,%eax
  407c59:	e8 92 c8 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407c5e:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  407c63:	e9 33 ff ff ff       	jmp    407b9b <dlerror@plt+0x5f0b>
  407c68:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  407c6f:	00 
  407c70:	48 89 e6             	mov    %rsp,%rsi
  407c73:	48 89 ef             	mov    %rbp,%rdi
  407c76:	ff 93 a8 00 00 00    	call   *0xa8(%rbx)
  407c7c:	48 8b 34 24          	mov    (%rsp),%rsi
  407c80:	48 8d 3d 69 42 00 00 	lea    0x4269(%rip),%rdi        # 40bef0 <dlerror@plt+0xa260>
  407c87:	31 c0                	xor    %eax,%eax
  407c89:	e8 62 c8 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407c8e:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  407c93:	e9 03 ff ff ff       	jmp    407b9b <dlerror@plt+0x5f0b>
  407c98:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  407c9f:	00 
  407ca0:	48 89 e6             	mov    %rsp,%rsi
  407ca3:	48 89 ef             	mov    %rbp,%rdi
  407ca6:	ff 93 a8 00 00 00    	call   *0xa8(%rbx)
  407cac:	48 8b 34 24          	mov    (%rsp),%rsi
  407cb0:	48 8d 3d 61 42 00 00 	lea    0x4261(%rip),%rdi        # 40bf18 <dlerror@plt+0xa288>
  407cb7:	31 c0                	xor    %eax,%eax
  407cb9:	e8 32 c8 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407cbe:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  407cc3:	e9 d3 fe ff ff       	jmp    407b9b <dlerror@plt+0x5f0b>
  407cc8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  407ccf:	00 
  407cd0:	48 89 e6             	mov    %rsp,%rsi
  407cd3:	48 89 ef             	mov    %rbp,%rdi
  407cd6:	ff 93 a8 00 00 00    	call   *0xa8(%rbx)
  407cdc:	48 8b 34 24          	mov    (%rsp),%rsi
  407ce0:	48 8d 3d 3e 3f 00 00 	lea    0x3f3e(%rip),%rdi        # 40bc25 <dlerror@plt+0x9f95>
  407ce7:	31 c0                	xor    %eax,%eax
  407ce9:	e8 02 c8 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407cee:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  407cf3:	e9 a3 fe ff ff       	jmp    407b9b <dlerror@plt+0x5f0b>
  407cf8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  407cff:	00 
  407d00:	48 89 e6             	mov    %rsp,%rsi
  407d03:	48 89 ef             	mov    %rbp,%rdi
  407d06:	ff 93 a8 00 00 00    	call   *0xa8(%rbx)
  407d0c:	48 8b 34 24          	mov    (%rsp),%rsi
  407d10:	48 8d 3d 29 42 00 00 	lea    0x4229(%rip),%rdi        # 40bf40 <dlerror@plt+0xa2b0>
  407d17:	31 c0                	xor    %eax,%eax
  407d19:	e8 d2 c7 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407d1e:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  407d23:	e9 73 fe ff ff       	jmp    407b9b <dlerror@plt+0x5f0b>
  407d28:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  407d2f:	00 
  407d30:	48 89 e6             	mov    %rsp,%rsi
  407d33:	48 89 ef             	mov    %rbp,%rdi
  407d36:	ff 93 a8 00 00 00    	call   *0xa8(%rbx)
  407d3c:	48 8b 34 24          	mov    (%rsp),%rsi
  407d40:	48 8d 3d 21 42 00 00 	lea    0x4221(%rip),%rdi        # 40bf68 <dlerror@plt+0xa2d8>
  407d47:	31 c0                	xor    %eax,%eax
  407d49:	e8 a2 c7 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407d4e:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  407d53:	e9 43 fe ff ff       	jmp    407b9b <dlerror@plt+0x5f0b>
  407d58:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  407d5f:	00 
  407d60:	48 89 e6             	mov    %rsp,%rsi
  407d63:	48 89 ef             	mov    %rbp,%rdi
  407d66:	ff 93 a8 00 00 00    	call   *0xa8(%rbx)
  407d6c:	48 8b 34 24          	mov    (%rsp),%rsi
  407d70:	48 8d 3d e2 3e 00 00 	lea    0x3ee2(%rip),%rdi        # 40bc59 <dlerror@plt+0x9fc9>
  407d77:	31 c0                	xor    %eax,%eax
  407d79:	e8 72 c7 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407d7e:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  407d83:	e9 13 fe ff ff       	jmp    407b9b <dlerror@plt+0x5f0b>
  407d88:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  407d8f:	00 
  407d90:	48 89 e6             	mov    %rsp,%rsi
  407d93:	48 89 ef             	mov    %rbp,%rdi
  407d96:	ff 93 a8 00 00 00    	call   *0xa8(%rbx)
  407d9c:	48 8b 34 24          	mov    (%rsp),%rsi
  407da0:	48 8d 3d e1 41 00 00 	lea    0x41e1(%rip),%rdi        # 40bf88 <dlerror@plt+0xa2f8>
  407da7:	31 c0                	xor    %eax,%eax
  407da9:	e8 42 c7 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407dae:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  407db3:	e9 e3 fd ff ff       	jmp    407b9b <dlerror@plt+0x5f0b>
  407db8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  407dbf:	00 
  407dc0:	48 89 e6             	mov    %rsp,%rsi
  407dc3:	48 89 ef             	mov    %rbp,%rdi
  407dc6:	ff 93 a8 00 00 00    	call   *0xa8(%rbx)
  407dcc:	48 8b 34 24          	mov    (%rsp),%rsi
  407dd0:	48 8d 3d e1 41 00 00 	lea    0x41e1(%rip),%rdi        # 40bfb8 <dlerror@plt+0xa328>
  407dd7:	31 c0                	xor    %eax,%eax
  407dd9:	e8 12 c7 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407dde:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  407de3:	e9 b3 fd ff ff       	jmp    407b9b <dlerror@plt+0x5f0b>
  407de8:	e8 13 9b ff ff       	call   401900 <__stack_chk_fail@plt>
  407ded:	0f 1f 00             	nopl   (%rax)
  407df0:	41 57                	push   %r15
  407df2:	41 56                	push   %r14
  407df4:	41 55                	push   %r13
  407df6:	41 54                	push   %r12
  407df8:	55                   	push   %rbp
  407df9:	53                   	push   %rbx
  407dfa:	48 89 fb             	mov    %rdi,%rbx
  407dfd:	48 83 ec 38          	sub    $0x38,%rsp
  407e01:	4c 8b a7 40 30 00 00 	mov    0x3040(%rdi),%r12
  407e08:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  407e0f:	00 00 
  407e11:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  407e16:	31 c0                	xor    %eax,%eax
  407e18:	e8 73 e4 ff ff       	call   406290 <dlerror@plt+0x4600>
  407e1d:	48 85 c0             	test   %rax,%rax
  407e20:	49 89 c5             	mov    %rax,%r13
  407e23:	0f 84 d3 02 00 00    	je     4080fc <dlerror@plt+0x646c>
  407e29:	48 89 de             	mov    %rbx,%rsi
  407e2c:	48 89 c7             	mov    %rax,%rdi
  407e2f:	e8 dc e8 ff ff       	call   406710 <dlerror@plt+0x4a80>
  407e34:	85 c0                	test   %eax,%eax
  407e36:	0f 88 fa 02 00 00    	js     408136 <dlerror@plt+0x64a6>
  407e3c:	41 80 7c 24 0c 00    	cmpb   $0x0,0xc(%r12)
  407e42:	0f 84 b8 01 00 00    	je     408000 <dlerror@plt+0x6370>
  407e48:	41 ff 94 24 80 00 00 	call   *0x80(%r12)
  407e4f:	00 
  407e50:	48 85 c0             	test   %rax,%rax
  407e53:	48 89 c5             	mov    %rax,%rbp
  407e56:	0f 84 be 02 00 00    	je     40811a <dlerror@plt+0x648a>
  407e5c:	48 89 de             	mov    %rbx,%rsi
  407e5f:	48 89 c7             	mov    %rax,%rdi
  407e62:	e8 39 f6 ff ff       	call   4074a0 <dlerror@plt+0x5810>
  407e67:	85 c0                	test   %eax,%eax
  407e69:	0f 88 19 02 00 00    	js     408088 <dlerror@plt+0x63f8>
  407e6f:	48 89 de             	mov    %rbx,%rsi
  407e72:	48 89 ef             	mov    %rbp,%rdi
  407e75:	e8 06 f7 ff ff       	call   407580 <dlerror@plt+0x58f0>
  407e7a:	85 c0                	test   %eax,%eax
  407e7c:	0f 88 26 02 00 00    	js     4080a8 <dlerror@plt+0x6418>
  407e82:	48 89 de             	mov    %rbx,%rsi
  407e85:	48 89 ef             	mov    %rbp,%rdi
  407e88:	e8 d3 f7 ff ff       	call   407660 <dlerror@plt+0x59d0>
  407e8d:	85 c0                	test   %eax,%eax
  407e8f:	0f 88 2f 02 00 00    	js     4080c4 <dlerror@plt+0x6434>
  407e95:	48 89 de             	mov    %rbx,%rsi
  407e98:	48 89 ef             	mov    %rbp,%rdi
  407e9b:	e8 90 f9 ff ff       	call   407830 <dlerror@plt+0x5ba0>
  407ea0:	85 c0                	test   %eax,%eax
  407ea2:	0f 88 38 02 00 00    	js     4080e0 <dlerror@plt+0x6450>
  407ea8:	4c 89 ea             	mov    %r13,%rdx
  407eab:	48 89 de             	mov    %rbx,%rsi
  407eae:	48 89 ef             	mov    %rbp,%rdi
  407eb1:	e8 5a fb ff ff       	call   407a10 <dlerror@plt+0x5d80>
  407eb6:	85 c0                	test   %eax,%eax
  407eb8:	0f 88 81 02 00 00    	js     40813f <dlerror@plt+0x64af>
  407ebe:	45 31 ff             	xor    %r15d,%r15d
  407ec1:	41 8b 45 04          	mov    0x4(%r13),%eax
  407ec5:	85 c0                	test   %eax,%eax
  407ec7:	0f 85 cb 00 00 00    	jne    407f98 <dlerror@plt+0x6308>
  407ecd:	41 80 7c 24 0c 00    	cmpb   $0x0,0xc(%r12)
  407ed3:	75 7b                	jne    407f50 <dlerror@plt+0x62c0>
  407ed5:	48 89 e7             	mov    %rsp,%rdi
  407ed8:	4c 89 fe             	mov    %r15,%rsi
  407edb:	41 ff 54 24 30       	call   *0x30(%r12)
  407ee0:	ff 74 24 18          	push   0x18(%rsp)
  407ee4:	ff 74 24 18          	push   0x18(%rsp)
  407ee8:	ff 74 24 18          	push   0x18(%rsp)
  407eec:	ff 74 24 18          	push   0x18(%rsp)
  407ef0:	41 ff 94 24 58 01 00 	call   *0x158(%r12)
  407ef7:	00 
  407ef8:	48 83 c4 20          	add    $0x20,%rsp
  407efc:	85 c0                	test   %eax,%eax
  407efe:	41 89 c6             	mov    %eax,%r14d
  407f01:	0f 85 b1 00 00 00    	jne    407fb8 <dlerror@plt+0x6328>
  407f07:	41 80 7c 24 0c 00    	cmpb   $0x0,0xc(%r12)
  407f0d:	0f 84 dd 00 00 00    	je     407ff0 <dlerror@plt+0x6360>
  407f13:	48 89 ef             	mov    %rbp,%rdi
  407f16:	41 ff 94 24 88 00 00 	call   *0x88(%r12)
  407f1d:	00 
  407f1e:	4c 89 ef             	mov    %r13,%rdi
  407f21:	e8 1a e2 ff ff       	call   406140 <dlerror@plt+0x44b0>
  407f26:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  407f2b:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  407f32:	00 00 
  407f34:	44 89 f0             	mov    %r14d,%eax
  407f37:	0f 85 82 02 00 00    	jne    4081bf <dlerror@plt+0x652f>
  407f3d:	48 83 c4 38          	add    $0x38,%rsp
  407f41:	5b                   	pop    %rbx
  407f42:	5d                   	pop    %rbp
  407f43:	41 5c                	pop    %r12
  407f45:	41 5d                	pop    %r13
  407f47:	41 5e                	pop    %r14
  407f49:	41 5f                	pop    %r15
  407f4b:	c3                   	ret
  407f4c:	0f 1f 40 00          	nopl   0x0(%rax)
  407f50:	48 89 ef             	mov    %rbp,%rdi
  407f53:	41 ff 54 24 38       	call   *0x38(%r12)
  407f58:	85 c0                	test   %eax,%eax
  407f5a:	41 89 c6             	mov    %eax,%r14d
  407f5d:	79 a8                	jns    407f07 <dlerror@plt+0x6277>
  407f5f:	48 89 e6             	mov    %rsp,%rsi
  407f62:	48 89 ef             	mov    %rbp,%rdi
  407f65:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  407f6c:	00 
  407f6d:	41 ff 94 24 a8 00 00 	call   *0xa8(%r12)
  407f74:	00 
  407f75:	48 8b 34 24          	mov    (%rsp),%rsi
  407f79:	48 8d 3d b0 41 00 00 	lea    0x41b0(%rip),%rdi        # 40c130 <dlerror@plt+0xa4a0>
  407f80:	31 c0                	xor    %eax,%eax
  407f82:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  407f88:	e8 63 c5 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407f8d:	e9 75 ff ff ff       	jmp    407f07 <dlerror@plt+0x6277>
  407f92:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  407f98:	48 8b 3d 21 73 20 00 	mov    0x207321(%rip),%rdi        # 60f2c0 <stdout@GLIBC_2.2.5>
  407f9f:	e8 3c 9b ff ff       	call   401ae0 <fflush@plt>
  407fa4:	48 8b 3d 35 73 20 00 	mov    0x207335(%rip),%rdi        # 60f2e0 <stderr@GLIBC_2.2.5>
  407fab:	e8 30 9b ff ff       	call   401ae0 <fflush@plt>
  407fb0:	e9 18 ff ff ff       	jmp    407ecd <dlerror@plt+0x623d>
  407fb5:	0f 1f 00             	nopl   (%rax)
  407fb8:	48 8d 3d a9 41 00 00 	lea    0x41a9(%rip),%rdi        # 40c168 <dlerror@plt+0xa4d8>
  407fbf:	31 c0                	xor    %eax,%eax
  407fc1:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  407fc7:	e8 24 c5 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  407fcc:	ff 74 24 18          	push   0x18(%rsp)
  407fd0:	ff 74 24 18          	push   0x18(%rsp)
  407fd4:	ff 74 24 18          	push   0x18(%rsp)
  407fd8:	ff 74 24 18          	push   0x18(%rsp)
  407fdc:	41 ff 54 24 20       	call   *0x20(%r12)
  407fe1:	48 83 c4 20          	add    $0x20,%rsp
  407fe5:	e9 1d ff ff ff       	jmp    407f07 <dlerror@plt+0x6277>
  407fea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  407ff0:	48 89 de             	mov    %rbx,%rsi
  407ff3:	4c 89 ff             	mov    %r15,%rdi
  407ff6:	e8 45 e8 ff ff       	call   406840 <dlerror@plt+0x4bb0>
  407ffb:	e9 1e ff ff ff       	jmp    407f1e <dlerror@plt+0x628e>
  408000:	48 89 df             	mov    %rbx,%rdi
  408003:	e8 a8 e7 ff ff       	call   4067b0 <dlerror@plt+0x4b20>
  408008:	48 85 c0             	test   %rax,%rax
  40800b:	49 89 c7             	mov    %rax,%r15
  40800e:	0f 84 c9 01 00 00    	je     4081dd <dlerror@plt+0x654d>
  408014:	48 89 c7             	mov    %rax,%rdi
  408017:	41 ff 54 24 58       	call   *0x58(%r12)
  40801c:	48 89 de             	mov    %rbx,%rsi
  40801f:	4c 89 ff             	mov    %r15,%rdi
  408022:	e8 49 e8 ff ff       	call   406870 <dlerror@plt+0x4be0>
  408027:	85 c0                	test   %eax,%eax
  408029:	0f 88 77 01 00 00    	js     4081a6 <dlerror@plt+0x6516>
  40802f:	48 89 de             	mov    %rbx,%rsi
  408032:	4c 89 ff             	mov    %r15,%rdi
  408035:	e8 36 e9 ff ff       	call   406970 <dlerror@plt+0x4ce0>
  40803a:	85 c0                	test   %eax,%eax
  40803c:	0f 88 4b 01 00 00    	js     40818d <dlerror@plt+0x64fd>
  408042:	48 89 de             	mov    %rbx,%rsi
  408045:	4c 89 ff             	mov    %r15,%rdi
  408048:	e8 43 ea ff ff       	call   406a90 <dlerror@plt+0x4e00>
  40804d:	85 c0                	test   %eax,%eax
  40804f:	0f 88 1f 01 00 00    	js     408174 <dlerror@plt+0x64e4>
  408055:	48 89 de             	mov    %rbx,%rsi
  408058:	4c 89 ff             	mov    %r15,%rdi
  40805b:	e8 00 ed ff ff       	call   406d60 <dlerror@plt+0x50d0>
  408060:	85 c0                	test   %eax,%eax
  408062:	0f 88 f3 00 00 00    	js     40815b <dlerror@plt+0x64cb>
  408068:	4c 89 ea             	mov    %r13,%rdx
  40806b:	48 89 de             	mov    %rbx,%rsi
  40806e:	4c 89 ff             	mov    %r15,%rdi
  408071:	e8 1a ef ff ff       	call   406f90 <dlerror@plt+0x5300>
  408076:	85 c0                	test   %eax,%eax
  408078:	0f 88 46 01 00 00    	js     4081c4 <dlerror@plt+0x6534>
  40807e:	31 ed                	xor    %ebp,%ebp
  408080:	e9 3c fe ff ff       	jmp    407ec1 <dlerror@plt+0x6231>
  408085:	0f 1f 00             	nopl   (%rax)
  408088:	48 8d 3d 22 43 00 00 	lea    0x4322(%rip),%rdi        # 40c3b1 <dlerror@plt+0xa721>
  40808f:	31 c0                	xor    %eax,%eax
  408091:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  408097:	45 31 ff             	xor    %r15d,%r15d
  40809a:	e8 51 c4 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  40809f:	e9 63 fe ff ff       	jmp    407f07 <dlerror@plt+0x6277>
  4080a4:	0f 1f 40 00          	nopl   0x0(%rax)
  4080a8:	48 8d 3d c1 3f 00 00 	lea    0x3fc1(%rip),%rdi        # 40c070 <dlerror@plt+0xa3e0>
  4080af:	31 c0                	xor    %eax,%eax
  4080b1:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  4080b7:	45 31 ff             	xor    %r15d,%r15d
  4080ba:	e8 31 c4 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  4080bf:	e9 43 fe ff ff       	jmp    407f07 <dlerror@plt+0x6277>
  4080c4:	48 8d 3d cd 3f 00 00 	lea    0x3fcd(%rip),%rdi        # 40c098 <dlerror@plt+0xa408>
  4080cb:	31 c0                	xor    %eax,%eax
  4080cd:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  4080d3:	45 31 ff             	xor    %r15d,%r15d
  4080d6:	e8 15 c4 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  4080db:	e9 27 fe ff ff       	jmp    407f07 <dlerror@plt+0x6277>
  4080e0:	48 8d 3d e7 42 00 00 	lea    0x42e7(%rip),%rdi        # 40c3ce <dlerror@plt+0xa73e>
  4080e7:	31 c0                	xor    %eax,%eax
  4080e9:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  4080ef:	45 31 ff             	xor    %r15d,%r15d
  4080f2:	e8 f9 c3 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  4080f7:	e9 0b fe ff ff       	jmp    407f07 <dlerror@plt+0x6277>
  4080fc:	48 8d 3d dd 3e 00 00 	lea    0x3edd(%rip),%rdi        # 40bfe0 <dlerror@plt+0xa350>
  408103:	31 c0                	xor    %eax,%eax
  408105:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  40810b:	31 ed                	xor    %ebp,%ebp
  40810d:	e8 de c3 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  408112:	45 31 ff             	xor    %r15d,%r15d
  408115:	e9 ed fd ff ff       	jmp    407f07 <dlerror@plt+0x6277>
  40811a:	48 8d 3d 1f 3f 00 00 	lea    0x3f1f(%rip),%rdi        # 40c040 <dlerror@plt+0xa3b0>
  408121:	31 c0                	xor    %eax,%eax
  408123:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  408129:	45 31 ff             	xor    %r15d,%r15d
  40812c:	e8 bf c3 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  408131:	e9 d1 fd ff ff       	jmp    407f07 <dlerror@plt+0x6277>
  408136:	48 8d 3d cb 3e 00 00 	lea    0x3ecb(%rip),%rdi        # 40c008 <dlerror@plt+0xa378>
  40813d:	eb c4                	jmp    408103 <dlerror@plt+0x6473>
  40813f:	48 8d 3d 7a 3f 00 00 	lea    0x3f7a(%rip),%rdi        # 40c0c0 <dlerror@plt+0xa430>
  408146:	31 c0                	xor    %eax,%eax
  408148:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  40814e:	45 31 ff             	xor    %r15d,%r15d
  408151:	e8 9a c3 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  408156:	e9 ac fd ff ff       	jmp    407f07 <dlerror@plt+0x6277>
  40815b:	48 8d 3d 6c 42 00 00 	lea    0x426c(%rip),%rdi        # 40c3ce <dlerror@plt+0xa73e>
  408162:	31 c0                	xor    %eax,%eax
  408164:	41 83 ce ff          	or     $0xffffffff,%r14d
  408168:	31 ed                	xor    %ebp,%ebp
  40816a:	e8 81 c3 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  40816f:	e9 93 fd ff ff       	jmp    407f07 <dlerror@plt+0x6277>
  408174:	48 8d 3d 1d 3f 00 00 	lea    0x3f1d(%rip),%rdi        # 40c098 <dlerror@plt+0xa408>
  40817b:	31 c0                	xor    %eax,%eax
  40817d:	41 83 ce ff          	or     $0xffffffff,%r14d
  408181:	31 ed                	xor    %ebp,%ebp
  408183:	e8 68 c3 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  408188:	e9 7a fd ff ff       	jmp    407f07 <dlerror@plt+0x6277>
  40818d:	48 8d 3d dc 3e 00 00 	lea    0x3edc(%rip),%rdi        # 40c070 <dlerror@plt+0xa3e0>
  408194:	31 c0                	xor    %eax,%eax
  408196:	41 83 ce ff          	or     $0xffffffff,%r14d
  40819a:	31 ed                	xor    %ebp,%ebp
  40819c:	e8 4f c3 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  4081a1:	e9 61 fd ff ff       	jmp    407f07 <dlerror@plt+0x6277>
  4081a6:	48 8d 3d 04 42 00 00 	lea    0x4204(%rip),%rdi        # 40c3b1 <dlerror@plt+0xa721>
  4081ad:	31 c0                	xor    %eax,%eax
  4081af:	41 83 ce ff          	or     $0xffffffff,%r14d
  4081b3:	31 ed                	xor    %ebp,%ebp
  4081b5:	e8 36 c3 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  4081ba:	e9 48 fd ff ff       	jmp    407f07 <dlerror@plt+0x6277>
  4081bf:	e8 3c 97 ff ff       	call   401900 <__stack_chk_fail@plt>
  4081c4:	48 8d 3d f5 3e 00 00 	lea    0x3ef5(%rip),%rdi        # 40c0c0 <dlerror@plt+0xa430>
  4081cb:	31 c0                	xor    %eax,%eax
  4081cd:	41 83 ce ff          	or     $0xffffffff,%r14d
  4081d1:	31 ed                	xor    %ebp,%ebp
  4081d3:	e8 18 c3 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  4081d8:	e9 2a fd ff ff       	jmp    407f07 <dlerror@plt+0x6277>
  4081dd:	48 8d 3d 04 3f 00 00 	lea    0x3f04(%rip),%rdi        # 40c0e8 <dlerror@plt+0xa458>
  4081e4:	31 c0                	xor    %eax,%eax
  4081e6:	41 83 ce ff          	or     $0xffffffff,%r14d
  4081ea:	31 ed                	xor    %ebp,%ebp
  4081ec:	e8 ff c2 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  4081f1:	e9 11 fd ff ff       	jmp    407f07 <dlerror@plt+0x6277>
  4081f6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4081fd:	00 00 00 
  408200:	41 56                	push   %r14
  408202:	41 55                	push   %r13
  408204:	48 81 c7 3b 20 00 00 	add    $0x203b,%rdi
  40820b:	41 54                	push   %r12
  40820d:	55                   	push   %rbp
  40820e:	53                   	push   %rbx
  40820f:	4c 8b a7 05 10 00 00 	mov    0x1005(%rdi),%r12
  408216:	48 8b 6f e5          	mov    -0x1b(%rdi),%rbp
  40821a:	41 ff 94 24 80 01 00 	call   *0x180(%r12)
  408221:	00 
  408222:	48 85 c0             	test   %rax,%rax
  408225:	0f 84 18 01 00 00    	je     408343 <dlerror@plt+0x66b3>
  40822b:	48 89 c6             	mov    %rax,%rsi
  40822e:	48 8d 3d b2 41 00 00 	lea    0x41b2(%rip),%rdi        # 40c3e7 <dlerror@plt+0xa757>
  408235:	41 ff 94 24 68 01 00 	call   *0x168(%r12)
  40823c:	00 
  40823d:	48 8b 9d 08 10 00 00 	mov    0x1008(%rbp),%rbx
  408244:	48 3b 9d 10 10 00 00 	cmp    0x1010(%rbp),%rbx
  40824b:	72 43                	jb     408290 <dlerror@plt+0x6600>
  40824d:	e9 ce 00 00 00       	jmp    408320 <dlerror@plt+0x6690>
  408252:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  408258:	41 ff 94 24 c8 00 00 	call   *0xc8(%r12)
  40825f:	00 
  408260:	48 85 c0             	test   %rax,%rax
  408263:	74 10                	je     408275 <dlerror@plt+0x65e5>
  408265:	41 ff 94 24 d0 00 00 	call   *0xd0(%r12)
  40826c:	00 
  40826d:	41 ff 94 24 b0 00 00 	call   *0xb0(%r12)
  408274:	00 
  408275:	48 89 de             	mov    %rbx,%rsi
  408278:	48 89 ef             	mov    %rbp,%rdi
  40827b:	e8 e0 9e ff ff       	call   402160 <dlerror@plt+0x4d0>
  408280:	48 39 85 10 10 00 00 	cmp    %rax,0x1010(%rbp)
  408287:	48 89 c3             	mov    %rax,%rbx
  40828a:	0f 86 90 00 00 00    	jbe    408320 <dlerror@plt+0x6690>
  408290:	0f b6 43 11          	movzbl 0x11(%rbx),%eax
  408294:	83 e0 df             	and    $0xffffffdf,%eax
  408297:	3c 4d                	cmp    $0x4d,%al
  408299:	75 da                	jne    408275 <dlerror@plt+0x65e5>
  40829b:	48 89 de             	mov    %rbx,%rsi
  40829e:	48 89 ef             	mov    %rbp,%rdi
  4082a1:	e8 ca 9e ff ff       	call   402170 <dlerror@plt+0x4e0>
  4082a6:	8b 73 0c             	mov    0xc(%rbx),%esi
  4082a9:	49 89 c5             	mov    %rax,%r13
  4082ac:	48 89 c7             	mov    %rax,%rdi
  4082af:	41 ff 94 24 08 01 00 	call   *0x108(%r12)
  4082b6:	00 
  4082b7:	4c 89 ef             	mov    %r13,%rdi
  4082ba:	49 89 c6             	mov    %rax,%r14
  4082bd:	4c 8d 6b 12          	lea    0x12(%rbx),%r13
  4082c1:	e8 fa 94 ff ff       	call   4017c0 <free@plt>
  4082c6:	4d 85 f6             	test   %r14,%r14
  4082c9:	74 65                	je     408330 <dlerror@plt+0x66a0>
  4082cb:	4c 89 f6             	mov    %r14,%rsi
  4082ce:	4c 89 ef             	mov    %r13,%rdi
  4082d1:	41 ff 94 24 f0 00 00 	call   *0xf0(%r12)
  4082d8:	00 
  4082d9:	48 85 c0             	test   %rax,%rax
  4082dc:	0f 85 76 ff ff ff    	jne    408258 <dlerror@plt+0x65c8>
  4082e2:	48 8d 3d 07 3f 00 00 	lea    0x3f07(%rip),%rdi        # 40c1f0 <dlerror@plt+0xa560>
  4082e9:	4c 89 ee             	mov    %r13,%rsi
  4082ec:	e8 ff c1 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  4082f1:	41 ff 94 24 c8 00 00 	call   *0xc8(%r12)
  4082f8:	00 
  4082f9:	48 85 c0             	test   %rax,%rax
  4082fc:	74 10                	je     40830e <dlerror@plt+0x667e>
  4082fe:	41 ff 94 24 d0 00 00 	call   *0xd0(%r12)
  408305:	00 
  408306:	41 ff 94 24 b0 00 00 	call   *0xb0(%r12)
  40830d:	00 
  40830e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  408313:	5b                   	pop    %rbx
  408314:	5d                   	pop    %rbp
  408315:	41 5c                	pop    %r12
  408317:	41 5d                	pop    %r13
  408319:	41 5e                	pop    %r14
  40831b:	c3                   	ret
  40831c:	0f 1f 40 00          	nopl   0x0(%rax)
  408320:	5b                   	pop    %rbx
  408321:	31 c0                	xor    %eax,%eax
  408323:	5d                   	pop    %rbp
  408324:	41 5c                	pop    %r12
  408326:	41 5d                	pop    %r13
  408328:	41 5e                	pop    %r14
  40832a:	c3                   	ret
  40832b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  408330:	48 8d 3d 89 3e 00 00 	lea    0x3e89(%rip),%rdi        # 40c1c0 <dlerror@plt+0xa530>
  408337:	4c 89 ee             	mov    %r13,%rsi
  40833a:	31 c0                	xor    %eax,%eax
  40833c:	e8 af c1 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  408341:	eb ae                	jmp    4082f1 <dlerror@plt+0x6661>
  408343:	48 8d 3d 4e 3e 00 00 	lea    0x3e4e(%rip),%rdi        # 40c198 <dlerror@plt+0xa508>
  40834a:	31 c0                	xor    %eax,%eax
  40834c:	e8 9f c1 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  408351:	83 c8 ff             	or     $0xffffffff,%eax
  408354:	eb bd                	jmp    408313 <dlerror@plt+0x6683>
  408356:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40835d:	00 00 00 
  408360:	41 55                	push   %r13
  408362:	41 54                	push   %r12
  408364:	55                   	push   %rbp
  408365:	53                   	push   %rbx
  408366:	48 83 ec 18          	sub    $0x18,%rsp
  40836a:	48 8b 9f 20 20 00 00 	mov    0x2020(%rdi),%rbx
  408371:	48 8b af 40 30 00 00 	mov    0x3040(%rdi),%rbp
  408378:	48 8b b3 08 10 00 00 	mov    0x1008(%rbx),%rsi
  40837f:	48 3b b3 10 10 00 00 	cmp    0x1010(%rbx),%rsi
  408386:	73 2a                	jae    4083b2 <dlerror@plt+0x6722>
  408388:	80 7e 11 7a          	cmpb   $0x7a,0x11(%rsi)
  40838c:	49 89 fc             	mov    %rdi,%r12
  40838f:	75 0d                	jne    40839e <dlerror@plt+0x670e>
  408391:	eb 45                	jmp    4083d8 <dlerror@plt+0x6748>
  408393:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  408398:	80 7e 11 7a          	cmpb   $0x7a,0x11(%rsi)
  40839c:	74 3a                	je     4083d8 <dlerror@plt+0x6748>
  40839e:	48 89 df             	mov    %rbx,%rdi
  4083a1:	e8 ba 9d ff ff       	call   402160 <dlerror@plt+0x4d0>
  4083a6:	48 39 83 10 10 00 00 	cmp    %rax,0x1010(%rbx)
  4083ad:	48 89 c6             	mov    %rax,%rsi
  4083b0:	77 e6                	ja     408398 <dlerror@plt+0x6708>
  4083b2:	48 8d 3d 57 3e 00 00 	lea    0x3e57(%rip),%rdi        # 40c210 <dlerror@plt+0xa580>
  4083b9:	31 c0                	xor    %eax,%eax
  4083bb:	41 bc ff ff ff ff    	mov    $0xffffffff,%r12d
  4083c1:	e8 2a c1 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  4083c6:	48 83 c4 18          	add    $0x18,%rsp
  4083ca:	44 89 e0             	mov    %r12d,%eax
  4083cd:	5b                   	pop    %rbx
  4083ce:	5d                   	pop    %rbp
  4083cf:	41 5c                	pop    %r12
  4083d1:	41 5d                	pop    %r13
  4083d3:	c3                   	ret
  4083d4:	0f 1f 40 00          	nopl   0x0(%rax)
  4083d8:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  4083dd:	49 8d bc 24 20 10 00 	lea    0x1020(%r12),%rdi
  4083e4:	00 
  4083e5:	ff 95 80 01 00 00    	call   *0x180(%rbp)
  4083eb:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  4083f0:	49 89 c5             	mov    %rax,%r13
  4083f3:	49 8b 84 24 20 20 00 	mov    0x2020(%r12),%rax
  4083fa:	00 
  4083fb:	48 8d 3d ff 3f 00 00 	lea    0x3fff(%rip),%rdi        # 40c401 <dlerror@plt+0xa771>
  408402:	8b 56 04             	mov    0x4(%rsi),%edx
  408405:	4c 89 ee             	mov    %r13,%rsi
  408408:	48 03 90 00 10 00 00 	add    0x1000(%rax),%rdx
  40840f:	31 c0                	xor    %eax,%eax
  408411:	ff 95 88 01 00 00    	call   *0x188(%rbp)
  408417:	48 89 c3             	mov    %rax,%rbx
  40841a:	4c 89 ef             	mov    %r13,%rdi
  40841d:	ff 55 10             	call   *0x10(%rbp)
  408420:	48 85 db             	test   %rbx,%rbx
  408423:	74 3e                	je     408463 <dlerror@plt+0x67d3>
  408425:	48 89 de             	mov    %rbx,%rsi
  408428:	48 8d 3d c1 3f 00 00 	lea    0x3fc1(%rip),%rdi        # 40c3f0 <dlerror@plt+0xa760>
  40842f:	ff 95 68 01 00 00    	call   *0x168(%rbp)
  408435:	41 89 c4             	mov    %eax,%r12d
  408438:	48 89 df             	mov    %rbx,%rdi
  40843b:	ff 55 10             	call   *0x10(%rbp)
  40843e:	45 85 e4             	test   %r12d,%r12d
  408441:	74 83                	je     4083c6 <dlerror@plt+0x6736>
  408443:	48 8d 35 a6 3f 00 00 	lea    0x3fa6(%rip),%rsi        # 40c3f0 <dlerror@plt+0xa760>
  40844a:	48 8d 3d 1f 3e 00 00 	lea    0x3e1f(%rip),%rdi        # 40c270 <dlerror@plt+0xa5e0>
  408451:	31 c0                	xor    %eax,%eax
  408453:	41 bc ff ff ff ff    	mov    $0xffffffff,%r12d
  408459:	e8 92 c0 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  40845e:	e9 63 ff ff ff       	jmp    4083c6 <dlerror@plt+0x6736>
  408463:	48 8d 3d d6 3d 00 00 	lea    0x3dd6(%rip),%rdi        # 40c240 <dlerror@plt+0xa5b0>
  40846a:	31 c0                	xor    %eax,%eax
  40846c:	41 83 cc ff          	or     $0xffffffff,%r12d
  408470:	e8 7b c0 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  408475:	e9 4c ff ff ff       	jmp    4083c6 <dlerror@plt+0x6736>
  40847a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  408480:	53                   	push   %rbx
  408481:	48 8b 9f 40 30 00 00 	mov    0x3040(%rdi),%rbx
  408488:	48 85 db             	test   %rbx,%rbx
  40848b:	74 33                	je     4084c0 <dlerror@plt+0x6830>
  40848d:	ff 53 40             	call   *0x40(%rbx)
  408490:	85 c0                	test   %eax,%eax
  408492:	74 2c                	je     4084c0 <dlerror@plt+0x6830>
  408494:	31 f6                	xor    %esi,%esi
  408496:	48 8d 3d 0b 3e 00 00 	lea    0x3e0b(%rip),%rdi        # 40c2a8 <dlerror@plt+0xa618>
  40849d:	ff 93 50 01 00 00    	call   *0x150(%rbx)
  4084a3:	31 f6                	xor    %esi,%esi
  4084a5:	48 8d 3d 84 3e 00 00 	lea    0x3e84(%rip),%rdi        # 40c330 <dlerror@plt+0xa6a0>
  4084ac:	ff 93 50 01 00 00    	call   *0x150(%rbx)
  4084b2:	48 8b 43 28          	mov    0x28(%rbx),%rax
  4084b6:	5b                   	pop    %rbx
  4084b7:	ff e0                	jmp    *%rax
  4084b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4084c0:	5b                   	pop    %rbx
  4084c1:	c3                   	ret
  4084c2:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4084c9:	00 00 00 
  4084cc:	0f 1f 40 00          	nopl   0x0(%rax)
  4084d0:	41 54                	push   %r12
  4084d2:	55                   	push   %rbp
  4084d3:	53                   	push   %rbx
  4084d4:	48 8b 47 30          	mov    0x30(%rdi),%rax
  4084d8:	48 89 fb             	mov    %rdi,%rbx
  4084db:	48 85 c0             	test   %rax,%rax
  4084de:	74 50                	je     408530 <dlerror@plt+0x68a0>
  4084e0:	48 8b 77 38          	mov    0x38(%rdi),%rsi
  4084e4:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  4084e8:	ff d0                	call   *%rax
  4084ea:	41 89 c4             	mov    %eax,%r12d
  4084ed:	80 7b 18 00          	cmpb   $0x0,0x18(%rbx)
  4084f1:	75 31                	jne    408524 <dlerror@plt+0x6894>
  4084f3:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
  4084f7:	48 8b af 80 50 00 00 	mov    0x5080(%rdi),%rbp
  4084fe:	48 83 c7 08          	add    $0x8,%rdi
  408502:	ff 55 78             	call   *0x78(%rbp)
  408505:	48 8b 43 28          	mov    0x28(%rbx),%rax
  408509:	48 8b 7b 20          	mov    0x20(%rbx),%rdi
  40850d:	44 89 20             	mov    %r12d,(%rax)
  408510:	ff 95 98 00 00 00    	call   *0x98(%rbp)
  408516:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
  40851a:	48 83 c7 08          	add    $0x8,%rdi
  40851e:	ff 95 80 00 00 00    	call   *0x80(%rbp)
  408524:	5b                   	pop    %rbx
  408525:	b8 01 00 00 00       	mov    $0x1,%eax
  40852a:	5d                   	pop    %rbp
  40852b:	41 5c                	pop    %r12
  40852d:	c3                   	ret
  40852e:	66 90                	xchg   %ax,%ax
  408530:	45 31 e4             	xor    %r12d,%r12d
  408533:	eb b8                	jmp    4084ed <dlerror@plt+0x685d>
  408535:	90                   	nop
  408536:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40853d:	00 00 00 
  408540:	48 89 f8             	mov    %rdi,%rax
  408543:	48 83 ec 08          	sub    $0x8,%rsp
  408547:	48 89 f1             	mov    %rsi,%rcx
  40854a:	48 8b 80 80 50 00 00 	mov    0x5080(%rax),%rax
  408551:	48 8b 7f 38          	mov    0x38(%rdi),%rdi
  408555:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  40855b:	31 d2                	xor    %edx,%edx
  40855d:	48 8d 35 a5 3e 00 00 	lea    0x3ea5(%rip),%rsi        # 40c409 <dlerror@plt+0xa779>
  408564:	ff 90 c0 00 00 00    	call   *0xc0(%rax)
  40856a:	31 c0                	xor    %eax,%eax
  40856c:	48 83 c4 08          	add    $0x8,%rsp
  408570:	c3                   	ret
  408571:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  408576:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40857d:	00 00 00 
  408580:	c6 47 30 01          	movb   $0x1,0x30(%rdi)
  408584:	31 c0                	xor    %eax,%eax
  408586:	c3                   	ret
  408587:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40858e:	00 00 
  408590:	41 55                	push   %r13
  408592:	41 54                	push   %r12
  408594:	49 89 f4             	mov    %rsi,%r12
  408597:	55                   	push   %rbp
  408598:	53                   	push   %rbx
  408599:	48 8d 9f 49 30 00 00 	lea    0x3049(%rdi),%rbx
  4085a0:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  4085a6:	31 d2                	xor    %edx,%edx
  4085a8:	48 8d 35 66 3e 00 00 	lea    0x3e66(%rip),%rsi        # 40c415 <dlerror@plt+0xa785>
  4085af:	48 81 ec 18 10 00 00 	sub    $0x1018,%rsp
  4085b6:	48 8b af 80 50 00 00 	mov    0x5080(%rdi),%rbp
  4085bd:	48 89 d9             	mov    %rbx,%rcx
  4085c0:	49 89 e5             	mov    %rsp,%r13
  4085c3:	4c 89 e7             	mov    %r12,%rdi
  4085c6:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4085cd:	00 00 
  4085cf:	48 89 84 24 08 10 00 	mov    %rax,0x1008(%rsp)
  4085d6:	00 
  4085d7:	31 c0                	xor    %eax,%eax
  4085d9:	ff 95 c0 00 00 00    	call   *0xc0(%rbp)
  4085df:	31 d2                	xor    %edx,%edx
  4085e1:	b9 01 00 00 00       	mov    $0x1,%ecx
  4085e6:	48 8d 35 34 3e 00 00 	lea    0x3e34(%rip),%rsi        # 40c421 <dlerror@plt+0xa791>
  4085ed:	4c 89 e7             	mov    %r12,%rdi
  4085f0:	ff 95 c8 00 00 00    	call   *0xc8(%rbp)
  4085f6:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  4085fc:	48 8d 0d 95 1f 00 00 	lea    0x1f95(%rip),%rcx        # 40a598 <dlerror@plt+0x8908>
  408603:	31 d2                	xor    %edx,%edx
  408605:	48 8d 35 21 3e 00 00 	lea    0x3e21(%rip),%rsi        # 40c42d <dlerror@plt+0xa79d>
  40860c:	4c 89 e7             	mov    %r12,%rdi
  40860f:	ff 95 c0 00 00 00    	call   *0xc0(%rbp)
  408615:	48 8d 15 1b 3e 00 00 	lea    0x3e1b(%rip),%rdx        # 40c437 <dlerror@plt+0xa7a7>
  40861c:	4c 89 ef             	mov    %r13,%rdi
  40861f:	48 89 de             	mov    %rbx,%rsi
  408622:	e8 89 d8 ff ff       	call   405eb0 <dlerror@plt+0x4220>
  408627:	4c 89 ee             	mov    %r13,%rsi
  40862a:	4c 89 e7             	mov    %r12,%rdi
  40862d:	ff 95 18 01 00 00    	call   *0x118(%rbp)
  408633:	85 c0                	test   %eax,%eax
  408635:	41 89 c5             	mov    %eax,%r13d
  408638:	75 1b                	jne    408655 <dlerror@plt+0x69c5>
  40863a:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  408640:	48 89 d9             	mov    %rbx,%rcx
  408643:	31 d2                	xor    %edx,%edx
  408645:	48 8d 35 e1 3d 00 00 	lea    0x3de1(%rip),%rsi        # 40c42d <dlerror@plt+0xa79d>
  40864c:	4c 89 e7             	mov    %r12,%rdi
  40864f:	ff 95 c0 00 00 00    	call   *0xc0(%rbp)
  408655:	48 8b 8c 24 08 10 00 	mov    0x1008(%rsp),%rcx
  40865c:	00 
  40865d:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  408664:	00 00 
  408666:	44 89 e8             	mov    %r13d,%eax
  408669:	75 0e                	jne    408679 <dlerror@plt+0x69e9>
  40866b:	48 81 c4 18 10 00 00 	add    $0x1018,%rsp
  408672:	5b                   	pop    %rbx
  408673:	5d                   	pop    %rbp
  408674:	41 5c                	pop    %r12
  408676:	41 5d                	pop    %r13
  408678:	c3                   	ret
  408679:	e8 82 92 ff ff       	call   401900 <__stack_chk_fail@plt>
  40867e:	66 90                	xchg   %ax,%ax
  408680:	41 56                	push   %r14
  408682:	41 55                	push   %r13
  408684:	41 54                	push   %r12
  408686:	55                   	push   %rbp
  408687:	53                   	push   %rbx
  408688:	48 8b af 80 50 00 00 	mov    0x5080(%rdi),%rbp
  40868f:	48 89 fb             	mov    %rdi,%rbx
  408692:	ff 55 78             	call   *0x78(%rbp)
  408695:	c6 43 30 00          	movb   $0x0,0x30(%rbx)
  408699:	ff 55 28             	call   *0x28(%rbp)
  40869c:	48 83 7b 40 00       	cmpq   $0x0,0x40(%rbx)
  4086a1:	48 89 43 38          	mov    %rax,0x38(%rbx)
  4086a5:	75 0b                	jne    4086b2 <dlerror@plt+0x6a22>
  4086a7:	ff 55 68             	call   *0x68(%rbp)
  4086aa:	48 89 43 40          	mov    %rax,0x40(%rbx)
  4086ae:	48 8b 43 38          	mov    0x38(%rbx),%rax
  4086b2:	45 31 c0             	xor    %r8d,%r8d
  4086b5:	48 89 d9             	mov    %rbx,%rcx
  4086b8:	48 8d 15 d1 fe ff ff 	lea    -0x12f(%rip),%rdx        # 408590 <dlerror@plt+0x6900>
  4086bf:	48 8d 35 7a 3d 00 00 	lea    0x3d7a(%rip),%rsi        # 40c440 <dlerror@plt+0xa7b0>
  4086c6:	48 89 c7             	mov    %rax,%rdi
  4086c9:	ff 95 d0 00 00 00    	call   *0xd0(%rbp)
  4086cf:	49 89 c4             	mov    %rax,%r12
  4086d2:	45 31 c0             	xor    %r8d,%r8d
  4086d5:	48 8b 7b 38          	mov    0x38(%rbx),%rdi
  4086d9:	48 89 d9             	mov    %rbx,%rcx
  4086dc:	48 8d 15 2d 02 00 00 	lea    0x22d(%rip),%rdx        # 408910 <dlerror@plt+0x6c80>
  4086e3:	48 8d 35 5e 3d 00 00 	lea    0x3d5e(%rip),%rsi        # 40c448 <dlerror@plt+0xa7b8>
  4086ea:	ff 95 d0 00 00 00    	call   *0xd0(%rbp)
  4086f0:	4d 85 e4             	test   %r12,%r12
  4086f3:	48 8b 7b 38          	mov    0x38(%rbx),%rdi
  4086f7:	48 89 d9             	mov    %rbx,%rcx
  4086fa:	41 0f 94 c4          	sete   %r12b
  4086fe:	48 85 c0             	test   %rax,%rax
  408701:	48 8d 15 78 fe ff ff 	lea    -0x188(%rip),%rdx        # 408580 <dlerror@plt+0x68f0>
  408708:	0f 94 c0             	sete   %al
  40870b:	48 8d 35 46 3d 00 00 	lea    0x3d46(%rip),%rsi        # 40c458 <dlerror@plt+0xa7c8>
  408712:	45 31 c0             	xor    %r8d,%r8d
  408715:	41 09 c4             	or     %eax,%r12d
  408718:	ff 95 d0 00 00 00    	call   *0xd0(%rbp)
  40871e:	48 85 c0             	test   %rax,%rax
  408721:	48 8b 7b 38          	mov    0x38(%rbx),%rdi
  408725:	b9 00 00 00 00       	mov    $0x0,%ecx
  40872a:	0f 94 c0             	sete   %al
  40872d:	41 09 c4             	or     %eax,%r12d
  408730:	83 7d 10 08          	cmpl   $0x8,0x10(%rbp)
  408734:	0f 8e 76 01 00 00    	jle    4088b0 <dlerror@plt+0x6c20>
  40873a:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  408741:	48 8d 35 15 3d 00 00 	lea    0x3d15(%rip),%rsi        # 40c45d <dlerror@plt+0xa7cd>
  408748:	ff 95 28 01 00 00    	call   *0x128(%rbp)
  40874e:	45 31 c0             	xor    %r8d,%r8d
  408751:	48 8b 7b 38          	mov    0x38(%rbx),%rdi
  408755:	48 89 d9             	mov    %rbx,%rcx
  408758:	48 8d 15 71 02 00 00 	lea    0x271(%rip),%rdx        # 4089d0 <dlerror@plt+0x6d40>
  40875f:	48 8d 35 0a 3d 00 00 	lea    0x3d0a(%rip),%rsi        # 40c470 <dlerror@plt+0xa7e0>
  408766:	4c 8d 6b 10          	lea    0x10(%rbx),%r13
  40876a:	ff 95 d0 00 00 00    	call   *0xd0(%rbp)
  408770:	48 85 c0             	test   %rax,%rax
  408773:	4c 8d 73 18          	lea    0x18(%rbx),%r14
  408777:	0f 84 d0 00 00 00    	je     40884d <dlerror@plt+0x6bbd>
  40877d:	45 84 e4             	test   %r12b,%r12b
  408780:	0f 85 c7 00 00 00    	jne    40884d <dlerror@plt+0x6bbd>
  408786:	48 8b 7b 38          	mov    0x38(%rbx),%rdi
  40878a:	ff 55 20             	call   *0x20(%rbp)
  40878d:	41 89 c4             	mov    %eax,%r12d
  408790:	48 8b 7b 38          	mov    0x38(%rbx),%rdi
  408794:	ff 95 58 01 00 00    	call   *0x158(%rbp)
  40879a:	41 09 c4             	or     %eax,%r12d
  40879d:	0f 85 aa 00 00 00    	jne    40884d <dlerror@plt+0x6bbd>
  4087a3:	83 7d 10 08          	cmpl   $0x8,0x10(%rbp)
  4087a7:	48 63 b3 68 50 00 00 	movslq 0x5068(%rbx),%rsi
  4087ae:	48 8b bb 60 50 00 00 	mov    0x5060(%rbx),%rdi
  4087b5:	0f 8e 15 01 00 00    	jle    4088d0 <dlerror@plt+0x6c40>
  4087bb:	ff 95 f8 00 00 00    	call   *0xf8(%rbp)
  4087c1:	31 d2                	xor    %edx,%edx
  4087c3:	48 8b 7b 38          	mov    0x38(%rbx),%rdi
  4087c7:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  4087cd:	48 89 c1             	mov    %rax,%rcx
  4087d0:	48 8d 35 a0 3c 00 00 	lea    0x3ca0(%rip),%rsi        # 40c477 <dlerror@plt+0xa7e7>
  4087d7:	ff 95 00 01 00 00    	call   *0x100(%rbp)
  4087dd:	48 8b bb 60 50 00 00 	mov    0x5060(%rbx),%rdi
  4087e4:	e8 d7 8f ff ff       	call   4017c0 <free@plt>
  4087e9:	83 7d 10 08          	cmpl   $0x8,0x10(%rbp)
  4087ed:	48 c7 83 60 50 00 00 	movq   $0x0,0x5060(%rbx)
  4087f4:	00 00 00 00 
  4087f8:	0f 8e e2 00 00 00    	jle    4088e0 <dlerror@plt+0x6c50>
  4087fe:	48 63 93 58 50 00 00 	movslq 0x5058(%rbx),%rdx
  408805:	48 8b b3 50 50 00 00 	mov    0x5050(%rbx),%rsi
  40880c:	b9 01 00 00 00       	mov    $0x1,%ecx
  408811:	48 8b 7b 38          	mov    0x38(%rbx),%rdi
  408815:	ff 95 28 01 00 00    	call   *0x128(%rbp)
  40881b:	4c 89 ef             	mov    %r13,%rdi
  40881e:	ff 55 78             	call   *0x78(%rbp)
  408821:	4c 89 f7             	mov    %r14,%rdi
  408824:	ff 95 98 00 00 00    	call   *0x98(%rbp)
  40882a:	4c 89 ef             	mov    %r13,%rdi
  40882d:	ff 95 80 00 00 00    	call   *0x80(%rbp)
  408833:	eb 0e                	jmp    408843 <dlerror@plt+0x6bb3>
  408835:	0f 1f 00             	nopl   (%rax)
  408838:	80 7b 30 00          	cmpb   $0x0,0x30(%rbx)
  40883c:	75 0f                	jne    40884d <dlerror@plt+0x6bbd>
  40883e:	31 ff                	xor    %edi,%edi
  408840:	ff 55 38             	call   *0x38(%rbp)
  408843:	ff 95 60 01 00 00    	call   *0x160(%rbp)
  408849:	85 c0                	test   %eax,%eax
  40884b:	7f eb                	jg     408838 <dlerror@plt+0x6ba8>
  40884d:	4c 8d 63 28          	lea    0x28(%rbx),%r12
  408851:	4c 89 e7             	mov    %r12,%rdi
  408854:	ff 55 78             	call   *0x78(%rbp)
  408857:	48 8b 7b 38          	mov    0x38(%rbx),%rdi
  40885b:	ff 55 50             	call   *0x50(%rbp)
  40885e:	48 89 df             	mov    %rbx,%rdi
  408861:	48 c7 43 38 00 00 00 	movq   $0x0,0x38(%rbx)
  408868:	00 
  408869:	ff 95 80 00 00 00    	call   *0x80(%rbp)
  40886f:	4c 89 ef             	mov    %r13,%rdi
  408872:	ff 55 78             	call   *0x78(%rbp)
  408875:	4c 89 f7             	mov    %r14,%rdi
  408878:	ff 95 98 00 00 00    	call   *0x98(%rbp)
  40887e:	4c 89 ef             	mov    %r13,%rdi
  408881:	ff 95 80 00 00 00    	call   *0x80(%rbp)
  408887:	ff 55 48             	call   *0x48(%rbp)
  40888a:	48 8d 7b 20          	lea    0x20(%rbx),%rdi
  40888e:	ff 95 98 00 00 00    	call   *0x98(%rbp)
  408894:	5b                   	pop    %rbx
  408895:	48 8b 85 80 00 00 00 	mov    0x80(%rbp),%rax
  40889c:	4c 89 e7             	mov    %r12,%rdi
  40889f:	5d                   	pop    %rbp
  4088a0:	41 5c                	pop    %r12
  4088a2:	41 5d                	pop    %r13
  4088a4:	41 5e                	pop    %r14
  4088a6:	ff e0                	jmp    *%rax
  4088a8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4088af:	00 
  4088b0:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  4088b5:	48 8d 35 a1 3b 00 00 	lea    0x3ba1(%rip),%rsi        # 40c45d <dlerror@plt+0xa7cd>
  4088bc:	ff 95 20 01 00 00    	call   *0x120(%rbp)
  4088c2:	e9 87 fe ff ff       	jmp    40874e <dlerror@plt+0x6abe>
  4088c7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4088ce:	00 00 
  4088d0:	ff 95 f0 00 00 00    	call   *0xf0(%rbp)
  4088d6:	e9 e6 fe ff ff       	jmp    4087c1 <dlerror@plt+0x6b31>
  4088db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4088e0:	8b 93 58 50 00 00    	mov    0x5058(%rbx),%edx
  4088e6:	48 8b b3 50 50 00 00 	mov    0x5050(%rbx),%rsi
  4088ed:	b9 01 00 00 00       	mov    $0x1,%ecx
  4088f2:	48 8b 7b 38          	mov    0x38(%rbx),%rdi
  4088f6:	ff 95 20 01 00 00    	call   *0x120(%rbp)
  4088fc:	e9 1a ff ff ff       	jmp    40881b <dlerror@plt+0x6b8b>
  408901:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  408906:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40890d:	00 00 00 
  408910:	41 55                	push   %r13
  408912:	41 54                	push   %r12
  408914:	49 89 f4             	mov    %rsi,%r12
  408917:	55                   	push   %rbp
  408918:	53                   	push   %rbx
  408919:	48 89 fb             	mov    %rdi,%rbx
  40891c:	48 81 ec 18 10 00 00 	sub    $0x1018,%rsp
  408923:	48 8b af 80 50 00 00 	mov    0x5080(%rdi),%rbp
  40892a:	48 8b 79 20          	mov    0x20(%rcx),%rdi
  40892e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  408935:	00 00 
  408937:	48 89 84 24 08 10 00 	mov    %rax,0x1008(%rsp)
  40893e:	00 
  40893f:	31 c0                	xor    %eax,%eax
  408941:	ff 95 d8 00 00 00    	call   *0xd8(%rbp)
  408947:	48 8d 15 35 3b 00 00 	lea    0x3b35(%rip),%rdx        # 40c483 <dlerror@plt+0xa7f3>
  40894e:	48 89 c6             	mov    %rax,%rsi
  408951:	b9 07 00 00 00       	mov    $0x7,%ecx
  408956:	b8 01 00 00 00       	mov    $0x1,%eax
  40895b:	48 89 d7             	mov    %rdx,%rdi
  40895e:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  408960:	40 0f 97 c7          	seta   %dil
  408964:	40 80 df 00          	sbb    $0x0,%dil
  408968:	40 84 ff             	test   %dil,%dil
  40896b:	75 3c                	jne    4089a9 <dlerror@plt+0x6d19>
  40896d:	48 81 c3 49 40 00 00 	add    $0x4049,%rbx
  408974:	49 89 e5             	mov    %rsp,%r13
  408977:	48 89 de             	mov    %rbx,%rsi
  40897a:	4c 89 ef             	mov    %r13,%rdi
  40897d:	e8 2e d5 ff ff       	call   405eb0 <dlerror@plt+0x4220>
  408982:	48 8d 35 01 3b 00 00 	lea    0x3b01(%rip),%rsi        # 40c48a <dlerror@plt+0xa7fa>
  408989:	4c 89 e7             	mov    %r12,%rdi
  40898c:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  408992:	48 89 d9             	mov    %rbx,%rcx
  408995:	31 d2                	xor    %edx,%edx
  408997:	ff 95 c0 00 00 00    	call   *0xc0(%rbp)
  40899d:	4c 89 ee             	mov    %r13,%rsi
  4089a0:	4c 89 e7             	mov    %r12,%rdi
  4089a3:	ff 95 18 01 00 00    	call   *0x118(%rbp)
  4089a9:	48 8b 94 24 08 10 00 	mov    0x1008(%rsp),%rdx
  4089b0:	00 
  4089b1:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  4089b8:	00 00 
  4089ba:	75 0e                	jne    4089ca <dlerror@plt+0x6d3a>
  4089bc:	48 81 c4 18 10 00 00 	add    $0x1018,%rsp
  4089c3:	5b                   	pop    %rbx
  4089c4:	5d                   	pop    %rbp
  4089c5:	41 5c                	pop    %r12
  4089c7:	41 5d                	pop    %r13
  4089c9:	c3                   	ret
  4089ca:	e8 31 8f ff ff       	call   401900 <__stack_chk_fail@plt>
  4089cf:	90                   	nop
  4089d0:	41 57                	push   %r15
  4089d2:	41 56                	push   %r14
  4089d4:	41 55                	push   %r13
  4089d6:	41 54                	push   %r12
  4089d8:	4c 63 e2             	movslq %edx,%r12
  4089db:	55                   	push   %rbp
  4089dc:	53                   	push   %rbx
  4089dd:	4e 8d 34 e5 00 00 00 	lea    0x0(,%r12,8),%r14
  4089e4:	00 
  4089e5:	48 89 fb             	mov    %rdi,%rbx
  4089e8:	49 89 cd             	mov    %rcx,%r13
  4089eb:	48 83 ec 18          	sub    $0x18,%rsp
  4089ef:	4c 8b bf 80 50 00 00 	mov    0x5080(%rdi),%r15
  4089f6:	48 83 c3 49          	add    $0x49,%rbx
  4089fa:	4a 8b 7c 31 f8       	mov    -0x8(%rcx,%r14,1),%rdi
  4089ff:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  408a04:	41 ff 97 d8 00 00 00 	call   *0xd8(%r15)
  408a0b:	48 89 df             	mov    %rbx,%rdi
  408a0e:	48 89 04 24          	mov    %rax,(%rsp)
  408a12:	e8 c9 8e ff ff       	call   4018e0 <strlen@plt>
  408a17:	48 8b 3c 24          	mov    (%rsp),%rdi
  408a1b:	48 89 c2             	mov    %rax,%rdx
  408a1e:	48 89 de             	mov    %rbx,%rsi
  408a21:	e8 da 8d ff ff       	call   401800 <strncmp@plt>
  408a26:	85 c0                	test   %eax,%eax
  408a28:	74 66                	je     408a90 <dlerror@plt+0x6e00>
  408a2a:	41 83 7f 10 08       	cmpl   $0x8,0x10(%r15)
  408a2f:	7f 3f                	jg     408a70 <dlerror@plt+0x6de0>
  408a31:	be ff ff ff ff       	mov    $0xffffffff,%esi
  408a36:	48 8d 3d 5b 3a 00 00 	lea    0x3a5b(%rip),%rdi        # 40c498 <dlerror@plt+0xa808>
  408a3d:	41 ff 97 e0 00 00 00 	call   *0xe0(%r15)
  408a44:	48 89 c6             	mov    %rax,%rsi
  408a47:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  408a4c:	41 ff 97 10 01 00 00 	call   *0x110(%r15)
  408a53:	b8 01 00 00 00       	mov    $0x1,%eax
  408a58:	48 83 c4 18          	add    $0x18,%rsp
  408a5c:	5b                   	pop    %rbx
  408a5d:	5d                   	pop    %rbp
  408a5e:	41 5c                	pop    %r12
  408a60:	41 5d                	pop    %r13
  408a62:	41 5e                	pop    %r14
  408a64:	41 5f                	pop    %r15
  408a66:	c3                   	ret
  408a67:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  408a6e:	00 00 
  408a70:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  408a77:	48 8d 3d 1a 3a 00 00 	lea    0x3a1a(%rip),%rdi        # 40c498 <dlerror@plt+0xa808>
  408a7e:	41 ff 97 e8 00 00 00 	call   *0xe8(%r15)
  408a85:	eb bd                	jmp    408a44 <dlerror@plt+0x6db4>
  408a87:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  408a8e:	00 00 
  408a90:	48 8b 3c 24          	mov    (%rsp),%rdi
  408a94:	e8 b7 d4 ff ff       	call   405f50 <dlerror@plt+0x42c0>
  408a99:	85 c0                	test   %eax,%eax
  408a9b:	74 bb                	je     408a58 <dlerror@plt+0x6dc8>
  408a9d:	41 83 7f 10 08       	cmpl   $0x8,0x10(%r15)
  408aa2:	4c 89 e5             	mov    %r12,%rbp
  408aa5:	0f 8e 8d 00 00 00    	jle    408b38 <dlerror@plt+0x6ea8>
  408aab:	4c 89 f7             	mov    %r14,%rdi
  408aae:	41 ff 97 48 01 00 00 	call   *0x148(%r15)
  408ab5:	48 89 c3             	mov    %rax,%rbx
  408ab8:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  408abf:	48 8d 3d a9 39 00 00 	lea    0x39a9(%rip),%rdi        # 40c46f <dlerror@plt+0xa7df>
  408ac6:	41 ff 97 e8 00 00 00 	call   *0xe8(%r15)
  408acd:	48 89 03             	mov    %rax,(%rbx)
  408ad0:	83 fd 01             	cmp    $0x1,%ebp
  408ad3:	7e 25                	jle    408afa <dlerror@plt+0x6e6a>
  408ad5:	8d 45 fe             	lea    -0x2(%rbp),%eax
  408ad8:	48 8d 34 c5 10 00 00 	lea    0x10(,%rax,8),%rsi
  408adf:	00 
  408ae0:	b8 08 00 00 00       	mov    $0x8,%eax
  408ae5:	0f 1f 00             	nopl   (%rax)
  408ae8:	49 8b 54 05 00       	mov    0x0(%r13,%rax,1),%rdx
  408aed:	48 89 14 03          	mov    %rdx,(%rbx,%rax,1)
  408af1:	48 83 c0 08          	add    $0x8,%rax
  408af5:	48 39 c6             	cmp    %rax,%rsi
  408af8:	75 ee                	jne    408ae8 <dlerror@plt+0x6e58>
  408afa:	31 c9                	xor    %ecx,%ecx
  408afc:	41 83 7f 10 08       	cmpl   $0x8,0x10(%r15)
  408b01:	48 89 da             	mov    %rbx,%rdx
  408b04:	7e 62                	jle    408b68 <dlerror@plt+0x6ed8>
  408b06:	4c 89 e6             	mov    %r12,%rsi
  408b09:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  408b0e:	41 ff 97 38 01 00 00 	call   *0x138(%r15)
  408b15:	89 04 24             	mov    %eax,(%rsp)
  408b18:	48 89 df             	mov    %rbx,%rdi
  408b1b:	41 ff 97 50 01 00 00 	call   *0x150(%r15)
  408b22:	8b 04 24             	mov    (%rsp),%eax
  408b25:	48 83 c4 18          	add    $0x18,%rsp
  408b29:	5b                   	pop    %rbx
  408b2a:	5d                   	pop    %rbp
  408b2b:	41 5c                	pop    %r12
  408b2d:	41 5d                	pop    %r13
  408b2f:	41 5e                	pop    %r14
  408b31:	41 5f                	pop    %r15
  408b33:	c3                   	ret
  408b34:	0f 1f 40 00          	nopl   0x0(%rax)
  408b38:	42 8d 3c e5 00 00 00 	lea    0x0(,%r12,8),%edi
  408b3f:	00 
  408b40:	41 ff 97 40 01 00 00 	call   *0x140(%r15)
  408b47:	48 89 c3             	mov    %rax,%rbx
  408b4a:	be ff ff ff ff       	mov    $0xffffffff,%esi
  408b4f:	48 8d 3d 19 39 00 00 	lea    0x3919(%rip),%rdi        # 40c46f <dlerror@plt+0xa7df>
  408b56:	41 ff 97 e0 00 00 00 	call   *0xe0(%r15)
  408b5d:	48 89 03             	mov    %rax,(%rbx)
  408b60:	e9 6b ff ff ff       	jmp    408ad0 <dlerror@plt+0x6e40>
  408b65:	0f 1f 00             	nopl   (%rax)
  408b68:	89 ee                	mov    %ebp,%esi
  408b6a:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  408b6f:	41 ff 97 30 01 00 00 	call   *0x130(%r15)
  408b76:	eb 9d                	jmp    408b15 <dlerror@plt+0x6e85>
  408b78:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  408b7f:	00 
  408b80:	41 57                	push   %r15
  408b82:	41 56                	push   %r14
  408b84:	41 55                	push   %r13
  408b86:	41 54                	push   %r12
  408b88:	49 89 f4             	mov    %rsi,%r12
  408b8b:	55                   	push   %rbp
  408b8c:	53                   	push   %rbx
  408b8d:	48 89 fd             	mov    %rdi,%rbp
  408b90:	48 83 ec 18          	sub    $0x18,%rsp
  408b94:	48 8b be 20 20 00 00 	mov    0x2020(%rsi),%rdi
  408b9b:	48 8b b7 20 10 00 00 	mov    0x1020(%rdi),%rsi
  408ba2:	e8 c9 95 ff ff       	call   402170 <dlerror@plt+0x4e0>
  408ba7:	48 85 c0             	test   %rax,%rax
  408baa:	0f 84 a0 01 00 00    	je     408d50 <dlerror@plt+0x70c0>
  408bb0:	49 81 c4 3b 20 00 00 	add    $0x203b,%r12
  408bb7:	48 8d 7d 49          	lea    0x49(%rbp),%rdi
  408bbb:	ba 00 10 00 00       	mov    $0x1000,%edx
  408bc0:	4c 89 e6             	mov    %r12,%rsi
  408bc3:	48 89 c3             	mov    %rax,%rbx
  408bc6:	e8 25 8c ff ff       	call   4017f0 <strncpy@plt>
  408bcb:	48 8d bd 49 10 00 00 	lea    0x1049(%rbp),%rdi
  408bd2:	48 89 da             	mov    %rbx,%rdx
  408bd5:	4c 89 e6             	mov    %r12,%rsi
  408bd8:	e8 d3 d2 ff ff       	call   405eb0 <dlerror@plt+0x4220>
  408bdd:	48 85 c0             	test   %rax,%rax
  408be0:	0f 84 71 01 00 00    	je     408d57 <dlerror@plt+0x70c7>
  408be6:	48 8d 53 20          	lea    0x20(%rbx),%rdx
  408bea:	48 8d bd 49 20 00 00 	lea    0x2049(%rbp),%rdi
  408bf1:	4c 89 e6             	mov    %r12,%rsi
  408bf4:	e8 b7 d2 ff ff       	call   405eb0 <dlerror@plt+0x4220>
  408bf9:	48 85 c0             	test   %rax,%rax
  408bfc:	0f 84 70 01 00 00    	je     408d72 <dlerror@plt+0x70e2>
  408c02:	48 8d 53 40          	lea    0x40(%rbx),%rdx
  408c06:	48 8d bd 49 30 00 00 	lea    0x3049(%rbp),%rdi
  408c0d:	4c 89 e6             	mov    %r12,%rsi
  408c10:	e8 9b d2 ff ff       	call   405eb0 <dlerror@plt+0x4220>
  408c15:	48 85 c0             	test   %rax,%rax
  408c18:	0f 84 6f 01 00 00    	je     408d8d <dlerror@plt+0x70fd>
  408c1e:	48 8d 53 50          	lea    0x50(%rbx),%rdx
  408c22:	48 8d bd 49 40 00 00 	lea    0x4049(%rbp),%rdi
  408c29:	4c 89 e6             	mov    %r12,%rsi
  408c2c:	e8 7f d2 ff ff       	call   405eb0 <dlerror@plt+0x4220>
  408c31:	48 85 c0             	test   %rax,%rax
  408c34:	0f 84 71 01 00 00    	je     408dab <dlerror@plt+0x711b>
  408c3a:	44 8b 73 60          	mov    0x60(%rbx),%r14d
  408c3e:	bf 01 00 00 00       	mov    $0x1,%edi
  408c43:	41 0f ce             	bswap  %r14d
  408c46:	41 8d 76 01          	lea    0x1(%r14),%esi
  408c4a:	44 89 b5 58 50 00 00 	mov    %r14d,0x5058(%rbp)
  408c51:	48 63 f6             	movslq %esi,%rsi
  408c54:	e8 67 8d ff ff       	call   4019c0 <calloc@plt>
  408c59:	44 8b 6b 68          	mov    0x68(%rbx),%r13d
  408c5d:	48 89 85 50 50 00 00 	mov    %rax,0x5050(%rbp)
  408c64:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  408c69:	41 0f cd             	bswap  %r13d
  408c6c:	44 89 ad 68 50 00 00 	mov    %r13d,0x5068(%rbp)
  408c73:	4d 63 ed             	movslq %r13d,%r13
  408c76:	4c 89 ef             	mov    %r13,%rdi
  408c79:	e8 52 8e ff ff       	call   401ad0 <malloc@plt>
  408c7e:	44 8b 63 70          	mov    0x70(%rbx),%r12d
  408c82:	48 89 85 60 50 00 00 	mov    %rax,0x5060(%rbp)
  408c89:	49 89 c7             	mov    %rax,%r15
  408c8c:	41 0f cc             	bswap  %r12d
  408c8f:	44 89 a5 78 50 00 00 	mov    %r12d,0x5078(%rbp)
  408c96:	4d 63 e4             	movslq %r12d,%r12
  408c99:	4c 89 e7             	mov    %r12,%rdi
  408c9c:	e8 2f 8e ff ff       	call   401ad0 <malloc@plt>
  408ca1:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
  408ca6:	4d 85 ff             	test   %r15,%r15
  408ca9:	48 89 c1             	mov    %rax,%rcx
  408cac:	0f 94 c2             	sete   %dl
  408caf:	48 89 85 70 50 00 00 	mov    %rax,0x5070(%rbp)
  408cb6:	4d 85 c0             	test   %r8,%r8
  408cb9:	0f 94 c0             	sete   %al
  408cbc:	08 c2                	or     %al,%dl
  408cbe:	75 70                	jne    408d30 <dlerror@plt+0x70a0>
  408cc0:	48 85 c9             	test   %rcx,%rcx
  408cc3:	74 6b                	je     408d30 <dlerror@plt+0x70a0>
  408cc5:	8b 73 64             	mov    0x64(%rbx),%esi
  408cc8:	4c 89 c7             	mov    %r8,%rdi
  408ccb:	49 63 d6             	movslq %r14d,%rdx
  408cce:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  408cd3:	0f ce                	bswap  %esi
  408cd5:	89 f6                	mov    %esi,%esi
  408cd7:	48 01 de             	add    %rbx,%rsi
  408cda:	e8 61 8d ff ff       	call   401a40 <memcpy@plt>
  408cdf:	8b 73 6c             	mov    0x6c(%rbx),%esi
  408ce2:	4c 89 ea             	mov    %r13,%rdx
  408ce5:	4c 89 ff             	mov    %r15,%rdi
  408ce8:	0f ce                	bswap  %esi
  408cea:	89 f6                	mov    %esi,%esi
  408cec:	48 01 de             	add    %rbx,%rsi
  408cef:	e8 4c 8d ff ff       	call   401a40 <memcpy@plt>
  408cf4:	8b 73 74             	mov    0x74(%rbx),%esi
  408cf7:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  408cfc:	4c 89 e2             	mov    %r12,%rdx
  408cff:	0f ce                	bswap  %esi
  408d01:	48 89 cf             	mov    %rcx,%rdi
  408d04:	89 f6                	mov    %esi,%esi
  408d06:	48 01 de             	add    %rbx,%rsi
  408d09:	e8 32 8d ff ff       	call   401a40 <memcpy@plt>
  408d0e:	48 89 df             	mov    %rbx,%rdi
  408d11:	e8 aa 8a ff ff       	call   4017c0 <free@plt>
  408d16:	31 c0                	xor    %eax,%eax
  408d18:	48 83 c4 18          	add    $0x18,%rsp
  408d1c:	5b                   	pop    %rbx
  408d1d:	5d                   	pop    %rbp
  408d1e:	41 5c                	pop    %r12
  408d20:	41 5d                	pop    %r13
  408d22:	41 5e                	pop    %r14
  408d24:	41 5f                	pop    %r15
  408d26:	c3                   	ret
  408d27:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  408d2e:	00 00 
  408d30:	48 8d 3d d9 38 00 00 	lea    0x38d9(%rip),%rdi        # 40c610 <dlerror@plt+0xa980>
  408d37:	31 c0                	xor    %eax,%eax
  408d39:	e8 b2 b7 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  408d3e:	48 89 df             	mov    %rbx,%rdi
  408d41:	e8 7a 8a ff ff       	call   4017c0 <free@plt>
  408d46:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  408d4b:	eb cb                	jmp    408d18 <dlerror@plt+0x7088>
  408d4d:	0f 1f 00             	nopl   (%rax)
  408d50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  408d55:	eb c1                	jmp    408d18 <dlerror@plt+0x7088>
  408d57:	48 8d 3d 82 37 00 00 	lea    0x3782(%rip),%rdi        # 40c4e0 <dlerror@plt+0xa850>
  408d5e:	e8 cd b6 ff ff       	call   404430 <dlerror@plt+0x27a0>
  408d63:	48 89 df             	mov    %rbx,%rdi
  408d66:	e8 55 8a ff ff       	call   4017c0 <free@plt>
  408d6b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  408d70:	eb a6                	jmp    408d18 <dlerror@plt+0x7088>
  408d72:	48 8d 3d af 37 00 00 	lea    0x37af(%rip),%rdi        # 40c528 <dlerror@plt+0xa898>
  408d79:	e8 b2 b6 ff ff       	call   404430 <dlerror@plt+0x27a0>
  408d7e:	48 89 df             	mov    %rbx,%rdi
  408d81:	e8 3a 8a ff ff       	call   4017c0 <free@plt>
  408d86:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  408d8b:	eb 8b                	jmp    408d18 <dlerror@plt+0x7088>
  408d8d:	48 8d 3d dc 37 00 00 	lea    0x37dc(%rip),%rdi        # 40c570 <dlerror@plt+0xa8e0>
  408d94:	e8 97 b6 ff ff       	call   404430 <dlerror@plt+0x27a0>
  408d99:	48 89 df             	mov    %rbx,%rdi
  408d9c:	e8 1f 8a ff ff       	call   4017c0 <free@plt>
  408da1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  408da6:	e9 6d ff ff ff       	jmp    408d18 <dlerror@plt+0x7088>
  408dab:	48 8d 3d 0e 38 00 00 	lea    0x380e(%rip),%rdi        # 40c5c0 <dlerror@plt+0xa930>
  408db2:	e8 79 b6 ff ff       	call   404430 <dlerror@plt+0x27a0>
  408db7:	48 89 df             	mov    %rbx,%rdi
  408dba:	e8 01 8a ff ff       	call   4017c0 <free@plt>
  408dbf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  408dc4:	e9 4f ff ff ff       	jmp    408d18 <dlerror@plt+0x7088>
  408dc9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  408dd0:	41 57                	push   %r15
  408dd2:	41 56                	push   %r14
  408dd4:	41 55                	push   %r13
  408dd6:	41 54                	push   %r12
  408dd8:	55                   	push   %rbp
  408dd9:	53                   	push   %rbx
  408dda:	48 81 ec 28 10 00 00 	sub    $0x1028,%rsp
  408de1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  408de8:	00 00 
  408dea:	48 89 84 24 18 10 00 	mov    %rax,0x1018(%rsp)
  408df1:	00 
  408df2:	31 c0                	xor    %eax,%eax
  408df4:	80 be 38 20 00 00 00 	cmpb   $0x0,0x2038(%rsi)
  408dfb:	48 89 3c 24          	mov    %rdi,(%rsp)
  408dff:	0f 84 1b 01 00 00    	je     408f20 <dlerror@plt+0x7290>
  408e05:	8b bf 78 50 00 00    	mov    0x5078(%rdi),%edi
  408e0b:	85 ff                	test   %edi,%edi
  408e0d:	0f 84 0d 01 00 00    	je     408f20 <dlerror@plt+0x7290>
  408e13:	48 8b 86 20 20 00 00 	mov    0x2020(%rsi),%rax
  408e1a:	49 89 f5             	mov    %rsi,%r13
  408e1d:	31 ed                	xor    %ebp,%ebp
  408e1f:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
  408e24:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  408e29:	e9 b3 00 00 00       	jmp    408ee1 <dlerror@plt+0x7251>
  408e2e:	66 90                	xchg   %ax,%ax
  408e30:	4d 8d bd 3b 20 00 00 	lea    0x203b(%r13),%r15
  408e37:	53                   	push   %rbx
  408e38:	4c 8d 05 29 2a 00 00 	lea    0x2a29(%rip),%r8        # 40b868 <dlerror@plt+0x9bd8>
  408e3f:	6a 2f                	push   $0x2f
  408e41:	b9 00 10 00 00       	mov    $0x1000,%ecx
  408e46:	ba 01 00 00 00       	mov    $0x1,%edx
  408e4b:	31 c0                	xor    %eax,%eax
  408e4d:	4d 89 f9             	mov    %r15,%r9
  408e50:	be 00 10 00 00       	mov    $0x1000,%esi
  408e55:	4c 89 e7             	mov    %r12,%rdi
  408e58:	e8 43 89 ff ff       	call   4017a0 <__snprintf_chk@plt>
  408e5d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  408e62:	5a                   	pop    %rdx
  408e63:	59                   	pop    %rcx
  408e64:	0f 8f e6 00 00 00    	jg     408f50 <dlerror@plt+0x72c0>
  408e6a:	4c 89 e7             	mov    %r12,%rdi
  408e6d:	e8 de d0 ff ff       	call   405f50 <dlerror@plt+0x42c0>
  408e72:	83 f8 01             	cmp    $0x1,%eax
  408e75:	75 1f                	jne    408e96 <dlerror@plt+0x7206>
  408e77:	31 c0                	xor    %eax,%eax
  408e79:	41 80 bd 48 30 00 00 	cmpb   $0x0,0x3048(%r13)
  408e80:	00 
  408e81:	4c 89 e6             	mov    %r12,%rsi
  408e84:	48 8d 3d 35 38 00 00 	lea    0x3835(%rip),%rdi        # 40c6c0 <dlerror@plt+0xaa30>
  408e8b:	0f 85 0f 01 00 00    	jne    408fa0 <dlerror@plt+0x7310>
  408e91:	e8 9a b5 ff ff       	call   404430 <dlerror@plt+0x27a0>
  408e96:	48 89 da             	mov    %rbx,%rdx
  408e99:	4c 89 fe             	mov    %r15,%rsi
  408e9c:	4c 89 ef             	mov    %r13,%rdi
  408e9f:	e8 8c 05 00 00       	call   409430 <dlerror@plt+0x77a0>
  408ea4:	85 c0                	test   %eax,%eax
  408ea6:	0f 88 bc 00 00 00    	js     408f68 <dlerror@plt+0x72d8>
  408eac:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  408eb1:	4c 89 e2             	mov    %r12,%rdx
  408eb4:	4c 89 f6             	mov    %r14,%rsi
  408eb7:	e8 44 94 ff ff       	call   402300 <dlerror@plt+0x670>
  408ebc:	85 c0                	test   %eax,%eax
  408ebe:	0f 85 bc 00 00 00    	jne    408f80 <dlerror@plt+0x72f0>
  408ec4:	48 89 df             	mov    %rbx,%rdi
  408ec7:	e8 14 8a ff ff       	call   4018e0 <strlen@plt>
  408ecc:	48 8d 6c 05 01       	lea    0x1(%rbp,%rax,1),%rbp
  408ed1:	48 8b 04 24          	mov    (%rsp),%rax
  408ed5:	48 63 80 78 50 00 00 	movslq 0x5078(%rax),%rax
  408edc:	48 39 e8             	cmp    %rbp,%rax
  408edf:	76 3f                	jbe    408f20 <dlerror@plt+0x7290>
  408ee1:	48 8b 04 24          	mov    (%rsp),%rax
  408ee5:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  408eea:	48 8b 98 70 50 00 00 	mov    0x5070(%rax),%rbx
  408ef1:	48 01 eb             	add    %rbp,%rbx
  408ef4:	48 89 de             	mov    %rbx,%rsi
  408ef7:	e8 64 9a ff ff       	call   402960 <dlerror@plt+0xcd0>
  408efc:	48 85 c0             	test   %rax,%rax
  408eff:	49 89 c6             	mov    %rax,%r14
  408f02:	0f 85 28 ff ff ff    	jne    408e30 <dlerror@plt+0x71a0>
  408f08:	48 8d 3d 39 37 00 00 	lea    0x3739(%rip),%rdi        # 40c648 <dlerror@plt+0xa9b8>
  408f0f:	31 c0                	xor    %eax,%eax
  408f11:	48 89 de             	mov    %rbx,%rsi
  408f14:	e8 d7 b5 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  408f19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  408f1e:	eb 02                	jmp    408f22 <dlerror@plt+0x7292>
  408f20:	31 c0                	xor    %eax,%eax
  408f22:	48 8b 8c 24 18 10 00 	mov    0x1018(%rsp),%rcx
  408f29:	00 
  408f2a:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  408f31:	00 00 
  408f33:	75 7a                	jne    408faf <dlerror@plt+0x731f>
  408f35:	48 81 c4 28 10 00 00 	add    $0x1028,%rsp
  408f3c:	5b                   	pop    %rbx
  408f3d:	5d                   	pop    %rbp
  408f3e:	41 5c                	pop    %r12
  408f40:	41 5d                	pop    %r13
  408f42:	41 5e                	pop    %r14
  408f44:	41 5f                	pop    %r15
  408f46:	c3                   	ret
  408f47:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  408f4e:	00 00 
  408f50:	48 8d 3d 29 37 00 00 	lea    0x3729(%rip),%rdi        # 40c680 <dlerror@plt+0xa9f0>
  408f57:	31 c0                	xor    %eax,%eax
  408f59:	e8 92 b5 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  408f5e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  408f63:	eb bd                	jmp    408f22 <dlerror@plt+0x7292>
  408f65:	0f 1f 00             	nopl   (%rax)
  408f68:	48 8d 3d 81 37 00 00 	lea    0x3781(%rip),%rdi        # 40c6f0 <dlerror@plt+0xaa60>
  408f6f:	31 c0                	xor    %eax,%eax
  408f71:	e8 7a b5 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  408f76:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  408f7b:	eb a5                	jmp    408f22 <dlerror@plt+0x7292>
  408f7d:	0f 1f 00             	nopl   (%rax)
  408f80:	49 8d 76 12          	lea    0x12(%r14),%rsi
  408f84:	48 8d 3d 9d 37 00 00 	lea    0x379d(%rip),%rdi        # 40c728 <dlerror@plt+0xaa98>
  408f8b:	31 c0                	xor    %eax,%eax
  408f8d:	e8 5e b5 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  408f92:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  408f97:	eb 89                	jmp    408f22 <dlerror@plt+0x7292>
  408f99:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  408fa0:	e8 4b b5 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  408fa5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  408faa:	e9 73 ff ff ff       	jmp    408f22 <dlerror@plt+0x7292>
  408faf:	e8 4c 89 ff ff       	call   401900 <__stack_chk_fail@plt>
  408fb4:	66 90                	xchg   %ax,%ax
  408fb6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  408fbd:	00 00 00 
  408fc0:	41 56                	push   %r14
  408fc2:	41 55                	push   %r13
  408fc4:	41 54                	push   %r12
  408fc6:	55                   	push   %rbp
  408fc7:	53                   	push   %rbx
  408fc8:	4c 63 af 78 50 00 00 	movslq 0x5078(%rdi),%r13
  408fcf:	4d 85 ed             	test   %r13,%r13
  408fd2:	74 4c                	je     409020 <dlerror@plt+0x7390>
  408fd4:	49 89 f4             	mov    %rsi,%r12
  408fd7:	4c 8b b7 70 50 00 00 	mov    0x5070(%rdi),%r14
  408fde:	31 db                	xor    %ebx,%ebx
  408fe0:	eb 18                	jmp    408ffa <dlerror@plt+0x736a>
  408fe2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  408fe8:	48 89 ef             	mov    %rbp,%rdi
  408feb:	e8 f0 88 ff ff       	call   4018e0 <strlen@plt>
  408ff0:	48 8d 5c 03 01       	lea    0x1(%rbx,%rax,1),%rbx
  408ff5:	4c 39 eb             	cmp    %r13,%rbx
  408ff8:	73 26                	jae    409020 <dlerror@plt+0x7390>
  408ffa:	49 8d 2c 1e          	lea    (%r14,%rbx,1),%rbp
  408ffe:	4c 89 e6             	mov    %r12,%rsi
  409001:	48 89 ef             	mov    %rbp,%rdi
  409004:	e8 c7 89 ff ff       	call   4019d0 <strcmp@plt>
  409009:	85 c0                	test   %eax,%eax
  40900b:	75 db                	jne    408fe8 <dlerror@plt+0x7358>
  40900d:	5b                   	pop    %rbx
  40900e:	b8 01 00 00 00       	mov    $0x1,%eax
  409013:	5d                   	pop    %rbp
  409014:	41 5c                	pop    %r12
  409016:	41 5d                	pop    %r13
  409018:	41 5e                	pop    %r14
  40901a:	c3                   	ret
  40901b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  409020:	5b                   	pop    %rbx
  409021:	31 c0                	xor    %eax,%eax
  409023:	5d                   	pop    %rbp
  409024:	41 5c                	pop    %r12
  409026:	41 5d                	pop    %r13
  409028:	41 5e                	pop    %r14
  40902a:	c3                   	ret
  40902b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  409030:	53                   	push   %rbx
  409031:	48 8d b7 49 20 00 00 	lea    0x2049(%rdi),%rsi
  409038:	48 89 fb             	mov    %rdi,%rbx
  40903b:	48 81 c7 49 10 00 00 	add    $0x1049,%rdi
  409042:	e8 39 a8 ff ff       	call   403880 <dlerror@plt+0x1bf0>
  409047:	48 85 c0             	test   %rax,%rax
  40904a:	48 89 83 80 50 00 00 	mov    %rax,0x5080(%rbx)
  409051:	74 04                	je     409057 <dlerror@plt+0x73c7>
  409053:	31 c0                	xor    %eax,%eax
  409055:	5b                   	pop    %rbx
  409056:	c3                   	ret
  409057:	48 8d 3d fa 36 00 00 	lea    0x36fa(%rip),%rdi        # 40c758 <dlerror@plt+0xaac8>
  40905e:	e8 8d b4 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  409063:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  409068:	5b                   	pop    %rbx
  409069:	c3                   	ret
  40906a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  409070:	53                   	push   %rbx
  409071:	be 88 50 00 00       	mov    $0x5088,%esi
  409076:	bf 01 00 00 00       	mov    $0x1,%edi
  40907b:	e8 40 89 ff ff       	call   4019c0 <calloc@plt>
  409080:	48 85 c0             	test   %rax,%rax
  409083:	48 89 c3             	mov    %rax,%rbx
  409086:	74 08                	je     409090 <dlerror@plt+0x7400>
  409088:	48 89 d8             	mov    %rbx,%rax
  40908b:	5b                   	pop    %rbx
  40908c:	c3                   	ret
  40908d:	0f 1f 00             	nopl   (%rax)
  409090:	e8 3b 87 ff ff       	call   4017d0 <__errno_location@plt>
  409095:	8b 30                	mov    (%rax),%esi
  409097:	48 8d 15 f2 36 00 00 	lea    0x36f2(%rip),%rdx        # 40c790 <dlerror@plt+0xab00>
  40909e:	48 8d 3d d3 14 00 00 	lea    0x14d3(%rip),%rdi        # 40a578 <dlerror@plt+0x88e8>
  4090a5:	31 c0                	xor    %eax,%eax
  4090a7:	e8 04 b5 ff ff       	call   4045b0 <dlerror@plt+0x2920>
  4090ac:	48 89 d8             	mov    %rbx,%rax
  4090af:	5b                   	pop    %rbx
  4090b0:	c3                   	ret
  4090b1:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4090b6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4090bd:	00 00 00 
  4090c0:	53                   	push   %rbx
  4090c1:	48 8b 1f             	mov    (%rdi),%rbx
  4090c4:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
  4090cb:	48 85 db             	test   %rbx,%rbx
  4090ce:	74 30                	je     409100 <dlerror@plt+0x7470>
  4090d0:	48 8b bb 50 50 00 00 	mov    0x5050(%rbx),%rdi
  4090d7:	e8 e4 86 ff ff       	call   4017c0 <free@plt>
  4090dc:	48 8b bb 60 50 00 00 	mov    0x5060(%rbx),%rdi
  4090e3:	e8 d8 86 ff ff       	call   4017c0 <free@plt>
  4090e8:	48 8b bb 70 50 00 00 	mov    0x5070(%rbx),%rdi
  4090ef:	e8 cc 86 ff ff       	call   4017c0 <free@plt>
  4090f4:	48 89 df             	mov    %rbx,%rdi
  4090f7:	5b                   	pop    %rbx
  4090f8:	e9 c3 86 ff ff       	jmp    4017c0 <free@plt>
  4090fd:	0f 1f 00             	nopl   (%rax)
  409100:	5b                   	pop    %rbx
  409101:	c3                   	ret
  409102:	0f 1f 40 00          	nopl   0x0(%rax)
  409106:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40910d:	00 00 00 
  409110:	41 57                	push   %r15
  409112:	41 56                	push   %r14
  409114:	49 89 ff             	mov    %rdi,%r15
  409117:	41 55                	push   %r13
  409119:	41 54                	push   %r12
  40911b:	49 89 cd             	mov    %rcx,%r13
  40911e:	55                   	push   %rbp
  40911f:	53                   	push   %rbx
  409120:	48 89 d5             	mov    %rdx,%rbp
  409123:	48 83 ec 38          	sub    $0x38,%rsp
  409127:	4c 8b a7 80 50 00 00 	mov    0x5080(%rdi),%r12
  40912e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  409135:	00 00 
  409137:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  40913c:	31 c0                	xor    %eax,%eax
  40913e:	89 74 24 0c          	mov    %esi,0xc(%rsp)
  409142:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%rsp)
  409149:	00 
  40914a:	41 83 7c 24 10 08    	cmpl   $0x8,0x10(%r12)
  409150:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
  409157:	00 00 
  409159:	0f 8e b9 00 00 00    	jle    409218 <dlerror@plt+0x7588>
  40915f:	bf 40 00 00 00       	mov    $0x40,%edi
  409164:	41 ff 94 24 48 01 00 	call   *0x148(%r12)
  40916b:	00 
  40916c:	48 89 c3             	mov    %rax,%rbx
  40916f:	48 8d 05 5a f3 ff ff 	lea    -0xca6(%rip),%rax        # 4084d0 <dlerror@plt+0x6840>
  409176:	48 89 6b 38          	mov    %rbp,0x38(%rbx)
  40917a:	49 8b af 80 50 00 00 	mov    0x5080(%r15),%rbp
  409181:	4c 89 6b 30          	mov    %r13,0x30(%rbx)
  409185:	4c 8d 74 24 20       	lea    0x20(%rsp),%r14
  40918a:	4d 8d 6f 08          	lea    0x8(%r15),%r13
  40918e:	48 89 03             	mov    %rax,(%rbx)
  409191:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
  409196:	4c 89 ef             	mov    %r13,%rdi
  409199:	4c 89 7b 10          	mov    %r15,0x10(%rbx)
  40919d:	4c 89 73 20          	mov    %r14,0x20(%rbx)
  4091a1:	88 43 18             	mov    %al,0x18(%rbx)
  4091a4:	48 8d 44 24 1c       	lea    0x1c(%rsp),%rax
  4091a9:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4091ad:	ff 55 78             	call   *0x78(%rbp)
  4091b0:	31 d2                	xor    %edx,%edx
  4091b2:	49 8b 7f 40          	mov    0x40(%r15),%rdi
  4091b6:	48 89 de             	mov    %rbx,%rsi
  4091b9:	ff 95 a8 00 00 00    	call   *0xa8(%rbp)
  4091bf:	49 8b 7f 40          	mov    0x40(%r15),%rdi
  4091c3:	ff 95 b0 00 00 00    	call   *0xb0(%rbp)
  4091c9:	80 7c 24 0c 00       	cmpb   $0x0,0xc(%rsp)
  4091ce:	75 60                	jne    409230 <dlerror@plt+0x75a0>
  4091d0:	31 d2                	xor    %edx,%edx
  4091d2:	4c 89 ee             	mov    %r13,%rsi
  4091d5:	4c 89 f7             	mov    %r14,%rdi
  4091d8:	ff 95 a0 00 00 00    	call   *0xa0(%rbp)
  4091de:	4c 89 ef             	mov    %r13,%rdi
  4091e1:	ff 95 80 00 00 00    	call   *0x80(%rbp)
  4091e7:	4c 89 f7             	mov    %r14,%rdi
  4091ea:	41 ff 94 24 90 00 00 	call   *0x90(%r12)
  4091f1:	00 
  4091f2:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  4091f7:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  4091fe:	00 00 
  409200:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  409204:	75 35                	jne    40923b <dlerror@plt+0x75ab>
  409206:	48 83 c4 38          	add    $0x38,%rsp
  40920a:	5b                   	pop    %rbx
  40920b:	5d                   	pop    %rbp
  40920c:	41 5c                	pop    %r12
  40920e:	41 5d                	pop    %r13
  409210:	41 5e                	pop    %r14
  409212:	41 5f                	pop    %r15
  409214:	c3                   	ret
  409215:	0f 1f 00             	nopl   (%rax)
  409218:	bf 40 00 00 00       	mov    $0x40,%edi
  40921d:	41 ff 94 24 40 01 00 	call   *0x140(%r12)
  409224:	00 
  409225:	48 89 c3             	mov    %rax,%rbx
  409228:	e9 42 ff ff ff       	jmp    40916f <dlerror@plt+0x74df>
  40922d:	0f 1f 00             	nopl   (%rax)
  409230:	4c 89 ef             	mov    %r13,%rdi
  409233:	ff 95 80 00 00 00    	call   *0x80(%rbp)
  409239:	eb b7                	jmp    4091f2 <dlerror@plt+0x7562>
  40923b:	e8 c0 86 ff ff       	call   401900 <__stack_chk_fail@plt>
  409240:	48 85 ff             	test   %rdi,%rdi
  409243:	0f 84 8f 00 00 00    	je     4092d8 <dlerror@plt+0x7648>
  409249:	41 55                	push   %r13
  40924b:	41 54                	push   %r12
  40924d:	55                   	push   %rbp
  40924e:	53                   	push   %rbx
  40924f:	48 83 ec 08          	sub    $0x8,%rsp
  409253:	48 8b af 80 50 00 00 	mov    0x5080(%rdi),%rbp
  40925a:	48 85 ed             	test   %rbp,%rbp
  40925d:	74 66                	je     4092c5 <dlerror@plt+0x7635>
  40925f:	4c 8d 67 28          	lea    0x28(%rdi),%r12
  409263:	48 89 fb             	mov    %rdi,%rbx
  409266:	4c 89 e7             	mov    %r12,%rdi
  409269:	ff 55 78             	call   *0x78(%rbp)
  40926c:	48 83 7b 38 00       	cmpq   $0x0,0x38(%rbx)
  409271:	75 6d                	jne    4092e0 <dlerror@plt+0x7650>
  409273:	4c 89 e7             	mov    %r12,%rdi
  409276:	ff 95 80 00 00 00    	call   *0x80(%rbp)
  40927c:	80 7b 48 00          	cmpb   $0x0,0x48(%rbx)
  409280:	74 0e                	je     409290 <dlerror@plt+0x7600>
  409282:	48 8b 7b 40          	mov    0x40(%rbx),%rdi
  409286:	48 85 ff             	test   %rdi,%rdi
  409289:	74 05                	je     409290 <dlerror@plt+0x7600>
  40928b:	31 f6                	xor    %esi,%esi
  40928d:	ff 55 70             	call   *0x70(%rbp)
  409290:	48 89 df             	mov    %rbx,%rdi
  409293:	ff 95 88 00 00 00    	call   *0x88(%rbp)
  409299:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
  40929d:	ff 95 88 00 00 00    	call   *0x88(%rbp)
  4092a3:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
  4092a7:	ff 95 88 00 00 00    	call   *0x88(%rbp)
  4092ad:	4c 89 e7             	mov    %r12,%rdi
  4092b0:	ff 95 88 00 00 00    	call   *0x88(%rbp)
  4092b6:	ff 55 40             	call   *0x40(%rbp)
  4092b9:	48 8d bb 80 50 00 00 	lea    0x5080(%rbx),%rdi
  4092c0:	e8 7b a5 ff ff       	call   403840 <dlerror@plt+0x1bb0>
  4092c5:	48 83 c4 08          	add    $0x8,%rsp
  4092c9:	31 c0                	xor    %eax,%eax
  4092cb:	5b                   	pop    %rbx
  4092cc:	5d                   	pop    %rbp
  4092cd:	41 5c                	pop    %r12
  4092cf:	41 5d                	pop    %r13
  4092d1:	c3                   	ret
  4092d2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4092d8:	31 c0                	xor    %eax,%eax
  4092da:	c3                   	ret
  4092db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4092e0:	4c 8d 6b 20          	lea    0x20(%rbx),%r13
  4092e4:	31 c9                	xor    %ecx,%ecx
  4092e6:	31 d2                	xor    %edx,%edx
  4092e8:	48 89 df             	mov    %rbx,%rdi
  4092eb:	c6 43 30 01          	movb   $0x1,0x30(%rbx)
  4092ef:	be 01 00 00 00       	mov    $0x1,%esi
  4092f4:	e8 17 fe ff ff       	call   409110 <dlerror@plt+0x7480>
  4092f9:	31 d2                	xor    %edx,%edx
  4092fb:	4c 89 e6             	mov    %r12,%rsi
  4092fe:	4c 89 ef             	mov    %r13,%rdi
  409301:	ff 95 a0 00 00 00    	call   *0xa0(%rbp)
  409307:	4c 89 e7             	mov    %r12,%rdi
  40930a:	ff 95 80 00 00 00    	call   *0x80(%rbp)
  409310:	4c 89 ef             	mov    %r13,%rdi
  409313:	ff 95 90 00 00 00    	call   *0x90(%rbp)
  409319:	e9 5e ff ff ff       	jmp    40927c <dlerror@plt+0x75ec>
  40931e:	66 90                	xchg   %ax,%ax
  409320:	41 55                	push   %r13
  409322:	41 54                	push   %r12
  409324:	55                   	push   %rbp
  409325:	53                   	push   %rbx
  409326:	48 83 ec 08          	sub    $0x8,%rsp
  40932a:	48 8b af 80 50 00 00 	mov    0x5080(%rdi),%rbp
  409331:	48 85 ed             	test   %rbp,%rbp
  409334:	0f 84 c1 00 00 00    	je     4093fb <dlerror@plt+0x776b>
  40933a:	49 89 f4             	mov    %rsi,%r12
  40933d:	48 89 fb             	mov    %rdi,%rbx
  409340:	ff 55 78             	call   *0x78(%rbp)
  409343:	4c 89 e7             	mov    %r12,%rdi
  409346:	ff 55 30             	call   *0x30(%rbp)
  409349:	83 7d 10 08          	cmpl   $0x8,0x10(%rbp)
  40934d:	c6 43 48 01          	movb   $0x1,0x48(%rbx)
  409351:	48 8d 7b 40          	lea    0x40(%rbx),%rdi
  409355:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  40935b:	7f 63                	jg     4093c0 <dlerror@plt+0x7730>
  40935d:	31 c9                	xor    %ecx,%ecx
  40935f:	48 89 da             	mov    %rbx,%rdx
  409362:	48 8d 35 17 f3 ff ff 	lea    -0xce9(%rip),%rsi        # 408680 <dlerror@plt+0x69f0>
  409369:	ff 55 58             	call   *0x58(%rbp)
  40936c:	41 89 c5             	mov    %eax,%r13d
  40936f:	45 85 ed             	test   %r13d,%r13d
  409372:	75 60                	jne    4093d4 <dlerror@plt+0x7744>
  409374:	4c 8d 63 10          	lea    0x10(%rbx),%r12
  409378:	4c 89 e7             	mov    %r12,%rdi
  40937b:	ff 55 78             	call   *0x78(%rbp)
  40937e:	48 89 df             	mov    %rbx,%rdi
  409381:	48 83 c3 18          	add    $0x18,%rbx
  409385:	ff 95 80 00 00 00    	call   *0x80(%rbp)
  40938b:	31 d2                	xor    %edx,%edx
  40938d:	4c 89 e6             	mov    %r12,%rsi
  409390:	48 89 df             	mov    %rbx,%rdi
  409393:	ff 95 a0 00 00 00    	call   *0xa0(%rbp)
  409399:	4c 89 e7             	mov    %r12,%rdi
  40939c:	ff 95 80 00 00 00    	call   *0x80(%rbp)
  4093a2:	48 89 df             	mov    %rbx,%rdi
  4093a5:	ff 95 90 00 00 00    	call   *0x90(%rbp)
  4093ab:	48 83 c4 08          	add    $0x8,%rsp
  4093af:	44 89 e8             	mov    %r13d,%eax
  4093b2:	5b                   	pop    %rbx
  4093b3:	5d                   	pop    %rbp
  4093b4:	41 5c                	pop    %r12
  4093b6:	41 5d                	pop    %r13
  4093b8:	c3                   	ret
  4093b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4093c0:	31 c9                	xor    %ecx,%ecx
  4093c2:	48 89 da             	mov    %rbx,%rdx
  4093c5:	48 8d 35 b4 f2 ff ff 	lea    -0xd4c(%rip),%rsi        # 408680 <dlerror@plt+0x69f0>
  4093cc:	ff 55 60             	call   *0x60(%rbp)
  4093cf:	41 89 c5             	mov    %eax,%r13d
  4093d2:	eb 9b                	jmp    40936f <dlerror@plt+0x76df>
  4093d4:	48 8d 3d e5 33 00 00 	lea    0x33e5(%rip),%rdi        # 40c7c0 <dlerror@plt+0xab30>
  4093db:	31 c0                	xor    %eax,%eax
  4093dd:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  4093e3:	e8 08 b1 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  4093e8:	48 89 df             	mov    %rbx,%rdi
  4093eb:	ff 95 80 00 00 00    	call   *0x80(%rbp)
  4093f1:	48 89 df             	mov    %rbx,%rdi
  4093f4:	e8 47 fe ff ff       	call   409240 <dlerror@plt+0x75b0>
  4093f9:	eb b0                	jmp    4093ab <dlerror@plt+0x771b>
  4093fb:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  409401:	eb a8                	jmp    4093ab <dlerror@plt+0x771b>
  409403:	0f 1f 00             	nopl   (%rax)
  409406:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40940d:	00 00 00 
  409410:	48 8d 0d 29 f1 ff ff 	lea    -0xed7(%rip),%rcx        # 408540 <dlerror@plt+0x68b0>
  409417:	48 89 f2             	mov    %rsi,%rdx
  40941a:	be 01 00 00 00       	mov    $0x1,%esi
  40941f:	e9 ec fc ff ff       	jmp    409110 <dlerror@plt+0x7480>
  409424:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40942b:	00 00 00 
  40942e:	66 90                	xchg   %ax,%ax
  409430:	41 57                	push   %r15
  409432:	41 56                	push   %r14
  409434:	48 89 f7             	mov    %rsi,%rdi
  409437:	41 55                	push   %r13
  409439:	41 54                	push   %r12
  40943b:	55                   	push   %rbp
  40943c:	53                   	push   %rbx
  40943d:	48 89 d5             	mov    %rdx,%rbp
  409440:	48 89 f3             	mov    %rsi,%rbx
  409443:	48 81 ec 18 10 00 00 	sub    $0x1018,%rsp
  40944a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  409451:	00 00 
  409453:	48 89 84 24 08 10 00 	mov    %rax,0x1008(%rsp)
  40945a:	00 
  40945b:	31 c0                	xor    %eax,%eax
  40945d:	e8 7e 84 ff ff       	call   4018e0 <strlen@plt>
  409462:	48 89 ef             	mov    %rbp,%rdi
  409465:	49 89 c4             	mov    %rax,%r12
  409468:	e8 73 84 ff ff       	call   4018e0 <strlen@plt>
  40946d:	49 8d 44 04 01       	lea    0x1(%r12,%rax,1),%rax
  409472:	48 3d ff 0f 00 00    	cmp    $0xfff,%rax
  409478:	0f 87 be 00 00 00    	ja     40953c <dlerror@plt+0x78ac>
  40947e:	49 89 e4             	mov    %rsp,%r12
  409481:	48 83 ec 08          	sub    $0x8,%rsp
  409485:	4c 8d 05 72 33 00 00 	lea    0x3372(%rip),%r8        # 40c7fe <dlerror@plt+0xab6e>
  40948c:	6a 2f                	push   $0x2f
  40948e:	49 89 d9             	mov    %rbx,%r9
  409491:	b9 00 10 00 00       	mov    $0x1000,%ecx
  409496:	ba 01 00 00 00       	mov    $0x1,%edx
  40949b:	be 00 10 00 00       	mov    $0x1000,%esi
  4094a0:	4c 89 e7             	mov    %r12,%rdi
  4094a3:	31 c0                	xor    %eax,%eax
  4094a5:	41 be 00 10 00 00    	mov    $0x1000,%r14d
  4094ab:	4c 8d 3d 51 33 00 00 	lea    0x3351(%rip),%r15        # 40c803 <dlerror@plt+0xab73>
  4094b2:	e8 e9 82 ff ff       	call   4017a0 <__snprintf_chk@plt>
  4094b7:	be 2f 00 00 00       	mov    $0x2f,%esi
  4094bc:	4c 63 e8             	movslq %eax,%r13
  4094bf:	48 89 ef             	mov    %rbp,%rdi
  4094c2:	e8 59 84 ff ff       	call   401920 <strchr@plt>
  4094c7:	4d 29 ee             	sub    %r13,%r14
  4094ca:	4d 01 e5             	add    %r12,%r13
  4094cd:	48 85 c0             	test   %rax,%rax
  4094d0:	5e                   	pop    %rsi
  4094d1:	48 89 c3             	mov    %rax,%rbx
  4094d4:	5f                   	pop    %rdi
  4094d5:	75 1f                	jne    4094f6 <dlerror@plt+0x7866>
  4094d7:	eb 6f                	jmp    409548 <dlerror@plt+0x78b8>
  4094d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4094e0:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
  4094e4:	be 2f 00 00 00       	mov    $0x2f,%esi
  4094e9:	e8 32 84 ff ff       	call   401920 <strchr@plt>
  4094ee:	48 85 c0             	test   %rax,%rax
  4094f1:	48 89 c3             	mov    %rax,%rbx
  4094f4:	74 52                	je     409548 <dlerror@plt+0x78b8>
  4094f6:	48 83 ec 08          	sub    $0x8,%rsp
  4094fa:	41 89 d9             	mov    %ebx,%r9d
  4094fd:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  409504:	55                   	push   %rbp
  409505:	41 29 e9             	sub    %ebp,%r9d
  409508:	ba 01 00 00 00       	mov    $0x1,%edx
  40950d:	4d 89 f8             	mov    %r15,%r8
  409510:	4c 89 f6             	mov    %r14,%rsi
  409513:	4c 89 ef             	mov    %r13,%rdi
  409516:	31 c0                	xor    %eax,%eax
  409518:	e8 83 82 ff ff       	call   4017a0 <__snprintf_chk@plt>
  40951d:	4c 89 e7             	mov    %r12,%rdi
  409520:	e8 2b ca ff ff       	call   405f50 <dlerror@plt+0x42c0>
  409525:	85 c0                	test   %eax,%eax
  409527:	5a                   	pop    %rdx
  409528:	59                   	pop    %rcx
  409529:	75 b5                	jne    4094e0 <dlerror@plt+0x7850>
  40952b:	be c0 01 00 00       	mov    $0x1c0,%esi
  409530:	4c 89 e7             	mov    %r12,%rdi
  409533:	e8 08 83 ff ff       	call   401840 <mkdir@plt>
  409538:	85 c0                	test   %eax,%eax
  40953a:	79 a4                	jns    4094e0 <dlerror@plt+0x7850>
  40953c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  409541:	eb 07                	jmp    40954a <dlerror@plt+0x78ba>
  409543:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  409548:	31 c0                	xor    %eax,%eax
  40954a:	48 8b 8c 24 08 10 00 	mov    0x1008(%rsp),%rcx
  409551:	00 
  409552:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  409559:	00 00 
  40955b:	75 12                	jne    40956f <dlerror@plt+0x78df>
  40955d:	48 81 c4 18 10 00 00 	add    $0x1018,%rsp
  409564:	5b                   	pop    %rbx
  409565:	5d                   	pop    %rbp
  409566:	41 5c                	pop    %r12
  409568:	41 5d                	pop    %r13
  40956a:	41 5e                	pop    %r14
  40956c:	41 5f                	pop    %r15
  40956e:	c3                   	ret
  40956f:	e8 8c 83 ff ff       	call   401900 <__stack_chk_fail@plt>
  409574:	66 90                	xchg   %ax,%ax
  409576:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40957d:	00 00 00 
  409580:	41 56                	push   %r14
  409582:	41 55                	push   %r13
  409584:	49 89 fd             	mov    %rdi,%r13
  409587:	41 54                	push   %r12
  409589:	55                   	push   %rbp
  40958a:	53                   	push   %rbx
  40958b:	48 89 f3             	mov    %rsi,%rbx
  40958e:	48 8d 35 ac 0f 00 00 	lea    0xfac(%rip),%rsi        # 40a541 <dlerror@plt+0x88b1>
  409595:	48 81 ec a0 10 00 00 	sub    $0x10a0,%rsp
  40959c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4095a3:	00 00 
  4095a5:	48 89 84 24 98 10 00 	mov    %rax,0x1098(%rsp)
  4095ac:	00 
  4095ad:	31 c0                	xor    %eax,%eax
  4095af:	e8 1c 86 ff ff       	call   401bd0 <fopen@plt>
  4095b4:	48 85 c0             	test   %rax,%rax
  4095b7:	0f 84 2e 01 00 00    	je     4096eb <dlerror@plt+0x7a5b>
  4095bd:	48 8d 35 8c 0f 00 00 	lea    0xf8c(%rip),%rsi        # 40a550 <dlerror@plt+0x88c0>
  4095c4:	48 89 df             	mov    %rbx,%rdi
  4095c7:	48 89 c5             	mov    %rax,%rbp
  4095ca:	e8 01 86 ff ff       	call   401bd0 <fopen@plt>
  4095cf:	48 85 c0             	test   %rax,%rax
  4095d2:	48 89 c3             	mov    %rax,%rbx
  4095d5:	0f 84 18 01 00 00    	je     4096f3 <dlerror@plt+0x7a63>
  4095db:	4c 8d a4 24 90 00 00 	lea    0x90(%rsp),%r12
  4095e2:	00 
  4095e3:	eb 4d                	jmp    409632 <dlerror@plt+0x79a2>
  4095e5:	0f 1f 00             	nopl   (%rax)
  4095e8:	48 89 e9             	mov    %rbp,%rcx
  4095eb:	ba 00 10 00 00       	mov    $0x1000,%edx
  4095f0:	be 01 00 00 00       	mov    $0x1,%esi
  4095f5:	4c 89 e7             	mov    %r12,%rdi
  4095f8:	e8 63 82 ff ff       	call   401860 <fread@plt>
  4095fd:	48 85 c0             	test   %rax,%rax
  409600:	0f 84 c2 00 00 00    	je     4096c8 <dlerror@plt+0x7a38>
  409606:	48 89 d9             	mov    %rbx,%rcx
  409609:	48 89 c2             	mov    %rax,%rdx
  40960c:	be 01 00 00 00       	mov    $0x1,%esi
  409611:	4c 89 e7             	mov    %r12,%rdi
  409614:	e8 17 86 ff ff       	call   401c30 <fwrite@plt>
  409619:	48 85 c0             	test   %rax,%rax
  40961c:	0f 84 8e 00 00 00    	je     4096b0 <dlerror@plt+0x7a20>
  409622:	48 89 df             	mov    %rbx,%rdi
  409625:	e8 26 82 ff ff       	call   401850 <ferror@plt>
  40962a:	85 c0                	test   %eax,%eax
  40962c:	0f 85 7e 00 00 00    	jne    4096b0 <dlerror@plt+0x7a20>
  409632:	48 89 ef             	mov    %rbp,%rdi
  409635:	e8 c6 83 ff ff       	call   401a00 <feof@plt>
  40963a:	85 c0                	test   %eax,%eax
  40963c:	74 aa                	je     4095e8 <dlerror@plt+0x7958>
  40963e:	45 31 f6             	xor    %r14d,%r14d
  409641:	48 89 e2             	mov    %rsp,%rdx
  409644:	4c 89 ee             	mov    %r13,%rsi
  409647:	bf 01 00 00 00       	mov    $0x1,%edi
  40964c:	e8 4f 84 ff ff       	call   401aa0 <__xstat@plt>
  409651:	85 c0                	test   %eax,%eax
  409653:	41 bc 80 01 00 00    	mov    $0x180,%r12d
  409659:	75 0c                	jne    409667 <dlerror@plt+0x79d7>
  40965b:	44 8b 64 24 18       	mov    0x18(%rsp),%r12d
  409660:	41 81 cc 80 01 00 00 	or     $0x180,%r12d
  409667:	48 89 df             	mov    %rbx,%rdi
  40966a:	e8 21 84 ff ff       	call   401a90 <fileno@plt>
  40966f:	44 89 e6             	mov    %r12d,%esi
  409672:	89 c7                	mov    %eax,%edi
  409674:	e8 f7 84 ff ff       	call   401b70 <fchmod@plt>
  409679:	48 89 ef             	mov    %rbp,%rdi
  40967c:	e8 2f 82 ff ff       	call   4018b0 <fclose@plt>
  409681:	48 89 df             	mov    %rbx,%rdi
  409684:	e8 27 82 ff ff       	call   4018b0 <fclose@plt>
  409689:	48 8b 8c 24 98 10 00 	mov    0x1098(%rsp),%rcx
  409690:	00 
  409691:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  409698:	00 00 
  40969a:	44 89 f0             	mov    %r14d,%eax
  40969d:	75 67                	jne    409706 <dlerror@plt+0x7a76>
  40969f:	48 81 c4 a0 10 00 00 	add    $0x10a0,%rsp
  4096a6:	5b                   	pop    %rbx
  4096a7:	5d                   	pop    %rbp
  4096a8:	41 5c                	pop    %r12
  4096aa:	41 5d                	pop    %r13
  4096ac:	41 5e                	pop    %r14
  4096ae:	c3                   	ret
  4096af:	90                   	nop
  4096b0:	48 89 df             	mov    %rbx,%rdi
  4096b3:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  4096b9:	e8 62 83 ff ff       	call   401a20 <clearerr@plt>
  4096be:	e9 7e ff ff ff       	jmp    409641 <dlerror@plt+0x79b1>
  4096c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4096c8:	48 89 ef             	mov    %rbp,%rdi
  4096cb:	e8 80 81 ff ff       	call   401850 <ferror@plt>
  4096d0:	85 c0                	test   %eax,%eax
  4096d2:	0f 84 66 ff ff ff    	je     40963e <dlerror@plt+0x79ae>
  4096d8:	48 89 ef             	mov    %rbp,%rdi
  4096db:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  4096e1:	e8 3a 83 ff ff       	call   401a20 <clearerr@plt>
  4096e6:	e9 56 ff ff ff       	jmp    409641 <dlerror@plt+0x79b1>
  4096eb:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  4096f1:	eb 96                	jmp    409689 <dlerror@plt+0x79f9>
  4096f3:	48 89 ef             	mov    %rbp,%rdi
  4096f6:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  4096fc:	e8 af 81 ff ff       	call   4018b0 <fclose@plt>
  409701:	e9 83 ff ff ff       	jmp    409689 <dlerror@plt+0x79f9>
  409706:	e8 f5 81 ff ff       	call   401900 <__stack_chk_fail@plt>
  40970b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  409710:	41 57                	push   %r15
  409712:	41 56                	push   %r14
  409714:	49 89 fe             	mov    %rdi,%r14
  409717:	41 55                	push   %r13
  409719:	41 54                	push   %r12
  40971b:	bf 00 20 00 00       	mov    $0x2000,%edi
  409720:	55                   	push   %rbp
  409721:	53                   	push   %rbx
  409722:	49 89 f5             	mov    %rsi,%r13
  409725:	49 89 d4             	mov    %rdx,%r12
  409728:	48 83 ec 28          	sub    $0x28,%rsp
  40972c:	e8 9f 83 ff ff       	call   401ad0 <malloc@plt>
  409731:	48 85 c0             	test   %rax,%rax
  409734:	48 89 c5             	mov    %rax,%rbp
  409737:	0f 84 f3 00 00 00    	je     409830 <dlerror@plt+0x7ba0>
  40973d:	31 f6                	xor    %esi,%esi
  40973f:	ba 02 00 00 00       	mov    $0x2,%edx
  409744:	4c 89 f7             	mov    %r14,%rdi
  409747:	e8 74 84 ff ff       	call   401bc0 <fseeko@plt>
  40974c:	85 c0                	test   %eax,%eax
  40974e:	0f 88 dc 00 00 00    	js     409830 <dlerror@plt+0x7ba0>
  409754:	4c 89 f7             	mov    %r14,%rdi
  409757:	e8 c4 80 ff ff       	call   401820 <ftello@plt>
  40975c:	4c 39 e0             	cmp    %r12,%rax
  40975f:	0f 82 cb 00 00 00    	jb     409830 <dlerror@plt+0x7ba0>
  409765:	49 8d 4c 24 ff       	lea    -0x1(%r12),%rcx
  40976a:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
  40976f:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  409775:	ba 00 20 00 00       	mov    $0x2000,%edx
  40977a:	48 0f 43 d0          	cmovae %rax,%rdx
  40977e:	48 8d b2 00 e0 ff ff 	lea    -0x2000(%rdx),%rsi
  409785:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
  40978a:	48 29 f0             	sub    %rsi,%rax
  40978d:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  409792:	49 39 c4             	cmp    %rax,%r12
  409795:	48 89 c3             	mov    %rax,%rbx
  409798:	0f 87 92 00 00 00    	ja     409830 <dlerror@plt+0x7ba0>
  40979e:	31 d2                	xor    %edx,%edx
  4097a0:	4c 89 f7             	mov    %r14,%rdi
  4097a3:	e8 18 84 ff ff       	call   401bc0 <fseeko@plt>
  4097a8:	85 c0                	test   %eax,%eax
  4097aa:	0f 88 80 00 00 00    	js     409830 <dlerror@plt+0x7ba0>
  4097b0:	4d 89 f0             	mov    %r14,%r8
  4097b3:	48 89 d9             	mov    %rbx,%rcx
  4097b6:	ba 01 00 00 00       	mov    $0x1,%edx
  4097bb:	be 00 20 00 00       	mov    $0x2000,%esi
  4097c0:	48 89 ef             	mov    %rbp,%rdi
  4097c3:	e8 c8 83 ff ff       	call   401b90 <__fread_chk@plt>
  4097c8:	48 39 c3             	cmp    %rax,%rbx
  4097cb:	75 63                	jne    409830 <dlerror@plt+0x7ba0>
  4097cd:	4c 29 e3             	sub    %r12,%rbx
  4097d0:	48 83 c3 01          	add    $0x1,%rbx
  4097d4:	75 12                	jne    4097e8 <dlerror@plt+0x7b58>
  4097d6:	eb 38                	jmp    409810 <dlerror@plt+0x7b80>
  4097d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4097df:	00 
  4097e0:	4d 85 ff             	test   %r15,%r15
  4097e3:	4c 89 fb             	mov    %r15,%rbx
  4097e6:	74 28                	je     409810 <dlerror@plt+0x7b80>
  4097e8:	4c 8d 7b ff          	lea    -0x1(%rbx),%r15
  4097ec:	4c 89 e2             	mov    %r12,%rdx
  4097ef:	4c 89 ee             	mov    %r13,%rsi
  4097f2:	4a 8d 7c 3d 00       	lea    0x0(%rbp,%r15,1),%rdi
  4097f7:	e8 b4 81 ff ff       	call   4019b0 <memcmp@plt>
  4097fc:	85 c0                	test   %eax,%eax
  4097fe:	75 e0                	jne    4097e0 <dlerror@plt+0x7b50>
  409800:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  409805:	48 8d 9c 18 ff df ff 	lea    -0x2001(%rax,%rbx,1),%rbx
  40980c:	ff 
  40980d:	eb 23                	jmp    409832 <dlerror@plt+0x7ba2>
  40980f:	90                   	nop
  409810:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  409815:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  40981a:	48 01 c8             	add    %rcx,%rax
  40981d:	48 85 c9             	test   %rcx,%rcx
  409820:	0f 85 49 ff ff ff    	jne    40976f <dlerror@plt+0x7adf>
  409826:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40982d:	00 00 00 
  409830:	31 db                	xor    %ebx,%ebx
  409832:	48 89 ef             	mov    %rbp,%rdi
  409835:	e8 86 7f ff ff       	call   4017c0 <free@plt>
  40983a:	48 83 c4 28          	add    $0x28,%rsp
  40983e:	48 89 d8             	mov    %rbx,%rax
  409841:	5b                   	pop    %rbx
  409842:	5d                   	pop    %rbp
  409843:	41 5c                	pop    %r12
  409845:	41 5d                	pop    %r13
  409847:	41 5e                	pop    %r14
  409849:	41 5f                	pop    %r15
  40984b:	c3                   	ret
  40984c:	0f 1f 40 00          	nopl   0x0(%rax)
  409850:	f3 c3                	repz ret
  409852:	0f 1f 40 00          	nopl   0x0(%rax)
  409856:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40985d:	00 00 00 
  409860:	41 54                	push   %r12
  409862:	55                   	push   %rbp
  409863:	48 89 fd             	mov    %rdi,%rbp
  409866:	53                   	push   %rbx
  409867:	48 81 ec 10 10 00 00 	sub    $0x1010,%rsp
  40986e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  409875:	00 00 
  409877:	48 89 84 24 08 10 00 	mov    %rax,0x1008(%rsp)
  40987e:	00 
  40987f:	31 c0                	xor    %eax,%eax
  409881:	e8 5a 80 ff ff       	call   4018e0 <strlen@plt>
  409886:	48 3d ff 0f 00 00    	cmp    $0xfff,%rax
  40988c:	0f 87 a9 00 00 00    	ja     40993b <dlerror@plt+0x7cab>
  409892:	be 2f 00 00 00       	mov    $0x2f,%esi
  409897:	48 89 ef             	mov    %rbp,%rdi
  40989a:	e8 81 80 ff ff       	call   401920 <strchr@plt>
  40989f:	48 85 c0             	test   %rax,%rax
  4098a2:	48 89 c3             	mov    %rax,%rbx
  4098a5:	74 5e                	je     409905 <dlerror@plt+0x7c75>
  4098a7:	49 89 e4             	mov    %rsp,%r12
  4098aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4098b0:	49 89 d9             	mov    %rbx,%r9
  4098b3:	49 29 e9             	sub    %rbp,%r9
  4098b6:	45 85 c9             	test   %r9d,%r9d
  4098b9:	74 34                	je     4098ef <dlerror@plt+0x7c5f>
  4098bb:	48 83 ec 08          	sub    $0x8,%rsp
  4098bf:	4c 8d 05 3d 2f 00 00 	lea    0x2f3d(%rip),%r8        # 40c803 <dlerror@plt+0xab73>
  4098c6:	ba 01 00 00 00       	mov    $0x1,%edx
  4098cb:	55                   	push   %rbp
  4098cc:	b9 00 10 00 00       	mov    $0x1000,%ecx
  4098d1:	be 00 10 00 00       	mov    $0x1000,%esi
  4098d6:	4c 89 e7             	mov    %r12,%rdi
  4098d9:	31 c0                	xor    %eax,%eax
  4098db:	e8 c0 7e ff ff       	call   4017a0 <__snprintf_chk@plt>
  4098e0:	be ff 01 00 00       	mov    $0x1ff,%esi
  4098e5:	4c 89 e7             	mov    %r12,%rdi
  4098e8:	e8 53 7f ff ff       	call   401840 <mkdir@plt>
  4098ed:	58                   	pop    %rax
  4098ee:	5a                   	pop    %rdx
  4098ef:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
  4098f3:	be 2f 00 00 00       	mov    $0x2f,%esi
  4098f8:	e8 23 80 ff ff       	call   401920 <strchr@plt>
  4098fd:	48 85 c0             	test   %rax,%rax
  409900:	48 89 c3             	mov    %rax,%rbx
  409903:	75 ab                	jne    4098b0 <dlerror@plt+0x7c20>
  409905:	be ff 01 00 00       	mov    $0x1ff,%esi
  40990a:	48 89 ef             	mov    %rbp,%rdi
  40990d:	e8 2e 7f ff ff       	call   401840 <mkdir@plt>
  409912:	31 f6                	xor    %esi,%esi
  409914:	48 89 ef             	mov    %rbp,%rdi
  409917:	e8 14 81 ff ff       	call   401a30 <realpath@plt>
  40991c:	48 8b 94 24 08 10 00 	mov    0x1008(%rsp),%rdx
  409923:	00 
  409924:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  40992b:	00 00 
  40992d:	75 1e                	jne    40994d <dlerror@plt+0x7cbd>
  40992f:	48 81 c4 10 10 00 00 	add    $0x1010,%rsp
  409936:	5b                   	pop    %rbx
  409937:	5d                   	pop    %rbp
  409938:	41 5c                	pop    %r12
  40993a:	c3                   	ret
  40993b:	48 8d 3d ce 2e 00 00 	lea    0x2ece(%rip),%rdi        # 40c810 <dlerror@plt+0xab80>
  409942:	31 c0                	xor    %eax,%eax
  409944:	e8 e7 aa ff ff       	call   404430 <dlerror@plt+0x27a0>
  409949:	31 c0                	xor    %eax,%eax
  40994b:	eb cf                	jmp    40991c <dlerror@plt+0x7c8c>
  40994d:	e8 ae 7f ff ff       	call   401900 <__stack_chk_fail@plt>
  409952:	0f 1f 40 00          	nopl   0x0(%rax)
  409956:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40995d:	00 00 00 
  409960:	53                   	push   %rbx
  409961:	48 89 fb             	mov    %rdi,%rbx
  409964:	e8 77 7f ff ff       	call   4018e0 <strlen@plt>
  409969:	0f b6 4c 03 ff       	movzbl -0x1(%rbx,%rax,1),%ecx
  40996e:	31 d2                	xor    %edx,%edx
  409970:	80 f9 2f             	cmp    $0x2f,%cl
  409973:	0f 95 c2             	setne  %dl
  409976:	83 c2 0a             	add    $0xa,%edx
  409979:	48 63 d2             	movslq %edx,%rdx
  40997c:	48 01 c2             	add    %rax,%rdx
  40997f:	48 81 fa ff 0f 00 00 	cmp    $0xfff,%rdx
  409986:	77 48                	ja     4099d0 <dlerror@plt+0x7d40>
  409988:	80 f9 2f             	cmp    $0x2f,%cl
  40998b:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
  40998f:	74 0d                	je     40999e <dlerror@plt+0x7d0e>
  409991:	b9 2f 00 00 00       	mov    $0x2f,%ecx
  409996:	66 89 0a             	mov    %cx,(%rdx)
  409999:	48 8d 54 03 01       	lea    0x1(%rbx,%rax,1),%rdx
  40999e:	48 b8 5f 4d 45 49 58 	movabs $0x5858585849454d5f,%rax
  4099a5:	58 58 58 
  4099a8:	48 89 df             	mov    %rbx,%rdi
  4099ab:	c6 42 0a 00          	movb   $0x0,0xa(%rdx)
  4099af:	48 89 02             	mov    %rax,(%rdx)
  4099b2:	b8 58 58 00 00       	mov    $0x5858,%eax
  4099b7:	66 89 42 08          	mov    %ax,0x8(%rdx)
  4099bb:	e8 90 81 ff ff       	call   401b50 <mkdtemp@plt>
  4099c0:	48 85 c0             	test   %rax,%rax
  4099c3:	0f 94 c0             	sete   %al
  4099c6:	0f b6 c0             	movzbl %al,%eax
  4099c9:	f7 d8                	neg    %eax
  4099cb:	5b                   	pop    %rbx
  4099cc:	c3                   	ret
  4099cd:	0f 1f 00             	nopl   (%rax)
  4099d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4099d5:	5b                   	pop    %rbx
  4099d6:	c3                   	ret
  4099d7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4099de:	00 00 
  4099e0:	41 54                	push   %r12
  4099e2:	55                   	push   %rbp
  4099e3:	89 fd                	mov    %edi,%ebp
  4099e5:	53                   	push   %rbx
  4099e6:	e8 e5 7d ff ff       	call   4017d0 <__errno_location@plt>
  4099eb:	48 89 c3             	mov    %rax,%rbx
  4099ee:	48 8b 05 ab 53 20 00 	mov    0x2053ab(%rip),%rax        # 60eda0 <dlerror@plt+0x20d110>
  4099f5:	8b b8 4c 40 00 00    	mov    0x404c(%rax),%edi
  4099fb:	85 ff                	test   %edi,%edi
  4099fd:	7e 0d                	jle    409a0c <dlerror@plt+0x7d7c>
  4099ff:	44 8b 23             	mov    (%rbx),%r12d
  409a02:	89 ee                	mov    %ebp,%esi
  409a04:	e8 67 80 ff ff       	call   401a70 <kill@plt>
  409a09:	44 89 23             	mov    %r12d,(%rbx)
  409a0c:	5b                   	pop    %rbx
  409a0d:	5d                   	pop    %rbp
  409a0e:	41 5c                	pop    %r12
  409a10:	c3                   	ret
  409a11:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  409a16:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  409a1d:	00 00 00 
  409a20:	48 83 ec 08          	sub    $0x8,%rsp
  409a24:	e8 67 7d ff ff       	call   401790 <getenv@plt>
  409a29:	48 85 c0             	test   %rax,%rax
  409a2c:	74 12                	je     409a40 <dlerror@plt+0x7db0>
  409a2e:	80 38 00             	cmpb   $0x0,(%rax)
  409a31:	74 0d                	je     409a40 <dlerror@plt+0x7db0>
  409a33:	48 89 c7             	mov    %rax,%rdi
  409a36:	48 83 c4 08          	add    $0x8,%rsp
  409a3a:	e9 01 82 ff ff       	jmp    401c40 <strdup@plt>
  409a3f:	90                   	nop
  409a40:	31 c0                	xor    %eax,%eax
  409a42:	48 83 c4 08          	add    $0x8,%rsp
  409a46:	c3                   	ret
  409a47:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  409a4e:	00 00 
  409a50:	ba 01 00 00 00       	mov    $0x1,%edx
  409a55:	e9 36 7e ff ff       	jmp    401890 <setenv@plt>
  409a5a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  409a60:	e9 8b 81 ff ff       	jmp    401bf0 <unsetenv@plt>
  409a65:	90                   	nop
  409a66:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  409a6d:	00 00 00 
  409a70:	41 56                	push   %r14
  409a72:	41 55                	push   %r13
  409a74:	41 54                	push   %r12
  409a76:	55                   	push   %rbp
  409a77:	53                   	push   %rbx
  409a78:	48 89 fb             	mov    %rdi,%rbx
  409a7b:	48 8b bf 58 40 00 00 	mov    0x4058(%rdi),%rdi
  409a82:	48 85 ff             	test   %rdi,%rdi
  409a85:	74 59                	je     409ae0 <dlerror@plt+0x7e50>
  409a87:	e8 d4 fd ff ff       	call   409860 <dlerror@plt+0x7bd0>
  409a8c:	48 85 c0             	test   %rax,%rax
  409a8f:	48 89 c5             	mov    %rax,%rbp
  409a92:	0f 84 48 01 00 00    	je     409be0 <dlerror@plt+0x7f50>
  409a98:	48 81 c3 3b 20 00 00 	add    $0x203b,%rbx
  409a9f:	48 8d 15 81 0e 00 00 	lea    0xe81(%rip),%rdx        # 40a927 <dlerror@plt+0x8c97>
  409aa6:	48 89 c1             	mov    %rax,%rcx
  409aa9:	be 00 10 00 00       	mov    $0x1000,%esi
  409aae:	48 89 df             	mov    %rbx,%rdi
  409ab1:	31 c0                	xor    %eax,%eax
  409ab3:	e8 98 7e ff ff       	call   401950 <snprintf@plt>
  409ab8:	48 89 ef             	mov    %rbp,%rdi
  409abb:	41 89 c4             	mov    %eax,%r12d
  409abe:	e8 fd 7c ff ff       	call   4017c0 <free@plt>
  409ac3:	41 81 fc ff 0f 00 00 	cmp    $0xfff,%r12d
  409aca:	0f 8f fb 00 00 00    	jg     409bcb <dlerror@plt+0x7f3b>
  409ad0:	48 89 df             	mov    %rbx,%rdi
  409ad3:	5b                   	pop    %rbx
  409ad4:	5d                   	pop    %rbp
  409ad5:	41 5c                	pop    %r12
  409ad7:	41 5d                	pop    %r13
  409ad9:	41 5e                	pop    %r14
  409adb:	e9 80 fe ff ff       	jmp    409960 <dlerror@plt+0x7cd0>
  409ae0:	48 8d 3d 29 30 00 00 	lea    0x3029(%rip),%rdi        # 40cb10 <dlerror@plt+0xae80>
  409ae7:	48 81 c3 3b 20 00 00 	add    $0x203b,%rbx
  409aee:	31 ed                	xor    %ebp,%ebp
  409af0:	4c 8d 35 d9 52 20 00 	lea    0x2052d9(%rip),%r14        # 60edd0 <dlerror@plt+0x20d140>
  409af7:	e8 24 ff ff ff       	call   409a20 <dlerror@plt+0x7d90>
  409afc:	48 85 c0             	test   %rax,%rax
  409aff:	49 89 c4             	mov    %rax,%r12
  409b02:	74 3d                	je     409b41 <dlerror@plt+0x7eb1>
  409b04:	48 8d 15 1c 0e 00 00 	lea    0xe1c(%rip),%rdx        # 40a927 <dlerror@plt+0x8c97>
  409b0b:	48 89 c1             	mov    %rax,%rcx
  409b0e:	be 00 10 00 00       	mov    $0x1000,%esi
  409b13:	48 89 df             	mov    %rbx,%rdi
  409b16:	31 c0                	xor    %eax,%eax
  409b18:	e8 33 7e ff ff       	call   401950 <snprintf@plt>
  409b1d:	4c 89 e7             	mov    %r12,%rdi
  409b20:	41 89 c5             	mov    %eax,%r13d
  409b23:	e8 98 7c ff ff       	call   4017c0 <free@plt>
  409b28:	41 81 fd ff 0f 00 00 	cmp    $0xfff,%r13d
  409b2f:	7f 10                	jg     409b41 <dlerror@plt+0x7eb1>
  409b31:	48 89 df             	mov    %rbx,%rdi
  409b34:	e8 27 fe ff ff       	call   409960 <dlerror@plt+0x7cd0>
  409b39:	85 c0                	test   %eax,%eax
  409b3b:	0f 84 7f 00 00 00    	je     409bc0 <dlerror@plt+0x7f30>
  409b41:	48 83 c5 08          	add    $0x8,%rbp
  409b45:	48 83 fd 18          	cmp    $0x18,%rbp
  409b49:	74 1b                	je     409b66 <dlerror@plt+0x7ed6>
  409b4b:	49 8b 3c 2e          	mov    (%r14,%rbp,1),%rdi
  409b4f:	e8 cc fe ff ff       	call   409a20 <dlerror@plt+0x7d90>
  409b54:	48 85 c0             	test   %rax,%rax
  409b57:	49 89 c4             	mov    %rax,%r12
  409b5a:	75 a8                	jne    409b04 <dlerror@plt+0x7e74>
  409b5c:	48 83 c5 08          	add    $0x8,%rbp
  409b60:	48 83 fd 18          	cmp    $0x18,%rbp
  409b64:	75 e5                	jne    409b4b <dlerror@plt+0x7ebb>
  409b66:	48 8d 0d fd 2f 00 00 	lea    0x2ffd(%rip),%rcx        # 40cb6a <dlerror@plt+0xaeda>
  409b6d:	4c 8d 25 3c 52 20 00 	lea    0x20523c(%rip),%r12        # 60edb0 <dlerror@plt+0x20d120>
  409b74:	31 ed                	xor    %ebp,%ebp
  409b76:	48 8d 15 aa 0d 00 00 	lea    0xdaa(%rip),%rdx        # 40a927 <dlerror@plt+0x8c97>
  409b7d:	be 00 10 00 00       	mov    $0x1000,%esi
  409b82:	48 89 df             	mov    %rbx,%rdi
  409b85:	31 c0                	xor    %eax,%eax
  409b87:	e8 c4 7d ff ff       	call   401950 <snprintf@plt>
  409b8c:	48 89 df             	mov    %rbx,%rdi
  409b8f:	e8 cc fd ff ff       	call   409960 <dlerror@plt+0x7cd0>
  409b94:	85 c0                	test   %eax,%eax
  409b96:	74 28                	je     409bc0 <dlerror@plt+0x7f30>
  409b98:	48 83 c5 08          	add    $0x8,%rbp
  409b9c:	48 83 fd 18          	cmp    $0x18,%rbp
  409ba0:	74 0e                	je     409bb0 <dlerror@plt+0x7f20>
  409ba2:	49 8b 0c 2c          	mov    (%r12,%rbp,1),%rcx
  409ba6:	eb ce                	jmp    409b76 <dlerror@plt+0x7ee6>
  409ba8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  409baf:	00 
  409bb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  409bb5:	5b                   	pop    %rbx
  409bb6:	5d                   	pop    %rbp
  409bb7:	41 5c                	pop    %r12
  409bb9:	41 5d                	pop    %r13
  409bbb:	41 5e                	pop    %r14
  409bbd:	c3                   	ret
  409bbe:	66 90                	xchg   %ax,%ax
  409bc0:	5b                   	pop    %rbx
  409bc1:	31 c0                	xor    %eax,%eax
  409bc3:	5d                   	pop    %rbp
  409bc4:	41 5c                	pop    %r12
  409bc6:	41 5d                	pop    %r13
  409bc8:	41 5e                	pop    %r14
  409bca:	c3                   	ret
  409bcb:	48 8d 3d be 2c 00 00 	lea    0x2cbe(%rip),%rdi        # 40c890 <dlerror@plt+0xac00>
  409bd2:	31 c0                	xor    %eax,%eax
  409bd4:	e8 57 a8 ff ff       	call   404430 <dlerror@plt+0x27a0>
  409bd9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  409bde:	eb d5                	jmp    409bb5 <dlerror@plt+0x7f25>
  409be0:	48 8b b3 58 40 00 00 	mov    0x4058(%rbx),%rsi
  409be7:	48 8d 3d 62 2c 00 00 	lea    0x2c62(%rip),%rdi        # 40c850 <dlerror@plt+0xabc0>
  409bee:	31 c0                	xor    %eax,%eax
  409bf0:	e8 3b a8 ff ff       	call   404430 <dlerror@plt+0x27a0>
  409bf5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  409bfa:	eb b9                	jmp    409bb5 <dlerror@plt+0x7f25>
  409bfc:	0f 1f 40 00          	nopl   0x0(%rax)
  409c00:	41 57                	push   %r15
  409c02:	41 56                	push   %r14
  409c04:	4c 8d 05 f3 2b 00 00 	lea    0x2bf3(%rip),%r8        # 40c7fe <dlerror@plt+0xab6e>
  409c0b:	41 55                	push   %r13
  409c0d:	41 54                	push   %r12
  409c0f:	49 89 f9             	mov    %rdi,%r9
  409c12:	55                   	push   %rbp
  409c13:	53                   	push   %rbx
  409c14:	ba 01 00 00 00       	mov    $0x1,%edx
  409c19:	49 89 fc             	mov    %rdi,%r12
  409c1c:	b9 00 10 00 00       	mov    $0x1000,%ecx
  409c21:	be 00 10 00 00       	mov    $0x1000,%esi
  409c26:	48 81 ec b8 10 00 00 	sub    $0x10b8,%rsp
  409c2d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  409c34:	00 00 
  409c36:	48 89 84 24 a8 10 00 	mov    %rax,0x10a8(%rsp)
  409c3d:	00 
  409c3e:	31 c0                	xor    %eax,%eax
  409c40:	4c 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%r14
  409c47:	00 
  409c48:	48 83 ec 08          	sub    $0x8,%rsp
  409c4c:	6a 2f                	push   $0x2f
  409c4e:	4c 89 f7             	mov    %r14,%rdi
  409c51:	e8 4a 7b ff ff       	call   4017a0 <__snprintf_chk@plt>
  409c56:	48 63 e8             	movslq %eax,%rbp
  409c59:	81 fd ff 0f 00 00    	cmp    $0xfff,%ebp
  409c5f:	58                   	pop    %rax
  409c60:	5a                   	pop    %rdx
  409c61:	0f 8f 19 01 00 00    	jg     409d80 <dlerror@plt+0x80f0>
  409c67:	4c 89 e7             	mov    %r12,%rdi
  409c6a:	e8 51 7c ff ff       	call   4018c0 <opendir@plt>
  409c6f:	48 85 c0             	test   %rax,%rax
  409c72:	48 89 c3             	mov    %rax,%rbx
  409c75:	0f 84 05 01 00 00    	je     409d80 <dlerror@plt+0x80f0>
  409c7b:	48 89 c7             	mov    %rax,%rdi
  409c7e:	e8 2d 7e ff ff       	call   401ab0 <readdir@plt>
  409c83:	48 85 c0             	test   %rax,%rax
  409c86:	0f 84 b5 00 00 00    	je     409d41 <dlerror@plt+0x80b1>
  409c8c:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  409c91:	41 bd 00 10 00 00    	mov    $0x1000,%r13d
  409c97:	4c 8d 3d 7a 2e 00 00 	lea    0x2e7a(%rip),%r15        # 40cb18 <dlerror@plt+0xae88>
  409c9e:	41 29 ed             	sub    %ebp,%r13d
  409ca1:	4c 01 f5             	add    %r14,%rbp
  409ca4:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  409ca9:	48 83 c0 13          	add    $0x13,%rax
  409cad:	b9 02 00 00 00       	mov    $0x2,%ecx
  409cb2:	4c 89 ff             	mov    %r15,%rdi
  409cb5:	48 89 c6             	mov    %rax,%rsi
  409cb8:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  409cba:	0f 97 c2             	seta   %dl
  409cbd:	80 da 00             	sbb    $0x0,%dl
  409cc0:	84 d2                	test   %dl,%dl
  409cc2:	74 6c                	je     409d30 <dlerror@plt+0x80a0>
  409cc4:	48 8d 3d 4c 2e 00 00 	lea    0x2e4c(%rip),%rdi        # 40cb17 <dlerror@plt+0xae87>
  409ccb:	b9 03 00 00 00       	mov    $0x3,%ecx
  409cd0:	48 89 c6             	mov    %rax,%rsi
  409cd3:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  409cd5:	0f 97 c2             	seta   %dl
  409cd8:	80 da 00             	sbb    $0x0,%dl
  409cdb:	84 d2                	test   %dl,%dl
  409cdd:	74 51                	je     409d30 <dlerror@plt+0x80a0>
  409cdf:	48 8d 15 41 0c 00 00 	lea    0xc41(%rip),%rdx        # 40a927 <dlerror@plt+0x8c97>
  409ce6:	48 89 c1             	mov    %rax,%rcx
  409ce9:	49 63 f5             	movslq %r13d,%rsi
  409cec:	31 c0                	xor    %eax,%eax
  409cee:	48 89 ef             	mov    %rbp,%rdi
  409cf1:	e8 5a 7c ff ff       	call   401950 <snprintf@plt>
  409cf6:	41 39 c5             	cmp    %eax,%r13d
  409cf9:	7e 35                	jle    409d30 <dlerror@plt+0x80a0>
  409cfb:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  409d00:	4c 89 f6             	mov    %r14,%rsi
  409d03:	bf 01 00 00 00       	mov    $0x1,%edi
  409d08:	e8 e3 7b ff ff       	call   4018f0 <__lxstat@plt>
  409d0d:	85 c0                	test   %eax,%eax
  409d0f:	75 1f                	jne    409d30 <dlerror@plt+0x80a0>
  409d11:	8b 44 24 28          	mov    0x28(%rsp),%eax
  409d15:	4c 89 f7             	mov    %r14,%rdi
  409d18:	25 00 f0 00 00       	and    $0xf000,%eax
  409d1d:	3d 00 40 00 00       	cmp    $0x4000,%eax
  409d22:	74 6c                	je     409d90 <dlerror@plt+0x8100>
  409d24:	e8 b7 7a ff ff       	call   4017e0 <unlink@plt>
  409d29:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  409d30:	48 89 df             	mov    %rbx,%rdi
  409d33:	e8 78 7d ff ff       	call   401ab0 <readdir@plt>
  409d38:	48 85 c0             	test   %rax,%rax
  409d3b:	0f 85 68 ff ff ff    	jne    409ca9 <dlerror@plt+0x8019>
  409d41:	48 89 df             	mov    %rbx,%rdi
  409d44:	e8 57 7c ff ff       	call   4019a0 <closedir@plt>
  409d49:	4c 89 e7             	mov    %r12,%rdi
  409d4c:	e8 7f 7b ff ff       	call   4018d0 <rmdir@plt>
  409d51:	48 8b 9c 24 a8 10 00 	mov    0x10a8(%rsp),%rbx
  409d58:	00 
  409d59:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  409d60:	00 00 
  409d62:	75 33                	jne    409d97 <dlerror@plt+0x8107>
  409d64:	48 81 c4 b8 10 00 00 	add    $0x10b8,%rsp
  409d6b:	5b                   	pop    %rbx
  409d6c:	5d                   	pop    %rbp
  409d6d:	41 5c                	pop    %r12
  409d6f:	41 5d                	pop    %r13
  409d71:	41 5e                	pop    %r14
  409d73:	41 5f                	pop    %r15
  409d75:	c3                   	ret
  409d76:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  409d7d:	00 00 00 
  409d80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  409d85:	eb ca                	jmp    409d51 <dlerror@plt+0x80c1>
  409d87:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  409d8e:	00 00 
  409d90:	e8 6b fe ff ff       	call   409c00 <dlerror@plt+0x7f70>
  409d95:	eb 99                	jmp    409d30 <dlerror@plt+0x80a0>
  409d97:	e8 64 7b ff ff       	call   401900 <__stack_chk_fail@plt>
  409d9c:	0f 1f 40 00          	nopl   0x0(%rax)
  409da0:	41 56                	push   %r14
  409da2:	41 55                	push   %r13
  409da4:	49 89 fd             	mov    %rdi,%r13
  409da7:	41 54                	push   %r12
  409da9:	48 8d 3d 6a 2d 00 00 	lea    0x2d6a(%rip),%rdi        # 40cb1a <dlerror@plt+0xae8a>
  409db0:	55                   	push   %rbp
  409db1:	53                   	push   %rbx
  409db2:	e8 69 fc ff ff       	call   409a20 <dlerror@plt+0x7d90>
  409db7:	48 85 c0             	test   %rax,%rax
  409dba:	0f 84 a8 00 00 00    	je     409e68 <dlerror@plt+0x81d8>
  409dc0:	48 8d 3d 63 2d 00 00 	lea    0x2d63(%rip),%rdi        # 40cb2a <dlerror@plt+0xae9a>
  409dc7:	ba 01 00 00 00       	mov    $0x1,%edx
  409dcc:	48 89 c6             	mov    %rax,%rsi
  409dcf:	48 89 c3             	mov    %rax,%rbx
  409dd2:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  409dd8:	e8 b3 7a ff ff       	call   401890 <setenv@plt>
  409ddd:	48 89 df             	mov    %rbx,%rdi
  409de0:	e8 fb 7a ff ff       	call   4018e0 <strlen@plt>
  409de5:	4c 89 ef             	mov    %r13,%rdi
  409de8:	48 89 c5             	mov    %rax,%rbp
  409deb:	e8 f0 7a ff ff       	call   4018e0 <strlen@plt>
  409df0:	8d 6c 05 02          	lea    0x2(%rbp,%rax,1),%ebp
  409df4:	48 63 ed             	movslq %ebp,%rbp
  409df7:	48 89 ef             	mov    %rbp,%rdi
  409dfa:	e8 d1 7c ff ff       	call   401ad0 <malloc@plt>
  409dff:	48 85 c0             	test   %rax,%rax
  409e02:	49 89 c4             	mov    %rax,%r12
  409e05:	74 49                	je     409e50 <dlerror@plt+0x81c0>
  409e07:	48 83 ec 08          	sub    $0x8,%rsp
  409e0b:	4c 8d 05 2d 2d 00 00 	lea    0x2d2d(%rip),%r8        # 40cb3f <dlerror@plt+0xaeaf>
  409e12:	4d 89 e9             	mov    %r13,%r9
  409e15:	53                   	push   %rbx
  409e16:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  409e1d:	48 89 c7             	mov    %rax,%rdi
  409e20:	ba 01 00 00 00       	mov    $0x1,%edx
  409e25:	48 89 ee             	mov    %rbp,%rsi
  409e28:	31 c0                	xor    %eax,%eax
  409e2a:	e8 71 79 ff ff       	call   4017a0 <__snprintf_chk@plt>
  409e2f:	48 8d 3d e4 2c 00 00 	lea    0x2ce4(%rip),%rdi        # 40cb1a <dlerror@plt+0xae8a>
  409e36:	ba 01 00 00 00       	mov    $0x1,%edx
  409e3b:	4c 89 e6             	mov    %r12,%rsi
  409e3e:	e8 4d 7a ff ff       	call   401890 <setenv@plt>
  409e43:	4c 89 e7             	mov    %r12,%rdi
  409e46:	41 89 c6             	mov    %eax,%r14d
  409e49:	e8 72 79 ff ff       	call   4017c0 <free@plt>
  409e4e:	58                   	pop    %rax
  409e4f:	5a                   	pop    %rdx
  409e50:	48 89 df             	mov    %rbx,%rdi
  409e53:	e8 68 79 ff ff       	call   4017c0 <free@plt>
  409e58:	5b                   	pop    %rbx
  409e59:	44 89 f0             	mov    %r14d,%eax
  409e5c:	5d                   	pop    %rbp
  409e5d:	41 5c                	pop    %r12
  409e5f:	41 5d                	pop    %r13
  409e61:	41 5e                	pop    %r14
  409e63:	c3                   	ret
  409e64:	0f 1f 40 00          	nopl   0x0(%rax)
  409e68:	5b                   	pop    %rbx
  409e69:	4c 89 ee             	mov    %r13,%rsi
  409e6c:	48 8d 3d a7 2c 00 00 	lea    0x2ca7(%rip),%rdi        # 40cb1a <dlerror@plt+0xae8a>
  409e73:	ba 01 00 00 00       	mov    $0x1,%edx
  409e78:	5d                   	pop    %rbp
  409e79:	41 5c                	pop    %r12
  409e7b:	41 5d                	pop    %r13
  409e7d:	41 5e                	pop    %r14
  409e7f:	e9 0c 7a ff ff       	jmp    401890 <setenv@plt>
  409e84:	66 90                	xchg   %ax,%ax
  409e86:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  409e8d:	00 00 00 
  409e90:	41 56                	push   %r14
  409e92:	49 89 fe             	mov    %rdi,%r14
  409e95:	41 55                	push   %r13
  409e97:	41 54                	push   %r12
  409e99:	55                   	push   %rbp
  409e9a:	49 89 d5             	mov    %rdx,%r13
  409e9d:	53                   	push   %rbx
  409e9e:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%rdi)
  409ea5:	8d 7e 01             	lea    0x1(%rsi),%edi
  409ea8:	89 f3                	mov    %esi,%ebx
  409eaa:	be 08 00 00 00       	mov    $0x8,%esi
  409eaf:	48 63 ff             	movslq %edi,%rdi
  409eb2:	e8 09 7b ff ff       	call   4019c0 <calloc@plt>
  409eb7:	48 85 c0             	test   %rax,%rax
  409eba:	49 89 46 18          	mov    %rax,0x18(%r14)
  409ebe:	74 7b                	je     409f3b <dlerror@plt+0x82ab>
  409ec0:	85 db                	test   %ebx,%ebx
  409ec2:	7e 6c                	jle    409f30 <dlerror@plt+0x82a0>
  409ec4:	44 8d 63 ff          	lea    -0x1(%rbx),%r12d
  409ec8:	48 89 c5             	mov    %rax,%rbp
  409ecb:	31 db                	xor    %ebx,%ebx
  409ecd:	49 83 c4 01          	add    $0x1,%r12
  409ed1:	eb 1e                	jmp    409ef1 <dlerror@plt+0x8261>
  409ed3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  409ed8:	49 63 56 10          	movslq 0x10(%r14),%rdx
  409edc:	48 83 c3 01          	add    $0x1,%rbx
  409ee0:	4c 39 e3             	cmp    %r12,%rbx
  409ee3:	8d 4a 01             	lea    0x1(%rdx),%ecx
  409ee6:	48 89 44 d5 00       	mov    %rax,0x0(%rbp,%rdx,8)
  409eeb:	41 89 4e 10          	mov    %ecx,0x10(%r14)
  409eef:	74 3f                	je     409f30 <dlerror@plt+0x82a0>
  409ef1:	49 8b 7c dd 00       	mov    0x0(%r13,%rbx,8),%rdi
  409ef6:	e8 45 7d ff ff       	call   401c40 <strdup@plt>
  409efb:	48 85 c0             	test   %rax,%rax
  409efe:	75 d8                	jne    409ed8 <dlerror@plt+0x8248>
  409f00:	e8 cb 78 ff ff       	call   4017d0 <__errno_location@plt>
  409f05:	8b 38                	mov    (%rax),%edi
  409f07:	e8 54 7d ff ff       	call   401c60 <strerror@plt>
  409f0c:	48 8d 3d ed 29 00 00 	lea    0x29ed(%rip),%rdi        # 40c900 <dlerror@plt+0xac70>
  409f13:	48 89 c2             	mov    %rax,%rdx
  409f16:	89 de                	mov    %ebx,%esi
  409f18:	31 c0                	xor    %eax,%eax
  409f1a:	e8 d1 a5 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  409f1f:	5b                   	pop    %rbx
  409f20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  409f25:	5d                   	pop    %rbp
  409f26:	41 5c                	pop    %r12
  409f28:	41 5d                	pop    %r13
  409f2a:	41 5e                	pop    %r14
  409f2c:	c3                   	ret
  409f2d:	0f 1f 00             	nopl   (%rax)
  409f30:	31 c0                	xor    %eax,%eax
  409f32:	5b                   	pop    %rbx
  409f33:	5d                   	pop    %rbp
  409f34:	41 5c                	pop    %r12
  409f36:	41 5d                	pop    %r13
  409f38:	41 5e                	pop    %r14
  409f3a:	c3                   	ret
  409f3b:	e8 90 78 ff ff       	call   4017d0 <__errno_location@plt>
  409f40:	8b 38                	mov    (%rax),%edi
  409f42:	e8 19 7d ff ff       	call   401c60 <strerror@plt>
  409f47:	48 8d 3d 82 29 00 00 	lea    0x2982(%rip),%rdi        # 40c8d0 <dlerror@plt+0xac40>
  409f4e:	48 89 c6             	mov    %rax,%rsi
  409f51:	31 c0                	xor    %eax,%eax
  409f53:	e8 98 a5 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  409f58:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  409f5d:	eb d3                	jmp    409f32 <dlerror@plt+0x82a2>
  409f5f:	90                   	nop
  409f60:	55                   	push   %rbp
  409f61:	53                   	push   %rbx
  409f62:	48 89 fb             	mov    %rdi,%rbx
  409f65:	48 89 f7             	mov    %rsi,%rdi
  409f68:	48 83 ec 08          	sub    $0x8,%rsp
  409f6c:	e8 cf 7c ff ff       	call   401c40 <strdup@plt>
  409f71:	48 85 c0             	test   %rax,%rax
  409f74:	74 4a                	je     409fc0 <dlerror@plt+0x8330>
  409f76:	48 89 c5             	mov    %rax,%rbp
  409f79:	8b 43 10             	mov    0x10(%rbx),%eax
  409f7c:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
  409f80:	8d 70 02             	lea    0x2(%rax),%esi
  409f83:	48 63 f6             	movslq %esi,%rsi
  409f86:	48 c1 e6 03          	shl    $0x3,%rsi
  409f8a:	e8 b1 7b ff ff       	call   401b40 <realloc@plt>
  409f8f:	48 85 c0             	test   %rax,%rax
  409f92:	74 33                	je     409fc7 <dlerror@plt+0x8337>
  409f94:	48 63 53 10          	movslq 0x10(%rbx),%rdx
  409f98:	48 89 43 18          	mov    %rax,0x18(%rbx)
  409f9c:	8d 4a 01             	lea    0x1(%rdx),%ecx
  409f9f:	89 4b 10             	mov    %ecx,0x10(%rbx)
  409fa2:	48 89 2c d0          	mov    %rbp,(%rax,%rdx,8)
  409fa6:	48 c7 44 d0 08 00 00 	movq   $0x0,0x8(%rax,%rdx,8)
  409fad:	00 00 
  409faf:	31 c0                	xor    %eax,%eax
  409fb1:	48 83 c4 08          	add    $0x8,%rsp
  409fb5:	5b                   	pop    %rbx
  409fb6:	5d                   	pop    %rbp
  409fb7:	c3                   	ret
  409fb8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  409fbf:	00 
  409fc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  409fc5:	eb ea                	jmp    409fb1 <dlerror@plt+0x8321>
  409fc7:	48 89 ef             	mov    %rbp,%rdi
  409fca:	e8 f1 77 ff ff       	call   4017c0 <free@plt>
  409fcf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  409fd4:	eb db                	jmp    409fb1 <dlerror@plt+0x8321>
  409fd6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  409fdd:	00 00 00 
  409fe0:	41 54                	push   %r12
  409fe2:	55                   	push   %rbp
  409fe3:	49 89 fc             	mov    %rdi,%r12
  409fe6:	53                   	push   %rbx
  409fe7:	8b 47 10             	mov    0x10(%rdi),%eax
  409fea:	85 c0                	test   %eax,%eax
  409fec:	7e 26                	jle    40a014 <dlerror@plt+0x8384>
  409fee:	31 ed                	xor    %ebp,%ebp
  409ff0:	31 db                	xor    %ebx,%ebx
  409ff2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  409ff8:	49 8b 44 24 18       	mov    0x18(%r12),%rax
  409ffd:	83 c3 01             	add    $0x1,%ebx
  40a000:	48 8b 3c 28          	mov    (%rax,%rbp,1),%rdi
  40a004:	48 83 c5 08          	add    $0x8,%rbp
  40a008:	e8 b3 77 ff ff       	call   4017c0 <free@plt>
  40a00d:	41 39 5c 24 10       	cmp    %ebx,0x10(%r12)
  40a012:	7f e4                	jg     409ff8 <dlerror@plt+0x8368>
  40a014:	49 8b 7c 24 18       	mov    0x18(%r12),%rdi
  40a019:	e8 a2 77 ff ff       	call   4017c0 <free@plt>
  40a01e:	5b                   	pop    %rbx
  40a01f:	41 c7 44 24 10 00 00 	movl   $0x0,0x10(%r12)
  40a026:	00 00 
  40a028:	49 c7 44 24 18 00 00 	movq   $0x0,0x18(%r12)
  40a02f:	00 00 
  40a031:	5d                   	pop    %rbp
  40a032:	41 5c                	pop    %r12
  40a034:	c3                   	ret
  40a035:	90                   	nop
  40a036:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40a03d:	00 00 00 
  40a040:	41 54                	push   %r12
  40a042:	55                   	push   %rbp
  40a043:	89 fd                	mov    %edi,%ebp
  40a045:	53                   	push   %rbx
  40a046:	83 c7 02             	add    $0x2,%edi
  40a049:	48 89 f3             	mov    %rsi,%rbx
  40a04c:	48 63 ff             	movslq %edi,%rdi
  40a04f:	be 08 00 00 00       	mov    $0x8,%esi
  40a054:	49 89 d4             	mov    %rdx,%r12
  40a057:	e8 64 79 ff ff       	call   4019c0 <calloc@plt>
  40a05c:	48 85 c0             	test   %rax,%rax
  40a05f:	74 29                	je     40a08a <dlerror@plt+0x83fa>
  40a061:	85 ed                	test   %ebp,%ebp
  40a063:	4c 89 20             	mov    %r12,(%rax)
  40a066:	7e 22                	jle    40a08a <dlerror@plt+0x83fa>
  40a068:	8d 55 ff             	lea    -0x1(%rbp),%edx
  40a06b:	48 8d 34 d5 08 00 00 	lea    0x8(,%rdx,8),%rsi
  40a072:	00 
  40a073:	31 d2                	xor    %edx,%edx
  40a075:	0f 1f 00             	nopl   (%rax)
  40a078:	48 8b 0c 13          	mov    (%rbx,%rdx,1),%rcx
  40a07c:	48 89 4c 10 08       	mov    %rcx,0x8(%rax,%rdx,1)
  40a081:	48 83 c2 08          	add    $0x8,%rdx
  40a085:	48 39 f2             	cmp    %rsi,%rdx
  40a088:	75 ee                	jne    40a078 <dlerror@plt+0x83e8>
  40a08a:	5b                   	pop    %rbx
  40a08b:	5d                   	pop    %rbp
  40a08c:	41 5c                	pop    %r12
  40a08e:	c3                   	ret
  40a08f:	90                   	nop
  40a090:	41 57                	push   %r15
  40a092:	41 56                	push   %r14
  40a094:	45 31 c9             	xor    %r9d,%r9d
  40a097:	41 55                	push   %r13
  40a099:	41 54                	push   %r12
  40a09b:	49 89 fd             	mov    %rdi,%r13
  40a09e:	55                   	push   %rbp
  40a09f:	53                   	push   %rbx
  40a0a0:	31 ff                	xor    %edi,%edi
  40a0a2:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  40a0a8:	b9 21 00 00 00       	mov    $0x21,%ecx
  40a0ad:	ba 03 00 00 00       	mov    $0x3,%edx
  40a0b2:	48 83 ec 48          	sub    $0x48,%rsp
  40a0b6:	be 20 00 00 00       	mov    $0x20,%esi
  40a0bb:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40a0c2:	00 00 
  40a0c4:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  40a0c9:	31 c0                	xor    %eax,%eax
  40a0cb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%rsp)
  40a0d2:	00 
  40a0d3:	e8 38 78 ff ff       	call   401910 <mmap@plt>
  40a0d8:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  40a0dc:	0f 84 5d 01 00 00    	je     40a23f <dlerror@plt+0x85af>
  40a0e2:	31 d2                	xor    %edx,%edx
  40a0e4:	be 01 00 00 00       	mov    $0x1,%esi
  40a0e9:	48 89 c7             	mov    %rax,%rdi
  40a0ec:	49 89 c4             	mov    %rax,%r12
  40a0ef:	e8 bc 7a ff ff       	call   401bb0 <sem_init@plt>
  40a0f4:	85 c0                	test   %eax,%eax
  40a0f6:	0f 88 36 01 00 00    	js     40a232 <dlerror@plt+0x85a2>
  40a0fc:	e8 7f 7b ff ff       	call   401c80 <fork@plt>
  40a101:	85 c0                	test   %eax,%eax
  40a103:	41 89 c6             	mov    %eax,%r14d
  40a106:	0f 88 c6 02 00 00    	js     40a3d2 <dlerror@plt+0x8742>
  40a10c:	45 85 f6             	test   %r14d,%r14d
  40a10f:	0f 84 65 01 00 00    	je     40a27a <dlerror@plt+0x85ea>
  40a115:	41 80 bd 68 40 00 00 	cmpb   $0x0,0x4068(%r13)
  40a11c:	00 
  40a11d:	48 8d 2d 2c f7 ff ff 	lea    -0x8d4(%rip),%rbp        # 409850 <dlerror@plt+0x7bc0>
  40a124:	48 8d 05 b5 f8 ff ff 	lea    -0x74b(%rip),%rax        # 4099e0 <dlerror@plt+0x7d50>
  40a12b:	45 89 b5 4c 40 00 00 	mov    %r14d,0x404c(%r13)
  40a132:	48 0f 44 e8          	cmove  %rax,%rbp
  40a136:	31 db                	xor    %ebx,%ebx
  40a138:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40a13f:	00 
  40a140:	83 fb 11             	cmp    $0x11,%ebx
  40a143:	74 0f                	je     40a154 <dlerror@plt+0x84c4>
  40a145:	83 fb 14             	cmp    $0x14,%ebx
  40a148:	74 0a                	je     40a154 <dlerror@plt+0x84c4>
  40a14a:	48 89 ee             	mov    %rbp,%rsi
  40a14d:	89 df                	mov    %ebx,%edi
  40a14f:	e8 8c 78 ff ff       	call   4019e0 <signal@plt>
  40a154:	83 c3 01             	add    $0x1,%ebx
  40a157:	83 fb 41             	cmp    $0x41,%ebx
  40a15a:	75 e4                	jne    40a140 <dlerror@plt+0x84b0>
  40a15c:	49 83 fc ff          	cmp    $0xffffffffffffffff,%r12
  40a160:	74 10                	je     40a172 <dlerror@plt+0x84e2>
  40a162:	4c 89 e7             	mov    %r12,%rdi
  40a165:	e8 a6 79 ff ff       	call   401b10 <sem_post@plt>
  40a16a:	85 c0                	test   %eax,%eax
  40a16c:	0f 88 c8 02 00 00    	js     40a43a <dlerror@plt+0x87aa>
  40a172:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
  40a177:	31 d2                	xor    %edx,%edx
  40a179:	44 89 f7             	mov    %r14d,%edi
  40a17c:	e8 1f 7a ff ff       	call   401ba0 <waitpid@plt>
  40a181:	85 c0                	test   %eax,%eax
  40a183:	89 c5                	mov    %eax,%ebp
  40a185:	41 c7 85 4c 40 00 00 	movl   $0x0,0x404c(%r13)
  40a18c:	00 00 00 00 
  40a190:	0f 88 1a 02 00 00    	js     40a3b0 <dlerror@plt+0x8720>
  40a196:	31 db                	xor    %ebx,%ebx
  40a198:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40a19f:	00 
  40a1a0:	31 f6                	xor    %esi,%esi
  40a1a2:	89 df                	mov    %ebx,%edi
  40a1a4:	83 c3 01             	add    $0x1,%ebx
  40a1a7:	e8 34 78 ff ff       	call   4019e0 <signal@plt>
  40a1ac:	83 fb 41             	cmp    $0x41,%ebx
  40a1af:	75 ef                	jne    40a1a0 <dlerror@plt+0x8510>
  40a1b1:	49 83 fc ff          	cmp    $0xffffffffffffffff,%r12
  40a1b5:	74 25                	je     40a1dc <dlerror@plt+0x854c>
  40a1b7:	4c 89 e7             	mov    %r12,%rdi
  40a1ba:	e8 91 7a ff ff       	call   401c50 <sem_destroy@plt>
  40a1bf:	85 c0                	test   %eax,%eax
  40a1c1:	0f 88 59 02 00 00    	js     40a420 <dlerror@plt+0x8790>
  40a1c7:	be 20 00 00 00       	mov    $0x20,%esi
  40a1cc:	4c 89 e7             	mov    %r12,%rdi
  40a1cf:	e8 8c 79 ff ff       	call   401b60 <munmap@plt>
  40a1d4:	85 c0                	test   %eax,%eax
  40a1d6:	0f 88 2a 02 00 00    	js     40a406 <dlerror@plt+0x8776>
  40a1dc:	85 ed                	test   %ebp,%ebp
  40a1de:	78 2a                	js     40a20a <dlerror@plt+0x857a>
  40a1e0:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  40a1e4:	89 c2                	mov    %eax,%edx
  40a1e6:	0f b6 c4             	movzbl %ah,%eax
  40a1e9:	83 e2 7f             	and    $0x7f,%edx
  40a1ec:	74 21                	je     40a20f <dlerror@plt+0x857f>
  40a1ee:	8d 42 01             	lea    0x1(%rdx),%eax
  40a1f1:	31 c9                	xor    %ecx,%ecx
  40a1f3:	d0 f8                	sar    $1,%al
  40a1f5:	84 c0                	test   %al,%al
  40a1f7:	0f 9f c1             	setg   %cl
  40a1fa:	41 89 8d 50 40 00 00 	mov    %ecx,0x4050(%r13)
  40a201:	7e 07                	jle    40a20a <dlerror@plt+0x857a>
  40a203:	41 89 95 54 40 00 00 	mov    %edx,0x4054(%r13)
  40a20a:	b8 01 00 00 00       	mov    $0x1,%eax
  40a20f:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
  40a214:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  40a21b:	00 00 
  40a21d:	0f 85 66 02 00 00    	jne    40a489 <dlerror@plt+0x87f9>
  40a223:	48 83 c4 48          	add    $0x48,%rsp
  40a227:	5b                   	pop    %rbx
  40a228:	5d                   	pop    %rbp
  40a229:	41 5c                	pop    %r12
  40a22b:	41 5d                	pop    %r13
  40a22d:	41 5e                	pop    %r14
  40a22f:	41 5f                	pop    %r15
  40a231:	c3                   	ret
  40a232:	be 20 00 00 00       	mov    $0x20,%esi
  40a237:	4c 89 e7             	mov    %r12,%rdi
  40a23a:	e8 21 79 ff ff       	call   401b60 <munmap@plt>
  40a23f:	e8 3c 7a ff ff       	call   401c80 <fork@plt>
  40a244:	85 c0                	test   %eax,%eax
  40a246:	41 89 c6             	mov    %eax,%r14d
  40a249:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
  40a250:	0f 89 b6 fe ff ff    	jns    40a10c <dlerror@plt+0x847c>
  40a256:	e8 75 75 ff ff       	call   4017d0 <__errno_location@plt>
  40a25b:	8b 38                	mov    (%rax),%edi
  40a25d:	e8 fe 79 ff ff       	call   401c60 <strerror@plt>
  40a262:	48 8d 3d 77 28 00 00 	lea    0x2877(%rip),%rdi        # 40cae0 <dlerror@plt+0xae50>
  40a269:	48 89 c6             	mov    %rax,%rsi
  40a26c:	31 c0                	xor    %eax,%eax
  40a26e:	e8 bd a1 ff ff       	call   404430 <dlerror@plt+0x27a0>
  40a273:	b8 01 00 00 00       	mov    $0x1,%eax
  40a278:	eb 95                	jmp    40a20f <dlerror@plt+0x857f>
  40a27a:	49 8b 5d 18          	mov    0x18(%r13),%rbx
  40a27e:	48 85 db             	test   %rbx,%rbx
  40a281:	0f 84 f5 01 00 00    	je     40a47c <dlerror@plt+0x87ec>
  40a287:	41 8b 6d 10          	mov    0x10(%r13),%ebp
  40a28b:	49 83 fc ff          	cmp    $0xffffffffffffffff,%r12
  40a28f:	74 10                	je     40a2a1 <dlerror@plt+0x8611>
  40a291:	4c 89 e7             	mov    %r12,%rdi
  40a294:	e8 57 77 ff ff       	call   4019f0 <sem_wait@plt>
  40a299:	85 c0                	test   %eax,%eax
  40a29b:	0f 88 ba 01 00 00    	js     40a45b <dlerror@plt+0x87cb>
  40a2a1:	48 8d 3d a6 28 00 00 	lea    0x28a6(%rip),%rdi        # 40cb4e <dlerror@plt+0xaebe>
  40a2a8:	e8 73 f7 ff ff       	call   409a20 <dlerror@plt+0x7d90>
  40a2ad:	48 85 c0             	test   %rax,%rax
  40a2b0:	74 5b                	je     40a30d <dlerror@plt+0x867d>
  40a2b2:	48 89 c7             	mov    %rax,%rdi
  40a2b5:	4c 8d 7c 24 10       	lea    0x10(%rsp),%r15
  40a2ba:	e8 01 75 ff ff       	call   4017c0 <free@plt>
  40a2bf:	e8 dc 75 ff ff       	call   4018a0 <getpid@plt>
  40a2c4:	4c 8d 05 8e 28 00 00 	lea    0x288e(%rip),%r8        # 40cb59 <dlerror@plt+0xaec9>
  40a2cb:	4c 63 c8             	movslq %eax,%r9
  40a2ce:	b9 20 00 00 00       	mov    $0x20,%ecx
  40a2d3:	ba 01 00 00 00       	mov    $0x1,%edx
  40a2d8:	be 20 00 00 00       	mov    $0x20,%esi
  40a2dd:	4c 89 ff             	mov    %r15,%rdi
  40a2e0:	31 c0                	xor    %eax,%eax
  40a2e2:	e8 b9 74 ff ff       	call   4017a0 <__snprintf_chk@plt>
  40a2e7:	48 8d 3d 60 28 00 00 	lea    0x2860(%rip),%rdi        # 40cb4e <dlerror@plt+0xaebe>
  40a2ee:	ba 01 00 00 00       	mov    $0x1,%edx
  40a2f3:	4c 89 fe             	mov    %r15,%rsi
  40a2f6:	e8 95 75 ff ff       	call   401890 <setenv@plt>
  40a2fb:	85 c0                	test   %eax,%eax
  40a2fd:	74 0e                	je     40a30d <dlerror@plt+0x867d>
  40a2ff:	48 8d 3d 4a 26 00 00 	lea    0x264a(%rip),%rdi        # 40c950 <dlerror@plt+0xacc0>
  40a306:	31 c0                	xor    %eax,%eax
  40a308:	e8 23 a1 ff ff       	call   404430 <dlerror@plt+0x27a0>
  40a30d:	41 80 bd 49 30 00 00 	cmpb   $0x0,0x3049(%r13)
  40a314:	00 
  40a315:	74 59                	je     40a370 <dlerror@plt+0x86e0>
  40a317:	4d 8d bd 49 30 00 00 	lea    0x3049(%r13),%r15
  40a31e:	48 89 de             	mov    %rbx,%rsi
  40a321:	89 ef                	mov    %ebp,%edi
  40a323:	4c 89 fa             	mov    %r15,%rdx
  40a326:	e8 15 fd ff ff       	call   40a040 <dlerror@plt+0x83b0>
  40a32b:	48 85 c0             	test   %rax,%rax
  40a32e:	0f 84 5a 01 00 00    	je     40a48e <dlerror@plt+0x87fe>
  40a334:	48 89 c6             	mov    %rax,%rsi
  40a337:	4c 89 ff             	mov    %r15,%rdi
  40a33a:	e8 d1 78 ff ff       	call   401c10 <execvp@plt>
  40a33f:	85 c0                	test   %eax,%eax
  40a341:	0f 89 ce fd ff ff    	jns    40a115 <dlerror@plt+0x8485>
  40a347:	e8 84 74 ff ff       	call   4017d0 <__errno_location@plt>
  40a34c:	8b 38                	mov    (%rax),%edi
  40a34e:	e8 0d 79 ff ff       	call   401c60 <strerror@plt>
  40a353:	48 8d 3d 56 26 00 00 	lea    0x2656(%rip),%rdi        # 40c9b0 <dlerror@plt+0xad20>
  40a35a:	48 89 c6             	mov    %rax,%rsi
  40a35d:	31 c0                	xor    %eax,%eax
  40a35f:	e8 8c a1 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  40a364:	83 cf ff             	or     $0xffffffff,%edi
  40a367:	e8 b4 78 ff ff       	call   401c20 <exit@plt>
  40a36c:	0f 1f 40 00          	nopl   0x0(%rax)
  40a370:	49 8d 7d 20          	lea    0x20(%r13),%rdi
  40a374:	48 89 de             	mov    %rbx,%rsi
  40a377:	e8 94 78 ff ff       	call   401c10 <execvp@plt>
  40a37c:	85 c0                	test   %eax,%eax
  40a37e:	0f 89 91 fd ff ff    	jns    40a115 <dlerror@plt+0x8485>
  40a384:	e8 47 74 ff ff       	call   4017d0 <__errno_location@plt>
  40a389:	8b 38                	mov    (%rax),%edi
  40a38b:	e8 d0 78 ff ff       	call   401c60 <strerror@plt>
  40a390:	48 8d 3d 49 26 00 00 	lea    0x2649(%rip),%rdi        # 40c9e0 <dlerror@plt+0xad50>
  40a397:	48 89 c6             	mov    %rax,%rsi
  40a39a:	31 c0                	xor    %eax,%eax
  40a39c:	e8 4f a1 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  40a3a1:	83 cf ff             	or     $0xffffffff,%edi
  40a3a4:	e8 77 78 ff ff       	call   401c20 <exit@plt>
  40a3a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  40a3b0:	e8 1b 74 ff ff       	call   4017d0 <__errno_location@plt>
  40a3b5:	8b 38                	mov    (%rax),%edi
  40a3b7:	e8 a4 78 ff ff       	call   401c60 <strerror@plt>
  40a3bc:	48 8d 3d 6d 26 00 00 	lea    0x266d(%rip),%rdi        # 40ca30 <dlerror@plt+0xada0>
  40a3c3:	48 89 c6             	mov    %rax,%rsi
  40a3c6:	31 c0                	xor    %eax,%eax
  40a3c8:	e8 63 a0 ff ff       	call   404430 <dlerror@plt+0x27a0>
  40a3cd:	e9 c4 fd ff ff       	jmp    40a196 <dlerror@plt+0x8506>
  40a3d2:	e8 f9 73 ff ff       	call   4017d0 <__errno_location@plt>
  40a3d7:	8b 38                	mov    (%rax),%edi
  40a3d9:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
  40a3de:	e8 7d 78 ff ff       	call   401c60 <strerror@plt>
  40a3e3:	48 8d 3d f6 26 00 00 	lea    0x26f6(%rip),%rdi        # 40cae0 <dlerror@plt+0xae50>
  40a3ea:	48 89 c6             	mov    %rax,%rsi
  40a3ed:	31 c0                	xor    %eax,%eax
  40a3ef:	e8 3c a0 ff ff       	call   404430 <dlerror@plt+0x27a0>
  40a3f4:	4c 89 e7             	mov    %r12,%rdi
  40a3f7:	e8 54 78 ff ff       	call   401c50 <sem_destroy@plt>
  40a3fc:	85 c0                	test   %eax,%eax
  40a3fe:	0f 89 c3 fd ff ff    	jns    40a1c7 <dlerror@plt+0x8537>
  40a404:	eb 1a                	jmp    40a420 <dlerror@plt+0x8790>
  40a406:	e8 c5 73 ff ff       	call   4017d0 <__errno_location@plt>
  40a40b:	8b 30                	mov    (%rax),%esi
  40a40d:	48 8d 3d 84 26 00 00 	lea    0x2684(%rip),%rdi        # 40ca98 <dlerror@plt+0xae08>
  40a414:	31 c0                	xor    %eax,%eax
  40a416:	e8 15 a0 ff ff       	call   404430 <dlerror@plt+0x27a0>
  40a41b:	e9 bc fd ff ff       	jmp    40a1dc <dlerror@plt+0x854c>
  40a420:	e8 ab 73 ff ff       	call   4017d0 <__errno_location@plt>
  40a425:	8b 30                	mov    (%rax),%esi
  40a427:	48 8d 3d 32 26 00 00 	lea    0x2632(%rip),%rdi        # 40ca60 <dlerror@plt+0xadd0>
  40a42e:	31 c0                	xor    %eax,%eax
  40a430:	e8 fb 9f ff ff       	call   404430 <dlerror@plt+0x27a0>
  40a435:	e9 8d fd ff ff       	jmp    40a1c7 <dlerror@plt+0x8537>
  40a43a:	e8 91 73 ff ff       	call   4017d0 <__errno_location@plt>
  40a43f:	8b 30                	mov    (%rax),%esi
  40a441:	48 8d 15 c0 25 00 00 	lea    0x25c0(%rip),%rdx        # 40ca08 <dlerror@plt+0xad78>
  40a448:	48 8d 3d 0e 27 00 00 	lea    0x270e(%rip),%rdi        # 40cb5d <dlerror@plt+0xaecd>
  40a44f:	31 c0                	xor    %eax,%eax
  40a451:	e8 5a a1 ff ff       	call   4045b0 <dlerror@plt+0x2920>
  40a456:	e9 17 fd ff ff       	jmp    40a172 <dlerror@plt+0x84e2>
  40a45b:	e8 70 73 ff ff       	call   4017d0 <__errno_location@plt>
  40a460:	8b 30                	mov    (%rax),%esi
  40a462:	48 8d 15 bf 24 00 00 	lea    0x24bf(%rip),%rdx        # 40c928 <dlerror@plt+0xac98>
  40a469:	48 8d 3d d5 26 00 00 	lea    0x26d5(%rip),%rdi        # 40cb45 <dlerror@plt+0xaeb5>
  40a470:	31 c0                	xor    %eax,%eax
  40a472:	e8 39 a1 ff ff       	call   4045b0 <dlerror@plt+0x2920>
  40a477:	e9 25 fe ff ff       	jmp    40a2a1 <dlerror@plt+0x8611>
  40a47c:	49 8b 5d 08          	mov    0x8(%r13),%rbx
  40a480:	41 8b 6d 00          	mov    0x0(%r13),%ebp
  40a484:	e9 02 fe ff ff       	jmp    40a28b <dlerror@plt+0x85fb>
  40a489:	e8 72 74 ff ff       	call   401900 <__stack_chk_fail@plt>
  40a48e:	48 8d 3d 83 11 00 00 	lea    0x1183(%rip),%rdi        # 40b618 <dlerror@plt+0x9988>
  40a495:	e8 56 a0 ff ff       	call   4044f0 <dlerror@plt+0x2860>
  40a49a:	83 cf ff             	or     $0xffffffff,%edi
  40a49d:	e8 7e 77 ff ff       	call   401c20 <exit@plt>
  40a4a2:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40a4a9:	00 00 00 
  40a4ac:	0f 1f 40 00          	nopl   0x0(%rax)
  40a4b0:	41 57                	push   %r15
  40a4b2:	41 56                	push   %r14
  40a4b4:	49 89 d7             	mov    %rdx,%r15
  40a4b7:	41 55                	push   %r13
  40a4b9:	41 54                	push   %r12
  40a4bb:	4c 8d 25 ce 48 20 00 	lea    0x2048ce(%rip),%r12        # 60ed90 <dlerror@plt+0x20d100>
  40a4c2:	55                   	push   %rbp
  40a4c3:	48 8d 2d ce 48 20 00 	lea    0x2048ce(%rip),%rbp        # 60ed98 <dlerror@plt+0x20d108>
  40a4ca:	53                   	push   %rbx
  40a4cb:	41 89 fd             	mov    %edi,%r13d
  40a4ce:	49 89 f6             	mov    %rsi,%r14
  40a4d1:	4c 29 e5             	sub    %r12,%rbp
  40a4d4:	48 83 ec 08          	sub    $0x8,%rsp
  40a4d8:	48 c1 fd 03          	sar    $0x3,%rbp
  40a4dc:	e8 7f 72 ff ff       	call   401760 <getenv@plt-0x30>
  40a4e1:	48 85 ed             	test   %rbp,%rbp
  40a4e4:	74 20                	je     40a506 <dlerror@plt+0x8876>
  40a4e6:	31 db                	xor    %ebx,%ebx
  40a4e8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40a4ef:	00 
  40a4f0:	4c 89 fa             	mov    %r15,%rdx
  40a4f3:	4c 89 f6             	mov    %r14,%rsi
  40a4f6:	44 89 ef             	mov    %r13d,%edi
  40a4f9:	41 ff 14 dc          	call   *(%r12,%rbx,8)
  40a4fd:	48 83 c3 01          	add    $0x1,%rbx
  40a501:	48 39 dd             	cmp    %rbx,%rbp
  40a504:	75 ea                	jne    40a4f0 <dlerror@plt+0x8860>
  40a506:	48 83 c4 08          	add    $0x8,%rsp
  40a50a:	5b                   	pop    %rbx
  40a50b:	5d                   	pop    %rbp
  40a50c:	41 5c                	pop    %r12
  40a50e:	41 5d                	pop    %r13
  40a510:	41 5e                	pop    %r14
  40a512:	41 5f                	pop    %r15
  40a514:	c3                   	ret
  40a515:	90                   	nop
  40a516:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40a51d:	00 00 00 
  40a520:	f3 c3                	repz ret

Disassembly of section .fini:

000000000040a524 <.fini>:
  40a524:	48 83 ec 08          	sub    $0x8,%rsp
  40a528:	48 83 c4 08          	add    $0x8,%rsp
  40a52c:	c3                   	ret
