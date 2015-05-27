// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.EquipEnhanceLevelInfo

package com.tencent.ai.core.data
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.enum.EquipAttribPairType;
    import  ©init._SafeStr_251;

    public class EquipEnhanceLevelInfo 
    {

        public var defenceVect:Vector.<int>;
        public var mgDefenceVect:Vector.<int>;
        public var attackVect:Vector.<int>;


        public function getEnhanceLevel(_arg_1:int, _arg_2:int):int
        {
            var _local_3:int;
            if (_arg_1 >= this.defenceVect.length){
                return (_local_3);
            };
            if ((((_arg_2 == EquipAttribPairType.P_ATTACK)) || ((_arg_2 == EquipAttribPairType.M_ATTACK)))){
                _local_3 = this.attackVect[_arg_1];
            } else {
                if (_arg_2 == EquipAttribPairType.P_DEFEND){
                    _local_3 = this.defenceVect[_arg_1];
                } else {
                    if (_arg_2 == EquipAttribPairType.M_DEFEND){
                        _local_3 = this.mgDefenceVect[_arg_1];
                    };
                };
            };
            return (_local_3);
        }

        public /*  ©init. */ function _SafeStr_251()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_251 = " EquipEnhanceLevelInfo" (String#14321)


