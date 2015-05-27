// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.combat.Battle

package com.tencent.ai.core.combat
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.element.ILogicObject;
    import com.tencent.ai.core.scene.IScene;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.ai.GameAI;
    import com.tencent.ai.core.element.ITickObject;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.FrameData;
    import com.tencent.ai.core.data.HitArea;
    import com.tencent.ai.core.utils.Rectangle3D;
    import  ©init._SafeStr_76;
    import __AS3__.vec.*;

    public class Battle extends EventDispatcher implements ILogicObject 
    {

        private static var _Current:Battle;

        private var _currentIndex:int;
        private var _nextIndex:int;
        private var _freezeTimes:int;
        private var _currentScene:IScene;
        private var _elementGroups:Vector.<Vector.<InteractElement>>;
        private var _linkHead:LinkHead;
        private var _logicObjs:Vector.<ILogicObject>;
        private var _logicExecIndex:int;
        private var _behindFrameFuncs:Vector.<CFunction>;
        private var _gameAI:GameAI;
        private var _tickObjects:Vector.<ITickObject>;
        private var _smState:Boolean;
        private var _smStepTimes:int;
        private var _smPauseTimes:int;
        private var _smSleepTimes:int;
        private var _smCurrSleepTimes:int;
        private var _smFrameD:int;
        private var _nextPp:InteractElement;

        public function Battle()
        {
            this.initThis();
        }

        public static function get Current():Battle
        {
            if (_Current == null){
                _Current = new (Battle)();
            };
            return (_Current);
        }


        private function initThis():void
        {
            this._currentIndex = 0;
            this._nextIndex = 0;
            this._freezeTimes = 0;
            this._linkHead = new LinkHead();
            this._nextPp = null;
            this._elementGroups = new Vector.<Vector.<InteractElement>>(ElementGroupDef.MAX_GROUP_SIZE);
            this._tickObjects = new Vector.<ITickObject>();
            this._logicObjs = new Vector.<ILogicObject>();
            this._logicExecIndex = -1;
            this._behindFrameFuncs = new Vector.<CFunction>();
            this._gameAI = GameAI.Current;
        }

        private function _smExecFrame():Boolean
        {
            this._smPauseTimes--;
            if (this._smPauseTimes > 0){
                this._smStepTimes--;
                if (this._smStepTimes > 0){
                    return (true);
                };
            } else {
                this._smSleepTimes--;
                if (this._smSleepTimes <= 0){
                    this._smSleepTimes = this._smCurrSleepTimes;
                    if (this._smCurrSleepTimes >= 6){
                        this._smFrameD = (this._smFrameD * -1);
                    };
                    this._smCurrSleepTimes = (this._smCurrSleepTimes + this._smFrameD);
                    if ((((this._smCurrSleepTimes <= 0)) && ((this._smFrameD == -1)))){
                        this._smState = false;
                    };
                    return (true);
                };
            };
            return (false);
        }

        private function onElementGroupChange(_arg_1:ElementEvent):void
        {
            var _local_2:InteractElement = (_arg_1.getTarget() as InteractElement);
            if (_local_2 != null){
                this.removeInteractElement(_local_2, _arg_1.data.oldGroupID, false);
                this.addInteractElement(_local_2, false);
            };
        }

        public function changeElementGroupEvent(_arg_1:ElementEvent):void
        {
            this.onElementGroupChange(_arg_1);
        }

        public function bindScene(_arg_1:IScene):void
        {
            this.removeAllObjects();
            this._currentScene = _arg_1;
            this._currentScene.registerFunction(this.addInteractElement, this.removeInteractElement, this.tkoRender, ElementType.CLASS_ID_INTERACT);
            AICore.combatSystem.getDmgMeters().bindScene(_arg_1);
        }

        public function unbind():void
        {
            this.removeAllObjects();
            if (this._currentScene != null){
                this._currentScene.registerFunction(null, null, null, 0);
                this._currentScene = null;
                AICore.combatSystem.getDmgMeters().unbind();
            };
        }

        public function getCurrentScene():IScene
        {
            return (this._currentScene);
        }

        public function getCurrentFrameIndex():int
        {
            return (this._currentIndex);
        }

        public function enterframe(_arg_1:int):void
        {
            var _local_2:InteractElement;
            var _local_3:CFunction;
            this._nextIndex = _arg_1;
            if (((!(this._smState)) || (this._smExecFrame()))){
                if (this._freezeTimes > 0){
                    this._freezeTimes = (this._freezeTimes - 1);
                } else {
                    this._currentIndex = _arg_1;
                    this._nextPp = this._linkHead.lNext;
                    while (this._nextPp != null) {
                        _local_2 = this._nextPp;
                        this._nextPp = this._nextPp.lNext;
                        _local_2.enterframe(_arg_1);
                    };
                    this._gameAI.enterframe(_arg_1);
                    this._logicExecIndex = (this._logicObjs.length - 1);
                    while (this._logicExecIndex >= 0) {
                        this._logicObjs[this._logicExecIndex].enterframe(_arg_1);
                        this._logicExecIndex--;
                    };
                    while (this._behindFrameFuncs.length > 0) {
                        _local_3 = this._behindFrameFuncs.shift();
                        _local_3.invoke();
                    };
                };
            };
        }

        public function smSlowMotion():void
        {
            this._smState = true;
            this._smPauseTimes = 30;
            this._smStepTimes = 5;
            this._smSleepTimes = 0;
            this._smCurrSleepTimes = 1;
            this._smFrameD = 1;
        }

        public function freeze(_arg_1:int):void
        {
            this._freezeTimes = _arg_1;
        }

        public function resetFreeze():void
        {
            this._freezeTimes = 0;
        }

        public function setFrameData(_arg_1:FrameData):void
        {
        }

        public function getFrameData():FrameData
        {
            return (null);
        }

        public function addInteractElement(_arg_1:InteractElement, _arg_2:Boolean=true):void
        {
            var _local_5:InteractElement;
            var _local_3:int = _arg_1.groupID;
            var _local_4:Vector.<InteractElement> = this._elementGroups[_local_3];
            if (_local_4 == null){
                _local_4 = new Vector.<InteractElement>();
                this._elementGroups[_local_3] = _local_4;
            };
            _local_4.push(_arg_1);
            if (_arg_1.needGroupChange){
                _arg_1.addEventListener(ElementEvent.ON_GROUP_CHANGE, this.onElementGroupChange);
            };
            if (_arg_2){
                if (_arg_1.lPrev == null){
                    _local_5 = this._linkHead.lNext;
                    this._linkHead.lNext = _arg_1;
                    _arg_1.lPrev = this._linkHead;
                    _arg_1.lNext = _local_5;
                    if (_local_5){
                        _local_5.lPrev = _arg_1;
                    };
                } else {
                    throw (new Error("[Battle] 链表中的元素父级不为空!!"));
                };
            };
        }

        public function removeInteractElement(_arg_1:InteractElement, _arg_2:int=-1, _arg_3:Boolean=true):void
        {
            var _local_5:int;
            var _local_6:Object;
            var _local_7:InteractElement;
            if (_arg_2 == -1){
                _arg_2 = _arg_1.groupID;
            };
            var _local_4:Vector.<InteractElement> = this._elementGroups[_arg_2];
            if (_local_4 != null){
                _local_5 = _local_4.indexOf(_arg_1);
                if (_local_5 != -1){
                    _local_4.splice(_local_5, 1);
                    if (_arg_1.needGroupChange){
                        _arg_1.removeEventListener(ElementEvent.ON_GROUP_CHANGE, this.onElementGroupChange);
                    };
                };
            };
            if (_arg_3){
                _local_6 = _arg_1.lPrev;
                _local_7 = _arg_1.lNext;
                if (_arg_1 == this._nextPp){
                    this._nextPp = _local_7;
                };
                if (_local_6){
                    _local_6.lNext = _local_7;
                };
                if (_local_7){
                    _local_7.lPrev = _local_6;
                };
                _arg_1.lPrev = null;
                _arg_1.lNext = null;
            };
        }

        public function addLogicObject(_arg_1:ILogicObject):void
        {
            if (_arg_1 != null){
                this._logicObjs.push(_arg_1);
            };
        }

        public function removeLogicObject(_arg_1:ILogicObject):Boolean
        {
            var _local_2:int;
            if (_arg_1 != null){
                _local_2 = this._logicObjs.indexOf(_arg_1);
                if (_local_2 != -1){
                    if (_local_2 < this._logicExecIndex){
                        this._logicExecIndex--;
                    };
                    this._logicObjs.splice(_local_2, 1);
                    return (true);
                };
            };
            return (false);
        }

        public function execBehindFrame(_arg_1:CFunction):void
        {
            this._behindFrameFuncs.push(_arg_1);
        }

        public function everyCollision(_arg_1:HitArea, _arg_2:ICollisionListener):Boolean
        {
            var _local_6:Vector.<InteractElement>;
            var _local_7:int;
            var _local_8:InteractElement;
            var _local_9:int;
            var _local_3:int = _arg_1.groupID;
            var _local_4:Object = _arg_1.attachObj;
            var _local_5:int = 1;
            while (_local_5 < ElementGroupDef.MAX_GROUP_SIZE) {
                if (_local_3 != _local_5){
                    _local_6 = this._elementGroups[_local_5];
                    if (_local_6 != null){
                        _local_7 = (_local_6.length - 1);
                        while (_local_7 >= 0) {
                            _local_8 = _local_6[_local_7];
                            if (_local_8 != _local_4){
                                _local_9 = _local_8.hitTest(_arg_1);
                                if (_local_9 != 0){
                                    if (_arg_2.onCollision(_local_8, _arg_1, _local_9)){
                                        return (true);
                                    };
                                };
                            };
                            _local_7--;
                        };
                    };
                };
                _local_5++;
            };
            return (false);
        }

        public function getTheCollisions(_arg_1:Vector.<InteractElement>, _arg_2:HitArea):void
        {
            var _local_6:Vector.<InteractElement>;
            var _local_7:int;
            var _local_8:int;
            var _local_9:InteractElement;
            var _local_10:int;
            var _local_3:int = _arg_2.groupID;
            var _local_4:Object = _arg_2.attachObj;
            if (_arg_1 == null){
                _arg_1 = new Vector.<InteractElement>();
            };
            var _local_5:int = 1;
            while (_local_5 < ElementGroupDef.MAX_GROUP_SIZE) {
                if (_local_3 != _local_5){
                    _local_6 = this._elementGroups[_local_5];
                    if (_local_6 != null){
                        _local_7 = _local_6.length;
                        _local_8 = 0;
                        while (_local_8 < _local_7) {
                            _local_9 = _local_6[_local_8];
                            if (_local_9 != _local_4){
                                _local_10 = _local_9.hitTest(_arg_2);
                                if (_local_10 != 0){
                                    _arg_1.push(_local_9);
                                };
                            };
                            _local_8++;
                        };
                    };
                };
                _local_5++;
            };
        }

        public function findElementsInArea(_arg_1:Vector.<InteractElement>, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Array=null, _arg_6:String=""):void
        {
            var _local_12:Vector.<InteractElement>;
            var _local_13:int;
            var _local_14:int;
            var _local_15:InteractElement;
            var _local_16:int;
            var _local_17:int;
            if (_arg_1 == null){
                _arg_1 = new Vector.<InteractElement>();
            };
            var _local_7:int = (_arg_2 - _arg_4);
            var _local_8:int = (_arg_2 + _arg_4);
            var _local_9:int = (_arg_3 - _arg_4);
            var _local_10:int = (_arg_3 + _arg_4);
            var _local_11:int = 1;
            while (_local_11 < ElementGroupDef.MAX_GROUP_SIZE) {
                if (!((!((_arg_5 == null))) && (!((_arg_5.indexOf(_local_11) == -1))))){
                    _local_12 = this._elementGroups[_local_11];
                    if (_local_12 != null){
                        _local_13 = _local_12.length;
                        _local_14 = 0;
                        while (_local_14 < _local_13) {
                            _local_15 = _local_12[_local_14];
                            if (_local_15.getType() != _arg_6){
                                _local_16 = _local_15.mapX;
                                _local_17 = _local_15.mapZ;
                                if ((((((((_local_16 > _local_7)) && ((_local_16 < _local_8)))) && ((_local_17 > _local_9)))) && ((_local_17 < _local_10)))){
                                    _arg_1.push(_local_15);
                                };
                            };
                            _local_14++;
                        };
                    };
                };
                _local_11++;
            };
        }

        public function findElementNearest(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Array=null, _arg_5:String=""):InteractElement
        {
            var _local_7:InteractElement;
            var _local_9:Vector.<InteractElement>;
            var _local_10:int;
            var _local_11:int;
            var _local_12:InteractElement;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_6:int = (_arg_3 * _arg_3);
            var _local_8:int = 1;
            while (_local_8 < ElementGroupDef.MAX_GROUP_SIZE) {
                if (!((!((_arg_4 == null))) && (!((_arg_4.indexOf(_local_8) == -1))))){
                    _local_9 = this._elementGroups[_local_8];
                    if (_local_9 != null){
                        _local_10 = _local_9.length;
                        _local_11 = 0;
                        while (_local_11 < _local_10) {
                            _local_12 = _local_9[_local_11];
                            if (_local_12.getType() != _arg_5){
                                _local_13 = (_local_12.mapX - _arg_1);
                                _local_14 = (_local_12.mapZ - _arg_2);
                                _local_15 = ((_local_13 * _local_13) + (_local_14 * _local_14));
                                if (_local_15 <= _local_6){
                                    _local_7 = _local_12;
                                    _local_6 = _local_15;
                                };
                            };
                            _local_11++;
                        };
                    };
                };
                _local_8++;
            };
            return (_local_7);
        }

        public function findElementsInRectangle(_arg_1:Vector.<InteractElement>, _arg_2:Rectangle3D, _arg_3:Array=null, _arg_4:String=""):void
        {
            var _local_12:Vector.<InteractElement>;
            var _local_13:int;
            var _local_14:int;
            var _local_15:InteractElement;
            if (_arg_1 == null){
                _arg_1 = new Vector.<InteractElement>();
            };
            var _local_5:int = _arg_2.x;
            var _local_6:int = (_arg_2.x + _arg_2.wigth);
            var _local_7:int = _arg_2.y;
            var _local_8:int = (_arg_2.y + _arg_2.height);
            var _local_9:int = _arg_2.z;
            var _local_10:int = (_arg_2.z + _arg_2.deepZ);
            var _local_11:int = 1;
            while (_local_11 < ElementGroupDef.MAX_GROUP_SIZE) {
                if (!((!((_arg_3 == null))) && (!((_arg_3.indexOf(_local_11) == -1))))){
                    _local_12 = this._elementGroups[_local_11];
                    if (_local_12 != null){
                        _local_13 = _local_12.length;
                        _local_14 = 0;
                        while (_local_14 < _local_13) {
                            _local_15 = _local_12[_local_14];
                            if (_local_15.getType() != _arg_4){
                                if (_arg_2.contains(_local_15.mapX, _local_15.mapY, _local_15.mapZ)){
                                    _arg_1.push(_local_15);
                                };
                            };
                            _local_14++;
                        };
                    };
                };
                _local_11++;
            };
        }

        public function findElementsInRectangle2(_arg_1:Vector.<InteractElement>, _arg_2:Rectangle3D, _arg_3:Array=null, _arg_4:String="", _arg_5:int=1, _arg_6:int=5):void
        {
            var _local_14:Vector.<InteractElement>;
            var _local_15:int;
            var _local_16:int;
            var _local_17:InteractElement;
            if (_arg_1 == null){
                _arg_1 = new Vector.<InteractElement>();
            };
            var _local_7:int = _arg_2.x;
            var _local_8:int = (_arg_2.x + _arg_2.wigth);
            var _local_9:int = _arg_2.y;
            var _local_10:int = (_arg_2.y + _arg_2.height);
            var _local_11:int = _arg_2.z;
            var _local_12:int = (_arg_2.z + _arg_2.deepZ);
            var _local_13:int = _arg_5;
            while (_local_13 < _arg_6) {
                if (!((!((_arg_3 == null))) && (!((_arg_3.indexOf(_local_13) == -1))))){
                    _local_14 = this._elementGroups[_local_13];
                    if (_local_14 != null){
                        _local_15 = _local_14.length;
                        _local_16 = 0;
                        while (_local_16 < _local_15) {
                            _local_17 = _local_14[_local_16];
                            if (_local_17.getType() == _arg_4){
                                if (_arg_2.contains(_local_17.mapX, _local_17.mapY, _local_17.mapZ)){
                                    _arg_1.push(_local_17);
                                };
                            };
                            _local_16++;
                        };
                    };
                };
                _local_13++;
            };
        }

        public function findElementNearestInRectangle(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Rectangle3D, _arg_5:Array=null, _arg_6:String=""):InteractElement
        {
            var _local_7:InteractElement;
            var _local_16:Vector.<InteractElement>;
            var _local_17:int;
            var _local_18:int;
            var _local_19:InteractElement;
            var _local_20:int;
            var _local_8 = 999999;
            var _local_9:int = _arg_4.x;
            var _local_10:int = (_arg_4.x + _arg_4.wigth);
            var _local_11:int = _arg_4.y;
            var _local_12:int = (_arg_4.y + _arg_4.height);
            var _local_13:int = _arg_4.z;
            var _local_14:int = (_arg_4.z + _arg_4.deepZ);
            var _local_15:int = 1;
            while (_local_15 < ElementGroupDef.MAX_GROUP_SIZE) {
                if (!((!((_arg_5 == null))) && (!((_arg_5.indexOf(_local_15) == -1))))){
                    _local_16 = this._elementGroups[_local_15];
                    if (_local_16 != null){
                        _local_17 = _local_16.length;
                        _local_18 = 0;
                        while (_local_18 < _local_17) {
                            _local_19 = _local_16[_local_18];
                            if (_local_19.getType() != _arg_6){
                                if (_arg_4.contains(_local_19.mapX, _local_19.mapY, _local_19.mapZ)){
                                    _local_20 = Math.sqrt(((((_arg_1 - _local_19.mapX) * (_arg_1 - _local_19.mapX)) + ((_arg_2 - _local_19.mapY) * (_arg_2 - _local_19.mapY))) + ((_arg_3 - _local_19.mapZ) * (_arg_3 - _local_19.mapZ))));
                                    if (_local_20 < _local_8){
                                        _local_7 = _local_19;
                                        _local_8 = _local_20;
                                    };
                                };
                            };
                            _local_18++;
                        };
                    };
                };
                _local_15++;
            };
            return (_local_7);
        }

        public function getGroup(_arg_1:int=-1):Vector.<InteractElement>
        {
            if ((((_arg_1 > 0)) && ((_arg_1 < ElementGroupDef.MAX_GROUP_SIZE)))){
                return (this._elementGroups[_arg_1]);
            };
            return (null);
        }

        public function tickObjectAdd(_arg_1:ITickObject):void
        {
            if (this._tickObjects.indexOf(_arg_1) == -1){
                this._tickObjects.push(_arg_1);
            };
        }

        public function tickObjectRemove(_arg_1:ITickObject):void
        {
            var _local_2:int = this._tickObjects.indexOf(_arg_1);
            if (_local_2 != -1){
                this._tickObjects.splice(_local_2, 1);
            };
        }

        public function tkoRender(_arg_1:int):void
        {
            var _local_2:int = this._nextIndex;
            var _local_3:int = (this._tickObjects.length - 1);
            while (_local_3 >= 0) {
                this._tickObjects[_local_3].enterframe(_local_2);
                _local_3--;
            };
        }

        public function removeAllTickObjects():void
        {
            this._tickObjects.length = 0;
        }

        public function removeAllObjects():void
        {
            var _local_3:InteractElement;
            var _local_4:Vector.<InteractElement>;
            var _local_1:InteractElement = this._linkHead.lNext;
            while (_local_1 != null) {
                _local_3 = _local_1;
                _local_1 = _local_1.lNext;
                _local_3.lPrev = null;
                _local_3.lNext = null;
                if (_local_3.needGroupChange){
                    _local_3.removeEventListener(ElementEvent.ON_GROUP_CHANGE, this.onElementGroupChange);
                };
            };
            this._linkHead.lNext = null;
            var _local_2:int = (this._elementGroups.length - 1);
            while (_local_2 >= 0) {
                _local_4 = this._elementGroups[_local_2];
                if (_local_4){
                    _local_4.length = 0;
                };
                _local_2--;
            };
            if (this._logicObjs){
                this._logicObjs.length = 0;
            };
            if (this._behindFrameFuncs){
                this._behindFrameFuncs.length = 0;
            };
            this._gameAI.removeAllComs();
            this._currentIndex = 0;
            this._nextIndex = 0;
            this._freezeTimes = 0;
            this._smState = false;
            this.removeAllTickObjects();
        }

        public /*  ©init. */ function _SafeStr_76()
        {
        }


    }
}//package com.tencent.ai.core.combat

import com.tencent.ai.core.element.InteractElement;
import  ©init._SafeStr_77;

class LinkHead 
{

    public var lPrev:InteractElement = null;
    public var lNext:InteractElement = null;

    public function LinkHead()
    {
        super();
    }

    public /*  ©init. */ function _SafeStr_77()
    {
    }


}

// _SafeStr_76 = " Battle" (String#15446)
// _SafeStr_77 = " LinkHead" (String#15443)


