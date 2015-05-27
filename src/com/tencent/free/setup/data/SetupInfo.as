// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.setup.data.SetupInfo

package com.tencent.free.setup.data
{
    import flash.display.Sprite;
    import  ©init._SafeStr_57;

    public class SetupInfo 
    {

        public var root:Sprite;
        public var configURL:String;
        public var configValueType:String = "default";
        public var globalDefs:Array;
        public var contextMenuItems:Array;
        public var stageScaleMode:String = "noScale";
        public var stageAlign:String = "TL";
        public var stageWidth:int = 0;
        public var stageHeight:int = 0;
        public var classGlobalLoader:Class;
        public var classConfLoader:Class;
        public var classLibLoader:Class;
        public var defFlashVars:Array;

        public function SetupInfo(_arg_1:String, _arg_2:Sprite=null)
        {
            this.configURL = _arg_1;
            this.root = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_57()
        {
        }


    }
}//package com.tencent.free.setup.data

// _SafeStr_57 = " SetupInfo" (String#1544)


