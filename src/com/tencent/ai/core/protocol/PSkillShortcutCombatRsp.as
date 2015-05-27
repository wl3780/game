// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PSkillShortcutCombatRsp

package com.tencent.ai.core.protocol
{
    import flash.utils.IDataInput;
    import  ©init._SafeStr_1028;

    public class PSkillShortcutCombatRsp extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589904;

        public var uin:uint;
        public var effectFrame:int;
        public var effectSerial:int;
        public var data:PSkillShortcutProtocol;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.uin = _arg_1.readUnsignedInt();
            this.effectFrame = _arg_1.readUnsignedInt();
            this.effectSerial = _arg_1.readUnsignedInt();
            this.data = new PSkillShortcutProtocol();
            this.data.read(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_1028()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1028 = " PSkillShortcutCombatRsp" (String#16811)


