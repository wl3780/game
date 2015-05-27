// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.components.MotionComponent

package com.tencent.ai.core.components
{
    import com.tencent.ai.core.element.ILogicObject;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.element.IEnvironment;
    import com.tencent.ai.core.data.EnvironmentInfo;
    import com.tencent.ai.core.data.FrameData;
    import  ©init._SafeStr_83;

    public class MotionComponent implements ILogicObject 
    {

        protected var m_target:BaseElement;
        protected var m_environment:IEnvironment;
        protected var m_eInfo:EnvironmentInfo;
        protected var m_frameIndex:int;

        public function MotionComponent(_arg_1:BaseElement)
        {
            this.m_target = _arg_1;
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
            return (this.m_frameIndex);
        }

        public function freeze(_arg_1:int):void
        {
        }

        public function resetFreeze():void
        {
        }

        public function updateEnvironment():void
        {
            if (this.m_target != null){
                this.m_environment = this.m_target.getParentContainer();
                this.m_eInfo = (((this.m_environment)!=null) ? this.m_environment.getInfo() : null);
            } else {
                this.m_environment = null;
            };
        }

        public function enterframe(_arg_1:int):void
        {
        }

        public function reset():void
        {
            this.m_environment = null;
            this.m_eInfo = null;
        }

        public function dispose():void
        {
        }

        public /*  ©init. */ function _SafeStr_83()
        {
        }


    }
}//package com.tencent.ai.core.components

// _SafeStr_83 = " MotionComponent" (String#14732)


