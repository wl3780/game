// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PXGameGameStartNotify

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1059;

    public class PXGameGameStartNotify implements ISerialize 
    {

        public static const IN_CMD:int = 0x1F000E;

        public var ret:int;
        public var game_id:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
            this.game_id = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1059()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1059 = " PXGameGameStartNotify" (String#16529)


