// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.config.BD

package com.tencent.ai.core.asset.config
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_52;

    public class BD implements IXMLSerialize 
    {

        public var id:int;
        public var bdPrefix:String;
        public var bdName:String;
        public var bdFile:String;
        public var bdWidth:int;
        public var bdHeight:int;


        public function decode(_arg_1:XML):void
        {
            this.id = int(_arg_1.@id);
            this.bdName = String(_arg_1.@bdName);
            this.bdFile = String(_arg_1.@bdFile);
            this.bdWidth = int(_arg_1.@bdWidth);
            this.bdHeight = int(_arg_1.@bdHeight);
        }

        public function encode()
        {
            var _local_1:XML = <BD/>
            ;
            _local_1.@id = this.id;
            _local_1.@bdName = this.bdName;
            _local_1.@bdFile = this.bdFile;
            _local_1.@bdWidth = this.bdWidth;
            _local_1.@bdHeight = this.bdHeight;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_52()
        {
        }


    }
}//package com.tencent.ai.core.asset.config

// _SafeStr_52 = " BD" (String#16088)


