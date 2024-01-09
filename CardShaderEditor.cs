using UnityEngine;
using UnityEditor;
using System;
using System.Diagnostics;
using static _CardShaderCustomMaterialEditor;

public class _CardShaderCustomMaterialEditor : ShaderGUI
{
    //private SerializedProperty maintex;
    //private SerializedProperty maintex_color;
    //private SerializedProperty b_maintex_distortion;

    string EditorVersion = "EditorVer 0.4";




    BLEND_TYPE_MAT _BlendMode = BLEND_TYPE_MAT.Transparent;
    UnityEngine.Rendering.BlendMode _SrcBlend;
    UnityEngine.Rendering.BlendMode _DstBlend;
    UnityEngine.Rendering.BlendOp _BlendOp;

    private bool _FirstFrame = true;
    private bool _Main_Distortion = true;
    private bool _UseMask = true;
    private bool _UseFront1 = true;
    private bool _Front1_Flash = false;
    private bool _Front1_Distortion = false;
    private bool _UseFront2 = true;
    private bool _Front2_Flash = false;
    private bool _Front2_Distortion = true;
    private bool _UseMiddle = false;
    private bool _Middle_Flash = false;
    private bool _Middle_Distortion = false;
    private bool _UseBack1 = true;
    private bool _Back1_Flash = true;
    private bool _Back1_Distortion = false;
    private bool _UseBack2 = true;
    private bool _Back2_Flash = true;
    private bool _Back2_Distortion = false;



    private bool _Distortion_Flash = false;
    private bool _UseDistortion = true;

    private RENDER_TYPE _Front1_RenderType = RENDER_TYPE.Additive;
    private MOVE_TYPE _Front1_MoveType = MOVE_TYPE.Fixed;
    private RENDER_TYPE _Front2_RenderType = RENDER_TYPE.Additive;
    private MOVE_TYPE _Front2_MoveType = MOVE_TYPE.Fixed;
    private RENDER_TYPE _Middle_RenderType = RENDER_TYPE.Additive;
    private MOVE_TYPE _Middle_MoveType = MOVE_TYPE.Fixed;
    private RENDER_TYPE _Back1_RenderType = RENDER_TYPE.Additive;
    private MOVE_TYPE _Back1_MoveType = MOVE_TYPE.Fixed;
    private RENDER_TYPE _Back2_RenderType = RENDER_TYPE.Additive;
    private MOVE_TYPE _Back2_MoveType = MOVE_TYPE.Fixed;
    private MOVE_TYPE _Distortion_MoveType = MOVE_TYPE.Scroll;


    private void ResetUIDataInFirstFrame(ref MaterialEditor materialEditor, ref MaterialProperty[] properties)
    {





        //启用时设置部分数据
        if (!_FirstFrame)
        {
            return;
        }
        _FirstFrame = false;
        Material targetMat = materialEditor.target as Material;

        _BlendMode = (BLEND_TYPE_MAT)targetMat.GetFloat("_BlendMode");
        _SrcBlend = (UnityEngine.Rendering.BlendMode)targetMat.GetFloat("_SrcBlend");
        _DstBlend = (UnityEngine.Rendering.BlendMode)targetMat.GetFloat("_DstBlend");
        _BlendOp = (UnityEngine.Rendering.BlendOp)targetMat.GetFloat("_BlendOp");







        _Main_Distortion = Array.IndexOf(targetMat.shaderKeywords, "USE_DISTORTION_MAIN") != -1;
        _UseMask = Array.IndexOf(targetMat.shaderKeywords, "USE_MASK") != -1;
        _UseFront1 = Array.IndexOf(targetMat.shaderKeywords, "USE_FRONT1") != -1;
        _Front1_Flash = Array.IndexOf(targetMat.shaderKeywords, "USE_FRONT1_FLASH") != -1;
        _Front1_Distortion = Array.IndexOf(targetMat.shaderKeywords, "USE_FRONT1_DISTORTION") != -1;

        _UseFront2 = Array.IndexOf(targetMat.shaderKeywords, "USE_FRONT2") != -1;
        _Front2_Flash = Array.IndexOf(targetMat.shaderKeywords, "USE_FRONT2_FLASH") != -1;
        _Front2_Distortion = Array.IndexOf(targetMat.shaderKeywords, "USE_FRONT2_DISTORTION") != -1;

        _UseMiddle = Array.IndexOf(targetMat.shaderKeywords, "USE_MIDDLE") != -1;
        _Middle_Flash = Array.IndexOf(targetMat.shaderKeywords, "USE_MIDDLE_FLASH") != -1;
        _Middle_Distortion = Array.IndexOf(targetMat.shaderKeywords, "USE_MIDDLE_DISTORTION") != -1;

        _UseBack1 = Array.IndexOf(targetMat.shaderKeywords, "USE_BACK1") != -1;
        _Back1_Flash = Array.IndexOf(targetMat.shaderKeywords, "USE_BACK1_FLASH") != -1;
        _Back1_Distortion = Array.IndexOf(targetMat.shaderKeywords, "USE_BACK1_DISTORTION") != -1;

        _UseBack2 = Array.IndexOf(targetMat.shaderKeywords, "USE_BACK2") != -1;
        _Back2_Flash = Array.IndexOf(targetMat.shaderKeywords, "USE_BACK2_FLASH") != -1;
        _Back2_Distortion = Array.IndexOf(targetMat.shaderKeywords, "USE_BACK2_DISTORTION") != -1;


        _UseDistortion = Array.IndexOf(targetMat.shaderKeywords, "USE_DISTORTION") != -1;
        _Front1_RenderType = (RENDER_TYPE)targetMat.GetFloat("_Front1_RenderType");
        _Front1_MoveType = (MOVE_TYPE)targetMat.GetFloat("_Front1_MoveType");
        _Front2_RenderType = (RENDER_TYPE)targetMat.GetFloat("_Front2_RenderType");
        _Front2_MoveType = (MOVE_TYPE)targetMat.GetFloat("_Front2_MoveType");
        _Middle_RenderType = (RENDER_TYPE)targetMat.GetFloat("_Middle_RenderType");
        _Middle_MoveType = (MOVE_TYPE)targetMat.GetFloat("_Middle_MoveType");
        _Back1_RenderType = (RENDER_TYPE)targetMat.GetFloat("_Back1_RenderType");
        _Back1_MoveType = (MOVE_TYPE)targetMat.GetFloat("_Back1_MoveType");
        _Back2_RenderType = (RENDER_TYPE)targetMat.GetFloat("_Back2_RenderType");
        _Back2_MoveType = (MOVE_TYPE)targetMat.GetFloat("_Back2_MoveType");



        //UnityEngine.Debug.Log(FindProperty("_Front1_MoveType", properties).floatValue);
        //UnityEngine.Debug.Log(_Front1_MoveType);

        ResetKeyword(ref materialEditor,ref properties);


        return;
    }
    public enum LAYERS
    {
        FRONT1 = 1, FRONT2, MIDDLE , BACK1, BACK2    
    }

