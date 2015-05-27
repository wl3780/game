// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.CareerInfo

package com.tencent.ai.core.data
{
    import flash.utils.Dictionary;
    import com.tencent.ai.core.enum.CareerIDDef;
    import  ©init._SafeStr_222;

    public class CareerInfo 
    {

        private static var sublimeCareerNameHash:Dictionary;

        public var careerID:int;
        public var careeName:String;
        public var minComboTime:int = 2000;

        public function CareerInfo(_arg_1:int=0, _arg_2:String="")
        {
            this.careerID = _arg_1;
            this.careeName = _arg_2;
            if (!CareerInfo.sublimeCareerNameHash){
                CareerInfo.sublimeCareerNameHash = new Dictionary();
                CareerInfo.sublimeCareerNameHash[CareerIDDef.S_GAT] = "光之主宰";
                CareerInfo.sublimeCareerNameHash[CareerIDDef.S_GF] = "烈火战魂";
                CareerInfo.sublimeCareerNameHash[CareerIDDef.S_GW] = "通灵圣光";
                CareerInfo.sublimeCareerNameHash[CareerIDDef.L_GAT] = "狙击霸王";
                CareerInfo.sublimeCareerNameHash[CareerIDDef.L_GF] = "重炮机神";
                CareerInfo.sublimeCareerNameHash[CareerIDDef.L_GW] = "神威战灵";
                CareerInfo.sublimeCareerNameHash[CareerIDDef.F_GAT] = "极速幻影";
                CareerInfo.sublimeCareerNameHash[CareerIDDef.F_GF] = "飓风武神";
                CareerInfo.sublimeCareerNameHash[CareerIDDef.F_GW] = "神力圣卫";
                CareerInfo.sublimeCareerNameHash[CareerIDDef.CH_GAT] = "疾风魅影";
                CareerInfo.sublimeCareerNameHash[CareerIDDef.CH_GF] = "赤练战姬";
                CareerInfo.sublimeCareerNameHash[CareerIDDef.GU_GAT] = "曙光女神";
                CareerInfo.sublimeCareerNameHash[CareerIDDef.CS_GAT] = "星辰冻结者";
            };
        }

        public function getFullCareerIDs():Array
        {
            var _local_3:int;
            var _local_1:Array = [];
            var _local_2:int = (this.careerID % 100);
            if (_local_2){
                _local_1.push((this.careerID - _local_2));
                _local_3 = (_local_2 % 10);
                if (_local_3){
                    _local_1.push((this.careerID - _local_3));
                };
                _local_1.push(this.careerID);
            } else {
                _local_1.push(this.careerID);
            };
            return (_local_1);
        }

        public function getSublimeCareerName():String
        {
            return (((CareerInfo.sublimeCareerNameHash[this.careerID]) ? (CareerInfo.sublimeCareerNameHash[this.careerID]) : ""));
        }

        public function toCareerName():String
        {
            return (((this.getSublimeCareerName()) || (this.careeName)));
        }

        public /*  ©init. */ function _SafeStr_222()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_222 = " CareerInfo" (String#17177)


