// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protect.IProtectObject

package com.tencent.ai.core.protect
{
    import __AS3__.vec.Vector;

    public interface IProtectObject 
    {

        function initAttribs(_arg_1:Vector.<PAttribData>):void;
        function updateAttribsValue(_arg_1:Object):void;
        function addAttribValue(_arg_1:String, _arg_2:Object):void;
        function setAttribValue(_arg_1:String, _arg_2:Object):void;
        function getProtectAttrib(_arg_1:String):Object;
        function resetValues():void;

    }
}//package com.tencent.ai.core.protect

