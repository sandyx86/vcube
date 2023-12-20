[translated]
module gx

struct Argv { 
	argvMagic int
	commandLine &i8
	length int
	argc int
	argv &&u8
	endARGV &&u8
}
type Lwpq_t = u32
pub struct GXRModeObj {
	pub : viTVMode u32
	fbWidth u16 
	efbHeight u16
	xfbHeight u16
	viXOrigin u16	
	viYOrigin u16	
	viWidth u16
	viHeight u16
 	xfbMode u32  
	field_rendering u8
	aa u8
	sample_pattern[12][2] u8
	vfilter[7] u8
}

type Mtx = [3][4]f32
type MtxP = [4]fn () f32
type ROMtx = [4][3]f32
type ROMtxP = [3]fn () f32
type Mtx33 = [3][3]f32
type Mtx33P = [3]fn () f32
type Mtx44 = [4][4]f32
type Mtx44P = [4]fn () f32
union WGPipe { 
	u8 u8  
	i8 i8  
	u16 u16
	i16 i16
	u32 u32
	i32 i32
	f32 f32 
}
pub struct GXColor { 
	r u8
	g u8
	b u8
	a u8
}

pub struct GXColorS10 { 
	r i16
	g i16
	b i16
	a i16
}
pub struct GXTexObj { 
	val [8]u32
}
pub struct GXTlutObj { 
	val [3]u32
}
pub struct GXTexRegion { 
	val [4]u32
}
pub struct GXTlutRegion { 
	val [4]u32
}
pub struct GXLightObj { 
	val [16]u32
}
pub struct Vtx { 
	x f32
	y f32
	z f32
	s u16
	t u16
	rgba u32
}
pub struct GXVtxDesc { 
	attr u8
	type_ u8
}
pub struct GXVtxAttrFmt { 
	vtxattr u32
	comptype u32
	compsize u32
	frac u32
}
struct GXFifoObj { 
	pad [128]u8
}
struct GXTexReg { 
	dummy [4]u8
}
struct GXFogAdjTbl { 
	r [10]u16
}
type GXBreakPtCallback = fn ()
type GXDrawDoneCallback = fn ()
type GXDrawSyncCallback = fn (u16)
type GXTexRegionCallback = fn (&GXTexObj, u8) &GXTexRegion
type GXTlutRegionCallback = fn (u32) &GXTlutRegion
[weak]__global (wgPipe &WGPipe)

[c:'GX_Init']
pub fn init(base voidptr, size u32) &GXFifoObj

[c:'GX_InitFifoBase']
pub fn initfifobase(fifo &GXFifoObj, base voidptr, size u32) 

[c:'GX_InitFifoLimits']
pub fn initfifolimits(fifo &GXFifoObj, hiwatermark u32, lowatermark u32) 

[c:'GX_InitFifoPtrs']
pub fn initfifoptrs(fifo &GXFifoObj, rd_ptr voidptr, wt_ptr voidptr) 

[c:'GX_GetFifoPtrs']
pub fn getfifoptrs(fifo &GXFifoObj, rd_ptr &voidptr, wt_ptr &voidptr) 

[c:'GX_SetCPUFifo']
pub fn setcpufifo(fifo &GXFifoObj) 

[c:'GX_SetGPFifo']
pub fn setgpfifo(fifo &GXFifoObj) 

[c:'GX_GetCPUFifo']
pub fn getcpufifo(fifo &GXFifoObj) 

[c:'GX_GetGPFifo']
pub fn getgpfifo(fifo &GXFifoObj) 

[c:'GX_GetFifoBase']
pub fn getfifobase(fifo &GXFifoObj) voidptr

[c:'GX_GetFifoCount']
pub fn getfifocount(fifo &GXFifoObj) u32

[c:'GX_GetFifoSize']
pub fn getfifosize(fifo &GXFifoObj) u32

[c:'GX_GetFifoWrap']
pub fn getfifowrap(fifo &GXFifoObj) u8

[c:'GX_SetDrawDoneCallback']
pub fn setdrawdonecallback(cb GXDrawDoneCallback) GXDrawDoneCallback

[c:'GX_SetBreakPtCallback']
pub fn setbreakptcallback(cb GXBreakPtCallback) GXBreakPtCallback

