// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.events.FreeEvent

package com.tencent.free.core.events
{
    import flash.events.Event;
    import  ©init._SafeStr_6;

    public class FreeEvent extends Event 
    {

        public static const ON_BEFORE_PLUGIN_LOAD:String = "onBeforePluginLoad";
        public static const PLUGIN_INSTALL_COMPLETE:String = "pluginInstallComplete";
        public static const PLUGIN_INSTALL_ERROR:String = "pluginInstallError";
        public static const PLUGIN_INSTALL_PROGRESS:String = "pluginInstallProgress";
        public static const ON_AFTER_CMD_CALL:String = "onAfterCmdCall";

        public var data:Object;
        public var message:String;

        public function FreeEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public /*  ©init. */ function _SafeStr_6()
        {
        }


    }
}//package com.tencent.free.core.events

// _SafeStr_6 = " FreeEvent" (String#1391)


