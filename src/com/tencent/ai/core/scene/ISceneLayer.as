// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.ISceneLayer

package com.tencent.ai.core.scene
{
    import com.tencent.ai.core.render.IRenderObject;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.data.SceneLayerInfo;

    public interface ISceneLayer extends IRenderObject 
    {

        function getLayerID():int;
        function addElement(_arg_1:BaseElement):Boolean;
        function pushNormalItem(_arg_1:NormalItem):void;
        function removeElement(_arg_1:BaseElement):void;
        function getElementByID(_arg_1:int):BaseElement;
        function getElements():Array;
        function get currentScene():IScene;
        function load(_arg_1:IScene, _arg_2:SceneLayerInfo):Boolean;
        function unload():void;
        function getNormalItemByID(_arg_1:int):NormalItem;
        function sort():void;
        function set renderLevel(_arg_1:int):void;

    }
}//package com.tencent.ai.core.scene

