@[translated]
module main

type U16 = u16
type U32 = u32
type U64 = u64
type S8 = Int8_t
type S16 = i16
type S32 = int
type S64 = i64
type Vu8 = U8
type Vu16 = U16
type Vu32 = u32
type Vu64 = U64
type Vs8 = S8
type Vs16 = S16
type Vs32 = S32
type Vs64 = S64
type Sfp16 = S16
type Sfp32 = S32
type Ufp16 = U16
type Ufp32 = u32
type F32 = f32
type F64 = f64
type Vf32 = f32
type Vf64 = f64

struct Argv {
	argvMagic   int
	commandLine &i8
	length      int
	argc        int
	argv        &&u8
	endARGV     &&u8
}

fn time(__timer &Time_t) Time_t

type Lwp_node = Lwpnode

struct Lwp_queue {
	first     &Lwp_node
	perm_null &Lwp_node
	last      &Lwp_node
}

type GXRModeObj = Gx_rmodeobj
type Syswd_t = u32

struct Syssram {
	checksum        U16
	checksum_inv    U16
	ead0            u32
	ead1            u32
	counter_bias    u32
	display_offsetH S8
	ntd             U8
	lang            U8
	flags           U8
}

struct Alarmcallback {
	flash_id       [2][12]U8
	wirelessKbd_id u32
	wirelessPad_id [4]U16
	dvderr_code    U8
	__padding0     U8
	flashID_chksum [2]U8
	gbs            U16
	__padding1     U16
}

struct Resetcallback {
	font_type      U16
	first_char     U16
	last_char      U16
	inval_char     U16
	asc            U16
	desc           U16
	width          U16
	leading        U16
	cell_width     U16
	cell_height    U16
	sheet_size     u32
	sheet_format   U16
	sheet_column   U16
	sheet_row      U16
	sheet_width    U16
	sheet_height   U16
	width_table    U16
	sheet_image    u32
	sheet_fullsize u32
	c0             U8
	c1             U8
	c2             U8
	c3             U8
}

type Powercallback = fn ()

type Resetfunction = fn (S32) S32

struct Sys_resetinfo {
	node Lwp_node
	func Resetfunction
	prio u32
}

@[c: 'SYS_Init']
fn sys_init()

@[c: 'SYS_AllocateFramebuffer']
fn sys_allocateframebuffer(rmode &GXRModeObj) voidptr

@[c: 'SYS_ProtectRange']
fn sys_protectrange(chan u32, addr voidptr, bytes u32, cntrl u32)

@[c: 'SYS_StartPMC']
fn sys_startpmc(mcr0val u32, mcr1val u32)

@[c: 'SYS_DumpPMC']
fn sys_dumppmc()

@[c: 'SYS_StopPMC']
fn sys_stoppmc()

@[c: 'SYS_ResetPMC']
fn sys_resetpmc()

@[c: 'SYS_CreateAlarm']
fn sys_createalarm(thealarm &Syswd_t) S32

@[c: 'SYS_SetAlarm']
fn sys_setalarm(thealarm Syswd_t, tp &Timespec, cb Alarmcallback, cbarg voidptr) S32

@[c: 'SYS_SetPeriodicAlarm']
fn sys_setperiodicalarm(thealarm Syswd_t, tp_start &Timespec, tp_period &Timespec, cb Alarmcallback, cbarg voidptr) S32

@[c: 'SYS_RemoveAlarm']
fn sys_removealarm(thealarm Syswd_t) S32

@[c: 'SYS_CancelAlarm']
fn sys_cancelalarm(thealarm Syswd_t) S32

@[c: 'SYS_GetCounterBias']
fn sys_getcounterbias() u32

@[c: 'SYS_SetCounterBias']
fn sys_setcounterbias(bias u32)

@[c: 'SYS_GetDisplayOffsetH']
fn sys_getdisplayoffseth() S8

@[c: 'SYS_SetDisplayOffsetH']
fn sys_setdisplayoffseth(offset S8)

@[c: 'SYS_GetEuRGB60']
fn sys_geteurgb60() U8

@[c: 'SYS_SetEuRGB60']
fn sys_seteurgb60(enable U8)

@[c: 'SYS_GetLanguage']
fn sys_getlanguage() U8

@[c: 'SYS_SetLanguage']
fn sys_setlanguage(lang U8)

@[c: 'SYS_GetProgressiveScan']
fn sys_getprogressivescan() U8

@[c: 'SYS_SetProgressiveScan']
fn sys_setprogressivescan(enable U8)

@[c: 'SYS_GetSoundMode']
fn sys_getsoundmode() U8

@[c: 'SYS_SetSoundMode']
fn sys_setsoundmode(mode U8)

@[c: 'SYS_GetVideoMode']
fn sys_getvideomode() U8

@[c: 'SYS_SetVideoMode']
fn sys_setvideomode(mode U8)

@[c: 'SYS_GetWirelessID']
fn sys_getwirelessid(chan u32) U16

@[c: 'SYS_SetWirelessID']
fn sys_setwirelessid(chan u32, id U16)

@[c: 'SYS_GetGBSMode']
fn sys_getgbsmode() U16

@[c: 'SYS_SetGBSMode']
fn sys_setgbsmode(mode U16)

@[c: 'SYS_GetFontEncoding']
fn sys_getfontencoding() u32

@[c: 'SYS_InitFont']
fn sys_initfont(font_data &Sys_fontheader) u32

@[c: 'SYS_GetFontTexture']
fn sys_getfonttexture(c S32, image &voidptr, xpos &S32, ypos &S32, width &S32)

@[c: 'SYS_GetFontTexel']
fn sys_getfonttexel(c S32, image voidptr, pos S32, stride S32, width &S32)

@[c: 'SYS_ResetSystem']
fn sys_resetsystem(reset S32, reset_code u32, force_menu S32)

@[c: 'SYS_RegisterResetFunc']
fn sys_registerresetfunc(info &Sys_resetinfo)

@[c: 'SYS_UnregisterResetFunc']
fn sys_unregisterresetfunc(info &Sys_resetinfo)

@[c: 'SYS_SwitchFiber']
fn sys_switchfiber(arg0 u32, arg1 u32, arg2 u32, arg3 u32, pc u32, newsp u32)

@[c: 'SYS_GetArena1Lo']
fn sys_getarena1lo() voidptr

@[c: 'SYS_SetArena1Lo']
fn sys_setarena1lo(newlo voidptr)

@[c: 'SYS_GetArena1Hi']
fn sys_getarena1hi() voidptr

@[c: 'SYS_SetArena1Hi']
fn sys_setarena1hi(newhi voidptr)

@[c: 'SYS_GetArena1Size']
fn sys_getarena1size() u32

@[c: 'SYS_SetResetCallback']
fn sys_setresetcallback(cb Resetcallback) Resetcallback

@[c: 'SYS_ResetButtonDown']
fn sys_resetbuttondown() u32

@[c: 'SYS_Time']
fn sys_time() U64

@[c2v_variadic]
fn kprintf(str ...&i8)
