// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ItemHoleInfo

package com.tencent.ai.core.data
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_263;

    public class ItemHoleInfo extends EventDispatcher implements ISerialize 
    {

        public var status:int;
        public var gemID:int;
        public var gemTypes:Vector.<uint>;


        public function read(_arg_1:IDataInput):void
        {
            this.status = _arg_1.readUnsignedByte();
            this.gemID = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.status);
            _arg_1.writeInt(this.gemID);
        }

        public /*  ©init. */ function _SafeStr_263()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_263 = " ItemHoleInfo" (String#16037)


