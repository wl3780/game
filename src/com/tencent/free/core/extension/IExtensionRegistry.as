// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.extension.IExtensionRegistry

package com.tencent.free.core.extension
{
    import __AS3__.vec.Vector;

    public interface IExtensionRegistry 
    {

        function addExtensionPoint(_arg_1:IExtensionPoint):void;
        function removeExtensionPoint(_arg_1:IExtensionPoint):void;
        function getExtensionPoint(_arg_1:String):IExtensionPoint;
        function addExtension(_arg_1:String, _arg_2:IExtension):void;
        function removeExtension(_arg_1:String, _arg_2:IExtension):void;
        function getExtensionPoints():Vector.<IExtensionPoint>;

    }
}//package com.tencent.free.core.extension

