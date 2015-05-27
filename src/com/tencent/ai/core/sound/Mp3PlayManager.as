// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.sound.Mp3PlayManager

package com.tencent.ai.core.sound
{
    import flash.utils.Dictionary;
    import  ©init._SafeStr_1255;

    public class Mp3PlayManager 
    {

        protected var m_refHash:Dictionary;
        protected var m_volume:int = 25;

        public function Mp3PlayManager()
        {
            this.m_refHash = new Dictionary();
        }

        public function play(_arg_1:Object, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=true):void
        {
            var _local_5:Dictionary;
            var _local_6:Mp3Sound;
            if (_arg_1){
                this.m_refHash[_arg_1] = ((this.m_refHash[_arg_1]) || (new Dictionary()));
                _local_5 = (this.m_refHash[_arg_1] as Dictionary);
                _local_5[_arg_2] = ((_local_5[_arg_2]) || (new Mp3Sound()));
                _local_6 = (_local_5[_arg_2] as Mp3Sound);
                _local_6.loadAndPlay(_arg_2, _arg_3, _arg_4);
                _local_6.volume = this.m_volume;
            };
        }

        public function disposeRef(_arg_1:Object):void
        {
            var _local_3:String;
            var _local_4:Mp3Sound;
            var _local_2:Dictionary = this.m_refHash[_arg_1];
            for (_local_3 in _local_2) {
                _local_4 = (_local_2[_local_3] as Mp3Sound);
                _local_4.dispose();
                delete _local_2[_local_3];
            };
            delete this.m_refHash[_arg_1];
        }

        public function disposeMp3(_arg_1:Object, _arg_2:String):void
        {
            var _local_4:Mp3Sound;
            var _local_3:Dictionary = this.m_refHash[_arg_1];
            if (_local_3){
                _local_4 = (_local_3[_arg_2] as Mp3Sound);
                if (_local_4){
                    _local_4.dispose();
                    delete _local_3[_arg_2];
                };
            };
        }

        public function set volume(_arg_1:int):void
        {
            var _local_2:Dictionary;
            var _local_3:Mp3Sound;
            for each (_local_2 in this.m_refHash) {
                var _local_6:int;
                var _local_7:* = _local_2;
                for each (_local_3 in _local_2) {
                    _local_3.volume = _arg_1;
                };
            };
            this.m_volume = _arg_1;
        }

        public function get volume():int
        {
            return (this.m_volume);
        }

        public function exist(_arg_1:Object, _arg_2:String):Boolean
        {
            var _local_3:Dictionary = (this.m_refHash[_arg_1] as Dictionary);
            if (_local_3){
                return (Boolean(_local_3[_arg_2]));
            };
            return (false);
        }

        public function getMp3(_arg_1:Object):Dictionary
        {
            return ((this.m_refHash[_arg_1] as Dictionary));
        }

        public /*  ©init. */ function _SafeStr_1255()
        {
        }


    }
}//package com.tencent.ai.core.sound

// _SafeStr_1255 = " Mp3PlayManager" (String#16307)


