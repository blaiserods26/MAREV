
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00138531(void)

{
  (*_DAT_0013b501)();
  return;
}


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00138541(void)

{
  (*_DAT_0013b509)();
  return;
}


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00138551(void)

{
  (*_DAT_0013b511)();
  return;
}


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00138561(void)

{
  (*_DAT_0013b519)();
  return;
}


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00138571(void)

{
  (*_DAT_0013b521)();
  return;
}


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00138581(void)

{
  (*_DAT_0013b529)();
  return;
}


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00138591(void)

{
  (*_DAT_0013b531)();
  return;
}


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_001385a1(void)

{
  (*_DAT_0013b539)();
  return;
}


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_001385b1(void)

{
  (*_DAT_0013b541)();
  return;
}


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_001385c1(void)

{
  (*_DAT_0013b549)();
  return;
}


int FUN_001386ca(undefined8 param_1,long param_2,long param_3)

{
  int iVar1;
  long lVar2;
  
  iVar1 = FUN_00138531(param_1,0);
  if (iVar1 == -1) {
    FUN_001385a1(&DAT_00139505);
    FUN_001385b1(1);
  }
  lVar2 = FUN_00138541(iVar1,param_2,param_3 - param_2);
  if (lVar2 != param_3 - param_2) {
    FUN_001385a1(&DAT_00139512);
    FUN_001385b1(1);
  }
  return iVar1;
}


undefined8 FUN_0013875c(undefined8 param_1,undefined8 param_2,undefined8 param_3)

{
  undefined *local_c8;
  undefined *local_c0;
  undefined1 *local_b8;
  undefined8 local_b0;
  undefined1 local_a8 [76];
  undefined1 local_5c [4];
  undefined1 local_58 [68];
  int local_14;
  undefined4 local_10;
  undefined4 local_c;
  
  local_c = FUN_001386ca(&DAT_00139518,&DAT_0013b561,&DAT_00159cb7);
  local_10 = FUN_001386ca(&DAT_0013951e,&DAT_00159cb7,0x16f171);
  FUN_00138551(local_58,0x40,&DAT_00139529,local_10);
  local_14 = FUN_001385c1();
  if (local_14 == 0) {
    local_c8 = &DAT_00139518;
    local_c0 = &DAT_0013953a;
    local_b8 = local_58;
    local_b0 = 0;
    FUN_00138581(local_c,&local_c8,param_3);
    FUN_00138551(local_a8,0x40,&DAT_00139529,local_c);
    FUN_00138571(local_a8,&local_c8,param_3);
    FUN_001385a1(&DAT_00139541);
    FUN_001385b1(1);
  }
  if (local_14 < 1) {
    FUN_001385a1(&DAT_00139550);
  }
  else {
    FUN_00138591(local_14,local_5c,0);
  }
  FUN_00138561(local_c);
  FUN_00138561(local_10);
  return 0;
}


/* WARNING: Instruction at (ram,0x00162440) overlaps instruction at (ram,0x0016243f)
    */
/* WARNING: Removing unreachable block (ram,0x001623cb) */
/* WARNING: Removing unreachable block (ram,0x001623d3) */
/* WARNING: Removing unreachable block (ram,0x001623cf) */

void processEntry entry(undefined8 param_1)

