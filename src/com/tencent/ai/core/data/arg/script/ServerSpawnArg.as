// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.ServerSpawnArg

package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.data.MapPosition;
    import  ©init._SafeStr_151;
    import com.tencent.ai.core.data.*;

    public class ServerSpawnArg extends ScriptArg 
    {

        public var pkID:uint;
        public var packID:uint;
        public var spawnType:int = 0;
        public var data1:int = 0;
        public var data2:int = 0;
        public var data3:int = 0;
        public var localMapPos:MapPosition;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.pkID = uint(_arg_1.@pkID);
            this.packID = uint(_arg_1.@packID);
            this.spawnType = int(_arg_1.@spawnType);
            this.data1 = int(_arg_1.@data1);
            this.data2 = int(_arg_1.@data2);
            this.data3 = int(_arg_1.@data3);
            var _local_2:XML = _arg_1.MapPosition[0];
            if (_local_2 != null){
                this.localMapPos = MapPosition.DecodeXML(_local_2);
            };
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@pkID = this.pkID;
            _local_1.@packID = this.packID;
            _local_1.@spawnType = this.spawnType;
            _local_1.@data1 = this.data1;
            _local_1.@data2 = this.data2;
            _local_1.@data3 = this.data3;
            if (this.localMapPos != null){
                _local_1.appendChild(MapPosition.EncodeXML(this.localMapPos));
            };
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:ServerSpawnArg = (super.clone() as ServerSpawnArg);
            _local_1.pkID = this.pkID;
            _local_1.packID = this.packID;
            _local_1.spawnType = this.spawnType;
            _local_1.data1 = this.data1;
            _local_1.data2 = this.data2;
            _local_1.data3 = this.data3;
            _local_1.localMapPos = this.localMapPos.clone();
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_151()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_151 = " ServerSpawnArg" (String#14687)


