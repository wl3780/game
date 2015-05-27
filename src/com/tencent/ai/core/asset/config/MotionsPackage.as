// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.config.MotionsPackage

package com.tencent.ai.core.asset.config
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_58;
    import __AS3__.vec.*;

    public class MotionsPackage implements IXMLSerialize 
    {

        public var key:String;
        public var fpKey:String;
        public var motionLen:int;
        public var motionTemplates:Vector.<MotionTemplate>;


        public function decode(_arg_1:XML):void
        {
            var _local_4:int;
            var _local_5:MotionTemplate;
            this.key = String(_arg_1.@key);
            this.fpKey = String(_arg_1.@fpKey);
            var _local_2:XMLList = _arg_1.MotionTemplate;
            var _local_3:int = _local_2.length();
            if (_local_3 > 0){
                if (this.motionTemplates == null){
                    this.motionLen = _arg_1.@motionLen;
                    this.motionTemplates = new Vector.<MotionTemplate>();
                };
                _local_4 = 0;
                while (_local_4 < _local_3) {
                    _local_5 = new MotionTemplate();
                    _local_5.decode(_local_2[_local_4]);
                    this.motionTemplates.push(_local_5);
                    _local_4++;
                };
            };
        }

        public function encode()
        {
            var _local_1:XML = <MotionsPackage/>
            ;
            var _local_2:int = this.motionTemplates.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_1.appendChild(this.motionTemplates[_local_3].encode());
                _local_3++;
            };
            return (_local_1);
        }

        public function clone():MotionsPackage
        {
            var _local_1:MotionsPackage = new MotionsPackage();
            _local_1.motionLen = this.motionLen;
            _local_1.motionTemplates = this.motionTemplates;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_58()
        {
        }


    }
}//package com.tencent.ai.core.asset.config

// _SafeStr_58 = " MotionsPackage" (String#16883)


