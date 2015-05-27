// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.ParticleElementManager

package com.tencent.ai.core.effect.impl
{
    import com.tencent.ai.core.effect.IEffectElementManager;
    import com.tencent.ai.core.effect.IEffectManager;
    import __AS3__.vec.Vector;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.data.arg.ImageEffectArg;
    import com.tencent.ai.core.effect.EffectElement;
    import  ©init._SafeStr_376;
    import __AS3__.vec.*;

    public class ParticleElementManager implements IEffectElementManager 
    {

        protected var m_effectManager:IEffectManager;
        protected var m_effectElements:Vector.<ImageElement>;
        protected var m_imgByRefs:Dictionary;
        protected var m_pools:Dictionary;

        public function ParticleElementManager(_arg_1:IEffectManager)
        {
            this.m_effectManager = _arg_1;
            this.m_effectElements = new Vector.<ImageElement>();
            this.m_imgByRefs = new Dictionary();
            this.m_pools = new Dictionary();
        }

        private static function getClass(_arg_1:EffectInfo):Class
        {
            return (RandVertSprinkleParticleElement);
        }

        private static function tellClass(_arg_1:Object)
        {
            if (_arg_1){
                return (_arg_1.constructor);
            };
            return (null);

//!!! Invalid/corrupt action data, import aborted for this method body.
        }


        private function getPool(_arg_1:Class):Vector.<ParticleElement>
        {
            var _local_2:Vector.<ParticleElement>;
            if (_arg_1){
                _local_2 = this.m_pools[_arg_1];
                if (_local_2 == null){
                    _local_2 = (this.m_pools[_arg_1] = new Vector.<ParticleElement>());
                };
            };
            return (_local_2);
        }

        public function createElement(_arg_1:EffectInfo):EffectElement
        {
            var _local_2:ParticleElement = this.newElement(_arg_1);
            _local_2.setMapPosition(_arg_1.location);
            _local_2.setDirection(_arg_1.direction);
            _local_2.setElementArg(ImageEffectArg(_arg_1.otherArg));
            var _local_3:Object = (((_arg_1.ref == null)) ? this : _arg_1.ref);
            var _local_4:ImageRefInfo = this.m_imgByRefs[_local_3];
            if (_local_4 == null){
                _local_4 = new ImageRefInfo(_local_3, _arg_1.maxCount, this);
                this.m_imgByRefs[_local_3] = _local_4;
            };
            _local_2.generateNo = 0;
            _local_2.canGenerate = true;
            _local_2.effectInfo = _arg_1;
            _local_4.push(_local_2);
            return (_local_2);
        }

        public function destoryElement(_arg_1:EffectElement):void
        {
            var _local_2:ImageElement = (_arg_1 as ImageElement);
            if (_local_2 != null){
                _local_2.reset();
                this.freeElement(_local_2);
            };
        }

        public function clear():void
        {
            var _local_1:ImageRefInfo;
            for each (_local_1 in this.m_imgByRefs) {
                _local_1.dispose();
            };
            this.m_imgByRefs = new Dictionary();
        }

        protected function newElement(_arg_1:EffectInfo):ParticleElement
        {
            var _local_2:Class = getClass(_arg_1);
            var _local_3:Vector.<ParticleElement> = this.getPool(_local_2);
            return (((((_local_3) && ((_local_3.length > 0)))) ? _local_3.pop() : new (_local_2)()));
        }

        protected function freeElement(_arg_1:EffectElement):void
        {
            var _local_2:Class = tellClass(_arg_1);
            var _local_3:Vector.<ParticleElement> = this.getPool(_local_2);
            if (((_local_3) && ((_local_3.indexOf(_arg_1) < 0)))){
                _local_3.push(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_376()
        {
        }


    }
}//package com.tencent.ai.core.effect.impl

import com.tencent.ai.core.effect.impl.ParticleElement;
import com.tencent.ai.core.data.MapPosition;
import __AS3__.vec.Vector;
import com.tencent.ai.core.data.arg.ParticleEffectArg;
import com.tencent.ai.core.manager.data.DEFINE;
import  ©init._SafeStr_377;
import  ©init._SafeStr_378;
import  ©init._SafeStr_379;
import  ©init._SafeStr_380;

class SprinkleParticleElementBase extends ParticleElement 
{

    protected var m_delaying:Boolean;

    public function SprinkleParticleElementBase()
    {
        super();
    }

    override protected function behaviorInit(_arg_1:MapPosition, _arg_2:Vector.<Number>, _arg_3:ParticleEffectArg, _arg_4:int):void
    {
        this.m_delaying = false;
        super.m_dAlpha = 0;
    }

    override protected function behaviorChange(_arg_1:MapPosition, _arg_2:Vector.<Number>, _arg_3:int, _arg_4:ParticleEffectArg, _arg_5:int):void
    {
        if (!this.isOnFloor){
            _arg_1.x = (_arg_1.x + _arg_2[0]);
            _arg_1.y = (_arg_1.y + _arg_2[1]);
            _arg_1.z = (_arg_1.z + _arg_2[2]);
            _arg_2[1] = (_arg_2[1] + ((DEFINE.G_GRAVITY + _arg_4.slowFactor) / 100));
        };
    }

    override protected function behaviorEnding(_arg_1:MapPosition, _arg_2:int, _arg_3:ParticleEffectArg):int
    {
        if (this.isOnFloor){
            _arg_1.y = 0;
            if (_arg_2 <= _arg_3.fadeFrames){
                super.m_dAlpha = (((_arg_3.fadeFrames > 0)) ? ((-1 / _arg_3.fadeFrames)) : 0);
            };
            if (this.m_delaying){
                return (_arg_2);
            };
            this.m_delaying = true;
            return ((_arg_3.pauseFrames + _arg_3.fadeFrames));
        };
        return (int.MAX_VALUE);
    }

    protected function get isOnFloor():Boolean
    {
        return ((super.mapY <= 0));
    }

    override protected function getInitRotation(_arg_1:ParticleEffectArg, _arg_2:int):Number
    {
        if (_arg_1.deltaRotation){
            return ((DEFINE.RANDOM_FLOAT() * 360));
        };
        return (0);
    }

    override protected function getChangeRotation(_arg_1:int, _arg_2:ParticleEffectArg, _arg_3:int):Number
    {
        if (!this.isOnFloor){
            return ((_arg_2.deltaRotation * Math.pow(0.9, _arg_1)));
        };
        return (0);
    }

    public /*  ©init. */ function _SafeStr_377()
    {
    }


}
class VertSprinkleParticleElement extends SprinkleParticleElementBase 
{

    public function VertSprinkleParticleElement()
    {
        super();
    }

    override protected function behaviorInit(_arg_1:MapPosition, _arg_2:Vector.<Number>, _arg_3:ParticleEffectArg, _arg_4:int):void
    {
        super.behaviorInit(_arg_1, _arg_2, _arg_3, _arg_4);
        var _local_5:Number = ((this.getEmissAngle(_arg_3, _arg_4) - 0.5) * Math.PI);
        _arg_2[0] = (this.getEmissVelocity(_arg_3) * Math.sin(_local_5));
        _arg_2[1] = (this.getEmissVelocity(_arg_3) * Math.cos(_local_5));
        _arg_2[2] = 0;
    }

    protected function getEmissVelocity(_arg_1:ParticleEffectArg):Number
    {
        return (_arg_1.emissVelocity);
    }

    protected function getEmissAngle(_arg_1:ParticleEffectArg, _arg_2:int):Number
    {
        if (_arg_1.numGeneration > 1){
            return ((_arg_2 / (_arg_1.numGeneration - 1)));
        };
        return (0.5);
    }

    public /*  ©init. */ function _SafeStr_378()
    {
    }


}
class RandVertSprinkleParticleElement extends VertSprinkleParticleElement 
{

    public function RandVertSprinkleParticleElement()
    {
        super();
    }

    /*private*/ static function fixValue(_arg_1:Number):Number
    {
        return (Math.max(Math.min(_arg_1, 1), 0));
    }

    /*private*/ static function randRange(_arg_1:ParticleEffectArg, _arg_2:Number, _arg_3:Number):Number
    {
        return (randRange2(_arg_1, -(_arg_2), _arg_2, _arg_3));
    }

    /*private*/ static function randRange2(_arg_1:ParticleEffectArg, _arg_2:Number, _arg_3:Number, _arg_4:Number):Number
    {
        if (_arg_1.numGeneration > 1){
            return (((DEFINE.RANDOM_FLOAT() * Math.abs((_arg_2 - _arg_3))) + (((_arg_2 < _arg_3)) ? _arg_2 : _arg_3)));
        };
        return (_arg_4);
    }


    override protected function behaviorInit(_arg_1:MapPosition, _arg_2:Vector.<Number>, _arg_3:ParticleEffectArg, _arg_4:int):void
    {
        _arg_3.emissAngle = 45;
        super.behaviorInit(_arg_1, _arg_2, _arg_3, _arg_4);
        _arg_1.x = (_arg_1.x + randRange(_arg_3, 20, 0));
        super.m_bitmap.scaleX = (super.m_bitmap.scaleY = randRange2(_arg_3, 0.5, 1, 1));
    }

    override protected function getEmissVelocity(_arg_1:ParticleEffectArg):Number
    {
        return ((_arg_1.emissVelocity + randRange(_arg_1, 2, 0)));
    }

    override protected function getEmissAngle(_arg_1:ParticleEffectArg, _arg_2:int):Number
    {
        var _local_3:Number = fixValue((_arg_1.emissAngle / 180));
        var _local_4:Number = (1 - _local_3);
        return (randRange2(_arg_1, _local_3, _local_4, 0.5));
    }

    public /*  ©init. */ function _SafeStr_379()
    {
    }


}
class HoriSprinkleParticleElement extends SprinkleParticleElementBase 
{

    public function HoriSprinkleParticleElement()
    {
        super();
    }

    /*private*/ static function calcZOrder(_arg_1:Number):Number
    {
        var _local_2:Number = 0;
        if ((((_arg_1 >= 0)) && ((_arg_1 <= 0.25)))){
            _local_2 = _arg_1;
        } else {
            if ((((_arg_1 > 0.25)) && ((_arg_1 <= 0.5)))){
                _local_2 = (0.5 - _arg_1);
            } else {
                if ((((_arg_1 > 0.5)) && ((_arg_1 <= 0.75)))){
                    _local_2 = (0.5 - _arg_1);
                } else {
                    _local_2 = (_arg_1 - 1);
                };
            };
        };
        return (_local_2);
    }


    override protected function behaviorInit(_arg_1:MapPosition, _arg_2:Vector.<Number>, _arg_3:ParticleEffectArg, _arg_4:int):void
    {
        super.behaviorInit(_arg_1, _arg_2, _arg_3, _arg_4);
        var _local_5:Number = ((Math.PI / 180) * _arg_3.emissAngle);
        var _local_6:Number = (Math.sin(_local_5) * _arg_3.emissVelocity);
        var _local_7:Number = (Math.cos(_local_5) * _arg_3.emissVelocity);
        var _local_8:Number = _arg_3.randFactor;
        if (_arg_3.numGeneration > 0){
            _local_8 = (((_arg_4 / _arg_3.numGeneration) + _arg_3.randFactor) % 1);
        };
        var _local_9:Number = ((_local_8 * Math.PI) * 2);
        var _local_10:Number = Math.cos(_local_9);
        var _local_11:Number = Math.sin(_local_9);
        _arg_2[0] = (_local_7 * _local_10);
        _arg_2[1] = _local_6;
        _arg_2[2] = (_local_7 * _local_11);
        _arg_2[2] = (_arg_2[2] * 0.3);
        _arg_1.deepOffset = (calcZOrder(_local_8) * int.MAX_VALUE);
    }

    public /*  ©init. */ function _SafeStr_380()
    {
    }


}

// _SafeStr_376 = " ParticleElementManager" (String#14747)
// _SafeStr_377 = " SprinkleParticleElementBase" (String#14744)
// _SafeStr_378 = " VertSprinkleParticleElement" (String#14750)
// _SafeStr_379 = " RandVertSprinkleParticleElement" (String#14756)
// _SafeStr_380 = " HoriSprinkleParticleElement" (String#14753)


