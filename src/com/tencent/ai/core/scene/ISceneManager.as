// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.ISceneManager

package com.tencent.ai.core.scene
{
    public interface ISceneManager 
    {

        function prepareScene(_arg_1:Array):void;
        function unprepareScene(_arg_1:Array):void;
        function newCurrentScene(_arg_1:int):Scene;
        function getConfig(_arg_1:int, _arg_2:String=""):Object;
        function loadCurrentScene():void;
        function destroyCurrentScene():void;
        function getCurrentScene():Scene;

    }
}//package com.tencent.ai.core.scene

