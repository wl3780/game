// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PCareerWearUpgrade

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_978;

    public class PCareerWearUpgrade implements ISerialize 
    {

        public static const IN_CMD:int = 524445;
        public static const OUT_CMD:int = 524444;

        public var result:int;
        public var career_wear_lvl:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            this.career_wear_lvl = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_978()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_978 = " PCareerWearUpgrade" (String#15641)


