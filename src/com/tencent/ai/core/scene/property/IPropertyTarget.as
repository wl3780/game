// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.IPropertyTarget

package com.tencent.ai.core.scene.property
{
    import __AS3__.vec.Vector;

    public interface IPropertyTarget 
    {

        function addProperty(_arg_1:AbstractProperty):void;
        function removeProperty(_arg_1:AbstractProperty):void;
        function getProperty():Vector.<AbstractProperty>;
        function getPropertyByType(_arg_1:String):Vector.<AbstractProperty>;

    }
}//package com.tencent.ai.core.scene.property

