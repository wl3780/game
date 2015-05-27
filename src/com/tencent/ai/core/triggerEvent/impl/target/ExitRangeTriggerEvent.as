// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.target.ExitRangeTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.target
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.element.ILogicObject;
    import com.tencent.ai.core.element.BaseElement;
    import flash.geom.Point;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.ai.core.data.FrameData;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.exec_behind_frame;
    import com.tencent.free.utils.CFunction;
    import  ©init._SafeStr_1349;

    public class ExitRangeTriggerEvent extends BaseTriggerEvent implements ILogicObject 
    {

        private var _target:BaseElement;
        private var _dis:int;
        private var _hasOut:Boolean;
        private var _focusPoint:Point;
        private var _targetPoint:Point;
        private var _mainPlayer:BaseElement;

        public function ExitRangeTriggerEvent()
        {
            this._focusPoint = new Point();
            this._targetPoint = new Point();
        }

        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1, _arg_2);
            this._target = (((_arg_2)!=null) ? (_arg_2.target) : null);
            this._dis = _arg_1.args[0];
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
                this._hasOut = false;
                super.activate();
                Battle.Current.addLogicObject(this);
            };
        }

        override public function inactivate():void
        {
            if (m_isActive){
                this._mainPlayer = null;
                this._hasOut = false;
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
            if (m_isActive){
                if (!this._mainPlayer){
                    this._mainPlayer = AICore.Runtime.currentContext.getPlayerManager().getMainPlayer();
                };
                if (this._mainPlayer){
                    this._focusPoint.x = this._mainPlayer.mapX;
                    this._focusPoint.y = this._mainPlayer.mapZ;
                    if (this._target){
                        this._targetPoint.x = this._target.mapX;
                        this._targetPoint.y = this._target.mapZ;
                        if (Point.distance(this._focusPoint, this._targetPoint) > this._dis){
                            if (this._hasOut){
                                this._hasOut = false;
                                exec_behind_frame(new CFunction(fireEvent, this));
                                return;
                            };
                        } else {
                            this._hasOut = true;
                        };
                    };
                };
            };
        }

        public function freeze(_arg_1:int):void
        {
        }

        public function resetFreeze():void
        {
        }

        public /*  ©init. */ function _SafeStr_1349()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.target

// _SafeStr_1349 = " ExitRangeTriggerEvent" (String#17318)


