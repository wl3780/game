// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IPlayerSystem

package com.tencent.ai.core.player
{
    public interface IPlayerSystem 
    {

        function getFactory(_arg_1:int):IPlayerFactory;
        function getResource():IPlayerAssetManager;
        function newManager(_arg_1:Class=null):IPlayerManager;
        function getPlayerModelManager():IPlayerModelManager;

    }
}//package com.tencent.ai.core.player

