// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.ActorAutoAI

package com.tencent.ai.core.actor
{
    import com.tencent.ai.core.components.BaseAIComponent;
    import com.tencent.ai.core.events.GlobalActorEvent;
    import com.tencent.ai.core.data.arg.script.AutoAIActArg;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_44;

    public class ActorAutoAI extends BaseAIComponent 
    {

        private static var _ACT_BREAK_EVENT:GlobalActorEvent = new GlobalActorEvent(GlobalActorEvent.ON_AUTO_ACT_BREAK);
        private static var _ACT_END_EVENT:GlobalActorEvent = new GlobalActorEvent(GlobalActorEvent.ON_AUTO_ACT_END);

        protected var m_arg:AutoAIActArg;
        protected var m_maxFrameTimes:int;


        protected function startAct():void
        {
            this.m_maxFrameTimes = this.m_arg.frameTimes;
            var _local_1:int = this.m_arg.beginVKey;
            if (_local_1 != VKeyDef.EMPTY){
                (m_target as HasActionElement).inputVKey(_local_1);
            };
        }

        protected function endAct(_arg_1:Boolean=false):void
        {
            var _local_4:GlobalActorEvent;
            var _local_2:int = this.m_arg.id;
            var _local_3:int = this.m_arg.endVKey;
            this.m_arg = null;
            this.m_maxFrameTimes = 0;
            if (_arg_1){
                _local_4 = _ACT_BREAK_EVENT;
            } else {
                _local_4 = _ACT_END_EVENT;
                if (_local_3 != VKeyDef.EMPTY){
                    (m_target as HasActionElement).inputVKey(_local_3);
                };
            };
            _local_4.setTarget(this);
            _local_4.data = _local_2;
            AICore.actorDispatcher.dispatchEvent(_local_4);
        }

        override public function enterframe(_arg_1:int):void
        {
            super.enterframe(_arg_1);
            if (this.m_arg != null){
                var _local_2 = this;
                var _local_3 = (_local_2.m_maxFrameTimes - 1);
                _local_2.m_maxFrameTimes = _local_3;
                if (this.m_maxFrameTimes == 0){
                    this.endAct();
                };
            };
        }

        public function act(_arg_1:int, _arg_2:Object):void
        {
            if (this.m_arg != null){
                this.endAct(true);
            };
            this.m_arg = (_arg_2 as AutoAIActArg);
            this.startAct();
        }

        override public function reset():void
        {
            this.m_arg = null;
            this.m_maxFrameTimes = 0;
            super.reset();
        }

        public /*  ©init. */ function _SafeStr_44()
        {
        }


    }
}//package com.tencent.ai.core.actor

// _SafeStr_44 = " ActorAutoAI" (String#13946)


