@[translated]
module main
import gx
import video

struct Lldiv_t { 
	quot i64
	rem i64
}
struct Random_data { 
	fptr &int
	rptr &int
	state &int
	rand_type int
	rand_deg int
	rand_sep int
	end_ptr &int
}
struct Drand48_data { 
	__x [3]u16
	__old_x [3]u16
	__c u16
	__init u16
	__a i64
}
fn memalign( u32,  u32) voidptr

fn memalign(__alignment usize, __size usize) voidptr

struct Mallinfo { 
	arena int
	ordblks int
	smblks int
	hblks int
	hblkhd int
	usmblks int
	fsmblks int
	uordblks int
	fordblks int
	keepcost int
}
struct Mallinfo2 { 
	arena usize
	ordblks usize
	smblks usize
	hblks usize
	hblkhd usize
	usmblks usize
	fsmblks usize
	uordblks usize
	fordblks usize
	keepcost usize
}
enum Uint8_t {
	fp_nan = 0
	fp_infinite = 1
	fp_zero = 2
	fp_subnormal = 3
	fp_normal = 4
}

type MODSNDBUF = Modsndbuf
struct MODPlay { 
	mod MOD
	playing BOOL
	paused BOOL
	bits BOOL
	stereo BOOL
	manual_polling BOOL
	playfreq u32
	numSFXChans u32
	soundBuf MODSNDBUF
}
[export:'cube']
const (
cube   = [-30, 30, -30, 30, 30, -30, 30, 30, 30, -30, 30, 30, 30, -30, -30, 30, -30, 30, -30, -30, 30, -30, -30, -30]!

)

[export:'colors']
const (
colors   = [100, 10, 100, 255, 240, 0, 0, 255, 255, 180, 0, 255, 255, 255, 0, 255, 10, 120, 40, 255, 0, 20, 100, 255]!

)

[weak] __global ( curr_fb  = u32 (0)
)

[weak] __global ( first_frame  = u32 (1)
)

[export:'xfb']
const (
xfb   = [(voidptr(0)), (voidptr(0))]!

)

[weak]__global ( rmode &GXRModeObj 

)

fn draw_init() 

fn draw_cube(v [4]fn () F32) 

