package com.tencent.ai.core.manager.data
{

    public class DEFINE 
    {

        public static var IN_TEAM:Boolean = false;
        public static var GAME_MODE:int = 0;
        public static var IS_DEBUG:int = 0;
        public static var IS_WATCH_NET:int = 0;
        public static var FPS:int = 30;
        public static var FPMS:int = 3;
        public static var TPF:int = 33;
        public static var POLICYPORT:int = 843;
        public static var CGI_ROOT:String = "";
        public static var GAME_ROOT_SRC:String = "";
        public static var ASSET_EQUIP_SRC:String = "res/assets/equip/";
        public static var ASSET_EFFECT_SRC:String = "res/assets/effects/";
        public static var MONSTER_RES_SRC:String = "res/assets/monster/";
        public static var PET_RES_SRC:String = "res/assets/pet/";
        public static var PLAYER_RES_SRC:String = "res/assets/player/";
        public static var CITY_RES_SRC:String = "res/city/";
        public static var DUP_RES_SRC:String = "res/dup/";
        public static var G_SCENE_RES_SRC:String = "res/assets/scene/";
        public static var NPC_RES_SRC:String = "res/assets/npc/";
        public static var INTERACT_RES_SRC:String = "res/assets/interact/";
        public static var MOVIE_RES_SRC:String = "res/assets/movie/";
        public static var SOUND_RES_SRC:String = "res/assets/sound/";
        public static var ICON_RES_SRC:String = "res/assets/icon/";
        public static var ABLT_ICON_RES_SRC:String = "res/assets/icon/Ability/";
        public static var AVATAR_RES_SRC:String = "res/assets/avatarShow/";
        public static var CG_RES_SRC:String = "res/assets/game/";
        public static var RES_SKINS_SRC:String = "res/assets/skins/";
        public static var CG_THUMB_RES_SRC:String = "res/assets/game/thumb/";
        public static var LOGIN_SRC:String = "res/assets/login/";
        public static var MILITARY_SRC:String = "res/assets/badge/military/";
        public static var SSMODEL_ICON_SRC:String = "res/assets/icon/ssModel/";
        public static var G_WQX:Number = 0;
        public static var G_WQY:Number = 1;
        public static var G_PROTECTED_DMG_Q:Number = 5;
        public static var G_LIE_VX_Q:Number = 0.3;
        public static var G_SQ:Number = 0.02;
        public static var G_XVQ:int = 100;
        public static var G_XVQ_1:Number = 0.01;
        public static var G_YVQ:int = 100;
        public static var G_YVQ_1:Number = 0.01;
        public static var G_REBOUNDQ:Number = -0.3;
        public static var G_MIN_REBOUND_H:int = 500;
        public static var G_GRAVITY:int = 1073741624;//-200
        public static var Z_V_RATE:Number = 0.5;
        public static var PLAYER_WALK_Z_V_RATE:Number = 0.75;
        public static const RATE_DENOM:int = 10000;
        public static const RATE_DENOM_1:Number = 0.0001;
        public static var ATTACK_V_B:Number = 0.3;
        public static var ATTACK_V_X0:Number = 100;
        public static var ATTACK_V_MIN:int = 50;
        public static var ATTACK_V_MAX:int = 210;
        private static var __RANDOM_SEED:int = new Date().time;
        private static const __0x7fff_1:Number = (1 / 32767);//3.05185094759972E-5
        public static var DM:IDataManager;


        public static function CAST_FLOAT(_arg_1:int):Number
        {
            return ((_arg_1 * RATE_DENOM_1));
        }

        public static function CAST_V(_arg_1:int, _arg_2:Boolean=true):int
        {
            return ((_arg_1 * ((_arg_2) ? (G_XVQ) : G_YVQ)));
        }

        public static function CITY_V_ADD(_arg_1:int):int
        {
            return ((_arg_1 * 1.2));
        }

        public static function RANDOM_INT(_arg_1:int=1):int
        {
            return ((_arg_1 * RANDOM_FLOAT()));
        }

        public static function RANDOM_FLOAT():Number
        {
            var _local_1 = ((__RANDOM_SEED * 214013) + 2531011);
            __RANDOM_SEED = _local_1;
            return (((((_local_1 >> 16) & 32767) - 1) * __0x7fff_1));
        }

        public static function RANDOM_RANGE(_arg_1:Number, _arg_2:Number):Number
        {
            return ((_arg_1 + (RANDOM_FLOAT() * (_arg_2 - _arg_1))));
        }

        public static function RANDOM_REBOUND_Q():Number
        {
            return (RANDOM_RANGE(0.3, 0.4));
        }

        public static function set RANDOM_SEED(_arg_1:int):void
        {
            __RANDOM_SEED = _arg_1;
        }

    }
}
