package com.tencent.ai.core.scene
{
    import com.tencent.ai.core.data.SceneConfigInfo;
    import com.tencent.ai.core.data.SceneInfo;
    import com.tencent.ai.core.data.SceneWalkData;
    import com.tencent.ai.core.debug.IProfileObject;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.element.IElementContainer;
    import com.tencent.ai.core.render.IRenderObject;
    
    import flash.utils.Dictionary;

    public interface IScene extends IElementContainer, IRenderObject, IProfileObject 
    {

        function registerFunction(_arg_1:Function, _arg_2:Function, _arg_3:Function, _arg_4:int):void;
        function registerFactory(_arg_1:IElementFactory):void;
        function getFactory(_arg_1:String):IElementFactory;
        function unRegisterFactory(_arg_1:String):void;
        function load(_arg_1:SceneInfo, _arg_2:SceneConfigInfo):void;
        function unload():void;
        function getLayer(_arg_1:int):ISceneLayer;
        function getElements(_arg_1:int):Array;
        function getCamera():ICamera;
        function getConfig():Dictionary;
        function getSceneInfo():SceneInfo;
        function set focus(_arg_1:BaseElement):void;
        function get focus():BaseElement;
        function get mapWidth():int;
        function get mapHeight():int;
        function get configInfo():SceneConfigInfo;
        function drawWalk(_arg_1:Boolean=false):void;
        function get loaded():Boolean;
        function set renderLevel(_arg_1:int):void;
        function get renderLevel():int;
        function drawBackground(_arg_1:uint, _arg_2:int, _arg_3:int, _arg_4:Number=1):void;
        function get walkData():SceneWalkData;

    }
}
