// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SimpleDialogInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_330;

    public class SimpleDialogInfo implements IXMLSerialize, ISerialize 
    {

        public var title:String;
        public var iconType:int;
        public var iconID:int;
        public var iconPos:int;
        public var expressionID:int;
        public var msg:String;
        public var btn1:String;
        public var btn2:String;
        public var btn3:String;
        public var btn4:String;


        public function decode(_arg_1:XML):void
        {
            this.title = _arg_1.@title;
            this.iconType = _arg_1.@icontype;
            this.iconID = _arg_1.@iconid;
            this.iconPos = _arg_1.@iconpos;
            this.expressionID = _arg_1.@eid;
            this.msg = _arg_1.@msg;
            this.btn1 = _arg_1.@btn1;
            this.btn2 = _arg_1.@btn2;
            this.btn3 = _arg_1.@btn3;
            this.btn4 = _arg_1.@btn4;
        }

        public function encode()
        {
            var _local_1:XML = <Dialog/>
            ;
            _local_1.@title = this.title;
            _local_1.@icontype = this.iconType;
            _local_1.@iconid = this.iconID;
            _local_1.@iconpos = this.iconPos;
            _local_1.@eid = this.expressionID;
            _local_1.@msg = this.msg;
            _local_1.@btn1 = this.btn1;
            _local_1.@btn2 = this.btn2;
            _local_1.@btn3 = this.btn3;
            _local_1.@btn4 = this.btn4;
            return (_local_1);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.title = XString.ReadString(_arg_1);
            this.iconType = _arg_1.readShort();
            this.iconID = _arg_1.readInt();
            this.iconPos = _arg_1.readShort();
            this.expressionID = _arg_1.readShort();
            this.msg = XString.ReadString(_arg_1);
            this.btn1 = XString.ReadString(_arg_1);
            this.btn2 = XString.ReadString(_arg_1);
            this.btn3 = XString.ReadString(_arg_1);
            this.btn4 = XString.ReadString(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            XString.WriteString(_arg_1, this.title);
            _arg_1.writeShort(this.iconType);
            _arg_1.writeInt(this.iconID);
            _arg_1.writeShort(this.iconPos);
            _arg_1.writeShort(this.expressionID);
            XString.WriteString(_arg_1, this.msg);
            XString.WriteString(_arg_1, this.btn1);
            XString.WriteString(_arg_1, this.btn2);
            XString.WriteString(_arg_1, this.btn3);
            XString.WriteString(_arg_1, this.btn4);
        }

        public /*  ©init. */ function _SafeStr_330()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_330 = " SimpleDialogInfo" (String#17222)


