Shader "CardShader"
{

    Properties
    {
[Enum(None,1,Transparent,2,Additive,3,Subtract,4,Other,5)] _BlendMode("Blend Mode", Float) = 1
[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend("Src Blend Factor", Float) = 1
[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend("Dst Blend Factor", Float) = 1
[Enum(UnityEngine.Rendering.BlendOp)] _BlendOp("BlendOp", Float) = 1
[Enum(UnityEngine.Rendering.Blend)] _DstBlend("Dst Blend Mode", Float) = 1



_MainTex("Base (RGB)", 2D) = "black" { }
_Color("Hide: Color", Color) = (1,1,1,1)
[Toggle(USE_DISTORTION_MAIN)] _Main_Distortion("Distortion", Float) = 1


_FlagFront1Flash ("Hide: Flag (Front 1 Flash)", Float) = 0
_FlagFront1Distortion ("Hide: Flag (Front 1 Distortion)", Float) = 0
_FlagFront1RenderType ("Hide: Flag (Front 1 Render Type)", Float) = 0
_FlagFront1MoveType ("Hide: Flag (Front 1 Move Type)", Float) = 0
_FlagFront2Flash ("Hide: Flag (Front 2 Flash)", Float) = 0
_FlagFront2Distortion ("Hide: Flag (Front 2 Distortion)", Float) = 0
_FlagFront2RenderType ("Hide: Flag (Front 2 Render Type)", Float) = 0
_FlagFront2MoveType ("Hide: Flag (Front 2 Move Type)", Float) = 0
_FlagMiddleFlash ("Hide: Flag (Middle Flash)", Float) = 0
_FlagMiddleDistortion ("Hide: Flag (Middle Distortion)", Float) = 0
_FlagMiddleRenderType ("Hide: Flag (Middle Render Type)", Float) = 0
_FlagMiddleMoveType ("Hide: Flag (Middle Move Type)", Float) = 0
_FlagBack1Flash ("Hide: Flag (Back 1 Flash)", Float) = 0
_FlagBack1Distortion ("Hide: Flag (Back 1 Distortion)", Float) = 0
_FlagBack1RenderType ("Hide: Flag (Back 1 Render Type)", Float) = 0
_FlagBack1MoveType ("Hide: Flag (Back 1 Move Type)", Float) = 0
_FlagBack2Flash ("Hide: Flag (Back 2 Flash)", Float) = 0
_FlagBack2Distortion ("Hide: Flag (Back 2 Distortion)", Float) = 0
_FlagBack2RenderType ("Hide: Flag (Back 2 Render Type)", Float) = 0
_FlagBack2MoveType ("Hide: Flag (Back 2 Move Type)", Float) = 0
_FlagDistortionMoveType ("Hide: Flag (Distortion Move Type)", Float) = 0








[Space]
_MaskTex("Mask (RGB)", 2D) = "white" { }
[Toggle(USE_MASK)] _UseMask("UseMask", Float) = 1





[Space]
[Space] 
_Front1Color("Color", Color) = (0.5,0.5,0.5,1)
_Front1Tex("Middle (RGB)", 2D) = "black" { }
_Front1ScrollU("Move Type: Scroll U", Range(-10, 10)) = 0
_Front1ScrollV("Move Type: Scroll V", Range(-10, 10)) = 0
_Front1ScrollAngle("Move Type: Scroll Angle", Range(-180, 180)) = 0
_Front1Rotate("Move Type: Rotate", Range(-10, 10)) = 0
_Front1FlashSpeed("Flash: Speed", Range(0.1, 100)) = 1
_Front1FlashTimeOffset ("Flash: TimeOffset", Range(0, 1)) = 0
_Front1FlashMin("Flash: Min", Range(0, 0.999)) = 0
_Front1FlashMax("Flash: Max", Range(0.001, 1)) = 1
_Front1FixedRotate("Fixed Rotate", Range(-10, 10)) = 0
_Front1Spiral("Move Type: Spiral", Range(-10, 10)) = 0
[Enum(Additive, 1, Subtract, 2, Transparent, 3)] _Front1_RenderType("Render Type", Float) = 1
[Enum(Fixed, 1, Scroll, 2, Rotate, 3, Polar, 4)] _Front1_MoveType("Move Type", Float) = 1
[Toggle(USE_FRONT1)] _UseFront1("UseFront1", Float) = 1
[Toggle(USE_FRONT1_FLASH)] _Front1_Flash("Flash", Float) = 0
[Toggle(USE_FRONT1_DISTORTION)] _Front1_Distortion("Distortion", Float) = 0

[Space]
[Space]
_Front2Color("Color", Color) = (0.5,0.5,0.5,1)
_Front2Tex("Middle (RGB)", 2D) = "black" { }
_Front2ScrollU("Move Type: Scroll U", Range(-10, 10)) = 0
_Front2ScrollV("Move Type: Scroll V", Range(-10, 10)) = 0
_Front2ScrollAngle("Move Type: Scroll Angle", Range(-180, 180)) = 0
_Front2Rotate("Move Type: Rotate", Range(-10, 10)) = 0
_Front2FlashSpeed("Flash: Speed", Range(0.1, 100)) = 1
_Front2FlashTimeOffset ("Flash: TimeOffset", Range(0, 1)) = 0
_Front2FlashMin("Flash: Min", Range(0, 0.999)) = 0
_Front2FlashMax("Flash: Max", Range(0.001, 1)) = 1
_Front2FixedRotate("Fixed Rotate", Range(-10, 10)) = 0
_Front2Spiral("Move Type: Spiral", Range(-10, 10)) = 0
_Front2Spiral("Move Type: Spiral", Range(-10, 10)) = 0
[Enum(Additive, 1, Subtract, 2, Transparent, 3)] _Front2_RenderType("Render Type", Float) = 1
[Enum(Fixed, 1, Scroll, 2, Rotate, 3, Polar, 4)] _Front2_MoveType("Move Type", Float) = 1
[Toggle(USE_FRONT2)] _UseFront2("UseFront2", Float) = 1
[Toggle(USE_FRONT2_FLASH)] _Front2_Flash("Flash", Float) = 0
[Toggle(USE_FRONT2_DISTORTION)] _Front2_Distortion("Distortion", Float) = 0

[Space]
[Space]
_MiddleColor("Color", Color) = (0.5,0.5,0.5,1)
_MiddleTex("Middle (RGB)", 2D) = "black" { }
_MiddleScrollU("Move Type: Scroll U", Range(-10, 10)) = 0
_MiddleScrollV("Move Type: Scroll V", Range(-10, 10)) = 0
_MiddleScrollAngle("Move Type: Scroll Angle", Range(-180, 180)) = 0
_MiddleRotate("Move Type: Rotate", Range(-10, 10)) = 0
_MiddleFlashSpeed("Flash: Speed", Range(0.1, 100)) = 1
_MiddleFlashTimeOffset ("Flash: TimeOffset", Range(0, 1)) = 0
_MiddleFlashMin("Flash: Min", Range(0, 0.999)) = 0
_MiddleFlashMax("Flash: Max", Range(0.001, 1)) = 1
_MiddleFixedRotate("Fixed Rotate", Range(-10, 10)) = 0
_MiddleSpiral("Move Type: Spiral", Range(-10, 10)) = 0
[Enum(Additive, 1, Subtract, 2, Transparent, 3)] _Middle_RenderType("Render Type", Float) = 1
[Enum(Fixed, 1, Scroll, 2, Rotate, 3, Polar, 4)] _Middle_MoveType("Move Type", Float) = 1
[Toggle(USE_MIDDLE)] _UseMiddle("UseMiddle", Float) = 1
[Toggle(USE_MIDDLE_FLASH)] _Middle_Flash("Flash", Float) = 0
[Toggle(USE_MIDDLE_DISTORTION)] _Middle_Distortion("Distortion", Float) = 0

[Space]
[Space]
_Back1Color("Color", Color) = (0.5,0.5,0.5,1)
_Back1Tex("Middle (RGB)", 2D) = "black" { }
_Back1ScrollU("Move Type: Scroll U", Range(-10, 10)) = 0
_Back1ScrollV("Move Type: Scroll V", Range(-10, 10)) = 0
_Back1ScrollAngle("Move Type: Scroll Angle", Range(-180, 180)) = 0
_Back1Rotate("Move Type: Rotate", Range(-10, 10)) = 0
_Back1FlashSpeed("Flash: Speed", Range(0.1, 100)) = 1
_Back1FlashTimeOffset ("Flash: TimeOffset", Range(0, 1)) = 0
_Back1FlashMin("Flash: Min", Range(0, 0.999)) = 0
_Back1FlashMax("Flash: Max", Range(0.001, 1)) = 1
_Back1FixedRotate("Fixed Rotate", Range(-10, 10)) = 0
_Back1Spiral("Move Type: Spiral", Range(-10, 10)) = 0
[Enum(Additive, 1, Subtract, 2, Transparent, 3)] _Back1_RenderType("Render Type", Float) = 1
[Enum(Fixed, 1, Scroll, 2, Rotate, 3, Polar, 4)] _Back1_MoveType("Move Type", Float) = 1
[Toggle(USE_BACK1)] _UseBack1("UseBack1", Float) = 1
[Toggle(USE_BACK1_FLASH)] _Back1_Flash("Flash", Float) = 0
[Toggle(USE_BACK1_DISTORTION)] _Back1_Distortion("Distortion", Float) = 0

[Space]
[Space]
_Back2Color("Color", Color) = (0.5,0.5,0.5,1)
_Back2Tex("Middle (RGB)", 2D) = "black" { }
_Back2ScrollU("Move Type: Scroll U", Range(-10, 10)) = 0
_Back2ScrollV("Move Type: Scroll V", Range(-10, 10)) = 0
_Back2ScrollAngle("Move Type: Scroll Angle", Range(-180, 180)) = 0
_Back2Rotate("Move Type: Rotate", Range(-10, 10)) = 0
_Back2FlashSpeed("Flash: Speed", Range(0.1, 100)) = 1
_Back2FlashTimeOffset ("Flash: TimeOffset", Range(0, 1)) = 0
_Back2FlashMin("Flash: Min", Range(0, 0.999)) = 0
_Back2FlashMax("Flash: Max", Range(0.001, 1)) = 1
_Back2FixedRotate("Fixed Rotate", Range(-10, 10)) = 0
_Back2Spiral("Move Type: Spiral", Range(-10, 10)) = 0
[Enum(Additive, 1, Subtract, 2, Transparent, 3)] _Back2_RenderType("Render Type", Float) = 1
[Enum(Fixed, 1, Scroll, 2, Rotate, 3, Polar, 4)] _Back2_MoveType("Move Type", Float) = 1
[Toggle(USE_BACK2)] _UseBack2("UseBack2", Float) = 1
[Toggle(USE_BACK2_FLASH)] _Back2_Flash("Flash", Float) = 0
[Toggle(USE_BACK2_DISTORTION)] _Back2_Distortion("Distortion", Float) = 0

[Space]
[Space]
_DistortionTex("Texture (RGB)", 2D) = "black" { }
_DistortionScrollU("Move Type: Scroll U", Range(-10, 10)) = 0
_DistortionScrollV("Move Type: Scroll V", Range(-10, 10)) = 0
_DistortionScrollAngle("Move Type: Scroll Angle", Range(-180, 180)) = 0
_DistortionIntensityU("Distortion: Intensity U", Range(-1, 1)) = 0
_DistortionIntensityV("Distortion: Intensity V", Range(-1, 1)) = 0
_DistortionRotate ("Move Type: Rotate", Range(-10, 10)) = 0
_DistortionSpiral ("Move Type: Spiral", Range(-10, 10)) = 0
_DistortionFlashSpeed ("Flash: Speed", Range(0.1, 100)) = 1
_DistortionFlashMin ("Flash: Min", Range(0, 0.999)) = 0
_DistortionFlashMax ("Flash: Max", Range(0.001, 1)) = 1
[Toggle(USE_DISTORTION)] _UseDistortion("UseDistortion", Float) = 1
    }




        Category{
Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
                            BlendOp[_BlendOp]
                Blend[_SrcBlend][_DstBlend]

        SubShader
{

Pass {

                         CGPROGRAM
                         #pragma vertex vert
                         #pragma fragment frag
                         #pragma target 3.0

                         #pragma shader_feature_local _BLENDMODE_ADDITIVE

                         #pragma shader_feature_local USE_DISTORTION_MAIN
                         #pragma shader_feature_local USE_MASK

                         #pragma shader_feature_local USE_FRONT1
                         #pragma shader_feature_local USE_FRONT1_FLASH
                         #pragma shader_feature_local USE_FRONT1_DISTORTION
                         #pragma shader_feature_local _FRONT1_MOVETYPE_FIXED _FRONT1_MOVETYPE_SCROLL _FRONT1_MOVETYPE_ROTATE _FRONT1_MOVETYPE_POLAR
                         #pragma shader_feature_local _FRONT1_RENDERTYPE_ADDITIVE _FRONT1_RENDERTYPE_SUBSTRACT _FRONT1_RENDERTYPE_TRANSPARENT

                         #pragma shader_feature_local USE_FRONT2
                         #pragma shader_feature_local USE_FRONT2_FLASH
                         #pragma shader_feature_local USE_FRONT2_DISTORTION
                         #pragma shader_feature_local _FRONT2_MOVETYPE_FIXED _FRONT2_MOVETYPE_SCROLL _FRONT2_MOVETYPE_ROTATE _FRONT2_MOVETYPE_POLAR
                         #pragma shader_feature_local _FRONT2_RENDERTYPE_ADDITIVE _FRONT2_RENDERTYPE_SUBSTRACT _FRONT2_RENDERTYPE_TRANSPARENT

                         #pragma shader_feature_local USE_MIDDLE
                         #pragma shader_feature_local USE_MIDDLE_FLASH
                         #pragma shader_feature_local USE_MIDDLE_DISTORTION
                         #pragma shader_feature_local _MIDDLE_MOVETYPE_FIXED _MIDDLE_MOVETYPE_SCROLL _MIDDLE_MOVETYPE_ROTATE _MIDDLE_MOVETYPE_POLAR
                         #pragma shader_feature_local _MIDDLE_RENDERTYPE_ADDITIVE _MIDDLE_RENDERTYPE_SUBSTRACT _MIDDLE_RENDERTYPE_TRANSPARENT

                         #pragma shader_feature_local USE_BACK1
                         #pragma shader_feature_local USE_BACK1_FLASH
                         #pragma shader_feature_local USE_BACK1_DISTORTION
                         #pragma shader_feature_local _BACK1_MOVETYPE_FIXED _BACK1_MOVETYPE_SCROLL _BACK1_MOVETYPE_ROTATE _BACK1_MOVETYPE_POLAR
                         #pragma shader_feature_local _BACK1_RENDERTYPE_ADDITIVE _BACK1_RENDERTYPE_SUBSTRACT _BACK1_RENDERTYPE_TRANSPARENT



                         #pragma shader_feature_local USE_BACK2
                         #pragma shader_feature_local USE_BACK2_FLASH
                         #pragma shader_feature_local USE_BACK2_DISTORTION
                         #pragma shader_feature_local _BACK2_MOVETYPE_FIXED _BACK2_MOVETYPE_SCROLL _BACK2_MOVETYPE_ROTATE _BACK2_MOVETYPE_POLAR
                         #pragma shader_feature_local _BACK2_RENDERTYPE_ADDITIVE _BACK2_RENDERTYPE_SUBSTRACT _BACK2_RENDERTYPE_TRANSPARENT

                         #pragma shader_feature_local USE_DISTORTION
                         #pragma shader_feature_local USE_DISTORTION_FLASH
                         #pragma shader_feature_local _DISTORTION_MOVETYPE_FIXED _DISTORTION_MOVETYPE_SCROLL _DISTORTION_MOVETYPE_ROTATE _DISTORTION_MOVETYPE_POLAR
         



                         //#pragma multi_compile_particles
                         //#pragma multi_compile_fog

                         #include "UnityCG.cginc"

                         sampler2D _MainTex;
                         float4 _MainTex_ST;
                         float4 _Color;
                         sampler2D _MaskTex;

#ifdef USE_DISTORTION_MAIN
                         float _Main_Distortion;
#endif

                         //front1层

#ifdef USE_FRONT1
                         sampler2D _Front1Tex;
                         float4 _Front1Tex_ST;
                         float4 _Front1Color;
                         float _Front1ScrollU;
                         float _Front1ScrollV;
                         float _Front1ScrollAngle;
                         float _Front1Rotate;
                         float _Front1FlashSpeed;
                         float _Front1FlashTimeOffset;
                         float _Front1FlashMin;
                         float _Front1FlashMax;
                         float _Front1FixedRotate;
                         float _Front1Spiral;
                         float _Front1_RenderType;
                         float _Front1_MoveType;
                         //float _Front1_Flash;
                         //float _Front1_Distortion;
#endif
#ifdef USE_FRONT2
                         //front2层
                         sampler2D _Front2Tex;
                         float4 _Front2Tex_ST;
                         float4 _Front2Color;
                         float _Front2ScrollU;
                         float _Front2ScrollV;
                         float _Front2ScrollAngle;
                         float _Front2Rotate;
                         float _Front2FlashSpeed;
                         float _Front2FlashTimeOffset;
                         float _Front2FlashMin;
                         float _Front2FlashMax;
                         float _Front2FixedRotate;
                         float _Front2Spiral;
                         float _Front2_RenderType;
                         float _Front2_MoveType;
                         //float _Front2_Flash;
                         //float _Front2_Distortion;
#endif
#ifdef USE_MIDDLE
                         //Mid层
                         sampler2D _MiddleTex;
                         float4 _MiddleTex_ST;
                         float4 _MiddleColor;
                         float _MiddleScrollU;
                         float _MiddleScrollV;
                         float _MiddleScrollAngle;
                         float _MiddleRotate;
                         float _MiddleFlashSpeed;
                         float _MiddleFlashTimeOffset;
                         float _MiddleFlashMin;
                         float _MiddleFlashMax;
                         float _MiddleFixedRotate;
                         float _MiddleSpiral;
                         float _Middle_RenderType;
                         float _Middle_MoveType;
                         //float _Middle_Flash;
                         //float _Middle_Distortion;
#endif
#ifdef USE_BACK1
                         //back1层
                         sampler2D _Back1Tex;
                         float4 _Back1Tex_ST;
                         float4 _Back1Color;
                         float _Back1ScrollU;
                         float _Back1ScrollV;
                         float _Back1ScrollAngle;
                         float _Back1Rotate;
                         float _Back1FlashSpeed;
                         float _Back1FlashTimeOffset;
                         float _Back1FlashMin;
                         float _Back1FlashMax;
                         float _Back1FixedRotate;
                         float _Back1Spiral;
                         float _Back1_RenderType;
                         float _Back1_MoveType;
                         //float _Back1_Flash;
                         //float _Back1_Distortion;
#endif
#ifdef USE_BACK2
                         //back2层
                         sampler2D _Back2Tex;
                         float4 _Back2Tex_ST;
                         float4 _Back2Color;
                         float _Back2ScrollU;
                         float _Back2ScrollV;
                         float _Back2ScrollAngle;
                         float _Back2Rotate;
                         float _Back2FlashSpeed;
                         float _Back2FlashTimeOffset;
                         float _Back2FlashMin;
                         float _Back2FlashMax;
                         float _Back2FixedRotate;
                         float _Back2Spiral;
                         float _Back2_RenderType;
                         float _Back2_MoveType;
                         //float _Back2_Flash;
                         //float _Back2_Distortion;
#endif
#ifdef USE_DISTORTION
                         sampler2D _DistortionTex;
                         float4 _DistortionTex_ST;
                         float _UseDistortion;

                         float _DistortionScrollU;
                         float _DistortionScrollV;
                         float _DistortionScrollAngle;
                         float _DistortionFlashSpeed;
                         float _DistortionFlashMin;
                         float _DistortionFlashMax;
                         float _DistortionSpiral;

                         float _DistortionIntensityU;
                         float _DistortionIntensityV;
#endif

                         struct appdata_t {
                             float4 vertex : POSITION;
                             fixed4 color : COLOR;
                             float4 texcoord: TEXCOORD0;
                             UNITY_VERTEX_INPUT_INSTANCE_ID
                         };


                         struct v2f {
                             float4 vertex : SV_POSITION;
                             float2 texcoord_main : TEXCOORD0;
#ifdef USE_FRONT1
                             float4 texcoord_front1 : TEXCOORD1;
#endif
#ifdef USE_FRONT2
                             float4 texcoord_front2 : TEXCOORD2;
#endif
#ifdef USE_MIDDLE
                             float4 texcoord_middle : TEXCOORD3;
#endif
#ifdef USE_BACK1
                             float4 texcoord_back1 : TEXCOORD4;
#endif
#ifdef USE_BACK2
                             float4 texcoord_back2 : TEXCOORD5;
#endif
#ifdef USE_DISTORTION
                             float4 texcoord_distortion : TEXCOORD6;
#endif
                             //fixed4 tex_flash_alpha0 : COLOR0;//f1 f2 m b1
                             //fixed4 tex_flash_alpha1 : COLOR1;//b2 _ _ _
                             
                             //float4 front1tex_alpha:COLOR0;
                             //float4 front2tex_alpha:COLOR1;
                             //float4 midtex_alpha:COLOR2;
                             //float4 back1tex_alpha:COLOR3;
                             //float4 back2tex_alpha:COLOR4;
                             UNITY_VERTEX_OUTPUT_STEREO
                         };



                         //根据输入的参数对子纹理的uv进行处理
                         float2 scrollTex(float4 targetTexST,float2 mainTexcoord, float degree, float scrollU,float scrollV,float rotateSpeed)
                         {
                             ////float2 pivot = float2(0.5, 0.5);         //中心点
                             //float distortionScrollAngle = radians(_DistortionScrollAngle);
                             //float cosAngle = cos(distortionScrollAngle);
                             //float sinAngle = sin(distortionScrollAngle);
                             //float2x2 rot = float2x2(cosAngle, -sinAngle, sinAngle, cosAngle);  //确定以z轴旋转

                             //o.texcoord_distortion = TRANSFORM_TEX(o.texcoord_main, _DistortionTex);

                             //o.texcoord_distortion = mul(rot, o.texcoord_distortion) + frac(float2(_DistortionScrollU, _DistortionScrollV) * -_Time.y);
                             ////o.texcoord_distortion += pivot;





                             float distortionScrollAngle = radians(degree + 90 * rotateSpeed * _Time.y);
                             float cosAngle = cos(distortionScrollAngle);
                             float sinAngle = sin(distortionScrollAngle);
                             float2x2 rot = float2x2(cosAngle, -sinAngle, sinAngle, cosAngle);  //确定以z轴旋转



                             float2 _out = mainTexcoord * targetTexST.xy + targetTexST.zw;
                             _out = mul(rot, _out) + frac(float2(scrollU, scrollV) * -_Time.y);

                             return _out;
                         }
                         float2 rotateTex(float4 targetTexST, float2 mainTexcoord, float rotateSpeed)
                         {
                         //影之诗是先tiling运算后，再在中心旋转
                             float Angle = (rotateSpeed * _Time.y);
                             float cosAngle = cos(Angle);
                             float sinAngle = sin(Angle);
                             float2x2 rot = float2x2(cosAngle, -sinAngle, sinAngle, cosAngle);  //确定以z轴旋转


                             float2 _out = (mainTexcoord-0.5) * targetTexST.xy  + targetTexST.zw;
                             _out = mul(rot, _out) + 0.5 * targetTexST.xy;
                             return _out;





                             //这里是以0.5，0.5做tiling offset运算,感觉这个合理
    //float Angle = (rotateSpeed * _Time.y);
    //float cosAngle = cos(Angle);
    //float sinAngle = sin(Angle);
    //float2x2 rot = float2x2(cosAngle, -sinAngle, sinAngle, cosAngle);  //确定以z轴旋转


    //float2 _out = (mainTexcoord - 0.5) * targetTexST.xy + 0.5 + targetTexST.zw;
    //_out = mul(rot, _out-0.5)+0.5;
    //return _out; 


                         }
                         float2 Polar(float2 UV,float Spiral)
                         {

                             

                             float2 uv = UV - 0.5;
                             float distance = length(uv);

                             //float thetaOffset = distance * k * 6.2831853;
                             //...影之诗shader ui中数据被除了2pi的原因可能就是这里..
                             float thetaOffset = distance * Spiral;
                              
                             float angle = atan2(uv.x, uv.y) * 0.1591549431;//1/2pi


    
                             float2 result = float2(distance, angle - thetaOffset);

                              return result;


                              //float2 uv = UV - centerPoint;
                              //float distance = length(uv);
                              //  float angle = atan2(uv.x, uv.y)/ 6.2831853;//2pi
                              // float2 result = (distance, angle + 0.5);

                              // return result;


                          }
                          float2 scrollTex_Polar(float4 targetTexST, float2 texcoord, float degree, float scrollU, float scrollV,float Spiral)
                          {
                              //以0.5,0.5为中心进行缩放，即计算出某个点，那个点在进行tiling和offest处理后的坐标值等于texcoord参数
                              //float2 uv = texcoord* targetTexST.xy+ targetTexST.zw;

                              //为了与影之诗原shader数据同步，这里对数据除以2PI，我也不知道为什么除2派

                              float4 _targetTexST = targetTexST * 0.1591549431;//  0.1591549431=1/2pi
                              float2 uv = (texcoord - 0.5) * _targetTexST.xy + 0.5 + _targetTexST.zw;



                              //计算极坐标
                              float2 _out = Polar(uv, Spiral) + frac(float2(scrollV, scrollU) * -_Time.y);


                              //_out += targetTexST.zw;

                              return _out;
                          }


                          //根据输入的Flash参数对子纹理的透明度进行处理
                          float flashToAlpha(float flashSpeed,float flashMin,float flashMax,float flashTimeOffset)
                          {
                              //我的实现
                              //float curInput = 0.5 * (sin(-(_Time.y+flashTimeOffset) * flashSpeed) + 1);
                              //if (curInput < flashMin)
                              //{
                              //    return 1;
                              //}
                              //if (curInput > flashMax)
                              //{
                              //    return 0;
                              //}
                              //if (flashMax == flashMin)
                              //{
                              //    return 0;
                              //}
                              ////return 0.5*(cos(3.1415927*(flashMax- curInput)/(flashMax- flashMin))+1);
                              //return 0.5 * (cos(3.1415927 * (curInput - flashMin) / (flashMax - flashMin)) + 1);









                              //CY实现
                                float u_xlat0 = (_Time.y+flashTimeOffset) * flashSpeed;
                                u_xlat0 = sin(u_xlat0);
    u_xlat0 = u_xlat0 + 1.0;
    u_xlat0 = u_xlat0 * 0.5;

    //此时u_xlat0为移动到0~1区间的正弦图像
   
    float2 u_xlat16_2;
    u_xlat16_2.x = (-flashMin) + flashMax;

    int u_xlati12 = int((0.0<u_xlat16_2.x) ? -1 : 0);
    int u_xlati24 = int((u_xlat16_2.x<0.0) ? -1 : 0);
    u_xlat16_2.x = ceil(u_xlat16_2.x);//取整到0或1
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;//Max>Min的话为0 否则为1




    u_xlati12 = (-u_xlati12) + u_xlati24;//Max>Min的话为1 否则为-1
    


    float u_xlat16_14 = float(u_xlati12);//Max>Min的话为1 否则为-1
    u_xlat0 = u_xlat0 * u_xlat16_14 + u_xlat16_2.x;//如果Max<=Min的话  就把正弦图像翻转一下  范围仍然是0~1
    

    u_xlat0 = (-u_xlat0) + 1.0;//翻转正弦图像   //CY程序员你是否还清醒..



    float2 u_xlat16_26 = (-float2(flashMin, flashMax)) + float2(1.0, 1.0);//把flash Min Max的数值翻转一下，存储进变量中
    
    
    
    u_xlat16_2.xy = u_xlat16_26.xy * u_xlat16_14 + u_xlat16_2.xx;
    //如果Max>Min的话u_xlat16_2.xy存储翻转后的Min Max    即(1-Min,1-Max)
    //否则，u_xlat16_2.xy存储(Min, Max)   CY你到底在绕啥..
    
    
    
    u_xlat16_14 = (-u_xlat16_2.y) + 1.0;//Max>Min时  存储Max   否侧存储1-Max
    

    u_xlat16_2.x = float(1.0) / u_xlat16_2.x;//Max>Min时  存储1/(1-Min)   否侧存储1/Min



    u_xlat16_14 = float(1.0) / u_xlat16_14;//Max>Min时 存储1/Max  否则存储1/Min

    
    //在计算前  Max>Min时u_xlat0是翻转后的正弦图像，否则无翻转
    u_xlat0 = (-u_xlat0) * u_xlat16_14 + 1.0;
    u_xlat0 = u_xlat16_2.x * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    //Max>Min时 u_xlat0 为(1+(0.5sin(t) -0.5)/Max)/(1-Min)    有点抽象，可以把0.5sin(t) -0.5视为-X
    //能画出一条直线，交x=0于(0, 1/(1-min)) 点上   交y=0于(Max,0)点上， X区间为[0,1]
    //当y超出1或者小于0时，会被限制进0~1范围里，
    //其中，该直线交y=1于(Max*Min,1)上,交y=0于(Max,0)上
    //即当正弦图像（转移到0~1区间的正弦）扫过小于Max*Min的位置时， 结果值为1；
    //扫过大于Max的位置时结果为0
    //中间则为正弦渐变过程
    //虽然有渐变过程，但是在数值从0和1开始变化的时候并不是绝对平滑（导数不为0）
    //我觉得不如我写的（

    bool u_xlatb12 = flashSpeed!=0.0;
    float result=(u_xlatb12) ? u_xlat0 : 0.0;

    return result;













                              //float curInput = 0.5 * (sin(_Time.y * flashSpeed) + 1);

                              //u_xlat24.x = _Time.y * _Back1FlashSpeed;
                              //u_xlat24.x = sin(u_xlat24.x);
                              //u_xlat24.x = u_xlat24.x + 1.0;
                              //u_xlat24.x = u_xlat24.x * 0.5;
                              //u_xlat16_2.x = (-_Back1FlashMin) + _Back1FlashMax;
                              //u_xlati36 = int((0.0 < u_xlat16_2.x) ? -1 : 0);
                              //u_xlati1 = int((u_xlat16_2.x < 0.0) ? -1 : 0);
                              //u_xlat16_2.x = ceil(u_xlat16_2.x);
                              //u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
                              //u_xlati36 = (-u_xlati36) + u_xlati1;
                              //u_xlat16_14 = float(u_xlati36);
                              //u_xlat24.x = u_xlat24.x * u_xlat16_14 + u_xlat16_2.x;
                              //u_xlat24.x = (-u_xlat24.x) + 1.0;
                              //u_xlat16_26.xy = (-vec2(_Back1FlashMin, _Back1FlashMax)) + vec2(1.0, 1.0);
                              //u_xlat16_2.xy = u_xlat16_26.xy * vec2(u_xlat16_14) + u_xlat16_2.xx;
                              //u_xlat16_14 = (-u_xlat16_2.y) + 1.0;
                              //u_xlat16_2.x = float(1.0) / u_xlat16_2.x;
                              //u_xlat16_14 = float(1.0) / u_xlat16_14;
                              //u_xlat24.x = (-u_xlat24.x) * u_xlat16_14 + 1.0;
                              //u_xlat24.x = u_xlat16_2.x * u_xlat24.x;
                              //u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
                              //u_xlatb36 = _Back1FlashSpeed != 0.0;
                              //vs_TEXCOORD1.z = (u_xlatb36) ? u_xlat24.x : 0.0;
                          }

                          //计算扰动、

                          float2 distortionByColor(float4 distortionTexColor, float2 texcoord)
                          {
#ifdef USE_DISTORTION
                              //先取扰动方向  -0.5表示正负均有扰动，然后加上原有的uv值得到扰动后的uv坐标
                              fixed2 uvnew = distortionTexColor.rg - 0.5;

                              uvnew.xy *= float2(_DistortionIntensityU, _DistortionIntensityV);
                              uvnew += texcoord;
                              return uvnew;
#else
                              return texcoord;
#endif
                          }


                          //合成各个图层
                          //BLENDTEX宏定义 BLENDTEX(FRONT1,colFront1,colordest);
#if 1
#ifdef USE_FRONT1
#ifdef _FRONT1_RENDERTYPE_ADDITIVE 
#define _BLENDTEX_FRONT1(colorSrc,colorDest) colorDest=blendTex_Add(colorSrc,colorDest)
#endif
#ifdef _FRONT1_RENDERTYPE_SUBSTRACT 
#define _BLENDTEX_FRONT1(colorSrc,colorDest) colorDest=blendTex_Sub(colorSrc,colorDest)
#endif
#ifdef _FRONT1_RENDERTYPE_TRANSPARENT 
#define _BLENDTEX_FRONT1(colorSrc,colorDest) colorDest=blendTex_Tra(colorSrc,colorDest)
#endif
#else
#define _BLENDTEX_FRONT1(colorSrc,colorDest) 
#endif

#ifdef USE_FRONT2
#ifdef _FRONT2_RENDERTYPE_ADDITIVE 
#define _BLENDTEX_FRONT2(colorSrc,colorDest) colorDest=blendTex_Add(colorSrc,colorDest)
#endif
#ifdef _FRONT2_RENDERTYPE_SUBSTRACT 
#define _BLENDTEX_FRONT2(colorSrc,colorDest) colorDest=blendTex_Sub(colorSrc,colorDest)
#endif
#ifdef _FRONT2_RENDERTYPE_TRANSPARENT  
#define _BLENDTEX_FRONT2(colorSrc,colorDest) colorDest=blendTex_Tra(colorSrc,colorDest)
#endif
#else
#define _BLENDTEX_FRONT2(colorSrc,colorDest)
#endif


#ifdef USE_MIDDLE
#ifdef _MIDDLE_RENDERTYPE_ADDITIVE 
#define _BLENDTEX_MIDDLE(colorSrc,colorDest) colorDest=blendTex_Add(colorSrc,colorDest)
#endif
#ifdef _MIDDLE_RENDERTYPE_SUBSTRACT 
#define _BLENDTEX_MIDDLE(colorSrc,colorDest) colorDest=blendTex_Sub(colorSrc,colorDest)
#endif
#ifdef _MIDDLE_RENDERTYPE_TRANSPARENT  
#define _BLENDTEX_MIDDLE(colorSrc,colorDest) colorDest=blendTex_Tra(colorSrc,colorDest)
#endif
#else
#define _BLENDTEX_MIDDLE(colorSrc,colorDest)
#endif


#ifdef USE_BACK1
#ifdef _BACK1_RENDERTYPE_ADDITIVE 
#define _BLENDTEX_BACK1(colorSrc,colorDest) colorDest=blendTex_Add(colorSrc,colorDest)
#endif
#ifdef _BACK1_RENDERTYPE_SUBSTRACT 
#define _BLENDTEX_BACK1(colorSrc,colorDest) colorDest=blendTex_Sub(colorSrc,colorDest)
#endif
#ifdef _BACK1_RENDERTYPE_TRANSPARENT 
#define _BLENDTEX_BACK1(colorSrc,colorDest) colorDest=blendTex_Tra(colorSrc,colorDest)
#endif
#else
#define _BLENDTEX_BACK1(colorSrc,colorDest)
#endif

#ifdef USE_BACK2
#ifdef _BACK2_RENDERTYPE_ADDITIVE 
#define _BLENDTEX_BACK2(colorSrc,colorDest) colorDest=blendTex_Add(colorSrc,colorDest)
#endif
#ifdef _BACK2_RENDERTYPE_SUBSTRACT 
#define _BLENDTEX_BACK2(colorSrc,colorDest) colorDest=blendTex_Sub(colorSrc,colorDest)
#endif
#ifdef _BACK2_RENDERTYPE_TRANSPARENT 
#define _BLENDTEX_BACK2(colorSrc,colorDest) colorDest=blendTex_Tra(colorSrc,colorDest)
#endif
#else 
#define _BLENDTEX_BACK2(colorSrc,colorDest)
#endif

#define BLENDTEX(X,colorSrc,colorDest) _BLENDTEX_##X(colorSrc,colorDest)

#endif

                          float4 blendTex_Add(float4 colorSrc, float4 colorDest)
                          {
//#ifdef _BLENDMODE_ADDITIVE
//                              return colorSrc * colorSrc.a + colorDest;
//
//#else
                              return /*2 * */colorSrc * colorSrc.a + colorDest;
//#endif
                          }
                          float4 blendTex_Sub(float4 colorSrc, float4 colorDest)
                          {
                              float4 col1 = colorSrc - colorDest;
                              col1.a = colorDest.a;
                              return col1;
                          }
                          float4 blendTex_Tra(float4 colorSrc, float4 colorDest)
                          {
                              //透明
                              float4 col2 = colorDest * (1 - colorSrc.a);
                              float4 col1 = colorSrc * colorSrc.a;
                              return col1 + col2;
                          }

                          //float4 blendTex(float mode, float4 colorSrc, float4 colorDest)
                          //{
                          //    if (mode == 1)
                          //    {
                          //        //加法
                          //        //float4 col2 = colorDest * (1 - colorSrc.a);
                          //        //float4 col1 = colorSrc * colorSrc.a;
                          //        return 2 * colorSrc * colorSrc.a + colorDest;
                          //    }
                          //    if (mode == 2)
                          //    {
                          //        //减法
                          //        float4 col1 = colorSrc - colorDest;
                          //        col1.a = colorDest.a;
                          //        return col1;
                          //    }
                          //    if (mode == 3)
                          //    {
                          //        //透明
                          //        float4 col2 = colorDest * (1 - colorSrc.a);
                          //        float4 col1 = colorSrc * colorSrc.a;
                          //        return col1 + col2;
                          //    }
                          //    return colorDest;
                          //}

                          v2f vert(appdata_t v)
                          {
                              v2f o;
                              UNITY_SETUP_INSTANCE_ID(v);
                              UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
                              o.vertex = UnityObjectToClipPos(v.vertex);
                              o.texcoord_main = TRANSFORM_TEX(v.texcoord.xy,_MainTex);





#ifdef USE_BACK1
//#ifndef _BACK1_MOVETYPE_POLAR
//
//
//    o.texcoord_back1.xy = scrollTex(_Back1Tex_ST, o.texcoord_main, _Back1ScrollAngle, _Back1ScrollU, _Back1ScrollV, _Back1Rotate);
//#endif
#ifdef _BACK1_MOVETYPE_FIXED
                              o.texcoord_back1.xy = scrollTex(_Back1Tex_ST, o.texcoord_main, degrees(-_Back1FixedRotate), 0, 0, 0);
#endif
#ifdef _BACK1_MOVETYPE_SCROLL
    o.texcoord_back1.xy = scrollTex(_Back1Tex_ST, o.texcoord_main, _Back1ScrollAngle, _Back1ScrollU, _Back1ScrollV,0 /*_Back1Rotate*/);
#endif
#ifdef _BACK1_MOVETYPE_ROTATE
    o.texcoord_back1.xy = rotateTex(_Back1Tex_ST, o.texcoord_main, _Back1Rotate);
#endif
#endif

#ifdef USE_BACK2
#ifdef _BACK2_MOVETYPE_FIXED
    o.texcoord_back2.xy = scrollTex(_Back2Tex_ST, o.texcoord_main, degrees(-_Back2FixedRotate), 0, 0, 0);
#endif
#ifdef _BACK2_MOVETYPE_SCROLL
    o.texcoord_back2.xy = scrollTex(_Back2Tex_ST, o.texcoord_main, _Back2ScrollAngle, _Back2ScrollU, _Back2ScrollV, 0);
#endif
#ifdef _BACK2_MOVETYPE_ROTATE
    o.texcoord_back2.xy = rotateTex(_Back2Tex_ST, o.texcoord_main, _Back2Rotate);
#endif
#endif



#ifdef USE_MIDDLE
#ifdef _MIDDLE_MOVETYPE_FIXED
    o.texcoord_middle.xy = scrollTex(_MiddleTex_ST, o.texcoord_main, degrees(-_MiddleFixedRotate), 0, 0, 0);
#endif
#ifdef _MIDDLE_MOVETYPE_SCROLL
    o.texcoord_middle.xy = scrollTex(_MiddleTex_ST, o.texcoord_main, _MiddleScrollAngle, _MiddleScrollU, _MiddleScrollV, 0);
#endif
#ifdef _MIDDLE_MOVETYPE_ROTATE
    o.texcoord_middle.xy = rotateTex(_MiddleTex_ST, o.texcoord_main, _MiddleRotate);
#endif
#endif


#ifdef USE_FRONT1
#ifdef _FRONT1_MOVETYPE_FIXED
    o.texcoord_front1.xy = scrollTex(_Front1Tex_ST, o.texcoord_main, degrees(-_Front1FixedRotate), 0, 0, 0);
#endif
#ifdef _FRONT1_MOVETYPE_SCROLL
    o.texcoord_front1.xy = scrollTex(_Front1Tex_ST, o.texcoord_main, _Front1ScrollAngle, _Front1ScrollU, _Front1ScrollV, 0);
#endif
#ifdef _FRONT1_MOVETYPE_ROTATE
    o.texcoord_front1.xy = rotateTex(_Front1Tex_ST, o.texcoord_main, _Front1Rotate);
#endif
#endif

#ifdef USE_FRONT2
#ifdef _FRONT1_MOVETYPE_FIXED
    o.texcoord_front2.xy = scrollTex(_Front2Tex_ST, o.texcoord_main, degrees(-_Front2FixedRotate), 0, 0, 0);
#endif
#ifdef _FRONT2_MOVETYPE_SCROLL
    o.texcoord_front2.xy = scrollTex(_Front2Tex_ST, o.texcoord_main, _Front2ScrollAngle, _Front2ScrollU, _Front2ScrollV, 0);
#endif
#ifdef _FRONT2_MOVETYPE_ROTATE
    o.texcoord_front2.xy = rotateTex(_Front2Tex_ST, o.texcoord_main, _Front2Rotate);
#endif
#endif


                              //if (_Back1_MoveType != 4)
                              //{
                              //    o.texcoord_back1 = scrollTex(_Back1Tex_ST, o.texcoord_main, _Back1ScrollAngle, _Back1ScrollU, _Back1ScrollV, _Back2Rotate);
                              //}
                              //if (_Back2_MoveType != 4)
                              //{
                              //    o.texcoord_back2 = scrollTex(_Back2Tex_ST, o.texcoord_main, _Back2ScrollAngle, _Back2ScrollU, _Back2ScrollV, _Back2Rotate);
                              //}
                              //if (_Middle_MoveType != 4)
                              //{
                              //    o.texcoord_middle = scrollTex(_MiddleTex_ST, o.texcoord_main, _MiddleScrollAngle, _MiddleScrollU, _MiddleScrollV, _MiddleRotate);
                              //}
                              //if (_Front1_MoveType != 4)
                              //{
                              //    o.texcoord_front1 = scrollTex(_Front1Tex_ST, o.texcoord_main, _Front1ScrollAngle, _Front1ScrollU, _Front1ScrollV, _Front1Rotate);
                              //}
                              //if (_Front2_MoveType != 4)
                              //{
                              //    o.texcoord_front2 = scrollTex(_Front2Tex_ST, o.texcoord_main, _Front2ScrollAngle, _Front2ScrollU, _Front2ScrollV, _Front2Rotate);
                              //}



#ifdef USE_DISTORTION

#ifdef _DISTORTION_MOVETYPE_SCROLL
    o.texcoord_distortion.xy = scrollTex(_DistortionTex_ST, o.texcoord_main, _DistortionScrollAngle, _DistortionScrollU, _DistortionScrollV,0);
#endif
#ifdef _DISTORTION_MOVETYPE_ROTATE
    o.texcoord_distortion.xy = rotateTex(_DistortionTex_ST, o.texcoord_main, _DistortionRotate);
#endif
#endif



                              //处理flash
#if 1
#if defined (USE_FRONT1)&& defined (USE_FRONT1_FLASH)
                              o.texcoord_front1.z = flashToAlpha(_Front1FlashSpeed, _Front1FlashMin, _Front1FlashMax,_Front1FlashTimeOffset);
#endif
#if defined (USE_FRONT2)&& defined (USE_FRONT2_FLASH)
                              o.texcoord_front2.z =flashToAlpha(_Front2FlashSpeed, _Front2FlashMin, _Front2FlashMax,_Front2FlashTimeOffset);
#endif
#if defined (USE_MIDDLE)&& defined (USE_MIDDLE_FLASH)
                              o.texcoord_middle.z =flashToAlpha(_MiddleFlashSpeed, _MiddleFlashMin, _MiddleFlashMax,_MiddleFlashTimeOffset);
#endif
#if defined (USE_BACK1)&& defined (USE_BACK1_FLASH)
                              o.texcoord_back1.z = flashToAlpha(_Back1FlashSpeed, _Back1FlashMin, _Back1FlashMax,_Back1FlashTimeOffset);
#endif
#if defined (USE_BACK2)&& defined (USE_BACK2_FLASH)
                              o.texcoord_back2.z = flashToAlpha(_Back2FlashSpeed, _Back2FlashMin, _Back2FlashMax,_Back2FlashTimeOffset);
#endif
#if defined (USE_DISTORTION)&& defined (USE_DISTORTION_FLASH)
                              o.texcoord_distortion.z = flashToAlpha(_DistortionFlashSpeed, _DistortionFlashMin, _DistortionFlashMax,0);
#endif
#endif







                              return o;
                          }


                          fixed4 frag(v2f i) : SV_Target
                          {


                              fixed4 colMain = tex2D(_MainTex, i.texcoord_main.xy);
                              fixed4 colMask = tex2D(_MaskTex, i.texcoord_main.xy);


                              //极坐标
                              {
                                  //if (_Front1_MoveType == 4)
                                  //{
                                  //    i.texcoord_front1 = scrollTex_Polar(_Front1Tex_ST, i.texcoord_main.xy, _Front1ScrollAngle, _Front1ScrollU, _Front1ScrollV, _Front1Spiral);
                                  //}
                                  //if (_Front2_MoveType == 4)
                                  //{
                                  //    i.texcoord_front2 = scrollTex_Polar(_Front2Tex_ST, i.texcoord_main.xy, _Front2ScrollAngle, _Front2ScrollU, _Front2ScrollV, _Front2Spiral);
                                  //}
                                  //if (_Middle_MoveType == 4)
                                  //{
                                  //    i.texcoord_middle = scrollTex_Polar(_MiddleTex_ST, i.texcoord_main.xy, _MiddleScrollAngle, _MiddleScrollU, _MiddleScrollV, _MiddleSpiral);
                                  //}
                                  //if (_Back1_MoveType == 4)
                                  //{
                                  //    i.texcoord_back1 = scrollTex_Polar(_Back1Tex_ST, i.texcoord_main.xy, _Back1ScrollAngle, _Back1ScrollU, _Back1ScrollV, _Back1Spiral);
                                  //}
                                  //if (_Back2_MoveType == 4)
                                  //{
                                  //    i.texcoord_back2 = scrollTex_Polar(_Back2Tex_ST, i.texcoord_main.xy, _Back2ScrollAngle, _Back2ScrollU, _Back2ScrollV, _Back2Spiral);
                                  //}
#if defined (USE_FRONT1)&& defined (_FRONT1_MOVETYPE_POLAR)
                                  i.texcoord_front1.xy = scrollTex_Polar(_Front1Tex_ST, i.texcoord_main.xy, _Front1ScrollAngle, _Front1ScrollU, _Front1ScrollV, _Front1Spiral);
#endif 
#if defined (USE_FRONT2)&& defined (_FRONT2_MOVETYPE_POLAR)
                                  i.texcoord_front2.xy = scrollTex_Polar(_Front2Tex_ST, i.texcoord_main.xy, _Front2ScrollAngle, _Front2ScrollU, _Front2ScrollV, _Front2Spiral);
#endif                            
#if defined (USE_MIDDLE)&& defined (_MIDDLE_MOVETYPE_POLAR)
                                  i.texcoord_middle.xy = scrollTex_Polar(_MiddleTex_ST, i.texcoord_main.xy, _MiddleScrollAngle, _MiddleScrollU, _MiddleScrollV, _MiddleSpiral);
#endif      
#if defined (USE_BACK1)&& defined (_BACK1_MOVETYPE_POLAR)
                                  i.texcoord_back1.xy = scrollTex_Polar(_Back1Tex_ST, i.texcoord_main.xy, _Back1ScrollAngle, _Back1ScrollU, _Back1ScrollV, _Back1Spiral);
#endif      
#if defined (USE_BACK2)&& defined (_BACK2_MOVETYPE_POLAR)
                                  i.texcoord_back2.xy = scrollTex_Polar(_Back2Tex_ST, i.texcoord_main.xy, _Back2ScrollAngle, _Back2ScrollU, _Back2ScrollV, _Back2Spiral);
#endif      
#if defined (USE_DISTORTION)&& defined (_DISTORTION_MOVETYPE_POLAR)
                                  i.texcoord_distortion.xy = scrollTex_Polar(_DistortionTex_ST, i.texcoord_main.xy, _DistortionScrollAngle, _DistortionScrollU, _DistortionScrollV, _DistortionSpiral);
#endif      





                              }



                              //计算扰动
#ifdef USE_DISTORTION
                              fixed2 colDistortion = tex2D(_DistortionTex, i.texcoord_distortion).xy;
                              colDistortion = (colDistortion - 0.5) * colMask.b;
                              colDistortion.xy *= float2(_DistortionIntensityU, _DistortionIntensityV);

#if defined (USE_DISTORTION_FLASH)
                              colDistortion.xy *=i.texcoord_front1.z;//flash
#endif
                              //计算扰动
#ifdef USE_DISTORTION_MAIN
                              i.texcoord_main.xy += colDistortion;
#endif
                              //i.texcoord_main.xy += colDistortion;
#if defined (USE_FRONT1)&& defined (USE_FRONT1_DISTORTION)
                             i.texcoord_front1.xy += colDistortion * _Front1Tex_ST.xy;
#endif
#if defined (USE_FRONT2)&& defined (USE_FRONT2_DISTORTION)
                             i.texcoord_front2.xy += colDistortion * _Front2Tex_ST.xy;
#endif 
#if defined (USE_MIDDLE)&& defined (USE_MIDDLE_DISTORTION)
                             i.texcoord_middle.xy += colDistortion * _MiddleTex_ST.xy;
#endif
#if defined (USE_BACK1)&& defined (USE_BACK1_DISTORTION)
                              i.texcoord_back1.xy += colDistortion * _Back1Tex_ST.xy;
#endif
#if defined (USE_BACK2)&& defined (USE_BACK2_DISTORTION)
                             i.texcoord_back2.xy += colDistortion * _Back2Tex_ST.xy;
#endif

#endif  //USE_DISTORTION



                              //颜色采样
#if 1               
#ifdef USE_FRONT1
                                  fixed4 colFront1 = tex2D(_Front1Tex, i.texcoord_front1.xy) * _Front1Color*float4(2,2,2,1);
#endif
#ifdef USE_FRONT2
                                  fixed4 colFront2 = tex2D(_Front2Tex, i.texcoord_front2.xy) * _Front2Color * float4(2, 2, 2, 1);
#endif
#ifdef USE_MIDDLE
                                  fixed4 colMiddle = tex2D(_MiddleTex, i.texcoord_middle.xy) * _MiddleColor * float4(2, 2, 2, 1);
#endif
#ifdef USE_BACK1
                                  fixed4 colBack1 = tex2D(_Back1Tex, i.texcoord_back1.xy) * _Back1Color * float4(2, 2, 2, 1);
#endif
#ifdef USE_BACK2
                                  fixed4 colBack2 = tex2D(_Back2Tex, i.texcoord_back2.xy) * _Back2Color * float4(2, 2, 2, 1);
#endif
#endif                  


                                  //应用flash
#if 1
#if defined (USE_FRONT1)&& defined (USE_FRONT1_FLASH)
                               colFront1.a *= i.texcoord_front1.z;
#endif
#if defined (USE_FRONT2)&& defined (USE_FRONT2_FLASH)
                               colFront2.a *= i.texcoord_front2.z;
#endif
#if defined (USE_MIDDLE)&& defined (USE_MIDDLE_FLASH)
                               colMiddle.a *= i.texcoord_middle.z;
#endif
#if defined (USE_BACK1)&& defined (USE_BACK1_FLASH)
                               colBack1.a *= i.texcoord_back1.z;
#endif
#if defined (USE_BACK2)&& defined (USE_BACK2_FLASH)
                               colBack2.a *= i.texcoord_back2.z;
#endif
#endif



                              //应用遮罩
#ifdef USE_MASK
#if defined (USE_FRONT1)
                              colFront1.a *=colMask.r;
#endif
#if defined (USE_FRONT2)
                              colFront2.a *=  colMask.r;
#endif
#if defined (USE_MIDDLE)
                              colMiddle.a *= colMask.a;
#endif
#if defined (USE_BACK1)
                              colBack1.a *= colMask.g;
#endif
#if defined (USE_BACK2)
                              colBack2.a *=colMask.g;
#endif
#endif //USE_MASK




                              //混合颜色


#ifdef _BLENDMODE_ADDITIVE
                              float4 result = float4(0, 0, 0, 1);
                              result=blendTex_Add(tex2D(_MainTex, i.texcoord_main),result);
#else
                              float4 result = tex2D(_MainTex, i.texcoord_main);
#endif


                              


                              BLENDTEX(BACK1, colBack1, result);
                              BLENDTEX(BACK2, colBack2, result);
                              BLENDTEX(MIDDLE, colMiddle, result);
                              BLENDTEX(FRONT1, colFront1, result);
                              BLENDTEX(FRONT2, colFront2, result);
                              //result = blendTex(_Back1_RenderType, colBack1, result);
                              //result = blendTex(_Back2_RenderType, colBack2, result);
                              //result = blendTex(_Middle_RenderType, colMiddle, result);
                              //result = blendTex(_Front1_RenderType, colFront1, result);
                              //result = blendTex(_Front2_RenderType, colFront2, result);


//#ifdef _BLENDMODE_ADDITIVE
                              //return float4(1,0,0,1);
//                              return 2 * result * _Color;
//#else
                              //return float4(i.texcoord_main,1,1);
                              return result * _Color;
//#endif
                          }
                          ENDCG
                  }
           }
    //FallBack "Diffuse"
}


CustomEditor "_CardShaderCustomMaterialEditor"

}
