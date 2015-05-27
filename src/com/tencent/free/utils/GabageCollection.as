// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.utils.GabageCollection

package com.tencent.free.utils
{
    import flash.utils.Dictionary;
    import flash.net.LocalConnection;
    import  ©init._SafeStr_73;

    public class GabageCollection 
    {

        private static var _canBeGC:Boolean = true;
        private static var _gcNowFunc:CFunction = new CFunction(gcNow);

        protected var rubbish:Dictionary;

        public function GabageCollection()
        {
            this.rubbish = new Dictionary(true);
        }

        public static function gc():void
        {
            if (_canBeGC){
                Schedule.addInvoke(_gcNowFunc, 30000);
                _canBeGC = false;
            };
        }

        public static function gcNow():void
        {
            new LocalConnection().connect("MoonSpirit");
            new LocalConnection().connect("MoonSpirit");
            _canBeGC = true;

//!!! Invalid/corrupt action data, import aborted for this method body.
        }


        public function gc(_arg_1:Object, _arg_2:String):void
        {
            this.rubbish[_arg_1] = _arg_2;
        }

        public function find(_arg_1:String):Object
        {
            var _local_2:Object;
            var _local_3:String;
            for (_local_2 in this.rubbish) {
                _local_3 = this.rubbish[_local_2];
                if (_local_3 == _arg_1){
                    return (_local_2);
                };
            };
            return (null);
        }

        public /*  ©init. */ function _SafeStr_73()
        {
        }


    }
}//package com.tencent.free.utils

// _SafeStr_73 = " GabageCollection" (String#1532)


