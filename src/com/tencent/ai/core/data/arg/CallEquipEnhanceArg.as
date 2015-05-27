// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallEquipEnhanceArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_178;

    public class CallEquipEnhanceArg implements IXMLSerialize 
    {

        public static const EQUIP_ENHANCE:int = 1;
        public static const EQUIP_COMBIN:int = 2;
        public static const EQUIP_BREAK:int = 3;
        public static const EQUIP_MAKE:int = 4;
        public static const EQUIP_CUBE:int = 5;
        public static const EQUIP_BIT_SHOP:int = 6;
        public static const EQUIP_PVP_SHOP:int = 7;
        public static const EQUIP_CUBE_NEW:int = 8;
        public static const EQUIP_MOVE:int = 9;

        public var mode:int;
        public var data:Object;

        public function CallEquipEnhanceArg(_arg_1:int=1)
        {
            this.mode = _arg_1;
        }

        public function decode(_arg_1:XML):void
        {
            this.mode = _arg_1.@callType;
        }

        public function encode()
        {
            return ("");
        }

        public /*  ©init. */ function _SafeStr_178()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_178 = " CallEquipEnhanceArg" (String#13877)


