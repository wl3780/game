// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.sound.SoundPlay

package com.tencent.ai.core.sound
{
    import flash.events.EventDispatcher;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.utils.Timer;
    import flash.utils.setTimeout;
    import com.tencent.ai.core.sound.ISoundSource;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import flash.utils.clearTimeout;
    import flash.media.SoundTransform;
    import  ©init._SafeStr_1259;

    class SoundPlay extends EventDispatcher 
    {

        private static var play_id_counter:int;

        private var _sound:Sound;
        private var _howMany:int;
        private var _playCount:int;
        private var _startTime:int;
        private var _volume:int;
        private var _pan:Number;
        private var _channel:SoundChannel;
        private var _timer:Timer;
        private var _id:int;
        private var _soundPackageID:int;
        private var _timeoutID:int = -1;
        private var _effect:SoundPlayEffect;

        public function SoundPlay(_arg_1:int)
        {
            this._soundPackageID = _arg_1;
        }

        public function get id():int
        {
            return (this._id);
        }

        public function get soundPackageID():int
        {
            return (this._soundPackageID);
        }

        public function play(_arg_1:Sound, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int=0, _arg_6:ISoundSource=null, _arg_7:Boolean=false):void
        {
            if (_arg_5){
                this._timeoutID = setTimeout(this._play, _arg_5, _arg_1, _arg_2, _arg_3, _arg_4, _arg_6, _arg_7);
            } else {
                this._play(_arg_1, _arg_2, _arg_3, _arg_4, _arg_6, _arg_7);
            };
        }

        private function _play(_arg_1:Sound, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:ISoundSource=null, _arg_6:Boolean=false):void
        {
            this.clearDelay();
            this._id = SoundPlay.play_id_counter++;
            this._sound = _arg_1;
            this._howMany = _arg_2;
            this._startTime = _arg_3;
            this._channel = this._sound.play(this._startTime, 1);
            if (!this._channel){
                this.stop();
                return;
            };
            this.volume = _arg_4;
            if (this._howMany > 0){
                if (!this._timer){
                    this._timer = new Timer(100);
                };
                this._timer.addEventListener(TimerEvent.TIMER, this.onTimer);
                this._timer.start();
            } else {
                this._playCount = (Math.abs(this._howMany) - 1);
                this._channel.addEventListener(Event.SOUND_COMPLETE, this.onSoundComplete);
            };
            if (_arg_5){
                this._effect = new SoundPlayEffect(this, _arg_5, _arg_6);
            };
        }

        private function clearDelay():Boolean
        {
            if (this._timeoutID != -1){
                clearTimeout(this._timeoutID);
                this._timeoutID = -1;
                return (true);
            };
            return (false);
        }

        public function stop():void
        {
            if (!this.clearDelay()){
                this._sound = null;
                if (this._channel){
                    this._channel.stop();
                    this._channel.removeEventListener(Event.SOUND_COMPLETE, this.onSoundComplete);
                    this._channel = null;
                };
                if (this._timer){
                    this._timer.stop();
                    this._timer.removeEventListener(TimerEvent.TIMER, this.onTimer);
                    this._timer = null;
                };
                if (this._effect){
                    this._effect.dispose();
                    this._effect = null;
                };
            };
            var _local_1:Event = new Event(Event.SOUND_COMPLETE);
            this.dispatchEvent(_local_1);
        }

        public function set volume(_arg_1:int):void
        {
            var _local_2:SoundTransform;
            if (this._channel){
                _local_2 = this._channel.soundTransform;
                _local_2.volume = (_arg_1 * 0.01);
                this._channel.soundTransform = _local_2;
            };
            this._volume = _arg_1;
        }

        public function get volume():int
        {
            return (this._volume);
        }

        public function set pan(_arg_1:Number):void
        {
            var _local_2:SoundTransform;
            if (this._channel){
                _local_2 = this._channel.soundTransform;
                _local_2.pan = _arg_1;
                this._channel.soundTransform = _local_2;
            };
            this._pan = _arg_1;
        }

        public function get pan():Number
        {
            return (this._pan);
        }

        public function get isMulti():Boolean
        {
            return ((((this._howMany == 0)) || ((this._howMany < -1))));
        }

        private function onSoundComplete(_arg_1:Event):void
        {
            this._channel.stop();
            this._channel.removeEventListener(Event.SOUND_COMPLETE, this.onSoundComplete);
            this._channel = null;
            if ((((this._howMany == 0)) || (this._playCount))){
                this._channel = this._sound.play(this._startTime, 1);
                this._channel.addEventListener(Event.SOUND_COMPLETE, this.onSoundComplete);
                this.volume = this._volume;
                this._playCount--;
            } else {
                this.stop();
            };
        }

        private function onTimer(_arg_1:TimerEvent):void
        {
            if (this._channel.position >= this._howMany){
                this.stop();
            };
        }

        public /*  ©init. */ function _SafeStr_1259()
        {
        }


    }
}//package com.tencent.ai.core.sound

// _SafeStr_1259 = " SoundPlay" (String#15269)


