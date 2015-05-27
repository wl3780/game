// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.framespackage.FrameFile

package com.tencent.ai.core.manager.framespackage
{
    import com.tencent.ai.core.asset.config.FrameInfo;
    import flash.display.BitmapData;
    import  ©init._SafeStr_659;

    public class FrameFile 
    {

        public var id:int;
        public var name:String;
        public var config:FrameInfo;
        public var bitmapData:BitmapData;

        public function FrameFile(_arg_1:FrameInfo)
        {
            this.id = _arg_1.id;
            this.name = _arg_1.name;
            this.config = _arg_1;
        }

        public function build(_arg_1:BDFile):void
        {
            this.bitmapData = _arg_1.cutBitmapData(this.config.sourceRect);
        }

        public function unbuild():void
        {
            this.id = 0;
            this.name = "";
            this.config = null;
            if (this.bitmapData != null){
                this.bitmapData.dispose();
                this.bitmapData = null;
            };
        }

        public /*  ©init. */ function _SafeStr_659()
        {
        }


    }
}//package com.tencent.ai.core.manager.framespackage

// _SafeStr_659 = " FrameFile" (String#13760)


