// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PPvpEnterFight

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1017;

    public class PPvpEnterFight implements ISerialize 
    {

        public static const RSP:int = 526088;

        public var result:int;
        public var dupID:int;
        public var levelMode:int;
        public var ip:String;
        public var port:uint;
        public var dupKey:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            if (this.result){
                return;
            };
            this.dupID = _arg_1.readUnsignedInt();
            this.levelMode = _arg_1.readUnsignedByte();
            this.ip = XString.ReadChars(_arg_1, 64);
            this.port = _arg_1.readUnsignedShort();
            this.dupKey = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1017()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1017 = " PPvpEnterFight" (String#14048)


