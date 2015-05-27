// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.TriggerEventInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_352;

    public class TriggerEventInfo extends MultiArgsInfo implements IXMLSerialize, ISerialize 
    {

        public var type:String;


        public function decode(_arg_1:XML):void
        {
            this.type = String(_arg_1.@type);
            decodeXML(_arg_1);
        }

        public function encode()
        {
            var _local_1:XML = <EventInfo/>
            ;
            _local_1.@type = this.type;
            encodeXML(_local_1);
            return (_local_1);
        }

        public function clone():TriggerEventInfo
        {
            var _local_1:TriggerEventInfo = new TriggerEventInfo();
            _local_1.type = this.type;
            _local_1.args = this.args.slice();
            return (_local_1);
        }

        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.type = XString.ReadString(_arg_1);
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            XString.WriteString(_arg_1, this.type);
        }

        public /*  ©init. */ function _SafeStr_352()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_352 = " TriggerEventInfo" (String#16370)


