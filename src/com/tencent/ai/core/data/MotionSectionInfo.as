// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.MotionSectionInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_280;

    public class MotionSectionInfo implements IXMLSerialize 
    {

        public var beginFrameIndex:int;
        public var endFrameIndex:int;
        public var externalScripts:Array;


        public function decode(_arg_1:XML):void
        {
            var _local_4:int;
            var _local_5:XML;
            this.beginFrameIndex = int(_arg_1.@begin);
            this.endFrameIndex = int(_arg_1.@end);
            var _local_2:XMLList = _arg_1.ExternalScript;
            var _local_3:int = _local_2.length();
            if (_local_3 > 0){
                this.externalScripts = [];
                _local_4 = 0;
                while (_local_4 < _local_3) {
                    _local_5 = _local_2[_local_4];
                    this.externalScripts.push({
                        "index":int(_local_5.@index),
                        "des":String(_local_5.des)
                    });
                    _local_4++;
                };
            };
        }

        public function encode()
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:Object;
            var _local_5:XML;
            var _local_1:XML = <MotionSectionInfo/>
            ;
            _local_1.@begin = this.beginFrameIndex;
            _local_1.@end = this.endFrameIndex;
            if (this.externalScripts != null){
                _local_2 = this.externalScripts.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_4 = this.externalScripts[_local_3];
                    _local_5 = <ExternalScript/>
                    ;
                    _local_5.@index = _local_4.index;
                    _local_5.@des = _local_4.des;
                    _local_1.appendChild(_local_5);
                    _local_3++;
                };
            };
            return (_local_1);
        }

        public function toString():String
        {
            return (((this.beginFrameIndex + "-") + this.endFrameIndex));
        }

        public /*  ©init. */ function _SafeStr_280()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_280 = " MotionSectionInfo" (String#16481)


