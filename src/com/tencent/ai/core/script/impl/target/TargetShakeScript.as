// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetShakeScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.render.IFrameListener;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.render.IElementView;
    import com.tencent.ai.core.display.IDisplay;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.data.arg.script.ShakeScriptArg;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1244;

    public class TargetShakeScript implements IScript, IFrameListener 
    {

        protected var m_target:ITarget;
        protected var m_view:IElementView;
        protected var m_bodyDisplay:IDisplay;
        protected var m_isShaking:Boolean;
        protected var m_shakeTime:int;
        protected var m_shakeXR:int;
        protected var m_shakeYR:int;
        protected var m_x:int;
        protected var m_y:int;

        public function TargetShakeScript()
        {
            this.m_isShaking = false;
            this.m_shakeTime = 0;
            this.m_target = null;
            this.m_shakeXR = 0;
            this.m_shakeYR = 0;
        }

        public function onFrameEvent(_arg_1:String):void
        {
            this.m_shakeTime = (this.m_shakeTime - 1);
            if (this.m_shakeTime <= 0){
                this.m_bodyDisplay.x = this.m_x;
                this.m_bodyDisplay.y = this.m_y;
                this.m_isShaking = false;
                this.m_view.removeFrameListener(MotionDef.L_ENTER_FRAME, this);
            } else {
                this.m_shakeXR = (this.m_shakeXR * -1);
                this.m_shakeYR = (this.m_shakeYR * -1);
                this.m_bodyDisplay.x = (this.m_x + this.m_shakeXR);
                this.m_bodyDisplay.y = (this.m_y + this.m_shakeYR);
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
            var _local_3:ShakeScriptArg = ShakeScriptArg(_arg_2);
            var _local_4:int = _local_3.shakeR;
            var _local_5:int = _local_3.shakeDir;
            this.m_shakeXR = ((((_local_5 & 1))!=0) ? _local_4 : 0);
            this.m_shakeYR = ((((_local_5 & 2))!=0) ? _local_4 : 0);
            this.m_shakeTime = _local_3.shakeTimes;
            if (!this.m_isShaking){
                if (this.m_view == null){
                    this.m_view = this.m_target.view;
                    this.m_bodyDisplay = this.m_view.getBodyDisplay();
                    this.m_x = this.m_bodyDisplay.x;
                    this.m_y = this.m_bodyDisplay.y;
                };
                this.m_view.addFrameListener(MotionDef.L_ENTER_FRAME, this);
                this.m_isShaking = true;
            };
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_SHAKE);
        }

        public /*  ©init. */ function _SafeStr_1244()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1244 = " TargetShakeScript" (String#15167)


