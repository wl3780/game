// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.PDupBuildReq

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_932;

    public class PDupBuildReq implements ISerialize 
    {

        public static const OUT_CMD:int = 524321;
        public static const IN_CMD:int = 524322;

        public var dup_id:int;
        public var play_mode:int;
        public var level_mode:int;
        public var join_mode:int;
        public var monsterID:int;
        public var _result:int;
        public var _dup_ip:String;
        public var _dup_port:int;
        public var _dup_key:uint;


        public function read(_arg_1:IDataInput):void
        {
            this._result = _arg_1.readInt();
            if (this._result != 0){
                return;
            };
            this._dup_ip = _arg_1.readUTFBytes(64);
            this._dup_port = _arg_1.readUnsignedShort();
            this._dup_key = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.dup_id);
            _arg_1.writeByte(this.play_mode);
            _arg_1.writeByte(this.level_mode);
            _arg_1.writeByte(this.join_mode);
            _arg_1.writeUnsignedInt(this.monsterID);
        }

        public /*  ©init. */ function _SafeStr_932()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_932 = " PDupBuildReq" (String#17081)


