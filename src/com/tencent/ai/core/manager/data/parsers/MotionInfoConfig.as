// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.MotionInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import com.tencent.ai.core.data.MotionInfo;
    import  ©init._SafeStr_624;
    import com.tencent.ai.core.data.*;

    public class MotionInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var motionInfos:Array;

        public function MotionInfoConfig()
        {
            this.motionInfos = [];
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:MotionInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.MotionInfo;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new MotionInfo();
                _local_6.decode(_local_3[_local_5]);
                this.motionInfos.push(_local_6);
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (null);
        }

        public function findAll():Object
        {
            return (this.motionInfos);
        }

        public /*  ©init. */ function _SafeStr_624()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_624 = " MotionInfoConfig" (String#15827)


