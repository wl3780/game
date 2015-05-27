// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.MailID

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_268;

    public class MailID implements ISerialize 
    {

        public var group_id:int;
        public var id:int;


        public function read(_arg_1:IDataInput):void
        {
            this.group_id = _arg_1.readUnsignedInt();
            this.id = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public function equal(_arg_1:MailID):Boolean
        {
            return ((((this.group_id == _arg_1.group_id)) && ((this.id == _arg_1.id))));
        }

        public /*  ©init. */ function _SafeStr_268()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_268 = " MailID" (String#16691)


