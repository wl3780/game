// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_UinStatus

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_923;

    public class P_UinStatus implements ISerialize 
    {

        public var uin:uint;
        public var status:uint;
        public var last_logout_role:uint;
        public var last_logout_time:uint;
        public var max_pve_lvl:uint;
        public var career_id:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.uin = _arg_1.readUnsignedInt();
            this.status = _arg_1.readUnsignedByte();
            this.last_logout_role = _arg_1.readUnsignedByte();
            this.last_logout_time = _arg_1.readUnsignedInt();
            this.max_pve_lvl = _arg_1.readUnsignedShort();
            this.career_id = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_923()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_923 = " P_UinStatus" (String#14525)


