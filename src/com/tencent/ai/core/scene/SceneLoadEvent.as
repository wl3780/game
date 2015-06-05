package com.tencent.ai.core.scene
{
    import com.tencent.ai.core.events.BaseEvent;
    
    import flash.events.Event;

    public class SceneLoadEvent extends BaseEvent 
    {

        public static const COMPLETE:String = "complete";
        public static const ERROR:String = "error";
        public static const LOAD_PROESS:String = "loadProess";

        public var sceneID:int;
        public var totalItem:int;
        public var loadedItem:int;
        public var errorMessage:String;

        public function SceneLoadEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
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

    }
}
