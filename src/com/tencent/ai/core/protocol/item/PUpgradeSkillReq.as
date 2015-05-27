// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.item.PUpgradeSkillReq

package com.tencent.ai.core.protocol.item
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_954;

    public class PUpgradeSkillReq implements ISerialize 
    {

        public static const IN_CMD:int = 527010;
        public static const OUT_CMD:int = 527009;

        public var avatar_id:uint;
        public var avatar_sid:uint;
        public var action_id:uint;
        public var add_lvl:uint;
        public var result:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readUnsignedInt();
            if (this.result != 0){
                ProtocolHelper.handlerError2(this.result, IN_CMD);
                return;
            };
            this.avatar_id = _arg_1.readUnsignedInt();
            this.avatar_sid = _arg_1.readUnsignedInt();
            this.action_id = _arg_1.readUnsignedInt();
            this.add_lvl = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.avatar_id);
            _arg_1.writeUnsignedInt(this.avatar_sid);
            _arg_1.writeUnsignedInt(this.action_id);
            _arg_1.writeUnsignedInt(this.add_lvl);
        }

        public /*  ©init. */ function _SafeStr_954()
        {
        }


    }
}//package com.tencent.ai.core.protocol.item

// _SafeStr_954 = " PUpgradeSkillReq" (String#17561)


