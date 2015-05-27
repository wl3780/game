// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.extension.IExtensionPoint

package com.tencent.free.core.extension
{
    public interface IExtensionPoint 
    {

        function getID():String;
        function addExtension(_arg_1:IExtension):void;
        function removeExtension(_arg_1:IExtension):void;

    }
}//package com.tencent.free.core.extension

