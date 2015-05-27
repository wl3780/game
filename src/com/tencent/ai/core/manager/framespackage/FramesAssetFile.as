// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.framespackage.FramesAssetFile

package com.tencent.ai.core.manager.framespackage
{
    import com.tencent.ai.core.asset.config.FramesAsset;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.asset.config.FrameInfo;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_660;

    public class FramesAssetFile 
    {

        public var config:FramesAsset;
        public var frameFiles:Dictionary;

        public function FramesAssetFile(_arg_1:FramesAsset)
        {
            this.config = _arg_1;
            this.frameFiles = new Dictionary();
        }

        public function build(_arg_1:Dictionary):void
        {
            var _local_5:FrameInfo;
            var _local_6:BDFile;
            var _local_7:FrameFile;
            var _local_2:Vector.<FrameInfo> = this.config.frameInfos;
            var _local_3:int = _local_2.length;
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = _local_2[_local_4];
                _local_6 = _arg_1[_local_5.refBD];
                if (_local_6 != null){
                    _local_7 = new FrameFile(_local_5);
                    _local_7.build(_local_6);
                    this.frameFiles[_local_7.id] = _local_7;
                };
                _local_4++;
            };
        }

        public function unbuild():void
        {
            var _local_1:FrameFile;
            for each (_local_1 in this.frameFiles) {
                _local_1.unbuild();
            };
            this.frameFiles = null;
            this.config = null;
        }

        public function getFrameFile(_arg_1:int):FrameFile
        {
            return (this.frameFiles[_arg_1]);
        }

        public /*  ©init. */ function _SafeStr_660()
        {
        }


    }
}//package com.tencent.ai.core.manager.framespackage

// _SafeStr_660 = " FramesAssetFile" (String#16724)


