// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.LFParam

package com.tencent.ai.core.timeline
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_1312;

    public class LFParam implements IXMLSerialize 
    {

        public var type:int;
        public var label:String;
        public var value:int;
        public var value1:int;
        public var value2:int;


        public static function DECODE_LFPS(_arg_1:XML):Array
        {
            var _local_5:LFParam;
            var _local_2:Array = [];
            var _local_3:XMLList = _arg_1.LogicFrame;
            var _local_4:int;
            while (_local_4 < _local_3.length()) {
                _local_5 = new (LFParam)();
                _local_5.decode(_local_3[_local_4]);
                _local_2.push(_local_5);
                _local_4++;
            };
            return (_local_2);
        }


        public function decode(_arg_1:XML):void
        {
            this.type = int(_arg_1.@type);
            this.value = int(_arg_1.@value);
            this.label = String(_arg_1.@label);
            this.value1 = int(_arg_1.@value1);
            this.value2 = int(_arg_1.@value2);
        }

        public function encode()
        {
            var _local_1:XML = <LogicFrame/>
            ;
            _local_1.@type = this.type;
            _local_1.@value = this.value;
            _local_1.@label = this.label;
            _local_1.@value1 = this.value1;
            _local_1.@value2 = this.value2;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_1312()
        {
        }


    }
}//package com.tencent.ai.core.timeline

// _SafeStr_1312 = " LFParam" (String#14282)


