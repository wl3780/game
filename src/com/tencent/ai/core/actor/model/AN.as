// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.model.AN

package com.tencent.ai.core.actor.model
{
    import flash.utils.Dictionary;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_36;

    public class AN 
    {

        public static const ABT_NUM:String = "num";
        public static const ABT_FLOAT:String = "float";
        public static const ABT_INT:String = "int";
        public static const ABT_BOOL:String = "bool";
        public static const M_X_RATE:String = "moveXRate";
        public static const M_Y_RATE:String = "moveYRate";
        public static const H_FLAG:String = "holdFlag";
        public static const H_X_RATE:String = "holdXRate";
        public static const INVINCIBLE:String = "invincible";
        public static const CAN_BE_CAUGHT:String = "canBeCaught";
        public static const FINAL_REDUCE_RATE:String = "finalReduceDmgRate";
        public static const ATTRIB:Dictionary = new Dictionary();

        public var type:int;
        public var attribName:String;
        public var attribType:String;
        public var attribBind:Boolean;
        public var attribValue:Object;
        public var ignore:Boolean;

        public function AN(_arg_1:int, _arg_2:String, _arg_3:String="num", _arg_4:Boolean=true)
        {
            this.type = _arg_1;
            this.attribName = _arg_2;
            this.attribType = (((_arg_3)!="") ? (_arg_3) : ABT_NUM);
            this.attribBind = _arg_4;
            this.ignore = false;
        }

        public function getValue(_arg_1:Object):Number
        {
            switch (this.attribType){
                case ABT_NUM:
                    return (Number(_arg_1));
                case ABT_FLOAT:
                    return (DEFINE.CAST_FLOAT(int(_arg_1)));
                default:
                    return (int(_arg_1));
            };
        }

        public /*  ©init. */ function _SafeStr_36()
        {
        }


    }
}//package com.tencent.ai.core.actor.model

// _SafeStr_36 = " AN" (String#17486)


