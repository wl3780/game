// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_TableInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_921;
    import __AS3__.vec.*;

    public class P_TableInfo implements ISerialize 
    {

        public var table_base_info:P_TableBaseInfo;
        public var player_num:uint;
        public var players:Vector.<P_PlayerBaseInfo>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_3:P_PlayerBaseInfo;
            this.table_base_info = new P_TableBaseInfo();
            this.table_base_info.read(_arg_1);
            this.player_num = _arg_1.readUnsignedShort();
            this.players = new Vector.<P_PlayerBaseInfo>();
            var _local_2:int;
            while (_local_2 < this.player_num) {
                _local_3 = new P_PlayerBaseInfo();
                _local_3.read(_arg_1);
                this.players.push(_local_3);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_921()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_921 = " P_TableInfo" (String#15482)


