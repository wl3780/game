package com.tencent.ai.core.render
{
    import flash.utils.Dictionary;

    public interface ILayerRender extends IBitmapRender 
    {

        function set layerID(id:int):void;
        function get layerID():int;
        function setMotionAssets(_arg_1:Dictionary):void;
        function getMotionAssets():Dictionary;
        function getMotionByID(_arg_1:int):MotionAsset;
        function playMotion(_arg_1:int):void;
        function stopMotion(_arg_1:int):void;
        function clear():void;

    }
}
