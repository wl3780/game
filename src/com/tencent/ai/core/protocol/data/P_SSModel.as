// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_SSModel

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.status.SSModel;
    import com.tencent.ai.core.manager.data.DEFINE;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_918;

    public class P_SSModel implements ISerialize 
    {

        public var data:SSModel;


        public function read(_arg_1:IDataInput):void
        {
            if (this.data == null){
                this.data = new SSModel();
            };
            this.data.ssID = _arg_1.readUnsignedInt();
            this.data.statusInfo = DEFINE.DM.getSpecialStatusInfo(this.data.ssID);
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.data.ssID);
        }

        public /*  ©init. */ function _SafeStr_918()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_918 = " P_SSModel" (String#15296)