    public enum BLEND_TYPE_MAT
    {
        None=1,
        Transparent,
        Additive,
        Subtract,
        Other
    }

    public enum RENDER_TYPE
    {
        Additive=1,
        Subtract=2,
        Transparent=3
    }
    public enum MOVE_TYPE
    {
        Fixed = 1, Scroll, Rotate, Polar
    }

    public void SetLayerKeyWord(LAYERS layer, MOVE_TYPE movetype)
    {




    }

    //name: "Front1"

    //绘制每个特效层的GUI
    private void SubTexGUI(ref MaterialEditor materialEditor, ref MaterialProperty[] properties,string name,ref RENDER_TYPE _RenderType, ref MOVE_TYPE _MoveType
        , ref bool _Use, ref bool _Flash, ref bool _Distortion)
    {



        Material targetMat = materialEditor.target as Material;

        string NAME = name.ToUpper();





        MaterialProperty _Front1Tex = FindProperty("_"+ name+"Tex", properties, true);
        materialEditor.TextureProperty(_Front1Tex, name);
        MaterialProperty _Color = FindProperty("_" + name + "Color", properties, true);
        materialEditor.ColorProperty(_Color, "Color");


        if (_Front1Tex.textureValue)
        {

            if(Array.IndexOf(targetMat.shaderKeywords, "USE_" + NAME) == -1)
            {

                targetMat.EnableKeyword("USE_" + NAME);

            }


            //if (_Use == false)
            //{
            //    _Use = true;
            //    targetMat.EnableKeyword("USE_"+ NAME);
            //}

            //选择渲染类型
            RENDER_TYPE rendertype = (RENDER_TYPE)EditorGUILayout.EnumPopup("Render Type", _RenderType);
            if (_RenderType != rendertype)
            {
                _RenderType = rendertype;
                targetMat.DisableKeyword("_"+ NAME+"_RENDERTYPE_ADDITIVE");
                targetMat.DisableKeyword("_" + NAME + "_RENDERTYPE_SUBSTRACT");
                targetMat.DisableKeyword("_" + NAME + "_RENDERTYPE_TRANSPARENT");

                targetMat.SetFloat("_" + name + "_RenderType", ((float)_RenderType));
                switch (_RenderType)
                {
                    case RENDER_TYPE.Additive:
                        targetMat.EnableKeyword("_" + NAME + "_RENDERTYPE_ADDITIVE");
                        //UnityEngine.Debug.Log("_" + NAME + "_RENDERTYPE_ADDITIVE");
                        break;
                    case RENDER_TYPE.Subtract:
                        targetMat.EnableKeyword("_" + NAME + "_RENDERTYPE_SUBSTRACT");
                        break;
                    case RENDER_TYPE.Transparent:
                        targetMat.EnableKeyword("_" + NAME + "_RENDERTYPE_TRANSPARENT");
                        break;
                }
            }


            //选择运动类型
            MOVE_TYPE movetype = (MOVE_TYPE)EditorGUILayout.EnumPopup("Move Type", _MoveType);
            if (_MoveType != movetype)
            {
                _MoveType = movetype;
                targetMat.DisableKeyword("_" + NAME + "_MOVETYPE_FIXED");
                targetMat.DisableKeyword("_" + NAME + "_MOVETYPE_SCROLL");
                targetMat.DisableKeyword("_" + NAME + "_MOVETYPE_ROTATE");
                targetMat.DisableKeyword("_" + NAME + "_MOVETYPE_POLAR");

                targetMat.SetFloat("_" + name + "_MoveType", ((float)_MoveType));
                switch (_MoveType)
                {

                    case MOVE_TYPE.Fixed:
                        targetMat.EnableKeyword("_" + NAME + "_MOVETYPE_FIXED");
                        break;
                    case MOVE_TYPE.Scroll:
                        targetMat.EnableKeyword("_" + NAME + "_MOVETYPE_SCROLL");
                        break;
                    case MOVE_TYPE.Rotate:
                        targetMat.EnableKeyword("_" + NAME + "_MOVETYPE_ROTATE");
                        break;
                    case MOVE_TYPE.Polar:
                        targetMat.EnableKeyword("_" + NAME + "_MOVETYPE_POLAR");
                        break;
                }
            }

            //其他选项  Flash和Distortion
            if (_Flash != EditorGUILayout.Toggle("Flash", Array.IndexOf(targetMat.shaderKeywords, "USE_" + NAME + "_FLASH") != -1))
            {
                _Flash = !_Flash;
                if (_Flash)
                    targetMat.EnableKeyword("USE_" + NAME + "_FLASH");
                else
                    targetMat.DisableKeyword("USE_" + NAME + "_FLASH");
            }
            if (_Distortion != EditorGUILayout.Toggle("Distortion", Array.IndexOf(targetMat.shaderKeywords, "USE_"+NAME+"_DISTORTION") != -1))
            {
                _Distortion = !_Distortion;
                if (_Distortion)
                    targetMat.EnableKeyword("USE_" + NAME + "_DISTORTION");
                else
                    targetMat.DisableKeyword("USE_" + NAME + "_DISTORTION");
            }



            EditorGUILayout.Space(8);

            //根据运动类型绘制对应控件
            switch (_MoveType)
            {

                case MOVE_TYPE.Fixed:
                    MaterialProperty _Front1FixedRotate = FindProperty("_"+name+"FixedRotate", properties, true);
                    materialEditor.RangeProperty(_Front1FixedRotate, "Fixed Rotate");
                    break;
                case MOVE_TYPE.Scroll:
                    {
                        MaterialProperty _Front1ScrollU = FindProperty("_" + name + "ScrollU", properties, true);
                        MaterialProperty _Front1ScrollV = FindProperty("_" + name + "ScrollV", properties, true);
                        MaterialProperty _Front1ScrollAngle = FindProperty("_" + name + "ScrollAngle", properties, true);
                        materialEditor.RangeProperty(_Front1ScrollU, "Scroll U");
                        materialEditor.RangeProperty(_Front1ScrollV, "Scroll V"); 
                        materialEditor.RangeProperty(_Front1ScrollAngle, "Scroll Angle");
                    }
                    break;
                case MOVE_TYPE.Rotate:
                    MaterialProperty _Front1Rotate = FindProperty("_" + name + "Rotate", properties, true);
                    materialEditor.RangeProperty(_Front1Rotate, "Rotate");
                    break;
                case MOVE_TYPE.Polar:
                    {
                        MaterialProperty _Front1ScrollU = FindProperty("_" + name + "ScrollU", properties, true);
                        MaterialProperty _Front1ScrollV = FindProperty("_" + name + "ScrollV", properties, true);
                        MaterialProperty _Front1Spiral = FindProperty("_" + name + "Spiral", properties, true);
                        materialEditor.RangeProperty(_Front1ScrollU, "Scroll U");
                        materialEditor.RangeProperty(_Front1ScrollV, "Scroll V");
                        materialEditor.RangeProperty(_Front1Spiral, "Spiral");



                        {
                            //string path = AssetDatabase.GetAssetPath(_Front1Tex.textureValue);
                            //UnityEngine.Debug.Log(_Front1Tex.textureValue.mipmapCount);
                            if (_Front1Tex.textureValue.mipmapCount >1)
                            {
                                EditorGUILayout.LabelField("如果图片出现了接缝，不要勾选'Generate Mipmap'");
                            }
                        }
                    }


                    break;
            }

            //如果设置了flash绘制相关控件
            if (_Flash)
            {
                MaterialProperty FlashSpeed = FindProperty("_" + name + "FlashSpeed", properties, true);
                MaterialProperty FlashMin = FindProperty("_" + name + "FlashMin", properties, true);
                MaterialProperty FlashMax = FindProperty("_" + name + "FlashMax", properties, true);
                MaterialProperty FlashTimeOffset = FindProperty("_" + name + "FlashTimeOffset", properties, true);
                materialEditor.RangeProperty(FlashSpeed, "Flash Speed");
                materialEditor.RangeProperty(FlashMin, "Flash Min");
                materialEditor.RangeProperty(FlashMax, "Flash Max");
                materialEditor.RangeProperty(FlashTimeOffset, "Flash Time Offset");




            }





            //_Front1_Flash.
            //USE_" + NAME + "_FLASH

                //materialEditor.pr



        }
        else
        {
            //if (_Use == true)
            //{
            //    _Use = false;
            //    targetMat.DisableKeyword("USE_"+NAME);
            //}


            if (Array.IndexOf(targetMat.shaderKeywords, "USE_" + NAME) != -1)
            {

                targetMat.DisableKeyword("USE_" + NAME);

            }

        }



    }



