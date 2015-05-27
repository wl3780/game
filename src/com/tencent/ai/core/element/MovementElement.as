// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.element.MovementElement

package com.tencent.ai.core.element
{
    import com.tencent.ai.core.components.GravityComponent;
    import com.tencent.ai.core.components.MoveComponent;
    import com.tencent.ai.core.components.BaseAIComponent;
    import com.tencent.ai.core.components.arg.MoveArg;
    import com.tencent.ai.core.components.arg.JumpArg;
    import __AS3__.vec.Vector;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.components.arg.PosArg;
    import com.tencent.ai.core.data.FrameData;
    import  ©init._SafeStr_398;
    import __AS3__.vec.*;

    public class MovementElement extends BaseElement implements ILogicObject 
    {

        protected var m_gravityCom:GravityComponent;
        protected var m_moveCom:MoveComponent;
        protected var m_aiCom:BaseAIComponent;
        protected var m_aiComRun:Boolean = true;
        protected var m_moveArg:MoveArg;
        protected var m_lastestVX:int = 0;
        protected var m_jumArg:JumpArg;
        protected var m_currentFrameIndex:int;
        protected var m_freezeTimes:int = 0;
        protected var m_nextFrameFuncs:Vector.<CFunction>;
        private var _xEvent:ElementEvent;
        private var _zEvent:ElementEvent;
        private var _yEvent:ElementEvent;
        private var _xzyEvent:ElementEvent;
        private var _dirEvent:ElementEvent;

        public function MovementElement(_arg_1:String)
        {
            this.m_moveArg = new MoveArg();
            this.m_jumArg = new JumpArg();
            super(_arg_1);
        }

        override protected function initThis():void
        {
            super.initThis();
            this.m_nextFrameFuncs = new Vector.<CFunction>();
            this._xEvent = new ElementEvent(ElementEvent.ON_X_CHANGE, this);
            this._zEvent = new ElementEvent(ElementEvent.ON_Z_CHANGE, this);
            this._yEvent = new ElementEvent(ElementEvent.ON_Y_CHANGE, this);
            this._xzyEvent = new ElementEvent(ElementEvent.ON_XZY_CHANGE, this);
            this._xzyEvent.data = {
                "x":0,
                "z":0,
                "y":0
            };
            this._dirEvent = new ElementEvent(ElementEvent.ON_DIR_CHANGE, this);
        }

        protected function executeFrame(_arg_1:int):void
        {
            var _local_2:CFunction;
            while (this.m_nextFrameFuncs.length > 0) {
                _local_2 = this.m_nextFrameFuncs.shift();
                _local_2.invoke();
            };
            if (this.m_moveCom != null){
                this.m_moveCom.enterframe(_arg_1);
            };
            if (this.m_gravityCom != null){
                this.m_gravityCom.enterframe(_arg_1);
            };
            if (((!((this.m_aiCom == null))) && (this.m_aiComRun))){
                this.m_aiCom.enterframe(_arg_1);
            };
        }

        public function set isAIComRun(_arg_1:Boolean):void
        {
            if (this.m_aiCom != null){
                this.m_aiComRun = _arg_1;
            };
        }

        public function get isAIComRun():Boolean
        {
            return (this.m_aiComRun);
        }

        override public function setParentContainer(_arg_1:IElementContainer):void
        {
            super.setParentContainer(_arg_1);
            if (this.m_moveCom != null){
                this.m_moveCom.updateEnvironment();
            };
            if (this.m_gravityCom != null){
                this.m_gravityCom.updateEnvironment();
            };
            if (this.m_aiCom != null){
                this.m_aiCom.updateEnvironment();
            };
        }

        public function setMoveEnabled(_arg_1:Boolean):void
        {
            if (_arg_1){
                this.m_moveCom = new MoveComponent(this);
            } else {
                this.m_moveCom = null;
            };
        }

        public function setGravityEnabled(_arg_1:Boolean):void
        {
            if (_arg_1){
                this.m_gravityCom = new GravityComponent(this);
            } else {
                this.m_gravityCom = null;
            };
        }

        public function setAIComponent(_arg_1:BaseAIComponent):void
        {
            if (this.m_aiCom != _arg_1){
                if (this.m_aiCom != null){
                    this.m_aiCom.reset();
                };
                this.m_aiCom = _arg_1;
                if (this.m_aiCom != null){
                    if (!this.m_aiCom.hasTarget()){
                        this.m_aiCom.attachTarget(this);
                    };
                    if (m_parent){
                        this.m_aiCom.updateEnvironment();
                    };
                };
            };
        }

        public function move(_arg_1:int, _arg_2:int, _arg_3:Boolean=false):void
        {
            if (_arg_1 == PosArg.DIR_X){
                this.m_lastestVX = _arg_2;
            };
            this.m_moveArg.dir = _arg_1;
            this.m_moveArg.v = _arg_2;
            this.m_moveArg.f = 0;
            this.m_moveArg.func = null;
            this.m_moveArg.igT = _arg_3;
            this.m_moveCom.run(this.m_moveArg);
        }

        public function getBodyHeight():Number
        {
            if (m_display != null){
                return (m_display.height);
            };
            return (0);
        }

        public function getLastestVX():int
        {
            return (((this.m_lastestVX ^ (this.m_lastestVX >> 31)) - (this.m_lastestVX >> 31)));
        }

        public function getCurrentVX():int
        {
            var _local_1:int = this.m_moveCom.getCurrentV();
            return (((_local_1 ^ (_local_1 >> 31)) - (_local_1 >> 31)));
        }

        public function getCurrentVY():int
        {
            return (this.m_gravityCom.getCurrentV());
        }

        public function slip(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:CFunction=null, _arg_5:Boolean=false):void
        {
            if (_arg_1 == PosArg.DIR_X){
                this.m_lastestVX = 0;
            };
            this.m_moveArg.dir = _arg_1;
            this.m_moveArg.v = _arg_2;
            this.m_moveArg.f = _arg_3;
            this.m_moveArg.func = _arg_4;
            this.m_moveArg.igT = _arg_5;
            this.m_moveCom.run(this.m_moveArg);
        }

        public function jump(_arg_1:int, _arg_2:CFunction=null, _arg_3:CFunction=null, _arg_4:int=-1):void
        {
            this.m_jumArg.v = _arg_1;
            this.m_jumArg.g = _arg_4;
            this.m_jumArg.endFunc = _arg_2;
            this.m_jumArg.vChange = _arg_3;
            this.m_gravityCom.run(this.m_jumArg);
        }

        public function setJumpListener(_arg_1:CFunction, _arg_2:CFunction=null):void
        {
            this.m_jumArg.v = this.m_gravityCom.getCurrentV();
            this.m_jumArg.endFunc = _arg_1;
            this.m_jumArg.vChange = _arg_2;
            this.m_gravityCom.run(this.m_jumArg);
        }

        public function stopMove(_arg_1:int=-1):void
        {
            if (this.m_moveCom == null){
                return;
            };
            if (_arg_1 == -1){
                this.m_moveCom.stop();
            } else {
                this.move(_arg_1, 0);
            };
        }

        public function stopJump():void
        {
            if (this.m_gravityCom == null){
                return;
            };
            this.m_gravityCom.stop();
        }

        public function getGravityComponent():GravityComponent
        {
            return (this.m_gravityCom);
        }

        public function getMoveComponent():MoveComponent
        {
            return (this.m_moveCom);
        }

        public function getAIComponent():BaseAIComponent
        {
            return (this.m_aiCom);
        }

        public function setFrameData(_arg_1:FrameData):void
        {
        }

        public function getFrameData():FrameData
        {
            return (null);
        }

        public function getCurrentFrameIndex():int
        {
            return (this.m_currentFrameIndex);
        }

        public function freeze(_arg_1:int):void
        {
            this.m_freezeTimes = _arg_1;
        }

        public function resetFreeze():void
        {
            this.m_freezeTimes = 0;
        }

        public function isFreeze():Boolean
        {
            return (!((this.m_freezeTimes == 0)));
        }

        public function enterframe(_arg_1:int):void
        {
            this.m_currentFrameIndex = _arg_1;
            if (this.m_freezeTimes > 0){
                this.m_freezeTimes = (this.m_freezeTimes - 1);
                return;
            };
            this.executeFrame(_arg_1);
        }

        override public function setMapX(_arg_1:int):void
        {
            var _local_2 = !((mapX == _arg_1));
            super.setMapX(_arg_1);
            if (_local_2){
                this._xEvent.data = _arg_1;
                dispatchEvent(this._xEvent);
            };
        }

        override public function setMapZ(_arg_1:int):void
        {
            var _local_2 = !((mapZ == _arg_1));
            super.setMapZ(_arg_1);
            if (_local_2){
                this._zEvent.data = _arg_1;
                dispatchEvent(this._zEvent);
            };
        }

        override public function setMapY(_arg_1:int):void
        {
            var _local_2 = !((mapY == _arg_1));
            super.setMapY(_arg_1);
            if (_local_2){
                this._yEvent.data = _arg_1;
                dispatchEvent(this._yEvent);
            };
        }

        override public function setMapXZY(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            var _local_5:Object;
            var _local_4:Boolean = ((((!((mapX == _arg_1))) || (!((mapZ == _arg_2))))) || (!((mapY == _arg_3))));
            super.setMapXZY(_arg_1, _arg_2, _arg_3);
            if (_local_4){
                _local_5 = this._xzyEvent.data;
                _local_5.x = _arg_1;
                _local_5.z = _arg_2;
                _local_5.y = _arg_3;
                dispatchEvent(this._xzyEvent);
            };
        }

        override public function setDirection(_arg_1:int):void
        {
            var _local_2 = !((m_direction == _arg_1));
            super.setDirection(_arg_1);
            if (_local_2){
                this._dirEvent.data = _arg_1;
                dispatchEvent(this._dirEvent);
            };
        }

        public function execNextFrame(_arg_1:CFunction):void
        {
            this.m_nextFrameFuncs.push(_arg_1);
        }

        public function clearNextFrameFuncs(_arg_1:Boolean=false):void
        {
            var _local_2:int;
            var _local_3:CFunction;
            var _local_4:Array;
            if (this.m_nextFrameFuncs != null){
                if (_arg_1){
                    _local_2 = (this.m_nextFrameFuncs.length - 1);
                    while (_local_2 >= 0) {
                        _local_3 = this.m_nextFrameFuncs[_local_2];
                        _local_4 = _local_3.params;
                        if ((((_local_4 == null)) || (!(_local_4.exclude)))){
                            this.m_nextFrameFuncs.splice(_local_2, 1);
                        };
                        _local_2--;
                    };
                } else {
                    this.m_nextFrameFuncs.length = 0;
                };
            };
        }

        override public function reset():void
        {
            this.m_currentFrameIndex = 0;
            this.m_freezeTimes = 0;
            this.m_lastestVX = 0;
            this.m_aiComRun = true;
            if (this.m_nextFrameFuncs != null){
                this.m_nextFrameFuncs.length = 0;
            };
            if (this.m_moveCom != null){
                this.m_moveCom.stop();
                this.m_moveCom.reset();
            };
            if (this.m_gravityCom != null){
                this.m_gravityCom.stop();
                this.m_gravityCom.reset();
            };
            if (this.m_aiCom != null){
                this.m_aiCom.reset();
            };
            super.reset();
        }

        public /*  ©init. */ function _SafeStr_398()
        {
        }


    }
}//package com.tencent.ai.core.element

// _SafeStr_398 = " MovementElement" (String#13892)


