// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.target.EnterRangeTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.target
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.element.ILogicObject;
    import com.tencent.ai.core.element.BaseElement;
    import flash.geom.Point;
    import com.tencent.ai.core.player.BasePlayer;
    import com.tencent.ai.core.player.IPlayerManager;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.AIContextType;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.ai.core.data.FrameData;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.exec_behind_frame;
    import com.tencent.free.utils.CFunction;
    import  ©init._SafeStr_1348;

    public class EnterRangeTriggerEvent extends BaseTriggerEvent implements ILogicObject 
    {

        private var _target:BaseElement;
        private var _dis:int;
        protected var m_pos:Point;
        protected var m_playerPos:Point;
        protected var m_bHasOut:Boolean;
        private var _focusPoint:Point;
        private var _targetPoint:Point;
        private var _mainPlayer:BasePlayer;
        protected var m_bInCity:Boolean;
        protected var m_playeM:IPlayerManager;
        protected var m_time:int;

        public function EnterRangeTriggerEvent()
        {
            this._focusPoint = new Point();
            this._targetPoint = new Point();
        }

        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1, _arg_2);
            this._target = (((_arg_2)!=null) ? _arg_2.target : null);
            this._dis = _arg_1.args[0];
            this.m_pos = new Point();
            this.m_playerPos = new Point();
            this.m_bHasOut = false;
            this.m_time = 9;
            this.m_playeM = AICore.Runtime.currentContext.getPlayerManager();
            this.m_bInCity = (AICore.Runtime.currentContext.getType() == AIContextType.CT_CITY);
        }

        override public function finalize():void
        {
            this.inactivate();
            this._target = null;
            super.finalize();
        }

        override public function activate():void
        {
            if (!m_isActive){
                this.m_bHasOut = false;
                super.activate();
                Battle.Current.addLogicObject(this);
            };
        }

        override public function inactivate():void
        {
            if (m_isActive){
                this._mainPlayer = null;
                this.m_bHasOut = false;
                Battle.Current.removeLogicObject(this);
                super.inactivate();
            };
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
            return (0);
        }

        public function enterframe(_arg_1:int):void
        {
            var _local_2:uint;
            var _local_3:uint;
            var _local_4:BasePlayer;
            var _local_5:Boolean;
            var _local_6:Vector.<BasePlayer>;
            if (((m_isActive) && (((_arg_1 % 10) == 0)))){
                _local_2 = 0;
                _local_3 = 0;
                _local_5 = false;
                this.m_pos.x = this._target.mapX;
                this.m_pos.y = this._target.mapZ;
                if (this.m_bInCity){
                    this._mainPlayer = ((this._mainPlayer) || (AICore.Runtime.currentContext.getPlayerManager().getMainPlayer()));
                    _local_4 = this._mainPlayer;
                    this.m_playerPos.x = _local_4.mapX;
                    this.m_playerPos.y = _local_4.mapZ;
                    if (Point.distance(this.m_pos, this.m_playerPos) <= this._dis){
                        _local_5 = true;
                    };
                } else {
                    _local_6 = this.m_playeM.getPlayers();
                    _local_2 = _local_6.length;
                    for each (_local_4 in _local_6) {
                        this.m_playerPos.x = _local_4.mapX;
                        this.m_playerPos.y = _local_4.mapZ;
                        if (Point.distance(this.m_pos, this.m_playerPos) <= this._dis){
                            _local_5 = true;
                            break;
                        };
                    };
                };
                if (_local_5){
                    if (this.m_bHasOut){
                        exec_behind_frame(new CFunction(fireEvent, this, [_local_4]));
                        this.m_time = -1;
                        this.m_bHasOut = false;
                    } else {
                        if (this.m_time != -1){
                            if (--this.m_time == 0){
                                exec_behind_frame(new CFunction(fireEvent, this, [_local_4]));
                                this.m_bHasOut = false;
                            };
                        };
                    };
                } else {
                    this.m_bHasOut = true;
                    this.m_time = 9;
                };
            };
        }

        public function freeze(_arg_1:int):void
        {
        }

        public function resetFreeze():void
        {
        }

        public /*  ©init. */ function _SafeStr_1348()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.target

// _SafeStr_1348 = " EnterRangeTriggerEvent" (String#15983)


