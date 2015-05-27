// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.cmd.impl.CNFCommand

package com.tencent.free.core.cmd.impl
{
    import com.tencent.free.core.cmd.BaseCommand;
    import com.tencent.free.core.cmd.CommandDef;
    import  ©init._SafeStr_2;

    public class CNFCommand extends BaseCommand 
    {

        public function CNFCommand(_arg_1:Object=null)
        {
            super(CommandDef.CMD_LISNOT_FOUND, _arg_1);
        }

        public function get doCommand():BaseCommand
        {
            return ((this.arg as BaseCommand));
        }

        public /*  ©init. */ function _SafeStr_2()
        {
        }


    }
}//package com.tencent.free.core.cmd.impl

// _SafeStr_2 = " CNFCommand" (String#1565)


