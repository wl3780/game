// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.model.OpAttribItem

package com.tencent.ai.core.actor.model
{
    import  ©init._SafeStr_38;

    public class OpAttribItem 
    {

        public static const PRIORITY_HIGHT:int = 10000;
        public static const PRIORITY_MIDDLE:int = 5000;
        public static const PRIORITY_LOW:int = 0;

        public var name:String;
        public var index:int;
        public var priority:int;
        protected var m_sourceValue:Object;

        public function OpAttribItem(_arg_1:String="", _arg_2:int=0, _arg_3:int=0)
        {
            this.name = _arg_1;
            this.index = _arg_2;
            this.priority = _arg_3;
        }

        public function op(_arg_1:Attribute, _arg_2:Object):void
        {
            this.m_sourceValue = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_38()
        {
        }


    }
}//package com.tencent.ai.core.actor.model

// _SafeStr_38 = " OpAttribItem" (String#14519)


