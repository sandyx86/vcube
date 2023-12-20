[translated]
module gx

type u16 = u16
type U32 = u32
type U64 = u64
type s8 = Int8_t
type i16 = i16
type i32 = int
type S64 = i64
type Vu8 = u8
type Vu16 = u16
type Vu32 = u32
type Vu64 = U64
type Vs8 = s8
type Vi16 = i16
type Vi32 = i32
type Vs64 = S64
type Sfp16 = i16
type Sfp32 = i32
type Ufp16 = u16
type Ufp32 = u32
type f32 = f32
type F64 = f64
type Vf32 = f32
type Vf64 = f64
struct Argv { 
	argvMagic int
	commandLine &i8
	length int
	argc int
	argv &&u8
	endARGV &&u8
}
type Lwpq_t = u32
type GXRModeObj = Gx_rmodeobj
type GuVector = Vecf
struct GuQuaternion { 
	x f32
	y f32
	z f32
	w f32
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
	u8 Vu8
	s8 Vs8
	u16 Vu16
	i16 Vi16
	u32 Vu32
	i32 Vi32
	f32 Vf32
}
struct GXColor { 
	r u8
	g u8
	b u8
	a u8
}
struct GXColorS10 { 
	r i16
	g i16
	b i16
	a i16
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
	x f32
	y f32
	z f32
	s u16
	t u16
	rgba u32
}
struct GXVtxDesc { 
	attr u8
	type_ u8
}
struct GXVtxAttrFmt { 
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
pub fn gx_initfifoptrs(fifo &GXFifoObj, rd_ptr voidptr, wt_ptr voidptr) 

[c:'GX_GetFifoPtrs']
pub fn gx_getfifoptrs(fifo &GXFifoObj, rd_ptr &voidptr, wt_ptr &voidptr) 

[c:'GX_SetCPUFifo']
pub fn gx_setcpufifo(fifo &GXFifoObj) 

[c:'GX_SetGPFifo']
pub fn gx_setgpfifo(fifo &GXFifoObj) 

[c:'GX_GetCPUFifo']
pub fn gx_getcpufifo(fifo &GXFifoObj) 

[c:'GX_GetGPFifo']
pub fn gx_getgpfifo(fifo &GXFifoObj) 

[c:'GX_GetFifoBase']
pub fn gx_getfifobase(fifo &GXFifoObj) voidptr

[c:'GX_GetFifoCount']
pub fn gx_getfifocount(fifo &GXFifoObj) u32

[c:'GX_GetFifoSize']
pub fn gx_getfifosize(fifo &GXFifoObj) u32

[c:'GX_GetFifoWrap']
pub fn gx_getfifowrap(fifo &GXFifoObj) u8

[c:'GX_SetDrawDoneCallback']
pub fn gx_setdrawdonecallback(cb GXDrawDoneCallback) GXDrawDoneCallback

[c:'GX_SetBreakPtCallback']
pub fn gx_setbreakptcallback(cb GXBreakPtCallback) GXBreakPtCallback

[c:'GX_AbortFrame']
pub fn gx_abortframe() 

[c:'GX_Flush']
pub fn gx_flush() 

[c:'GX_SetMisc']
pub fn gx_setmisc(token u32, value u32) 

[c:'GX_SetDrawDone']
pub fn gx_setdrawdone() 

[c:'GX_WaitDrawDone']
pub fn gx_waitdrawdone() 

[c:'GX_GetDrawSync']
pub fn gx_getdrawsync() u16

[c:'GX_SetDrawSync']
pub fn gx_setdrawsync(token u16) 

[c:'GX_SetDrawSyncCallback']
pub fn gx_setdrawsynccallback(cb GXDrawSyncCallback) GXDrawSyncCallback

[c:'GX_DisableBreakPt']
pub fn gx_disablebreakpt() 

[c:'GX_EnableBreakPt']
pub fn gx_enablebreakpt(break_pt voidptr) 

[c:'GX_DrawDone']
pub fn gx_drawdone() 

[c:'GX_TexModeSync']
pub fn gx_texmodesync() 

[c:'GX_InvVtxCache']
pub fn gx_invvtxcache() 

[c:'GX_ClearVtxDesc']
pub fn gx_clearvtxdesc() 

[c:'GX_LoadProjectionMtx']
pub fn gx_loadprojectionmtx(mt [4]fn () f32, type_ u8) 

[c:'GX_SetViewport']
pub fn gx_setviewport(xorig f32, yorig f32, wd f32, ht f32, nearz f32, farz f32) 

[c:'GX_SetViewportJitter']
pub fn gx_setviewportjitter(xorig f32, yorig f32, wd f32, ht f32, nearz f32, farz f32, field u32) 

[c:'GX_SetChanCtrl']
pub fn gx_setchanctrl(channel i32, enable u8, ambsrc u8, matsrc u8, litmask u8, diff_fn u8, attn_fn u8) 

[c:'GX_SetChanAmbColor']
pub fn gx_setchanambcolor(channel i32, color GXColor) 

[c:'GX_SetChanMatColor']
pub fn gx_setchanmatcolor(channel i32, color GXColor) 

[c:'GX_SetArray']
pub fn gx_setarray(attr u32, ptr voidptr, stride u8) 

[c:'GX_SetVtxAttrFmt']
pub fn gx_setvtxattrfmt(vtxfmt u8, vtxattr u32, comptype u32, compsize u32, frac u32) 

[c:'GX_SetVtxAttrFmtv']
pub fn gx_setvtxattrfmtv(vtxfmt u8, attr_list &GXVtxAttrFmt) 

[c:'GX_SetVtxDesc']
pub fn gx_setvtxdesc(attr u8, type_ u8) 

[c:'GX_SetVtxDescv']
pub fn gx_setvtxdescv(attr_list &GXVtxDesc) 

[c:'GX_GetVtxDescv']
pub fn gx_getvtxdescv(attr_list &GXVtxDesc) 

[c:'GX_EndDispList']
pub fn gx_enddisplist() u32

[c:'GX_Begin']
pub fn gx_begin(primitve u8, vtxfmt u8, vtxcnt u16) 

[c:'GX_BeginDispList']
pub fn gx_begindisplist(list voidptr, size u32) 

[c:'GX_CallDispList']
pub fn gx_calldisplist(list voidptr, nbytes u32) 

[c:'GX_End']
pub fn gx_end()  {
}

[c:'GX_Position3f32']
pub fn gx_position3f32(x f32, y f32, z f32)  {
	wgPipe.f32 = x
	wgPipe.f32 = y
	wgPipe.f32 = z
}

[c:'GX_Position3u16']
pub fn gx_position3u16(x u16, y u16, z u16)  {
	wgPipe.u16 = x
	wgPipe.u16 = y
	wgPipe.u16 = z
}

[c:'GX_Position3i16']
pub fn gx_position3i16(x i16, y i16, z i16)  {
	wgPipe.i16 = x
	wgPipe.i16 = y
	wgPipe.i16 = z
}

[c:'GX_Position3u8']
pub fn gx_position3u8(x u8, y u8, z u8)  {
	wgPipe.u8 = x
	wgPipe.u8 = y
	wgPipe.u8 = z
}

[c:'GX_Position3s8']
pub fn gx_position3s8(x s8, y s8, z s8)  {
	wgPipe.s8 = x
	wgPipe.s8 = y
	wgPipe.s8 = z
}

[c:'GX_Position2f32']
pub fn gx_position2f32(x f32, y f32)  {
	wgPipe.f32 = x
	wgPipe.f32 = y
}

[c:'GX_Position2u16']
pub fn gx_position2u16(x u16, y u16)  {
	wgPipe.u16 = x
	wgPipe.u16 = y
}

[c:'GX_Position2i16']
pub fn gx_position2i16(x i16, y i16)  {
	wgPipe.i16 = x
	wgPipe.i16 = y
}

[c:'GX_Position2u8']
pub fn gx_position2u8(x u8, y u8)  {
	wgPipe.u8 = x
	wgPipe.u8 = y
}

[c:'GX_Position2s8']
pub fn gx_position2s8(x s8, y s8)  {
	wgPipe.s8 = x
	wgPipe.s8 = y
}

[c:'GX_Position1x8']
pub fn gx_position1x8(index u8)  {
	wgPipe.u8 = index
}

[c:'GX_Position1x16']
pub fn gx_position1x16(index u16)  {
	wgPipe.u16 = index
}

[c:'GX_Normal3f32']
pub fn gx_normal3f32(nx f32, ny f32, nz f32)  {
	wgPipe.f32 = nx
	wgPipe.f32 = ny
	wgPipe.f32 = nz
}

[c:'GX_Normal3i16']
pub fn gx_normal3i16(nx i16, ny i16, nz i16)  {
	wgPipe.i16 = nx
	wgPipe.i16 = ny
	wgPipe.i16 = nz
}

[c:'GX_Normal3s8']
pub fn gx_normal3s8(nx s8, ny s8, nz s8)  {
	wgPipe.s8 = nx
	wgPipe.s8 = ny
	wgPipe.s8 = nz
}

[c:'GX_Normal1x8']
pub fn gx_normal1x8(index u8)  {
	wgPipe.u8 = index
}

[c:'GX_Normal1x16']
pub fn gx_normal1x16(index u16)  {
	wgPipe.u16 = index
}

[c:'GX_Color4u8']
pub fn gx_color4u8(r u8, g u8, b u8, a u8)  {
	wgPipe.u8 = r
	wgPipe.u8 = g
	wgPipe.u8 = b
	wgPipe.u8 = a
}

[c:'GX_Color3u8']
pub fn gx_color3u8(r u8, g u8, b u8)  {
	wgPipe.u8 = r
	wgPipe.u8 = g
	wgPipe.u8 = b
}

[c:'GX_Color3f32']
pub fn gx_color3f32(r f32, g f32, b f32)  {
	wgPipe.u8 = u8((r * 255))
	wgPipe.u8 = u8((g * 255))
	wgPipe.u8 = u8((b * 255))
}

[c:'GX_Color1u32']
pub fn gx_color1u32(clr u32)  {
	wgPipe.U32 = clr
}

[c:'GX_Color1u16']
pub fn gx_color1u16(clr u16)  {
	wgPipe.u16 = clr
}

[c:'GX_Color1x8']
pub fn gx_color1x8(index u8)  {
	wgPipe.u8 = index
}

[c:'GX_Color1x16']
pub fn gx_color1x16(index u16)  {
	wgPipe.u16 = index
}

[c:'GX_TexCoord2f32']
pub fn gx_texcoord2f32(s f32, t f32)  {
	wgPipe.f32 = s
	wgPipe.f32 = t
}

[c:'GX_TexCoord2u16']
pub fn gx_texcoord2u16(s u16, t u16)  {
	wgPipe.u16 = s
	wgPipe.u16 = t
}

[c:'GX_TexCoord2i16']
pub fn gx_texcoord2i16(s i16, t i16)  {
	wgPipe.i16 = s
	wgPipe.i16 = t
}

[c:'GX_TexCoord2u8']
pub fn gx_texcoord2u8(s u8, t u8)  {
	wgPipe.u8 = s
	wgPipe.u8 = t
}

[c:'GX_TexCoord2s8']
pub fn gx_texcoord2s8(s s8, t s8)  {
	wgPipe.s8 = s
	wgPipe.s8 = t
}

[c:'GX_TexCoord1f32']
pub fn gx_texcoord1f32(s f32)  {
	wgPipe.f32 = s
}

[c:'GX_TexCoord1u16']
pub fn gx_texcoord1u16(s u16)  {
	wgPipe.u16 = s
}

[c:'GX_TexCoord1i16']
pub fn gx_texcoord1i16(s i16)  {
	wgPipe.i16 = s
}

[c:'GX_TexCoord1u8']
pub fn gx_texcoord1u8(s u8)  {
	wgPipe.u8 = s
}

[c:'GX_TexCoord1s8']
pub fn gx_texcoord1s8(s s8)  {
	wgPipe.s8 = s
}

[c:'GX_TexCoord1x8']
pub fn gx_texcoord1x8(index u8)  {
	wgPipe.u8 = index
}

[c:'GX_TexCoord1x16']
pub fn gx_texcoord1x16(index u16)  {
	wgPipe.u16 = index
}

[c:'GX_MatrixIndex1x8']
pub fn gx_matrixindex1x8(index u8)  {
	wgPipe.u8 = index
}

[c:'GX_AdjustForOverscan']
pub fn gx_adjustforoverscan(rmin &GXRModeObj, rmout &GXRModeObj, hor u16, ver u16) 

[c:'GX_LoadPosMtxImm']
pub fn gx_loadposmtximm(mt [4]fn () f32, pnidx u32) 

[c:'GX_LoadPosMtxIdx']
pub fn gx_loadposmtxidx(mtxidx u16, pnidx u32) 

[c:'GX_LoadNrmMtxImm']
pub fn gx_loadnrmmtximm(mt [4]fn () f32, pnidx u32) 

[c:'GX_LoadNrmMtxImm3x3']
pub fn gx_loadnrmmtximm3x3(mt [3]fn () f32, pnidx u32) 

[c:'GX_LoadNrmMtxIdx3x3']
pub fn gx_loadnrmmtxidx3x3(mtxidx u16, pnidx u32) 

[c:'GX_LoadTexMtxImm']
pub fn gx_loadtexmtximm(mt [4]fn () f32, texidx u32, type_ u8) 

[c:'GX_LoadTexMtxIdx']
pub fn gx_loadtexmtxidx(mtxidx u16, texidx u32, type_ u8) 

[c:'GX_SetCurrentMtx']
pub fn gx_setcurrentmtx(mtx u32) 

[c:'GX_SetTevOp']
pub fn gx_settevop(tevstage u8, mode u8) 

[c:'GX_SetTevColor']
pub fn gx_settevcolor(tev_regid u8, color GXColor) 

[c:'GX_SetTevColorS10']
pub fn gx_settevcolors10(tev_regid u8, color GXColorS10) 

[c:'GX_SetTevColorIn']
pub fn gx_settevcolorin(tevstage u8, a u8, b u8, c u8, d u8) 

[c:'GX_SetTevAlphaIn']
pub fn gx_settevalphain(tevstage u8, a u8, b u8, c u8, d u8) 

[c:'GX_SetTevColorOp']
pub fn gx_settevcolorop(tevstage u8, tevop u8, tevbias u8, tevscale u8, clamp u8, tevregid u8) 

[c:'GX_SetTevAlphaOp']
pub fn gx_settevalphaop(tevstage u8, tevop u8, tevbias u8, tevscale u8, clamp u8, tevregid u8) 

[c:'GX_SetNumTexGens']
pub fn gx_setnumtexgens(nr u32) 

[c:'GX_SetTexCoordGen']
pub fn gx_settexcoordgen(texcoord u16, tgen_typ u32, tgen_src u32, mtxsrc u32) 

[c:'GX_SetTexCoordGen2']
pub fn gx_settexcoordgen2(texcoord u16, tgen_typ u32, tgen_src u32, mtxsrc u32, normalize u32, postmtx u32) 

[c:'GX_SetZTexture']
pub fn gx_setztexture(op u8, fmt u8, bias u32) 

[c:'GX_SetZMode']
pub fn gx_setzmode(enable u8, func u8, update_enable u8) 

[c:'GX_SetZCompLoc']
pub fn gx_setzcomploc(before_tex u8) 

[c:'GX_SetLineWidth']
pub fn gx_setlinewidth(width u8, fmt u8) 

[c:'GX_SetPointSize']
pub fn gx_setpointsize(width u8, fmt u8) 

[c:'GX_SetBlendMode']
pub fn gx_setblendmode(type_ u8, src_fact u8, dst_fact u8, op u8) 

[c:'GX_SetCullMode']
pub fn gx_setcullmode(mode u8) 

[c:'GX_SetCoPlanar']
pub fn gx_setcoplanar(enable u8) 

[c:'GX_EnableTexOffsets']
pub fn gx_enabletexoffsets(coord u8, line_enable u8, point_enable u8) 

[c:'GX_SetClipMode']
pub fn gx_setclipmode(mode u8) 

[c:'GX_SetScissor']
pub fn gx_setscissor(xorigin u32, yorigin u32, wd u32, ht u32) 

[c:'GX_SetScissorBoxOffset']
pub fn gx_setscissorboxoffset(xoffset i32, yoffset i32) 

[c:'GX_SetNumChans']
pub fn gx_setnumchans(num u8) 

[c:'GX_SetTevOrder']
pub fn gx_settevorder(tevstage u8, texcoord u8, texmap u32, color u8) 

[c:'GX_SetNumTevStages']
pub fn gx_setnumtevstages(num u8) 

[c:'GX_SetAlphaCompare']
pub fn gx_setalphacompare(comp0 u8, ref0 u8, aop u8, comp1 u8, ref1 u8) 

[c:'GX_SetTevKColor']
pub fn gx_settevkcolor(sel u8, col GXColor) 

[c:'GX_SetTevKColorSel']
pub fn gx_settevkcolorsel(tevstage u8, sel u8) 

[c:'GX_SetTevKAlphaSel']
pub fn gx_settevkalphasel(tevstage u8, sel u8) 

[c:'GX_SetTevKColorS10']
pub fn gx_settevkcolors10(sel u8, col GXColorS10) 

[c:'GX_SetTevSwapMode']
pub fn gx_settevswapmode(tevstage u8, ras_sel u8, tex_sel u8) 

[c:'GX_SetTevSwapModeTable']
pub fn gx_settevswapmodetable(swapid u8, r u8, g u8, b u8, a u8) 

[c:'GX_SetTevIndirect']
pub fn gx_settevindirect(tevstage u8, indtexid u8, format u8, bias u8, mtxid u8, wrap_s u8, wrap_t u8, addprev u8, utclod u8, a u8) 

[c:'GX_SetTevDirect']
pub fn gx_settevdirect(tevstage u8) 

[c:'GX_SetNumIndStages']
pub fn gx_setnumindstages(nstages u8) 

[c:'GX_SetIndTexOrder']
pub fn gx_setindtexorder(indtexstage u8, texcoord u8, texmap u8) 

[c:'GX_SetIndTexCoordScale']
pub fn gx_setindtexcoordscale(indtexid u8, scale_s u8, scale_t u8) 

[c:'GX_SetFog']
pub fn gx_setfog(type_ u8, startz f32, endz f32, nearz f32, farz f32, col GXColor) 

[c:'GX_SetFogRangeAdj']
pub fn gx_setfograngeadj(enable u8, center u16, table &GXFogAdjTbl) 

[c:'GX_SetFogColor']
pub fn gx_setfogcolor(color GXColor) 

[c:'GX_InitFogAdjTable']
pub fn gx_initfogadjtable(table &GXFogAdjTbl, width u16, projmtx [4]fn () f32) 

[c:'GX_SetIndTexMatrix']
pub fn gx_setindtexmatrix(indtexmtx u8, offset_mtx [3]fn () f32, scale_exp s8) 

[c:'GX_SetTevIndBumpST']
pub fn gx_settevindbumpst(tevstage u8, indstage u8, mtx_sel u8) 

[c:'GX_SetTevIndBumpXYZ']
pub fn gx_settevindbumpxyz(tevstage u8, indstage u8, mtx_sel u8) 

[c:'GX_SetTevIndTile']
pub fn gx_settevindtile(tevstage u8, indtexid u8, tilesize_x u16, tilesize_y u16, tilespacing_x u16, tilespacing_y u16, indtexfmt u8, indtexmtx u8, bias_sel u8, alpha_sel u8) 

[c:'GX_SetTevIndWarp']
pub fn gx_settevindwarp(tevstage u8, indtexid u8, bias_flag u8, replace_tex u8, mtxid u8) 

[c:'GX_SetTevIndRepeat']
pub fn gx_settevindrepeat(tevstage u8) 

[c:'GX_SetColorUpdate']
pub fn gx_setcolorupdate(enable u8) 

[c:'GX_SetAlphaUpdate']
pub fn gx_setalphaupdate(enable u8) 

[c:'GX_SetPixelFmt']
pub fn gx_setpixelfmt(pix_fmt u8, z_fmt u8) 

[c:'GX_SetDither']
pub fn gx_setdither(dither u8) 

[c:'GX_SetDstAlpha']
pub fn gx_setdstalpha(enable u8, a u8) 

[c:'GX_SetFieldMask']
pub fn gx_setfieldmask(even_mask u8, odd_mask u8) 

[c:'GX_SetFieldMode']
pub fn gx_setfieldmode(field_mode u8, half_aspect_ratio u8) 

[c:'GX_GetYScaleFactor']
pub fn gx_getyscalefactor(efbheight u16, xfbheight u16) f32

[c:'GX_SetDispCopyYScale']
pub fn gx_setdispcopyyscale(yscale f32) u32

[c:'GX_SetDispCopySrc']
pub fn gx_setdispcopysrc(left u16, top u16, wd u16, ht u16) 

[c:'GX_SetDispCopyDst']
pub fn gx_setdispcopydst(wd u16, ht u16) 

[c:'GX_SetCopyClamp']
pub fn gx_setcopyclamp(clamp u8) 

[c:'GX_SetDispCopyGamma']
pub fn gx_setdispcopygamma(gamma u8) 

[c:'GX_SetCopyFilter']
pub fn gx_setcopyfilter(aa u8, sample_pattern [2]fn () u8, vf u8, vfilter &u8) 

[c:'GX_SetDispCopyFrame2Field']
pub fn gx_setdispcopyframe2field(mode u8) 

[c:'GX_SetCopyClear']
pub fn gx_setcopyclear(color GXColor, zvalue u32) 

[c:'GX_CopyDisp']
pub fn gx_copydisp(dest voidptr, clear u8) 

[c:'GX_SetTexCopySrc']
pub fn gx_settexcopysrc(left u16, top u16, wd u16, ht u16) 

[c:'GX_SetTexCopyDst']
pub fn gx_settexcopydst(wd u16, ht u16, fmt u32, mipmap u8) 

[c:'GX_CopyTex']
pub fn gx_copytex(dest voidptr, clear u8) 

[c:'GX_PixModeSync']
pub fn gx_pixmodesync() 

[c:'GX_ClearBoundingBox']
pub fn gx_clearboundingbox() 

[c:'GX_PokeAlphaMode']
pub fn gx_pokealphamode(func u8, threshold u8) 

[c:'GX_PokeAlphaUpdate']
pub fn gx_pokealphaupdate(update_enable u8) 

[c:'GX_PokeColorUpdate']
pub fn gx_pokecolorupdate(update_enable u8) 

[c:'GX_PokeDither']
pub fn gx_pokedither(dither u8) 

[c:'GX_PokeBlendMode']
pub fn gx_pokeblendmode(type_ u8, src_fact u8, dst_fact u8, op u8) 

[c:'GX_PokeAlphaRead']
pub fn gx_pokealpharead(mode u8) 

[c:'GX_PokeDstAlpha']
pub fn gx_pokedstalpha(enable u8, a u8) 

[c:'GX_PokeARGB']
pub fn gx_pokeargb(x u16, y u16, color GXColor) 

[c:'GX_PeekARGB']
pub fn gx_peekargb(x u16, y u16, color &GXColor) 

[c:'GX_PokeZ']
pub fn gx_pokez(x u16, y u16, z u32) 

[c:'GX_PeekZ']
pub fn gx_peekz(x u16, y u16, z &u32) 

[c:'GX_PokeZMode']
pub fn gx_pokezmode(comp_enable u8, func u8, update_enable u8) 

[c:'GX_GetTexObjFmt']
pub fn gx_gettexobjfmt(obj &GXTexObj) u32

[c:'GX_GetTexObjMipMap']
pub fn gx_gettexobjmipmap(obj &GXTexObj) u32

[c:'GX_GetTexObjUserData']
pub fn gx_gettexobjuserdata(obj &GXTexObj) voidptr

[c:'GX_GetTexObjData']
pub fn gx_gettexobjdata(obj &GXTexObj) voidptr

[c:'GX_GetTexObjWrapS']
pub fn gx_gettexobjwraps(obj &GXTexObj) u8

[c:'GX_GetTexObjWrapT']
pub fn gx_gettexobjwrapt(obj &GXTexObj) u8

[c:'GX_GetTexObjHeight']
pub fn gx_gettexobjheight(obj &GXTexObj) u16

[c:'GX_GetTexObjWidth']
pub fn gx_gettexobjwidth(obj &GXTexObj) u16

[c:'GX_GetTexObjAll']
pub fn gx_gettexobjall(obj &GXTexObj, image_ptr &voidptr, width &u16, height &u16, format &u8, wrap_s &u8, wrap_t &u8, mipmap &u8) 

[c:'GX_GetTexBufferSize']
pub fn gx_gettexbuffersize(wd u16, ht u16, fmt u32, mipmap u8, maxlod u8) u32

[c:'GX_InvalidateTexAll']
pub fn gx_invalidatetexall() 

[c:'GX_InvalidateTexRegion']
pub fn gx_invalidatetexregion(region &GXTexRegion) 

[c:'GX_InitTexCacheRegion']
pub fn gx_inittexcacheregion(region &GXTexRegion, ii32bmipmap u8, tmem_even u32, size_even u8, tmem_odd u32, size_odd u8) 

[c:'GX_InitTexPreloadRegion']
pub fn gx_inittexpreloadregion(region &GXTexRegion, tmem_even u32, size_even u32, tmem_odd u32, size_odd u32) 

[c:'GX_InitTexObj']
pub fn gx_inittexobj(obj &GXTexObj, img_ptr voidptr, wd u16, ht u16, fmt u8, wrap_s u8, wrap_t u8, mipmap u8) 

[c:'GX_InitTexObjCI']
pub fn gx_inittexobjci(obj &GXTexObj, img_ptr voidptr, wd u16, ht u16, fmt u8, wrap_s u8, wrap_t u8, mipmap u8, tlut_name u32) 

[c:'GX_InitTexObjTlut']
pub fn gx_inittexobjtlut(obj &GXTexObj, tlut_name u32) 

[c:'GX_InitTexObjData']
pub fn gx_inittexobjdata(obj &GXTexObj, img_ptr voidptr) 

[c:'GX_InitTexObjWrapMode']
pub fn gx_inittexobjwrapmode(obj &GXTexObj, wrap_s u8, wrap_t u8) 

[c:'GX_InitTexObjFilterMode']
pub fn gx_inittexobjfiltermode(obj &GXTexObj, minfilt u8, magfilt u8) 

[c:'GX_InitTexObjMinLOD']
pub fn gx_inittexobjminlod(obj &GXTexObj, minlod f32) 

[c:'GX_InitTexObjMaxLOD']
pub fn gx_inittexobjmaxlod(obj &GXTexObj, maxlod f32) 

[c:'GX_InitTexObjLODBias']
pub fn gx_inittexobjlodbias(obj &GXTexObj, lodbias f32) 

[c:'GX_InitTexObjBiasClamp']
pub fn gx_inittexobjbiasclamp(obj &GXTexObj, biasclamp u8) 

[c:'GX_InitTexObjEdgeLOD']
pub fn gx_inittexobjedgelod(obj &GXTexObj, edgelod u8) 

[c:'GX_InitTexObjMaxAniso']
pub fn gx_inittexobjmaxaniso(obj &GXTexObj, maxaniso u8) 

[c:'GX_InitTexObjUserData']
pub fn gx_inittexobjuserdata(obj &GXTexObj, userdata voidptr) 

[c:'GX_LoadTexObj']
pub fn gx_loadtexobj(obj &GXTexObj, mapid u8) 

[c:'GX_LoadTlut']
pub fn gx_loadtlut(obj &GXTlutObj, tlut_name u32) 

[c:'GX_LoadTexObjPreloaded']
pub fn gx_loadtexobjpreloaded(obj &GXTexObj, region &GXTexRegion, mapid u8) 

[c:'GX_PreloadEntireTexture']
pub fn gx_preloadentiretexture(obj &GXTexObj, region &GXTexRegion) 

[c:'GX_InitTlutObj']
pub fn gx_inittlutobj(obj &GXTlutObj, lut voidptr, fmt u8, entries u16) 

[c:'GX_InitTlutRegion']
pub fn gx_inittlutregion(region &GXTlutRegion, tmem_addr u32, tlut_sz u8) 

[c:'GX_InitTexObjLOD']
pub fn gx_inittexobjlod(obj &GXTexObj, minfilt u8, magfilt u8, minlod f32, maxlod f32, lodbias f32, biasclamp u8, edgelod u8, maxaniso u8) 

[c:'GX_SetTexCoordScaleManually']
pub fn gx_settexcoordscalemanually(texcoord u8, enable u8, ss u16, ts u16) 

[c:'GX_SetTexCoordCylWrap']
pub fn gx_settexcoordcylwrap(texcoord u8, s_enable u8, t_enable u8) 

[c:'GX_SetTexCoordBias']
pub fn gx_settexcoordbias(texcoord u8, s_enable u8, t_enable u8) 

[c:'GX_SetTexRegionCallback']
pub fn gx_settexregioncallback(cb GXTexRegionCallback) GXTexRegionCallback

[c:'GX_SetTlutRegionCallback']
pub fn gx_settlutregioncallback(cb GXTlutRegionCallback) GXTlutRegionCallback

[c:'GX_InitLightPos']
pub fn gx_initlightpos(lit_obj &GXLightObj, x f32, y f32, z f32) 

[c:'GX_InitLightColor']
pub fn gx_initlightcolor(lit_obj &GXLightObj, col GXColor) 

[c:'GX_InitLightDir']
pub fn gx_initlightdir(lit_obj &GXLightObj, nx f32, ny f32, nz f32) 

[c:'GX_LoadLightObj']
pub fn gx_loadlightobj(lit_obj &GXLightObj, lit_id u8) 

[c:'GX_LoadLightObjIdx']
pub fn gx_loadlightobjidx(litobjidx u32, litid u8) 

[c:'GX_InitLightDistAttn']
pub fn gx_initlightdistattn(lit_obj &GXLightObj, ref_dist f32, ref_brite f32, dist_fn u8) 

[c:'GX_InitLightAttn']
pub fn gx_initlightattn(lit_obj &GXLightObj, a0 f32, a1 f32, a2 f32, k0 f32, k1 f32, k2 f32) 

[c:'GX_InitLightAttnA']
pub fn gx_initlightattna(lit_obj &GXLightObj, a0 f32, a1 f32, a2 f32) 

[c:'GX_InitLightAttnK']
pub fn gx_initlightattnk(lit_obj &GXLightObj, k0 f32, k1 f32, k2 f32) 

[c:'GX_InitSpecularDirHA']
pub fn gx_initspeculardirha(lit_obj &GXLightObj, nx f32, ny f32, nz f32, hx f32, hy f32, hz f32) 

[c:'GX_InitSpecularDir']
pub fn gx_initspeculardir(lit_obj &GXLightObj, nx f32, ny f32, nz f32) 

[c:'GX_InitLightSpot']
pub fn gx_initlightspot(lit_obj &GXLightObj, cut_off f32, spotfn u8) 

[c:'GX_ReadClksPerVtx']
pub fn gx_readclkspervtx() u32

[c:'GX_GetOverflowCount']
pub fn gx_getoverflowcount() u32

[c:'GX_ResetOverflowCount']
pub fn gx_resetoverflowcount() u32

[c:'GX_GetCurrentGXThread']
pub fn gx_getcurrentgxthread() Lwp_t

[c:'GX_SetCurrentGXThread']
pub fn gx_setcurrentgxthread() Lwp_t

[c:'GX_RestoreWriteGatherPipe']
pub fn gx_restorewritegatherpipe() 

[c:'GX_SetGPMetric']
pub fn gx_setgpmetric(perf0 u32, perf1 u32) 

[c:'GX_ClearGPMetric']
pub fn gx_cleargpmetric() 

[c:'GX_InitXfRasMetric']
pub fn gx_initxfrasmetric() 

[c:'GX_ReadXfRasMetric']
pub fn gx_readxfrasmetric(xfwaitin &u32, xfwaitout &u32, rasbusy &u32, clks &u32) 

[c:'GX_ClearVCacheMetric']
pub fn gx_clearvcachemetric() 

[c:'GX_ReadVCacheMetric']
pub fn gx_readvcachemetric(check &u32, miss &u32, stall &u32) 

[c:'GX_SetVCacheMetric']
pub fn gx_setvcachemetric(attr u32) 

[c:'GX_GetGPStatus']
pub fn gx_getgpstatus(overhi &u8, underlow &u8, readidle &u8, cmdidle &u8, brkpt &u8) 

[c:'GX_ReadGPMetric']
pub fn gx_readgpmetric(cnt0 &u32, cnt1 &u32) 

[c:'GX_ReadBoundingBox']
pub fn gx_readboundingbox(top &u16, bottom &u16, left &u16, right &u16) 

[c:'GX_RedirectWriteGatherPipe']
pub fn gx_redirectwritegatherpipe(ptr voidptr) voidptr

