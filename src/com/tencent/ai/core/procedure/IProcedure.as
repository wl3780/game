// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.procedure.IProcedure

package com.tencent.ai.core.procedure
{
    import com.tencent.ai.core.data.ProcedureInfo;

    public interface IProcedure 
    {

        function get id():uint;
        function get owner():Object;
        function initialize(_arg_1:ProcedureInfo, _arg_2:Object=null):Boolean;
        function finalize():void;
        function activate():Boolean;
        function deactivate():Boolean;
        function bActive():Boolean;

    }
}//package com.tencent.ai.core.procedure

