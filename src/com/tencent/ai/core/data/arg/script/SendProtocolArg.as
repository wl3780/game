// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.SendProtocolArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_150;

    public class SendProtocolArg extends ScriptArg 
    {

        protected var args:Array;


        override public function decode(_arg_1:XML):void
        {
            var _local_4:String;
            super.decode(_arg_1);
            this.args = new Array();
            var _local_2:int;
            var _local_3:String = ("arg" + _local_2.toString());
            while (_arg_1.hasOwnProperty(("@" + _local_3))) {
                _local_4 = _arg_1[("@" + _local_3)];
                this.args.push(_local_4);
                _local_3 = ("arg" + ++_local_2.toString());
            };
        }

        override public function encode()
        {
            return (super.encode());
        }

        override public function clone():ScriptArg
        {
            var _local_1:SendProtocolArg = (super.clone() as SendProtocolArg);
            _local_1.args = this.args.slice();
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_150()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_150 = " SendProtocolArg" (String#16271)


