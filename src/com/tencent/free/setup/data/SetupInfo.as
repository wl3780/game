package com.tencent.free.setup.data
{
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;

    public class SetupInfo 
    {

        public var root:Sprite;
        public var configURL:String;
        public var configValueType:String = "default";
        public var globalDefs:Array;
        public var contextMenuItems:Array;
        public var stageScaleMode:String = StageScaleMode.NO_SCALE;
        public var stageAlign:String = StageAlign.TOP_LEFT;
        public var stageWidth:int = 0;
        public var stageHeight:int = 0;
        public var classGlobalLoader:Class;
        public var classConfLoader:Class;
        public var classLibLoader:Class;
        public var defFlashVars:Array;

        public function SetupInfo(url:String, root:Sprite=null)
        {
            this.configURL = url;
            this.root = root;
        }

    }
}
