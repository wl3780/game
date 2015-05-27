// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.ScenePrepareEvent

package com.tencent.ai.core.scene
{
    import flash.events.Event;
    import  ©init._SafeStr_1146;

    public class ScenePrepareEvent extends Event 
    {

        public static const COMPLETE:String = "complete";
        public static const ERROR:String = "error";
        public static const LOAD_PROESS:String = "loadproess";

        public var sceneID:int;
        public var totalItem:int;
        public var loadedItem:int;
        public var bytesTotal:int;
        public var key:String;

        public function ScenePrepareEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public /*  ©init. */ function _SafeStr_1146()
        {
        }


    }
}//package com.tencent.ai.core.scene

// _SafeStr_1146 = " ScenePrepareEvent" (String#16919)


