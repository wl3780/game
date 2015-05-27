// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ItemStaticInfo

package com.tencent.ai.core.data
{
    import flash.utils.IExternalizable;
    import flash.utils.IDataOutput;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_265;

    public class ItemStaticInfo implements IExternalizable 
    {

        public var id:int;
        public var name:String;
        public var iconID:String;
        public var kind:uint;
        public var type:int;
        public var levelLimit:int;
        public var feature:int;
        public var envLimit:int;
        public var repeatable:Boolean;
        public var useable:Boolean;
        public var pawnPrice:int;
        public var couponsPrice:int;
        public var scorePrice:int;
        public var goldPrice:int;
        public var dropIcon:int;
        public var sellState:int;
        public var description:String;
        public var commonID:int;
        public var cdLimit:int;
        public var effect:ServerMsgInfo;

        public function ItemStaticInfo()
        {
            this.effect = new ServerMsgInfo();
            super();
        }

        public function decode(_arg_1:XML):void
        {
            this.id = int(_arg_1.@id);
            this.name = String(_arg_1.@name);
            this.iconID = String(_arg_1.@src_id);
            this.type = int(_arg_1.@type);
            this.levelLimit = int(_arg_1.@level_limit);
            this.feature = int(_arg_1.@feature);
            this.repeatable = ((this.feature & (1 << 4)) > 0);
            this.useable = ((this.feature & (1 << 5)) > 0);
            this.couponsPrice = int(_arg_1.@tocken_price);
            this.scorePrice = int(_arg_1.@score_price);
            this.goldPrice = int(_arg_1.@gold_price);
            this.pawnPrice = int(_arg_1.@sell_price);
            this.dropIcon = int(_arg_1.@drop_icon);
            this.sellState = int(_arg_1.@sell_state);
            this.description = String(_arg_1.des);
            this.envLimit = int(_arg_1.@env_limit);
            this.cdLimit = (int(_arg_1.@cd_limit) * 1000);
            this.commonID = int(_arg_1.@public_cd_type);
            var _local_2:XML = _arg_1.effect_data[0];
            if (_local_2){
                this.effect.decode(_local_2);
            };
        }

        public function writeExternal(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.id);
            _arg_1.writeByte(this.kind);
            _arg_1.writeUTF(this.name);
            _arg_1.writeUTF(this.iconID);
            _arg_1.writeInt(this.type);
            _arg_1.writeInt(this.levelLimit);
            _arg_1.writeInt(this.feature);
            _arg_1.writeBoolean(this.repeatable);
            _arg_1.writeBoolean(this.useable);
            _arg_1.writeInt(this.couponsPrice);
            _arg_1.writeInt(this.scorePrice);
            _arg_1.writeInt(this.goldPrice);
            _arg_1.writeInt(this.pawnPrice);
            _arg_1.writeInt(this.dropIcon);
            _arg_1.writeInt(this.sellState);
            _arg_1.writeUTF(this.description);
            _arg_1.writeInt(this.envLimit);
            _arg_1.writeInt(this.cdLimit);
            _arg_1.writeInt(this.commonID);
            if (this.effect){
                _arg_1.writeBoolean(true);
                this.effect.write(_arg_1);
            } else {
                _arg_1.writeBoolean(false);
            };
        }

        public function readExternal(_arg_1:IDataInput):void
        {
            this.id = _arg_1.readInt();
            this.kind = _arg_1.readUnsignedByte();
            this.name = _arg_1.readUTF();
            this.iconID = _arg_1.readUTF();
            this.type = _arg_1.readInt();
            this.levelLimit = _arg_1.readInt();
            this.feature = _arg_1.readInt();
            this.repeatable = _arg_1.readBoolean();
            this.useable = _arg_1.readBoolean();
            this.couponsPrice = _arg_1.readInt();
            this.scorePrice = _arg_1.readInt();
            this.goldPrice = _arg_1.readInt();
            this.pawnPrice = _arg_1.readInt();
            this.dropIcon = _arg_1.readInt();
            this.sellState = _arg_1.readInt();
            this.description = _arg_1.readUTF();
            this.envLimit = _arg_1.readInt();
            this.cdLimit = _arg_1.readInt();
            this.commonID = _arg_1.readInt();
            this.effect = new ServerMsgInfo();
            if (_arg_1.readBoolean()){
                this.effect.read(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_265()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_265 = " ItemStaticInfo" (String#13808)


