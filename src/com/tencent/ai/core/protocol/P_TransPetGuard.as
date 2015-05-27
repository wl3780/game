// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.P_TransPetGuard

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_969;
    import __AS3__.vec.*;

    public class P_TransPetGuard implements ISerialize 
    {

        public static const REQ:int = 524749;
        public static const RSP:int = 524750;

        public var result:int;
        public var guardInfo:Vector.<PPetGuardInfo>;
        public var guard_pos:uint;
        public var pet_sid:uint;
        public var pet_sid_old:uint = 0;


        public function read(_arg_1:IDataInput):void
        {
            var _local_3:PPetGuardInfo;
            this.result = _arg_1.readInt();
            if (this.result != 0){
                return;
            };
            this.guardInfo = new Vector.<PPetGuardInfo>();
            var _local_2:uint;
            while (_local_2 < 6) {
                _local_3 = new PPetGuardInfo();
                _local_3.read(_arg_1);
                this.guardInfo.push(_local_3);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.pet_sid_old);
            _arg_1.writeUnsignedInt(this.pet_sid);
            _arg_1.writeByte(this.guard_pos);
        }

        public /*  ©init. */ function _SafeStr_969()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_969 = " P_TransPetGuard" (String#17510)


