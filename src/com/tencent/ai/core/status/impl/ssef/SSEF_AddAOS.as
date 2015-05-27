// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.ssef.SSEF_AddAOS

package com.tencent.ai.core.status.impl.ssef
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.data.StatusEffectInfo;
    import com.tencent.ai.core.status.ISpecialStatusManager;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.ai.core.enum.ElementType;
    import  ©init._SafeStr_1261;
    import __AS3__.vec.*;

    public class SSEF_AddAOS extends SSEF_Base 
    {

        private var _resArray:Vector.<InteractElement>;
        private var _searchR:int;
        private var _ssID:int;
        private var _ignoreGIDs:Array;


        override public function finalize():void
        {
            this._resArray = null;
            this._ignoreGIDs = null;
            super.finalize();
        }

        override public function initialize(_arg_1:StatusEffectInfo):void
        {
            super.initialize(_arg_1);
            this._resArray = new Vector.<InteractElement>();
            this._ssID = _arg_1.data_1;
            this._searchR = _arg_1.data_2;
            var _local_2:int = m_target.groupID;
            if (_arg_1.data_3 == 0){
                this._ignoreGIDs = [_local_2];
            } else {
                this._ignoreGIDs = ElementGroupDef.IGNORE_GID_MAP[_local_2];
            };
        }

        override public function execute():void
        {
            var _local_2:ISpecialStatusManager;
            var _local_3:Object;
            var _local_4:BaseActor;
            Battle.Current.findElementsInArea(this._resArray, m_target.mapX, m_target.mapZ, this._searchR, this._ignoreGIDs, ElementType.ET_INTERACT);
            var _local_1:int = (this._resArray.length - 1);
            if (_local_1 >= 0){
                _local_2 = SSEF_AddStatus.SSM;
                _local_3 = m_sstatus.getRTParams();
                while (_local_1 >= 0) {
                    _local_4 = (this._resArray[_local_1] as BaseActor);
                    if (_local_4 != null){
                        _local_2.applyStatus(_local_4, this._ssID, null, true, _local_3);
                    };
                    _local_1--;
                };
                this._resArray.length = 0;
            };
        }

        public /*  ©init. */ function _SafeStr_1261()
        {
        }


    }
}//package com.tencent.ai.core.status.impl.ssef

// _SafeStr_1261 = " SSEF_AddAOS" (String#17468)