    //绘制扰动纹理的GUI
    private void DistortionGUI(ref MaterialEditor materialEditor, ref MaterialProperty[] properties, ref MOVE_TYPE _MoveType ,ref bool _Flash)
    {
        Material targetMat = materialEditor.target as Material;
        MaterialProperty _DistortionTex = FindProperty("_DistortionTex", properties, true);
        materialEditor.TextureProperty(_DistortionTex, "Distortion");
        MaterialProperty _DistortionScrollU = FindProperty("_DistortionScrollU", properties, true);
        MaterialProperty _DistortionScrollV = FindProperty("_DistortionScrollV", properties, true);
        MaterialProperty _DistortionScrollAngle = FindProperty("_DistortionScrollAngle", properties, true);
        MaterialProperty _DistortionIntensityU = FindProperty("_DistortionIntensityU", properties, true);
        MaterialProperty _DistortionIntensityV = FindProperty("_DistortionIntensityV", properties, true);
        materialEditor.RangeProperty(_DistortionScrollU, "Scroll U");
        materialEditor.RangeProperty(_DistortionScrollV, "Scroll V");
        materialEditor.RangeProperty(_DistortionScrollAngle, "Scroll Angle");
        materialEditor.RangeProperty(_DistortionIntensityU, "Intensity U");
        materialEditor.RangeProperty(_DistortionIntensityV, "Intensity V");



        if (_UseDistortion != EditorGUILayout.Toggle("UseDistortion", Array.IndexOf(targetMat.shaderKeywords, "USE_DISTORTION") != -1))
        {
            _UseDistortion = !_UseDistortion;
            if (_UseDistortion)
                targetMat.EnableKeyword("USE_DISTORTION");
            else
                targetMat.DisableKeyword("USE_DISTORTION");
        }












        if (_DistortionTex.textureValue)
        {

            //if (Array.IndexOf(targetMat.shaderKeywords, "USE_" + NAME) == -1)
            //{
            //    targetMat.EnableKeyword("USE_" + NAME);
            //}




            //选择运动类型
            MOVE_TYPE movetype = (MOVE_TYPE)EditorGUILayout.EnumPopup("Move Type", _MoveType);
            if (_MoveType != movetype)
            {
                _MoveType = movetype;
                targetMat.DisableKeyword("_DISTORTION_MOVETYPE_FIXED");
                targetMat.DisableKeyword("_DISTORTION_MOVETYPE_SCROLL");
                targetMat.DisableKeyword("_DISTORTION_MOVETYPE_ROTATE");
                targetMat.DisableKeyword("_DISTORTION_MOVETYPE_POLAR");

                targetMat.SetFloat("_Distortion_MoveType", ((float)_MoveType));
                switch (_MoveType)
                {

                    case MOVE_TYPE.Fixed:
                        targetMat.EnableKeyword("_DISTORTION_MOVETYPE_FIXED");
                        break;
                    case MOVE_TYPE.Scroll:
                        targetMat.EnableKeyword("_DISTORTION_MOVETYPE_SCROLL");
                        break;
                    case MOVE_TYPE.Rotate:
                        targetMat.EnableKeyword("_DISTORTION_MOVETYPE_ROTATE");
                        break;
                    case MOVE_TYPE.Polar:
                        targetMat.EnableKeyword("_DISTORTION_MOVETYPE_POLAR");
                        break;
                }
            }

            //其他选项  Flash和Distortion
            if (_Flash != EditorGUILayout.Toggle("Flash", Array.IndexOf(targetMat.shaderKeywords, "USE_DISTORTION_FLASH") != -1))
            {
                _Flash = !_Flash;
                if (_Flash)
                    targetMat.EnableKeyword("USE_DISTORTION_FLASH");
                else
                    targetMat.DisableKeyword("USE_DISTORTION_FLASH");
            }



            EditorGUILayout.Space(8);

            //根据运动类型绘制对应控件
            switch (_MoveType)
            {

                case MOVE_TYPE.Fixed:
                    MaterialProperty _Front1FixedRotate = FindProperty("_DistortionFixedRotate", properties, true);
                    materialEditor.RangeProperty(_Front1FixedRotate, "Fixed Rotate");
                    break;
                case MOVE_TYPE.Scroll:
                    {
                        MaterialProperty _Front1ScrollU = FindProperty("_DistortionScrollU", properties, true);
                        MaterialProperty _Front1ScrollV = FindProperty("_DistortionScrollV", properties, true);
                        MaterialProperty _Front1ScrollAngle = FindProperty("_DistortionScrollAngle", properties, true);
                        materialEditor.RangeProperty(_Front1ScrollU, "Scroll U");
                        materialEditor.RangeProperty(_Front1ScrollV, "Scroll V");
                        materialEditor.RangeProperty(_Front1ScrollAngle, "Scroll Angle");
                    }
                    break;
                case MOVE_TYPE.Rotate:
                    MaterialProperty _Front1Rotate = FindProperty("_DistortionRotate", properties, true);
                    materialEditor.RangeProperty(_Front1Rotate, "Rotate");
                    break;
                case MOVE_TYPE.Polar:
                    {
                        MaterialProperty _Front1ScrollU = FindProperty("_DistortionScrollU", properties, true);
                        MaterialProperty _Front1ScrollV = FindProperty("_DistortionScrollV", properties, true);
                        MaterialProperty _Front1Spiral = FindProperty("_DistortionSpiral", properties, true);
                        materialEditor.RangeProperty(_Front1ScrollU, "Scroll U");
                        materialEditor.RangeProperty(_Front1ScrollV, "Scroll V");
                        materialEditor.RangeProperty(_Front1Spiral, "Spiral");
                    }

                    break;
            }

            //如果设置了flash绘制相关控件
            if (_Flash)
            {
                MaterialProperty FlashSpeed = FindProperty("_DistortionFlashSpeed", properties, true);
                MaterialProperty FlashMin = FindProperty("_DistortionFlashMin", properties, true);
                MaterialProperty FlashMax = FindProperty("_DistortionFlashMax", properties, true);
                materialEditor.RangeProperty(FlashSpeed, "Flash Speed");
                materialEditor.RangeProperty(FlashMin, "Flash Min");
                materialEditor.RangeProperty(FlashMax, "Flash Max");

            }







        }
        else
        {



            //if (Array.IndexOf(targetMat.shaderKeywords, "USE_" + NAME) != -1)
            //{
            //    targetMat.DisableKeyword("USE_" + NAME);
            //}

        }



    }


