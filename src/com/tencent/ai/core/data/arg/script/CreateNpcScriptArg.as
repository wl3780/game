// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.CreateNpcScriptArg

package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.data.MapPosition;
    import  ©init._SafeStr_129;
    import com.tencent.ai.core.data.*;

    public class CreateNpcScriptArg extends ScriptArg 
    {

        public var npcID:int;
        public var mapPosition:MapPosition;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.npcID = _arg_1.@npcID;
            var _local_2:XML = _arg_1.MapPosition[0];
            if (_local_2 != null){
                this.mapPosition = MapPosition.DecodeXML(_local_2);
            } else {
                this.mapPosition = new MapPosition();
            };
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@npcID = this.npcID;
            if (this.mapPosition){
                _local_1.MapPosition = (_local_1.MapPosition + MapPosition.EncodeXML(this.mapPosition));
            };
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:CreateNpcScriptArg = (super.clone() as CreateNpcScriptArg);
            _local_1.npcID = this.npcID;
            _local_1.mapPosition = this.mapPosition.clone();
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_129()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_129 = " CreateNpcScriptArg" (String#15350)


