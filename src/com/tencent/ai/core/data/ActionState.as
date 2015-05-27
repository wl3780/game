// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ActionState

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import flash.utils.Dictionary;
    import  ©init._SafeStr_206;

    public class ActionState implements IXMLSerialize 
    {

        public var index:int;
        public var motionID:int;
        public var frameIndex:int;
        public var acceptVKeys:Dictionary;
        public var externalScripts:Dictionary;


        public function decode(_arg_1:XML):void
        {
            var _local_4:int;
            var _local_5:AcceptVKeyInfo;
            var _local_6:XML;
            var _local_7:int;
            var _local_8:String;
            this.index = int(_arg_1.@index);
            this.motionID = int(_arg_1.@motionID);
            this.frameIndex = int(_arg_1.@frameIndex);
            var _local_2:XMLList = _arg_1.AcceptVKey;
            var _local_3:int = _local_2.length();
            if (_local_3 > 0){
                this.acceptVKeys = new Dictionary();
                _local_4 = 0;
                while (_local_4 < _local_3) {
                    _local_5 = new AcceptVKeyInfo();
                    _local_5.decode(_local_2[_local_4]);
                    this.acceptVKeys[_local_5.key] = _local_5;
                    _local_4++;
                };
            };
            _local_2 = _arg_1.ExternalScript;
            _local_3 = _local_2.length();
            if (_local_3 > 0){
                this.externalScripts = new Dictionary();
                _local_4 = 0;
                while (_local_4 < _local_3) {
                    _local_6 = _local_2[_local_4];
                    _local_7 = int(_local_6.@index);
                    _local_8 = String(_local_6.des);
                    this.externalScripts[_local_7] = {
                        "index":_local_7,
                        "des":_local_8
                    };
                    _local_4++;
                };
            };
        }

        public function encode()
        {
            var _local_2:AcceptVKeyInfo;
            var _local_3:Object;
            var _local_4:XML;
            var _local_1:XML = <ActionState/>
            ;
            _local_1.@index = this.index;
            _local_1.@motionID = this.motionID;
            _local_1.@frameIndex = this.frameIndex;
            if (this.acceptVKeys != null){
                for each (_local_2 in this.acceptVKeys) {
                    _local_1.appendChild(_local_2.encode());
                };
            };
            if (this.externalScripts != null){
                for each (_local_3 in this.externalScripts) {
                    _local_4 = <ExternalScript/>
                    ;
                    _local_4.@index = _local_3.index;
                    _local_4.@des = _local_3.des;
                    _local_1.appendChild(_local_4);
                };
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_206()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_206 = " ActionState" (String#17780)