[c:'GX_AbortFrame']
pub fn abortframe() 

[c:'GX_Flush']
pub fn flush() 

[c:'GX_SetMisc']
pub fn setmisc(token u32, value u32) 

[c:'GX_SetDrawDone']
pub fn setdrawdone() 

[c:'GX_WaitDrawDone']
pub fn waitdrawdone() 

[c:'GX_GetDrawSync']
pub fn getdrawsync() u16

[c:'GX_SetDrawSync']
pub fn setdrawsync(token u16) 

[c:'GX_SetDrawSyncCallback']
pub fn setdrawsynccallback(cb GXDrawSyncCallback) GXDrawSyncCallback

[c:'GX_DisableBreakPt']
pub fn disablebreakpt() 

[c:'GX_EnableBreakPt']
pub fn enablebreakpt(break_pt voidptr) 

[c:'GX_DrawDone']
pub fn drawdone() 

[c:'GX_TexModeSync']
pub fn texmodesync() 

[c:'GX_InvVtxCache']
pub fn invvtxcache() 

[c:'GX_ClearVtxDesc']
pub fn clearvtxdesc() 

[c:'GX_LoadProjectionMtx']
pub fn loadprojectionmtx(mt [4]fn () f32, type_ u8) 

[c:'GX_SetViewport']
pub fn setviewport(xorig f32, yorig f32, wd f32, ht f32, nearz f32, farz f32) 

[c:'GX_SetViewportJitter']
pub fn setviewportjitter(xorig f32, yorig f32, wd f32, ht f32, nearz f32, farz f32, field u32) 

[c:'GX_SetChanCtrl']
pub fn setchanctrl(channel i32, enable u8, ambsrc u8, matsrc u8, litmask u8, diff_fn u8, attn_fn u8) 

[c:'GX_SetChanAmbColor']
pub fn setchanambcolor(channel i32, color GXColor) 

[c:'GX_SetChanMatColor']
pub fn setchanmatcolor(channel i32, color GXColor) 

[c:'GX_SetArray']
pub fn setarray(attr u32, ptr voidptr, stride u8) 

[c:'GX_SetVtxAttrFmt']
pub fn setvtxattrfmt(vtxfmt u8, vtxattr u32, comptype u32, compsize u32, frac u32) 

[c:'GX_SetVtxAttrFmtv']
pub fn setvtxattrfmtv(vtxfmt u8, attr_list &GXVtxAttrFmt) 

[c:'GX_SetVtxDesc']
pub fn setvtxdesc(attr u8, type_ u8) 

[c:'GX_SetVtxDescv']
pub fn setvtxdescv(attr_list &GXVtxDesc) 

[c:'GX_GetVtxDescv']
pub fn getvtxdescv(attr_list &GXVtxDesc) 

[c:'GX_EndDispList']
pub fn enddisplist() u32

[c:'GX_Begin']
pub fn begin(primitve u8, vtxfmt u8, vtxcnt u16) 

[c:'GX_BeginDispList']
pub fn begindisplist(list voidptr, size u32) 

[c:'GX_CallDispList']
pub fn calldisplist(list voidptr, nbytes u32) 

[c:'GX_End']
pub fn end()  {
}

[c:'GX_Position3f32']
pub fn position3f32(x f32, y f32, z f32)  {
	wgPipe.f32 = x
	wgPipe.f32 = y
	wgPipe.f32 = z
}

[c:'GX_Position3u16']
pub fn position3u16(x u16, y u16, z u16)  {
	wgPipe.u16 = x
	wgPipe.u16 = y
	wgPipe.u16 = z
}

[c:'GX_Position3i16']
pub fn position3i16(x i16, y i16, z i16)  {
	wgPipe.i16 = x
	wgPipe.i16 = y
	wgPipe.i16 = z
}

[c:'GX_Position3u8']
pub fn position3u8(x u8, y u8, z u8)  {
	wgPipe.u8 = x
	wgPipe.u8 = y
	wgPipe.u8 = z
}

[c:'GX_Position3i8']
pub fn position3i8(x i8, y i8, z i8)  {
	wgPipe.i8 = x
	wgPipe.i8 = y
	wgPipe.i8 = z
}

