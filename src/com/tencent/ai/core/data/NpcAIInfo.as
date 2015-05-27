// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.NpcAIInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_286;

    public class NpcAIInfo extends MonsterAIInfo 
    {


        private static function filterDialog(_arg_1:int):Boolean
        {
            var _local_2:BubbleDialog = AICore.data.getBubbleDialogInfo(_arg_1);
            if (_local_2){
                if ((((_local_2.location == 2)) || ((_local_2.location == 0)))){
                    return (true);
                };
            };
            return (false);
        }


        public function fillNpcAIInfo(_arg_1:MonsterAIInfo):void
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
            bDialogId = [];
            var _local_2:int = _arg_1.bDialogId.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                if (filterDialog(_arg_1.bDialogId[_local_3])){
                    bDialogId.push(_arg_1.bDialogId[_local_3]);
                };
                _local_3++;
            };
            bDialogId2 = [];
            _local_2 = _arg_1.bDialogId2.length;
            _local_3 = 0;
            while (_local_3 < _local_2) {
                if (filterDialog(_arg_1.bDialogId2[_local_3])){
                    bDialogId2.push(_arg_1.bDialogId2[_local_3]);
                };
                _local_3++;
            };
            skillParams = _arg_1.skillParams.concat();
            buffParams = _arg_1.buffParams.concat();
        }

        public /*  ©init. */ function _SafeStr_286()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_286 = " NpcAIInfo" (String#16046)


