// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.actions.PlayerPickupAction

package com.tencent.ai.core.player.actions
{
    import com.tencent.ai.core.action.DynamicAction;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.enum.SoundDef;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_833;

    public class PlayerPickupAction extends DynamicAction 
    {

        public function PlayerPickupAction()
        {
            super(BaseActionIDDef.PICKUP);
        }

        override protected function activeAction():void
        {
            super.activeAction();
            var _local_1:int = SoundDef.PICKUP_MOTION_SOUND_ID;
            if (_local_1 != 0){
                AICore.sound.play(_local_1, -1, 0, 100, 0, m_target);
            };
        }

        public /*  ©init. */ function _SafeStr_833()
        {
        }


    }
}//package com.tencent.ai.core.player.actions

// _SafeStr_833 = " PlayerPickupAction" (String#15092)


