// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.IInteractItemManager

package com.tencent.ai.core.interact
{
    import com.tencent.ai.core.scene.IElementFactory;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.data.InteractItemInfo;

    public interface IInteractItemManager extends IElementFactory 
    {

        function getInteractItems():Vector.<BaseInteractItem>;
        function indexOfInteractItem(_arg_1:int):int;
        function getInteractItemByID(_arg_1:int):BaseInteractItem;
        function bindScene(_arg_1:IScene, _arg_2:Vector.<InteractItemInfo>):void;
        function unbind():void;
        function addDropItems(_arg_1:Array):void;
        function clear():void;
        function dispose():void;

    }
}//package com.tencent.ai.core.interact

