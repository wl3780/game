// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SuitStaticInfo

package com.tencent.ai.core.data
{
    import flash.utils.IExternalizable;
    import __AS3__.vec.Vector;
    import flash.utils.IDataOutput;
    import com.tencent.ai.core.manager.data.DEFINE;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_341;
    import __AS3__.vec.*;

    public class SuitStaticInfo implements IExternalizable 
    {

        public var id:int;
        public var name:String;
        public var effectID:String;
        public var members:Vector.<EquipStaticInfo>;
        public var attributes:Vector.<AttribPair>;
        public var activeStepMap:Vector.<int>;


        public function decode(_arg_1:XML):void
        {
            var _local_2:AttribPair;
            var _local_3:XML;
            var _local_4:XMLList;
            var _local_5:int;
            var _local_6:int;
            this.id = _arg_1.@suit_id;
            this.name = _arg_1.@name;
            this.effectID = _arg_1.@suit_render;
            this.attributes = new Vector.<AttribPair>();
            _local_4 = _arg_1.app_attri;
            _local_6 = _local_4.length();
            _local_5 = 0;
            while (_local_5 < _local_6) {
                _local_2 = new AttribPair();
                _local_2.decodeXML(_local_4[_local_5]);
                this.attributes.push(_local_2);
                _local_5++;
            };
            this.activeStepMap = new Vector.<int>(4);
            this.activeStepMap[0] = 0;
            this.activeStepMap[1] = int(_arg_1.@active_step_1);
            this.activeStepMap[2] = int(_arg_1.@active_step_2);
            this.activeStepMap[3] = int(_arg_1.@active_step_3);
        }

        public function toString():String
        {
            return (((this.id + " ") + this.name));
        }

        public function writeExternal(_arg_1:IDataOutput):void
        {
            var _local_2:AttribPair;
            var _local_3:int;
            var _local_4:int;
            _arg_1.writeInt(this.id);
            _arg_1.writeUTF(this.name);
            _arg_1.writeUTF(this.effectID);
            _local_4 = this.attributes.length;
            _arg_1.writeInt(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2 = this.attributes[_local_3];
                _local_2.writeExternal(_arg_1);
                _local_3++;
            };
            _arg_1.writeObject(this.activeStepMap);
            _local_4 = this.members.length;
            _arg_1.writeInt(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _arg_1.writeInt(this.members[_local_3].id);
                _local_3++;
            };
        }

        public function readExternal(_arg_1:IDataInput):void
        {
            var _local_2:AttribPair;
            var _local_3:int;
            var _local_4:int;
            this.id = _arg_1.readInt();
            this.name = _arg_1.readUTF();
            this.effectID = _arg_1.readUTF();
            this.attributes = new Vector.<AttribPair>();
            _local_4 = _arg_1.readInt();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2 = new AttribPair();
                _local_2.readExternal(_arg_1);
                this.attributes.push(_local_2);
                _local_3++;
            };
            this.activeStepMap = _arg_1.readObject();
            this.members = new Vector.<EquipStaticInfo>();
            _local_4 = _arg_1.readInt();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                this.members.push(DEFINE.DM.getItemStaticInfo(_arg_1.readInt()));
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_341()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_341 = " SuitStaticInfo" (String#17660)


