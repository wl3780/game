// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IFamilyManager

package com.tencent.ai.core.player
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.data.PlayerID;

    public interface IFamilyManager extends IEventDispatcher 
    {

        function invite(_arg_1:PlayerID):void;
        function hide():void;
        function look(_arg_1:int):void;
        function join(_arg_1:int):void;

    }
}//package com.tencent.ai.core.player

