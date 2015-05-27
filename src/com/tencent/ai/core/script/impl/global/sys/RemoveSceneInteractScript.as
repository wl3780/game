// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.RemoveSceneInteractScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.enum.SceneLayerDef;
    import com.tencent.ai.core.interact.BaseInteractItem;
    import  ©init._SafeStr_1176;

    public class RemoveSceneInteractScript extends GlobalScript 
    {

        public function RemoveSceneInteractScript()
        {
            this.m_cmds = ScriptCmdDef.SC_REMOVE_SCENE_INTERACT;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_7:BaseElement;
            var _local_3:IScene = AICore.Runtime.currentScene;
            if (_local_3 == null){
                return;
            };
            var _local_4:ScriptArg = (_arg_2 as ScriptArg);
            var _local_5:int = int(_local_4.argStr);
            var _local_6:Array = _local_3.getElements(SceneLayerDef.LAYER_GROUND);
            for each (_local_7 in _local_6) {
                if ((((_local_7 is BaseInteractItem)) && ((_local_7.id == _local_5)))){
                    _local_3.destoryElement(_local_7);
                    break;
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1176()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1176 = " RemoveSceneInteractScript" (String#14513)


