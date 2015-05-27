// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.IStatusEffect

package com.tencent.ai.core.status
{
    import com.tencent.ai.core.data.StatusEffectInfo;

    public interface IStatusEffect 
    {

        function setSStatus(_arg_1:ISpecialStatus):void;
        function getSStatus():ISpecialStatus;
        function initialize(_arg_1:StatusEffectInfo):void;
        function finalize():void;
        function execute():void;
        function getType():int;

    }
}//package com.tencent.ai.core.status

