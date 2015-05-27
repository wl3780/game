// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PlayerID

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_310;

    public class PlayerID implements ISerialize 
    {

        public var uin:uint;
        public var role_id:uint;

        public function PlayerID(_arg_1:uint=0, _arg_2:uint=0)
        {
            this.uin = _arg_1;
            this.role_id = _arg_2;
        }

        public function read(_arg_1:IDataInput):void
        {
            this.uin = _arg_1.readUnsignedInt();
            this.role_id = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.uin);
            _arg_1.writeByte(this.role_id);
        }

        public function clone():PlayerID
        {
            var _local_1:PlayerID = new PlayerID();
            _local_1.uin = this.uin;
            _local_1.role_id = this.role_id;
            return (_local_1);
        }

        public function getKey():String
        {
            return (((this.uin + "_") + this.role_id));
        }

        public function toString():String
        {
            return ((((" uin=" + this.uin) + " roleID =") + this.role_id));
        }

        public function equal(_arg_1:PlayerID):Boolean
        {
            return ((((this.role_id == _arg_1.role_id)) && ((this.uin == _arg_1.uin))));
        }

        public /*  ©init. */ function _SafeStr_310()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_310 = " PlayerID" (String#15512)