fn main()  {
	yscale := F32{}
	xfbheight := u32(0)
	v := Mtx44{}
	p := Mtx44{}
	
	background := GXColor {
	/*FAILED TO FIND STRUCT "GXColor"*/0, 0, 0, 255}
	
	video_init()
	pad_init()
	rmode = video_getpreferredmode((voidptr(0)))
	curr_fb = 0
	first_frame = 0
	gp_fifo := (voidptr(0))
	gp_fifo = memalign(32, (256 * 1024))
	C.memset(gp_fifo, 0, (256 * 1024))
	xfb [0]  = voidptr((u32((sys_allocateframebuffer(rmode))) + ((3221225472) - (2147483648))))
	xfb [1]  = voidptr((u32((sys_allocateframebuffer(rmode))) + ((3221225472) - (2147483648))))
	video_configure(rmode)
	video_setnextframebuffer(xfb [curr_fb] )
	if !first_frame {
	video_setblack(0)
	}
	video_flush()
	video_waitvsync()
	if rmode.viTVMode & 1 {
	video_waitvsync()
	}
	con_init(xfb [curr_fb] , 20, 20, rmode.fbWidth, rmode.xfbHeight, rmode.fbWidth * 2)
	gx.init(gp_fifo, (256 * 1024))
	gx_setcopyclear(background, 16777215)
	gx_setviewport(0, 0, rmode.fbWidth, rmode.efbHeight, 0, 1)
	yscale = gx_getyscalefactor(rmode.efbHeight, rmode.xfbHeight)
	xfbheight = gx_setdispcopyyscale(yscale)
	gx_setscissor(0, 0, rmode.fbWidth, rmode.efbHeight)
	gx_setdispcopysrc(0, 0, rmode.fbWidth, rmode.efbHeight)
	gx_setdispcopydst(rmode.fbWidth, xfbheight)
	gx_setcopyfilter(rmode.aa, rmode.sample_pattern, 1, rmode.vfilter)
	gx_setfieldmode(rmode.field_rendering, (if (rmode.viHeight == 2 * rmode.xfbHeight){ 1 } else {0}))
	gx_setcullmode(0)
	gx_copydisp(xfb [curr_fb] , 1)
	gx_setdispcopygamma(0)
	cam := GuVector {
	/*FAILED TO FIND STRUCT "GuVector"*/0, 0, 0}
	
up := GuVector {
	/*FAILED TO FIND STRUCT "GuVector"*/0, 1, 0}
	
look := GuVector {
	/*FAILED TO FIND STRUCT "GuVector"*/0, 0, -1}
	

	gulookat(v, &cam, &up, &look)
	w := rmode.viWidth
	h := rmode.viHeight
	guperspective(p, 60, F32(w) / h, 10, 300)
	gx_loadprojectionmtx(p, 0)
	draw_init()
	for 1 {
		pad_scanpads()
		if pad_buttonsdown(0) & 4096 {
			reload := fn ()(2415919136)
			reload()
		}
		gx_setviewport(0, 0, rmode.fbWidth, rmode.efbHeight, 0, 1)
		gx_invvtxcache()
		gx_invalidatetexall()
		draw_cube(v)
		gx_setzmode(1, 3, 1)
		gx_setcolorupdate(1)
		gx_copydisp(xfb [curr_fb] , 1)
		gx_drawdone()
		video_setnextframebuffer(xfb [curr_fb] )
		if first_frame {
			first_frame = 0
			video_setblack(0)
		}
		video_flush()
		video_waitvsync()
		curr_fb ^= 1
	}
	return 
}

fn draw_init()  {
	gx_clearvtxdesc()
	gx_setvtxdesc(9, 2)
	gx_setvtxdesc(11, 2)
	gx_setvtxattrfmt(0, 9, 1, 3, 0)
	gx_setvtxattrfmt(0, 11, 1, 5, 0)
	gx_setarray(9, cube, 3 * sizeof(S16))
	gx_setarray(11, colors, 4 * sizeof(U8))
	dcflushrange(cube, sizeof(cube))
	dcflushrange(colors, sizeof(colors))
	gx_setnumchans(1)
	gx_setnumtexgens(0)
	gx_settevorder(0, 255, 255, 4)
	gx_settevop(0, 4)
}

fn draw_quad(v0 U8, v1 U8, v2 U8, v3 U8, c U8)  {
	gx_position1x8(v0)
	gx_color1x8(c)
	gx_position1x8(v1)
	gx_color1x8(c)
	gx_position1x8(v2)
	gx_color1x8(c)
	gx_position1x8(v3)
	gx_color1x8(c)
}

fn draw_cube(v [4]fn () F32)  {
	m := Mtx{}
	mv := Mtx{}
	axis := GuVector {
	/*FAILED TO FIND STRUCT "GuVector"*/-1, 1, 0}
	
	rotateby := 0
	rotateby ++
	c_gumtxidentity(m)
	c_gumtxrotaxisrad(m, &axis, ((rotateby) * 0.0174532924))
	c_gumtxtransapply(m, m, 0, 0, -200)
	c_gumtxconcat(v, m, mv)
	gx_loadposmtximm(mv, 0)
	gx_begin(128, 0, 24)
	draw_quad(0, 3, 2, 1, 0)
	draw_quad(0, 7, 6, 3, 1)
	draw_quad(0, 1, 4, 7, 2)
	draw_quad(1, 2, 5, 4, 3)
	draw_quad(2, 3, 6, 5, 4)
	draw_quad(4, 7, 6, 5, 5)
	gx_end()
}

