// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.config.MotionTemplate

package com.tencent.ai.core.asset.config
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_59;
    import __AS3__.vec.*;

    public class MotionTemplate implements IXMLSerialize 
    {

        public var motionID:int;
        public var assetID:int;
        public var name:String;
        public var frameLabels:Dictionary;
        public var totalFrame:int;
        public var frameRefs:Vector.<FrameRef>;
        public var offsetX:int = 0;
        public var offsetY:int = 0;


        public function decode(_arg_1:XML):void
        {
            var _local_4:XMLList;
            var _local_5:int;
            var _local_6:int;
            var _local_7:XML;
            var _local_8:FrameRef;
            this.motionID = int(_arg_1.@motionID);
            this.name = String(_arg_1.@name);
            this.assetID = int(_arg_1.@assetID);
            this.offsetX = int(_arg_1.@offsetX);
            this.offsetY = int(_arg_1.@offsetY);
            var _local_2:XML = _arg_1.Labels[0];
            if (_local_2 != null){
                this.frameLabels = new Dictionary();
                _local_4 = _local_2.Label;
                _local_5 = _local_4.length();
                _local_6 = 0;
                while (_local_6 < _local_5) {
                    _local_7 = _local_4[_local_6];
                    this.frameLabels[String(_local_7.@text)] = int(_local_7.@index);
                    _local_6++;
                };
            };
            var _local_3:XMLList = _arg_1.TimeLine[0].FrameRef;
            this.totalFrame = _local_3.length();
            this.frameRefs = new Vector.<FrameRef>();
            _local_6 = 0;
            while (_local_6 < this.totalFrame) {
                _local_8 = new FrameRef();
                _local_8.decode(_local_3[_local_6]);
                this.frameRefs.push(_local_8);
                _local_6++;
            };
        }

        public function encode()
        {
            var _local_1:XML = <MotionTemplate/>
            ;
            _local_1.@name = this.name;
            _local_1.@assetID = this.assetID;
            _local_1.@motionID = this.motionID;
            _local_1.@offsetX = this.offsetX;
            _local_1.@offsetY = this.offsetY;
            var _local_2:XML = <TimeLine/>
            ;
            var _local_3:int = this.frameRefs.length;
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_2.appendChild(this.frameRefs[_local_4].encode());
                _local_4++;
            };
            _local_1.appendChild(_local_2);
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_59()
        {
        }


    }
}//package com.tencent.ai.core.asset.config

// _SafeStr_59 = " MotionTemplate" (String#16433)


