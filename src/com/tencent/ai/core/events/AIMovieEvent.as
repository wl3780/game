// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.AIMovieEvent

package com.tencent.ai.core.events
{
    import com.tencent.ai.core.data.MovieStaticInfo;
    import flash.events.Event;
    import  ©init._SafeStr_525;

    public class AIMovieEvent extends BaseEvent 
    {

        public static const ON_MOVIE_PLAY:String = "onMoviePlay";
        public static const ON_MOVIE_PAUSE:String = "onMoviePause";
        public static const ON_MOVIE_END:String = "onMovieEnd";
        public static const ON_MOVIE_SKIP:String = "onMovieSkip";
        public static const ON_MOVIE_ERROR:String = "onMovieError";
        public static const ON_INVOKE_IPIC:String = "onInvokeIPic";
        public static const ON_LEVELUP_PLAY:String = "onLevelUpPlay";

        public var id:int;
        public var info:MovieStaticInfo;

        public function AIMovieEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override public function clone():Event
        {
            var _local_1:AIMovieEvent = (super.clone() as AIMovieEvent);
            _local_1.id = this.id;
            _local_1.info = this.info;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_525()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_525 = " AIMovieEvent" (String#17147)