[c:'GX_Position2f32']
pub fn position2f32(x f32, y f32)  {
	wgPipe.f32 = x
	wgPipe.f32 = y
}

[c:'GX_Position2u16']
pub fn position2u16(x u16, y u16)  {
	wgPipe.u16 = x
	wgPipe.u16 = y
}

[c:'GX_Position2i16']
pub fn position2i16(x i16, y i16)  {
	wgPipe.i16 = x
	wgPipe.i16 = y
}

[c:'GX_Position2u8']
pub fn position2u8(x u8, y u8)  {
	wgPipe.u8 = x
	wgPipe.u8 = y
}

[c:'GX_Position2i8']
pub fn position2i8(x i8, y i8)  {
	wgPipe.i8 = x
	wgPipe.i8 = y
}

[c:'GX_Position1x8']
pub fn position1x8(index u8)  {
	wgPipe.u8 = index
}

[c:'GX_Position1x16']
pub fn position1x16(index u16)  {
	wgPipe.u16 = index
}

[c:'GX_Normal3f32']
pub fn normal3f32(nx f32, ny f32, nz f32)  {
	wgPipe.f32 = nx
	wgPipe.f32 = ny
	wgPipe.f32 = nz
}

[c:'GX_Normal3i16']
pub fn normal3i16(nx i16, ny i16, nz i16)  {
	wgPipe.i16 = nx
	wgPipe.i16 = ny
	wgPipe.i16 = nz
}

[c:'GX_Normal3i8']
pub fn normal3i8(nx i8, ny i8, nz i8)  {
	wgPipe.i8 = nx
	wgPipe.i8 = ny
	wgPipe.i8 = nz
}

[c:'GX_Normal1x8']
pub fn normal1x8(index u8)  {
	wgPipe.u8 = index
}

[c:'GX_Normal1x16']
pub fn normal1x16(index u16)  {
	wgPipe.u16 = index
}

[c:'GX_Color4u8']
pub fn color4u8(r u8, g u8, b u8, a u8)  {
	wgPipe.u8 = r
	wgPipe.u8 = g
	wgPipe.u8 = b
	wgPipe.u8 = a
}

[c:'GX_Color3u8']
pub fn color3u8(r u8, g u8, b u8)  {
	wgPipe.u8 = r
	wgPipe.u8 = g
	wgPipe.u8 = b
}

[c:'GX_Color3f32']
pub fn color3f32(r f32, g f32, b f32)  {
	wgPipe.u8 = u8((r * 255))
	wgPipe.u8 = u8((g * 255))
	wgPipe.u8 = u8((b * 255))
}

[c:'GX_Color1u32']
pub fn color1u32(clr u32)  {
	wgPipe.u32 = clr
}

[c:'GX_Color1u16']
pub fn color1u16(clr u16)  {
	wgPipe.u16 = clr
}

[c:'GX_Color1x8']
pub fn color1x8(index u8)  {
	wgPipe.u8 = index
}

[c:'GX_Color1x16']
pub fn color1x16(index u16)  {
	wgPipe.u16 = index
}

[c:'GX_TexCoord2f32']
pub fn texcoord2f32(s f32, t f32)  {
	wgPipe.f32 = s
	wgPipe.f32 = t
}

[c:'GX_TexCoord2u16']
pub fn texcoord2u16(s u16, t u16)  {
	wgPipe.u16 = s
	wgPipe.u16 = t
}

[c:'GX_TexCoord2i16']
pub fn texcoord2i16(s i16, t i16)  {
	wgPipe.i16 = s
	wgPipe.i16 = t
}

[c:'GX_TexCoord2u8']
pub fn texcoord2u8(s u8, t u8)  {
	wgPipe.u8 = s
	wgPipe.u8 = t
}

[c:'GX_TexCoord2i8']
pub fn texcoord2i8(s i8, t i8)  {
	wgPipe.i8 = s
	wgPipe.i8 = t
}

[c:'GX_TexCoord1f32']
pub fn texcoord1f32(s f32)  {
	wgPipe.f32 = s
}

[c:'GX_TexCoord1u16']
pub fn texcoord1u16(s u16)  {
	wgPipe.u16 = s
}

