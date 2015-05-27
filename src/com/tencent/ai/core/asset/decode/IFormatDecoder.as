// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.decode.IFormatDecoder

package com.tencent.ai.core.asset.decode
{
    import flash.events.IEventDispatcher;
    import flash.utils.ByteArray;
    import __AS3__.vec.Vector;

    public interface IFormatDecoder extends IEventDispatcher 
    {

        function isEmpty():Boolean;
        function support(_arg_1:String, _arg_2:String, _arg_3:ByteArray):Boolean;
        function start():void;
        function getExtNames():Vector.<String>;
        function getContents():Vector.<Object>;
        function unload():void;

    }
}//package com.tencent.ai.core.asset.decode

