
void _DT_INIT(void)

{
  if (PTR___gmon_start___00103fd0 != (undefined *)0x0) {
    (*(code *)PTR___gmon_start___00103fd0)();
  }
  return;
}


void FUN_00101020(void)

{
  (*(code *)PTR_00103ff8)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::resize(ulong param_1,char param_2)

{
  (*(code *)PTR_resize_00104000)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::ios_base::sync_with_stdio(bool param_1)

{
  (*(code *)PTR_sync_with_stdio_00104008)();
  return;
}


void __thiscall std::__cxx11::string::string(string *this,string *param_1)

{
  (*(code *)PTR_string_00104010)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

size_t strlen(char *__s)

{
  size_t sVar1;
  
  sVar1 = (*(code *)PTR_strlen_00104018)();
  return sVar1;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__throw_logic_error(char *param_1)

{
  (*(code *)PTR___throw_logic_error_00104020)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void * memcpy(void *__dest,void *__src,size_t __n)

{
  void *pvVar1;
  
  pvVar1 = (void *)(*(code *)PTR_memcpy_00104028)();
  return pvVar1;
}


void __cxa_atexit(void)

{
  (*(code *)PTR___cxa_atexit_00104030)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

ostream * std::operator<<(ostream *param_1,char *param_2)

{
  ostream *poVar1;
  
  poVar1 = (ostream *)(*(code *)PTR_operator<<_00104038)();
  return poVar1;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

ostream * std::__ostream_insert<char,std::char_traits<char>>
                    (ostream *param_1,char *param_2,long param_3)

{
  ostream *poVar1;
  
  poVar1 = (ostream *)(*(code *)PTR___ostream_insert<char,std_char_traits<char>>_00104040)();
  return poVar1;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_dispose(void)

{
  (*(code *)PTR__M_dispose_00104048)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::find(char param_1,ulong param_2)

{
  (*(code *)PTR_find_00104050)();
  return;
}


void __thiscall std::ios_base::Init::Init(Init *this)

{
  (*(code *)PTR_Init_00104058)();
  return;
}


void _Unwind_Resume(void)

{
  (*(code *)PTR__Unwind_Resume_00104060)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_create(ulong *param_1,ulong param_2)

{
  (*(code *)PTR__M_create_00104068)();
  return;
}


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_mutate(ulong param_1,ulong param_2,char *param_3,ulong param_4)

{
  (*_DAT_00104070)();
  return;
}


void __cxa_finalize(void)

{
  (*(code *)PTR___cxa_finalize_00103fb8)();
  return;
}


void FUN_00101130(void)

{
  std::__cxx11::string::_M_dispose();
  std::__cxx11::string::_M_dispose();
  std::__cxx11::string::_M_dispose();
  std::__cxx11::string::_M_dispose();
  std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
  _Unwind_Resume();
}


undefined8 FUN_00101170(int param_1,long param_2)

{
  byte bVar1;
  char *pcVar2;
  ulong uVar3;
  int iVar4;
  int iVar5;
  char *pcVar6;
  char **__dest;
  ulong uVar7;
  ostream *poVar8;
  undefined8 uVar9;
  char *pcVar10;
  ulong uVar11;
  uint uVar12;
  byte *pbVar13;
  long lVar14;
  char **local_d8;
  char *local_d0;
  char *local_c8 [2];
  byte *local_b8;
  char *local_b0;
  byte local_a8;
  undefined7 uStack_a7;
  long local_98;
  ulong local_90;
  long local_78;
  ulong local_70;
  char *local_58;
  ulong local_50;
  char local_48;
  undefined7 uStack_47;
  
  std::ios_base::sync_with_stdio(false);
  std::cin._232_8_ = 0;
  if (param_1 < 2) {
    std::operator<<((ostream *)std::cout,"Usage: ./nightfall_keymaster <key>\n");
    return 0;
  }
  pcVar2 = *(char **)(param_2 + 8);
  __dest = local_c8;
  local_d8 = __dest;
  if (pcVar2 == (char *)0x0) {
    uVar9 = std::__throw_logic_error("basic_string: construction from null is not valid");
    std::__cxx11::string::_M_dispose();
    std::__cxx11::string::_M_dispose();
    std::__cxx11::string::_M_dispose();
    std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
    _Unwind_Resume(uVar9);
                    /* catch() { ... } // from try @ 00101604 with catch @ 0010161a */
  }
  pcVar6 = (char *)strlen(pcVar2);
  local_58 = pcVar6;
  if (pcVar6 < (char *)0x10) {
    if (pcVar6 == (char *)0x1) {
      local_c8[0] = (char *)CONCAT71(local_c8[0]._1_7_,*pcVar2);
      goto LAB_001011f2;
    }
    if (pcVar6 == (char *)0x0) goto LAB_001011f2;
  }
  else {
    __dest = (char **)std::__cxx11::string::_M_create((ulong *)&local_d8,(ulong)&local_58);
    local_c8[0] = local_58;
    local_d8 = __dest;
  }
  memcpy(__dest,pcVar2,(size_t)pcVar6);
LAB_001011f2:
  pbVar13 = &DAT_001020c0;
  local_d0 = local_58;
  *(char *)((long)local_d8 + (long)local_58) = '\0';
  local_b0 = (char *)0x0;
  local_a8 = 0;
  local_b8 = &local_a8;
  do {
    pcVar6 = local_b0;
    bVar1 = *pbVar13;
    pcVar2 = local_b0 + 1;
    if (local_b8 == &local_a8) {
      pcVar10 = (char *)0xf;
    }
    else {
      pcVar10 = (char *)CONCAT71(uStack_a7,local_a8);
    }
    if (pcVar10 < pcVar2) {
                    /* try { // try from 00101296 to 0010129a has its CatchHandler @ 0010162a */
      std::__cxx11::string::_M_mutate((ulong)&local_b8,(ulong)local_b0,(char *)0x0,0);
    }
    local_b8[(long)pcVar6] = bVar1 ^ 0xaa;
    pbVar13 = pbVar13 + 1;
    local_b8[(long)pcVar2] = 0;
    local_b0 = pcVar2;
  } while (pbVar13 != (byte *)0x1020cd);
  if (pcVar2 == local_d0) {
    uVar12 = 0xbeef1337;
    for (pbVar13 = local_b8; pbVar13 != (byte *)(pcVar2 + (long)local_b8); pbVar13 = pbVar13 + 1) {
      uVar12 = uVar12 ^ *pbVar13 + 0x1234;
    }
                    /* try { // try from 0010133e to 00101342 has its CatchHandler @ 0010162a */
    std::__cxx11::string::string((string *)&local_98,(string *)&local_d8);
    uVar7 = 0;
    if (local_90 != 0) {
      do {
        bVar1 = (byte)uVar7;
        pbVar13 = (byte *)(local_98 + uVar7);
        uVar7 = uVar7 + 1;
        uVar12 = uVar12 * 0x19660d + 0x3c6ef35f;
        *pbVar13 = *pbVar13 ^ (byte)(uVar12 >> ((bVar1 & 3) << 3));
      } while (uVar7 < local_90);
    }
    uVar12 = 0xbeef1337;
    iVar4 = FUN_00101770((string *)&local_98);
    for (pbVar13 = local_b8; (byte *)(local_b0 + (long)local_b8) != pbVar13; pbVar13 = pbVar13 + 1)
    {
      uVar12 = uVar12 ^ *pbVar13 + 0x1234;
    }
                    /* try { // try from 001013d1 to 001013d5 has its CatchHandler @ 00101632 */
    std::__cxx11::string::string((string *)&local_78,(string *)&local_b8);
    if (local_70 != 0) {
      uVar7 = 0;
      do {
        bVar1 = (byte)uVar7;
        pbVar13 = (byte *)(local_78 + uVar7);
        uVar7 = uVar7 + 1;
        uVar12 = uVar12 * 0x19660d + 0x3c6ef35f;
        *pbVar13 = *pbVar13 ^ (byte)(uVar12 >> ((bVar1 & 3) << 3));
      } while (uVar7 < local_70);
    }
    iVar5 = FUN_00101770((string *)&local_78);
    if (iVar4 == iVar5) {
      uVar12 = uVar12 ^ 0xcafebabe;
      lVar14 = 0;
      local_50 = 0;
      local_48 = '\0';
      local_58 = &local_48;
      do {
        uVar3 = local_50;
        uVar7 = local_50 + 1;
        uVar12 = uVar12 * 0x19660d + 0x3c6ef35f;
        bVar1 = (&DAT_001020a0)[lVar14];
        if (local_58 == &local_48) {
          uVar11 = 0xf;
        }
        else {
          uVar11 = CONCAT71(uStack_47,local_48);
        }
        if (uVar11 < uVar7) {
                    /* try { // try from 001014f8 to 00101574 has its CatchHandler @ 00101622 */
          std::__cxx11::string::_M_mutate((ulong)&local_58,local_50,(char *)0x0,0);
        }
        local_58[uVar3] = (byte)(uVar12 >> (((byte)lVar14 & 3) << 3)) ^ bVar1;
        lVar14 = lVar14 + 1;
        local_58[uVar3 + 1] = '\0';
        local_50 = uVar7;
      } while (lVar14 != 0x20);
      lVar14 = std::__cxx11::string::find((char)&local_58,0);
      if (lVar14 != -1) {
        std::__cxx11::string::resize((ulong)&local_58,(char)lVar14);
      }
      poVar8 = std::operator<<((ostream *)std::cout,"=== AUTH ===\nMission token: ");
      poVar8 = std::__ostream_insert<char,std::char_traits<char>>(poVar8,local_58,local_50);
      std::operator<<(poVar8,"\n");
      std::__cxx11::string::_M_dispose();
    }
    else {
                    /* try { // try from 00101604 to 00101608 has its CatchHandler @ 0010161a */
      std::operator<<((ostream *)std::cout,"Access denied.\n");
    }
    std::__cxx11::string::_M_dispose();
    std::__cxx11::string::_M_dispose();
  }
  else {
                    /* try { // try from 001015ef to 001015f3 has its CatchHandler @ 0010162a */
    std::operator<<((ostream *)std::cout,"Invalid key.\n");
  }
  std::__cxx11::string::_M_dispose();
  std::__cxx11::string::_M_dispose();
  return 0;
}


void _INIT_1(void)

{
  std::ios_base::Init::Init((Init *)&DAT_001042f9);
  __cxa_atexit(PTR__Init_00103fe0,&DAT_001042f9,&PTR_LOOP_00104080);
  return;
}


void processEntry entry(undefined8 param_1,undefined8 param_2)

{
  undefined1 auStack_8 [8];
  
  (*(code *)PTR___libc_start_main_00103fc0)
            (FUN_00101170,param_2,&stack0x00000008,0,0,param_1,auStack_8);
  do {
                    /* WARNING: Do nothing block with infinite loop */
  } while( true );
}


/* WARNING: Removing unreachable block (ram,0x001016b3) */
/* WARNING: Removing unreachable block (ram,0x001016bf) */

void FUN_001016a0(void)

{
  return;
}


/* WARNING: Removing unreachable block (ram,0x001016f4) */
/* WARNING: Removing unreachable block (ram,0x00101700) */

void FUN_001016d0(void)

{
  return;
}


void _FINI_0(void)

{
  if (DAT_001042f8 == '\0') {
    if (PTR___cxa_finalize_00103fb8 != (undefined *)0x0) {
      __cxa_finalize(PTR_LOOP_00104080);
    }
    FUN_001016a0();
    DAT_001042f8 = 1;
    return;
  }
  return;
}


void _INIT_0(void)

{
  FUN_001016d0();
  return;
}


void FUN_00101760(int *param_1)

{
  *param_1 = *param_1 * 0x19660d + 0x3c6ef35f;
  return;
}


uint FUN_00101770(long *param_1)

{
  byte *pbVar1;
  int iVar2;
  long lVar3;
  uint uVar4;
  
  if (param_1[1] != 0) {
    lVar3 = 0;
    uVar4 = 0xdeadbeef;
    do {
      pbVar1 = (byte *)(*param_1 + lVar3);
      iVar2 = (int)lVar3;
      lVar3 = lVar3 + 1;
      uVar4 = ((uVar4 << 5 | uVar4 >> 0x1b) ^ (uint)*pbVar1) + iVar2 * 9;
    } while (lVar3 != param_1[1]);
    return uVar4 >> 0x10 ^ uVar4;
  }
  return 0xdead6042;
}


void _DT_FINI(void)

{
  return;
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::resize(ulong param_1,char param_2)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::ios_base::sync_with_stdio(bool param_1)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */

void __thiscall std::__cxx11::string::string(string *this,string *param_1)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

size_t strlen(char *__s)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__throw_logic_error(char *param_1)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */

void __libc_start_main(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void * memcpy(void *__dest,void *__src,size_t __n)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */

void __cxa_atexit(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

ostream * std::operator<<(ostream *param_1,char *param_2)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

ostream * std::__ostream_insert<char,std::char_traits<char>>
                    (ostream *param_1,char *param_2,long param_3)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_dispose(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::find(char param_1,ulong param_2)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */

void __thiscall std::ios_base::Init::Init(Init *this)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */

void __gxx_personality_v0(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */

void _ITM_deregisterTMCloneTable(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */

void _Unwind_Resume(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_create(ulong *param_1,ulong param_2)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_mutate(ulong param_1,ulong param_2,char *param_3,ulong param_4)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */

void __gmon_start__(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */

void _ITM_registerTMCloneTable(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */

void __thiscall std::ios_base::Init::~Init(Init *this)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */

void __cxa_finalize(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
  halt_baddata();
}

