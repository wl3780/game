// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.ClientCreateMonsterArg

package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import  ©init._SafeStr_123;
    import com.tencent.ai.core.data.*;

    public class ClientCreateMonsterArg extends ScriptArg 
    {

        public var index:int;
        public var id:int;
        public var aiID:int;
        public var activateAI:Boolean;
        public var mapPosition:MapPosition;
        public var dir:int;
        public var groupID:int;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.index = int(_arg_1.@index);
            this.id = int(_arg_1.@id);
            this.aiID = int(_arg_1.@aiID);
            this.activateAI = (int(_arg_1.@activateAI) == 1);
            var _local_2:XML = _arg_1.MapPosition[0];
            if (_local_2 != null){
                this.mapPosition = MapPosition.DecodeXML(_local_2);
            } else {
                this.mapPosition = new MapPosition();
            };
            this.dir = int(_arg_1.@dir);
            this.groupID = int(_arg_1.@groupID);
            if (this.groupID == 0){
                this.groupID = ElementGroupDef.PVE_MONSTER;
            };
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@index = this.index;
            _local_1.@id = this.id;
            _local_1.@aiID = this.aiID;
            _local_1.@activateAI = ((this.activateAI) ? (1) : 0);
            if (this.mapPosition != null){
                _local_1.appendChild(MapPosition.EncodeXML(this.mapPosition));
            };
            _local_1.@dir = this.dir;
            _local_1.@groupID = this.groupID;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:ClientCreateMonsterArg = (super.clone() as ClientCreateMonsterArg);
            _local_1.index = this.index;
            _local_1.id = this.id;
            _local_1.aiID = this.aiID;
            _local_1.activateAI = this.activateAI;
            _local_1.mapPosition = (((this.mapPosition)!=null) ? this.mapPosition.clone() : null);
            _local_1.dir = this.dir;
            _local_1.groupID = this.groupID;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_123()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_123 = " ClientCreateMonsterArg" (String#15407)


