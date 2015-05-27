// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.ILaserViewRender

package com.tencent.ai.core.render
{
    import com.tencent.ai.core.utils.RectArea;
    import __AS3__.vec.Vector;

    public interface ILaserViewRender extends IMotionView 
    {

        function get ac():RectArea;
        function get hcs():Array;
        function updateAsset(_arg_1:Vector.<LayerAsset>):void;
        function setStep(_arg_1:int):void;
        function setLength(_arg_1:int):void;
        function getMotionByID(_arg_1:int):MotionAsset;
        function playMotion(_arg_1:int):void;
        function stopMotion(_arg_1:int):void;
        function updateMotion():void;
        function clear():void;

    }
}//package com.tencent.ai.core.render