[c:'GX_TexCoord1i16']
pub fn texcoord1i16(s i16)  {
	wgPipe.i16 = s
}

[c:'GX_TexCoord1u8']
pub fn texcoord1u8(s u8)  {
	wgPipe.u8 = s
}

[c:'GX_TexCoord1i8']
pub fn texcoord1i8(s i8)  {
	wgPipe.i8 = s
}

[c:'GX_TexCoord1x8']
pub fn texcoord1x8(index u8)  {
	wgPipe.u8 = index
}

[c:'GX_TexCoord1x16']
pub fn texcoord1x16(index u16)  {
	wgPipe.u16 = index
}

[c:'GX_MatrixIndex1x8']
pub fn matrixindex1x8(index u8)  {
	wgPipe.u8 = index
}

[c:'GX_AdjustForOverscan']
pub fn adjustforoverscan(rmin &GXRModeObj, rmout &GXRModeObj, hor u16, ver u16) 

[c:'GX_LoadPosMtxImm']
pub fn loadposmtximm(mt [4]fn () f32, pnidx u32) 

[c:'GX_LoadPosMtxIdx']
pub fn loadposmtxidx(mtxidx u16, pnidx u32) 

[c:'GX_LoadNrmMtxImm']
pub fn loadnrmmtximm(mt [4]fn () f32, pnidx u32) 

[c:'GX_LoadNrmMtxImm3x3']
pub fn loadnrmmtximm3x3(mt [3]fn () f32, pnidx u32) 

[c:'GX_LoadNrmMtxIdx3x3']
pub fn loadnrmmtxidx3x3(mtxidx u16, pnidx u32) 

[c:'GX_LoadTexMtxImm']
pub fn loadtexmtximm(mt [4]fn () f32, texidx u32, type_ u8) 

[c:'GX_LoadTexMtxIdx']
pub fn loadtexmtxidx(mtxidx u16, texidx u32, type_ u8) 

[c:'GX_SetCurrentMtx']
pub fn setcurrentmtx(mtx u32) 

[c:'GX_SetTevOp']
pub fn settevop(tevstage u8, mode u8) 

[c:'GX_SetTevColor']
pub fn settevcolor(tev_regid u8, color GXColor) 

[c:'GX_SetTevColorS10']
pub fn settevcolors10(tev_regid u8, color GXColorS10) 

[c:'GX_SetTevColorIn']
pub fn settevcolorin(tevstage u8, a u8, b u8, c u8, d u8) 

[c:'GX_SetTevAlphaIn']
pub fn settevalphain(tevstage u8, a u8, b u8, c u8, d u8) 

[c:'GX_SetTevColorOp']
pub fn settevcolorop(tevstage u8, tevop u8, tevbias u8, tevscale u8, clamp u8, tevregid u8) 

[c:'GX_SetTevAlphaOp']
pub fn settevalphaop(tevstage u8, tevop u8, tevbias u8, tevscale u8, clamp u8, tevregid u8) 

[c:'GX_SetNumTexGens']
pub fn setnumtexgens(nr u32) 

[c:'GX_SetTexCoordGen']
pub fn settexcoordgen(texcoord u16, tgen_typ u32, tgen_src u32, mtxsrc u32) 

[c:'GX_SetTexCoordGen2']
pub fn settexcoordgen2(texcoord u16, tgen_typ u32, tgen_src u32, mtxsrc u32, normalize u32, postmtx u32) 

[c:'GX_SetZTexture']
pub fn setztexture(op u8, fmt u8, bias u32) 

[c:'GX_SetZMode']
pub fn setzmode(enable u8, func u8, update_enable u8) 

[c:'GX_SetZCompLoc']
pub fn setzcomploc(before_tex u8) 

[c:'GX_SetLineWidth']
pub fn setlinewidth(width u8, fmt u8) 

[c:'GX_SetPointSize']
pub fn setpointsize(width u8, fmt u8) 

[c:'GX_SetBlendMode']
pub fn setblendmode(type_ u8, src_fact u8, dst_fact u8, op u8) 

[c:'GX_SetCullMode']
pub fn setcullmode(mode u8) 

[c:'GX_SetCoPlanar']
pub fn setcoplanar(enable u8) 

