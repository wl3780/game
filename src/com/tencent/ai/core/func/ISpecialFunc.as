// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.func.ISpecialFunc

package com.tencent.ai.core.func
{
    import com.tencent.ai.core.data.SpecialFuncInfo;

    public interface ISpecialFunc 
    {

        function setInfo(_arg_1:SpecialFuncInfo):void;
        function getInfo():SpecialFuncInfo;
        function setTarget(_arg_1:Object):void;
        function getTarget():Object;
        function execute():void;
        function getFuncID():int;
        function dispose():void;

    }
}//package com.tencent.ai.core.func

