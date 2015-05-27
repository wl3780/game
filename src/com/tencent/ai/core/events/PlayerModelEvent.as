// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.PlayerModelEvent

package com.tencent.ai.core.events
{
    import  ©init._SafeStr_554;

    public class PlayerModelEvent extends BaseEvent 
    {

        public static const ON_AVATAR_UPDATE:String = "onAvatarUpdate";
        public static const ON_TEAM_TAG_INFO_CHANGE:String = "onTeamTagInfoChange";
        public static const ON_NAME_UPDATE:String = "onChangeName";
        public static const ON_PAY_DATA_UPDATE:String = "onPayDataUpdate";

        public function PlayerModelEvent(_arg_1:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.m_target = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_554()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_554 = " PlayerModelEvent" (String#16994)


