@[translated]
module sys
import gx

struct Argv {
	argvMagic   int
	commandLine &i8
	length      int
	argc        int
	argv        &&u8
	endARGV     &&u8
}

//pub fn time(__timer &Time_t) Time_t

//type Lwp_node = Lwpnode

/*pub struct Lwp_queue {
	first     &Lwp_node
	perm_null &Lwp_node
	last      &Lwp_node
}*/

//type GXRModeObj = Gx_rmodeobj
//type Syswd_t = u32

/*pub struct Syssram {
	checksum        u16
	checksum_inv    u16
	ead0            u32
	ead1            u32
	counter_bias    u32
	display_offsetH i8
	ntd             u8
	lang            u8
	flags           u8
}*/

pub struct Alarmcallback {
	flash_id       [2][12]u8
	wirelessKbd_id u32
	wirelessPad_id [4]u16
	dvderr_code    u8
	__padding0     u8
	flashID_chksum [2]u8
	gbs            u16
	__padding1     u16
}

struct Resetcallback {
	font_type      u16
	first_char     u16
	last_char      u16
	inval_char     u16
	asc            u16
	desc           u16
	width          u16
	leading        u16
	cell_width     u16
	cell_height    u16
	sheet_size     u32
	sheet_format   u16
	sheet_column   u16
	sheet_row      u16
	sheet_width    u16
	sheet_height   u16
	width_table    u16
	sheet_image    u32
	sheet_fullsize u32
	c0             u8
	c1             u8
	c2             u8
	c3             u8
}

type Powercallback = fn ()

type Resetfunction = fn (i32) i32

/*struct Sys_resetinfo {
	node Lwp_node
	func Resetfunction
	prio u32
}*/

@[c: 'SYS_Init']
pub fn sysinit()

@[c: 'SYS_AllocateFramebuffer']
pub fn allocateframebuffer(rmode &gx.GXRModeObj) voidptr

@[c: 'SYS_ProtectRange']
pub fn protectrange(chan u32, addr voidptr, bytes u32, cntrl u32)

@[c: 'SYS_StartPMC']
pub fn startpmc(mcr0val u32, mcr1val u32)

@[c: 'SYS_DumpPMC']
pub fn dumppmc()

@[c: 'SYS_StopPMC']
pub fn stoppmc()

@[c: 'SYS_ResetPMC']
pub fn resetpmc()

//@[c: 'SYS_CreateAlarm']
//pub fn createalarm(thealarm &Syswd_t) i32

//@[c: 'SYS_SetAlarm']
//pub fn setalarm(thealarm Syswd_t, tp &Timespec, cb Alarmcallback, cbarg voidptr) i32

//@[c: 'SYS_SetPeriodicAlarm']
//pub fn setperiodicalarm(thealarm Syswd_t, tp_start &Timespec, tp_period &Timespec, cb Alarmcallback, cbarg voidptr) i32

//@[c: 'SYS_RemoveAlarm']
//pub fn removealarm(thealarm Syswd_t) i32

//@[c: 'SYS_CancelAlarm']
//pub fn cancelalarm(thealarm Syswd_t) i32

@[c: 'SYS_GetCounterBias']
pub fn getcounterbias() u32

@[c: 'SYS_SetCounterBias']
pub fn setcounterbias(bias u32)

@[c: 'SYS_GetDisplayOffsetH']
pub fn getdisplayoffseth() i8

@[c: 'SYS_SetDisplayOffsetH']
pub fn setdisplayoffseth(offset i8)

@[c: 'SYS_GetEuRGB60']
pub fn geteurgb60() u8

@[c: 'SYS_SetEuRGB60']
pub fn seteurgb60(enable u8)

@[c: 'SYS_GetLanguage']
pub fn getlanguage() u8

@[c: 'SYS_SetLanguage']
pub fn setlanguage(lang u8)

@[c: 'SYS_GetProgressiveScan']
pub fn getprogressivescan() u8

@[c: 'SYS_SetProgressiveScan']
pub fn setprogressivescan(enable u8)

@[c: 'SYS_GetSoundMode']
pub fn getsoundmode() u8

@[c: 'SYS_SetSoundMode']
pub fn setsoundmode(mode u8)

@[c: 'SYS_GetVideoMode']
pub fn getvideomode() u8

@[c: 'SYS_SetVideoMode']
pub fn setvideomode(mode u8)

@[c: 'SYS_GetWirelessID']
pub fn getwirelessid(chan u32) u16

@[c: 'SYS_SetWirelessID']
pub fn setwirelessid(chan u32, id u16)

@[c: 'SYS_GetGBSMode']
pub fn getgbsmode() u16

@[c: 'SYS_SetGBSMode']
pub fn setgbsmode(mode u16)

@[c: 'SYS_GetFontEncoding']
pub fn getfontencoding() u32

//@[c: 'SYS_InitFont']
//pub fn initfont(font_data &Sys_fontheader) u32

@[c: 'SYS_GetFontTexture']
pub fn getfonttexture(c i32, image &voidptr, xpos &i32, ypos &i32, width &i32)

@[c: 'SYS_GetFontTexel']
pub fn getfonttexel(c i32, image voidptr, pos i32, stride i32, width &i32)

@[c: 'SYS_ResetSystem']
pub fn resetsystem(reset i32, reset_code u32, force_menu i32)

//@[c: 'SYS_RegisterResetFunc']
//pub fn registerresetfunc(info &Sys_resetinfo)

//@[c: 'SYS_UnregisterResetFunc']
//pub fn unregisterresetfunc(info &Sys_resetinfo)

@[c: 'SYS_SwitchFiber']
pub fn switchfiber(arg0 u32, arg1 u32, arg2 u32, arg3 u32, pc u32, newsp u32)

@[c: 'SYS_GetArena1Lo']
pub fn getarena1lo() voidptr

@[c: 'SYS_SetArena1Lo']
pub fn setarena1lo(newlo voidptr)

@[c: 'SYS_GetArena1Hi']
pub fn getarena1hi() voidptr

@[c: 'SYS_SetArena1Hi']
pub fn setarena1hi(newhi voidptr)

@[c: 'SYS_GetArena1Size']
pub fn getarena1size() u32

@[c: 'SYS_SetResetCallback']
pub fn setresetcallback(cb Resetcallback) Resetcallback

@[c: 'SYS_ResetButtonDown']
pub fn resetbuttondown() u32

@[c: 'SYS_Time']
pub fn time() u64

@[c2v_variadic]
pub fn kprintf(str ...&i8)
