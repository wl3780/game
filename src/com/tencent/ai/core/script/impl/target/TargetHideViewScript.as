// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetHideViewScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.render.ElementViewHead;
    import com.tencent.ai.core.element.shadow.ShadowElement;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1237;

    public class TargetHideViewScript implements IScript 
    {

        protected var m_target:ITarget;
        protected var m_sourceHead:Boolean;
        protected var m_sourceShadow:Boolean;
        protected var m_initSource:Boolean;

        public function TargetHideViewScript()
        {
            this.m_initSource = false;
        }

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
            var _local_4:ElementViewHead;
            var _local_5:ShadowElement;
            var _local_3:String = ScriptArg(_arg_2).argStr;
            if (_local_3 == "show"){
                this.stop();
            } else {
                if (!this.m_initSource){
                    this.m_initSource = true;
                    _local_4 = ElementViewHead(this.m_target.target.getView());
                    _local_5 = this.m_target.target.getElementshadow();
                    this.m_sourceHead = _local_4.getHeadVisible();
                    if (this.m_sourceHead){
                        _local_4.setHeadVisible(false);
                    };
                    if (_local_5 != null){
                        _local_5.getDisplay().visible = false;
                    };
                    this.m_target.addLastRS(this);
                };
            };
        }

        public function stop():void
        {
            var _local_1:ElementViewHead;
            var _local_2:ShadowElement;
            if (this.m_initSource){
                _local_1 = ElementViewHead(this.m_target.target.getView());
                _local_2 = this.m_target.target.getElementshadow();
                if (this.m_sourceHead){
                    _local_1.setHeadVisible(true);
                };
                if (_local_2 != null){
                    _local_2.getDisplay().visible = true;
                };
                this.m_initSource = false;
            };
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_HIDE_VIEW);
        }

        public /*  ©init. */ function _SafeStr_1237()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1237 = " TargetHideViewScript" (String#17270)


