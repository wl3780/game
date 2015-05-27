// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.impl.InteractItemModel

package com.tencent.ai.core.interact.impl
{
    import com.tencent.ai.core.actor.model.ActorModel;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.ActionInfo;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.data.InteractItemInfo;
    import com.tencent.ai.core.data.AttributeInfo;
    import com.tencent.ai.core.data.VKeyInfo;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_575;

    public class InteractItemModel extends ActorModel 
    {

        public var vkeyMapActionIDs:Dictionary;
        protected var currentActionInfo:ActionInfo;

        public function InteractItemModel()
        {
            sAttackRate = 0;
            type = ElementType.MT_INTERACT;
        }

        override public function copyValues(_arg_1:AttributeInfo):void
        {
            var _local_3:ActionInfo;
            var _local_2:InteractItemInfo = (_arg_1 as InteractItemInfo);
            m_actionInfos = new Dictionary();
            this.vkeyMapActionIDs = new Dictionary();
            for each (_local_3 in m_actionInfos) {
                this.mapActionVKeys(_local_3);
            };
        }

        public function switchToAction(_arg_1:int):ActionInfo
        {
            var _local_2:ActionInfo = this.vkeyMapActionIDs[_arg_1];
            if (_local_2 == null){
                return (null);
            };
            if (((!((this.currentActionInfo == null))) && (!(this.currentActionInfo.switchTo(_local_2.id))))){
                return (null);
            };
            return (_local_2);
        }

        public function mapActionVKeys(_arg_1:ActionInfo):Boolean
        {
            var _local_5:VKeyInfo;
            var _local_2:Vector.<VKeyInfo> = _arg_1.vKeyInfos;
            if (_local_2 == null){
                return (false);
            };
            var _local_3:int = _local_2.length;
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = _local_2[_local_4];
                this.vkeyMapActionIDs[_local_5.value] = _arg_1;
                _local_4++;
            };
            return (true);
        }

        override public function updateActionID(_arg_1:int):Boolean
        {
            var _local_2:Boolean = super.updateActionID(_arg_1);
            if (_local_2){
                this.currentActionInfo = m_actionInfos[_arg_1];
            };
            return (_local_2);
        }

        public /*  ©init. */ function _SafeStr_575()
        {
        }


    }
}//package com.tencent.ai.core.interact.impl

// _SafeStr_575 = " InteractItemModel" (String#14342)


