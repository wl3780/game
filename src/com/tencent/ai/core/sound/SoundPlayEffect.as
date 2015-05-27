// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.sound.SoundPlayEffect

package com.tencent.ai.core.sound
{
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.sound.ISoundSource;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.scene.ICamera;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1260;

    class SoundPlayEffect 
    {

        private static const halfViewWidth:int = (Constants.CAMERA_WIDTH * 0.5);//470
        private static const quarterViewWidth:int = halfViewWidth;//470
        private static const MAX_RATE_X:Number = 0.1;
        private static const MAX_RATE_X_REST:Number = 0.9;
        private static const MAX_RATE_Y:Number = 0.6;
        private static const MIN_PAN:Number = 0.8;

        private var soundPlay:SoundPlay;
        private var soundSource:ISoundSource;
        private var target:BaseElement;
        private var oldVolume:int;
        private var camera:ICamera;
        private var timer:Timer;

        public function SoundPlayEffect(_arg_1:SoundPlay, _arg_2:ISoundSource, _arg_3:Boolean=false)
        {
            this.soundPlay = _arg_1;
            this.soundSource = _arg_2;
            this.target = this.soundSource.getSourceTarget();
            this.oldVolume = this.soundPlay.volume;
            this.computeVolumeAndPan();
            if (((this.soundPlay.isMulti) || (_arg_3))){
                this.timer = new Timer(150);
                this.timer.addEventListener(TimerEvent.TIMER, this.computeVolumeAndPan);
            };
        }

        public function computeVolumeAndPan(_arg_1:TimerEvent=null):void
        {
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Number;
            var _local_10:int;
            if (!this.camera){
                if (AICore.Runtime.currentScene){
                    this.camera = AICore.Runtime.currentScene.getCamera();
                } else {
                    return;
                };
            };
            var _local_2:Number = this.camera.locationX;
            var _local_3:Number = (this.camera.offsetY + this.camera.viewHeight);
            var _local_7:int = (this.target.mapX - _local_2);
            var _local_8:int = (((_local_7 >= 0)) ? 1 : -1);
            _local_7 = Math.abs(_local_7);
            if (_local_7 <= halfViewWidth){
                _local_6 = (_local_7 / halfViewWidth);
                _local_4 = (_local_6 * MAX_RATE_X);
                _local_6 = ((_local_6 * MIN_PAN) * _local_8);
            } else {
                _local_6 = (MIN_PAN * _local_8);
                _local_4 = ((((_local_7 - halfViewWidth) / quarterViewWidth) * MAX_RATE_X_REST) + MAX_RATE_X);
            };
            if ((((this.target.mapZ > _local_3)) || ((this.target.mapZ < this.camera.offsetY)))){
                _local_5 = 0;
            } else {
                _local_10 = (_local_3 - this.target.mapZ);
                _local_5 = ((_local_10 / Constants.CAMERA_HEIGHT) * MAX_RATE_Y);
            };
            this.soundPlay.pan = _local_6;
            var _local_9:Number = (1 - (_local_4 + _local_5));
            _local_9 = (((_local_9 > 0)) ? _local_9 : 0);
            this.soundPlay.volume = (this.oldVolume * _local_9);
        }

        public function dispose():void
        {
            if (this.timer){
                this.timer.removeEventListener(TimerEvent.TIMER, this.computeVolumeAndPan);
            };
            this.soundPlay = null;
            this.soundSource = null;
            this.target = null;
        }

        public /*  ©init. */ function _SafeStr_1260()
        {
        }


    }
}//package com.tencent.ai.core.sound

// _SafeStr_1260 = " SoundPlayEffect" (String#16568)


