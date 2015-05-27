// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.CColorScriptArg

package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.render.ColorStyle;
    import com.tencent.ai.core.data.TingeInfo;
    import  ©init._SafeStr_119;
    import __AS3__.vec.*;

    public class CColorScriptArg extends ScriptArg 
    {

        public var times:int = 0;
        public var itvTimes:int = 0;
        public var styles:Array;

        public function CColorScriptArg(_arg_1:ColorStyle=null)
        {
            if (_arg_1 == null){
                _arg_1 = new ColorStyle(0, 1, 1, 1, 1, 0, 0, 0, 0, TingeInfo);
            };
            this.styles = [];
            this.styles[0] = _arg_1;
        }

        public function newStyle():ColorStyle
        {
            return (new ColorStyle(0, 1, 1, 1, 1, 0, 0, 0, 0, TingeInfo));
        }

        public function addDefaultStyle():void
        {
            this.styles.push(this.newStyle());
        }

        override public function decode(_arg_1:XML):void
        {
            var _local_5:XML;
            var _local_6:ColorStyle;
            super.decode(_arg_1);
            this.times = int(_arg_1.@times);
            this.itvTimes = int(_arg_1.@itvTimes);
            var _local_2:XMLList = _arg_1.Tinge;
            var _local_3:int = _local_2.length();
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = _local_2[_local_4];
                if (_local_4 == 0){
                    _local_6 = this.styles[0];
                } else {
                    _local_6 = new ColorStyle(0, 1, 1, 1, 1, 0, 0, 0, 0, TingeInfo);
                    this.styles.push(_local_6);
                };
                TingeInfo(_local_6.colorTF).decode(_local_5);
                _local_4++;
            };
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@times = this.times;
            _local_1.@itvTimes = this.itvTimes;
            var _local_2:int;
            while (_local_2 < this.styles.length) {
                _local_1.appendChild(TingeInfo(this.styles[_local_2].colorTF).encode());
                _local_2++;
            };
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:CColorScriptArg = (super.clone() as CColorScriptArg);
            _local_1.times = this.times;
            _local_1.itvTimes = this.itvTimes;
            _local_1.styles = new Vector.<ColorStyle>();
            var _local_2:int;
            while (_local_2 < this.styles.length) {
                _local_1.styles.push(this.styles[_local_2].clone());
                _local_2++;
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_119()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_119 = " CColorScriptArg" (String#15179)


