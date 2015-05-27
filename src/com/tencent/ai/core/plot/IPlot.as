// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.plot.IPlot

package com.tencent.ai.core.plot
{
    import com.tencent.ai.core.data.PlotInfo;

    public interface IPlot 
    {

        function get id():uint;
        function initialize(_arg_1:PlotInfo):Boolean;
        function finalize():void;
        function activate():Boolean;
        function deactivate():Boolean;
        function bActive():Boolean;
        function activateProcedure(_arg_1:int):void;
        function deactivateProcedure(_arg_1:int):void;
        function isProcedureActive(_arg_1:int):Boolean;

    }
}//package com.tencent.ai.core.plot