[c:'GX_EnableTexOffsets']
pub fn enabletexoffsets(coord u8, line_enable u8, point_enable u8) 

[c:'GX_SetClipMode']
pub fn setclipmode(mode u8) 

[c:'GX_SetScissor']
pub fn setscissor(xorigin u32, yorigin u32, wd u32, ht u32) 

[c:'GX_SetScissorBoxOffset']
pub fn setscissorboxoffset(xoffset i32, yoffset i32) 

[c:'GX_SetNumChans']
pub fn setnumchans(num u8) 

[c:'GX_SetTevOrder']
pub fn settevorder(tevstage u8, texcoord u8, texmap u32, color u8) 

[c:'GX_SetNumTevStages']
pub fn setnumtevstages(num u8) 

[c:'GX_SetAlphaCompare']
pub fn setalphacompare(comp0 u8, ref0 u8, aop u8, comp1 u8, ref1 u8) 

[c:'GX_SetTevKColor']
pub fn settevkcolor(sel u8, col GXColor) 

[c:'GX_SetTevKColorSel']
pub fn settevkcolorsel(tevstage u8, sel u8) 

[c:'GX_SetTevKAlphaSel']
pub fn settevkalphasel(tevstage u8, sel u8) 

[c:'GX_SetTevKColorS10']
pub fn settevkcolors10(sel u8, col GXColorS10) 

[c:'GX_SetTevSwapMode']
pub fn settevswapmode(tevstage u8, ras_sel u8, tex_sel u8) 

[c:'GX_SetTevSwapModeTable']
pub fn settevswapmodetable(swapid u8, r u8, g u8, b u8, a u8) 

[c:'GX_SetTevIndirect']
pub fn settevindirect(tevstage u8, indtexid u8, format u8, bias u8, mtxid u8, wrap_s u8, wrap_t u8, addprev u8, utclod u8, a u8) 

[c:'GX_SetTevDirect']
pub fn settevdirect(tevstage u8) 

[c:'GX_SetNumIndStages']
pub fn setnumindstages(nstages u8) 

[c:'GX_SetIndTexOrder']
pub fn setindtexorder(indtexstage u8, texcoord u8, texmap u8) 

[c:'GX_SetIndTexCoordScale']
pub fn setindtexcoordscale(indtexid u8, scale_s u8, scale_t u8) 

[c:'GX_SetFog']
pub fn setfog(type_ u8, startz f32, endz f32, nearz f32, farz f32, col GXColor) 

[c:'GX_SetFogRangeAdj']
pub fn setfograngeadj(enable u8, center u16, table &GXFogAdjTbl) 

[c:'GX_SetFogColor']
pub fn setfogcolor(color GXColor) 

[c:'GX_InitFogAdjTable']
pub fn initfogadjtable(table &GXFogAdjTbl, width u16, projmtx [4]fn () f32) 

[c:'GX_SetIndTexMatrix']
pub fn setindtexmatrix(indtexmtx u8, offset_mtx [3]fn () f32, scale_exp i8) 

[c:'GX_SetTevIndBumpST']
pub fn settevindbumpst(tevstage u8, indstage u8, mtx_sel u8) 

[c:'GX_SetTevIndBumpXYZ']
pub fn settevindbumpxyz(tevstage u8, indstage u8, mtx_sel u8) 

[c:'GX_SetTevIndTile']
pub fn settevindtile(tevstage u8, indtexid u8, tilesize_x u16, tilesize_y u16, tilespacing_x u16, tilespacing_y u16, indtexfmt u8, indtexmtx u8, bias_sel u8, alpha_sel u8) 

[c:'GX_SetTevIndWarp']
pub fn settevindwarp(tevstage u8, indtexid u8, bias_flag u8, replace_tex u8, mtxid u8) 

[c:'GX_SetTevIndRepeat']
pub fn settevindrepeat(tevstage u8) 

[c:'GX_SetColorUpdate']
pub fn setcolorupdate(enable u8) 

[c:'GX_SetAlphaUpdate']
pub fn setalphaupdate(enable u8) 

[c:'GX_SetPixelFmt']
pub fn setpixelfmt(pix_fmt u8, z_fmt u8) 

