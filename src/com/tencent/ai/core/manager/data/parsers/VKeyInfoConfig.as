// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.VKeyInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import com.tencent.ai.core.data.VKeyInfo;
    import  ©init._SafeStr_648;
    import com.tencent.ai.core.data.*;

    public class VKeyInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var vkeyInfos:Array;


        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:VKeyInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.VKeyInfo;
            var _local_4:int = _local_3.length();
            this.vkeyInfos = [];
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new VKeyInfo();
                _local_6.decode(_local_3[_local_5]);
                this.vkeyInfos.push(_local_6);
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
            return (this.vkeyInfos);
        }

        public /*  ©init. */ function _SafeStr_648()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_648 = " VKeyInfoConfig" (String#16802)


