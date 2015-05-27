// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.npc.NpcModel

package com.tencent.ai.core.npc
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.data.NpcStaticInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.NpcDialogOptionInfo;
    import com.tencent.ai.core.npc.optionCondition.OptionConditionManager;
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.ai.core.enum.NpcStatus;
    import com.tencent.ai.core.events.NpcModelEvent;
    import  ©init._SafeStr_818;
    import __AS3__.vec.*;

    public class NpcModel extends EventDispatcher 
    {

        private var _staticInfo:NpcStaticInfo;
        private var _mood:int = 0;
        private var _optionInfoList_new:Vector.<NpcDialogOptionInfo>;
        private var _optionInfoList:Vector.<NpcDialogOptionInfo>;

        public function NpcModel(_arg_1:NpcStaticInfo)
        {
            var _local_4:NpcDialogOptionInfo;
            super();
            this._staticInfo = _arg_1;
            this._staticInfo.dialogOptionList.sort(this.sortOptionInfo);
            this._optionInfoList = new Vector.<NpcDialogOptionInfo>();
            var _local_2:int = this._staticInfo.dialogOptionList.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = this._staticInfo.dialogOptionList[_local_3];
                if (OptionConditionManager.check(_local_4.condType, _local_4.condValue)){
                    this._optionInfoList.push(_local_4);
                };
                _local_3++;
            };
        }

        public function get status():int
        {
            var _local_1:int;
            var _local_2:int;
            var _local_3:int;
            var _local_4:String;
            var _local_5:Class;
            if (this._optionInfoList.length){
                _local_1 = this._optionInfoList.length;
                _local_2 = 0;
                while (_local_2 < _local_1) {
                    _local_3 = this._optionInfoList[_local_2].status;
                    _local_4 = ("ai.commoneffect.assets.npcstatus.StatusAsset_" + _local_3);
                    _local_5 = (CLASS.current.tryForName(_local_4) as Class);
                    if (_local_5){
                        return (_local_3);
                    };
                    _local_2++;
                };
            };
            return (NpcStatus.NORMAL);
        }

        public function set mood(_arg_1:int):void
        {
            this._mood = _arg_1;
            this.dispatchNpcModelEvent(NpcModelEvent.CHANGE_MOOD);
        }

        public function get mood():int
        {
            return (this._mood);
        }

        public function get staticInfo():NpcStaticInfo
        {
            return (this._staticInfo);
        }

        public function getDialogOptionInfos():Vector.<NpcDialogOptionInfo>
        {
            return (this._optionInfoList);
        }

        public function addOptionInfo(_arg_1:NpcDialogOptionInfo):void
        {
            var _local_3:int;
            var _local_5:NpcDialogOptionInfo;
            this.removeOptionInfoWithoutEvent(_arg_1);
            var _local_2:int = this.status;
            this._optionInfoList_new = ((this._optionInfoList_new) || (new Vector.<NpcDialogOptionInfo>()));
            this._optionInfoList_new.push(_arg_1);
            this._optionInfoList_new.sort(this.sortOptionInfo);
            this._optionInfoList.length = 0;
            var _local_4:int = this._optionInfoList_new.length;
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_5 = this._optionInfoList_new[_local_3];
                if (OptionConditionManager.check(_local_5.condType, _local_5.condValue)){
                    this._optionInfoList.push(_local_5);
                };
                _local_3++;
            };
            _local_4 = this._staticInfo.dialogOptionList.length;
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_5 = this._staticInfo.dialogOptionList[_local_3];
                if (OptionConditionManager.check(_local_5.condType, _local_5.condValue)){
                    this._optionInfoList.push(_local_5);
                };
                _local_3++;
            };
            if (_local_2 != this.status){
                this.dispatchNpcModelEvent(NpcModelEvent.CHANGE_STATUS);
            };
        }

        public function removeOptionInfo(_arg_1:NpcDialogOptionInfo):void
        {
            var _local_2:int = this.status;
            this.removeOptionInfoWithoutEvent(_arg_1);
            if (_local_2 != this.status){
                this.dispatchNpcModelEvent(NpcModelEvent.CHANGE_STATUS);
            };
        }

        protected function removeOptionInfoWithoutEvent(_arg_1:NpcDialogOptionInfo):void
        {
            if (((!(this._optionInfoList_new)) || (!(this._optionInfoList_new.length)))){
                return;
            };
            var _local_2:int = this._optionInfoList_new.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                if (this._optionInfoList_new[_local_3].equal(_arg_1)){
                    this._optionInfoList_new.splice(_local_3, 1);
                    break;
                };
                _local_3++;
            };
            _local_2 = this._optionInfoList.length;
            _local_3 = 0;
            while (_local_3 < _local_2) {
                if (this._optionInfoList[_local_3].equal(_arg_1)){
                    this._optionInfoList.splice(_local_3, 1);
                    return;
                };
                _local_3++;
            };
        }

        private function dispatchNpcModelEvent(_arg_1:String):void
        {
            var _local_2:NpcModelEvent = new NpcModelEvent(_arg_1);
            this.dispatchEvent(_local_2);
        }

        private function sortOptionInfo(_arg_1:NpcDialogOptionInfo, _arg_2:NpcDialogOptionInfo):int
        {
            if (_arg_1.priority > _arg_2.priority){
                return (-1);
            };
            if (_arg_1.priority == _arg_2.priority){
                return (0);
            };
            return (1);
        }

        public /*  ©init. */ function _SafeStr_818()
        {
        }


    }
}//package com.tencent.ai.core.npc

// _SafeStr_818 = " NpcModel" (String#14222)


