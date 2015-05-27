// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.ssef.SSEF_LetMeMove

package com.tencent.ai.core.status.impl.ssef
{
    import com.tencent.ai.core.render.IFrameListener;
    import com.tencent.ai.core.actor.IActorView;
    import com.tencent.ai.core.element.IEnvironment;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.element.MovementElement;
    import com.tencent.ai.core.data.StatusEffectInfo;
    import  ©init._SafeStr_1266;

    public class SSEF_LetMeMove extends SSEF_Base implements IFrameListener 
    {

        private var _mapX:int;
        private var _mapY:int;
        private var _mapZ:int;
        private var _vx:int;
        private var _vy:int;
        private var _vz:int;
        private var _vx2:int;
        private var _vy2:int;
        private var _vz2:int;
        private var _flagVal:int;
        private var _view:IActorView;
        private var _environment:IEnvironment;

        public function SSEF_LetMeMove()
        {
            this._vx = 0;
            this._vy = 0;
            this._vz = 0;
        }

        public function onFrameEvent(_arg_1:String):void
        {
            var _local_2:int = this._flagVal;
            var _local_3:int = m_target.mapX;
            var _local_4:int = m_target.mapY;
            var _local_5:int = m_target.mapZ;
            var _local_6:int = (this._mapX - _local_3);
            if ((_local_6 * _local_6) <= this._vx2){
                _local_3 = this._mapX;
                _local_2--;
            } else {
                _local_3 = (_local_3 + this._vx);
            };
            _local_6 = (this._mapY - _local_4);
            if ((_local_6 * _local_6) <= this._vy2){
                _local_4 = this._mapY;
                _local_2--;
            } else {
                _local_4 = (_local_4 + this._vy);
            };
            _local_6 = (this._mapZ - _local_5);
            if ((_local_6 * _local_6) <= this._vz2){
                _local_5 = this._mapZ;
                _local_2--;
            } else {
                _local_5 = (_local_5 + this._vz);
            };
            if (_local_2 > 0){
                this._flagVal = 3;
                if (this._environment.isWalkable(_local_3, _local_5)){
                    m_target.setMapXZY(_local_3, _local_5, _local_4);
                };
            };
        }

        override public function finalize():void
        {
            if (this._view != null){
                this._view.removeFrameListener(MotionDef.L_ENTER_FRAME, this);
                this._view = null;
                this._environment = null;
            };
            super.finalize();
        }

        override public function initialize(_arg_1:StatusEffectInfo):void
        {
            super.initialize(_arg_1);
            var _local_2:MovementElement = MovementElement(m_sstatus.getRTParams().source);
            this._mapX = (_local_2.mapX + (_arg_1.data_1 * _local_2.getDirection()));
            this._mapY = (_local_2.mapY + _arg_1.data_2);
            this._mapZ = (_local_2.mapZ + _arg_1.data_3);
            var _local_3:int = m_target.mapX;
            var _local_4:int = m_target.mapY;
            var _local_5:int = m_target.mapZ;
            this._vx = ((((_local_3 > this._mapX)) ? -1 : (((_local_3 == this._mapX)) ? 0 : 1)) * _arg_1.data_4);
            this._vy = ((((_local_4 > this._mapY)) ? -1 : (((_local_4 == this._mapY)) ? 0 : 1)) * _arg_1.data_5);
            this._vz = ((((_local_5 > this._mapZ)) ? -1 : (((_local_5 == this._mapZ)) ? 0 : 1)) * _arg_1.data_4);
            this._vx2 = (this._vx * this._vx);
            this._vy2 = (this._vy * this._vy);
            this._vz2 = (this._vz * this._vz);
            this._flagVal = 4;
            this._view = m_target.getActorView();
            this._environment = this._view.getParentContainer();
        }

        override public function execute():void
        {
            this._view.addFrameListener(MotionDef.L_ENTER_FRAME, this);
        }

        public /*  ©init. */ function _SafeStr_1266()
        {
        }


    }
}//package com.tencent.ai.core.status.impl.ssef

// _SafeStr_1266 = " SSEF_LetMeMove" (String#17039)


