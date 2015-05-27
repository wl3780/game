// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.PetEvent

package com.tencent.ai.core.events
{
    import  ©init._SafeStr_552;

    public class PetEvent extends BaseEvent 
    {

        public static const ON_PET_ADDED:String = "onPetAdded";
        public static const ON_PET_REMOVED:String = "onPetRemoved";
        public static const CHANGE_PET_PACK:String = "changePetPack";
        public static const CHANGE_PET_STORAGE:String = "changePetStorage";
        public static const CHANGE_PET_FOLLOW:String = "changePetFollow";
        public static const CHANGE_PET_HUNGRY:String = "changePetHungry";
        public static const ERROR_CHANGE_PET_FOLLOW:String = "errorChangePetFollow";
        public static const CHANGE_DEFAULT_ITEM:String = "changeDefaultItem";
        public static const CHANGE_EXP:String = "changeExp";
        public static const EVOLE:String = "evole";
        public static const PET_UPDATE:String = "petUpdate";
        public static const NEW_PET_PACK:String = "newPetPack";
        public static const NEW_PET_STORAGE:String = "newPetStorage";

        public var petSID:int;

        public function PetEvent(_arg_1:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.m_target = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_552()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_552 = " PetEvent" (String#14252)


