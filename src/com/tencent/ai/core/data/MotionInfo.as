// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.MotionInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_279;

    public class MotionInfo implements IXMLSerialize 
    {

        public static const B_SWORDMAN:int = 10;
        public static const E_SWORDMAN:int = 11;
        public static const B_LAUNCHER:int = 20;
        public static const E_LAUNCHER:int = 21;
        public static const B_FLASHER:int = 30;
        public static const E_FLASHER:int = 31;

        public var index:int;
        public var id:int;
        public var name:String;
        public var type:int;
        public var sections:Array;


        public function decode(_arg_1:XML):void
        {
            var _local_5:MotionSectionInfo;
            this.id = int(_arg_1.@id);
            this.name = String(_arg_1.@name);
            this.type = int(_arg_1.@type);
            var _local_2:XMLList = _arg_1.MotionSectionInfo;
            var _local_3:int = _local_2.length();
            this.sections = [];
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = new MotionSectionInfo();
                _local_5.decode(_local_2[_local_4]);
                this.sections.push(_local_5);
                _local_4++;
            };
        }

        public function encode()
        {
            var _local_4:MotionSectionInfo;
            var _local_1:XML = <MotionInfo/>
            ;
            _local_1.@id = this.id;
            _local_1.@name = this.name;
            _local_1.@type = this.type;
            var _local_2:int = this.sections.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = this.sections[_local_3];
                _local_1.appendChild(_local_4.encode());
                _local_3++;
            };
            return (_local_1);
        }

        public function toString():String
        {
            return ((((this.name + "(") + this.id) + ")"));
        }

        public /*  ©init. */ function _SafeStr_279()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_279 = " MotionInfo" (String#15992)


