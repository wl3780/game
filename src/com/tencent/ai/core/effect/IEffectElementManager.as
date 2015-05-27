// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.IEffectElementManager

package com.tencent.ai.core.effect
{
    import com.tencent.ai.core.data.EffectInfo;

    public interface IEffectElementManager 
    {

        function createElement(_arg_1:EffectInfo):EffectElement;
        function destoryElement(_arg_1:EffectElement):void;
        function clear():void;

    }
}//package com.tencent.ai.core.effect

