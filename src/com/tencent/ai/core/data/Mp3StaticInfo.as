// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.Mp3StaticInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_282;

    public class Mp3StaticInfo implements IXMLSerialize 
    {

        public var id:int;
        public var des:String;
        public var url:String;


        public function decode(_arg_1:XML):void
        {
            this.id = int(_arg_1.@id);
            this.des = String(_arg_1.@des);
            this.url = String(_arg_1.@url);
        }

        public function encode()
        {
            var _local_1:XML = <Mp3/>
            ;
            _local_1.@id = this.id;
            _local_1.@des = this.des;
            _local_1.@url = this.url;
        }

        public /*  ©init. */ function _SafeStr_282()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_282 = " Mp3StaticInfo" (String#14969)


