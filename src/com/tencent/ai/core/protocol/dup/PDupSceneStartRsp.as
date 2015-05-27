// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.PDupSceneStartRsp

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.protocol.PBaseDupProtocol;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_946;

    public class PDupSceneStartRsp extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589846;

        public var result:int;
        public var take_effect_frame:uint;
        public var take_effect_seq:uint;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.result = _arg_1.readInt();
            this.take_effect_frame = _arg_1.readUnsignedInt();
            this.take_effect_seq = _arg_1.readUnsignedInt();
        }

        public /*  ©init. */ function _SafeStr_946()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_946 = " PDupSceneStartRsp" (String#17489)


