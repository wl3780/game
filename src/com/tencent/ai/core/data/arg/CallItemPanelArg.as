// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallItemPanelArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.data.PlayerID;
    import  ©init._SafeStr_181;

    public class CallItemPanelArg implements IXMLSerialize 
    {

        public static const MODE_PACKAGE:String = "modePackage";
        public static const MODE_PACKAGE_EQUIP_ROLE:String = "modePackageEquipRole";
        public static const MODE_ROLE:String = "modeRole";
        public static const MODE_PVP:String = "modePvp";
        public static const MODE_EQUIP:String = "modeEquip";
        public static const MODE_CAREERWEAR:String = "modeCareerwear";
        public static const MODE_HIDE:String = "modeHide";
        public static const MODE_OTHER_PLAYER:String = "modeOtherPlayer";
        public static const AUTO:int = 0;
        public static const SHOW:int = 1;
        public static const HIDE:int = 2;

        public var mode:String;
        public var showOrHide:int;
        public var playerID:PlayerID;
        public var needCenter:Boolean;
        public var itemKind:int = -1;
        public var itemType:int = -1;

        public function CallItemPanelArg(_arg_1:String="modeHide", _arg_2:int=0, _arg_3:Boolean=true)
        {
            this.mode = _arg_1;
            this.showOrHide = _arg_2;
            this.needCenter = _arg_3;
        }

        public function decode(_arg_1:XML):void
        {
            this.mode = String(_arg_1.@mode);
        }

        public function encode()
        {
            var _local_1:XML = <PluginArg/>
            ;
            _local_1.@mode = this.mode;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_181()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_181 = " CallItemPanelArg" (String#14204)


