// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IEquipAssetManager

package com.tencent.ai.core.player
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.player.res.EquipAsset;
    import com.tencent.ai.core.data.PlayerEquipsID;
    import com.tencent.ai.core.player.res.FashionAsset;

    public interface IEquipAssetManager extends IEventDispatcher 
    {

        function equalEquipAsset(_arg_1:int, _arg_2:EquipAsset):Boolean;
        function getEquipAsset(_arg_1:int, _arg_2:Object):EquipAsset;
        function returnEquipAsset(_arg_1:EquipAsset, _arg_2:Object):void;
        function equalFashionAsset(_arg_1:PlayerEquipsID, _arg_2:FashionAsset):Boolean;
        function getFashionAsset(_arg_1:PlayerEquipsID, _arg_2:Object):FashionAsset;
        function returnFashionAsset(_arg_1:FashionAsset, _arg_2:Object):void;
        function getCityRefAssets():Array;
        function unloadRefAsset():void;

    }
}//package com.tencent.ai.core.player

