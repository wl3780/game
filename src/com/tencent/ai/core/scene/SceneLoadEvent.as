// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.SceneLoadEvent

package com.tencent.ai.core.scene
{
    import com.tencent.ai.core.events.BaseEvent;
    import flash.events.Event;
    import  ©init._SafeStr_1143;

    public class SceneLoadEvent extends BaseEvent 
    {

        public static const COMPLETE:String = "complete";
        public static const ERROR:String = "error";
        public static const LOAD_PROESS:String = "loadProess";

        public var sceneID:int;
        public var totalItem:int;
        public var loadedItem:int;
        public var errorMessage:String;

        public function SceneLoadEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override public function clone():Event
        {
            super.clone();
            var _local_1:SceneLoadEvent = new SceneLoadEvent(this.type);
            _local_1.sceneID = this.sceneID;
            _local_1.totalItem = this.totalItem;
            _local_1.loadedItem = this.loadedItem;
            _local_1.errorMessage = this.errorMessage;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_1143()
        {
        }


    }
}//package com.tencent.ai.core.scene

// _SafeStr_1143 = " SceneLoadEvent" (String#17195)


