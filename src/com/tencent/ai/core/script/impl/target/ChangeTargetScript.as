// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.ChangeTargetScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITargetHasSkill;
    import com.tencent.ai.core.combat.IAttackDelegate;
    import com.tencent.ai.core.data.arg.script.ChangeTargetArg;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.DirectionValue;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1212;

    public class ChangeTargetScript implements IScript 
    {

        protected var m_target:ITargetHasSkill;
        protected var m_attackDelegate:IAttackDelegate;
        protected var m_watchTarget:WatchTargetElement;
        private var _addLastRs:Boolean = false;


        protected function changeCatchAims(_arg_1:ChangeTargetArg):void
        {
            if (this.m_watchTarget == null){
                this.m_watchTarget = new WatchTargetElement();
            };
            this.m_watchTarget.setParams(_arg_1, this.m_attackDelegate.cacthAims);
            this.m_watchTarget.bind(this.m_target.target);
            if (!this._addLastRs){
                this._addLastRs = true;
                this.m_target.addLastRS(this);
            };
        }

        protected function unChangeCatchAims(_arg_1:Boolean=true):void
        {
            if (this._addLastRs){
                this._addLastRs = false;
                this.m_target.removeLastRs(this);
            };
            this.m_watchTarget.unbind(_arg_1);
        }

        protected function changeSelf(_arg_1:ChangeTargetArg):void
        {
            var _local_2:BaseElement = (this.m_target.target as BaseElement);
            var _local_3:int = _local_2.getDirection();
            var _local_4:int = _arg_1.dirValue;
            switch (_local_4){
                case DirectionValue.DIR_REVERSE:
                    _local_3 = (_local_3 * -1);
                    _local_2.setDirection(_local_3);
                    break;
                case DirectionValue.DIR_SET_LEFT:
                    _local_3 = Direction.LEFT;
                    _local_2.setDirection(_local_3);
                    break;
                case DirectionValue.DIR_SET_RIGHT:
                    _local_3 = Direction.RIGHT;
                    _local_2.setDirection(_local_3);
                    break;
            };
            var _local_5:int = (_local_2.mapX + (_local_3 * _arg_1.offsetX));
            var _local_6:int = (_local_2.mapY + _arg_1.offsetY);
            var _local_7:int = (_local_2.mapZ + _arg_1.offsetZ);
            _local_2.setMapXZY(_local_5, _local_7, _local_6);
        }

        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITargetHasSkill(_arg_1);
            this.m_attackDelegate = this.m_target.getAttackDelegate();
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:ChangeTargetArg = (_arg_2 as ChangeTargetArg);
            if (_local_3 != null){
                if (_local_3.release){
                    this.unChangeCatchAims(false);
                } else {
                    if (!_local_3.self){
                        this.changeCatchAims(_local_3);
                    } else {
                        this.changeSelf(_local_3);
                    };
                };
            } else {
                if (this.m_watchTarget != null){
                    this.unChangeCatchAims();
                };
            };
        }

        public function stop():void
        {
            this._addLastRs = false;
            this.m_watchTarget.unbind(false);
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_CHANGE_TARGET);
        }

        public /*  ©init. */ function _SafeStr_1212()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

import com.tencent.ai.core.actor.HasActionElement;
import __AS3__.vec.Vector;
import com.tencent.ai.core.events.ElementEvent;
import com.tencent.ai.core.data.arg.script.ChangeTargetArg;
import com.tencent.ai.core.events.BaseEvent;
import com.tencent.ai.core.render.IElementView;
import  ©init._SafeStr_1213;

class WatchTargetElement 
{

    /*private*/ var _target:HasActionElement;
    /*private*/ var _offsetX:int;
    /*private*/ var _offsetY:int;
    /*private*/ var _offsetZ:int;
    /*private*/ var _rotation:int;
    /*private*/ var _frameIndex:int;
    /*private*/ var _catchAims:Vector.<HasActionElement>;
    /*private*/ var _isBinding:Boolean = false;

    public function WatchTargetElement()
    {
        super();
    }

    protected function listTargetMove(_arg_1:Boolean):void
    {
        if (_arg_1){
            this._target.addEventListener(ElementEvent.ON_DIR_CHANGE, this.onDirectionChange);
            this._target.addEventListener(ElementEvent.ON_X_CHANGE, this.onXChange);
            this._target.addEventListener(ElementEvent.ON_Z_CHANGE, this.onZChange);
            this._target.addEventListener(ElementEvent.ON_Y_CHANGE, this.onYChange);
            this._target.addEventListener(ElementEvent.ON_XZY_CHANGE, this.onXZYChange);
        } else {
            this._target.removeEventListener(ElementEvent.ON_DIR_CHANGE, this.onDirectionChange);
            this._target.removeEventListener(ElementEvent.ON_X_CHANGE, this.onXChange);
            this._target.removeEventListener(ElementEvent.ON_Z_CHANGE, this.onZChange);
            this._target.removeEventListener(ElementEvent.ON_Y_CHANGE, this.onYChange);
            this._target.removeEventListener(ElementEvent.ON_XZY_CHANGE, this.onXZYChange);
        };
    }

    public function setParams(_arg_1:ChangeTargetArg, _arg_2:Vector.<HasActionElement>):void
    {
        this._offsetX = _arg_1.offsetX;
        this._offsetY = _arg_1.offsetY;
        this._offsetZ = _arg_1.offsetZ;
        this._rotation = _arg_1.rotation;
        this._frameIndex = _arg_1.frameIndex;
        this._catchAims = _arg_2;
    }

