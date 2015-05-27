// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.ParticleElement

package com.tencent.ai.core.effect.impl
{
    import com.tencent.ai.core.data.EffectInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.enum.EffectType;
    import com.tencent.ai.core.data.arg.ParticleEffectArg;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.AICore;
    import flash.geom.Matrix;
    import flash.display.BitmapData;
    import com.tencent.ai.core.data.MapPosition;
    import  ©init._SafeStr_374;
    import __AS3__.vec.*;

    public class ParticleElement extends ImageElement 
    {

        protected var m_generateNo:int;
        protected var m_canGenerate:Boolean;
        protected var m_effectInfo:EffectInfo;
        protected var m_ticks:int;
        protected var m_velocity:Vector.<Number>;
        protected var m_rotation:Number;

        public function ParticleElement()
        {
            this.m_velocity = new Vector.<Number>(3, true);
            super();
            super.effectType = EffectType.PARTICLE_EFFECT;
        }

        public function set generateNo(_arg_1:int):void
        {
            this.m_generateNo = _arg_1;
        }

        public function set canGenerate(_arg_1:Boolean):void
        {
            this.m_canGenerate = _arg_1;
        }

        public function set effectInfo(_arg_1:EffectInfo):void
        {
            this.m_effectInfo = _arg_1;
        }

        private function get effectArg():ParticleEffectArg
        {
            return (((this.m_effectInfo) ? ((this.m_effectInfo.otherArg as ParticleEffectArg)) : null));
        }

        private function generateElements():void
        {
            var _local_2:String;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:ParticleElement;
            var _local_1:ParticleEffectArg = this.effectArg;
            if (((((_local_1) && (this.m_canGenerate))) && (m_parent))){
                _local_1.randFactor = DEFINE.RANDOM_FLOAT();
                _local_2 = getType();
                _local_3 = 1;
                _local_4 = (_local_1.numGeneration - 1);
                while (_local_3 <= _local_4) {
                    _local_6 = (m_parent.createElement(_local_2, this.m_effectInfo) as ParticleElement);
                    if (_local_6){
                        _local_6.generateNo = _local_3;
                        _local_6.canGenerate = false;
                    };
                    _local_3++;
                };
                _local_5 = _local_1.soundID;
                if (_local_5 != 0){
                    AICore.sound.play(_local_5, -1, 0, 100, 0, this);
                };
            };
        }

        private function updateMatrix():void
        {
            var _local_1:Matrix;
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            if (((m_bitmap) && (m_bitmap.bitmapData))){
                _local_1 = new Matrix();
                _local_2 = ICON_WIDTH;
                _local_3 = ICON_HEIGHT;
                _local_4 = (_local_2 / 2);
                _local_5 = (_local_3 / 2);
                _local_1.translate(-(_local_4), -(_local_5));
                _local_1.rotate(this.m_rotation);
                _local_1.scale(super.m_bitmap.scaleX, super.m_bitmap.scaleY);
                _local_1.translate(super.m_posX, super.m_posY);
                m_bitmap.transform.matrix = _local_1;
            };
        }

        private function set rotation(_arg_1:Number):void
        {
            if (this.m_rotation != _arg_1){
                this.m_rotation = _arg_1;
                this.updateMatrix();
            };
        }

        private function get rotation():Number
        {
            return (this.m_rotation);
        }

        override public function setPosX(_arg_1:int):void
        {
            m_posX = _arg_1;
            this.updateMatrix();
        }

        override public function setPosY(_arg_1:int):void
        {
            m_posY = _arg_1;
            this.updateMatrix();
        }

        override public function setPosXY(_arg_1:int, _arg_2:int):void
        {
            m_posX = _arg_1;
            m_posY = _arg_2;
            this.updateMatrix();
        }

        private function initBitmapData():void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_1:BitmapData = new BitmapData(ICON_WIDTH, ICON_HEIGHT, true, 0);
            super.m_bitmap.bitmapData = (this.effectArg.copyImg = _local_1);
            var _local_2:int = this.effectArg.iconFrameIds.length;
            if (_local_2 > 0){
                _local_3 = (DEFINE.RANDOM_FLOAT() * _local_2);
                _local_4 = this.effectArg.iconFrameIds[_local_3];
                ParticleIconCache2.getBitmapData(this.effectArg.iconEffectId, _local_4, _local_1);
            };
            this.tingeInfo = this.m_effectInfo.tingeInfo;
            this.adjustColorInfo = this.m_effectInfo.adjustColorInfo;
        }

        override public function render(_arg_1:int):void
        {
            var _local_2:MapPosition = super.getMapPosition();
            if (this.m_ticks == 0){
                this.initBitmapData();
                this.rotation = this.getInitRotation(this.effectArg, this.m_generateNo);
                this.generateElements();
                this.behaviorInit(_local_2, this.m_velocity, this.effectArg, this.m_generateNo);
            } else {
                this.rotation = (this.rotation + this.getChangeRotation(this.m_ticks, this.effectArg, this.m_generateNo));
            };
            this.behaviorChange(_local_2, this.m_velocity, this.m_ticks++, this.effectArg, this.m_generateNo);
            super.setMapPosition(_local_2);
            super.m_duration = this.behaviorEnding(_local_2, super.m_duration, this.effectArg);
            super.setMapPosition(_local_2);
            super.render(_arg_1);
        }

        override public function reset():void
        {
            super.reset();
            this.m_generateNo = 0;
            this.m_canGenerate = false;
            this.m_effectInfo = null;
            this.m_ticks = 0;
        }

        protected function behaviorInit(_arg_1:MapPosition, _arg_2:Vector.<Number>, _arg_3:ParticleEffectArg, _arg_4:int):void
        {
            _arg_2[0] = 0;
            _arg_2[1] = 0;
            _arg_2[2] = 0;
        }

        protected function behaviorChange(_arg_1:MapPosition, _arg_2:Vector.<Number>, _arg_3:int, _arg_4:ParticleEffectArg, _arg_5:int):void
        {
        }

        protected function behaviorEnding(_arg_1:MapPosition, _arg_2:int, _arg_3:ParticleEffectArg):int
        {
            return (int.MAX_VALUE);
        }

        protected function getInitRotation(_arg_1:ParticleEffectArg, _arg_2:int):Number
        {
            return (0);
        }

        protected function getChangeRotation(_arg_1:int, _arg_2:ParticleEffectArg, _arg_3:int):Number
        {
            return (0);
        }

        public /*  ©init. */ function _SafeStr_374()
        {
        }


    }
}//package com.tencent.ai.core.effect.impl

