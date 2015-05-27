// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.func.impl.BaseSpecialFunc

package com.tencent.ai.core.func.impl
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.func.ISpecialFunc;
    import com.tencent.ai.core.status.ISpecialStatus;
    import com.tencent.ai.core.data.SpecialFuncInfo;
    import com.tencent.ai.core.status.SSModel;
    import com.tencent.ai.core.data.SSTypeInfo;
    import  ©init._SafeStr_567;

    public class BaseSpecialFunc extends EventDispatcher2 implements ISpecialFunc, ISpecialStatus 
    {

        protected var m_info:SpecialFuncInfo;
        protected var m_target:Object;
        protected var m_funcID:int;
        protected var m_rtParams:Object;

        public function BaseSpecialFunc(_arg_1:int)
        {
            this.m_funcID = _arg_1;
        }

        public function setInfo(_arg_1:SpecialFuncInfo):void
        {
            this.m_info = _arg_1;
        }

        public function getInfo():SpecialFuncInfo
        {
            return (this.m_info);
        }

        public function setTarget(_arg_1:Object):void
        {
            this.m_target = _arg_1;
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function getFuncID():int
        {
            return (this.m_funcID);
        }

        public function compare(_arg_1:ISpecialStatus):int
        {
            return (0);
        }

        public function setModel(_arg_1:SSModel):void
        {
        }

        public function getModel():SSModel
        {
            return (null);
        }

        public function getTypeInfo():SSTypeInfo
        {
            return (null);
        }

        public function isBorn():Boolean
        {
            return (false);
        }

        public function execute():void
        {
        }

        public function setRTParams(_arg_1:Object):void
        {
            this.m_rtParams = _arg_1;
        }

        public function getRTParams():Object
        {
            return (this.m_rtParams);
        }

        public function dispose():void
        {
            this.m_target = null;
            this.m_info = null;
            this.m_rtParams = null;
        }

        public /*  ©init. */ function _SafeStr_567()
        {
        }


    }
}//package com.tencent.ai.core.func.impl

// _SafeStr_567 = " BaseSpecialFunc" (String#15095)


