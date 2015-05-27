// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_CombatAttrib

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.AttributeInfo;
    import com.tencent.ai.core.manager.data.DEFINE;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_877;

    public class P_CombatAttrib implements ISerialize 
    {

        public static var P:P_CombatAttrib = new (P_CombatAttrib)();

        public var data:AttributeInfo;

        public function P_CombatAttrib(_arg_1:AttributeInfo=null)
        {
            this.data = _arg_1;
        }

        public function read(_arg_1:IDataInput):void
        {
            if (this.data == null){
                this.data = new AttributeInfo();
            };
            this.data.strength = _arg_1.readUnsignedInt();
            this.data.intelligence = _arg_1.readUnsignedInt();
            this.data.physicalpower = _arg_1.readUnsignedInt();
            this.data.spirit = _arg_1.readUnsignedInt();
            this.data.hp = _arg_1.readUnsignedInt();
            this.data.maxhp = _arg_1.readUnsignedInt();
            this.data.hp_recovery = _arg_1.readUnsignedInt();
            this.data.mp = _arg_1.readUnsignedInt();
            this.data.maxmp = _arg_1.readUnsignedInt();
            this.data.mp_recovery = _arg_1.readUnsignedInt();
            this.data.p_attack = _arg_1.readUnsignedInt();
            this.data.p_defend = _arg_1.readUnsignedInt();
            this.data.m_attack = _arg_1.readUnsignedInt();
            this.data.m_defend = _arg_1.readUnsignedInt();
            this.data.stiff = _arg_1.readShort();
            this.data.firm = _arg_1.readShort();
            this.data.attack_v = _arg_1.readShort();
            this.data.walkV = _arg_1.readShort();
            this.data.runV = _arg_1.readShort();
            this.data.jumpV = _arg_1.readShort();
            this.data.hit_rate = DEFINE.CAST_FLOAT(_arg_1.readUnsignedShort());
            this.data.miss_rate = DEFINE.CAST_FLOAT(_arg_1.readUnsignedShort());
            this.data.angry_val = _arg_1.readUnsignedShort();
            this.data.cri_rate = DEFINE.CAST_FLOAT(_arg_1.readUnsignedShort());
            this.data.pDmgReduce = _arg_1.readShort();
            this.data.pFixDmg_rate = DEFINE.CAST_FLOAT(_arg_1.readUnsignedShort());
            this.data.mDmgReduce = _arg_1.readShort();
            this.data.mFixDmg_rate = DEFINE.CAST_FLOAT(_arg_1.readUnsignedShort());
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.data.strength);
            _arg_1.writeUnsignedInt(this.data.intelligence);
            _arg_1.writeUnsignedInt(this.data.physicalpower);
            _arg_1.writeUnsignedInt(this.data.spirit);
            _arg_1.writeUnsignedInt(this.data.hp);
            _arg_1.writeUnsignedInt(this.data.maxhp);
            _arg_1.writeUnsignedInt(this.data.hp_recovery);
            _arg_1.writeUnsignedInt(this.data.mp);
            _arg_1.writeUnsignedInt(this.data.maxmp);
            _arg_1.writeUnsignedInt(this.data.mp_recovery);
            _arg_1.writeUnsignedInt(this.data.p_attack);
            _arg_1.writeUnsignedInt(this.data.p_defend);
            _arg_1.writeUnsignedInt(this.data.m_attack);
            _arg_1.writeUnsignedInt(this.data.m_defend);
            _arg_1.writeShort(this.data.stiff);
            _arg_1.writeShort(this.data.firm);
            _arg_1.writeShort(this.data.attack_v);
            _arg_1.writeShort(this.data.walkV);
            _arg_1.writeShort(this.data.runV);
            _arg_1.writeShort(this.data.jumpV);
            _arg_1.writeShort((this.data.hit_rate * DEFINE.RATE_DENOM));
            _arg_1.writeShort((this.data.miss_rate * DEFINE.RATE_DENOM));
            _arg_1.writeShort(this.data.angry_val);
            _arg_1.writeShort((this.data.cri_rate * DEFINE.RATE_DENOM));
            _arg_1.writeShort(this.data.pDmgReduce);
            _arg_1.writeShort((this.data.pFixDmg_rate * DEFINE.RATE_DENOM));
            _arg_1.writeShort(this.data.mDmgReduce);
            _arg_1.writeShort((this.data.mFixDmg_rate * DEFINE.RATE_DENOM));
        }

        public /*  ©init. */ function _SafeStr_877()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_877 = " P_CombatAttrib" (String#16781)


