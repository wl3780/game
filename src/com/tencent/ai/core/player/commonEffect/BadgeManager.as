// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.commonEffect.BadgeManager

package com.tencent.ai.core.player.commonEffect
{
    import flash.utils.Dictionary;
    import flash.display.MovieClip;
    import __AS3__.vec.Vector;
    import com.tencent.free.core.lib.CLASS;
    import  ©init._SafeStr_838;
    import __AS3__.vec.*;

    public class BadgeManager 
    {

        private static var _instance:BadgeManager;

        private var _badgeHash:Dictionary;

        public function BadgeManager()
        {
            this._badgeHash = new Dictionary();
        }

        public static function get instance():BadgeManager
        {
            _instance = ((_instance) || (new (BadgeManager)()));
            return (_instance);
        }


        public function create(_arg_1:int):MovieClip
        {
            var _local_3:MovieClip;
            var _local_4:String;
            var _local_2:Vector.<MovieClip> = this.getPool(_arg_1);
            if (_local_2.length){
                _local_3 = _local_2.pop();
            } else {
                _local_4 = ("ai.commoneffect.assets.badge.Badge_" + _arg_1);
                _local_3 = (CLASS.current.tryNewInstance(_local_4) as MovieClip);
                if (_local_3){
                    _local_3.name = (_arg_1 + "");
                };
            };
            if (_local_3){
                this.playAllMC(_local_3);
            };
            return (_local_3);
        }

        public function collect(_arg_1:MovieClip):void
        {
            var _local_2:int = int(_arg_1.name);
            var _local_3:Vector.<MovieClip> = this.getPool(_local_2);
            this.stopAllMC(_arg_1);
            _local_3.push(_arg_1);
        }

        private function getPool(_arg_1:int):Vector.<MovieClip>
        {
            var _local_2:Vector.<MovieClip> = this._badgeHash[_arg_1];
            if (!_local_2){
                _local_2 = new Vector.<MovieClip>();
                this._badgeHash[_arg_1] = _local_2;
            };
            return (_local_2);
        }

        private function stopAllMC(_arg_1:MovieClip):void
        {
            var _local_3:MovieClip;
            if (!_arg_1){
                return;
            };
            _arg_1.stop();
            var _local_2:int;
            while (_local_2 < _arg_1.numChildren) {
                _local_3 = (_arg_1.getChildAt(_local_2) as MovieClip);
                if (_local_3){
                    _local_3.stop();
                };
                _local_2++;
            };
        }

        private function playAllMC(_arg_1:MovieClip):void
        {
            var _local_3:MovieClip;
            if (!_arg_1){
                return;
            };
            var _local_2:int;
            while (_local_2 < _arg_1.numChildren) {
                _local_3 = (_arg_1.getChildAt(_local_2) as MovieClip);
                if (_local_3){
                    _local_3.play();
                };
                _local_2++;
            };
            _arg_1.play();
        }

        public /*  ©init. */ function _SafeStr_838()
        {
        }


    }
}//package com.tencent.ai.core.player.commonEffect

// _SafeStr_838 = " BadgeManager" (String#15266)


