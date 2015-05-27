// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetBeRidedScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.render.IFrameListener;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.actor.BaseActor;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.utils.Rectangle3D;
    import com.tencent.ai.core.action.IElementAction;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.data.arg.script.TargetBeRidedArg;
    import com.tencent.ai.core.enum.RideType;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1231;
    import __AS3__.vec.*;

    public class TargetBeRidedScript implements IScript, IFrameListener 
    {

        private var _target:ITarget;
        private var _targetActor:BaseActor;
        private var _rideStateType:int;
        private var _dx:int;
        private var _dz:int;
        private var _dy:int;
        private var _minY:int;
        private var _maxVY:int;
        private var _pauseAITimes:int;
        private var _checkInterval:int;
        private var _resArray:Vector.<InteractElement>;
        private var _ignoreGIDs:Array;

        public function TargetBeRidedScript()
        {
            this._ignoreGIDs = [];
            super();
        }

        public function setTarget(_arg_1:Object):void
        {
            this._target = (_arg_1 as ITarget);
        }

        public function getTarget():Object
        {
            return (this._target);
        }

        public function onFrameEvent(_arg_1:String):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:Rectangle3D;
            var _local_5:int;
            var _local_6:BaseActor;
            var _local_7:BaseActor;
            var _local_8:IElementAction;
            this._checkInterval++;
            if (this._checkInterval >= 5){
                this._checkInterval = 0;
                _local_2 = (this._targetActor.mapX - this._dx);
                _local_3 = (this._targetActor.mapZ - this._dz);
                _local_4 = new Rectangle3D(_local_2, 0, _local_3, (this._dx * 2), this._dy, (this._dz * 2));
                if (this._resArray == null){
                    this._resArray = new Vector.<InteractElement>();
                };
                Battle.Current.findElementsInRectangle2(this._resArray, _local_4, this._ignoreGIDs, ElementType.ET_PLAYER);
                _local_5 = (this._resArray.length - 1);
                if (_local_5 >= 0){
                    _local_6 = null;
                    while (_local_5 >= 0) {
                        _local_7 = BaseActor(this._resArray[_local_5]);
                        if ((((_local_7.mapY >= this._minY)) && ((_local_7.getCurrentVY() < this._maxVY)))){
                            _local_8 = _local_7.getCurrentAction();
                            if (((((((!((_local_8 == null))) && ((_local_7.getIsDead() == false)))) && ((_local_8.getActionID() == BaseActionIDDef.JUMP)))) && ((_local_7.getRideActor() == null)))){
                                _local_6 = _local_7;
                                break;
                            };
                        };
                        _local_5--;
                    };
                    this._resArray.length = 0;
                    if (_local_6 != null){
                        _local_6.getController().vKeyAct(VKeyDef.RIDE, this._targetActor);
                        this._target.removeLastRs(this);
                        this.stop();
                    };
                };
            };
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:TargetBeRidedArg = (_arg_2 as TargetBeRidedArg);
            if (_local_3.status == TargetBeRidedArg.RIDE_STATUS_CLEAR){
                if (this._rideStateType != TargetBeRidedArg.RIDE_STATUS_UNKNOW){
                    this._target.removeLastRs(this);
                    this.stop();
                };
            } else {
                if (_local_3.status == TargetBeRidedArg.RIDE_STATUS_WAITING){
                    if (this._targetActor == null){
                        this._targetActor = (this._target.target as BaseActor);
                    };
                    if (this._targetActor.getRideType() == RideType.RIDE_TYPE_UNKNOW){
                        if (this._rideStateType != TargetBeRidedArg.RIDE_STATUS_JUMP_IN){
                            this._rideStateType = TargetBeRidedArg.RIDE_STATUS_JUMP_IN;
                            this._dx = _local_3.dx;
                            this._dz = _local_3.dz;
                            this._dy = _local_3.dy;
                            this._minY = _local_3.minY;
                            this._maxVY = _local_3.maxVY;
                            this._pauseAITimes = _local_3.aiTimes;
                            this._targetActor.getView().addFrameListener(MotionDef.L_ENTER_FRAME, this);
                            this._target.addLastRS(this);
                            this._checkInterval = 0;
                        };
                    } else {
                        if (this._rideStateType != TargetBeRidedArg.RIDE_STATUS_JUMP_OUT){
                            this._rideStateType = TargetBeRidedArg.RIDE_STATUS_JUMP_OUT;
                            this._targetActor.setRideType(RideType.RIDE_TYPE_HORSE_OUT);
                            this._target.addLastRS(this);
                        };
                    };
                };
            };
        }

        public function stop():void
        {
            if (this._rideStateType == TargetBeRidedArg.RIDE_STATUS_JUMP_IN){
                this._targetActor.getView().removeFrameListener(MotionDef.L_ENTER_FRAME, this);
            } else {
                if (this._rideStateType == TargetBeRidedArg.RIDE_STATUS_JUMP_OUT){
                    this._targetActor.setRideType(RideType.RIDE_TYPE_HORSE);
                };
            };
            this._pauseAITimes = 0;
            this._rideStateType = TargetBeRidedArg.RIDE_STATUS_UNKNOW;
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_BERIDED);
        }

        public /*  ©init. */ function _SafeStr_1231()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1231 = " TargetBeRidedScript" (String#14459)


