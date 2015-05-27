// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.components.MoveComponent

package com.tencent.ai.core.components
{
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.components.arg.PosArg;
    import com.tencent.ai.core.components.arg.MoveArg;
    import  ©init._SafeStr_84;

    public class MoveComponent extends MotionComponent 
    {

        protected var m_currZV:int = 0;
        protected var m_currXV:int = 0;
        protected var m_currXG:int = 0;
        protected var m_func:CFunction;
        protected var m_flag:Boolean = false;
        protected var m_igT:Boolean = false;

        public function MoveComponent(_arg_1:BaseElement)
        {
            super(_arg_1);
        }

        protected function directSetPos(_arg_1:PosArg):void
        {
            if (_arg_1 == null){
                return;
            };
            this.stop();
            var _local_2:int = m_target.mapX;
            var _local_3:int = m_target.mapZ;
            _local_2 = (_local_2 + _arg_1.offsetX);
            _local_3 = (_local_3 + _arg_1.offsetZ);
            if (m_environment.isWalkable(_local_2, _local_3)){
                m_target.setMapX(_local_2);
                m_target.setMapZ(_local_3);
            };
        }

        public function run(_arg_1:Object=null):void
        {
            var _local_2:MoveArg = (_arg_1 as MoveArg);
            if (_local_2 == null){
                this.directSetPos((_arg_1 as PosArg));
                return;
            };
            if (_local_2.dir == PosArg.DIR_X){
                this.m_currXV = _local_2.v;
                this.m_currXG = _local_2.f;
                this.m_func = _local_2.func;
            } else {
                this.m_currZV = _local_2.v;
            };
            this.m_igT = _local_2.igT;
            this.m_flag = true;
        }

        public function stop():void
        {
            if (this.m_flag){
                this.m_flag = false;
            };
            this.m_currXV = 0;
            this.m_currXG = 0;
            this.m_currZV = 0;
            this.m_func = null;
            this.m_igT = false;
        }

        public function isRuning():Boolean
        {
            return (this.m_flag);
        }

        public function getCurrentV():int
        {
            return (this.m_currXV);
        }

        override public function enterframe(_arg_1:int):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:CFunction;
            if (!this.m_flag){
                return;
            };
            var _local_2:int = m_target.mapX;
            if (this.m_currXV != 0){
                _local_3 = (_local_2 + (this.m_currXV * 0.01));
                _local_4 = m_target.mapZ;
                if (((this.m_igT) || (m_environment.isWalkable(_local_3, _local_4)))){
                    _local_2 = _local_3;
                    m_target.setMapX(_local_2);
                };
                if (((!((this.m_currXG == 0))) && ((m_target.mapY == 0)))){
                    this.m_currXV = (this.m_currXV + this.m_currXG);
                    if ((this.m_currXV >> 31) == (this.m_currXG >> 31)){
                        this.m_currXV = 0;
                        this.m_currXG = 0;
                    };
                };
            };
            if (this.m_currZV != 0){
                _local_4 = m_target.mapZ;
                _local_4 = (_local_4 + int((this.m_currZV * 0.01)));
                if (((this.m_igT) || (m_environment.isWalkable(_local_2, _local_4)))){
                    m_target.setMapZ(_local_4);
                };
            };
            if (this.m_currXV == 0){
                if (this.m_currZV == 0){
                    _local_5 = this.m_func;
                    this.stop();
                    if (_local_5 != null){
                        _local_5.invoke();
                    };
                };
            };
        }

        public /*  ©init. */ function _SafeStr_84()
        {
        }


    }
}//package com.tencent.ai.core.components

// _SafeStr_84 = " MoveComponent" (String#14735)


