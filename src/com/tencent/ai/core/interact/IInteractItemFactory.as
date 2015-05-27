// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.IInteractItemFactory

package com.tencent.ai.core.interact
{
    public interface IInteractItemFactory 
    {

        function getInteractItemType():int;
        function getInteractItemClass():Class;
        function newInteractItem(_arg_1:Object):BaseInteractItem;
        function returnInteractItem(_arg_1:BaseInteractItem):void;
        function dispose():void;

    }
}//package com.tencent.ai.core.interact

