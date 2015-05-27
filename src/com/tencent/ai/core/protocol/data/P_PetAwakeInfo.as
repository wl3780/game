// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_PetAwakeInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_900;

    public class P_PetAwakeInfo implements ISerialize 
    {

        public var ret:int;
        public var type:uint;
        public var petSID:uint;
        public var skillPos:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.type);
            _arg_1.writeUnsignedInt(this.petSID);
            _arg_1.writeByte(this.skillPos);
        }

        public /*  ©init. */ function _SafeStr_900()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_900 = " P_PetAwakeInfo" (String#15341)


