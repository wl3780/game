// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.LandScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.enum.SoundDef;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1223;

    public class LandScript extends VirgationScript implements IScript 
    {

        private static var _LAND_EFFECT_INFO:EffectInfo;

        protected var m_landFunc:CFunction;


        override public function execVirgation(_arg_1:String, _arg_2:int):Boolean
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:MapPosition;
            var _local_9:IScene;
            var _local_10:int;
            var _local_3:int = m_target.environmentInfo.dustEffectID;
            var _local_4:HasActionElement = m_target.target;
            if (_local_3 != 0){
                if (_LAND_EFFECT_INFO == null){
                    _LAND_EFFECT_INFO = new EffectInfo();
                    _LAND_EFFECT_INFO.location = new MapPosition();
                };
                _LAND_EFFECT_INFO.eid = _local_3;
                _local_5 = (1 + int((DEFINE.RANDOM_FLOAT() * 2)));
                _local_6 = _local_4.mapX;
                _local_7 = _local_4.mapZ;
                _local_8 = _LAND_EFFECT_INFO.location;
                _local_9 = m_target.scene;
                _local_10 = 0;
                while (_local_10 < _local_5) {
                    _local_8.x = ((_local_6 + int((80 * DEFINE.RANDOM_FLOAT()))) - 40);
                    _local_8.z = ((_local_7 + int((4 * DEFINE.RANDOM_FLOAT()))) - 2);
                    _local_9.createElement(ElementType.ET_EFFECT, _LAND_EFFECT_INFO);
                    _local_10++;
                };
            };
            if (SoundDef.LAND_SOUND_ID != 0){
                AICore.sound.play(SoundDef.LAND_SOUND_ID, -1, 0, 100, 0, _local_4);
            };
            return (super.execVirgation(_arg_1, _arg_2));
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:ScriptArg = (_arg_2 as ScriptArg);
            if (this.m_landFunc == null){
                this.m_landFunc = new CFunction(this.execVirgation, this, []);
            };
            this.m_landFunc.params[0] = _local_3.argCmd;
            this.m_landFunc.params[1] = int(_local_3.argStr);
            m_target.landFunction = this.m_landFunc;
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_LAND);
        }

        public function stop():void
        {
        }

        public /*  ©init. */ function _SafeStr_1223()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1223 = " LandScript" (String#16892)


