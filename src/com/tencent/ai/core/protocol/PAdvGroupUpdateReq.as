// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PAdvGroupUpdateReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_972;

    public class PAdvGroupUpdateReq implements ISerialize 
    {

        public static const OUT_CMD:int = 526619;
        public static const IN_CMD:int = 526620;

        public var result:int;
        public var advLevel:int;
        public var curExp:int;
        public var totalExp:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            if (this.result == 0){
                this.advLevel = _arg_1.readUnsignedByte();
                this.curExp = _arg_1.readUnsignedInt();
                this.totalExp = _arg_1.readUnsignedInt();
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_972()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_972 = " PAdvGroupUpdateReq" (String#14546)


