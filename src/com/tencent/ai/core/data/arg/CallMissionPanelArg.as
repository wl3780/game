// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallMissionPanelArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_184;

    public class CallMissionPanelArg implements IXMLSerialize 
    {

        public static const Type_Main:int = 1;
        public static const Type_Week:int = 2;
        public static const Type_Day:int = 3;
        public static const Type_COMPLETET:int = 4;
        public static const Type_Challenge:int = 5;
        public static const Type_X:int = 6;
        public static const AUTO:int = 0;
        public static const SHOW:int = 1;
        public static const HIDE:int = 2;

        public var whichPanel:int;
        public var showOrHide:int;

        public function CallMissionPanelArg(_arg_1:int=0, _arg_2:int=0)
        {
            this.whichPanel = _arg_1;
            this.showOrHide = _arg_2;
        }

        public function decode(_arg_1:XML):void
        {
            this.whichPanel = int(_arg_1.@whichPanel);
            this.showOrHide = int(_arg_1.@showOrHide);
        }

        public function encode()
        {
            var _local_1:XML = <PluginArg/>
            ;
            _local_1.@whichPanel = this.whichPanel;
            _local_1.@showOrHide = this.showOrHide;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_184()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_184 = " CallMissionPanelArg" (String#14165)


