// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.PDupPlayerQuitNotify

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.protocol.PBaseDupProtocol;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_943;

    public class PDupPlayerQuitNotify extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589896;

        public var iPlayerID:PlayerID;
        public var iEffectFrame:int;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.iPlayerID = new PlayerID();
            this.iPlayerID.read(_arg_1);
            this.iEffectFrame = _arg_1.readUnsignedInt();
        }

        public /*  ©init. */ function _SafeStr_943()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_943 = " PDupPlayerQuitNotify" (String#15455)