import flash.geom.Rectangle;
import flash.geom.Point;
import flash.display.BitmapData;
import flash.utils.Dictionary;
import __AS3__.vec.Vector;
import com.tencent.ai.core.effect.impl.EffectManager;
import com.tencent.ai.core.effect.EffectAsset;
import com.tencent.ai.core.events.AssetLoadEvent;
import com.tencent.ai.core.render.MotionAsset;
import com.tencent.ai.core.render.BitmapKeyFrame;
import  ©init._SafeStr_375;
import __AS3__.vec.*;

const ICON_WIDTH:int = 34;
const ICON_HEIGHT:int = 34;
const copyBitmapData:Function = function (_arg_1:flash.display.BitmapData, _arg_2:flash.display.BitmapData):void
    {
        var _local_3:flash.geom.Rectangle;
        var _local_4:flash.geom.Point;
        if (((_arg_1) && (_arg_2))){
            _local_3 = new flash.geom.Rectangle(0, 0, _arg_2.width, _arg_2.height);
            _local_4 = new flash.geom.Point((_arg_1.width / 2), (_arg_1.height / 2));
            _local_4.offset((-(_local_3.width) / 2), (-(_local_3.height) / 2));
            _arg_1.copyPixels(_arg_2, _local_3, _local_4);
        };

//!!! Invalid/corrupt action data, import aborted for this method body.
    };
class ParticleIconCache2 
{

