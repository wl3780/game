// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.DupItemInteractScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.protocol.PDupItemInteractProtocol;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.NetGroupDef;
    import com.tencent.ai.core.net.IGroup;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1219;

    public class DupItemInteractScript implements IScript 
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
            var _local_3:PDupItemInteractProtocol = new PDupItemInteractProtocol();
            _local_3.index = this.m_target.target.id;
            _local_3.sequence_no = 1;
            _local_3.pos = this.m_target.target.getMapPosition();
            var _local_4:IGroup = AICore.net.getGroup(NetGroupDef.NG_DUP_GROUP);
            _local_4.send(PDupItemInteractProtocol.OUT_CMD, _local_3);
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_DUPITEM_INTERACT);
        }

        public /*  ©init. */ function _SafeStr_1219()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1219 = " DupItemInteractScript" (String#14348)


