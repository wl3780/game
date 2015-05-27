// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.components.BaseAIComponent

package com.tencent.ai.core.components
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.element.IEnvironment;
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_81;

    public class BaseAIComponent 
    {

        public static var MSG_CHANNEL:EventDispatcher = new EventDispatcher();

        public var lPrev:Object;
        public var lNext:BaseAIComponent;
        public var isCAI:Boolean;
        protected var m_frameIndex:int;
        protected var m_target:BaseElement;
        protected var m_environment:IEnvironment;
        protected var m_lifeTime:int;

        public function BaseAIComponent()
        {
            this.m_frameIndex = 0;
            this.m_lifeTime = 0;
            this.lPrev = null;
            this.lNext = null;
            this.isCAI = false;
        }

        public function updateEnvironment():void
        {
            if (this.m_target != null){
                this.m_environment = this.m_target.getParentContainer();
            } else {
                this.m_environment = null;
            };
        }

        public function getCurrentLifeTime():int
        {
            return (this.m_lifeTime);
        }

        public function setCurrentLifeTime(_arg_1:int):void
        {
            this.m_lifeTime = _arg_1;
        }

        public function setAIInfo(_arg_1:Object):void
        {
        }

        public function beHurt(_arg_1:AttackInfo):void
        {
        }

        public function attachTarget(_arg_1:BaseElement):void
        {
            this.m_target = _arg_1;
        }

        public function releaseTarget():void
        {
            this.reset();
            this.m_target = null;
        }

        public function hasTarget():Boolean
        {
            return (!((this.m_target == null)));
        }

        public function stateIn(_arg_1:Object=null):void
        {
        }

        public function setGroup(_arg_1:int):void
        {
        }

        public function reset():void
        {
            this.m_environment = null;
        }

        public function enterframe(_arg_1:int):void
        {
            this.m_frameIndex = _arg_1;
        }

        public function getCurrentFrameIndex():int
        {
            return (this.m_frameIndex);
        }

        public /*  ©init. */ function _SafeStr_81()
        {
        }


    }
}//package com.tencent.ai.core.components

// _SafeStr_81 = " BaseAIComponent" (String#13943)


