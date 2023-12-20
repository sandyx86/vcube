@[translated]
module video
import gx

struct Argv {
	argvMagic   int
	commandLine &i8
	length      int
	argc        int
	argv        &&u8
	endARGV     &&u8
}

type VIRetraceCallback = fn (u32)

type VIPositionCallback = fn (u32, u32)

@[c: 'VIDEO_GetNextFramebuffer']
pub fn getnextframebuffer() voidptr

@[c: 'VIDEO_GetCurrentFramebuffer']
pub fn getcurrentframebuffer() voidptr

@[c: 'VIDEO_Init']
pub fn videoinit()

@[c: 'VIDEO_Flush']
pub fn flush()

@[c: 'VIDEO_SetBlack']
pub fn setblack(black bool)

@[c: 'VIDEO_GetNextField']
pub fn getnextfield() u32

@[c: 'VIDEO_GetCurrentLine']
pub fn getcurrentline() u32

@[c: 'VIDEO_GetCurrentTvMode']
pub fn getcurrenttvmode() u32

@[c: 'VIDEO_Configure']
pub fn configure(rmode &gx.GXRModeObj)

@[c: 'VIDEO_GetFrameBufferSize']
pub fn getframebuffersize(rmode &gx.GXRModeObj) u32

@[c: 'VIDEO_ClearFrameBuffer']
pub fn clearframebuffer(rmode &gx.GXRModeObj, fb voidptr, color u32)

@[c: 'VIDEO_WaitVSync']
pub fn waitvsync()

@[c: 'VIDEO_SetNextFramebuffer']
pub fn setnextframebuffer(fb voidptr)

@[c: 'VIDEO_SetNextRightFramebuffer']
pub fn setnextrightframebuffer(fb voidptr)

@[c: 'VIDEO_SetPreRetraceCallback']
pub fn setpreretracecallback(callback VIRetraceCallback) VIRetraceCallback

@[c: 'VIDEO_SetPostRetraceCallback']
pub fn setpostretracecallback(callback VIRetraceCallback) VIRetraceCallback

@[c: 'VIDEO_HaveComponentCable']
pub fn havecomponentcable() u32

@[c: 'VIDEO_GetPreferredMode']
pub fn getpreferredmode(mode &gx.GXRModeObj) &gx.GXRModeObj

@[c: 'VIDEO_GetVideoScanMode']
pub fn getvideoscanmode() u32
