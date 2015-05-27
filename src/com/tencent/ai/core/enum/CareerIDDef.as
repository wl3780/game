// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.enum.CareerIDDef

package com.tencent.ai.core.enum
{
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.CareerInfo;
    import  ©init._SafeStr_413;

    public class CareerIDDef 
    {

        private static var _tempCareerInfos:Dictionary;
        public static const SWORDMAN:int = 100;
        public static const S_GAT:int = 110;
        public static const S_GF:int = 120;
        public static const S_GW:int = 130;
        public static const LAUNCHER:int = 200;
        public static const L_GAT:int = 210;
        public static const L_GF:int = 220;
        public static const L_GW:int = 230;
        public static const FLASHER:int = 300;
        public static const F_GAT:int = 310;
        public static const F_GF:int = 320;
        public static const F_GW:int = 330;
        public static const CHAINWOMAN:int = 400;
        public static const CH_GAT:int = 410;
        public static const CH_GF:int = 420;
        public static const CH_GW:int = 430;
        public static const GUNGNIR:int = 500;
        public static const GU_GAT:int = 510;
        public static const GU_GF:int = 520;
        public static const GU_GW:int = 530;
        public static const COOL_STAR:int = 600;
        public static const CS_GAT:int = 610;
        public static const CS_GF:int = 620;
        public static const CS_GW:int = 630;
        public static const ETHNIC_COUNT:int = 4;


        public static function getCareerInfos():Dictionary
        {
            if (_tempCareerInfos == null){
                _tempCareerInfos = new Dictionary();
                _tempCareerInfos[CareerIDDef.SWORDMAN] = new CareerInfo(CareerIDDef.SWORDMAN, "天剑");
                _tempCareerInfos[CareerIDDef.S_GAT] = new CareerInfo(CareerIDDef.S_GAT, "GAT闪光");
                _tempCareerInfos[CareerIDDef.S_GF] = new CareerInfo(CareerIDDef.S_GF, "GF战神");
                _tempCareerInfos[CareerIDDef.S_GW] = new CareerInfo(CareerIDDef.S_GW, "GW通灵");
                _tempCareerInfos[CareerIDDef.LAUNCHER] = new CareerInfo(CareerIDDef.LAUNCHER, "枪炮");
                _tempCareerInfos[CareerIDDef.L_GAT] = new CareerInfo(CareerIDDef.L_GAT, "GAT点睛");
                _tempCareerInfos[CareerIDDef.L_GF] = new CareerInfo(CareerIDDef.L_GF, "GF雷电");
                _tempCareerInfos[CareerIDDef.L_GW] = new CareerInfo(CareerIDDef.L_GW, "GW强袭");
                _tempCareerInfos[CareerIDDef.FLASHER] = new CareerInfo(CareerIDDef.FLASHER, "闪影");
                _tempCareerInfos[CareerIDDef.F_GAT] = new CareerInfo(CareerIDDef.F_GAT, "GAT极速");
                _tempCareerInfos[CareerIDDef.F_GF] = new CareerInfo(CareerIDDef.F_GF, "GF风暴");
                _tempCareerInfos[CareerIDDef.F_GW] = new CareerInfo(CareerIDDef.F_GW, "GW心眼");
                _tempCareerInfos[CareerIDDef.CHAINWOMAN] = new CareerInfo(CareerIDDef.CHAINWOMAN, "链刃");
                _tempCareerInfos[CareerIDDef.CH_GAT] = new CareerInfo(CareerIDDef.CH_GAT, "GAT风舞");
                _tempCareerInfos[CareerIDDef.CH_GF] = new CareerInfo(CareerIDDef.CH_GF, "GF红莲");
                _tempCareerInfos[CareerIDDef.CH_GW] = new CareerInfo(CareerIDDef.CH_GW, "GW链刃");
                _tempCareerInfos[CareerIDDef.GUNGNIR] = new CareerInfo(CareerIDDef.GUNGNIR, "圣枪");
                _tempCareerInfos[CareerIDDef.GU_GAT] = new CareerInfo(CareerIDDef.GU_GAT, "拂晓圣枪");
                _tempCareerInfos[CareerIDDef.GU_GF] = new CareerInfo(CareerIDDef.GU_GF, "拂晓圣枪");
                _tempCareerInfos[CareerIDDef.GU_GW] = new CareerInfo(CareerIDDef.GU_GW, "拂晓圣枪");
                _tempCareerInfos[CareerIDDef.COOL_STAR] = new CareerInfo(CareerIDDef.COOL_STAR, "寒星");
                _tempCareerInfos[CareerIDDef.CS_GAT] = new CareerInfo(CareerIDDef.CS_GAT, "极地寒星");
                _tempCareerInfos[CareerIDDef.CS_GF] = new CareerInfo(CareerIDDef.CS_GF, "GF寒星");
                _tempCareerInfos[CareerIDDef.CS_GW] = new CareerInfo(CareerIDDef.CS_GW, "GW寒星");
                _tempCareerInfos[0] = new CareerInfo(0, "怪物");
            };
            return (_tempCareerInfos);
        }


        public /*  ©init. */ function _SafeStr_413()
        {
        }


    }
}//package com.tencent.ai.core.enum

// _SafeStr_413 = " CareerIDDef" (String#14822)


