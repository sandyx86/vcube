@[translated]
module gx

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

struct GuVector {
	x F32
	y F32
	z F32
}

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

@[c: 'guFrustum']
fn gufrustum(mt [4]fn () F32, t F32, b F32, l F32, r F32, n F32, f F32)

@[c: 'guPerspective']
fn guperspective(mt [4]fn () F32, fovy F32, aspect F32, n F32, f F32)

@[c: 'guOrtho']
fn guortho(mt [4]fn () F32, t F32, b F32, l F32, r F32, n F32, f F32)

@[c: 'guLightPerspective']
fn gulightperspective(mt [4]fn () F32, fovy F32, aspect F32, scales F32, scalet F32, transs F32, transt F32)

@[c: 'guLightOrtho']
fn gulightortho(mt [4]fn () F32, t F32, b F32, l F32, r F32, scales F32, scalet F32, transs F32, transt F32)

@[c: 'guLightFrustum']
fn gulightfrustum(mt [4]fn () F32, t F32, b F32, l F32, r F32, n F32, scales F32, scalet F32, transs F32, transt F32)

@[c: 'guLookAt']
fn gulookat(mt [4]fn () F32, campos &GuVector, camup &GuVector, target &GuVector)

@[c: 'guVecHalfAngle']
fn guvechalfangle(a &GuVector, b &GuVector, half &GuVector)

@[c: 'c_guVecAdd']
fn c_guvecadd(a &GuVector, b &GuVector, ab &GuVector)

@[c: 'c_guVecSub']
fn c_guvecsub(a &GuVector, b &GuVector, ab &GuVector)

@[c: 'c_guVecScale']
fn c_guvecscale(src &GuVector, dst &GuVector, scale F32)

@[c: 'c_guVecNormalize']
fn c_guvecnormalize(v &GuVector)

@[c: 'c_guVecMultiply']
fn c_guvecmultiply(mt [4]fn () F32, src &GuVector, dst &GuVector)

@[c: 'c_guVecCross']
fn c_guveccross(a &GuVector, b &GuVector, axb &GuVector)

@[c: 'c_guVecMultiplySR']
fn c_guvecmultiplysr(mt [4]fn () F32, src &GuVector, dst &GuVector)

@[c: 'c_guVecDotProduct']
fn c_guvecdotproduct(a &GuVector, b &GuVector) F32

@[c: 'c_guQuatAdd']
fn c_guquatadd(a &GuQuaternion, b &GuQuaternion, ab &GuQuaternion)

@[c: 'c_guQuatSub']
fn c_guquatsub(a &GuQuaternion, b &GuQuaternion, ab &GuQuaternion)

@[c: 'c_guQuatMultiply']
fn c_guquatmultiply(a &GuQuaternion, b &GuQuaternion, ab &GuQuaternion)

@[c: 'c_guQuatNormalize']
fn c_guquatnormalize(a &GuQuaternion, d &GuQuaternion)

@[c: 'c_guQuatInverse']
fn c_guquatinverse(a &GuQuaternion, d &GuQuaternion)

@[c: 'c_guQuatMtx']
fn c_guquatmtx(a &GuQuaternion, m [4]fn () F32)

@[c: 'c_guMtxIdentity']
fn c_gumtxidentity(mt [4]fn () F32)

@[c: 'c_guMtxCopy']
fn c_gumtxcopy(src [4]fn () F32, dst [4]fn () F32)

@[c: 'c_guMtxConcat']
fn c_gumtxconcat(a [4]fn () F32, b [4]fn () F32, ab [4]fn () F32)

@[c: 'c_guMtxScale']
fn c_gumtxscale(mt [4]fn () F32, xs F32, ys F32, zs F32)

@[c: 'c_guMtxScaleApply']
fn c_gumtxscaleapply(src [4]fn () F32, dst [4]fn () F32, xs F32, ys F32, zs F32)

@[c: 'c_guMtxApplyScale']
fn c_gumtxapplyscale(src [4]fn () F32, dst [4]fn () F32, xs F32, ys F32, zs F32)

@[c: 'c_guMtxTrans']
fn c_gumtxtrans(mt [4]fn () F32, xt F32, yt F32, zt F32)

@[c: 'c_guMtxTransApply']
fn c_gumtxtransapply(src [4]fn () F32, dst [4]fn () F32, xt F32, yt F32, zt F32)

@[c: 'c_guMtxApplyTrans']
fn c_gumtxapplytrans(src [4]fn () F32, dst [4]fn () F32, xt F32, yt F32, zt F32)

@[c: 'c_guMtxInverse']
fn c_gumtxinverse(src [4]fn () F32, inv [4]fn () F32) u32

@[c: 'c_guMtxInvXpose']
fn c_gumtxinvxpose(src [4]fn () F32, xpose [4]fn () F32) u32

@[c: 'c_guMtxTranspose']
fn c_gumtxtranspose(src [4]fn () F32, xpose [4]fn () F32)

@[c: 'c_guMtxRotRad']
fn c_gumtxrotrad(mt [4]fn () F32, axis i8, rad F32)

@[c: 'c_guMtxRotTrig']
fn c_gumtxrottrig(mt [4]fn () F32, axis i8, sina F32, cosa F32)

@[c: 'c_guMtxRotAxisRad']
fn c_gumtxrotaxisrad(mt [4]fn () F32, axis &GuVector, rad F32)

@[c: 'c_guMtxReflect']
fn c_gumtxreflect(m [4]fn () F32, p &GuVector, n &GuVector)

@[c: 'c_guMtxQuat']
fn c_gumtxquat(m [4]fn () F32, a &GuQuaternion)

@[c: 'guMtx44Identity']
fn gumtx44identity(mt [4]fn () F32)

@[c: 'guMtx44Copy']
fn gumtx44copy(src [4]fn () F32, dst [4]fn () F32)

@[c: 'guMtx44Inverse']
fn gumtx44inverse(src [4]fn () F32, inv [4]fn () F32) u32
