// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.operation.OperationPlayerSkillUpdate

package com.tencent.ai.core.timeline.operation
{
    import com.tencent.ai.core.player.PlayerModel;
    import com.tencent.ai.core.protocol.PLearnSkillProtocol;
    import com.tencent.ai.core.protocol.PSkillShortcutProtocol;
    import com.tencent.ai.core.player.IPlayerManager;
    import com.tencent.ai.core.protocol.PLearnSkillCombatRsp;
    import com.tencent.ai.core.protocol.PSkillShortcutCombatRsp;
    import com.tencent.ai.core.actor.model.SkillModel;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1309;

    public class OperationPlayerSkillUpdate extends BaseOperation 
    {

        protected var playerModel:PlayerModel;
        protected var learnData:PLearnSkillProtocol;
        protected var shortcutData:PSkillShortcutProtocol;
        protected var uin:uint;
        protected var playerm:IPlayerManager;

        public function OperationPlayerSkillUpdate(_arg_1:IPlayerManager, _arg_2:Object)
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:Function;
            var _local_6:PLearnSkillCombatRsp;
            var _local_7:PSkillShortcutCombatRsp;
            this.playerm = _arg_1;
            if ((_arg_2 is PLearnSkillCombatRsp)){
                _local_6 = (_arg_2 as PLearnSkillCombatRsp);
                this.learnData = _local_6.data;
                _local_3 = _local_6.sync_no;
                _local_4 = _local_6.effectFrame;
                this.uin = _local_6.uin;
                _local_5 = this.opLearnSkill;
            } else {
                _local_7 = (_arg_2 as PSkillShortcutCombatRsp);
                this.shortcutData = _local_7.data;
                _local_3 = _local_7.sync_no;
                _local_4 = _local_7.effectFrame;
                this.uin = _local_7.uin;
                _local_5 = this.opShortcutSkill;
            };
            super(_local_3, _local_4, _local_5);
        }

        protected function opLearnSkill():void
        {
            var _local_2:SkillModel;
            var _local_4:SkillModel;
            var _local_1:int = this.learnData.preSkillID;
            this.playerModel = this.playerm.getPlayerByID(this.uin).getPlayerModel();
            if (_local_1 != 0){
                _local_2 = this.playerModel.runtimeRemoveSkill(_local_1);
            };
            var _local_3:int = this.learnData.skillID;
            if (_local_3 != 0){
                _local_4 = new SkillModel(AICore.data.getSkillGroup(_local_3));
                _local_4.flag = (((_local_2)!=null) ? _local_2.flag : 0);
                this.playerModel.runtimeAddSkill(_local_4);
            };
        }

        protected function opShortcutSkill():void
        {
            this.playerModel = this.playerm.getPlayerByID(this.uin).getPlayerModel();
            this.playerModel.runtimeAddHotKey(this.shortcutData.skillID, this.shortcutData.skillPos);
            this.playerModel.runtimeAddHotKey(this.shortcutData.preSkillID, this.shortcutData.preSkillIDPos);
        }

        override public function execute():void
        {
            if (m_dealFunc != null){
                m_dealFunc();
                m_dealFunc = null;
            };
        }

        public /*  ©init. */ function _SafeStr_1309()
        {
        }


    }
}//package com.tencent.ai.core.timeline.operation

// _SafeStr_1309 = " OperationPlayerSkillUpdate" (String#17267)


