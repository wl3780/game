// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_ZoneTransRepairChg

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_929;

    public class P_ZoneTransRepairChg implements ISerialize 
    {

        public var sid:int;
        public var data:int;


        public function read(_arg_1:IDataInput):void
        {
            this.sid = _arg_1.readUnsignedInt();
            this.data = _arg_1.readShort();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_929()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_929 = " P_ZoneTransRepairChg" (String#14081)


