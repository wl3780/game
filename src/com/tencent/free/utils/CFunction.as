package com.tencent.free.utils
{

    public class CFunction 
    {

        public var target:Object;
        public var handler:Function;
        public var params:Array;

        public function CFunction(handler:Function, target:Object=null, params:Array=null)
        {
            this.target = target;
            this.handler = handler;
            this.params = params;
        }

        public function call(... args)
        {
            if (this.handler != null) {
                if ((args as Array).length != 0) {
                    return this.handler.apply(this.target, args);
                }
                return this.handler.apply(this.target, null);
            }
        }

        public function apply(args:Array)
        {
            if (this.handler != null) {
                return this.handler.apply(this.target, args);
            }
        }

        public function invoke()
        {
            return this.apply(this.params);
        }

        public function clear():void
        {
            this.params = null;
            this.target = null;
            this.handler = null;
        }

    }
}
