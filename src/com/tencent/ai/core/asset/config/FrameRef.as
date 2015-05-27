// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.config.FrameRef

package com.tencent.ai.core.asset.config
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.RectArea;
    import com.tencent.ai.core.data.ScriptInfo;
    import  ©init._SafeStr_54;
    import com.tencent.ai.core.utils.*;

    public class FrameRef implements IXMLSerialize 
    {

        public var refAsset:int;
        public var refID:int;
        public var offsetX:int;
        public var offsetY:int;
        public var alpha:Number;
        public var dAlpha:Number;
        public var rotation:int;
        public var scaleX:Number;
        public var scaleY:Number;
        public var times:int;
        public var eventType:String;
        public var fireEventTime:int;
        public var scripts:Array;
        public var ac:RectArea;
        public var hcs:Array;
        public var usePlayRate:Boolean;


        protected function decodeRects(_arg_1:XML):void
        {
            var _local_5:RectArea;
            var _local_2:XMLList = _arg_1.RectArea;
            var _local_3:int = _local_2.length();
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = new RectArea();
                _local_5.decode(_local_2[_local_4]);
                if (_local_5.type == "ac"){
                    this.ac = _local_5;
                } else {
                    if (this.hcs == null){
                        this.hcs = [];
                    };
                    this.hcs.push(_local_5);
                };
                _local_4++;
            };
        }

        public function decode(_arg_1:XML):void
        {
            var _local_5:int;
            var _local_6:ScriptInfo;
            var _local_2:String = _arg_1.@asset;
            if (_local_2 != ""){
                this.refAsset = int(_local_2);
            } else {
                this.refAsset = -1;
            };
            this.refID = int(_arg_1.@id);
            this.times = int(_arg_1.@times);
            this.offsetX = int(_arg_1.@offsetX);
            this.offsetY = int(_arg_1.@offsetY);
            if (_arg_1.hasOwnProperty("@alpha")){
                this.alpha = Number(_arg_1.@alpha);
            } else {
                this.alpha = 1;
            };
            this.dAlpha = Number(_arg_1.@dAlpha);
            this.rotation = int(_arg_1.@rotation);
            if (_arg_1.hasOwnProperty("@scaleX")){
                this.scaleX = Number(_arg_1.@scaleX);
                this.scaleY = Number(_arg_1.@scaleY);
            } else {
                this.scaleX = 1;
                this.scaleY = 1;
            };
            this.eventType = String(_arg_1.@event);
            if (this.eventType != ""){
                this.fireEventTime = int(_arg_1.@fireTime);
                if (this.fireEventTime == 0){
                    this.fireEventTime = -1;
                };
            } else {
                this.fireEventTime = -1;
            };
            this.decodeRects(_arg_1);
            var _local_3:XMLList = _arg_1.Script;
            var _local_4:int = _local_3.length();
            if (_local_4 > 0){
                this.scripts = [];
                _local_5 = 0;
                while (_local_5 < _local_4) {
                    _local_6 = new ScriptInfo();
                    _local_6.decode(_local_3[_local_5]);
                    this.scripts.push(_local_6);
                    _local_5++;
                };
            };
            this.usePlayRate = !((String(_arg_1.@usePlayRate) == "no"));
        }

        public function encode()
        {
            var _local_1:int;
            var _local_2:int;
            var _local_4:ScriptInfo;
            var _local_3:XML = <FrameRef/>
            ;
            _local_3.@asset = this.refAsset;
            _local_3.@id = this.refID;
            _local_3.@times = this.times;
            _local_3.@offsetX = this.offsetX;
            _local_3.@offsetY = this.offsetY;
            _local_3.@alpha = this.alpha;
            _local_3.@dAlpha = this.dAlpha;
            _local_3.@rotation = this.rotation;
            _local_3.@scaleX = this.scaleX;
            _local_3.@scaleY = this.scaleY;
            if (this.eventType != null){
                _local_3.@event = this.eventType;
                _local_3.@fireTime = this.fireEventTime;
            };
            if (this.ac != null){
                _local_3.appendChild(this.ac.encode());
            };
            if (this.hcs != null){
                _local_1 = this.hcs.length;
                _local_2 = 0;
                while (_local_2 < _local_1) {
                    _local_3.appendChild(this.hcs[_local_2].encode());
                    _local_2++;
                };
            };
            if (((!((this.scripts == null))) && ((this.scripts.length > 0)))){
                _local_1 = this.scripts.length;
                _local_2 = 0;
                while (_local_2 < _local_1) {
                    _local_4 = this.scripts[_local_2];
                    _local_3.appendChild(_local_4.encode());
                    _local_2++;
                };
            };
            _local_3.@usePlayRate = ((this.usePlayRate) ? "yes" : "no");
            return (_local_3);
        }

        public /*  ©init. */ function _SafeStr_54()
        {
        }


    }
}//package com.tencent.ai.core.asset.config

// _SafeStr_54 = " FrameRef" (String#17693)


