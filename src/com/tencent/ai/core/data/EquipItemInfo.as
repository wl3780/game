// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.EquipItemInfo

package com.tencent.ai.core.data
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.events.ItemEvent;
    import  ©init._SafeStr_252;

    public class EquipItemInfo extends ItemInfo 
    {

        private var _wear:int;
        private var _strengthen:int;
        public var grade:int;
        public var baseAttrib:Vector.<EquipAttribPair>;
        public var strAttrib:Vector.<EquipAttribPair>;
        public var extendAttrib:Vector.<EquipAttribExtend>;
        public var addSkillData:EquipAddSkillData;
        private var _holes:Vector.<ItemHoleInfo>;
        private var _enhanceBless:int;


        public function get equipStaticInfo():EquipStaticInfo
        {
            return ((staticInfo as EquipStaticInfo));
        }

        [Bindable("itemWearChange")]
        public function get wear():int
        {
            return (this._wear);
        }

        public function set wear(_arg_1:int):void
        {
            if (this._wear == _arg_1){
                return;
            };
            this._wear = _arg_1;
            if (hasEventListener(ItemEvent.ITEM_WEAR_CHANGE)){
                dispatchEvent(new ItemEvent(ItemEvent.ITEM_WEAR_CHANGE));
            };
        }

        [Bindable("itemStrengthenChange")]
        public function get strengthen():int
        {
            return (this._strengthen);
        }

        public function set strengthen(_arg_1:int):void
        {
            if (this._strengthen == _arg_1){
                return;
            };
            this._strengthen = _arg_1;
            if (hasEventListener(ItemEvent.ITEM_STRENGTHEN_CHANGE)){
                dispatchEvent(new ItemEvent(ItemEvent.ITEM_STRENGTHEN_CHANGE));
            };
        }

        [Bindable("itemHolesChange")]
        public function get holes():Vector.<ItemHoleInfo>
        {
            return (this._holes);
        }

        public function set holes(_arg_1:Vector.<ItemHoleInfo>):void
        {
            this._holes = _arg_1;
            dispatchEvent(new ItemEvent(ItemEvent.ITEM_HOLES_CHANGE));
        }

        public function get enhanceBless():int
        {
            return (this._enhanceBless);
        }

        public function set enhanceBless(_arg_1:int):void
        {
            this._enhanceBless = _arg_1;
        }

        override public function copy(_arg_1:ItemInfo):void
        {
            var _local_2:EquipItemInfo = (_arg_1 as EquipItemInfo);
            super.copy(_arg_1);
            this.wear = _local_2.wear;
            this.grade = _local_2.grade;
            this.strengthen = _local_2.strengthen;
            this.baseAttrib = _local_2.baseAttrib;
            this.strAttrib = _local_2.strAttrib;
            this.extendAttrib = _local_2.extendAttrib;
            this.holes = _local_2.holes;
            this.enhanceBless = _local_2.enhanceBless;
        }

        public /*  ©init. */ function _SafeStr_252()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_252 = " EquipItemInfo" (String#13910)