    public function onXChange(_arg_1:BaseEvent):void
    {
        var _local_2:int;
        var _local_3:int;
        var _local_4:int;
        var _local_5:int;
        if (((!((this._catchAims == null))) && (!((this._catchAims.length == 0))))){
            _local_2 = this._catchAims.length;
            _local_3 = this._target.getDirection();
            _local_4 = (this._target.mapX + (_local_3 * this._offsetX));
            _local_5 = 0;
            while (_local_5 < _local_2) {
                this._catchAims[_local_5].setMapX(_local_4);
                _local_5++;
            };
        };
    }

    public function onZChange(_arg_1:BaseEvent):void
    {
        var _local_2:int;
        var _local_3:int;
        var _local_4:int;
        if (((!((this._catchAims == null))) && (!((this._catchAims.length == 0))))){
            _local_2 = this._catchAims.length;
            _local_3 = (this._target.mapZ + this._offsetZ);
            _local_4 = 0;
            while (_local_4 < _local_2) {
                this._catchAims[_local_4].setMapZ(_local_3);
                _local_4++;
            };
        };
    }

    public function onYChange(_arg_1:BaseEvent):void
    {
        var _local_2:int;
        var _local_3:int;
        var _local_4:int;
        if (((!((this._catchAims == null))) && (!((this._catchAims.length == 0))))){
            _local_2 = this._catchAims.length;
            _local_3 = (this._target.mapY + this._offsetY);
            _local_4 = 0;
            while (_local_4 < _local_2) {
                this._catchAims[_local_4].setMapY(_local_3);
                _local_4++;
            };
        };
    }

    public function onXZYChange(_arg_1:BaseEvent):void
    {
        var _local_2:int;
        var _local_3:int;
        var _local_4:int;
        var _local_5:int;
        var _local_6:int;
        var _local_7:int;
        if (((!((this._catchAims == null))) && (!((this._catchAims.length == 0))))){
            _local_2 = this._catchAims.length;
            _local_3 = this._target.getDirection();
            _local_4 = (this._target.mapX + (_local_3 * this._offsetX));
            _local_5 = (this._target.mapY + this._offsetY);
            _local_6 = (this._target.mapZ + this._offsetZ);
            _local_7 = 0;
            while (_local_7 < _local_2) {
                this._catchAims[_local_7].setMapXZY(_local_4, _local_6, _local_5);
                _local_7++;
            };
        };
    }

    public function onDirectionChange(_arg_1:BaseEvent):void
    {
        var _local_2:int;
        var _local_3:int;
        var _local_4:int;
        var _local_5:int;
        var _local_6:int;
        var _local_7:HasActionElement;
        if (((!((this._catchAims == null))) && (!((this._catchAims.length == 0))))){
            _local_2 = this._catchAims.length;
            _local_3 = this._target.getDirection();
            _local_4 = (this._target.mapX + (_local_3 * this._offsetX));
            _local_5 = (this._rotation * _local_3);
            _local_3 = (_local_3 * -1);
            _local_6 = 0;
            while (_local_6 < _local_2) {
                _local_7 = this._catchAims[_local_6];
                _local_7.getView().setRotation(_local_5);
                _local_7.forceSetDirection(_local_3);
                _local_7.setMapX(_local_4);
                _local_6++;
            };
        };
    }

    public function bind(_arg_1:HasActionElement):void
    {
        var _local_2:int;
        var _local_3:int;
        var _local_4:int;
        var _local_5:int;
        var _local_6:int;
        var _local_7:int;
        var _local_8:int;
        var _local_9:HasActionElement;
        var _local_10:IElementView;
        this._target = _arg_1;
        if (((!((this._catchAims == null))) && (!((this._catchAims.length == 0))))){
            _local_2 = this._catchAims.length;
            _local_3 = this._target.getDirection();
            _local_4 = (this._target.mapX + (_local_3 * this._offsetX));
            _local_5 = (this._target.mapY + this._offsetY);
            _local_6 = (this._target.mapZ + this._offsetZ);
            _local_7 = (this._rotation * _local_3);
            _local_3 = (_local_3 * -1);
            _local_8 = 0;
            while (_local_8 < _local_2) {
                _local_9 = this._catchAims[_local_8];
                _local_10 = _local_9.getView();
                _local_10.gotoAndStop(this._frameIndex);
                _local_10.setRotation(_local_7);
                _local_9.forceSetDirection(_local_3);
                _local_9.setMapXZY(_local_4, _local_6, _local_5);
                _local_8++;
            };
        };
        if (!this._isBinding){
            this.listTargetMove(true);
            this._isBinding = true;
        };
    }

    public function unbind(_arg_1:Boolean=true):void
    {
        var _local_2:int;
        var _local_3:int;
        var _local_4:HasActionElement;
        var _local_5:IElementView;
        if (this._isBinding){
            this._isBinding = false;
            if (((((!((this._catchAims == null))) && (!((this._catchAims.length == 0))))) && (_arg_1))){
                _local_2 = this._catchAims.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_4 = this._catchAims[_local_3];
                    _local_5 = _local_4.getView();
                    _local_5.setRotation(0);
                    _local_3++;
                };
            };
            this.listTargetMove(false);
            this._catchAims = null;
            this._target = null;
        };
    }

    public /*  ©init. */ function _SafeStr_1213()
    {
    }


}

// _SafeStr_1212 = " ChangeTargetScript" (String#16367)
// _SafeStr_1213 = " WatchTargetElement" (String#16364)


