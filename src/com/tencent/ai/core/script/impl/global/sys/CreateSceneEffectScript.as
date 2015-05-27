// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.CreateSceneEffectScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.arg.script.CreateEffectArg;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.enum.ElementType;
    import  ©init._SafeStr_1164;

    public class CreateSceneEffectScript extends GlobalScript 
    {

        public function CreateSceneEffectScript()
        {
            m_cmds = ScriptCmdDef.SC_CREATE_SCENE_EFFECT;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:IScene = AICore.Runtime.currentScene;
            if (_local_3 == null){
                return;
            };
            var _local_4:MapPosition = new MapPosition();
            var _local_5:CreateEffectArg = (_arg_2 as CreateEffectArg);
            _local_4.x = _local_5.offsetX;
            _local_4.y = _local_5.offsetY;
            _local_4.z = _local_5.offsetZ;
            _local_4.deepOffset = _local_5.offsetDeep;
            var _local_6:EffectInfo = new EffectInfo();
            _local_6.eid = _local_5.effectID;
            _local_6.motionID = _local_5.motionID;
            _local_6.location = _local_4;
            _local_6.scaleX = _local_5.scaleX;
            _local_6.scaleY = _local_5.scaleY;
            _local_6.direction = (((_local_5.dir == 0)) ? Direction.RIGHT : _local_5.dir);
            _local_6.rotation = _local_5.rotation;
            _local_6.tingeInfo = _local_5.tingeInfo;
            _local_3.createElement(ElementType.ET_EFFECT, _local_6);
        }

        public /*  ©init. */ function _SafeStr_1164()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1164 = " CreateSceneEffectScript" (String#16817)


