// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.model.SkillModel

package com.tencent.ai.core.actor.model
{
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.data.SkillGroup;
    import  ©init._SafeStr_42;

    public class SkillModel 
    {

        public var flag:int;
        public var skillID:int;
        public var baseSkillID:int;
        public var actionID:int;
        public var lastFrameIndex:int;
        public var cd_times:int;
        public var cd_group:int;
        public var mana_cost:int;
        public var angryVal_cost:int;
        public var info:SkillInfo;
        public var group:SkillGroup;
        private var _index:int;

        public function SkillModel(_arg_1:SkillGroup=null)
        {
            this.flag = 0;
            this._index = -1;
            this.setSkillGroup(_arg_1);
        }

        public function setSkillGroup(_arg_1:SkillGroup):void
        {
            if (_arg_1 == null){
                return;
            };
            this.group = _arg_1;
            this.skillID = _arg_1.id;
            this.useIndex(0);
            this.cd_times = _arg_1.cd_times;
            this.cd_group = _arg_1.cd_group;
            this.lastFrameIndex = (_arg_1.startCDtime - this.cd_times);
        }

        public function useIndex(_arg_1:int):void
        {
            if (this._index == _arg_1){
                return;
            };
            this._index = _arg_1;
            this.info = this.group.skillInfos[this._index];
            this.actionID = this.info.actionID;
            this.mana_cost = this.info.mana_cost;
            this.angryVal_cost = this.info.angryVal_cost;
        }

        public function getCurrentIndex():int
        {
            return (this._index);
        }

        public function isCD(_arg_1:int):Boolean
        {
            var _local_2:int = (_arg_1 - this.lastFrameIndex);
            return ((_local_2 < this.cd_times));
        }

        public function resetCD():void
        {
            this.lastFrameIndex = (this.group.startCDtime - this.cd_times);
        }

        public /*  ©init. */ function _SafeStr_42()
        {
        }


    }
}//package com.tencent.ai.core.actor.model

// _SafeStr_42 = " SkillModel" (String#14984)


