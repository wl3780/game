package com.tencent.free.utils
{
    import flash.net.LocalConnection;
    import flash.utils.Dictionary;

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
            if (_canBeGC) {
                Schedule.addInvoke(_gcNowFunc, 30000);
                _canBeGC = false;
            }
        }

        public static function gcNow():void
        {
            new LocalConnection().connect("MoonSpirit");
            new LocalConnection().connect("MoonSpirit");
            _canBeGC = true;
        }


        public function gc(res:Object, key:String):void
        {
            this.rubbish[key] = res;
        }

        public function find(resKey:String):Object
        {
            for (var key:String in this.rubbish) {
                if (key == resKey) {
                    return key;
                }
            }
            return null;
        }

    }
}
