// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IPlayerAssetManager

package com.tencent.ai.core.player
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.data.PlayerEquipsID;
    import com.tencent.ai.core.player.res.PlayerAsset;

    public interface IPlayerAssetManager extends IEventDispatcher 
    {

        function getPlayerAsset(_arg_1:PlayerEquipsID, _arg_2:Object, _arg_3:Boolean=false):PlayerAsset;
        function returnPlayerAsset(_arg_1:PlayerAsset, _arg_2:Object):void;
        function get equipAssetManager():IEquipAssetManager;

    }
}//package com.tencent.ai.core.player

