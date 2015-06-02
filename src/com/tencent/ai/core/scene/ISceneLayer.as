package com.tencent.ai.core.scene
{
    import com.tencent.ai.core.data.SceneLayerInfo;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.render.IRenderObject;

    public interface ISceneLayer extends IRenderObject 
    {

        function getLayerID():int;
        function addElement(element:BaseElement):Boolean;
        function pushNormalItem(item:NormalItem):void;
        function removeElement(element:BaseElement):void;
        function getElementByID(id:int):BaseElement;
        function getElements():Array;
        function get currentScene():IScene;
        function load(scene:IScene, info:SceneLayerInfo):Boolean;
        function unload():void;
        function getNormalItemByID(id:int):NormalItem;
        function sort():void;
        function set renderLevel(value:int):void;

    }
}
