// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.StatusEffectInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_339;

    public class StatusEffectInfo extends AttribPair implements IXMLSerialize 
    {

        public var priority:int;
        public var index:int;
        public var data_4:Number;
        public var data_5:Number;


        public function decode(_arg_1:XML):void
        {
            this.priority = int(_arg_1.@priority);
            this.index = int(_arg_1.@index);
            this.data_4 = Number(_arg_1.@data_4);
            this.data_5 = Number(_arg_1.@data_5);
            decodeXML(_arg_1);
        }

        public function encode()
        {
            var _local_1:XML = <StatusEffectInfo/>
            ;
            _local_1.@priority = this.priority;
            _local_1.@index = this.index;
            _local_1.@data_4 = this.data_4;
            _local_1.@data_5 = this.data_5;
            encodeXML(_local_1);
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_339()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_339 = " StatusEffectInfo" (String#14003)


