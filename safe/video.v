@[translated]
module video

type U8 = u8
type U16 = u16
type U32 = u32
type U64 = u64
type S8 = Int8_t
type S16 = i16
type S32 = int
type S64 = i64
type F32 = f32
type F64 = f64

struct Argv {
	argvMagic   int
	commandLine &i8
	length      int
	argc        int
	argv        &&u8
	endARGV     &&u8
}

struct GXRModeObj {
	viTVMode        u32
	fbWidth         U16
	efbHeight       U16
	xfbHeight       U16
	viXOrigin       U16
	viYOrigin       U16
	viWidth         U16
	viHeight        U16
	xfbMode         u32
	field_rendering U8
	aa              U8
	sample_pattern  [12][2]U8
	vfilter         [7]U8
}

type VIRetraceCallback = fn (u32)

type VIPositionCallback = fn (u32, u32)

@[c: 'VIDEO_GetNextFramebuffer']
fn video_getnextframebuffer() voidptr

@[c: 'VIDEO_GetCurrentFramebuffer']
fn video_getcurrentframebuffer() voidptr

@[c: 'VIDEO_Init']
fn video_init()

@[c: 'VIDEO_Flush']
fn video_flush()

@[c: 'VIDEO_SetBlack']
fn video_setblack(black bool)

@[c: 'VIDEO_GetNextField']
fn video_getnextfield() u32

@[c: 'VIDEO_GetCurrentLine']
fn video_getcurrentline() u32

@[c: 'VIDEO_GetCurrentTvMode']
fn video_getcurrenttvmode() u32

@[c: 'VIDEO_Configure']
fn video_configure(rmode &GXRModeObj)

@[c: 'VIDEO_GetFrameBufferSize']
fn video_getframebuffersize(rmode &GXRModeObj) u32

@[c: 'VIDEO_ClearFrameBuffer']
fn video_clearframebuffer(rmode &GXRModeObj, fb voidptr, color u32)

@[c: 'VIDEO_WaitVSync']
fn video_waitvsync()

@[c: 'VIDEO_SetNextFramebuffer']
fn video_setnextframebuffer(fb voidptr)

@[c: 'VIDEO_SetNextRightFramebuffer']
fn video_setnextrightframebuffer(fb voidptr)

@[c: 'VIDEO_SetPreRetraceCallback']
fn video_setpreretracecallback(callback VIRetraceCallback) VIRetraceCallback

@[c: 'VIDEO_SetPostRetraceCallback']
fn video_setpostretracecallback(callback VIRetraceCallback) VIRetraceCallback

@[c: 'VIDEO_HaveComponentCable']
fn video_havecomponentcable() u32

@[c: 'VIDEO_GetPreferredMode']
fn video_getpreferredmode(mode &GXRModeObj) &GXRModeObj

@[c: 'VIDEO_GetVideoScanMode']
fn video_getvideoscanmode() u32
