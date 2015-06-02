package com.tencent.ai.core.render
{
    import com.tencent.ai.core.display.IBitmap;
    import com.tencent.ai.core.script.IScriptArrayListener;
    import com.tencent.ai.core.utils.RectArea;

    public interface IBitmapRender extends IBitmap, IRenderObject 
    {

        function setPlayParam(_arg_1:Number, _arg_2:Number):void;
        function getStateInfo():BPStateInfo;
        function setStateInfo(_arg_1:BPStateInfo):void;
        function gotoAndPlay(_arg_1:Object=null, _arg_2:int=-1):void;
        function gotoAndStop(_arg_1:Object=null, _arg_2:int=-1):void;
        function stop():void;
        function play():void;
        function isPlaying():Boolean;
        function get currentFrameIndex():int;
        function get totalFrame():int;
        function get currentFrame():BitmapKeyFrame;
        function get ac():RectArea;
        function get hcs():Array;
        function getCurrentFrameTimes():int;
        function setTimeLine(_arg_1:BitmapTimeline):void;
        function setScriptArrayListener(_arg_1:IScriptArrayListener):void;
        function addFrameListener(_arg_1:String, _arg_2:IFrameListener):void;
        function removeFrameListener(_arg_1:String, _arg_2:IFrameListener):void;
        function get isIdel():Boolean;
        function reset():void;

    }
}
