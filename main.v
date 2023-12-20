@[translated]
module main
import gx
import video
import sys

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

//fn memalign(__alignment usize, __size usize) voidptr

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

//fn draw_init() 

//fn draw_cube(v [4]fn () f32) 

fn main()  {
	xfb := [voidptr(0), voidptr(0)]
	yscale := f32(0.0)
	xfbheight := u32(0)
	v := &[4]fn () f32 {return 0.0}
	p := &[4]fn () f32 {return 0.0}
	
	background := gx.GXColor {
	/*FAILED TO FIND STRUCT "GXColor"*/0, 0, 0, 255}
	
	video.videoinit()
	//pad_init()
	rmode := video.getpreferredmode((voidptr(0)))
	curr_fb = 0
	first_frame = 0
	gp_fifo := (voidptr(0))
	gp_fifo = memalign(32, (256 * 1024))
	unsafe { C.memset(gp_fifo, 0, (256 * 1024)) }
	xfb [0]  = voidptr((u32((sys.allocateframebuffer(rmode))) + ((3221225472) - (2147483648))))
	xfb [1]  = voidptr((u32((sys.allocateframebuffer(rmode))) + ((3221225472) - (2147483648))))
	video.configure(rmode)
	video.setnextframebuffer(xfb [curr_fb] )
	if !first_frame {
	video.setblack(0)
	}
	video.flush()
	video.waitvsync()
	if rmode.viTVMode & 1 {
	video.waitvsync()
	}
	//con_init(xfb [curr_fb] , 20, 20, rmode.fbWidth, rmode.xfbHeight, rmode.fbWidth * 2)
	gx.init(gp_fifo, (256 * 1024))
	gx.setcopyclear(background, 16777215)
	gx.setviewport(0, 0, rmode.fbWidth, rmode.efbHeight, 0, 1)
	yscale = gx.getyscalefactor(rmode.efbHeight, rmode.xfbHeight)
	xfbheight = gx.setdispcopyyscale(yscale)
	gx.setscissor(0, 0, rmode.fbWidth, rmode.efbHeight)
	gx.setdispcopysrc(0, 0, rmode.fbWidth, rmode.efbHeight)
	gx.setdispcopydst(rmode.fbWidth, xfbheight)
	gx.setcopyfilter(rmode.aa, rmode.sample_pattern, 1, rmode.vfilter)
	gx.setfieldmode(rmode.field_rendering, (if (rmode.viHeight == 2 * rmode.xfbHeight){ 1 } else {0}))
	gx.setcullmode(0)
	gx.copydisp(xfb [curr_fb] , 1)
	gx.setdispcopygamma(0)
	cam := gx.GuVector {
	/*FAILED TO FIND STRUCT "gx.GuVector"*/0.0, 0.0, 0.0}
	
up := gx.GuVector {
	/*FAILED TO FIND STRUCT "gx.GuVector"*/0.0, 1.0, 0.0}
	
look := gx.GuVector {
	/*FAILED TO FIND STRUCT "gx.GuVector"*/0.0, 0.0, -1.0}
	

	gx.gulookat(v, &cam, &up, &look)
	w := rmode.viWidth
	h := rmode.viHeight
	gx.guperspective(p, 60, f32(w) / h, 10, 300)
	gx.loadprojectionmtx(p, 0)
	draw_init()
	for 1 {
		//pad_scanpads()
		//if pad_buttonsdown(0) & 4096 {
			//reload := fn ()(2415919136)
			//reload()
		//}
		gx.setviewport(0, 0, rmode.fbWidth, rmode.efbHeight, 0, 1)
		gx.invvtxcache()
		gx.invalidatetexall()
		draw_cube(v)
		gx.setzmode(1, 3, 1)
		gx.setcolorupdate(1)
		gx.copydisp(xfb [curr_fb] , 1)
		gx.drawdone()
		video.setnextframebuffer(xfb [curr_fb] )
		if first_frame {
			first_frame = 0
			video.setblack(0)
		}
		video.flush()
		video.waitvsync()
		curr_fb ^= 1
	}
	return 
}

fn draw_init()  {
	gx.clearvtxdesc()
	gx.setvtxdesc(9, 2)
	gx.setvtxdesc(11, 2)
	gx.setvtxattrfmt(0, 9, 1, 3, 0)
	gx.setvtxattrfmt(0, 11, 1, 5, 0)
	gx.setarray(9, cube, 3 * sizeof(i16))
	gx.setarray(11, colors, 4 * sizeof(u8))
	//dcflushrange(cube, sizeof(cube))
	//dcflushrange(colors, sizeof(colors))
	gx.setnumchans(1)
	gx.setnumtexgens(0)
	gx.settevorder(0, 255, 255, 4)
	gx.settevop(0, 4)
}

fn draw_quad(v0 u8, v1 u8, v2 u8, v3 u8, c u8)  {
	gx.position1x8(v0)
	gx.color1x8(c)
	gx.position1x8(v1)
	gx.color1x8(c)
	gx.position1x8(v2)
	gx.color1x8(c)
	gx.position1x8(v3)
	gx.color1x8(c)
}

fn draw_cube(v [4]fn () f32)  {
	//m := gx.Mtx{}
	//mv := gx.Mtx{}
	//axis := gx.GuVector {
	///*FAILED TO FIND STRUCT "gx.GuVector"*/-1, 1, 0}
	
	//rotateby := 0
	//rotateby ++
	//gx.gumtxidentity(m)
	//gx.gumtxrotaxisrad(m, &axis, ((rotateby) * 0.0174532924))
	//gx.gumtxtransapply(m, m, 0, 0, -200)
	//gx.gumtxconcat(v, m, mv)
	//gx.loadposmtximm(&mv, 0)
	gx.begin(128, 0, 24)
	draw_quad(0, 3, 2, 1, 0)
	draw_quad(0, 7, 6, 3, 1)
	draw_quad(0, 1, 4, 7, 2)
	draw_quad(1, 2, 5, 4, 3)
	draw_quad(2, 3, 6, 5, 4)
	draw_quad(4, 7, 6, 5, 5)
	gx.end()
}

