// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.activity.womenJH.data.XYStruct

package com.tencent.ai.core.activity.womenJH.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_27;
    import __AS3__.vec.*;

    public class XYStruct implements ISerialize 
    {

        public var lollyCount:uint;
        public var lastPetSID:uint;
        public var npcLollyStatus:Vector.<uint>;
        public var first:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.lollyCount = _arg_1.readUnsignedInt();
            this.lastPetSID = _arg_1.readUnsignedInt();
            this.npcLollyStatus = new Vector.<uint>();
            var _local_2:uint;
            while (_local_2 < 5) {
                this.npcLollyStatus.push(_arg_1.readUnsignedByte());
                _local_2++;
            };
            this.first = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_27()
        {
        }


    }
}//package com.tencent.ai.core.activity.womenJH.data

// _SafeStr_27 = " XYStruct" (String#16445)


