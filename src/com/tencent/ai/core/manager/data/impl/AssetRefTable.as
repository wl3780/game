package com.tencent.ai.core.manager.data.impl
{
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.AssetRefIDInfo;
    import com.tencent.ai.core.data.ResDepandInfo;
    import com.tencent.ai.core.manager.data.IAssetRefTable;
    
    import flash.utils.Dictionary;

    public class AssetRefTable implements IAssetRefTable 
    {

        public function getMonsterAssetRefIDInfo(_arg_1:int):AssetRefIDInfo
        {
            var _local_2:Dictionary = AICore.data.getAllResDepandInfo();
            var _local_3:Vector.<ResDepandInfo> = _local_2[AssetRefIDInfo.MONSTER_IDS];
            return (this.getRefIDInfo(_local_3, _arg_1));
        }

        public function getEffectAssetRefIDInfo(_arg_1:int):AssetRefIDInfo
        {
            var _local_2:Dictionary = AICore.data.getAllResDepandInfo();
            var _local_3:Vector.<ResDepandInfo> = _local_2[AssetRefIDInfo.EFFECT_IDS];
            return (this.getRefIDInfo(_local_3, _arg_1));
        }

        public function getInteractAssetRefIDInfo(_arg_1:int):AssetRefIDInfo
        {
            var _local_2:Dictionary = AICore.data.getAllResDepandInfo();
            var _local_3:Vector.<ResDepandInfo> = _local_2[AssetRefIDInfo.INTERACT_IDS];
            return (this.getRefIDInfo(_local_3, _arg_1));
        }

        public function getSkillAssetRefIDInfo(_arg_1:int, _arg_2:int=0, _arg_3:int=0):AssetRefIDInfo
        {
            var _local_4:Dictionary = AICore.data.getAllResDepandInfo();
            var _local_5:Vector.<ResDepandInfo> = _local_4[AssetRefIDInfo.SKILL_IDS];
            return (this.getRefIDInfo(_local_5, _arg_1, AssetRefIDInfo.ID, _arg_2, _arg_3));
        }

        public function getActivityMonsterRefIDInfo(_arg_1:int):AssetRefIDInfo
        {
            var _local_2:Dictionary = AICore.data.getAllResDepandInfo();
            var _local_3:Vector.<ResDepandInfo> = _local_2[AssetRefIDInfo.ACTIVITY_MONSTER_IDS];
            return (this.getRefIDInfo(_local_3, _arg_1));
        }

        public function getItemAssetRefIDInfo(_arg_1:int):AssetRefIDInfo
        {
            return (new AssetRefIDInfo());
        }

        private function getRefIDInfo(_arg_1:Vector.<ResDepandInfo>, _arg_2:int, _arg_3:String="id", _arg_4:int=0, _arg_5:int=0):AssetRefIDInfo
        {
            var _local_7:ResDepandInfo;
            var _local_8:ResDepandInfo;
            var _local_6:AssetRefIDInfo = new AssetRefIDInfo();
            var _local_9:int = _arg_1.length;
            var _local_10:int;
            while (_local_10 < _local_9) {
                _local_8 = _arg_1[_local_10];
                if (((_arg_4) || (_arg_5))){
                    if ((((_local_8.actionID == _arg_4)) && ((_local_8.careerID == _arg_5)))){
                        _local_7 = _local_8;
                        break;
                    };
                } else {
                    if (_local_8.id == _arg_2){
                        _local_7 = _local_8;
                        break;
                    };
                };
                _local_10++;
            };
            var _local_11:AssetRefIDInfo = new AssetRefIDInfo();
            if (_local_7){
                _local_11.effectIDs = _local_7.dpEffectIDVect;
                _local_11.interactIDs = _local_7.dpInteractIDVect;
                _local_11.monsterIDs = _local_7.dpMonsterIDVect;
                _local_11.soundIDs = _local_7.dpSoundIDVect;
            };
            return (_local_11);
        }

        private function getArrayFromXml(_arg_1:XMLList):Array
        {
            return (String(_arg_1.toXMLString()).split(","));
        }

    }
}
