// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.ChangeStateScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.interact.BaseInteractItem;
    import com.tencent.ai.core.data.arg.script.ChangeStateArg;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1211;

    public class ChangeStateScript implements IScript 
    {

        protected var m_target:ITarget;


        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITarget(_arg_1);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:BaseInteractItem;
            var _local_3:ChangeStateArg = (_arg_2 as ChangeStateArg);
            if (_local_3 != null){
                _local_4 = (this.m_target.target as BaseInteractItem);
                if (_local_4){
                    _local_4.changeState(int(_local_3.argStr));
                };
            };
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return ([ScriptCmdDef.SC_CHANGE_INTERACTSTATE]);
        }

        public /*  ©init. */ function _SafeStr_1211()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1211 = " ChangeStateScript" (String#13922)


