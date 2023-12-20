@[translated]
module main

type Dsptask_t = Dsp_task
type DSPTaskCallback = fn (&Dsptask_t)

type DSPCallback = fn ()

struct Dsp_task {
	state      Vu32
	prio       Vu32
	flags      Vu32
	iram_maddr voidptr
	iram_len   u32
	iram_addr  u32
	dram_maddr voidptr
	dram_len   u32
	dram_addr  u32
	init_vec   U16
	resume_vec U16
	init_cb    DSPTaskCallback
	res_cb     DSPTaskCallback
	done_cb    DSPTaskCallback
	req_cb     DSPTaskCallback
	next       &dsp_task
	prev       &dsp_task
}

type ARQRequest = Arq_request
type ARQCallback = fn (&ARQRequest)

struct Arq_request {
	node      Lwp_node
	owner     u32
	dir       u32
	prio      u32
	state     u32
	aram_addr u32
	mram_addr u32
	len       u32
	callback  ARQCallback
}

type AISCallback = fn (u32)

struct Card_dir {
	chn         S32
	fileno      u32
	filelen     u32
	permissions U8
	filename    [32]U8
	gamecode    [4]U8
	company     [2]U8
	showall     bool
}

struct Card_direntry {
	gamecode      [4]U8
	company       [2]U8
	pad_00        U8
	banner_fmt    U8
	filename      [32]U8
	last_modified u32
	icon_addr     u32
	icon_fmt      U16
	icon_speed    U16
	permission    U8
	copy_times    U8
	block         U16
	length        U16
	pad_01        U16
	comment_addr  u32
}

struct Card_stat {
	filename           [32]U8
	len                u32
	time               u32
	gamecode           [4]U8
	company            [2]U8
	banner_fmt         U8
	icon_addr          u32
	icon_fmt           U16
	iconfmt            [8]U16
	icon_speed         U16
	iconspeed          [8]U16
	comment_addr       u32
	offset_banner      u32
	offset_banner_tlut u32
	offset_icon        [8]u32
	offset_icon_tlut   [8]u32
	offset_data        u32
}

type Cardcallback = fn (S32, S32)

struct Dvddiskid {
	gamename      [4]S8
	company       [2]S8
	disknum       U8
	gamever       U8
	streaming     U8
	streambufsize U8
	pad           [22]U8
}

type Dvdcbcallback = fn (S32, &Dvdcmdblk)

struct Dvdcmdblk {
	node       Lwp_node
	cmd        u32
	state      S32
	offset     S64
	len        u32
	buf        voidptr
	currtxsize u32
	txdsize    u32
	id         &Dvddiskid
	cb         Dvdcbcallback
	usrdata    voidptr
}

struct Dvddrvinfo {
	rev_level U16
	dev_code  U16
	rel_date  u32
	pad       [24]U8
}

type Dvdcallback = fn (S32, &Dvdfileinfo)

struct Dvdfileinfo {
	block Dvdcmdblk
	addr  u32
	len   u32
	cb    Dvdcallback
}

type GuVector = Vecf

struct GuQuaternion {
	x F32
	y F32
	z F32
	w F32
}

type Mtx = [3][4]F32
type MtxP = [4]fn () F32
type ROMtx = [4][3]F32
type ROMtxP = [3]fn () F32
type Mtx33 = [3][3]F32
type Mtx33P = [3]fn () F32
type Mtx44 = [4][4]F32
type Mtx44P = [4]fn () F32
type WGPipe = Union

_wgpipe
struct GXColor {
	r U8
	g U8
	b U8
	a U8
}

struct GXColorS10 {
	r S16
	g S16
	b S16
	a S16
}

struct GXTexObj {
	val [8]u32
}

struct GXTlutObj {
	val [3]u32
}

struct GXTexRegion {
	val [4]u32
}

struct GXTlutRegion {
	val [4]u32
}

struct GXLightObj {
	val [16]u32
}

struct Vtx {
	x    F32
	y    F32
	z    F32
	s    U16
	t    U16
	rgba u32
}

struct GXVtxDesc {
	attr  U8
	type_ U8
}

struct GXVtxAttrFmt {
	vtxattr  u32
	comptype u32
	compsize u32
	frac     u32
}

struct GXFifoObj {
	pad [128]U8
}

struct GXTexReg {
	dummy [4]U8
}

struct GXFogAdjTbl {
	r [10]U16
}

type GXBreakPtCallback = fn ()

type GXDrawDoneCallback = fn ()

type GXDrawSyncCallback = fn (U16)

type GXTexRegionCallback = fn (&GXTexObj, U8) &GXTexRegion

type GXTlutRegionCallback = fn (u32) &GXTlutRegion

type RDSTHandler = fn (u32, voidptr)

type Mqmsg_t = voidptr
type PADStatus = Padstatus
type Sampling_callback = fn ()

struct TPLFile {
	type_     int
	ntextures int
	texdesc   voidptr
	tpl_file  FHANDLE
}

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

type VIPositionCallback = fn (u32, u32)

fn depackrnc1_ulen(packed voidptr) S32

fn depackrnc1(packed voidptr, unpacked voidptr) S32

fn depackrnc2(packed voidptr, unpacked voidptr)
