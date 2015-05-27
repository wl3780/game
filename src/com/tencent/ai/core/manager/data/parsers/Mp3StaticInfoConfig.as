// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.Mp3StaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.Mp3StaticInfo;
    import  ©init._SafeStr_626;

    public class Mp3StaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var mp3Hash:Dictionary;


        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:XML;
            var _local_5:Mp3StaticInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            this.mp3Hash = new Dictionary();
            var _local_3:XMLList = _local_2.Mp3;
            for each (_local_4 in _local_3) {
                _local_5 = new Mp3StaticInfo();
                _local_5.decode(_local_4);
                this.mp3Hash[_local_5.id] = _local_5;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this.mp3Hash[_arg_1]);
        }

        public function findAll():Object
        {
            return (this.mp3Hash);
        }

        public /*  ©init. */ function _SafeStr_626()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_626 = " Mp3StaticInfoConfig" (String#14651)


