// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.PDupClientLoadReadyReq

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.protocol.PBaseDupProtocol;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_933;

    public class PDupClientLoadReadyReq extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589840;
        public static const OUT_CMD:int = 589831;

        public var loadRes:int;
        public var dup_key:int;
        public var _result:int;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this._result = _arg_1.readInt();
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            _arg_1.writeInt(this.loadRes);
            _arg_1.writeUnsignedInt(this.dup_key);
        }

        public /*  ©init. */ function _SafeStr_933()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_933 = " PDupClientLoadReadyReq" (String#17366)


