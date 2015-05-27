// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.IMotionView

package com.tencent.ai.core.render
{
    import flash.geom.ColorTransform;

    public interface IMotionView extends IRenderEventDispatcher, IRenderObject 
    {

        function setPlayParam(_arg_1:Number, _arg_2:Number):void;
        function setRotation(_arg_1:int):void;
        function getRotation():int;
        function setDirection(_arg_1:int):void;
        function getDirection():int;
        function gotoAndPlay(_arg_1:Object=null, _arg_2:int=-1):void;
        function gotoAndStop(_arg_1:Object=null, _arg_2:int=-1):void;
        function stop():void;
        function play():void;
        function isPlaying():Boolean;
        function get currentFrameIndex():int;
        function get totalFrame():int;
        function getStateInfo():BPStateInfo;
        function setStateInfo(_arg_1:BPStateInfo):void;
        function setMotionID(_arg_1:int):void;
        function getMotionID():int;
        function setFilters(_arg_1:Array):void;
        function setColorTransform(_arg_1:ColorTransform):void;
        function reset():void;

    }
}//package com.tencent.ai.core.render

