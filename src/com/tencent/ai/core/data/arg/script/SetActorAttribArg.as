// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.SetActorAttribArg

package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.data.MapPosition;
    import  ©init._SafeStr_152;
    import com.tencent.ai.core.data.*;

    public class SetActorAttribArg extends ScriptArg 
    {

        public static const ATTRIB_SET_POS:int = 10000;
        public static const ATTRIB_SPEAK_BUBBLE:int = 10001;

        public var targetType:int;
        public var targetID:uint;
        public var attribType:int;
        public var attribValue:Number;
        public var attribStr:String;
        public var attribPos:MapPosition;
        public var attribDir:int;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.targetType = int(_arg_1.@targetType);
            this.targetID = uint(_arg_1.@targetID);
            this.attribType = int(_arg_1.@attribType);
            this.attribValue = Number(_arg_1.@attribValue);
            this.attribDir = int(_arg_1.@attribDir);
            var _local_2:XML = _arg_1.MapPosition[0];
            if (_local_2 != null){
                this.attribPos = MapPosition.DecodeXML(_local_2);
            };
            var _local_3:XML = _arg_1.AttribStr[0];
            if (_local_3 != null){
                this.attribStr = String(_local_3.toString());
            };
        }

        override public function encode()
        {
            var _local_2:XML;
            var _local_1:XML = super.encode();
            _local_1.@targetType = this.targetType;
            _local_1.@targetID = this.targetID;
            _local_1.@attribType = this.attribType;
            _local_1.@attribValue = this.attribValue;
            _local_1.@attribDir = this.attribDir;
            if (this.attribPos != null){
                _local_1.appendChild(MapPosition.EncodeXML(this.attribPos));
            };
            if (((!((this.attribStr == null))) && (!((this.attribStr == ""))))){
                _local_2 = <AttribStr/>
                ;
                _local_2.appendChild(this.attribStr);
                _local_1.appendChild(_local_2);
            };
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            return ((super.clone() as SetActorAttribArg));
        }

        public /*  ©init. */ function _SafeStr_152()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_152 = " SetActorAttribArg" (String#16640)


