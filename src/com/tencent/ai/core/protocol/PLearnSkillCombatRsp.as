// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PLearnSkillCombatRsp

package com.tencent.ai.core.protocol
{
    import flash.utils.IDataInput;
    import  ©init._SafeStr_1008;

    public class PLearnSkillCombatRsp extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589906;

        public var uin:uint;
        public var effectFrame:int;
        public var effectSerial:int;
        public var data:PLearnSkillProtocol;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.uin = _arg_1.readUnsignedInt();
            this.effectFrame = _arg_1.readUnsignedInt();
            this.effectSerial = _arg_1.readUnsignedInt();
            this.data = new PLearnSkillProtocol();
            this.data.read(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_1008()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1008 = " PLearnSkillCombatRsp" (String#17519)


