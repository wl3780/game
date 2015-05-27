// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IPlayerFactory

package com.tencent.ai.core.player
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.render.LayerAsset;

    public interface IPlayerFactory 
    {

        function getEthnicID():int;
        function getPlayerClass():Class;
        function getPlayerLayerAssets():Vector.<LayerAsset>;
        function newPlayer(_arg_1:Object):BasePlayer;
        function returnPlayer(_arg_1:BasePlayer):void;

    }
}//package com.tencent.ai.core.player

