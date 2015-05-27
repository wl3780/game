// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IPlayerModelManager

package com.tencent.ai.core.player
{
    import __AS3__.vec.Vector;

    public interface IPlayerModelManager 
    {

        function initialize():void;
        function registPlayerModel(_arg_1:PlayerModel):void;
        function unregistPlayerModel(_arg_1:PlayerModel):void;
        function getAllPlayerModels():Vector.<PlayerModel>;
        function getPlayerModelByID(_arg_1:uint):PlayerModel;
        function getMainPlayerModel():IMainPlayerModel;

    }
}//package com.tencent.ai.core.player

