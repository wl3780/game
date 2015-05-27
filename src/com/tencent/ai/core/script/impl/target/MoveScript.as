// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.MoveScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.data.EnvironmentInfo;
    import com.tencent.ai.core.actor.IElementController;
    import com.tencent.ai.core.data.arg.script.MoveScriptArg;
    import com.tencent.ai.core.element.MovementElement;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.components.arg.PosArg;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1225;

    public class MoveScript implements IScript 
    {

        protected var m_target:ITarget;


        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITarget(_arg_1);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_5:int;
            var _local_6:EnvironmentInfo;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:Number;
            var _local_11:IElementController;
            var _local_12:int;
            var _local_13:int;
            var _local_3:MoveScriptArg = (_arg_2 as MoveScriptArg);
            var _local_4:MovementElement = (this.m_target.target as MovementElement);
            if (!_local_3.stop){
                _local_5 = _local_3.vx;
                _local_6 = this.m_target.environmentInfo;
                if (_local_3.useLastestVX){
                    _local_5 = _local_4.getLastestVX();
                } else {
                    if (_local_3.useCurrentVX){
                        _local_5 = _local_4.getCurrentVX();
                        if ((((_local_5 == 0)) && (_local_3.useLastestVX))){
                            _local_5 = _local_4.getLastestVX();
                        };
                    };
                };
                if (_local_5 != 0){
                    _local_9 = _local_3.dirValue;
                    if (_local_9 == 0){
                        _local_9 = (((_local_5 > 0)) ? Direction.RIGHT : Direction.LEFT);
                    } else {
                        _local_9 = (_local_4.getDirection() * _local_9);
                        _local_5 = (_local_5 * _local_9);
                    };
                    if (((_local_3.walkV) && ((_local_4 is BaseActor)))){
                        _local_11 = BaseActor(_local_4).getController();
                        if (_local_9 == Direction.RIGHT){
                            if (_local_11.isVKeyDown(VKeyDef.GO_RIGHT)){
                                _local_5 = (_local_5 + (this.m_target.model.walkV * _local_3.rate));
                            };
                        } else {
                            if (_local_11.isVKeyDown(VKeyDef.GO_LEFT)){
                                _local_5 = (_local_5 - (this.m_target.model.walkV * _local_3.rate));
                            };
                        };
                    };
                    _local_10 = _local_3.fRate;
                    if (_local_10 == 0){
                        _local_4.move(PosArg.DIR_X, _local_5, _local_3.igT);
                    } else {
                        _local_12 = (((_local_6.friction * _local_9) * -1) * _local_10);
                        _local_4.slip(PosArg.DIR_X, _local_5, _local_12, null, _local_3.igT);
                    };
                };
                _local_7 = _local_3.vz;
                if (_local_7 != 0){
                    _local_4.move(PosArg.DIR_Z, _local_7, _local_3.igT);
                };
                _local_8 = _local_3.vy;
                if (_local_3.useCurrentVY){
                    _local_8 = _local_4.getCurrentVY();
                };
                if (_local_8 != 0){
                    _local_4.jump(_local_8, this.m_target.landFunction, null, (_local_3.gRate * _local_6.G));
                };
            } else {
                _local_13 = _local_3.stopDir;
                if (_local_13 == -1){
                    _local_4.stopJump();
                    _local_4.stopMove();
                } else {
                    if (_local_13 == PosArg.DIR_Y){
                        _local_4.stopJump();
                    } else {
                        _local_4.stopMove(_local_13);
                    };
                };
            };
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_MOVE);
        }

        public function stop():void
        {
        }

        public /*  ©init. */ function _SafeStr_1225()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1225 = " MoveScript" (String#16859)


