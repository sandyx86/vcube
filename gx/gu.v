@[translated]
module gx

pub struct GuVector {
	x f32
	y f32
	z f32
}

pub struct GuQuaternion {
	x f32
	y f32
	z f32
	w f32
}

@[c: 'guFrustum']
pub fn gufrustum(mt [4]fn () f32, t f32, b f32, l f32, r f32, n f32, f f32)

@[c: 'guPerspective']
pub fn guperspective(mt [4]fn () f32, fovy f32, aspect f32, n f32, f f32)

@[c: 'guOrtho']
pub fn guortho(mt [4]fn () f32, t f32, b f32, l f32, r f32, n f32, f f32)

@[c: 'guLightPerspective']
pub fn gulightperspective(mt [4]fn () f32, fovy f32, aspect f32, scales f32, scalet f32, transs f32, transt f32)

@[c: 'guLightOrtho']
pub fn gulightortho(mt [4]fn () f32, t f32, b f32, l f32, r f32, scales f32, scalet f32, transs f32, transt f32)

@[c: 'guLightFrustum']
pub fn gulightfrustum(mt [4]fn () f32, t f32, b f32, l f32, r f32, n f32, scales f32, scalet f32, transs f32, transt f32)

@[c: 'guLookAt']
pub fn gulookat(mt [4]fn () f32, campos &GuVector, camup &GuVector, target &GuVector)

@[c: 'guVecHalfAngle']
pub fn guvechalfangle(a &GuVector, b &GuVector, half &GuVector)

@[c: 'guVecAdd']
pub fn guvecadd(a &GuVector, b &GuVector, ab &GuVector)

@[c: 'guVecSub']
pub fn guvecsub(a &GuVector, b &GuVector, ab &GuVector)

@[c: 'guVecScale']
pub fn guvecscale(src &GuVector, dst &GuVector, scale f32)

@[c: 'guVecNormalize']
pub fn guvecnormalize(v &GuVector)

@[c: 'guVecMultiply']
pub fn guvecmultiply(mt [4]fn () f32, src &GuVector, dst &GuVector)

@[c: 'guVecCross']
pub fn guveccross(a &GuVector, b &GuVector, axb &GuVector)

@[c: 'guVecMultiplySR']
pub fn guvecmultiplysr(mt [4]fn () f32, src &GuVector, dst &GuVector)

@[c: 'guVecDotProduct']
pub fn guvecdotproduct(a &GuVector, b &GuVector) f32

@[c: 'guQuatAdd']
pub fn guquatadd(a &GuQuaternion, b &GuQuaternion, ab &GuQuaternion)

@[c: 'guQuatSub']
pub fn guquatsub(a &GuQuaternion, b &GuQuaternion, ab &GuQuaternion)

@[c: 'guQuatMultiply']
pub fn guquatmultiply(a &GuQuaternion, b &GuQuaternion, ab &GuQuaternion)

@[c: 'guQuatNormalize']
pub fn guquatnormalize(a &GuQuaternion, d &GuQuaternion)

@[c: 'guQuatInverse']
pub fn guquatinverse(a &GuQuaternion, d &GuQuaternion)

@[c: 'guQuatMtx']
pub fn guquatmtx(a &GuQuaternion, m [4]fn () f32)

@[c: 'guMtxIdentity']
pub fn gumtxidentity(mt [4]fn () f32)

@[c: 'guMtxCopy']
pub fn gumtxcopy(src [4]fn () f32, dst [4]fn () f32)

@[c: 'guMtxConcat']
pub fn gumtxconcat(a [4]fn () f32, b [4]fn () f32, ab [4]fn () f32)

@[c: 'guMtxScale']
pub fn gumtxscale(mt [4]fn () f32, xs f32, ys f32, zs f32)

@[c: 'guMtxScaleApply']
pub fn gumtxscaleapply(src [4]fn () f32, dst [4]fn () f32, xs f32, ys f32, zs f32)

@[c: 'guMtxApplyScale']
pub fn gumtxapplyscale(src [4]fn () f32, dst [4]fn () f32, xs f32, ys f32, zs f32)

@[c: 'guMtxTrans']
pub fn gumtxtrans(mt [4]fn () f32, xt f32, yt f32, zt f32)

@[c: 'guMtxTransApply']
pub fn gumtxtransapply(src [4]fn () f32, dst [4]fn () f32, xt f32, yt f32, zt f32)

@[c: 'guMtxApplyTrans']
pub fn gumtxapplytrans(src [4]fn () f32, dst [4]fn () f32, xt f32, yt f32, zt f32)

@[c: 'guMtxInverse']
pub fn gumtxinverse(src [4]fn () f32, inv [4]fn () f32) u32

@[c: 'guMtxInvXpose']
pub fn gumtxinvxpose(src [4]fn () f32, xpose [4]fn () f32) u32

@[c: 'guMtxTranspose']
pub fn gumtxtranspose(src [4]fn () f32, xpose [4]fn () f32)

@[c: 'guMtxRotRad']
pub fn gumtxrotrad(mt [4]fn () f32, axis i8, rad f32)

@[c: 'guMtxRotTrig']
pub fn gumtxrottrig(mt [4]fn () f32, axis i8, sina f32, cosa f32)

@[c: 'guMtxRotAxisRad']
pub fn gumtxrotaxisrad(mt [4]fn () f32, axis &GuVector, rad f32)

@[c: 'guMtxReflect']
pub fn gumtxreflect(m [4]fn () f32, p &GuVector, n &GuVector)

@[c: 'guMtxQuat']
pub fn gumtxquat(m [4]fn () f32, a &GuQuaternion)

@[c: 'guMtx44Identity']
pub fn gumtx44identity(mt [4]fn () f32)

@[c: 'guMtx44Copy']
pub fn gumtx44copy(src [4]fn () f32, dst [4]fn () f32)

@[c: 'guMtx44Inverse']
pub fn gumtx44inverse(src [4]fn () f32, inv [4]fn () f32) u32
