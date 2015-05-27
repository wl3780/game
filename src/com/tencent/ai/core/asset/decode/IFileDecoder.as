// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.decode.IFileDecoder

package com.tencent.ai.core.asset.decode
{
    import flash.events.IEventDispatcher;
    import flash.utils.ByteArray;

    public interface IFileDecoder extends IEventDispatcher 
    {

        function load(_arg_1:String, _arg_2:ByteArray):void;
        function findFile(_arg_1:String, _arg_2:Array=null):Object;
        function unload():void;

    }
}//package com.tencent.ai.core.asset.decode

