// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.SystemNpcArrowArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_165;

    public class SystemNpcArrowArg extends ScriptArg 
    {

        public var opreationType:String = "create";
        public var npcID:int;
        public var optionLabel:String = "";
        public var direction:String = "S";
        public var showTime:int = 90;
        public var id:int = 0;


        public function setId(_arg_1:int):void
        {
            this.id = _arg_1;
        }

        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.opreationType = String(_arg_1.@opreationType);
            this.npcID = int(_arg_1.@npcID);
            this.optionLabel = String(_arg_1.@optionLabel);
            this.direction = String(_arg_1.@direction);
            this.showTime = int(_arg_1.@showTime);
            this.id = int(_arg_1.@id);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@opreationType = this.opreationType;
            _local_1.@npcID = this.npcID;
            _local_1.@optionLabel = this.optionLabel;
            _local_1.@direction = this.direction;
            _local_1.@showTime = this.showTime;
            _local_1.@id = this.id;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:SystemNpcArrowArg = new SystemNpcArrowArg();
            _local_1.opreationType = this.opreationType;
            _local_1.npcID = this.npcID;
            _local_1.optionLabel = this.optionLabel;
            _local_1.direction = this.direction;
            _local_1.showTime = this.showTime;
            _local_1.id = this.id;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_165()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_165 = " SystemNpcArrowArg" (String#15059)


