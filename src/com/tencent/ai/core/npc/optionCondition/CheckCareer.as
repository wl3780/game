// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.npc.optionCondition.CheckCareer

package com.tencent.ai.core.npc.optionCondition
{
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.DetailPlayerInfo;
    import  ©init._SafeStr_812;

    public class CheckCareer implements IOptionCondition 
    {


        public function check(_arg_1:String):Boolean
        {
            var _local_3:int;
            var _local_2:DetailPlayerInfo = AICore.data.mainModel.getDetailPlayerInfo();
            if (_local_2){
                _local_3 = int(_arg_1);
                if (int((_local_2.career.careerID * 0.01)) == int((_local_3 * 0.01))){
                    return (true);
                };
            };
            return (false);
        }

        public /*  ©init. */ function _SafeStr_812()
        {
        }


    }
}//package com.tencent.ai.core.npc.optionCondition

// _SafeStr_812 = " CheckCareer" (String#15665)