    private void ResetKeyword(ref MaterialEditor materialEditor, ref MaterialProperty[] properties)
    {
        Material targetMat = materialEditor.target as Material;


        switch (_BlendMode)
        {
            case BLEND_TYPE_MAT.None:
                targetMat.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.One);
                targetMat.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.Zero);
                targetMat.SetFloat("_BlendOp", (float)UnityEngine.Rendering.BlendOp.Add);
                break;
            case BLEND_TYPE_MAT.Transparent:
                targetMat.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.SrcAlpha);
                targetMat.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
                targetMat.SetFloat("_BlendOp", (float)UnityEngine.Rendering.BlendOp.Add);
                break;
            case BLEND_TYPE_MAT.Additive:
                targetMat.EnableKeyword("_BLENDMODE_ADDITIVE");
                targetMat.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.SrcAlpha);
                targetMat.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.One);
                targetMat.SetFloat("_BlendOp", (float)UnityEngine.Rendering.BlendOp.Add);
                break;
            case BLEND_TYPE_MAT.Subtract:
                targetMat.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.One);
                targetMat.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.One);
                targetMat.SetFloat("_BlendOp", (float)UnityEngine.Rendering.BlendOp.Subtract);
                break;
            case BLEND_TYPE_MAT.Other:
                targetMat.SetFloat("_SrcBlend", (float)_SrcBlend);
                targetMat.SetFloat("_DstBlend", (float)_DstBlend);
                targetMat.SetFloat("_BlendOp", (float)_BlendOp);
                break;
        }





        if (_Main_Distortion) targetMat.EnableKeyword("USE_DISTORTION_MAIN"); else targetMat.DisableKeyword("USE_DISTORTION_MAIN");
        if (_UseMask) targetMat.EnableKeyword("USE_MASK"); else targetMat.DisableKeyword("USE_MASK");
        ResetKeywordForEffectUsage(ref targetMat, ref properties, "Front1", _UseFront1, _Front1_Flash, _Front1_Distortion);
        ResetKeywordForEffectUsage(ref targetMat, ref properties, "Front2", _UseFront2, _Front2_Flash, _Front2_Distortion);
        ResetKeywordForEffectUsage(ref targetMat, ref properties, "Middle", _UseMiddle, _Middle_Flash, _Middle_Distortion);
        ResetKeywordForEffectUsage(ref targetMat, ref properties, "Back1", _UseBack1, _Back1_Flash, _Back1_Distortion);
        ResetKeywordForEffectUsage(ref targetMat, ref properties, "Back2", _UseBack2, _Back2_Flash, _Back2_Distortion);
        if (_Front1_Flash || _Front2_Flash || _Middle_Flash) targetMat.EnableKeyword("USE_FRONT_1_2_FLASH"); else targetMat.DisableKeyword("USE_FRONT_1_2_FLASH");
        if (_Middle_Flash) targetMat.EnableKeyword("USE_MIDDLE_FLASH"); else targetMat.DisableKeyword("USE_MIDDLE_FLASH");
        if (_Back1_Flash || _Back2_Flash) targetMat.EnableKeyword("USE_BACK_1_2_FLASH"); else targetMat.DisableKeyword("USE_BACK_1_2_FLASH");
        if (_Distortion_Flash) targetMat.EnableKeyword("USE_DOSTORTION_FLASH"); else targetMat.DisableKeyword("USE_DOSTORTION_FLASH");

        if (_Front1_Distortion || _Front2_Distortion || _Back1_Distortion || _Back2_Distortion)
            targetMat.EnableKeyword("USE_FRONT_BACK_1_2_DISTORTION");
        else
            targetMat.DisableKeyword("USE_FRONT_BACK_1_2_DISTORTION");




        if (_UseDistortion) targetMat.EnableKeyword("USE_DISTORTION"); else targetMat.DisableKeyword("USE_DISTORTION");

        ResetKeywordForRTandMT(ref targetMat, ref properties, _Front1_RenderType, _Front1_MoveType, "FRONT1");
        ResetKeywordForRTandMT(ref targetMat, ref properties, _Front2_RenderType, _Front2_MoveType, "FRONT2");
        ResetKeywordForRTandMT(ref targetMat, ref properties, _Middle_RenderType, _Middle_MoveType, "MIDDLE");
        ResetKeywordForRTandMT(ref targetMat, ref properties, _Back1_RenderType, _Back1_MoveType, "BACK1");
        ResetKeywordForRTandMT(ref targetMat, ref properties, _Back2_RenderType, _Back2_MoveType, "BACK2");



        {
            targetMat.DisableKeyword("_DISTORTION_MOVETYPE_FIXED");
            targetMat.DisableKeyword("_DISTORTION_MOVETYPE_SCROLL");
            targetMat.DisableKeyword("_DISTORTION_MOVETYPE_ROTATE");
            targetMat.DisableKeyword("_DISTORTION_MOVETYPE_POLAR");
            switch (_Distortion_MoveType)
            {
                case MOVE_TYPE.Fixed:
                    targetMat.EnableKeyword("_DISTORTION_MOVETYPE_FIXED");
                    _SetFloatValue(ref properties, "_FlagDistortionMoveType", -1);
                    break;
                case MOVE_TYPE.Scroll:
                    targetMat.EnableKeyword("_DISTORTION_MOVETYPE_SCROLL");
                    _SetFloatValue(ref properties, "_FlagDistortionMoveType", 0);
                    break;
                case MOVE_TYPE.Rotate:
                    targetMat.EnableKeyword("_DISTORTION_MOVETYPE_ROTATE");
                    _SetFloatValue(ref properties, "_FlagDistortionMoveType", 1);
                    break;
                case MOVE_TYPE.Polar:
                    targetMat.EnableKeyword("_DISTORTION_MOVETYPE_POLAR");
                    _SetFloatValue(ref properties, "_FlagDistortionMoveType", 2);
                    break;
            }
        }


        if (_BlendMode == BLEND_TYPE_MAT.Additive) targetMat.EnableKeyword("_BLENDMODE_ADDITIVE"); else targetMat.DisableKeyword("_BLENDMODE_ADDITIVE");




    }



    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        materialEditor.SetDefaultGUIWidths();


        Material targetMat = materialEditor.target as Material;

        

        ResetUIDataInFirstFrame(ref materialEditor, ref properties);


        //混合模式
        {

            BLEND_TYPE_MAT blendMode = (BLEND_TYPE_MAT)EditorGUILayout.EnumPopup("Blend Mode", _BlendMode);
            if (_BlendMode != blendMode)
            {
                _BlendMode = blendMode;
                targetMat.SetFloat("_BlendMode", ((float)_BlendMode));
                targetMat.DisableKeyword("_BLENDMODE_ADDITIVE");
                switch (_BlendMode)
                {
                    case BLEND_TYPE_MAT.None:
                        targetMat.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.One);
                        targetMat.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.Zero);
                        targetMat.SetFloat("_BlendOp", (float)UnityEngine.Rendering.BlendOp.Add);
                        break;
                    case BLEND_TYPE_MAT.Transparent:
                        targetMat.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.SrcAlpha);
                        targetMat.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
                        targetMat.SetFloat("_BlendOp", (float)UnityEngine.Rendering.BlendOp.Add);
                        break;
                    case BLEND_TYPE_MAT.Additive:
                        targetMat.EnableKeyword("_BLENDMODE_ADDITIVE");
                        targetMat.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.SrcAlpha);
                        targetMat.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.One);
                        targetMat.SetFloat("_BlendOp", (float)UnityEngine.Rendering.BlendOp.Add);
                        break;
                    case BLEND_TYPE_MAT.Subtract:
                        targetMat.SetFloat("_SrcBlend", (float)UnityEngine.Rendering.BlendMode.One);
                        targetMat.SetFloat("_DstBlend", (float)UnityEngine.Rendering.BlendMode.One);
                        targetMat.SetFloat("_BlendOp", (float)UnityEngine.Rendering.BlendOp.Subtract);
                        break;
                    case BLEND_TYPE_MAT.Other:
                        targetMat.SetFloat("_SrcBlend", (float)_SrcBlend);
                        targetMat.SetFloat("_DstBlend", (float)_DstBlend);
                        targetMat.SetFloat("_BlendOp", (float)_BlendOp);
                        break;
                }
            }
            if (_BlendMode == BLEND_TYPE_MAT.Other)
            {
                //选择其他时 增加对应的控件

                UnityEngine.Rendering.BlendMode srcblend = (UnityEngine.Rendering.BlendMode)EditorGUILayout.EnumPopup("Src Blend Factor", _SrcBlend);
                if (_SrcBlend != srcblend)
                {
                    _SrcBlend = srcblend;
                    targetMat.SetFloat("_SrcBlend", (float)_SrcBlend);
                }
                UnityEngine.Rendering.BlendMode dstblend = (UnityEngine.Rendering.BlendMode)EditorGUILayout.EnumPopup("Dst Blend Factor", _DstBlend);
                if (_DstBlend != dstblend)
                {
                    _DstBlend = dstblend;
                    targetMat.SetFloat("_DstBlend", (float)_DstBlend);
                }
                UnityEngine.Rendering.BlendOp blendop = (UnityEngine.Rendering.BlendOp)EditorGUILayout.EnumPopup("BlendOp", _BlendOp);
                if (_BlendOp != blendop)
                {
                    _BlendOp = blendop;
                    targetMat.SetFloat("_BlendOp", (float)_BlendOp);
                }
            }
        }





        //EditorGUI.BeginChangeCheck()

        MaterialProperty _Color = FindProperty("_Color", properties, true);
        materialEditor.ColorProperty(_Color, "Color");
        MaterialProperty _MainTex = FindProperty("_MainTex", properties,true);
        materialEditor.TextureProperty(_MainTex, "Main");
        if (_Main_Distortion != EditorGUILayout.Toggle("Distortion", Array.IndexOf(targetMat.shaderKeywords, "USE_DISTORTION_MAIN") != -1))
        {
            _Main_Distortion = !_Main_Distortion;
            if (_Main_Distortion)
                targetMat.EnableKeyword("USE_DISTORTION_MAIN");
            else
                targetMat.DisableKeyword("USE_DISTORTION_MAIN");
        }


        EditorGUILayout.Space(12);
        //MaterialProperty _Main_Distortion = FindProperty("_Main_Distortion", properties, true);



        MaterialProperty _MaskTex = FindProperty("_MaskTex", properties, true);
         materialEditor.TextureProperty(_MaskTex, "Mask（RGBA）");



        if (_UseMask!= EditorGUILayout.Toggle("Enable Mask", Array.IndexOf(targetMat.shaderKeywords, "USE_MASK") != -1))
        {
            _UseMask = !_UseMask;
            if(_UseMask)
                targetMat.EnableKeyword("USE_MASK");
            else
                targetMat.DisableKeyword("USE_MASK");
        }


        EditorGUILayout.Space(30);
        SubTexGUI(ref materialEditor, ref properties, "Front1", ref _Front1_RenderType, ref _Front1_MoveType, ref _UseFront1,ref _Front1_Flash,ref _Front1_Distortion);
        EditorGUILayout.Space(12);
        SubTexGUI(ref materialEditor,ref properties,"Front2", ref _Front2_RenderType, ref _Front2_MoveType,ref _UseFront2, ref _Front2_Flash, ref _Front2_Distortion);
        EditorGUILayout.Space(30);
        EditorGUILayout.Separator();
        SubTexGUI(ref materialEditor,ref properties,"Middle", ref _Middle_RenderType, ref _Middle_MoveType, ref _UseMiddle, ref _Middle_Flash, ref _Middle_Distortion);
        EditorGUILayout.Space(30);
        EditorGUILayout.Separator();
        SubTexGUI(ref materialEditor,ref properties,"Back1", ref _Back1_RenderType, ref _Back1_MoveType, ref _UseBack1,ref _Back1_Flash,ref _Back1_Distortion);
        EditorGUILayout.Space(12);
        SubTexGUI(ref materialEditor,ref properties,"Back2", ref _Back2_RenderType, ref _Back2_MoveType ,ref _UseBack2, ref _Back2_Flash, ref _Back2_Distortion);
        EditorGUILayout.Space(30);


        //扰动纹理

        DistortionGUI(ref materialEditor, ref properties,ref _Distortion_MoveType,ref _Distortion_Flash);






        //// 渲染默认 GUI
        //base.OnGUI(materialEditor, properties);



        if (GUILayout.Button("Reset Keyword"))
        {
            UnityEngine.Debug.Log(EditorVersion);
            ResetKeyword(ref materialEditor, ref properties);
        }
        materialEditor.RenderQueueField();
    }


    void _SetFloatValue(ref MaterialProperty[] properties, string propertyName, float value)
    {
        MaterialProperty property= FindProperty(propertyName, properties, true);
        property.floatValue = value;

    }




    void ResetKeywordForEffectUsage(ref Material targetMat, ref MaterialProperty[] properties, string Name, bool _Use, bool _Flash,bool _Distortion)
    {
        string NAME = Name.ToUpper();


        targetMat.DisableKeyword("USE_" + NAME);
        targetMat.DisableKeyword("USE_" + NAME + "_FLASH");
        targetMat.DisableKeyword("USE_" + NAME + "_DISTORTION");

        MaterialProperty _Front1Tex = FindProperty("_" + Name + "Tex", properties, true);
        if (_Front1Tex.textureValue)
        {
            targetMat.EnableKeyword("USE_" + NAME);
        }




        if (_Flash)
        {
            targetMat.EnableKeyword("USE_" + NAME + "_FLASH");
            _SetFloatValue(ref properties, "_Flag" + Name + "Flash", 1);

        }
        else
        {
            targetMat.DisableKeyword("USE_" + NAME + "_FLASH");
            _SetFloatValue(ref properties, "_Flag" + Name + "Flash", 0);
        }

        if (_Distortion)
        {
            targetMat.EnableKeyword("USE_" + NAME + "_DISTORTION");
            _SetFloatValue(ref properties, "_Flag" + Name + "Distortion", 1);
        }
        else
        {
            targetMat.DisableKeyword("USE_" + NAME + "_DISTORTION");
            _SetFloatValue(ref properties, "_Flag" + Name + "Distortion", 0);
        }


    }


    void ResetKeywordForRTandMT(ref Material targetMat, ref MaterialProperty[] properties, RENDER_TYPE rendertype,MOVE_TYPE movetype, string NAME)
    {
        string Name = "";
        //Name = Name;
        if (NAME.Length > 0)
        {
            Name = NAME.Substring(0,1)+ NAME.Substring(1).ToLower();

        }



        
            targetMat.DisableKeyword("_" + NAME + "_RENDERTYPE_ADDITIVE");
            targetMat.DisableKeyword("_" + NAME + "_RENDERTYPE_SUBSTRACT");
            targetMat.DisableKeyword("_" + NAME + "_RENDERTYPE_TRANSPARENT");

            switch (rendertype)
            {
                case RENDER_TYPE.Additive:
                    targetMat.EnableKeyword("_" + NAME + "_RENDERTYPE_ADDITIVE");
                _SetFloatValue(ref properties, "_Flag" + Name + "RenderType",-1);
                break;
                case RENDER_TYPE.Subtract:
                    targetMat.EnableKeyword("_" + NAME + "_RENDERTYPE_SUBSTRACT");
                _SetFloatValue(ref properties, "_Flag" + Name + "RenderType", 0);
                break;
                case RENDER_TYPE.Transparent:
                    targetMat.EnableKeyword("_" + NAME + "_RENDERTYPE_TRANSPARENT");
                _SetFloatValue(ref properties, "_Flag" + Name + "RenderType", 1);
                break;



            }


            targetMat.DisableKeyword("_" + NAME + "_MOVETYPE_FIXED");
            targetMat.DisableKeyword("_" + NAME + "_MOVETYPE_SCROLL");
            targetMat.DisableKeyword("_" + NAME + "_MOVETYPE_ROTATE");
            targetMat.DisableKeyword("_" + NAME + "_MOVETYPE_POLAR");

            switch (movetype)
            {

                case MOVE_TYPE.Fixed:
                    targetMat.EnableKeyword("_" + NAME + "_MOVETYPE_FIXED");
                _SetFloatValue(ref properties, "_Flag" + Name + "MoveType", -1);
                break;
                case MOVE_TYPE.Scroll:
                    targetMat.EnableKeyword("_" + NAME + "_MOVETYPE_SCROLL");
                _SetFloatValue(ref properties, "_Flag" + Name + "MoveType", 0);
                break;
                case MOVE_TYPE.Rotate:
                    targetMat.EnableKeyword("_" + NAME + "_MOVETYPE_ROTATE");
                _SetFloatValue(ref properties, "_Flag" + Name + "MoveType", 1);
                break;
                case MOVE_TYPE.Polar:
                    targetMat.EnableKeyword("_" + NAME + "_MOVETYPE_POLAR");
                _SetFloatValue(ref properties, "_Flag" + Name + "MoveType", 2);
                break;
            }


    }



}