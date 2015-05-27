// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.BadgeInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_219;

    public class BadgeInfo implements IXMLSerialize, ISerialize 
    {

        public var badge:int;
        public var type:int;
        public var group:int;
        public var award_msg:String;


        public function decode(_arg_1:XML):void
        {
            this.badge = _arg_1.@badge;
            this.type = _arg_1.@type;
            this.group = _arg_1.@group;
            this.award_msg = _arg_1.@award_msg;
        }

        public function encode()
        {
            var _local_1:XML = <Item/>
            ;
            _local_1.@badge = this.badge;
            _local_1.@type = this.type;
            _local_1.@group = this.group;
            _local_1.@award_msg = this.award_msg;
            return (_local_1);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.badge = _arg_1.readInt();
            this.type = _arg_1.readInt();
            this.group = _arg_1.readInt();
            this.award_msg = XString.ReadString(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.badge);
            _arg_1.writeInt(this.type);
            _arg_1.writeInt(this.group);
            XString.WriteString(_arg_1, this.award_msg);
        }

        public /*  ©init. */ function _SafeStr_219()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_219 = " BadgeInfo" (String#14144)


