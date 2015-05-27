// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetCColorScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.render.IFrameListener;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.render.IElementView;
    import com.tencent.ai.core.render.ColorStyle;
    import com.tencent.ai.core.data.arg.script.CColorScriptArg;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1234;

    public class TargetCColorScript implements IScript, IFrameListener 
    {

        protected var m_target:ITarget;
        protected var m_view:IElementView;
        protected var m_colorStyle:ColorStyle;
        protected var m_arg:CColorScriptArg;
        protected var m_times:int;
        protected var m_ColorChanging:Boolean;
        private var _colorUpdate:Boolean;
        private var _updateTimes:int;
        private var _updateIndex:int;
        private var _udpateSize:int;
        private var _listen:Boolean;

        public function TargetCColorScript()
        {
            this.m_ColorChanging = false;
            this.m_times = 0;
            this._listen = false;
            this._colorUpdate = false;
        }

        public function onFrameEvent(_arg_1:String):void
        {
            this.m_times = (this.m_times - 1);
            if (this._colorUpdate){
                this._updateTimes--;
                if (this._updateTimes <= 0){
                    this._updateTimes = this.m_arg.itvTimes;
                    this.m_view.setBodyColorStyle(this.m_colorStyle, false);
                    this._updateIndex++;
                    this.m_colorStyle = this.m_arg.styles[(this._updateIndex % this._udpateSize)];
                    this.m_view.setBodyColorStyle(this.m_colorStyle, true);
                };
            };
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
            var _local_3:CColorScriptArg = CColorScriptArg(_arg_2);
            this.m_times = _local_3.times;
            if (!this.m_ColorChanging){
                this.m_ColorChanging = true;
                if (this.m_view == null){
                    this.m_view = this.m_target.view;
                };
                if (this.m_times > 0){
                    this.m_view.addFrameListener(MotionDef.L_ENTER_FRAME, this);
                    this._listen = true;
                };
                this.m_target.addLastRS(this);
            };
            if (this.m_colorStyle != null){
                this.m_view.setBodyColorStyle(this.m_colorStyle, false);
            };
            this.m_colorStyle = _local_3.styles[0];
            this.m_arg = _local_3;
            this._udpateSize = this.m_arg.styles.length;
            this._updateTimes = this.m_arg.itvTimes;
            if ((((this._updateTimes > 0)) && ((this._udpateSize > 1)))){
                this._colorUpdate = true;
                this._updateIndex = 0;
            };
            this.m_view.setBodyColorStyle(this.m_colorStyle, true);
        }

        public function stop():void
        {
            if (this.m_ColorChanging){
                if (this._listen){
                    this.m_view.removeFrameListener(MotionDef.L_ENTER_FRAME, this);
                    this._listen = false;
                };
                this._colorUpdate = false;
                this.m_times = 0;
                this.m_arg = null;
                this.m_view.setBodyColorStyle(this.m_colorStyle, false);
                this.m_colorStyle = null;
                this.m_ColorChanging = false;
            };
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_CCOLOR);
        }

        public /*  ©init. */ function _SafeStr_1234()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1234 = " TargetCColorScript" (String#17417)