{
  ulong *puVar1;
  long lVar2;
  uint uVar3;
  undefined8 uVar4;
  uint uVar5;
  undefined8 uVar6;
  undefined8 uVar7;
  int iVar8;
  uint uVar9;
  int extraout_EDX;
  ulong uVar10;
  code *pcVar11;
  code *extraout_RDX;
  code *extraout_RDX_00;
  code *extraout_RDX_01;
  code *extraout_RDX_02;
  code *extraout_RDX_03;
  code *extraout_RDX_04;
  undefined8 *puVar12;
  long lVar13;
  long *plVar14;
  undefined1 *puVar15;
  undefined1 *puVar16;
  long *plVar17;
  undefined1 *puVar18;
  byte bVar19;
  byte bVar20;
  byte bVar21;
  undefined1 auVar22 [16];
  long lStack_38;
  long lStack_30;
  long lStack_28;
  undefined8 local_20;
  ulong local_18;
  undefined8 uStack_10;
  long local_8;
  
  plVar14 = (long *)&stack0x00000008;
  do {
    lVar13 = *plVar14;
    plVar17 = plVar14 + 1;
    plVar14 = plVar14 + 1;
  } while (lVar13 != 0);
  do {
    plVar14 = plVar17 + 1;
    lVar13 = *plVar17;
    plVar17 = plVar14;
  } while (lVar13 != 0);
  uVar10 = 0x1000;
  do {
    puVar1 = (ulong *)(plVar14 + 1);
    lVar13 = *plVar14;
    if ((int)lVar13 == 0) goto LAB_001623b0;
    plVar14 = plVar14 + 2;
  } while ((int)lVar13 != 6);
  uVar10 = *puVar1 & 0xffffffff;
LAB_001623b0:
  local_8 = -uVar10;
  syscall();
  uVar6 = 0x13f;
  lStack_28 = (long)&DAT_00162384 - (ulong)DAT_00162384;
  local_18 = (ulong)(DAT_00162520 + 0x10);
  local_20 = 0xffffffffffffffff;
  lStack_30 = (ulong)DAT_00162384 - (ulong)DAT_0016251c;
  lStack_38 = (ulong)DAT_0016251c + lStack_28;
  puVar12 = (undefined8 *)((long)&lStack_38 - local_18 & 0xffffffffffffffc0);
  puVar12[-1] = puVar12;
  puVar18 = (undefined1 *)puVar12[-1];
  puVar12[-1] = (ulong)DAT_00162524;
  if ((short)DAT_00162528 != 2) {
    do {
                    /* WARNING: Do nothing block with infinite loop */
    } while( true );
  }
  puVar12[-1] = &DAT_0016252c + puVar12[-1];
  puVar12[-2] = &lStack_38;
  uVar7 = 0;
  pcVar11 = FUN_00162507;
  puVar12[-3] = 0xffffffffffffffff;
  lVar13 = puVar12[-3];
  bVar21 = 0;
  bVar19 = 0;
  puVar15 = &DAT_0016252c;
  uStack_10 = param_1;
  do {
    while( true ) {
      puVar12[-3] = 0x162443;
      (*pcVar11)();
      pcVar11 = extraout_RDX;
      if (!(bool)bVar19) break;
      *puVar18 = *puVar15;
      puVar15 = puVar15 + (ulong)bVar21 * -2 + 1;
      puVar18 = puVar18 + (ulong)bVar21 * -2 + 1;
    }
    do {
      puVar12[-3] = 0x16244a;
      uVar5 = (*pcVar11)();
      bVar19 = CARRY4(uVar5,uVar5) || CARRY4(uVar5 * 2,(uint)bVar19);
      puVar12[-3] = 0x16244e;
      uVar5 = (*extraout_RDX_00)();
      uVar9 = (uint)uVar7;
      pcVar11 = extraout_RDX_01;
    } while (!(bool)bVar19);
    bVar19 = uVar5 < 3;
    puVar16 = puVar15;
    if (!(bool)bVar19) {
      puVar16 = puVar15 + (ulong)bVar21 * -2 + 1;
      bVar19 = false;
      uVar5 = CONCAT31((int3)uVar5 + -3,*puVar15) ^ 0xffffffff;
      if (uVar5 == 0) {
        lVar13 = puVar12[-2];
        if (puVar16 != (undefined1 *)puVar12[-1]) {
          do {
                    /* WARNING: Do nothing block with infinite loop */
          } while( true );
        }
        *puVar12 = *(undefined8 *)(lVar13 + 0x30);
        lVar2 = *(long *)(lVar13 + 0x20);
        puVar12[-1] = puVar12;
        puVar12[-1] = lVar2 + -0x10;
        do {
          puVar12[-2] = 1;
          puVar12[-2] = 0x1624b3;
          iVar8 = FUN_001624e8();
        } while (extraout_EDX != iVar8);
        uVar7 = puVar12[-1];
        puVar12[-1] = lVar13;
        lVar2 = puVar12[-1];
        *(undefined8 *)(lVar2 + -8) = 1;
        *(undefined8 *)(lVar2 + -8) = 5;
        uVar4 = *(undefined8 *)(lVar2 + -8);
        *(undefined8 *)(lVar2 + -8) = 9;
        *(undefined8 *)(lVar2 + -8) = 0x1624d4;
        uVar7 = FUN_001624e8(0,uVar7,uVar4);
        *(undefined8 *)(lVar2 + -8) = uVar7;
        *(undefined8 *)(lVar13 + 0x18) = uVar7;
        *(undefined8 *)(lVar2 + -0x10) = uVar6;
        uVar6 = *(undefined8 *)(lVar2 + -0x10);
        *(undefined8 *)(lVar2 + -0x10) = 3;
        syscall();
                    /* WARNING: Could not recover jumptable at 0x001624e6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
        (*(code *)(*(long *)(lVar2 + -8) + 8))(uVar6);
        return;
      }
      lVar13 = (long)(int)uVar5;
    }
    puVar12[-3] = 0x162466;
    (*extraout_RDX_01)();
    bVar20 = CARRY4(uVar9,uVar9) || CARRY4(uVar9 * 2,(uint)bVar19);
    iVar8 = uVar9 * 2 + (uint)bVar19;
    puVar12[-3] = 0x16246a;
    auVar22 = (*extraout_RDX_02)();
    pcVar11 = auVar22._8_8_;
    uVar5 = auVar22._0_4_;
    uVar9 = iVar8 * 2 + (uint)bVar20;
    if (uVar9 == 0) {
      uVar10 = auVar22._0_8_ & 0xffffffff;
      bVar19 = 0xfffffffd < uVar5;
      do {
        uVar9 = (uint)uVar10;
        puVar12[-3] = 0x162475;
        (*pcVar11)();
        uVar5 = (uint)bVar19;
        bVar19 = CARRY4(uVar9,uVar9) || CARRY4(uVar9 * 2,uVar5);
        uVar10 = (ulong)(uVar9 * 2 + uVar5);
        puVar12[-3] = 0x162479;
        uVar5 = (*extraout_RDX_03)();
        uVar9 = (uint)uVar10;
        pcVar11 = extraout_RDX_04;
      } while (!(bool)bVar19);
    }
    uVar3 = (uint)((uint)lVar13 < 0xfffff300);
    bVar19 = CARRY4(uVar9,uVar5) || CARRY4(uVar9 + uVar5,uVar3);
    puVar12[-3] = puVar16;
    puVar15 = puVar18 + lVar13;
    for (uVar10 = (ulong)(uVar9 + uVar5 + uVar3); uVar10 != 0; uVar10 = uVar10 - 1) {
      *puVar18 = *puVar15;
      puVar15 = puVar15 + (ulong)bVar21 * -2 + 1;
      puVar18 = puVar18 + (ulong)bVar21 * -2 + 1;
    }
    uVar7 = 0;
    puVar15 = (undefined1 *)puVar12[-3];
  } while( true );
}


void FUN_001624e8(void)

{
  ulong in_RAX;
  
  syscall();
  if (0xffffffffffffefff < in_RAX) {
    do {
                    /* WARNING: Do nothing block with infinite loop */
    } while( true );
  }
  return;
}


void FUN_00162507(void)

{
  uint unaff_EBX;
  
  if ((unaff_EBX & 0x7fffffff) != 0) {
    return;
  }
  return;
}