[c:'GX_SetDither']
pub fn setdither(dither u8) 

[c:'GX_SetDstAlpha']
pub fn setdstalpha(enable u8, a u8) 

[c:'GX_SetFieldMask']
pub fn setfieldmask(even_mask u8, odd_mask u8) 

[c:'GX_SetFieldMode']
pub fn setfieldmode(field_mode u8, half_aspect_ratio u8) 

[c:'GX_GetYScaleFactor']
pub fn getyscalefactor(efbheight u16, xfbheight u16) f32

[c:'GX_SetDispCopyYScale']
pub fn setdispcopyyscale(yscale f32) u32

[c:'GX_SetDispCopySrc']
pub fn setdispcopysrc(left u16, top u16, wd u16, ht u16) 

[c:'GX_SetDispCopyDst']
pub fn setdispcopydst(wd u16, ht u16) 

[c:'GX_SetCopyClamp']
pub fn setcopyclamp(clamp u8) 

[c:'GX_SetDispCopyGamma']
pub fn setdispcopygamma(gamma u8) 

[c:'GX_SetCopyFilter']
pub fn setcopyfilter(aa u8, sample_pattern [12][2]u8, vf u8, vfilter &u8) 

[c:'GX_SetDispCopyFrame2Field']
pub fn setdispcopyframe2field(mode u8) 

[c:'GX_SetCopyClear']
pub fn setcopyclear(color GXColor, zvalue u32) 

[c:'GX_CopyDisp']
pub fn copydisp(dest voidptr, clear u8) 

[c:'GX_SetTexCopySrc']
pub fn settexcopysrc(left u16, top u16, wd u16, ht u16) 

[c:'GX_SetTexCopyDst']
pub fn settexcopydst(wd u16, ht u16, fmt u32, mipmap u8) 

[c:'GX_CopyTex']
pub fn copytex(dest voidptr, clear u8) 

[c:'GX_PixModeSync']
pub fn pixmodesync() 

[c:'GX_ClearBoundingBox']
pub fn clearboundingbox() 

[c:'GX_PokeAlphaMode']
pub fn pokealphamode(func u8, threshold u8) 

[c:'GX_PokeAlphaUpdate']
pub fn pokealphaupdate(update_enable u8) 

[c:'GX_PokeColorUpdate']
pub fn pokecolorupdate(update_enable u8) 

[c:'GX_PokeDither']
pub fn pokedither(dither u8) 

[c:'GX_PokeBlendMode']
pub fn pokeblendmode(type_ u8, src_fact u8, dst_fact u8, op u8) 

[c:'GX_PokeAlphaRead']
pub fn pokealpharead(mode u8) 

[c:'GX_PokeDstAlpha']
pub fn pokedstalpha(enable u8, a u8) 

[c:'GX_PokeARGB']
pub fn pokeargb(x u16, y u16, color GXColor) 

[c:'GX_PeekARGB']
pub fn peekargb(x u16, y u16, color &GXColor) 

[c:'GX_PokeZ']
pub fn pokez(x u16, y u16, z u32) 

[c:'GX_PeekZ']
pub fn peekz(x u16, y u16, z &u32) 

[c:'GX_PokeZMode']
pub fn pokezmode(comp_enable u8, func u8, update_enable u8) 

[c:'GX_GetTexObjFmt']
pub fn gettexobjfmt(obj &GXTexObj) u32

[c:'GX_GetTexObjMipMap']
pub fn gettexobjmipmap(obj &GXTexObj) u32

[c:'GX_GetTexObjUserData']
pub fn gettexobjuserdata(obj &GXTexObj) voidptr

[c:'GX_GetTexObjData']
pub fn gettexobjdata(obj &GXTexObj) voidptr

[c:'GX_GetTexObjWrapS']
pub fn gettexobjwraps(obj &GXTexObj) u8

[c:'GX_GetTexObjWrapT']
pub fn gettexobjwrapt(obj &GXTexObj) u8

[c:'GX_GetTexObjHeight']
pub fn gettexobjheight(obj &GXTexObj) u16

[c:'GX_GetTexObjWidth']
pub fn gettexobjwidth(obj &GXTexObj) u16

