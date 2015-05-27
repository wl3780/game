// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.LaserElementView

package com.tencent.ai.core.render
{
    import com.tencent.ai.core.utils.RectArea;
    import com.tencent.ai.core.display.DisplaySystem;
    import com.tencent.ai.core.enum.Direction;
    import  ©init._SafeStr_1112;

    public class LaserElementView extends ElementView 
    {

        protected var body:ILaserViewRender;
        protected var m_ac:RectArea;
        protected var m_hcs:Array;
        protected var m_copy_hcs:Array;
        protected var m_rects:Array;
        protected var m_orgHCs:Array;
        protected var m_orgDir:int;
        protected var m_length:int;
        protected var m_step:int;

        public function LaserElementView()
        {
            this.body = DisplaySystem.createLaserViewRender();
            super(this.body);
        }

        override protected function initThis():void
        {
            super.initThis();
            this.m_ac = new RectArea();
            this.m_hcs = [];
            this.m_copy_hcs = [];
            this.m_rects = [];
            this.m_orgDir = -1;
        }

        public function setStep(_arg_1:int):void
        {
            this.m_step = _arg_1;
            this.body.setStep(_arg_1);
        }

        public function setLength(_arg_1:int):void
        {
            this.m_length = _arg_1;
            this.body.setLength(this.m_length);
        }

        override public function getHurtRects():Array
        {
            var _local_2:int;
            var _local_3:RectArea;
            var _local_4:RectArea;
            var _local_5:int;
            var _local_1:Array = this.body.hcs;
            if (((!((this.m_orgHCs == _local_1))) || (!((this.m_orgDir == m_dir))))){
                this.m_orgHCs = _local_1;
                this.m_orgDir = m_dir;
                this.m_copy_hcs.length = 0;
                if (m_dir == Direction.RIGHT){
                    this.m_hcs = this.m_orgHCs;
                } else {
                    _local_2 = ((((this.m_orgHCs)!=null) ? this.m_orgHCs.length : 0) - 1);
                    while (_local_2 >= 0) {
                        _local_3 = this.m_orgHCs[_local_2];
                        _local_4 = this.m_rects[_local_2];
                        if (_local_4 == null){
                            _local_4 = (_local_3.clone() as RectArea);
                            this.m_rects[_local_2] = _local_4;
                            _local_4.x = (-(_local_4.x) - _local_4.width);
                        } else {
                            _local_5 = _local_3.width;
                            _local_4.x = (-(_local_3.x) - _local_5);
                            _local_4.y = _local_3.y;
                            _local_4.width = _local_5;
                            _local_4.height = _local_3.height;
                            _local_4.dz = _local_3.dz;
                            _local_4.id = _local_3.id;
                        };
                        this.m_copy_hcs[_local_2] = _local_4;
                        _local_2--;
                    };
                    this.m_hcs = this.m_copy_hcs;
                };
            };
            return (this.m_hcs);
        }

        override public function getAttackRect():RectArea
        {
            var _local_2:int;
            var _local_1:RectArea = this.body.ac;
            if (_local_1 == null){
                this.m_ac.width = 0;
                this.m_ac.height = 0;
            } else {
                _local_2 = _local_1.width;
                if (this.getRotation() == 0){
                    this.m_ac.x = (((m_dir == Direction.RIGHT)) ? _local_1.x : ((_local_1.x * m_dir) - (_local_2 + (this.m_step * (this.m_length - 1)))));
                    this.m_ac.y = _local_1.y;
                    this.m_ac.width = (_local_2 + (this.m_step * (this.m_length - 1)));
                    this.m_ac.height = _local_1.height;
                    this.m_ac.dz = _local_1.dz;
                } else {
                    if ((((this.getRotation() == 90)) || ((this.getRotation() == 270)))){
                        this.m_ac.y = _local_1.x;
                        this.m_ac.x = (((m_dir == Direction.RIGHT)) ? _local_1.y : ((_local_1.y * m_dir) - _local_1.height));
                        this.m_ac.height = (_local_2 + (this.m_step * (this.m_length - 1)));
                        this.m_ac.width = _local_1.height;
                        this.m_ac.dz = _local_1.dz;
                    } else {
                        this.m_ac.x = (((m_dir == Direction.RIGHT)) ? _local_1.x : ((_local_1.x * m_dir) - _local_2));
                        this.m_ac.y = _local_1.y;
                        this.m_ac.width = (_local_2 + (this.m_step * (this.m_length - 1)));
                        this.m_ac.height = _local_1.height;
                        this.m_ac.dz = _local_1.dz;
                    };
                };
            };
            return (this.m_ac);
        }

        public /*  ©init. */ function _SafeStr_1112()
        {
        }


    }
}//package com.tencent.ai.core.render

// _SafeStr_1112 = " LaserElementView" (String#16826)


