// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IWarSoulManager

package com.tencent.ai.core.player
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.protocol.data.P_WarSoulData;
    import com.tencent.ai.core.protocol.data.P_WarSoulPanelData;
    import com.tencent.ai.core.data.WarSoulInfo;
    import flash.utils.Dictionary;

    public interface IWarSoulManager extends IEventDispatcher 
    {

        function copyFrom(_arg_1:P_WarSoulData, _arg_2:P_WarSoulPanelData):void;
        function get numPack():int;
        function get numStorage():int;
        function get maxPackSize():int;
        function get maxStorageSize():int;
        function get currentCreateIndex():int;
        function getWarSoulInfoBySID(_arg_1:int):WarSoulInfo;
        function getWarSoulInfoByGridIndex(_arg_1:int, _arg_2:Boolean):WarSoulInfo;
        function get packData():Dictionary;
        function get storageData():Dictionary;
        function create(_arg_1:int, _arg_2:int):void;
        function move(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void;
        function embed(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void;

    }
}//package com.tencent.ai.core.player

