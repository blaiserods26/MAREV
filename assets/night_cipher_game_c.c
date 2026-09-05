
int _init(EVP_PKEY_CTX *ctx)

{
  undefined *puVar1;
  
  puVar1 = PTR___gmon_start___00106fd8;
  if (PTR___gmon_start___00106fd8 != (undefined *)0x0) {
    puVar1 = (undefined *)(*(code *)PTR___gmon_start___00106fd8)();
  }
  return (int)puVar1;
}


void FUN_00102020(void)

{
  (*(code *)PTR_00106ff8)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

int isspace(int param_1)

{
  int iVar1;
  
  iVar1 = (*(code *)PTR_isspace_00107000)();
  return iVar1;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::resize(ulong param_1,char param_2)

{
  (*(code *)PTR_resize_00107008)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_append(char *param_1,ulong param_2)

{
  (*(code *)PTR__M_append_00107010)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::ios_base::sync_with_stdio(bool param_1)

{
  (*(code *)PTR_sync_with_stdio_00107018)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__throw_length_error(char *param_1)

{
  (*(code *)PTR___throw_length_error_00107020)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_assign(string *param_1)

{
  (*(code *)PTR__M_assign_00107028)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::ostream::flush(void)

{
  (*(code *)PTR_flush_00107030)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void * memcpy(void *__dest,void *__src,size_t __n)

{
  void *pvVar1;
  
  pvVar1 = (void *)(*(code *)PTR_memcpy_00107038)();
  return pvVar1;
}


void __cxa_atexit(void)

{
  (*(code *)PTR___cxa_atexit_00107040)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

ostream * std::operator<<(ostream *param_1,char *param_2)

{
  ostream *poVar1;
  
  poVar1 = (ostream *)(*(code *)PTR_operator<<_00107048)();
  return poVar1;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void * operator_new(ulong param_1)

{
  void *pvVar1;
  
  pvVar1 = (void *)(*(code *)PTR_operator_new_00107050)();
  return pvVar1;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void operator_delete(void *param_1,ulong param_2)

{
  (*(code *)PTR_operator_delete_00107058)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

ostream * std::__ostream_insert<char,std::char_traits<char>>
                    (ostream *param_1,char *param_2,long param_3)

{
  ostream *poVar1;
  
  poVar1 = (ostream *)(*(code *)PTR___ostream_insert<char,std_char_traits<char>>_00107060)();
  return poVar1;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::ctype<char>::_M_widen_init(void)

{
  (*(code *)PTR__M_widen_init_00107068)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_dispose(void)

{
  (*(code *)PTR__M_dispose_00107070)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__throw_bad_cast(void)

{
  (*(code *)PTR___throw_bad_cast_00107078)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__throw_out_of_range_fmt(char *param_1,...)

{
  (*(code *)PTR___throw_out_of_range_fmt_00107080)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::reserve(ulong param_1)

{
  (*(code *)PTR_reserve_00107088)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::find(char *param_1,ulong param_2,ulong param_3)

{
  (*(code *)PTR_find_00107090)();
  return;
}


void _Unwind_Resume(void)

{
  (*(code *)PTR__Unwind_Resume_00107098)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_create(ulong *param_1,ulong param_2)

{
  (*(code *)PTR__M_create_001070a0)();
  return;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_mutate(ulong param_1,ulong param_2,char *param_3,ulong param_4)

{
  (*(code *)PTR__M_mutate_001070a8)();
  return;
}


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

istream * std::getline<char,std::char_traits<char>,std::allocator<char>>
                    (istream *param_1,string *param_2,char param_3)

{
  istream *piVar1;
  
  piVar1 = (istream *)(*_DAT_001070b0)();
  return piVar1;
}


void __cxa_finalize(void)

{
  (*(code *)PTR___cxa_finalize_00106fb8)();
  return;
}


/* xor_decrypt_with_key[abi:cxx11](unsigned char const*, unsigned long, std::vector<unsigned char,
   std::allocator<unsigned char> > const&) [clone .cold] */

void xor_decrypt_with_key_abi_cxx11_(uchar *param_1,ulong param_2,vector *param_3)

{
  std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
  _Unwind_Resume();
}


/* ask_line(std::__cxx11::string const&) [clone .cold] */

void ask_line(string *param_1)

{
  undefined8 uVar1;
  undefined1 *puStack0000000000000008;
  
                    /* try { // try from 001021e6 to 001021f9 has its CatchHandler @ 001021fa */
  std::__throw_out_of_range_fmt
            ("%s: __pos (which is %zu) > this->size() (which is %zu)","basic_string::substr");
  puStack0000000000000008 = &stack0x00000010;
  uVar1 = std::__throw_bad_cast();
                    /* catch() { ... } // from try @ 001021e6 with catch @ 001021fa */
  std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
  _Unwind_Resume(uVar1);
}


/* puzzle1(std::__cxx11::string&) [clone .cold] */

void puzzle1(string *param_1)

{
  undefined8 uVar1;
  
                    /* try { // try from 00102225 to 00102237 has its CatchHandler @ 00102238 */
  std::__throw_out_of_range_fmt
            ("%s: __pos (which is %zu) > this->size() (which is %zu)","basic_string::substr");
  uVar1 = std::__throw_bad_cast();
                    /* catch() { ... } // from try @ 00102225 with catch @ 00102238 */
  std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
  _Unwind_Resume(uVar1);
}


/* puzzle2(std::__cxx11::string&) [clone .cold] */

void puzzle2(string *param_1)

{
  undefined8 uVar1;
  
                    /* try { // try from 00102255 to 00102274 has its CatchHandler @ 00102275 */
  std::__throw_bad_cast();
  uVar1 = std::__throw_out_of_range_fmt
                    ("%s: __pos (which is %zu) > this->size() (which is %zu)","basic_string::substr"
                    );
                    /* catch() { ... } // from try @ 00102255 with catch @ 00102275 */
  std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
  _Unwind_Resume(uVar1);
}


/* puzzle3(std::__cxx11::string&) [clone .cold] */

void puzzle3(string *param_1)

{
  undefined8 uVar1;
  
                    /* try { // try from 0010229f to 001022b1 has its CatchHandler @ 001022b2 */
  std::__throw_out_of_range_fmt
            ("%s: __pos (which is %zu) > this->size() (which is %zu)","basic_string::substr");
  uVar1 = std::__throw_bad_cast();
                    /* catch() { ... } // from try @ 0010229f with catch @ 001022b2 */
  std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
  _Unwind_Resume(uVar1);
}


/* b64_decode(std::__cxx11::string const&) [clone .cold] */

void b64_decode(string *param_1)

{
  void *unaff_RBX;
  _Vector_base<unsigned_char,std::allocator<unsigned_char>> *unaff_R12;
  
  std::_Vector_base<unsigned_char,std::allocator<unsigned_char>>::~_Vector_base(unaff_R12);
  operator_delete(unaff_RBX,0x400);
                    /* WARNING: Subroutine does not return */
  _Unwind_Resume();
}


/* derive_key_bytes(std::__cxx11::string const&) [clone .cold] */

void derive_key_bytes(string *param_1)

{
  _Vector_base<unsigned_char,std::allocator<unsigned_char>> *unaff_RBP;
  
  std::_Vector_base<unsigned_char,std::allocator<unsigned_char>>::~_Vector_base(unaff_RBP);
                    /* WARNING: Subroutine does not return */
  _Unwind_Resume();
}


/* reveal_flag(std::__cxx11::string const&, std::__cxx11::string const&, std::__cxx11::string
   const&) [clone .cold] */

void reveal_flag(string *param_1,string *param_2,string *param_3)

{
  _Vector_base<unsigned_char,std::allocator<unsigned_char>> *in_stack_00000010;
  undefined1 *puStack0000000000000038;
  _Vector_base<unsigned_char,std::allocator<unsigned_char>> *in_stack_00000050;
  
  puStack0000000000000038 = &stack0x00000100;
                    /* try { // try from 00102307 to 0010230b has its CatchHandler @ 00102358 */
  std::__throw_length_error("basic_string::append");
  std::__cxx11::string::_M_dispose();
  std::__cxx11::string::_M_dispose();
  std::_Vector_base<unsigned_char,std::allocator<unsigned_char>>::~_Vector_base(in_stack_00000010);
  std::__cxx11::string::_M_dispose();
  std::__cxx11::string::_M_dispose();
  std::_Vector_base<unsigned_char,std::allocator<unsigned_char>>::~_Vector_base(in_stack_00000050);
  std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
  _Unwind_Resume();
}


void FUN_00102358(void)

{
                    /* catch() { ... } // from try @ 00102307 with catch @ 00102358 */
  std::__cxx11::string::_M_dispose();
  std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
  _Unwind_Resume();
}


void main_cold(void)

{
  std::__cxx11::string::_M_dispose();
  std::__cxx11::string::_M_dispose();
  std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
  _Unwind_Resume();
}


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 main(void)

{
  char cVar1;
  int iVar2;
  undefined8 uVar3;
  undefined1 *local_88;
  undefined8 local_80;
  undefined1 local_78 [16];
  undefined1 *local_68;
  undefined8 local_60;
  undefined1 local_58 [16];
  undefined1 *local_48;
  undefined8 local_40;
  undefined1 local_38 [16];
  
  iVar2 = 3;
  std::ios_base::sync_with_stdio(false);
  _DAT_00107308 = 0;
  intro();
  local_88 = local_78;
  local_78[0] = 0;
  local_68 = local_58;
  local_48 = local_38;
  local_80 = 0;
  local_60 = 0;
  local_58[0] = 0;
  local_40 = 0;
  local_38[0] = 0;
  do {
                    /* try { // try from 00102482 to 00102595 has its CatchHandler @ 0010259b */
    cVar1 = puzzle1((string *)&local_88);
    if (cVar1 != '\0') {
      iVar2 = 3;
      goto LAB_001024e8;
    }
    iVar2 = iVar2 + -1;
  } while (iVar2 != 0);
  std::operator<<((ostream *)std::cout,"Too many failed attempts. Exit.\n");
  goto LAB_001024ad;
  while (iVar2 = iVar2 + -1, iVar2 != 0) {
LAB_001024e8:
    cVar1 = puzzle2((string *)&local_68);
    if (cVar1 != '\0') {
      iVar2 = 3;
      goto LAB_00102520;
    }
  }
  std::operator<<((ostream *)std::cout,"Too many failed attempts. Exit.\n");
  goto LAB_001024ad;
  while (iVar2 = iVar2 + -1, iVar2 != 0) {
LAB_00102520:
    cVar1 = puzzle3((string *)&local_48);
    if (cVar1 != '\0') {
      std::operator<<((ostream *)std::cout,&DAT_00105470);
      cVar1 = reveal_flag((string *)&local_88,(string *)&local_68,(string *)&local_48);
      if (cVar1 != '\0') {
        std::operator<<((ostream *)std::cout,"End of run.\n");
        uVar3 = 0;
        goto LAB_001024b2;
      }
      std::operator<<((ostream *)std::cout,&DAT_001054a0);
      goto LAB_001024ad;
    }
  }
  std::operator<<((ostream *)std::cout,"Too many failed attempts. Exit.\n");
LAB_001024ad:
  uVar3 = 1;
LAB_001024b2:
  std::__cxx11::string::_M_dispose();
  std::__cxx11::string::_M_dispose();
  std::__cxx11::string::_M_dispose();
  return uVar3;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */
/* rot13(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) */

void _GLOBAL__sub_I_rot13(void)

{
  b64_digits = &DAT_00107350;
  std::__cxx11::string::_M_construct<char_const*>
            (&b64_digits,"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
  __cxa_atexit(PTR__string_00106fc0,&b64_digits,&__dso_handle);
  return;
}


void processEntry _start(undefined8 param_1,undefined8 param_2)

{
  undefined1 auStack_8 [8];
  
  (*(code *)PTR___libc_start_main_00106fc8)(main,param_2,&stack0x00000008,0,0,param_1,auStack_8);
  do {
                    /* WARNING: Do nothing block with infinite loop */
  } while( true );
}


/* WARNING: Removing unreachable block (ram,0x00102633) */
/* WARNING: Removing unreachable block (ram,0x0010263f) */

void deregister_tm_clones(void)

{
  return;
}


/* WARNING: Removing unreachable block (ram,0x00102674) */
/* WARNING: Removing unreachable block (ram,0x00102680) */

void register_tm_clones(void)

{
  return;
}


void __do_global_dtors_aux(void)

{
  if (completed_0 == '\0') {
    if (PTR___cxa_finalize_00106fb8 != (undefined *)0x0) {
      __cxa_finalize(__dso_handle);
    }
    deregister_tm_clones();
    completed_0 = 1;
    return;
  }
  return;
}


void frame_dummy(void)

{
  register_tm_clones();
  return;
}


/* void std::__cxx11::string::_M_construct<char const*>(char const*, char const*,
   std::forward_iterator_tag) [clone .isra.0] */

void std::__cxx11::string::_M_construct<char_const*>
               (ulong *param_1,undefined1 *param_2,long param_3)

{
  undefined1 *__dest;
  ulong __n;
  ulong local_20;
  
  __n = param_3 - (long)param_2;
  local_20 = __n;
  if (__n < 0x10) {
    __dest = (undefined1 *)*param_1;
    if (__n == 1) {
      *__dest = *param_2;
      __dest = (undefined1 *)*param_1;
      goto LAB_00102736;
    }
    if (__n == 0) goto LAB_00102736;
  }
  else {
    __dest = (undefined1 *)std::__cxx11::string::_M_create(param_1,(ulong)&local_20);
    *param_1 = (ulong)__dest;
    param_1[2] = local_20;
  }
  memcpy(__dest,param_2,__n);
  __dest = (undefined1 *)*param_1;
LAB_00102736:
  param_1[1] = local_20;
  __dest[local_20] = 0;
  return;
}


/* rot13(std::__cxx11::string const&) */

string * rot13(string *param_1)

{
  char cVar1;
  string *__src;
  uint uVar2;
  ulong uVar3;
  undefined8 *in_RSI;
  char *pcVar4;
  string *__dest;
  ulong local_20;
  
  __dest = param_1 + 0x10;
  uVar3 = in_RSI[1];
  *(string **)param_1 = __dest;
  __src = (string *)*in_RSI;
  local_20 = uVar3;
  if (uVar3 < 0x10) {
    if (uVar3 == 1) {
      param_1[0x10] = *__src;
      goto LAB_001027da;
    }
    if (uVar3 == 0) goto LAB_001027da;
  }
  else {
    __dest = (string *)std::__cxx11::string::_M_create((ulong *)param_1,(ulong)&local_20);
    *(string **)param_1 = __dest;
    *(ulong *)(param_1 + 0x10) = local_20;
  }
  memcpy(__dest,__src,uVar3);
  __dest = *(string **)param_1;
LAB_001027da:
  *(ulong *)(param_1 + 8) = local_20;
  uVar3 = 0;
  __dest[local_20] = (string)0x0;
  if (*(long *)(param_1 + 8) != 0) {
    do {
      while( true ) {
        pcVar4 = (char *)(*(long *)param_1 + uVar3);
        cVar1 = *pcVar4;
        if (0x19 < (byte)(cVar1 + 0x9fU)) break;
        uVar2 = (int)cVar1 - 0x54;
        *pcVar4 = (char)uVar2 + (char)(uVar2 / 0x1a) * -0x1a + 'a';
LAB_0010281b:
        uVar3 = uVar3 + 1;
        if (*(ulong *)(param_1 + 8) <= uVar3) {
          return param_1;
        }
      }
      if (0x19 < (byte)(cVar1 + 0xbfU)) goto LAB_0010281b;
      uVar2 = (int)cVar1 - 0x34;
      uVar3 = uVar3 + 1;
      *pcVar4 = (char)uVar2 + (char)(uVar2 / 0x1a) * -0x1a + 'A';
    } while (uVar3 < *(ulong *)(param_1 + 8));
  }
  return param_1;
}


/* xor_decrypt_with_key[abi:cxx11](unsigned char const*, unsigned long, std::vector<unsigned char,
   std::allocator<unsigned char> > const&) */

uchar * xor_decrypt_with_key_abi_cxx11_(uchar *param_1,ulong param_2,vector *param_3)

{
  long *in_RCX;
  vector *pvVar1;
  
  *(uchar **)param_1 = param_1 + 0x10;
  param_1[8] = '\0';
  param_1[9] = '\0';
  param_1[10] = '\0';
  param_1[0xb] = '\0';
  param_1[0xc] = '\0';
  param_1[0xd] = '\0';
  param_1[0xe] = '\0';
  param_1[0xf] = '\0';
  param_1[0x10] = '\0';
                    /* try { // try from 001028ee to 001028f2 has its CatchHandler @ 00102939 */
  std::__cxx11::string::resize((ulong)param_1,(char)param_3);
  if (param_3 != (vector *)0x0) {
    pvVar1 = (vector *)0x0;
    do {
      pvVar1[*(long *)param_1] =
           (vector)(*(byte *)(*in_RCX + (ulong)pvVar1 % (ulong)(in_RCX[1] - *in_RCX)) ^
                   (byte)pvVar1[param_2]);
      pvVar1 = pvVar1 + 1;
    } while (param_3 != pvVar1);
  }
  return param_1;
}


/* WARNING: Restarted to delay deadcode elimination for space: stack */
/* ask_line(std::__cxx11::string const&) */

string * ask_line(string *param_1)

{
  long *plVar1;
  ulong *puVar2;
  char cVar3;
  int iVar4;
  uint uVar5;
  undefined8 uVar6;
  istream *piVar7;
  ulong uVar8;
  long lVar9;
  uint uVar10;
  ulong uVar11;
  undefined8 *in_RSI;
  ulong uVar12;
  ulong uVar13;
  ulong *local_78;
  undefined8 local_70;
  ulong auStack_68 [2];
  ulong *local_58;
  undefined8 local_50;
  ulong auStack_48 [3];
  
  std::__ostream_insert<char,std::char_traits<char>>((ostream *)std::cout,(char *)*in_RSI,in_RSI[1])
  ;
  std::ostream::flush();
  auStack_68[0] = auStack_68[0] & 0xffffffffffffff00;
  local_70 = 0;
  plVar1 = *(long **)(&DAT_00107310 + *(long *)(std::cin + -0x18));
  local_78 = auStack_68;
  if (plVar1 == (long *)0x0) goto LAB_001021eb;
  if ((char)plVar1[7] == '\0') {
    std::ctype<char>::_M_widen_init();
    cVar3 = '\n';
    if (*(code **)(*plVar1 + 0x30) != std::ctype<char>::do_widen) {
      cVar3 = (**(code **)(*plVar1 + 0x30))(plVar1,10);
    }
  }
  else {
    cVar3 = *(char *)((long)plVar1 + 0x43);
  }
                    /* try { // try from 001029d5 to 00102b11 has its CatchHandler @ 00102dc5 */
  piVar7 = std::getline<char,std::char_traits<char>,std::allocator<char>>
                     ((istream *)&std::cin,(string *)&local_78,cVar3);
  uVar8 = local_70;
  puVar2 = local_78;
  if (((byte)piVar7[*(long *)(*(long *)piVar7 + -0x18) + 0x20] & 5) != 0) {
    *(undefined8 *)(param_1 + 8) = 0;
    *(string **)param_1 = param_1 + 0x10;
    param_1[0x10] = (string)0x0;
    if (local_78 == auStack_68) {
      return param_1;
    }
    operator_delete(local_78,auStack_68[0] + 1);
    return param_1;
  }
  if (local_70 != 0) {
    uVar13 = 0;
    do {
      iVar4 = isspace((uint)*(byte *)((long)puVar2 + uVar13));
      uVar12 = uVar8;
      if (iVar4 == 0) goto LAB_00102ac3;
      uVar13 = uVar13 + 1;
      uVar11 = uVar8;
    } while (uVar8 != uVar13);
    goto LAB_00102adb;
  }
  uVar11 = 0;
  uVar13 = 0;
  goto LAB_00102aea;
  while( true ) {
    iVar4 = isspace((uint)*(byte *)((long)puVar2 + (uVar11 - 1)));
    uVar12 = uVar11 - 1;
    if (iVar4 == 0) break;
LAB_00102ac3:
    uVar11 = uVar12;
    if (uVar11 <= uVar13) break;
  }
LAB_00102adb:
  uVar11 = uVar11 - uVar13;
  if (uVar8 < uVar13) {
    std::__throw_out_of_range_fmt
              ("%s: __pos (which is %zu) > this->size() (which is %zu)","basic_string::substr",
               uVar13,uVar8);
LAB_001021eb:
    uVar6 = std::__throw_bad_cast();
    std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
    _Unwind_Resume(uVar6);
  }
LAB_00102aea:
  uVar12 = uVar8 - uVar13;
  if (uVar11 < uVar8 - uVar13) {
    uVar12 = uVar11;
  }
  local_58 = auStack_48;
  std::__cxx11::string::_M_construct<char_const*>
            (&local_58,(undefined1 *)((long)puVar2 + uVar13),
             (undefined1 *)((long)puVar2 + uVar13) + uVar12);
  uVar13 = local_50;
  uVar8 = auStack_68[0];
  puVar2 = local_78;
  if (local_78 == auStack_68) {
    if (local_58 == auStack_48) goto LAB_00102c50;
  }
  else {
    if (local_58 == auStack_48) {
LAB_00102c50:
      if (local_50 != 0) {
        if (local_50 == 1) {
          *(undefined1 *)local_78 = (undefined1)auStack_48[0];
        }
        else {
          uVar10 = (uint)local_50;
          uVar8 = local_50 & 0xffffffff;
          if (uVar10 < 8) {
            if ((local_50 & 4) == 0) {
              if ((uVar10 != 0) &&
                 (uVar13 = local_50 & 2, *(undefined1 *)local_78 = (undefined1)auStack_48[0],
                 uVar13 != 0)) {
                *(undefined2 *)((long)local_78 + (uVar8 - 2)) =
                     *(undefined2 *)((long)auStack_48 + (uVar8 - 2));
              }
            }
            else {
              *(undefined4 *)local_78 = (undefined4)auStack_48[0];
              *(undefined4 *)((long)local_78 + (uVar8 - 4)) =
                   *(undefined4 *)((long)auStack_48 + (uVar8 - 4));
            }
          }
          else {
            *local_78 = auStack_48[0];
            *(undefined8 *)((long)local_78 + ((uVar13 & 0xffffffff) - 8)) =
                 *(undefined8 *)((long)auStack_48 + ((uVar13 & 0xffffffff) - 8));
            lVar9 = (long)local_78 - ((ulong)(local_78 + 1) & 0xfffffffffffffff8);
            uVar10 = (int)lVar9 + uVar10 & 0xfffffff8;
            if (7 < uVar10) {
              uVar5 = 0;
              do {
                uVar8 = (ulong)uVar5;
                uVar5 = uVar5 + 8;
                *(undefined8 *)(((ulong)(local_78 + 1) & 0xfffffffffffffff8) + uVar8) =
                     *(undefined8 *)((long)auStack_48 + (uVar8 - lVar9));
              } while (uVar5 < uVar10);
            }
          }
        }
      }
      *(undefined1 *)((long)local_78 + local_50) = 0;
      goto LAB_00102b69;
    }
    local_78 = local_58;
    auStack_68[0] = auStack_48[0];
    if (puVar2 != (ulong *)0x0) {
      local_58 = puVar2;
      auStack_48[0] = uVar8;
      goto LAB_00102b69;
    }
  }
  auStack_68[0] = auStack_48[0];
  local_78 = local_58;
  local_58 = auStack_48;
LAB_00102b69:
  local_70 = local_50;
  local_50 = 0;
  *(undefined1 *)local_58 = 0;
  if (local_58 != auStack_48) {
    operator_delete(local_58,auStack_48[0] + 1);
  }
  *(string **)param_1 = param_1 + 0x10;
  if (local_78 == auStack_68) {
    uVar8 = local_70 + 1;
    uVar10 = (uint)uVar8;
    if (uVar10 < 8) {
      if ((uVar8 & 4) == 0) {
        if (uVar10 != 0) {
          param_1[0x10] = auStack_68[0]._0_1_;
          if ((uVar8 & 2) != 0) {
            *(undefined2 *)(param_1 + (uVar8 & 0xffffffff) + 0xe) =
                 *(undefined2 *)((long)auStack_68 + ((uVar8 & 0xffffffff) - 2));
          }
        }
      }
      else {
        *(undefined4 *)(param_1 + 0x10) = (undefined4)auStack_68[0];
        *(undefined4 *)(param_1 + (uVar8 & 0xffffffff) + 0xc) =
             *(undefined4 *)((long)auStack_68 + ((uVar8 & 0xffffffff) - 4));
      }
    }
    else {
      *(ulong *)(param_1 + 0x10) = auStack_68[0];
      *(undefined8 *)(param_1 + (uVar8 & 0xffffffff) + 8) =
           *(undefined8 *)((long)auStack_68 + ((uVar8 & 0xffffffff) - 8));
      lVar9 = (long)(param_1 + 0x10) - ((ulong)(param_1 + 0x18) & 0xfffffffffffffff8);
      uVar10 = uVar10 + (int)lVar9 & 0xfffffff8;
      if (7 < uVar10) {
        uVar5 = 0;
        do {
          uVar8 = (ulong)uVar5;
          uVar5 = uVar5 + 8;
          *(undefined8 *)(((ulong)(param_1 + 0x18) & 0xfffffffffffffff8) + uVar8) =
               *(undefined8 *)((long)auStack_68 + (uVar8 - lVar9));
        } while (uVar5 < uVar10);
      }
    }
  }
  else {
    *(ulong **)param_1 = local_78;
    *(ulong *)(param_1 + 0x10) = auStack_68[0];
  }
  *(ulong *)(param_1 + 8) = local_70;
  return param_1;
}


/* looks_like_number(std::__cxx11::string const&) */

undefined8 looks_like_number(string *param_1)

{
  byte *pbVar1;
  byte *pbVar2;
  
  pbVar2 = *(byte **)param_1;
  pbVar1 = pbVar2 + *(long *)(param_1 + 8);
  while( true ) {
    if (pbVar1 == pbVar2) {
      return CONCAT71((int7)((ulong)pbVar2 >> 8),*(long *)(param_1 + 8) != 0);
    }
    if (9 < *pbVar2 - 0x30) break;
    pbVar2 = pbVar2 + 1;
  }
  return 0;
}


/* WARNING: Unknown calling convention -- yet parameter storage is locked */
/* intro() */

void intro(void)

{
  std::__ostream_insert<char,std::char_traits<char>>
            ((ostream *)std::cout,"=== NIGHT CIPHER: Escape the Vault ===\n",0x27);
  std::__ostream_insert<char,std::char_traits<char>>
            ((ostream *)std::cout,
             "Three locks, one secret. Solve each puzzle to gather the components\n",0x44);
  std::__ostream_insert<char,std::char_traits<char>>
            ((ostream *)std::cout,
             "of the vault key. Once you have all pieces, the vault will reveal\n",0x42);
  std::__ostream_insert<char,std::char_traits<char>>
            ((ostream *)std::cout,"the secret token.\n\n",0x13);
  return;
}


/* puzzle1(std::__cxx11::string&) */

undefined8 puzzle1(string *param_1)

{
  long *plVar1;
  char cVar2;
  int iVar3;
  uint uVar4;
  istream *piVar5;
  ulong uVar6;
  long lVar7;
  uint uVar8;
  ulong uVar9;
  ulong *puVar10;
  undefined8 uVar11;
  ulong uVar12;
  ulong uVar13;
  ulong *local_78;
  ulong local_70;
  ulong auStack_68 [2];
  ulong *local_58;
  undefined8 local_50;
  ulong auStack_48 [3];
  
  std::__ostream_insert<char,std::char_traits<char>>
            ((ostream *)std::cout,"[Lock 1] Numeric Riddle\n",0x18);
  std::__ostream_insert<char,std::char_traits<char>>
            ((ostream *)std::cout,
             "Find the product of all prime numbers strictly between 10 and 20.\n",0x42);
  std::__ostream_insert<char,std::char_traits<char>>((ostream *)std::cout,"Enter the number: ",0x12)
  ;
  auStack_68[0] = auStack_68[0] & 0xffffffffffffff00;
  local_70 = 0;
  plVar1 = *(long **)(&DAT_00107310 + *(long *)(std::cin + -0x18));
  local_78 = auStack_68;
  if (plVar1 == (long *)0x0) goto LAB_0010222a;
  if ((char)plVar1[7] == '\0') {
    std::ctype<char>::_M_widen_init();
    cVar2 = '\n';
    if (*(code **)(*plVar1 + 0x30) != std::ctype<char>::do_widen) {
      cVar2 = (**(code **)(*plVar1 + 0x30))(plVar1,10);
    }
  }
  else {
    cVar2 = *(char *)((long)plVar1 + 0x43);
  }
                    /* try { // try from 00102f40 to 0010323b has its CatchHandler @ 001032ec */
  piVar5 = std::getline<char,std::char_traits<char>,std::allocator<char>>
                     ((istream *)&std::cin,(string *)&local_78,cVar2);
  uVar6 = local_70;
  puVar10 = local_78;
  if (((byte)piVar5[*(long *)(*(long *)piVar5 + -0x18) + 0x20] & 5) == 0) {
    if (local_70 != 0) {
      uVar13 = 0;
      do {
        iVar3 = isspace((uint)*(byte *)((long)puVar10 + uVar13));
        uVar12 = uVar6;
        if (iVar3 == 0) goto LAB_00102fc3;
        uVar13 = uVar13 + 1;
        uVar9 = uVar6;
      } while (uVar6 != uVar13);
      goto LAB_00102fdb;
    }
    uVar9 = 0;
    uVar13 = 0;
    goto LAB_00102fea;
  }
  goto LAB_00102f53;
  while( true ) {
    iVar3 = isspace((uint)*(byte *)((long)puVar10 + (uVar9 - 1)));
    uVar12 = uVar9 - 1;
    if (iVar3 == 0) break;
LAB_00102fc3:
    uVar9 = uVar12;
    if (uVar9 <= uVar13) break;
  }
LAB_00102fdb:
  uVar9 = uVar9 - uVar13;
  if (uVar6 < uVar13) {
    std::__throw_out_of_range_fmt
              ("%s: __pos (which is %zu) > this->size() (which is %zu)","basic_string::substr",
               uVar13,uVar6);
LAB_0010222a:
    uVar11 = std::__throw_bad_cast();
    std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
    _Unwind_Resume(uVar11);
  }
LAB_00102fea:
  uVar12 = uVar6 - uVar13;
  if (uVar9 < uVar6 - uVar13) {
    uVar12 = uVar9;
  }
  local_58 = auStack_48;
  std::__cxx11::string::_M_construct<char_const*>
            (&local_58,(byte *)((long)puVar10 + uVar13),(byte *)((long)puVar10 + uVar13) + uVar12);
  uVar9 = local_50;
  uVar6 = auStack_68[0];
  puVar10 = local_78;
  if (local_78 == auStack_68) {
    if (local_58 == auStack_48) goto LAB_001031a0;
LAB_0010317a:
    auStack_68[0] = auStack_48[0];
    local_70 = local_50;
    local_78 = local_58;
    local_58 = auStack_48;
  }
  else if (local_58 == auStack_48) {
LAB_001031a0:
    local_70 = local_50;
    if (local_50 != 0) {
      if (local_50 == 1) {
        *(byte *)local_78 = (byte)auStack_48[0];
        local_70 = local_50;
      }
      else {
        uVar4 = (uint)local_50;
        uVar6 = local_50 & 0xffffffff;
        if (uVar4 < 8) {
          if ((local_50 & 4) == 0) {
            if ((uVar4 != 0) &&
               (uVar9 = local_50 & 2, *(byte *)local_78 = (byte)auStack_48[0], local_70 = local_50,
               uVar9 != 0)) {
              *(undefined2 *)((long)local_78 + (uVar6 - 2)) =
                   *(undefined2 *)((long)auStack_48 + (uVar6 - 2));
            }
          }
          else {
            *(undefined4 *)local_78 = (undefined4)auStack_48[0];
            *(undefined4 *)((long)local_78 + (uVar6 - 4)) =
                 *(undefined4 *)((long)auStack_48 + (uVar6 - 4));
            local_70 = local_50;
          }
        }
        else {
          *local_78 = auStack_48[0];
          *(undefined8 *)((long)local_78 + ((uVar9 & 0xffffffff) - 8)) =
               *(undefined8 *)((long)auStack_48 + ((uVar9 & 0xffffffff) - 8));
          lVar7 = (long)local_78 - ((ulong)(local_78 + 1) & 0xfffffffffffffff8);
          uVar4 = (int)lVar7 + uVar4 & 0xfffffff8;
          local_70 = local_50;
          if (7 < uVar4) {
            uVar8 = 0;
            do {
              uVar6 = (ulong)uVar8;
              uVar8 = uVar8 + 8;
              *(undefined8 *)(((ulong)(local_78 + 1) & 0xfffffffffffffff8) + uVar6) =
                   *(undefined8 *)((long)auStack_48 + (uVar6 - lVar7));
            } while (uVar8 < uVar4);
          }
        }
      }
    }
    *(byte *)((long)local_78 + local_70) = 0;
  }
  else {
    local_78 = local_58;
    local_70 = local_50;
    auStack_68[0] = auStack_48[0];
    if (puVar10 == (ulong *)0x0) goto LAB_0010317a;
    local_58 = puVar10;
    auStack_48[0] = uVar6;
  }
  local_50 = 0;
  *(byte *)local_58 = 0;
  if (local_58 != auStack_48) {
    operator_delete(local_58,auStack_48[0] + 1);
  }
  puVar10 = local_78;
  if (local_78 == (ulong *)((long)local_78 + local_70)) {
LAB_001030b4:
    std::__ostream_insert<char,std::char_traits<char>>
              ((ostream *)std::cout,"That doesn\'t look like a valid positive integer.\n",0x31);
  }
  else {
    do {
      if (9 < (byte)*puVar10 - 0x30) goto LAB_001030b4;
      puVar10 = (ulong *)((long)puVar10 + 1);
    } while ((ulong *)((long)local_78 + local_70) != puVar10);
    if (((local_70 == 5) && ((int)*local_78 == 0x38313634)) &&
       (*(byte *)((long)local_78 + 4) == 0x39)) {
      std::__ostream_insert<char,std::char_traits<char>>
                ((ostream *)std::cout,"Lock 1 opened.\n\n",0x10);
      std::__cxx11::string::_M_assign(param_1);
      uVar11 = 1;
      goto LAB_00102f55;
    }
    std::__ostream_insert<char,std::char_traits<char>>((ostream *)std::cout,"Incorrect.\n",0xb);
  }
LAB_00102f53:
  uVar11 = 0;
LAB_00102f55:
  if (local_78 != auStack_68) {
    operator_delete(local_78,auStack_68[0] + 1);
  }
  return uVar11;
}


/* puzzle2(std::__cxx11::string&) */

undefined8 puzzle2(string *param_1)

{
  long *plVar1;
  ulong *puVar2;
  undefined8 *puVar3;
  char cVar4;
  int iVar5;
  uint uVar6;
  istream *piVar7;
  long lVar8;
  uint uVar9;
  ulong uVar10;
  undefined8 uVar11;
  undefined8 *puVar12;
  ulong uVar13;
  undefined8 *puVar14;
  undefined8 *unaff_R15;
  ulong *local_78;
  undefined8 *local_70;
  ulong auStack_68 [2];
  ulong *local_58;
  undefined8 local_50;
  ulong auStack_48 [3];
  
  puVar12 = &std::cin;
  std::__ostream_insert<char,std::char_traits<char>>
            ((ostream *)std::cout,"[Lock 2] Shift Cipher\n",0x16);
  std::__ostream_insert<char,std::char_traits<char>>
            ((ostream *)std::cout,
             "The word \'omega\' has been shifted by +2 (Caesar shift). Provide the resulting word.\n"
             ,0x54);
  std::__ostream_insert<char,std::char_traits<char>>
            ((ostream *)std::cout,"Enter the shifted word (lowercase): ",0x24);
  auStack_68[0] = auStack_68[0] & 0xffffffffffffff00;
  local_70 = (undefined8 *)0x0;
  plVar1 = *(long **)(&DAT_00107310 + *(long *)(std::cin + -0x18));
  local_78 = auStack_68;
  if (plVar1 == (long *)0x0) {
    std::__throw_bad_cast();
    goto LAB_0010225a;
  }
  if ((char)plVar1[7] == '\0') {
    std::ctype<char>::_M_widen_init();
    cVar4 = '\n';
    if (*(code **)(*plVar1 + 0x30) != std::ctype<char>::do_widen) {
      cVar4 = (**(code **)(*plVar1 + 0x30))(plVar1,10);
    }
  }
  else {
    cVar4 = *(char *)((long)plVar1 + 0x43);
  }
                    /* try { // try from 001033b0 to 001035c0 has its CatchHandler @ 00103701 */
  piVar7 = std::getline<char,std::char_traits<char>,std::allocator<char>>
                     ((istream *)&std::cin,(string *)&local_78,cVar4);
  puVar12 = local_70;
  puVar2 = local_78;
  if (((byte)piVar7[*(long *)(*(long *)piVar7 + -0x18) + 0x20] & 5) == 0) {
    unaff_R15 = (undefined8 *)0x0;
    if (local_70 != (undefined8 *)0x0) {
      do {
        iVar5 = isspace((uint)*(byte *)((long)puVar2 + (long)unaff_R15));
        puVar3 = puVar12;
        if (iVar5 == 0) goto LAB_00103433;
        unaff_R15 = (undefined8 *)((long)unaff_R15 + 1);
        puVar14 = puVar12;
      } while (puVar12 != unaff_R15);
      goto LAB_0010344b;
    }
    uVar10 = 0;
    goto LAB_0010345a;
  }
  goto LAB_001033c3;
  while( true ) {
    iVar5 = isspace((uint)*(byte *)((long)puVar2 + (long)puVar14 + -1));
    puVar3 = (undefined8 *)((long)puVar14 + -1);
    if (iVar5 == 0) break;
LAB_00103433:
    puVar14 = puVar3;
    if (puVar14 <= unaff_R15) break;
  }
LAB_0010344b:
  uVar10 = (long)puVar14 - (long)unaff_R15;
  if (puVar12 < unaff_R15) {
LAB_0010225a:
    uVar11 = std::__throw_out_of_range_fmt
                       ("%s: __pos (which is %zu) > this->size() (which is %zu)",
                        "basic_string::substr",unaff_R15,puVar12);
    std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
    _Unwind_Resume(uVar11);
  }
LAB_0010345a:
  uVar13 = (long)puVar12 - (long)unaff_R15;
  if (uVar10 < (ulong)((long)puVar12 - (long)unaff_R15)) {
    uVar13 = uVar10;
  }
  local_58 = auStack_48;
  std::__cxx11::string::_M_construct<char_const*>
            (&local_58,(undefined1 *)((long)puVar2 + (long)unaff_R15),
             (undefined1 *)((long)puVar2 + (long)unaff_R15) + uVar13);
  puVar12 = local_50;
  uVar10 = auStack_68[0];
  puVar2 = local_78;
  if (local_78 == auStack_68) {
    if (local_58 == auStack_48) goto LAB_00103610;
LAB_001035ea:
    auStack_68[0] = auStack_48[0];
    local_70 = local_50;
    local_78 = local_58;
    local_58 = auStack_48;
  }
  else if (local_58 == auStack_48) {
LAB_00103610:
    local_70 = local_50;
    if (local_50 != (undefined8 *)0x0) {
      if (local_50 == (undefined8 *)0x1) {
        *(undefined1 *)local_78 = (undefined1)auStack_48[0];
        local_70 = local_50;
      }
      else {
        uVar6 = (uint)local_50;
        uVar10 = (ulong)local_50 & 0xffffffff;
        if (uVar6 < 8) {
          if (((ulong)local_50 & 4) == 0) {
            if ((uVar6 != 0) &&
               (uVar13 = (ulong)local_50 & 2, *(undefined1 *)local_78 = (undefined1)auStack_48[0],
               local_70 = local_50, uVar13 != 0)) {
              *(undefined2 *)((long)local_78 + (uVar10 - 2)) =
                   *(undefined2 *)((long)auStack_48 + (uVar10 - 2));
            }
          }
          else {
            *(int *)local_78 = (int)auStack_48[0];
            *(undefined4 *)((long)local_78 + (uVar10 - 4)) =
                 *(undefined4 *)((long)auStack_48 + (uVar10 - 4));
            local_70 = local_50;
          }
        }
        else {
          *local_78 = auStack_48[0];
          *(undefined8 *)((long)local_78 + (((ulong)puVar12 & 0xffffffff) - 8)) =
               *(undefined8 *)((long)auStack_48 + (((ulong)puVar12 & 0xffffffff) - 8));
          lVar8 = (long)local_78 - ((ulong)(local_78 + 1) & 0xfffffffffffffff8);
          uVar6 = (int)lVar8 + uVar6 & 0xfffffff8;
          local_70 = local_50;
          if (7 < uVar6) {
            uVar9 = 0;
            do {
              uVar10 = (ulong)uVar9;
              uVar9 = uVar9 + 8;
              *(undefined8 *)(((ulong)(local_78 + 1) & 0xfffffffffffffff8) + uVar10) =
                   *(undefined8 *)((long)auStack_48 + (uVar10 - lVar8));
            } while (uVar9 < uVar6);
          }
        }
      }
    }
    *(undefined1 *)((long)local_78 + (long)local_70) = 0;
  }
  else {
    local_78 = local_58;
    local_70 = local_50;
    auStack_68[0] = auStack_48[0];
    if (puVar2 == (ulong *)0x0) goto LAB_001035ea;
    local_58 = puVar2;
    auStack_48[0] = uVar10;
  }
  local_50 = (undefined8 *)0x0;
  *(undefined1 *)local_58 = 0;
  if (local_58 != auStack_48) {
    operator_delete(local_58,auStack_48[0] + 1);
  }
  if (((local_70 == (undefined8 *)0x5) && ((int)*local_78 == 0x69676f71)) &&
     (*(char *)((long)local_78 + 4) == 'c')) {
    std::__ostream_insert<char,std::char_traits<char>>
              ((ostream *)std::cout,"Lock 2 opened.\n\n",0x10);
    std::__cxx11::string::_M_assign(param_1);
    uVar11 = 1;
    goto LAB_001033c5;
  }
  std::__ostream_insert<char,std::char_traits<char>>((ostream *)std::cout,"Incorrect.\n",0xb);
LAB_001033c3:
  uVar11 = 0;
LAB_001033c5:
  if (local_78 != auStack_68) {
    operator_delete(local_78,auStack_68[0] + 1);
  }
  return uVar11;
}


/* puzzle3(std::__cxx11::string&) */

undefined8 puzzle3(string *param_1)

{
  long *plVar1;
  char cVar2;
  int iVar3;
  uint uVar4;
  istream *piVar5;
  ulong uVar6;
  long lVar7;
  uint uVar8;
  ulong uVar9;
  ulong *puVar10;
  undefined8 uVar11;
  ulong uVar12;
  ulong uVar13;
  ulong *local_78;
  ulong local_70;
  ulong auStack_68 [2];
  ulong *local_58;
  undefined8 local_50;
  ulong auStack_48 [3];
  
  std::__ostream_insert<char,std::char_traits<char>>
            ((ostream *)std::cout,"[Lock 3] Tiny Forensics\n",0x18);
  std::__ostream_insert<char,std::char_traits<char>>
            ((ostream *)std::cout,
             "Sum the ASCII codes of the string \'CTF\' (capital letters). Enter the decimal sum:\n"
             ,0x52);
  std::__ostream_insert<char,std::char_traits<char>>((ostream *)std::cout,"Enter the sum: ",0xf);
  auStack_68[0] = auStack_68[0] & 0xffffffffffffff00;
  local_70 = 0;
  plVar1 = *(long **)(&DAT_00107310 + *(long *)(std::cin + -0x18));
  local_78 = auStack_68;
  if (plVar1 == (long *)0x0) goto LAB_001022a4;
  if ((char)plVar1[7] == '\0') {
    std::ctype<char>::_M_widen_init();
    cVar2 = '\n';
    if (*(code **)(*plVar1 + 0x30) != std::ctype<char>::do_widen) {
      cVar2 = (**(code **)(*plVar1 + 0x30))(plVar1,10);
    }
  }
  else {
    cVar2 = *(char *)((long)plVar1 + 0x43);
  }
                    /* try { // try from 001037c0 to 00103aba has its CatchHandler @ 00103b6b */
  piVar5 = std::getline<char,std::char_traits<char>,std::allocator<char>>
                     ((istream *)&std::cin,(string *)&local_78,cVar2);
  uVar6 = local_70;
  puVar10 = local_78;
  if (((byte)piVar5[*(long *)(*(long *)piVar5 + -0x18) + 0x20] & 5) == 0) {
    if (local_70 != 0) {
      uVar13 = 0;
      do {
        iVar3 = isspace((uint)*(byte *)((long)puVar10 + uVar13));
        uVar12 = uVar6;
        if (iVar3 == 0) goto LAB_00103843;
        uVar13 = uVar13 + 1;
        uVar9 = uVar6;
      } while (uVar6 != uVar13);
      goto LAB_0010385b;
    }
    uVar9 = 0;
    uVar13 = 0;
    goto LAB_0010386a;
  }
  goto LAB_001037d3;
  while( true ) {
    iVar3 = isspace((uint)*(byte *)((long)puVar10 + (uVar9 - 1)));
    uVar12 = uVar9 - 1;
    if (iVar3 == 0) break;
LAB_00103843:
    uVar9 = uVar12;
    if (uVar9 <= uVar13) break;
  }
LAB_0010385b:
  uVar9 = uVar9 - uVar13;
  if (uVar6 < uVar13) {
    std::__throw_out_of_range_fmt
              ("%s: __pos (which is %zu) > this->size() (which is %zu)","basic_string::substr",
               uVar13,uVar6);
LAB_001022a4:
    uVar11 = std::__throw_bad_cast();
    std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
    _Unwind_Resume(uVar11);
  }
LAB_0010386a:
  uVar12 = uVar6 - uVar13;
  if (uVar9 < uVar6 - uVar13) {
    uVar12 = uVar9;
  }
  local_58 = auStack_48;
  std::__cxx11::string::_M_construct<char_const*>
            (&local_58,(byte *)((long)puVar10 + uVar13),(byte *)((long)puVar10 + uVar13) + uVar12);
  uVar9 = local_50;
  uVar6 = auStack_68[0];
  puVar10 = local_78;
  if (local_78 == auStack_68) {
    if (local_58 == auStack_48) goto LAB_00103a20;
LAB_001039fa:
    auStack_68[0] = auStack_48[0];
    local_70 = local_50;
    local_78 = local_58;
    local_58 = auStack_48;
  }
  else if (local_58 == auStack_48) {
LAB_00103a20:
    local_70 = local_50;
    if (local_50 != 0) {
      if (local_50 == 1) {
        *(byte *)local_78 = (byte)auStack_48[0];
        local_70 = local_50;
      }
      else {
        uVar4 = (uint)local_50;
        uVar6 = local_50 & 0xffffffff;
        if (uVar4 < 8) {
          if ((local_50 & 4) == 0) {
            if ((uVar4 != 0) &&
               (uVar9 = local_50 & 2, *(byte *)local_78 = (byte)auStack_48[0], local_70 = local_50,
               uVar9 != 0)) {
              *(undefined2 *)((long)local_78 + (uVar6 - 2)) =
                   *(undefined2 *)((long)auStack_48 + (uVar6 - 2));
            }
          }
          else {
            *(undefined4 *)local_78 = (undefined4)auStack_48[0];
            *(undefined4 *)((long)local_78 + (uVar6 - 4)) =
                 *(undefined4 *)((long)auStack_48 + (uVar6 - 4));
            local_70 = local_50;
          }
        }
        else {
          *local_78 = auStack_48[0];
          *(undefined8 *)((long)local_78 + ((uVar9 & 0xffffffff) - 8)) =
               *(undefined8 *)((long)auStack_48 + ((uVar9 & 0xffffffff) - 8));
          lVar7 = (long)local_78 - ((ulong)(local_78 + 1) & 0xfffffffffffffff8);
          uVar4 = (int)lVar7 + uVar4 & 0xfffffff8;
          local_70 = local_50;
          if (7 < uVar4) {
            uVar8 = 0;
            do {
              uVar6 = (ulong)uVar8;
              uVar8 = uVar8 + 8;
              *(undefined8 *)(((ulong)(local_78 + 1) & 0xfffffffffffffff8) + uVar6) =
                   *(undefined8 *)((long)auStack_48 + (uVar6 - lVar7));
            } while (uVar8 < uVar4);
          }
        }
      }
    }
    *(byte *)((long)local_78 + local_70) = 0;
  }
  else {
    local_78 = local_58;
    local_70 = local_50;
    auStack_68[0] = auStack_48[0];
    if (puVar10 == (ulong *)0x0) goto LAB_001039fa;
    local_58 = puVar10;
    auStack_48[0] = uVar6;
  }
  local_50 = 0;
  *(byte *)local_58 = 0;
  if (local_58 != auStack_48) {
    operator_delete(local_58,auStack_48[0] + 1);
  }
  puVar10 = local_78;
  if (local_78 == (ulong *)((long)local_78 + local_70)) {
LAB_00103934:
    std::__ostream_insert<char,std::char_traits<char>>
              ((ostream *)std::cout,"Please enter a number.\n",0x17);
  }
  else {
    do {
      if (9 < (byte)*puVar10 - 0x30) goto LAB_00103934;
      puVar10 = (ulong *)((long)puVar10 + 1);
    } while ((ulong *)((long)local_78 + local_70) != puVar10);
    if (((local_70 == 3) && ((short)*local_78 == 0x3232)) && (*(byte *)((long)local_78 + 2) == 0x31)
       ) {
      std::__ostream_insert<char,std::char_traits<char>>
                ((ostream *)std::cout,"Lock 3 opened.\n\n",0x10);
      std::__cxx11::string::_M_assign(param_1);
      uVar11 = 1;
      goto LAB_001037d5;
    }
    std::__ostream_insert<char,std::char_traits<char>>((ostream *)std::cout,"Incorrect.\n",0xb);
  }
LAB_001037d3:
  uVar11 = 0;
LAB_001037d5:
  if (local_78 != auStack_68) {
    operator_delete(local_78,auStack_68[0] + 1);
  }
  return uVar11;
}


/* b64_decode(std::__cxx11::string const&) */

string * b64_decode(string *param_1)

{
  long lVar1;
  undefined8 *puVar2;
  long lVar3;
  int iVar4;
  ulong uVar5;
  byte *pbVar6;
  undefined8 *in_RSI;
  undefined8 *puVar7;
  int iVar8;
  int iVar9;
  byte *pbVar10;
  byte bVar11;
  uchar local_39 [9];
  
  bVar11 = 0;
  puVar2 = (undefined8 *)operator_new(0x400);
  *puVar2 = 0xffffffffffffffff;
  puVar2[0x7f] = 0xffffffffffffffff;
  puVar7 = (undefined8 *)((ulong)(puVar2 + 1) & 0xfffffffffffffff8);
  for (uVar5 = (ulong)(((int)puVar2 - (int)(undefined8 *)((ulong)(puVar2 + 1) & 0xfffffffffffffff8))
                       + 0x400U >> 3); lVar1 = b64_digits, uVar5 != 0; uVar5 = uVar5 - 1) {
    *puVar7 = 0xffffffffffffffff;
    puVar7 = puVar7 + (ulong)bVar11 * -2 + 1;
  }
  lVar3 = 0;
  do {
    *(int *)((long)puVar2 + (ulong)*(byte *)(lVar1 + lVar3) * 4) = (int)lVar3;
    lVar3 = lVar3 + 1;
  } while (lVar3 != 0x40);
  pbVar6 = (byte *)*in_RSI;
  lVar1 = in_RSI[1];
  *(undefined8 *)(param_1 + 0x10) = 0;
  *(undefined1 (*) [16])param_1 = (undefined1  [16])0x0;
  pbVar10 = pbVar6 + lVar1;
  if (pbVar6 != pbVar10) {
    iVar8 = 0;
    iVar9 = -8;
    do {
      while( true ) {
        iVar4 = *(int *)((long)puVar2 + (ulong)*pbVar6 * 4);
        if (iVar4 == -1) goto LAB_00103c71;
        iVar8 = iVar8 * 0x40 + iVar4;
        iVar4 = iVar9 + 6;
        if (iVar4 < 0) break;
        local_39[0] = (uchar)(iVar8 >> ((byte)iVar4 & 0x1f));
        if (*(uchar **)(param_1 + 8) == *(uchar **)(param_1 + 0x10)) {
                    /* try { // try from 00103c98 to 00103c9c has its CatchHandler @ 00103c9f */
          std::vector<unsigned_char,std::allocator<unsigned_char>>::_M_realloc_append<unsigned_char>
                    ((vector<unsigned_char,std::allocator<unsigned_char>> *)param_1,local_39);
        }
        else {
          **(uchar **)(param_1 + 8) = local_39[0];
          *(long *)(param_1 + 8) = *(long *)(param_1 + 8) + 1;
        }
        pbVar6 = pbVar6 + 1;
        iVar9 = iVar9 + -2;
        if (pbVar10 == pbVar6) goto LAB_00103c71;
      }
      pbVar6 = pbVar6 + 1;
      iVar9 = iVar4;
    } while (pbVar10 != pbVar6);
  }
LAB_00103c71:
  operator_delete(puVar2,0x400);
  return param_1;
}


/* derive_key_bytes(std::__cxx11::string const&) */

string * derive_key_bytes(string *param_1)

{
  long lVar1;
  uchar uVar2;
  uchar *puVar3;
  uchar *puVar4;
  char *pcVar5;
  undefined8 *in_RSI;
  char *pcVar6;
  uchar local_29;
  
  pcVar5 = (char *)*in_RSI;
  lVar1 = in_RSI[1];
  *(undefined1 (*) [16])param_1 = (undefined1  [16])0x0;
  *(undefined8 *)(param_1 + 0x10) = 0;
  pcVar6 = pcVar5 + lVar1;
  if (pcVar6 != pcVar5) {
    puVar3 = (uchar *)0x0;
    puVar4 = (uchar *)0x0;
    uVar2 = '\0';
    while( true ) {
      uVar2 = *pcVar5 + uVar2 * -0x7d;
      if (puVar4 == puVar3) {
        local_29 = uVar2;
                    /* try { // try from 00103d38 to 00103d3c has its CatchHandler @ 00103d56 */
        std::vector<unsigned_char,std::allocator<unsigned_char>>::_M_realloc_append<unsigned_char>
                  ((vector<unsigned_char,std::allocator<unsigned_char>> *)param_1,&local_29);
      }
      else {
        *puVar4 = uVar2;
        *(long *)(param_1 + 8) = *(long *)(param_1 + 8) + 1;
      }
      if (pcVar6 == pcVar5 + 1) break;
      pcVar5 = pcVar5 + 1;
      puVar4 = *(uchar **)(param_1 + 8);
      puVar3 = *(uchar **)(param_1 + 0x10);
    }
  }
  return param_1;
}


/* reveal_flag(std::__cxx11::string const&, std::__cxx11::string const&, std::__cxx11::string
   const&) */

bool reveal_flag(string *param_1,string *param_2,string *param_3)

{
  long **pplVar1;
  undefined1 uVar2;
  undefined8 uVar3;
  long *plVar4;
  long *plVar5;
  ostream *poVar6;
  ulong uVar7;
  ulong uVar8;
  long lVar9;
  uint uVar10;
  ulong uVar11;
  long *plVar12;
  long **pplVar13;
  long **pplVar14;
  long *plVar15;
  undefined1 *puVar16;
  bool bVar17;
  undefined1 *puVar18;
  _Vector_base<unsigned_char,std::allocator<unsigned_char>> *local_168;
  _Vector_base<unsigned_char,std::allocator<unsigned_char>> *local_128;
  void *local_118;
  long local_110;
  long local_108;
  void *local_f8;
  void *local_f0;
  long local_e8;
  long *local_d8;
  long local_d0;
  long local_c8 [2];
  undefined1 *local_b8;
  long local_b0;
  undefined1 local_a8;
  undefined7 uStack_a7;
  undefined1 *local_98;
  ulong local_90;
  undefined1 local_88;
  undefined7 uStack_87;
  long **local_78;
  long *local_70;
  long *local_68 [2];
  long *local_58;
  long local_50;
  long local_48 [3];
  
  uVar7 = *(ulong *)(param_1 + 8);
  uVar11 = *(ulong *)param_1;
  local_90 = 0;
  local_88 = 0;
  local_98 = &local_88;
                    /* try { // try from 00103db1 to 00103e0d has its CatchHandler @ 001045ed */
  std::__cxx11::string::reserve((ulong)&local_98);
  if (0x3fffffffffffffff - local_90 < uVar7) {
LAB_00102392:
    uVar3 = std::__throw_length_error("basic_string::append");
    std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
    _Unwind_Resume(uVar3);
  }
  std::__cxx11::string::_M_append((char *)&local_98,uVar11);
  if (local_90 == 0x3fffffffffffffff) {
    std::__throw_length_error("basic_string::append");
    goto LAB_00102392;
  }
  std::__cxx11::string::_M_append((char *)&local_98,0x105115);
  if (0x3fffffffffffffff - local_90 < *(ulong *)(param_2 + 8)) {
    uVar3 = std::__throw_length_error("basic_string::append");
LAB_00102365:
    std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
    _Unwind_Resume(uVar3);
  }
                    /* try { // try from 00103e34 to 00103e38 has its CatchHandler @ 001045e8 */
  plVar4 = (long *)std::__cxx11::string::_M_append((char *)&local_98,*(ulong *)param_2);
  pplVar1 = (long **)(plVar4 + 2);
  local_78 = local_68;
  if ((long **)*plVar4 == pplVar1) {
    uVar7 = plVar4[1] + 1;
    pplVar13 = pplVar1;
    pplVar14 = local_68;
    if (7 < (uint)uVar7) {
      uVar11 = 0;
      do {
        uVar10 = (int)uVar11 + 8;
        uVar8 = (ulong)uVar10;
        *(undefined8 *)((long)local_68 + uVar11) = *(undefined8 *)((long)pplVar1 + uVar11);
        uVar11 = uVar8;
      } while (uVar10 < ((uint)uVar7 & 0xfffffff8));
      pplVar14 = (long **)((long)local_68 + uVar8);
      pplVar13 = (long **)(uVar8 + (long)pplVar1);
    }
    lVar9 = 0;
    if ((uVar7 & 4) != 0) {
      *(undefined4 *)pplVar14 = *(undefined4 *)pplVar13;
      lVar9 = 4;
    }
    if ((uVar7 & 2) != 0) {
      *(undefined2 *)((long)pplVar14 + lVar9) = *(undefined2 *)((long)pplVar13 + lVar9);
      lVar9 = lVar9 + 2;
    }
    if ((uVar7 & 1) != 0) {
      *(undefined1 *)((long)pplVar14 + lVar9) = *(undefined1 *)((long)pplVar13 + lVar9);
    }
  }
  else {
    local_68[0] = (long *)plVar4[2];
    local_78 = (long **)*plVar4;
  }
  local_70 = (long *)plVar4[1];
  *plVar4 = (long)pplVar1;
  plVar4[1] = 0;
  *(undefined1 *)(plVar4 + 2) = 0;
  if (local_70 == (long *)0x3fffffffffffffff) {
    std::__throw_length_error("basic_string::append");
    std::__cxx11::string::_M_dispose();
    std::__cxx11::string::_M_dispose();
    std::_Vector_base<unsigned_char,std::allocator<unsigned_char>>::~_Vector_base(local_168);
    std::__cxx11::string::_M_dispose();
    std::__cxx11::string::_M_dispose();
    std::_Vector_base<unsigned_char,std::allocator<unsigned_char>>::~_Vector_base(local_128);
    std::__cxx11::string::_M_dispose();
                    /* WARNING: Subroutine does not return */
    _Unwind_Resume(&local_88);
  }
                    /* try { // try from 00103eb8 to 00103ebc has its CatchHandler @ 001045e3 */
  plVar5 = (long *)std::__cxx11::string::_M_append((char *)&local_78,0x105115);
  plVar4 = plVar5 + 2;
  if ((long *)*plVar5 == plVar4) {
    uVar7 = plVar5[1] + 1;
    plVar12 = plVar4;
    plVar15 = local_48;
    if (7 < (uint)uVar7) {
      uVar11 = 0;
      do {
        uVar10 = (int)uVar11 + 8;
        uVar8 = (ulong)uVar10;
        *(undefined8 *)((long)local_48 + uVar11) = *(undefined8 *)((long)plVar4 + uVar11);
        uVar11 = uVar8;
      } while (uVar10 < ((uint)uVar7 & 0xfffffff8));
      plVar15 = (long *)((long)local_48 + uVar8);
      plVar12 = (long *)(uVar8 + (long)plVar4);
    }
    lVar9 = 0;
    if ((uVar7 & 4) != 0) {
      *(int *)plVar15 = (int)*plVar12;
      lVar9 = 4;
    }
    if ((uVar7 & 2) != 0) {
      *(undefined2 *)((long)plVar15 + lVar9) = *(undefined2 *)((long)plVar12 + lVar9);
      lVar9 = lVar9 + 2;
    }
    local_58 = local_48;
    if ((uVar7 & 1) != 0) {
      *(undefined1 *)((long)plVar15 + lVar9) = *(undefined1 *)((long)plVar12 + lVar9);
    }
  }
  else {
    local_48[0] = plVar5[2];
    local_58 = (long *)*plVar5;
  }
  local_50 = plVar5[1];
  plVar5[1] = 0;
  *plVar5 = (long)plVar4;
  *(undefined1 *)(plVar5 + 2) = 0;
  if (0x3fffffffffffffffU - local_50 < *(ulong *)(param_3 + 8)) {
    uVar3 = std::__throw_length_error("basic_string::append");
    std::__cxx11::string::_M_dispose();
    std::__cxx11::string::_M_dispose();
    goto LAB_00102365;
  }
                    /* try { // try from 00103f44 to 00103f48 has its CatchHandler @ 0010460a */
  plVar5 = (long *)std::__cxx11::string::_M_append((char *)&local_58,*(ulong *)param_3);
  plVar4 = plVar5 + 2;
  if ((long *)*plVar5 == plVar4) {
    uVar7 = plVar5[1] + 1;
    plVar12 = plVar4;
    plVar15 = local_c8;
    if (7 < (uint)uVar7) {
      uVar11 = 0;
      do {
        uVar10 = (int)uVar11 + 8;
        uVar8 = (ulong)uVar10;
        *(undefined8 *)((long)local_c8 + uVar11) = *(undefined8 *)((long)plVar4 + uVar11);
        uVar11 = uVar8;
      } while (uVar10 < ((uint)uVar7 & 0xfffffff8));
      plVar15 = (long *)((long)local_c8 + uVar8);
      plVar12 = (long *)(uVar8 + (long)plVar4);
    }
    lVar9 = 0;
    if ((uVar7 & 4) != 0) {
      *(int *)plVar15 = (int)*plVar12;
      lVar9 = 4;
    }
    if ((uVar7 & 2) != 0) {
      *(undefined2 *)((long)plVar15 + lVar9) = *(undefined2 *)((long)plVar12 + lVar9);
      lVar9 = lVar9 + 2;
    }
    local_d8 = local_c8;
    if ((uVar7 & 1) != 0) {
      *(undefined1 *)((long)plVar15 + lVar9) = *(undefined1 *)((long)plVar12 + lVar9);
    }
  }
  else {
    local_c8[0] = plVar5[2];
    local_d8 = (long *)*plVar5;
  }
  local_d0 = plVar5[1];
  *plVar5 = (long)plVar4;
  *(undefined1 *)(plVar5 + 2) = 0;
  plVar5[1] = 0;
  if (local_58 != local_48) {
    operator_delete(local_58,local_48[0] + 1);
  }
  if (local_78 != local_68) {
    operator_delete(local_78,(long)local_68[0] + 1);
  }
  if (local_98 != &local_88) {
    operator_delete(local_98,CONCAT71(uStack_87,local_88) + 1);
  }
                    /* try { // try from 00104016 to 0010401a has its CatchHandler @ 00104617 */
  derive_key_bytes((string *)&local_118);
  local_b0 = 0;
  local_a8 = 0;
  local_b8 = &local_a8;
                    /* try { // try from 0010405d to 00104061 has its CatchHandler @ 001045db */
  std::__cxx11::string::resize((ulong)&local_b8,'$');
  uVar7 = 0;
  do {
    local_b8[uVar7] =
         *(byte *)((long)local_118 + uVar7 % (ulong)(local_110 - (long)local_118)) ^ (&OBFS)[uVar7];
    uVar7 = uVar7 + 1;
  } while (uVar7 != 0x24);
  local_90 = 0;
  puVar18 = local_b8 + local_b0;
  local_88 = 0;
  local_98 = &local_88;
  uVar7 = local_90;
  for (puVar16 = local_b8; local_90 = uVar7, puVar18 != puVar16; puVar16 = puVar16 + 1) {
    uVar2 = *puVar16;
    uVar11 = uVar7 + 1;
    if (local_98 == &local_88) {
      uVar8 = 0xf;
    }
    else {
      uVar8 = CONCAT71(uStack_87,local_88);
    }
    if (uVar8 < uVar11) {
                    /* try { // try from 0010415a to 001041a9 has its CatchHandler @ 001045f2 */
      std::__cxx11::string::_M_mutate((ulong)&local_98,uVar7,(char *)0x0,0);
    }
    local_98[uVar7] = uVar2;
    local_98[uVar11] = 0;
    uVar7 = uVar11;
  }
  b64_decode((string *)&local_f8);
  if (local_f0 == local_f8) {
    std::__ostream_insert<char,std::char_traits<char>>
              ((ostream *)std::cout,
               "Decryption failed: payload doesn\'t decode as base64. Check components.\n",0x47);
    bVar17 = false;
    if (local_f8 == (void *)0x0) goto LAB_00104314;
  }
  else {
    local_70 = (long *)0x0;
    local_58 = (long *)((long)local_f0 - (long)local_f8);
    local_78 = local_68;
    if ((long *)0xf < local_58) {
                    /* try { // try from 0010440c to 00104447 has its CatchHandler @ 00104602 */
      local_78 = (long **)std::__cxx11::string::_M_create((ulong *)&local_78,(ulong)&local_58);
      local_68[0] = local_58;
    }
    lVar9 = 0;
    do {
      *(undefined1 *)((long)local_78 + lVar9) = *(undefined1 *)((long)local_f8 + lVar9);
      lVar9 = lVar9 + 1;
    } while ((long)local_f0 - (long)local_f8 != lVar9);
    local_70 = local_58;
    *(undefined1 *)((long)local_78 + (long)local_58) = 0;
                    /* try { // try from 0010423a to 0010423e has its CatchHandler @ 0010460f */
    rot13((string *)&local_58);
    lVar9 = std::__cxx11::string::find((char *)&local_58,0x105117,0);
    if (lVar9 == -1) {
      std::__ostream_insert<char,std::char_traits<char>>
                ((ostream *)std::cout,"Decoded text doesn\'t look like the expected token. Show:\n",
                 0x39);
      poVar6 = std::__ostream_insert<char,std::char_traits<char>>
                         ((ostream *)std::cout,(char *)local_58,local_50);
      std::__ostream_insert<char,std::char_traits<char>>(poVar6,"\n",1);
    }
    else {
                    /* try { // try from 00104275 to 001043ee has its CatchHandler @ 001045fa */
      std::__ostream_insert<char,std::char_traits<char>>
                ((ostream *)std::cout,"=== VAULT OPENED ===\n",0x15);
      std::__ostream_insert<char,std::char_traits<char>>((ostream *)std::cout,"Secret token: ",0xe);
      poVar6 = std::__ostream_insert<char,std::char_traits<char>>
                         ((ostream *)std::cout,(char *)local_58,local_50);
      std::__ostream_insert<char,std::char_traits<char>>(poVar6,"\n",1);
    }
    bVar17 = lVar9 != -1;
    if (local_58 != local_48) {
      operator_delete(local_58,local_48[0] + 1);
    }
    if (local_78 != local_68) {
      operator_delete(local_78,(long)local_68[0] + 1);
    }
  }
  operator_delete(local_f8,local_e8 - (long)local_f8);
LAB_00104314:
  if (local_98 != &local_88) {
    operator_delete(local_98,CONCAT71(uStack_87,local_88) + 1);
  }
  if (local_b8 != &local_a8) {
    operator_delete(local_b8,CONCAT71(uStack_a7,local_a8) + 1);
  }
  if (local_118 != (void *)0x0) {
    operator_delete(local_118,local_108 - (long)local_118);
  }
  if (local_d8 != local_c8) {
    operator_delete(local_d8,local_c8[0] + 1);
  }
  return bVar17;
}


/* std::ctype<char>::do_widen(char) const */

undefined4 __thiscall std::ctype<char>::do_widen(ctype<char> *this,char param_1)

{
  undefined3 in_register_00000031;
  
  return CONCAT31(in_register_00000031,param_1);
}


/* std::_Vector_base<unsigned char, std::allocator<unsigned char> >::~_Vector_base() */

void __thiscall
std::_Vector_base<unsigned_char,std::allocator<unsigned_char>>::~_Vector_base
          (_Vector_base<unsigned_char,std::allocator<unsigned_char>> *this)

{
  void *pvVar1;
  
  pvVar1 = *(void **)this;
  if (pvVar1 != (void *)0x0) {
    operator_delete(pvVar1,*(long *)(this + 0x10) - (long)pvVar1);
    return;
  }
  return;
}


/* WARNING: Control flow encountered bad instruction data */
/* void std::vector<unsigned char, std::allocator<unsigned char> >::_M_realloc_append<unsigned
   char>(unsigned char&&) */

void __thiscall
std::vector<unsigned_char,std::allocator<unsigned_char>>::_M_realloc_append<unsigned_char>
          (vector<unsigned_char,std::allocator<unsigned_char>> *this,uchar *param_1)

{
  void *__src;
  ulong uVar1;
  void *__dest;
  ulong __n;
  ulong uVar2;
  
  uVar1 = 0x7fffffffffffffff;
  __src = *(void **)this;
  __n = *(long *)(this + 8) - (long)__src;
  if (__n == 0x7fffffffffffffff) {
    std::__throw_length_error("vector::_M_realloc_append");
                    /* WARNING: Bad instruction - Truncating control flow here */
    halt_baddata();
  }
  uVar2 = 1;
  if (__n != 0) {
    uVar2 = __n;
  }
  if ((!CARRY8(uVar2,__n)) && (uVar1 = uVar2 + __n, 0x7fffffffffffffff < uVar2 + __n)) {
    uVar1 = 0x7fffffffffffffff;
  }
  __dest = operator_new(uVar1);
  *(uchar *)((long)__dest + __n) = *param_1;
  if ((long)__n < 1) {
    if (__src == (void *)0x0) goto LAB_001046d9;
    uVar2 = *(long *)(this + 0x10) - (long)__src;
  }
  else {
    memcpy(__dest,__src,__n);
    uVar2 = *(long *)(this + 0x10) - (long)__src;
  }
  operator_delete(__src,uVar2);
LAB_001046d9:
  *(void **)this = __dest;
  *(ulong *)(this + 8) = (long)__dest + __n + 1;
  *(ulong *)(this + 0x10) = (long)__dest + uVar1;
  return;
}


void _fini(void)

{
  return;
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

int isspace(int param_1)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* isspace@GLIBC_2.2.5 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::resize(ulong param_1,char param_2)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6resizeEmc@GLIBCXX_3.4.21
                        */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_append(char *param_1,ulong param_2)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm@GLIBCXX_3.4.21
                        */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::ios_base::sync_with_stdio(bool param_1)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZNSt8ios_base15sync_with_stdioEb@GLIBCXX_3.4 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__throw_length_error(char *param_1)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZSt20__throw_length_errorPKc@GLIBCXX_3.4 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_assign(string *param_1)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_assignERKS4_@GLIBCXX_3.4.21
                        */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */

void __thiscall std::__cxx11::string::~string(string *this)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@GLIBCXX_3.4.21 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::ostream::flush(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZNSo5flushEv@GLIBCXX_3.4 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */

void __libc_start_main(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* __libc_start_main@GLIBC_2.34 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void * memcpy(void *__dest,void *__src,size_t __n)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* memcpy@GLIBC_2.14 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */

void __cxa_atexit(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* __cxa_atexit@GLIBC_2.2.5 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

ostream * std::operator<<(ostream *param_1,char *param_2)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@GLIBCXX_3.4 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void * operator_new(ulong param_1)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _Znwm@GLIBCXX_3.4 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void operator_delete(void *param_1,ulong param_2)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZdlPvm@CXXABI_1.3.9 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

ostream * std::__ostream_insert<char,std::char_traits<char>>
                    (ostream *param_1,char *param_2,long param_3)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@GLIBCXX_3.4.9
                        */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::ctype<char>::_M_widen_init(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZNKSt5ctypeIcE13_M_widen_initEv@GLIBCXX_3.4.11 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_dispose(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@GLIBCXX_3.4.21
                        */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__throw_bad_cast(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZSt16__throw_bad_castv@GLIBCXX_3.4 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__throw_out_of_range_fmt(char *param_1,...)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZSt24__throw_out_of_range_fmtPKcz@GLIBCXX_3.4.20 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::ios_base_library_init(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZSt21ios_base_library_initv@GLIBCXX_3.4.32 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::reserve(ulong param_1)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm@GLIBCXX_3.4.21
                        */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */

void __gxx_personality_v0(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* __gxx_personality_v0@CXXABI_1.3 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::find(char *param_1,ulong param_2,ulong param_3)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE4findEPKcmm@GLIBCXX_3.4.21
                        */
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
                    /* _Unwind_Resume@GCC_3.0 */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_create(ulong *param_1,ulong param_2)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@GLIBCXX_3.4.21
                        */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

void std::__cxx11::string::_M_mutate(ulong param_1,ulong param_2,char *param_3,ulong param_4)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEmmPKcm@GLIBCXX_3.4.21
                        */
  halt_baddata();
}


/* WARNING: Control flow encountered bad instruction data */
/* WARNING: Unknown calling convention -- yet parameter storage is locked */

istream * std::getline<char,std::char_traits<char>,std::allocator<char>>
                    (istream *param_1,string *param_2,char param_3)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* _ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EES4_@GLIBCXX_3.4.21
                        */
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

void __cxa_finalize(void)

{
                    /* WARNING: Bad instruction - Truncating control flow here */
                    /* __cxa_finalize@GLIBC_2.2.5 */
  halt_baddata();
}

