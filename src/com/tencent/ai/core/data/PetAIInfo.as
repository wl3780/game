// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PetAIInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.MonsterEnum;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_292;
    import __AS3__.vec.*;

    public class PetAIInfo extends MonsterAIInfo 
    {

        public var aiType:int;


        private static function filterDialog(_arg_1:int, _arg_2:PetInfo, _arg_3:int):Boolean
        {
            var _local_4:BubbleDialog = AICore.data.getBubbleDialogInfo(_arg_1);
            if (_local_4){
                if ((((((_local_4.minL == 0)) && ((_local_4.maxL == 0)))) || ((((_local_4.minL <= _arg_2.level)) && ((_local_4.maxL >= _arg_2.level)))))){
                    if (_local_4.location == 0){
                        return (true);
                    };
                    if (_local_4.location == 1){
                        return ((_arg_3 == MonsterEnum.AI_CITY_PET));
                    };
                    if (_local_4.location == 2){
                        return ((_arg_3 == MonsterEnum.AI_DUP_PET));
                    };
                };
            };
            return (false);
        }


        public function fillMonsterAIInfo(_arg_1:MonsterAIInfo):void
        {
            aTimes = _arg_1.aTimes;
            aType = _arg_1.aType;
            aiEditionType = _arg_1.aiEditionType;
            roamR = _arg_1.roamR;
            roamRZ = _arg_1.roamRZ;
            roamPZ = _arg_1.roamPZ;
            roamP = _arg_1.roamP;
            firstBloodP = _arg_1.firstBloodP;
            wantBeHurtP = _arg_1.wantBeHurtP;
            chaseR = _arg_1.chaseR;
            sightLineR = _arg_1.sightLineR;
            idleP = _arg_1.idleP;
            durCycles = _arg_1.durCycles;
            monsterIQ = _arg_1.monsterIQ;
            monsterTemper = _arg_1.monsterTemper;
            monsterRageUp = _arg_1.monsterRageUp;
            monsterRageDown = _arg_1.monsterRageDown;
            isFlyMonster = _arg_1.isFlyMonster;
            monsterType = _arg_1.monsterType;
            yPos1 = _arg_1.yPos1;
            yPos2 = _arg_1.yPos2;
            yPos3 = _arg_1.yPos3;
            bDialogId = _arg_1.bDialogId.concat();
            bDialogId2 = _arg_1.bDialogId2.concat();
            skillParams = _arg_1.skillParams.concat();
            buffParams = _arg_1.buffParams.concat();
        }

        public function fillPetAIInfo(_arg_1:PetAIInfo, _arg_2:PetInfo):void
        {
            var _local_6:MonsterAISkillParam;
            var _local_7:int;
            var _local_8:PetSkillInfo;
            aTimes = _arg_1.aTimes;
            aType = _arg_1.aType;
            aiEditionType = _arg_1.aiEditionType;
            roamR = _arg_1.roamR;
            roamRZ = _arg_1.roamRZ;
            roamPZ = _arg_1.roamPZ;
            roamP = _arg_1.roamP;
            firstBloodP = _arg_1.firstBloodP;
            wantBeHurtP = _arg_1.wantBeHurtP;
            chaseR = _arg_1.chaseR;
            sightLineR = _arg_1.sightLineR;
            idleP = _arg_1.idleP;
            durCycles = _arg_1.durCycles;
            monsterIQ = _arg_1.monsterIQ;
            monsterTemper = _arg_1.monsterTemper;
            monsterRageUp = _arg_1.monsterRageUp;
            monsterRageDown = _arg_1.monsterRageDown;
            isFlyMonster = _arg_1.isFlyMonster;
            monsterType = _arg_1.monsterType;
            yPos1 = _arg_1.yPos1;
            yPos2 = _arg_1.yPos2;
            yPos3 = _arg_1.yPos3;
            bDialogId = new Array();
            var _local_3:int = _arg_1.bDialogId.length;
            var _local_4:int;
            while (_local_4 < _local_3) {
                if (filterDialog(_arg_1.bDialogId[_local_4], _arg_2, this.aiType)){
                    bDialogId.push(_arg_1.bDialogId[_local_4]);
                };
                _local_4++;
            };
            bDialogId2 = new Array();
            _local_3 = _arg_1.bDialogId2.length;
            _local_4 = 0;
            while (_local_4 < _local_3) {
                if (filterDialog(_arg_1.bDialogId2[_local_4], _arg_2, this.aiType)){
                    bDialogId2.push(_arg_1.bDialogId2[_local_4]);
                };
                _local_4++;
            };
            var _local_5:Vector.<PetSkillInfo> = _arg_2.battleSkills;
            skillParams = new Vector.<MonsterAISkillParam>();
            if (_local_5){
                _local_4 = 0;
                while (_local_4 < _arg_1.skillParams.length) {
                    _local_6 = _arg_1.skillParams[_local_4];
                    _local_7 = 0;
                    while (_local_7 < _local_5.length) {
                        _local_8 = _local_5[_local_7];
                        if ((_local_6.skillID % 100) == (_local_8.skillID % 100)){
                            skillParams.push(_local_6);
                        };
                        _local_7++;
                    };
                    _local_4++;
                };
            };
            buffParams = _arg_1.buffParams.concat();
        }

        public /*  ©init. */ function _SafeStr_292()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_292 = " PetAIInfo" (String#15779)


