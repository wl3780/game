// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.WeaponInfo

package com.tencent.ai.core.data
{
    import flash.utils.IExternalizable;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_357;

    public class WeaponInfo extends EquipStaticInfo implements IExternalizable 
    {

        public var hurt_eid:int;
        public var create_id:int;
        public var hurtType:int;
        public var weaponType:int;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.hurt_eid = int(_arg_1.@heid);
            this.create_id = int(_arg_1.@cid);
            this.hurtType = int(_arg_1.@hType);
            this.weaponType = int(_arg_1.@wType);
        }

        override public function readExternal(_arg_1:IDataInput):void
        {
            super.readExternal(_arg_1);
            this.hurt_eid = _arg_1.readInt();
            this.create_id = _arg_1.readInt();
            this.hurtType = _arg_1.readInt();
            this.weaponType = _arg_1.readInt();
        }

        override public function writeExternal(_arg_1:IDataOutput):void
        {
            super.writeExternal(_arg_1);
            _arg_1.writeInt(this.hurt_eid);
            _arg_1.writeInt(this.create_id);
            _arg_1.writeInt(this.hurtType);
            _arg_1.writeInt(this.weaponType);
        }

        public /*  ©init. */ function _SafeStr_357()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_357 = " WeaponInfo" (String#17198)


