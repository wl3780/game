// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.BubbleScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.element.MovementElement;
    import com.tencent.ai.core.data.arg.script.BubbleArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.enum.BubbleType;
    import  ©init._SafeStr_1186;

    public class BubbleScript extends GlobalScript 
    {


        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:MovementElement;
            var _local_3:BubbleArg = (_arg_2 as BubbleArg);
            switch (_local_3.eleType){
                case ElementType.ET_NPC:
                    _local_4 = AICore.Runtime.currentContext.getNpcManager().getNpcBy(_local_3.eleID);
                    break;
                case ElementType.ET_PLAYER:
                    _local_4 = AICore.Runtime.currentContext.getPlayerManager().getPlayerByPlayerID(AICore.data.mainModel.playerInfo.playerID);
                    break;
                case ElementType.ET_MONSTER:
                    _local_4 = AICore.Runtime.currentContext.getMonsterManager().getMonsterByID(_local_3.eleID);
                    break;
                case ElementType.ET_PET:
                    _local_4 = AICore.Runtime.currentContext.getPetManager().getPetByPlayer(AICore.data.mainModel.playerInfo.playerID);
                    break;
            };
            if (_local_4){
                AICore.bubble.popUp(_local_4, BubbleType.ANY_BUBBLE, _local_3.url, _local_3.time);
            };
        }

        public /*  ©init. */ function _SafeStr_1186()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1186 = " BubbleScript" (String#16226)


