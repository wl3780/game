package com.tencent.ai.core.scene
{
    import flash.events.Event;

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

        public function ScenePrepareEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        }

    }
}
