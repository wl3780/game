// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.target.LandTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.target
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.element.ILogicObject;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.ai.core.data.FrameData;
    import  ©init._SafeStr_1352;

    public class LandTriggerEvent extends BaseTriggerEvent implements ILogicObject 
    {

        private var _target:BaseElement;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1, _arg_2);
            this._target = (((_arg_2)!=null) ? _arg_2.target : null);
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
                super.activate();
                Battle.Current.addLogicObject(this);
            };
        }

        override public function inactivate():void
        {
            if (m_isActive){
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
            if (this._target){
                if (this._target.mapY <= 0){
                    this.inactivate();
                    fireEvent();
                };
            };
        }

        public function freeze(_arg_1:int):void
        {
        }

        public function resetFreeze():void
        {
        }

        public /*  ©init. */ function _SafeStr_1352()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.target

// _SafeStr_1352 = " LandTriggerEvent" (String#14171)


