// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetCBlurScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.render.IFrameListener;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.render.IElementView;
    import com.tencent.ai.core.render.BlurStyle;
    import com.tencent.ai.core.data.arg.script.CBlurScriptArg;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1233;

    public class TargetCBlurScript implements IScript, IFrameListener 
    {

        protected var m_target:ITarget;
        protected var m_view:IElementView;
        protected var m_blurStyle:BlurStyle;
        protected var m_times:int;
        protected var m_BlurChanging:Boolean;

        public function TargetCBlurScript()
        {
            this.m_BlurChanging = false;
            this.m_times = 0;
        }

        public function onFrameEvent(_arg_1:String):void
        {
            this.m_times = (this.m_times - 1);
            if (this.m_times <= 0){
                this.m_target.removeLastRs(this);
                this.stop();
            };
        }

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
            var _local_3:CBlurScriptArg = CBlurScriptArg(_arg_2);
            if (!this.m_BlurChanging){
                this.m_BlurChanging = true;
                if (this.m_view == null){
                    this.m_view = this.m_target.view;
                };
                this.m_view.addFrameListener(MotionDef.L_ENTER_FRAME, this);
                this.m_target.addLastRS(this);
            };
            if (this.m_blurStyle != null){
                this.m_view.setBodyBlurStyle(this.m_blurStyle, false);
            };
            this.m_blurStyle = _local_3.style;
            this.m_view.setBodyBlurStyle(this.m_blurStyle, true);
            this.m_times = _local_3.times;
        }

        public function stop():void
        {
            if (this.m_BlurChanging){
                this.m_view.setBodyBlurStyle(this.m_blurStyle, false);
                this.m_view.removeFrameListener(MotionDef.L_ENTER_FRAME, this);
                this.m_blurStyle = null;
                this.m_BlurChanging = false;
            };
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_CBLUR);
        }

        public /*  ©init. */ function _SafeStr_1233()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1233 = " TargetCBlurScript" (String#16328)


