// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.sound.Mp3Sound

package com.tencent.ai.core.sound
{
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.utils.Timer;
    import flash.net.URLRequest;
    import com.tencent.free.core.redirect.Redirect;
    import flash.events.IOErrorEvent;
    import flash.events.Event;
    import flash.utils.clearTimeout;
    import flash.utils.setTimeout;
    import flash.media.SoundTransform;
    import flash.events.TimerEvent;
    import  ©init._SafeStr_1256;

    class Mp3Sound 
    {

        private var sound:Sound;
        private var channel:SoundChannel;
        private var _loop:Boolean;
        private var useLoopRandomGap:Boolean;
        private var timeoutID:uint;
        private var _volume:int = 25;
        private var timer:Timer;
        private var playing:Boolean = false;


        public function loadAndPlay(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=true):void
        {
            var _local_4:URLRequest;
            this._loop = _arg_2;
            this.useLoopRandomGap = _arg_3;
            if (!this.sound){
                _local_4 = new URLRequest(Redirect.redirect(_arg_1));
                this.sound = new Sound();
                this.sound.addEventListener(IOErrorEvent.IO_ERROR, this.onLoadEnd);
                this.sound.addEventListener(Event.COMPLETE, this.onLoadEnd);
                this.sound.load(_local_4);
            };
            if (!this.playing){
                this.play();
            };
        }

        private function play():void
        {
            clearTimeout(this.timeoutID);
            this.channel = this.sound.play(0, 1);
            if (this.channel){
                this.playing = true;
                this.channel.addEventListener(Event.SOUND_COMPLETE, this.onSoundComplete);
                this.volume = this._volume;
            } else {
            };

//!!! Invalid/corrupt action data, import aborted for this method body.
        }

        private function onSoundComplete(_arg_1:Event):void
        {
            this.playing = false;
            this.channel.removeEventListener(Event.SOUND_COMPLETE, this.onSoundComplete);
            if (this._loop){
                this.timeoutID = setTimeout(this.play, 0);
            };
        }

        private function onLoadEnd(_arg_1:Event):void
        {
            this.sound.removeEventListener(Event.COMPLETE, this.onLoadEnd);
            this.sound.removeEventListener(IOErrorEvent.IO_ERROR, this.onLoadEnd);
            if (_arg_1.type == IOErrorEvent.IO_ERROR){
                this.sound = null;
            };
        }

        public function dispose():void
        {
            if (this.channel){
                this.slowlyStop();
            };
        }

        public function set volume(_arg_1:int):void
        {
            var _local_2:SoundTransform;
            if (_arg_1 < 0){
                _arg_1 = 0;
            } else {
                if (_arg_1 > 100){
                    _arg_1 = 100;
                };
            };
            if (this.channel){
                _local_2 = this.channel.soundTransform;
                _local_2.volume = (_arg_1 * 0.01);
                this.channel.soundTransform = _local_2;
                this._volume = _arg_1;
            };
        }

        public function get volume():int
        {
            return (this._volume);
        }

        private function slowlyStop():void
        {
            this.timer = ((this.timer) || (new Timer(50)));
            this.timer.addEventListener(TimerEvent.TIMER, this.onTimer);
            this.timer.start();
        }

        private function onTimer(_arg_1:TimerEvent):void
        {
            this.volume = (this.volume - 3);
            if (this.volume == 0){
                this.timer.stop();
                this.timer.removeEventListener(TimerEvent.TIMER, this.onTimer);
                clearTimeout(this.timeoutID);
                this.channel.stop();
                this.channel.removeEventListener(Event.SOUND_COMPLETE, this.onSoundComplete);
                this.channel = null;
                if (this.sound){
                    this.sound.removeEventListener(Event.COMPLETE, this.onLoadEnd);
                    this.sound.removeEventListener(IOErrorEvent.IO_ERROR, this.onLoadEnd);
                    this.sound = null;
                };
            };
        }

        public function get loop():Boolean
        {
            return (this._loop);
        }

        public /*  ©init. */ function _SafeStr_1256()
        {
        }


    }
}//package com.tencent.ai.core.sound

// _SafeStr_1256 = " Mp3Sound" (String#14942)


