// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.FactoryInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;

    public class FactoryInfo implements IXMLSerialize 
    {

        public var elementType:String;
        public var itemType:int;
        public var className:String;


        public function decode(_arg_1:XML):void
        {
            this.elementType = String(_arg_1.@elementType);
            this.itemType = int(_arg_1.@itemType);
            this.className = String(_arg_1.@className);
        }

        public function encode()
        {
            return (null);
        }


    }
}//package com.tencent.ai.core.data

