// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.PlaySoundScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.sound.ISoundManager;
    import com.tencent.ai.core.sound.ISoundSource;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.arg.script.PlaySoundScriptArg;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_1173;

    public class PlaySoundScript extends GlobalScript 
    {

        protected var m_sound:ISoundManager;
        protected var m_source:ISoundSource;

        public function PlaySoundScript()
        {
            m_cmds = ScriptCmdDef.SC_PLAY_SOUND;
        }

        override public function setTarget(_arg_1:Object):void
        {
            super.setTarget(_arg_1);
            if ((_arg_1 is ITarget)){
                this.m_source = ITarget(_arg_1).target;
            } else {
                if ((_arg_1 is ISoundSource)){
                    this.m_source = ISoundSource(_arg_1);
                } else {
                    this.m_source = null;
                };
            };
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            if (this.m_sound == null){
                this.m_sound = AICore.sound;
            };
            var _local_3:PlaySoundScriptArg = PlaySoundScriptArg(_arg_2);
            var _local_4:int = this.m_sound.play(_local_3.soundPackageID, _local_3.howMany, _local_3.startTime, _local_3.volume, (_local_3.delayFrames * DEFINE.TPF), this.m_source, _local_3.followSource);
            if (_local_3.actionStop){
                if (this.m_source != null){
                    this.m_source.playingSounds.push(_local_4);
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1173()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1173 = " PlaySoundScript" (String#15653)


