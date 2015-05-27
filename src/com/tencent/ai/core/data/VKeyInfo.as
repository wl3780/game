// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.VKeyInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_354;

    public class VKeyInfo implements IXMLSerialize 
    {

        public var value:int;
        public var keysStr:String;
        public var checkType:int;
        public var des:String;


        public function isNull():Boolean
        {
            return ((this.keysStr == ""));
        }

        public function clone():VKeyInfo
        {
            var _local_1:VKeyInfo = new VKeyInfo();
            _local_1.value = this.value;
            _local_1.keysStr = this.keysStr;
            _local_1.checkType = this.checkType;
            _local_1.des = this.des;
            return (_local_1);
        }

        public function decode(_arg_1:XML):void
        {
            this.value = int(_arg_1.@value);
            this.keysStr = String(_arg_1.@keysStr);
            this.checkType = int(_arg_1.@checkType);
            this.des = String(_arg_1.@des);
        }

        public function encode()
        {
            var _local_1:XML = <VKeyInfo/>
            ;
            _local_1.@value = this.value;
            _local_1.@keysStr = this.keysStr;
            _local_1.@checkType = this.checkType;
            _local_1.@des = this.des;
            return (_local_1);
        }

        public function toString():String
        {
            return ((((this.des + "(") + this.value) + ")"));
        }

        public /*  ©init. */ function _SafeStr_354()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_354 = " VKeyInfo" (String#17210)


