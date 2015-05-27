// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.frame.LF_WaitFrame

package com.tencent.ai.core.timeline.frame
{
    import com.tencent.ai.core.events.AIEvent;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.LogicFrameType;
    import  ©init._SafeStr_1299;

    public class LF_WaitFrame extends LF_DupBaseFrame 
    {


        private function onClientMsg(_arg_1:AIEvent):void
        {
            if ((((_arg_1 == null)) || ((_arg_1.data == "waitFrameEnd")))){
                fireComplete();
            };
        }

        override public function enter(_arg_1:Object):void
        {
            AICore.addAIEventListener(AIEvent.ON_CLIENT_MSG, this.onClientMsg);
        }

        override public function exit():void
        {
            AICore.removeAIEventListener(AIEvent.ON_CLIENT_MSG, this.onClientMsg);
        }

        override public function getType():int
        {
            return (LogicFrameType.LFT_ACTIVE_PLOT);
        }

        public /*  ©init. */ function _SafeStr_1299()
        {
        }


    }
}//package com.tencent.ai.core.timeline.frame

// _SafeStr_1299 = " LF_WaitFrame" (String#16025)


