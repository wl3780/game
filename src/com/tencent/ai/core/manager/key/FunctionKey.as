package com.tencent.ai.core.manager.key
{
    import com.tencent.free.utils.CFunction;
    
    import flash.events.KeyboardEvent;

    public class FunctionKey 
    {

        public var keyCode:int;
        public var handler:CFunction;
        public var noCheckCtrl:Boolean;
        public var noCheckAlt:Boolean;
        public var noCheckShift:Boolean;
        public var keyDes:String;
        public var keyEventType:String;

        public function FunctionKey(keyCode:int, handler:CFunction, noCheckCtrl:Boolean=true, noCheckAlt:Boolean=true, noCheckShift:Boolean=true, keyDes:String="")
        {
            this.keyCode = keyCode;
            this.handler = handler;
            this.noCheckCtrl = noCheckCtrl;
            this.noCheckAlt = noCheckAlt;
            this.noCheckShift = noCheckShift;
            this.keyDes = keyDes;
        }

        public function checkKeyDown(evt:KeyboardEvent):Boolean
        {
            if (evt.keyCode == this.keyCode) {
                if (this.noCheckCtrl || evt.ctrlKey) {
                    if (this.noCheckAlt || evt.altKey) {
                        if (this.noCheckShift || evt.shiftKey) {
                            if (this.handler != null) {
                                return this.handler.invoke();
                            }
                        }
                    }
                }
            }
            return true;
        }

    }
}
