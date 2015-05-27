// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_ZoneBuff

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.ZoneBuff;
    import com.tencent.ai.core.manager.data.DEFINE;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_928;

    public class P_ZoneBuff implements ISerialize 
    {

        public var data:ZoneBuff;


        public function read(_arg_1:IDataInput):void
        {
            if (this.data == null){
                this.data = new ZoneBuff();
            };
            this.data.endTime = _arg_1.readUnsignedInt();
            this.data.buffType = _arg_1.readUnsignedInt();
            this.data.data1 = _arg_1.readInt();
            this.data.data2 = _arg_1.readInt();
            if (this.data.buffType == 20015){
                this.data.buffType = this.data.data1;
            };
            this.data.buffInfo = DEFINE.DM.getSpecialStatusInfo(this.data.buffType);
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.data.endTime);
            _arg_1.writeUnsignedInt(this.data.buffType);
            _arg_1.writeInt(this.data.data1);
            _arg_1.writeInt(this.data.data2);
        }

        public /*  ©init. */ function _SafeStr_928()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_928 = " P_ZoneBuff" (String#16895)


