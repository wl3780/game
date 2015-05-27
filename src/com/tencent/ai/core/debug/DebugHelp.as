// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.debug.DebugHelp

package com.tencent.ai.core.debug
{
    import flash.utils.Dictionary;
    import  ©init._SafeStr_362;

    public class DebugHelp 
    {

        public static const DEBUG_NAME_ASSET_PREPARE:String = "AssetPrepare";
        public static var _DEBUG_REF_OBJS:Dictionary = new Dictionary();


        public static function REGISTER(_arg_1:String, _arg_2:Object):void
        {
            _DEBUG_REF_OBJS[_arg_1] = _arg_2;
        }

        public static function UNREGISTER(_arg_1:String):void
        {
            delete _DEBUG_REF_OBJS[_arg_1];
        }

        public static function GET_REF_OBJ(_arg_1:String):Object
        {
            return (_DEBUG_REF_OBJS[_arg_1]);
        }


        public /*  ©init. */ function _SafeStr_362()
        {
        }


    }
}//package com.tencent.ai.core.debug

// _SafeStr_362 = " DebugHelp" (String#17618)