[c:'GX_GetTexObjAll']
pub fn gettexobjall(obj &GXTexObj, image_ptr &voidptr, width &u16, height &u16, format &u8, wrap_s &u8, wrap_t &u8, mipmap &u8) 

[c:'GX_GetTexBufferSize']
pub fn gettexbuffersize(wd u16, ht u16, fmt u32, mipmap u8, maxlod u8) u32

[c:'GX_InvalidateTexAll']
pub fn invalidatetexall() 

[c:'GX_InvalidateTexRegion']
pub fn invalidatetexregion(region &GXTexRegion) 

[c:'GX_InitTexCacheRegion']
pub fn inittexcacheregion(region &GXTexRegion, ii32bmipmap u8, tmem_even u32, size_even u8, tmem_odd u32, size_odd u8) 

[c:'GX_InitTexPreloadRegion']
pub fn inittexpreloadregion(region &GXTexRegion, tmem_even u32, size_even u32, tmem_odd u32, size_odd u32) 

[c:'GX_InitTexObj']
pub fn inittexobj(obj &GXTexObj, img_ptr voidptr, wd u16, ht u16, fmt u8, wrap_s u8, wrap_t u8, mipmap u8) 

[c:'GX_InitTexObjCI']
pub fn inittexobjci(obj &GXTexObj, img_ptr voidptr, wd u16, ht u16, fmt u8, wrap_s u8, wrap_t u8, mipmap u8, tlut_name u32) 

[c:'GX_InitTexObjTlut']
pub fn inittexobjtlut(obj &GXTexObj, tlut_name u32) 

[c:'GX_InitTexObjData']
pub fn inittexobjdata(obj &GXTexObj, img_ptr voidptr) 

[c:'GX_InitTexObjWrapMode']
pub fn inittexobjwrapmode(obj &GXTexObj, wrap_s u8, wrap_t u8) 

[c:'GX_InitTexObjFilterMode']
pub fn inittexobjfiltermode(obj &GXTexObj, minfilt u8, magfilt u8) 

[c:'GX_InitTexObjMinLOD']
pub fn inittexobjminlod(obj &GXTexObj, minlod f32) 

[c:'GX_InitTexObjMaxLOD']
pub fn inittexobjmaxlod(obj &GXTexObj, maxlod f32) 

[c:'GX_InitTexObjLODBias']
pub fn inittexobjlodbias(obj &GXTexObj, lodbias f32) 

[c:'GX_InitTexObjBiasClamp']
pub fn inittexobjbiasclamp(obj &GXTexObj, biasclamp u8) 

[c:'GX_InitTexObjEdgeLOD']
pub fn inittexobjedgelod(obj &GXTexObj, edgelod u8) 

[c:'GX_InitTexObjMaxAniso']
pub fn inittexobjmaxaniso(obj &GXTexObj, maxaniso u8) 

[c:'GX_InitTexObjUserData']
pub fn inittexobjuserdata(obj &GXTexObj, userdata voidptr) 

[c:'GX_LoadTexObj']
pub fn loadtexobj(obj &GXTexObj, mapid u8) 

[c:'GX_LoadTlut']
pub fn loadtlut(obj &GXTlutObj, tlut_name u32) 

[c:'GX_LoadTexObjPreloaded']
pub fn loadtexobjpreloaded(obj &GXTexObj, region &GXTexRegion, mapid u8) 

[c:'GX_PreloadEntireTexture']
pub fn preloadentiretexture(obj &GXTexObj, region &GXTexRegion) 

[c:'GX_InitTlutObj']
pub fn inittlutobj(obj &GXTlutObj, lut voidptr, fmt u8, entries u16) 

[c:'GX_InitTlutRegion']
pub fn inittlutregion(region &GXTlutRegion, tmem_addr u32, tlut_sz u8) 

[c:'GX_InitTexObjLOD']
pub fn inittexobjlod(obj &GXTexObj, minfilt u8, magfilt u8, minlod f32, maxlod f32, lodbias f32, biasclamp u8, edgelod u8, maxaniso u8) 

[c:'GX_SetTexCoordScaleManually']
pub fn settexcoordscalemanually(texcoord u8, enable u8, ss u16, ts u16) 

