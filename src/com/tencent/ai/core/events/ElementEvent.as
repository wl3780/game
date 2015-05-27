// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.ElementEvent

package com.tencent.ai.core.events
{
    import  ©init._SafeStr_534;

    public class ElementEvent extends BaseEvent 
    {

        public static const ON_ELEMENT_CLICK:String = "onElementClick";
        public static const ON_ELEMENT_DEAD:String = "onElementDead";
        public static const ON_ELEMENT_DISAPPEAR:String = "onElementDisappear";
        public static const ON_X_CHANGE:String = "onXChange";
        public static const ON_Z_CHANGE:String = "onZChange";
        public static const ON_Y_CHANGE:String = "onYChange";
        public static const ON_XZY_CHANGE:String = "onXZYChange";
        public static const ON_DIR_CHANGE:String = "onDirChange";
        public static const ON_PARENT_NULL:String = "onParentNull";
        public static const ON_GROUP_CHANGE:String = "onGroupChange";
        public static const ON_BEFORE_ATTACK:String = "onBeforeAttack";
        public static const ON_BEFORE_HURT:String = "onBeforeHurt";
        public static const ON_TICK:String = "onTick";

        public function ElementEvent(_arg_1:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.m_target = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_534()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_534 = " ElementEvent" (String#16070)


