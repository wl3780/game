// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.config.FramesAsset

package com.tencent.ai.core.asset.config
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_55;
    import __AS3__.vec.*;

    public class FramesAsset implements IXMLSerialize 
    {

        public var id:int;
        public var name:String;
        public var frameInfos:Vector.<FrameInfo>;


        public function decode(_arg_1:XML):void
        {
            var _local_4:FrameInfo;
            var _local_6:FrameInfo;
            this.id = int(_arg_1.@id);
            this.name = String(_arg_1.@name);
            var _local_2:XMLList = _arg_1.FrameInfo;
            var _local_3:int = _local_2.length();
            this.frameInfos = new Vector.<FrameInfo>();
            var _local_5:int;
            while (_local_5 < _local_3) {
                _local_6 = new FrameInfo();
                _local_6.decode(_local_2[_local_5]);
                this.frameInfos.push(_local_6);
                _local_4 = _local_6;
                _local_5++;
            };
        }

        public function encode()
        {
            var _local_1:XML = <FramesAsset/>
            ;
            _local_1.@id = this.id;
            _local_1.@name = this.name;
            var _local_2:int = this.frameInfos.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_1.appendChild(this.frameInfos[_local_3].encode());
                _local_3++;
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_55()
        {
        }


    }
}//package com.tencent.ai.core.asset.config

// _SafeStr_55 = " FramesAsset" (String#15374)


