// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.enum.ProtocolIDDef

package com.tencent.ai.core.enum
{
    import  ©init._SafeStr_481;

    public class ProtocolIDDef 
    {

        public static const SIGNATURE_CMD_REQ:int = 720897;
        public static const SIGNATURE_CMD_RSP:int = 720898;
        public static const GET_NO_CRYPTO_CMD_LIST_REQ:int = 65539;
        public static const GET_NO_CRYPTO_CMD_LIST_RSP:int = 65540;
        public static const ZONE_CMD_LOGIN_REQ:int = 524289;
        public static const ZONE_CMD_LOGIN_RSP:int = 524290;
        public static const ZONE_CMD_LOGOUT_REQ:int = 524291;
        public static const ZONE_CMD_LOGOUT_RSP:int = 524292;
        public static const ZONE_CMD_ACTIVE_REQ:int = 524293;
        public static const ZONE_CMD_ACTIVE_RSP:int = 524294;
        public static const ZONE_CMD_PLAYER_APPEAR_REQ:int = 524295;
        public static const ZONE_CMD_PLAYER_APPEAR_RSP:int = 524296;
        public static const ZONE_CMD_PLAYER_DISAPPEAR_REQ:int = 524297;
        public static const ZONE_CMD_PLAYER_DISAPPEAR_RSP:int = 524304;
        public static const ZONE_CMD_WALK_REQ:int = 524305;
        public static const ZONE_CMD_WALK_RSP:int = 524306;
        public static const ZONE_CMD_WALK_BROADCAST_REQ:int = 524307;
        public static const ZONE_CMD_WALK_BROADCAST_RSP:int = 524308;
        public static const ZONE_CMD_FOLLOWPET_BROADCAST_RSP:int = 524736;
        public static const ZONE_CMD_SCENE_INFO_REQ:int = 524309;
        public static const ZONE_CMD_SCENE_INFO_RSP:int = 524310;
        public static const ZONE_CMD_CHANGE_SCENE_REQ:int = 524325;
        public static const ZONE_CMD_CHANGE_SCENE_RSP:int = 524326;
        public static const ZONE_CMD_EQUIP_AVATAR_REQ:int = 524339;
        public static const ZONE_CMD_EQUIP_AVATAR_RSP:int = 524340;
        public static const ZONE_CMD_UNEQUIP_AVATAR_REQ:int = 524341;
        public static const ZONE_CMD_UNEQUIP_AVATAR_RSP:int = 524342;
        public static const ZONE_CMD_SKILL_SHORTCUT_REQ:int = 524357;
        public static const ZONE_CMD_SKILL_SHORTCUT_RSP:int = 524358;
        public static const ZONE_CMD_MAIN_UPGRADE_RSP:int = 524372;
        public static const ZONE_CMD_LEARN_SKILL_REQ:int = 524373;
        public static const ZONE_CMD_LEARN_SKILL_RSP:int = 524374;
        public static const ZONE_CMD_AWARD_NOTIFY_RSP:int = 524386;
        public static const ZONE_CMD_PACKAGE_NOTIFY_RSP:int = 524394;
        public static const ZONE_CMD_LEARN_PSV_SKILL_RSP:int = 524434;
        public static const ZONE_CMD_BUFF_CHANGE_REQ:int = 524413;
        public static const ZONE_CMD_BUFF_CHANGE_RSP:int = 524414;
        public static const ZONE_CMD_AVATAR_CHG_BC:int = 524449;
        public static const ZONE_CMD_BROADCAST_EFFECT_REQ:int = 524480;
        public static const ZONE_CMD_BROADCAST_EFFECT_RSP:int = 524481;
        public static const ZONE_CMD_BROADCAST_UPGRADE_REQ:int = 524521;
        public static const ZONE_CMD_BROADCAST_UPGRADE_RSP:int = 524522;
        public static const ZONE_CMD_PLAYER_INFO_REFRESH:int = 524472;
        public static const DIR_CMD_GET_RECOMMEND_ROOM_REQ:int = 917505;
        public static const DIR_CMD_GET_RECOMMEND_ROOM_RSP:int = 917506;
        public static const DIR_CMD_GET_RANGE_ROOM_REQ:int = 917513;
        public static const DIR_CMD_GET_RANGE_ROOM_RSP:int = 917514;
        public static const ROLELIST_CMD_REQ:int = 851969;
        public static const ROLELIST_CMD_RSP:int = 851970;
        public static const REGISTER_CMD_REQ:int = 786433;
        public static const REGISTER_CMD_RSP:int = 786434;
        public static const DUP_LOTTERY_REQ:int = 589865;
        public static const DUP_LOTTERY_RSP:int = 589866;
        public static const DUP_CMD_EQUIP_CHG_BC:int = 589870;
        public static const DUP_CMD_COMBATINFO_CHG_RSP:int = 589874;
        public static const DUP_CMD_SPAWN_MONSTER_REQ:int = 589875;
        public static const DUP_CMD_SPAWN_MONSTER_RSP:int = 589876;
        public static const ZONE_CMD_SPAWN_MONSTER_REQ:int = 2032413;
        public static const ZONE_CMD_SPAWN_MONSTER_RSP:int = 2032414;
        public static const ZONE_CMD_SPAWN_MONSTER_2_REQ:int = 2032461;
        public static const ZONE_CMD_SPAWN_MONSTER_2_RSP:int = 2032462;
        public static const DUP_MONSTER_DEAD_REQ:int = 589877;
        public static const DUP_MONSTER_DEAD_RSP:int = 589878;
        public static const DUP_PICK_ITEM_REQ:int = 589879;
        public static const DUP_PICK_ITEM_RSP:int = 589880;
        public static const DUP_REVIVE_REQ:int = 589893;
        public static const DUP_REVIVE_RSP:int = 589894;
        public static const AC_EVENT_REPORT_CMD_REQ:int = 589907;
        public static const DUP_CMD_BORN_STATUS_CHG_RSP:int = 589922;
        public static const DUP_BOSS_DEAD_REQ:int = 589923;
        public static const DUP_STARCHEAT_REPORT:int = 589925;
        public static const DUP_CMD_HEART_BEAT_REQ:int = 589949;
        public static const DUP_CMD_PAUSE_RSP:int = 589952;
        public static const CONNECTD_CMD_DISCONNECT:int = 65537;
        public static const ZONE_CMD_HANG_UP_RSP:int = 524469;
        public static const ZONE_CMD_HANG_UP_REQ:int = 524468;
        public static const ZONE_CMD_INDULGE_STATE_RSP:int = 524455;
        public static const ZONE_CMD_INDULGE_STATE_REQ:int = 524454;
        public static const ZONE_CMD_CLIENT_DATA_RSP:int = 524457;
        public static const ZONE_CMD_CLIENT_DATA_REQ:int = 524456;
        public static const ZONE_CMD_CLIENT_DATA_RSP2:int = 524459;
        public static const ZONE_CMD_CLIENT_DATA_REQ2:int = 524458;
        public static const ZONE_CMD_REAL_NAME_REG_RSP:int = 524467;
        public static const ZONE_CMD_REAL_NAME_REG_REQ:int = 524466;
        public static const ZONE_CMD_REAL_NAME_REG_RSP2:int = 524463;
        public static const ZONE_CMD_REAL_NAME_REG_REQ2:int = 524462;
        public static const ZONE_CMD_REAL_NAME_REG_RSP3:int = 524465;
        public static const ZONE_CMD_REAL_NAME_REG_REQ3:int = 524464;
        public static const ZONE_CMD_TIREDNESS_CHG_RSP:int = 524441;
        public static const ZONE_CMD_TIREDNESS_CHG_REQ:int = 524440;
        public static const ZONE_CMD_CLIENT_OSS_REPORT_REQ:int = 524482;
        public static const ZONE_CMD_CHECK_EXCHANGE_RSP:int = 0x170016;
        public static const ZONE_CMD_CHECK_EXCHANGE_REQ:int = 0x170015;
        public static const ZONE_CMD_EXCHANGE_RSP:int = 0x170014;
        public static const ZONE_CMD_EXCHANGE_REQ:int = 0x170013;
        public static const ZONE_CMD_AWARD_RSP:int = 524504;
        public static const ZONE_CMD_AWARD_REQ:int = 524503;
        public static const ZONE_CMD_SUBLIME_RSP:int = 525826;
        public static const ZONE_CMD_JOIN_TEAM_RSP:int = 526898;
        public static const ZONE_CMD_CIENT_DATA_QUERY_REQ:int = 1509703;
        public static const ZONE_CMD_CIENT_DATA_QUERY_RSP:int = 1509704;
        public static const ZONE_CMD_CIENT_DATA_UPDATE_REQ:int = 1509705;


        public /*  ©init. */ function _SafeStr_481()
        {
        }


    }
}//package com.tencent.ai.core.enum

// _SafeStr_481 = " ProtocolIDDef" (String#15758)


