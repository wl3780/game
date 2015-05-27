// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.components.GravityComponent

package com.tencent.ai.core.components
{
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.components.arg.JumpArg;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_82;

    public class GravityComponent extends MotionComponent 
    {

        protected var m_currV:int;
        protected var m_latestV:int = 0;
        protected var m_endFunc:CFunction;
        protected var m_vChange:CFunction;
        protected var m_type:int;
        protected var m_vDir:Boolean;
        protected var m_flag:Boolean = false;
        protected var m_g:int = 0;

        public function GravityComponent(_arg_1:BaseElement)
        {
            super(_arg_1);
        }

        public function run(_arg_1:Object=null):void
        {
            var _local_2:JumpArg = (_arg_1 as JumpArg);
            if (_local_2 == null){
                return;
            };
            this.m_currV = _local_2.v;
            this.m_g = (((_local_2.g == -1)) ? (DEFINE.G_GRAVITY) : _local_2.g);
            this.m_vDir = (this.m_currV > 0);
            this.m_endFunc = _local_2.endFunc;
            this.m_vChange = _local_2.vChange;
            this.m_flag = true;
        }

        public function stop():void
        {
            this.m_flag = false;
            this.m_latestV = this.m_currV;
            this.m_currV = 0;
            this.m_endFunc = null;
            this.m_vChange = null;
        }

        public function isRuning():Boolean
        {
            return (this.m_flag);
        }

        public function getCurrentV():int
        {
            return (this.m_currV);
        }

        public function getLatestV():int
        {
            return (this.m_latestV);
        }

        public function setEndFunction(_arg_1:CFunction):void
        {
            if (this.m_flag){
                this.m_endFunc = _arg_1;
            };
        }

        public function onRender(_arg_1:Object=null):void
        {
        }

        public function onTick(_arg_1:Object=null):void
        {
        }

        override public function enterframe(_arg_1:int):void
        {
            var _local_3:CFunction;
            if (!this.m_flag){
                return;
            };
            var _local_2:int = m_target.mapY;
            _local_2 = (_local_2 + (this.m_currV * 0.01));
            if (_local_2 < 0){
                _local_2 = 0;
            };
            m_target.setMapY(_local_2);
            if (_local_2 == 0){
                _local_3 = this.m_endFunc;
                this.stop();
                if (_local_3 != null){
                    _local_3.invoke();
                };
                return;
            };
            this.m_currV = (this.m_currV + this.m_g);
            if (((this.m_vDir) && ((this.m_currV <= 0)))){
                if (this.m_vChange != null){
                    this.m_vChange.call(this.m_currV);
                    this.m_vChange = null;
                };
                this.m_vDir = !(this.m_vDir);
                this.m_currV = 0;
            };
        }

        override public function reset():void
        {
            this.m_latestV = 0;
            super.reset();
        }

        public /*  ©init. */ function _SafeStr_82()
        {
        }


    }
}//package com.tencent.ai.core.components

// _SafeStr_82 = " GravityComponent" (String#15284)


