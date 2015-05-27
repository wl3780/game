// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.MovieTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.movie.IMovieManager;
    import com.tencent.ai.core.events.AIMovieEvent;
    import  ©init._SafeStr_1342;

    public class MovieTriggerEvent extends BaseTriggerEvent 
    {

        protected var m_movieID:int;
        protected var m_eventStr:String;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length >= 2)))){
                this.m_movieID = int(_arg_1.args[0]);
                this.m_eventStr = String(_arg_1.args[1]);
            };
        }

        override public function activate():void
        {
            super.activate();
            var _local_1:IMovieManager = AICore.movie;
            if (_local_1 != null){
                _local_1.addEventListener(AIMovieEvent.ON_MOVIE_END, this.onAIMovieEvent);
                _local_1.addEventListener(AIMovieEvent.ON_MOVIE_ERROR, this.onAIMovieEvent);
                _local_1.addEventListener(AIMovieEvent.ON_MOVIE_PAUSE, this.onAIMovieEvent);
                _local_1.addEventListener(AIMovieEvent.ON_MOVIE_PLAY, this.onAIMovieEvent);
                _local_1.addEventListener(AIMovieEvent.ON_MOVIE_SKIP, this.onAIMovieEvent);
            };
        }

        override public function inactivate():void
        {
            super.inactivate();
            var _local_1:IMovieManager = AICore.movie;
            if (_local_1 != null){
                _local_1.removeEventListener(AIMovieEvent.ON_MOVIE_END, this.onAIMovieEvent);
                _local_1.removeEventListener(AIMovieEvent.ON_MOVIE_ERROR, this.onAIMovieEvent);
                _local_1.removeEventListener(AIMovieEvent.ON_MOVIE_PAUSE, this.onAIMovieEvent);
                _local_1.removeEventListener(AIMovieEvent.ON_MOVIE_PLAY, this.onAIMovieEvent);
                _local_1.removeEventListener(AIMovieEvent.ON_MOVIE_SKIP, this.onAIMovieEvent);
            };
        }

        private function onAIMovieEvent(_arg_1:AIMovieEvent):void
        {
            if (_arg_1.id == this.m_movieID){
                if (this.m_eventStr.indexOf(_arg_1.type) != -1){
                    fireEvent();
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1342()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1342 = " MovieTriggerEvent" (String#15554)


