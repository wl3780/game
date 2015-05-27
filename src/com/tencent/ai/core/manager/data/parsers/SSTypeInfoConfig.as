// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.SSTypeInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.SSTypeInfo;
    import  ©init._SafeStr_645;
    import com.tencent.ai.core.data.*;

    public class SSTypeInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var ss_dict:Dictionary;

        public function SSTypeInfoConfig()
        {
            this.ss_dict = new Dictionary();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:SSTypeInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.SSTypeInfo;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new SSTypeInfo();
                _local_6.decode(_local_3[_local_5]);
                this.ss_dict[_local_6.type] = _local_6;
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this.ss_dict[_arg_1]);
        }

        public function findAll():Object
        {
            return (null);
        }

        public /*  ©init. */ function _SafeStr_645()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_645 = " SSTypeInfoConfig" (String#17201)


