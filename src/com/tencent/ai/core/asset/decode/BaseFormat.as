// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.decode.BaseFormat

package com.tencent.ai.core.asset.decode
{
    import flash.events.EventDispatcher;
    import __AS3__.vec.Vector;
    import flash.events.Event;
    import flash.utils.ByteArray;
    import  ©init._SafeStr_63;
    import __AS3__.vec.*;

    public class BaseFormat extends EventDispatcher implements IFormatDecoder 
    {

        protected var extNames:Vector.<String>;
        protected var tasklist:Vector.<Object>;
        private var __event:Event;

        public function BaseFormat()
        {
            this.extNames = new Vector.<String>();
            this.__event = new Event(Event.COMPLETE);
            super();
        }

        protected function contain(_arg_1:String):Boolean
        {
            return (!((this.extNames.indexOf(_arg_1) == -1)));
        }

        protected function complete():void
        {
            dispatchEvent(this.__event);
        }

        public function isEmpty():Boolean
        {
            return ((((this.tasklist == null)) || ((this.tasklist.length == 0))));
        }

        public function support(_arg_1:String, _arg_2:String, _arg_3:ByteArray):Boolean
        {
            if (this.contain(_arg_2)){
                if (this.tasklist == null){
                    this.tasklist = new Vector.<Object>();
                };
                this.tasklist.push({
                    "name":_arg_1,
                    "bytes":_arg_3
                });
                return (true);
            };
            return (false);
        }

        public function start():void
        {
        }

        public function getExtNames():Vector.<String>
        {
            return (this.extNames);
        }

        public function getContents():Vector.<Object>
        {
            return (this.tasklist);
        }

        public function unload():void
        {
            this.tasklist = null;
        }

        public /*  ©init. */ function _SafeStr_63()
        {
        }


    }
}//package com.tencent.ai.core.asset.decode

// _SafeStr_63 = " BaseFormat" (String#14351)


