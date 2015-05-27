// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallShopPanelArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_190;

    public class CallShopPanelArg implements IXMLSerialize 
    {

        public static const MODE_DUP_NPC:String = "modeNpc";
        public static const MODE_CITY_NPC:String = "modeCityNpc";
        public static const MODE_HIDE:String = "modeHide";

        public var mode:String;
        public var npcID:int;

        public function CallShopPanelArg(_arg_1:String="modeHide", _arg_2:int=0)
        {
            this.mode = _arg_1;
            this.npcID = _arg_2;
        }

        public function decode(_arg_1:XML):void
        {
            this.mode = String(_arg_1.@mode);
            this.npcID = int(_arg_1.@npcID);
        }

        public function encode()
        {
            var _local_1:XML = <PluginArg/>
            ;
            _local_1.@mode = this.mode;
            _local_1.@npcID = this.npcID;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_190()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_190 = " CallShopPanelArg" (String#17189)


