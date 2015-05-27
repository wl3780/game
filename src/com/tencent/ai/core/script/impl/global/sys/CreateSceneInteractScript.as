// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.CreateSceneInteractScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.CreateInteractArg;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.InteractItemInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.enum.ElementType;
    import  ©init._SafeStr_1165;

    public class CreateSceneInteractScript extends GlobalScript 
    {

        public function CreateSceneInteractScript()
        {
            m_cmds = ScriptCmdDef.SC_CREATE_SCENE_INTERACT;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:CreateInteractArg;
            var _local_5:MapPosition;
            var _local_6:InteractItemInfo;
            var _local_7:int;
            var _local_3:IScene = AICore.Runtime.currentScene;
            if (_local_3 != null){
                _local_4 = (_arg_2 as CreateInteractArg);
                _local_5 = new MapPosition();
                _local_6 = new InteractItemInfo();
                _local_6.id = _local_4.id;
                _local_6.interactItemID = _local_4.interactItemID;
                _local_6.groupID = _local_4.groupID;
                _local_6.amityGroupID = (((_local_4.bindGroupID == -1)) ? _local_4.groupID : _local_4.bindGroupID);
                _local_7 = (((_local_4.dir == 0)) ? Direction.RIGHT : _local_7);
                _local_6.direction = _local_7;
                _local_6.location = _local_5;
                _local_6.delayFrames = _local_4.delayFrames;
                _local_6.rotation = _local_4.rotation;
                _local_6.rRotation = _local_4.rRotation;
                _local_6.tingeInfo = _local_4.tingeInfo;
                _local_5.x = (_local_4.offsetX * _local_7);
                _local_5.y = _local_4.offsetY;
                _local_5.z = _local_4.offsetZ;
                _local_5.deepOffset = _local_4.offsetDeep;
                _local_3.createElement(ElementType.ET_INTERACT, _local_6);
            };
        }

        public /*  ©init. */ function _SafeStr_1165()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1165 = " CreateSceneInteractScript" (String#14402)