[c:'GX_SetTexCoordCylWrap']
pub fn settexcoordcylwrap(texcoord u8, s_enable u8, t_enable u8) 

[c:'GX_SetTexCoordBias']
pub fn settexcoordbias(texcoord u8, s_enable u8, t_enable u8) 

[c:'GX_SetTexRegionCallback']
pub fn settexregioncallback(cb GXTexRegionCallback) GXTexRegionCallback

[c:'GX_SetTlutRegionCallback']
pub fn settlutregioncallback(cb GXTlutRegionCallback) GXTlutRegionCallback

[c:'GX_InitLightPos']
pub fn initlightpos(lit_obj &GXLightObj, x f32, y f32, z f32) 

[c:'GX_InitLightColor']
pub fn initlightcolor(lit_obj &GXLightObj, col GXColor) 

[c:'GX_InitLightDir']
pub fn initlightdir(lit_obj &GXLightObj, nx f32, ny f32, nz f32) 

[c:'GX_LoadLightObj']
pub fn loadlightobj(lit_obj &GXLightObj, lit_id u8) 

[c:'GX_LoadLightObjIdx']
pub fn loadlightobjidx(litobjidx u32, litid u8) 

[c:'GX_InitLightDistAttn']
pub fn initlightdistattn(lit_obj &GXLightObj, ref_dist f32, ref_brite f32, dist_fn u8) 

[c:'GX_InitLightAttn']
pub fn initlightattn(lit_obj &GXLightObj, a0 f32, a1 f32, a2 f32, k0 f32, k1 f32, k2 f32) 

[c:'GX_InitLightAttnA']
pub fn initlightattna(lit_obj &GXLightObj, a0 f32, a1 f32, a2 f32) 

[c:'GX_InitLightAttnK']
pub fn initlightattnk(lit_obj &GXLightObj, k0 f32, k1 f32, k2 f32) 

[c:'GX_InitSpecularDirHA']
pub fn initspeculardirha(lit_obj &GXLightObj, nx f32, ny f32, nz f32, hx f32, hy f32, hz f32) 

[c:'GX_InitSpecularDir']
pub fn initspeculardir(lit_obj &GXLightObj, nx f32, ny f32, nz f32) 

[c:'GX_InitLightSpot']
pub fn initlightspot(lit_obj &GXLightObj, cut_off f32, spotfn u8) 

[c:'GX_ReadClksPerVtx']
pub fn readclkspervtx() u32

[c:'GX_GetOverflowCount']
pub fn getoverflowcount() u32

[c:'GX_ResetOverflowCount']
pub fn resetoverflowcount() u32

//[c:'GX_GetCurrentGXThread']
//pub fn getcurrentgxthread() Lwp_t

//[c:'GX_SetCurrentGXThread']
//pub fn setcurrentgxthread() Lwp_t

[c:'GX_RestoreWriteGatherPipe']
pub fn restorewritegatherpipe() 

[c:'GX_SetGPMetric']
pub fn setgpmetric(perf0 u32, perf1 u32) 

[c:'GX_ClearGPMetric']
pub fn cleargpmetric() 

[c:'GX_InitXfRasMetric']
pub fn initxfrasmetric() 

[c:'GX_ReadXfRasMetric']
pub fn readxfrasmetric(xfwaitin &u32, xfwaitout &u32, rasbusy &u32, clks &u32) 

[c:'GX_ClearVCacheMetric']
pub fn clearvcachemetric() 

[c:'GX_ReadVCacheMetric']
pub fn readvcachemetric(check &u32, miss &u32, stall &u32) 

[c:'GX_SetVCacheMetric']
pub fn setvcachemetric(attr u32) 

[c:'GX_GetGPStatus']
pub fn getgpstatus(overhi &u8, underlow &u8, readidle &u8, cmdidle &u8, brkpt &u8) 

[c:'GX_ReadGPMetric']
pub fn readgpmetric(cnt0 &u32, cnt1 &u32) 

[c:'GX_ReadBoundingBox']
pub fn readboundingbox(top &u16, bottom &u16, left &u16, right &u16) 

[c:'GX_RedirectWriteGatherPipe']
pub fn redirectwritegatherpipe(ptr voidptr) voidptr

