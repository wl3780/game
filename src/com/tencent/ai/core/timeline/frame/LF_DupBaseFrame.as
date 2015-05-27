// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.frame.LF_DupBaseFrame

package com.tencent.ai.core.timeline.frame
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.timeline.ILogicFrame;
    import com.tencent.ai.core.timeline.LFParam;
    import flash.events.Event;
    import  ©init._SafeStr_1295;

    public class LF_DupBaseFrame extends EventDispatcher implements ILogicFrame 
    {

        protected var m_param:LFParam;


        public function fireComplete():void
        {
            dispatchEvent(new Event(Event.COMPLETE));
        }

        public function setParams(_arg_1:LFParam):void
        {
            this.m_param = _arg_1;
        }

        public function enter(_arg_1:Object):void
        {
            throw (new Error("[LF_DupBaseFrame] 需要被重写!"));
        }

        public function exit():void
        {
            throw (new Error("[LF_DupBaseFrame] 需要被重写!"));
        }

        public function getType():int
        {
            throw (new Error("[LF_DupBaseFrame] 需要被重写!"));
        }

        public /*  ©init. */ function _SafeStr_1295()
        {
        }


    }
}//package com.tencent.ai.core.timeline.frame

// _SafeStr_1295 = " LF_DupBaseFrame" (String#14156)


