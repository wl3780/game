// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.npc.INpcManager

package com.tencent.ai.core.npc
{
    import com.tencent.ai.core.scene.IElementFactory;
    import com.tencent.ai.core.scene.IScene;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.SceneNpcInfo;

    public interface INpcManager extends IElementFactory 
    {

        function bindScene(_arg_1:IScene, _arg_2:Vector.<SceneNpcInfo>):void;
        function unbind():void;
        function getNpcList():Vector.<BaseNpc>;
        function getNpcBy(_arg_1:int):BaseNpc;

    }
}//package com.tencent.ai.core.npc

