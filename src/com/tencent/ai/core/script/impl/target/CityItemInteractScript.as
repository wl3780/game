// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.CityItemInteractScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.protocol.PCityInteractItemReq;
    import com.tencent.ai.core.net.CitySend;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1214;

    public class CityItemInteractScript implements IScript 
    {

        protected var m_target:ITarget;


        public function setTarget(_arg_1:Object):void
        {
            this.m_target = (_arg_1 as ITarget);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:PCityInteractItemReq = new PCityInteractItemReq();
            _local_3.index = this.m_target.target.id;
            CitySend(PCityInteractItemReq.REQ_CMD, _local_3);
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_CITYITEM_INTERACT);
        }

        public /*  ©init. */ function _SafeStr_1214()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1214 = " CityItemInteractScript" (String#14336)