    /*private*/ static var ms_mapLoading:Dictionary = new Dictionary();
    /*private*/ static var ms_mapDestBmpData:Dictionary = new Dictionary();

    public function ParticleIconCache2()
    {
        super();
    }

    /*private*/ static function makeKey(_arg_1:int, _arg_2:int):int
    {
        return (((_arg_1 * 10000) + _arg_2));
    }

    /*private*/ static function getEffectId(_arg_1:int):int
    {
        return (int((_arg_1 / 10000)));
    }

    public static function getBitmapData(_arg_1:int, _arg_2:int, _arg_3:BitmapData):BitmapData
    {
        var _local_5:BitmapData;
        var _local_6:int;
        var _local_7:Vector.<BitmapData>;
        var _local_4:EffectAsset = EffectManager.getInstance().getEffectAsset(_arg_1);
        if (_local_4){
            if (_local_4.getIsLoaded()){
                if (_arg_3){
                    _local_5 = getFrameBitmapData(_local_4, _arg_2);
                    copyBitmapData(_arg_3, _local_5);
                } else {
                    return (_local_5);
                };
            } else {
                _local_6 = makeKey(_arg_1, _arg_2);
                if (!ms_mapLoading[_local_6]){
                    _local_4.addEventListener(AssetLoadEvent.COMPLETE, onLoaded);
                    _local_4.addEventListener(AssetLoadEvent.ERROR, onError);
                    _local_4.load(_local_4.loadArg);
                    ms_mapLoading[_local_6] = true;
                };
                _local_7 = ms_mapDestBmpData[_local_6];
                if (_local_7 == null){
                    _local_7 = (ms_mapDestBmpData[_local_6] = new Vector.<BitmapData>());
                };
                _local_7.push(_arg_3);
            };
        };
        return (null);
    }

    /*private*/ static function getFrameBitmapData(_arg_1:EffectAsset, _arg_2:int):BitmapData
    {
        var _local_3:MotionAsset;
        var _local_4:Vector.<BitmapKeyFrame>;
        var _local_5:BitmapKeyFrame;
        if (_arg_1){
            _local_3 = _arg_1.motionAssets[0];
            _local_4 = _local_3.timeline.bitmapFrames;
            if ((((_arg_2 >= 0)) && ((_arg_2 < _local_4.length)))){
                _local_5 = _local_4[_arg_2];
                return (_local_5.data);
            };
        };
        return (null);
    }

    /*private*/ static function onLoaded(_arg_1:AssetLoadEvent):void
    {
        var _local_8:BitmapKeyFrame;
        var _local_9:int;
        var _local_10:BitmapData;
        var _local_2:EffectAsset = (_arg_1.target as EffectAsset);
        var _local_3:int = _local_2.id;
        var _local_4:MotionAsset = _local_2.motionAssets[0];
        var _local_5:Vector.<BitmapKeyFrame> = _local_4.timeline.bitmapFrames;
        var _local_6:int;
        var _local_7:int = _local_5.length;
        while (_local_6 < _local_7) {
            _local_8 = _local_5[_local_6];
            _local_9 = makeKey(_local_3, _local_6);
            for each (_local_10 in ms_mapDestBmpData[_local_9]) {
                copyBitmapData(_local_10, _local_8.data);
            };
            ms_mapDestBmpData[_local_9] = null;
            ms_mapLoading[_local_9] = false;
            _local_6++;
        };
    }

    /*private*/ static function onError(_arg_1:AssetLoadEvent):void
    {
        var _local_4:*;
        var _local_2:EffectAsset = (_arg_1.target as EffectAsset);
        var _local_3:int = _local_2.id;
        for (_local_4 in ms_mapLoading) {
            if (getEffectId(_local_4) == _local_3){
                ms_mapDestBmpData[_local_4] = null;
                ms_mapLoading[_local_4] = false;
            };
        };
    }


    public /*  ©init. */ function _SafeStr_375()
    {
    }


}

// _SafeStr_374 = " ParticleElement" (String#14609)
// _SafeStr_375 = " ParticleIconCache2" (String#14612)


