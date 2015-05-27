// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.BindPlotScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_112;

    public class BindPlotScriptArg extends ScriptArg 
    {

        public var bBind:Boolean = true;
        public var dupID:int = 0;
        public var plot:int = 0;
        public var scenes:String = "";


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.bBind = (int(_arg_1.@bBind) == 1);
            this.dupID = _arg_1.@dupID;
            this.plot = _arg_1.@plot;
            this.scenes = String(_arg_1.@scenes);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@bBind = ((this.bBind) ? 1 : (0));
            _local_1.@dupID = this.dupID;
            _local_1.@plot = this.plot;
            _local_1.@scenes = this.scenes;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:BindPlotScriptArg = (super.clone() as BindPlotScriptArg);
            _local_1.bBind = this.bBind;
            _local_1.dupID = this.dupID;
            _local_1.plot = this.plot;
            _local_1.scenes = this.scenes;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_112()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_112 = " BindPlotScriptArg" (String#16685)


