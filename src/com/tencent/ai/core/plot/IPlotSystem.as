// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.plot.IPlotSystem

package com.tencent.ai.core.plot
{
    import com.tencent.ai.core.data.PlotInfo;

    public interface IPlotSystem 
    {

        function initialize():Boolean;
        function finalize():void;
        function createPlotByID(_arg_1:int):IPlot;
        function breakPlotByID(_arg_1:int):void;
        function createPlot(_arg_1:PlotInfo):IPlot;
        function breakPlot(_arg_1:IPlot):void;
        function getPlotByID(_arg_1:int):IPlot;

    }
}//package com.tencent.ai.core.plot

