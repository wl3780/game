// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.filesystem.ISOProxy

package com.tencent.free.core.filesystem
{
    import flash.events.IEventDispatcher;
    import flash.utils.ByteArray;

    public interface ISOProxy extends IEventDispatcher 
    {

        function tryOpen(_arg_1:String="17xf.qq.com"):Boolean;
        function open(_arg_1:String="17xf.qq.com"):void;
        function saveFile(_arg_1:Object, _arg_2:String, _arg_3:ByteArray):Boolean;
        function delFile(_arg_1:Object):void;
        function getFile(_arg_1:Object, _arg_2:String):ByteArray;

    }
}//package com.tencent.free.core.filesystem

