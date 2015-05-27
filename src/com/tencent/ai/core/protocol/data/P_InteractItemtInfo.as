// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_InteractItemtInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_889;

    public class P_InteractItemtInfo implements ISerialize 
    {

        public var index:int;
        public var conf_id:int;
        public var scene_id:int;


        public function read(_arg_1:IDataInput):void
        {
            this.index = _arg_1.readUnsignedShort();
            this.conf_id = _arg_1.readUnsignedInt();
            this.scene_id = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_889()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_889 = " P_InteractItemtInfo" (String#14846)


