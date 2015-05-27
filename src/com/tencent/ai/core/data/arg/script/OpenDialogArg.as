// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.OpenDialogArg

package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.data.NpcDialogNormalInfo;
    import  ©init._SafeStr_138;

    public dynamic class OpenDialogArg extends ScriptArg 
    {

        public var info:NpcDialogNormalInfo;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            var _local_2:XML = _arg_1.Dialog[0];
            this.info = new NpcDialogNormalInfo();
            this.info.decode(_local_2);
        }

        public /*  ©init. */ function _SafeStr_138()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_138 = " OpenDialogArg" (String#13769)


