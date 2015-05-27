// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.P_TransPetGuardQuery

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_971;
    import __AS3__.vec.*;

    public class P_TransPetGuardQuery implements ISerialize 
    {

        public static const REQ:int = 524753;
        public static const RSP:int = 524754;

        public var result:int;
        public var guardInfo:Vector.<PPetGuardInfo>;


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
        }

        public /*  ©init. */ function _SafeStr_971()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_971 = " P_TransPetGuardQuery" (String#15899)


