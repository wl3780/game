package com.tencent.ai.core.render
{
    import com.tencent.ai.core.utils.RectArea;
    
    import flash.utils.Dictionary;

    public interface BodyViewLayer extends IMotionView 
    {

        function get ac():RectArea;
        function get hcs():Array;
        function setMotionAssets(_arg_1:Dictionary):void;
        function getMotionAssets():Dictionary;
        function getMotionByID(_arg_1:int):MotionAsset;
        function playMotion(_arg_1:int):void;
        function stopMotion(_arg_1:int):void;
        function updateMotion():void;
        function clear():void;

    }
}
