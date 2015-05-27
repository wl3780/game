// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PBaseDupProtocol

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_975;

    public class PBaseDupProtocol implements ISerialize 
    {

        public static var GenerateEventNo:Function;
        public static var GotSyncNo:Function;

        public var sync_no:uint;
        public var event_no:int;
        public var use_event_no:Boolean = false;


        public function read(_arg_1:IDataInput):void
        {
            this.sync_no = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            if (GenerateEventNo != null){
                GenerateEventNo(this);
            };
            _arg_1.writeUnsignedInt(this.event_no);
        }

        public /*  ©init. */ function _SafeStr_975()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_975 = " PBaseDupProtocol" (String#13751)


