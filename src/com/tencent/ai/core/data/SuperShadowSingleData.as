// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SuperShadowSingleData

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_343;

    public class SuperShadowSingleData implements IXMLSerialize, ISerialize 
    {

        public var url:String;
        public var words:String;


        public function decode(_arg_1:XML):void
        {
            this.url = _arg_1.@url;
            this.words = _arg_1.@words;
        }

        public function encode()
        {
            var _local_1:XML = <Dialog/>
            ;
            _local_1.@url = this.url;
            _local_1.@words = this.words;
            return (_local_1);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.url = XString.ReadString(_arg_1);
            this.words = XString.ReadString(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            XString.WriteString(_arg_1, this.url);
            XString.WriteString(_arg_1, this.words);
        }

        public /*  ©init. */ function _SafeStr_343()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_343 = " SuperShadowSingleData" (String#17528)


