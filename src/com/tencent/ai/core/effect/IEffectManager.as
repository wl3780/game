// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.IEffectManager

package com.tencent.ai.core.effect
{
    import com.tencent.ai.core.scene.IElementFactory;
    import com.tencent.ai.core.scene.IScene;

    public interface IEffectManager extends IElementFactory 
    {

        function getEffectAsset(_arg_1:int, _arg_2:Object=null):EffectAsset;
        function returnEffectAsset(_arg_1:EffectAsset, _arg_2:Object=null):void;
        function getEffectAssets(_arg_1:int):Array;
        function bindScene(_arg_1:IScene):void;
        function unbind():void;

    }
}//package com.tencent.ai.core.effect

