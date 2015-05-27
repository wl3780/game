package com.tencent.ai.core.enum
{
    import com.tencent.ai.core.manager.key.StrKF;
    import com.tencent.free.utils.CFunction;

    public class VKeyDef 
    {

        public static const C_up:String = "u";
        public static const C_down:String = "b";
        public static const C_left:String = "l";
        public static const C_right:String = "r";
        public static const C_space:String = "k";
		
        public static const C_a:String = "a";
        public static const C_c:String = "c";
        public static const C_s:String = "s";
        public static const C_d:String = "d";
        public static const C_f:String = "f";
        public static const C_g:String = "g";
        public static const C_q:String = "q";
        public static const C_b:String = "v";
        public static const C_w:String = "w";
        public static const C_e:String = "e";
        public static const C_r:String = "n";
        public static const C_t:String = "t";
        public static const C_x:String = "x";
        public static const C_y:String = "y";
        public static const C_z:String = "z";
		
        public static const C_A:String = "A";
        public static const C_S:String = "S";
        public static const C_D:String = "D";
        public static const C_F:String = "F";
        public static const C_G:String = "G";
        public static const C_Q:String = "Q";
        public static const C_B:String = "V";
        public static const C_W:String = "W";
        public static const C_E:String = "E";
        public static const C_R:String = "N";
        public static const C_T:String = "T";
        public static const C_Y:String = "Y";
		
        public static const C_NUM_1:String = "!";
        public static const C_NUM_2:String = "@";
        public static const C_NUM_3:String = "#";
        public static const C_NUM_4:String = "$";
        public static const C_NUM_5:String = "%";
        public static const C_NUM_6:String = "^";
        public static const ITEM_A:int = 10000;
        public static const ITEM_S:int = 10001;
        public static const ITEM_D:int = 10002;
        public static const ITEM_F:int = 10003;
        public static const ITEM_G:int = 10004;
        public static const ITEM_Q:int = 10005;
        public static const ITEM_A_UP:int = 11000;
        public static const ITEM_S_UP:int = 11001;
        public static const ITEM_D_UP:int = 11002;
        public static const ITEM_F_UP:int = 11003;
        public static const ITEM_G_UP:int = 11004;
        public static const ITEM_Q_UP:int = 11005;
        public static const ITEM_W:int = 10006;
        public static const ITEM_E:int = 10007;
        public static const ITEM_R:int = 10008;
        public static const ITEM_T:int = 10009;
        public static const ITEM_Y:int = 10010;
        public static const ITEM_V:int = 10011;
        public static const ITEM_W_UP:int = 11006;
        public static const ITEM_E_UP:int = 11007;
        public static const ITEM_R_UP:int = 0x2B00;
        public static const ITEM_T_UP:int = 11009;
        public static const ITEM_Y_UP:int = 11010;
        public static const ITEM_V_UP:int = 11011;
        
		public static const HOT_KEY_FLAG_1:Array = [0, ITEM_A, ITEM_S, ITEM_D, ITEM_F, ITEM_G, ITEM_Q, ITEM_W, ITEM_E, ITEM_R, ITEM_T, ITEM_Y, ITEM_V];
		
        public static const ITEM_1:int = 20000;
        public static const ITEM_2:int = 20001;
        public static const ITEM_3:int = 20002;
        public static const ITEM_4:int = 20003;
        public static const ITEM_5:int = 20004;
        public static const ITEM_6:int = 20005;
        public static const KEY_FRONT_DOWN:int = 50001;
        public static const KEY_FRONT_UP:int = 50002;
        public static const KEY_BACK_DOWN:int = 50003;
        public static const KEY_BACK_UP:int = 50004;
        
        public static const EMPTY:int = -1;
		public static const GO_UP:int = 0;
        public static const GO_DOWN:int = 1;
        public static const GO_LEFT:int = 2;
        public static const GO_RIGHT:int = 3;
        public static const RUN_LEFT:int = 4;
        public static const RUN_RIGHT:int = 5;
        public static const STRIKE:int = 6;
        public static const STOP_UP:int = 7;
        public static const STOP_DOWN:int = 8;
        public static const STOP_LEFT:int = 9;
        public static const STOP_RIGHT:int = 10;
		
        public static const FIGHT:int = 11;
        public static const SHAKE:int = 12;
        public static const Z_DOWN:int = 13;
        public static const SPACE_DOWN:int = 14;
        public static const JUMP:int = 15;
        public static const BACK_JUMP:int = 16;
        public static const JUMP_FIGHT:int = 17;
        public static const FIGHT_UP:int = 18;
        public static const Z_UP:int = 19;
        public static const SPACE_UP:int = 20;
        public static const JUMP_UP:int = 21;
        public static const HURT:int = 22;
        public static const DEAD:int = 23;
        public static const CAPTIVE:int = 24;
        public static const CAUGHT:int = 25;
        public static const BETHROWN:int = 26;
        public static const GO_Y_UP:int = 30;
        public static const GO_Y_DOWN:int = 31;
        public static const STOP_Y_UP:int = 32;
        public static const STOP_Y_DOWN:int = 33;
        public static const PICKUP:int = 35;
        public static const RIDE:int = 36;
        public static const RUN_UP:int = 40;
        public static const RUN_DOWN:int = 41;
        public static const DEF_INTERCT_VKEY_1:int = 998;
        
		public static var V_HOT_KEY_1:Array;
        public static var V_HOT_KEY_1_COUNT:int;
        public static var V_HOT_KEY_2:Array;

        public static function INIT_HOT_KYES():void
        {
            V_HOT_KEY_1 = [
				null,
				new StrKF(C_a, new CFunction(null, null, [ITEM_A]), 0, 1),
				new StrKF(C_s, new CFunction(null, null, [ITEM_S]), 0, 1),
				new StrKF(C_d, new CFunction(null, null, [ITEM_D]), 0, 1),
				new StrKF(C_f, new CFunction(null, null, [ITEM_F]), 0, 1),
				new StrKF(C_g, new CFunction(null, null, [ITEM_G]), 0, 1),
				new StrKF(C_q, new CFunction(null, null, [ITEM_Q]), 0, 1),
				new StrKF(C_w, new CFunction(null, null, [ITEM_W]), 0, 1),
				new StrKF(C_e, new CFunction(null, null, [ITEM_E]), 0, 1),
				new StrKF(C_r, new CFunction(null, null, [ITEM_R]), 0, 1),
				new StrKF(C_t, new CFunction(null, null, [ITEM_T]), 0, 1),
				new StrKF(C_y, new CFunction(null, null, [ITEM_Y]), 0, 1),
				new StrKF(C_b, new CFunction(null, null, [ITEM_V]), 0, 1),
				new StrKF(C_A, new CFunction(null, null, [ITEM_A_UP]), 0, 2),
				new StrKF(C_S, new CFunction(null, null, [ITEM_S_UP]), 0, 2),
				new StrKF(C_D, new CFunction(null, null, [ITEM_D_UP]), 0, 2),
				new StrKF(C_F, new CFunction(null, null, [ITEM_F_UP]), 0, 2),
				new StrKF(C_G, new CFunction(null, null, [ITEM_G_UP]), 0, 2),
				new StrKF(C_Q, new CFunction(null, null, [ITEM_Q_UP]), 0, 2),
				new StrKF(C_W, new CFunction(null, null, [ITEM_W_UP]), 0, 2),
				new StrKF(C_E, new CFunction(null, null, [ITEM_E_UP]), 0, 2),
				new StrKF(C_R, new CFunction(null, null, [ITEM_R_UP]), 0, 2),
				new StrKF(C_T, new CFunction(null, null, [ITEM_T_UP]), 0, 2),
				new StrKF(C_Y, new CFunction(null, null, [ITEM_Y_UP]), 0, 2),
				new StrKF(C_B, new CFunction(null, null, [ITEM_V_UP]), 0, 2)
			];
            V_HOT_KEY_2 = [
				null,
				new StrKF(C_NUM_1, new CFunction(null, null, [ITEM_1]), Constants.KEY_GROUP_ITEM, 1),
				new StrKF(C_NUM_2, new CFunction(null, null, [ITEM_2]), Constants.KEY_GROUP_ITEM, 1),
				new StrKF(C_NUM_3, new CFunction(null, null, [ITEM_3]), Constants.KEY_GROUP_ITEM, 1),
				new StrKF(C_NUM_4, new CFunction(null, null, [ITEM_4]), Constants.KEY_GROUP_ITEM, 1),
				new StrKF(C_NUM_5, new CFunction(null, null, [ITEM_5]), Constants.KEY_GROUP_ITEM, 1),
				new StrKF(C_NUM_6, new CFunction(null, null, [ITEM_6]), Constants.KEY_GROUP_ITEM, 1)
			];
            V_HOT_KEY_1_COUNT = (V_HOT_KEY_1.length - 1) / 2;
        }

        public static function IS_HOT_KEY(keyCode:int):Boolean
        {
            return keyCode >= ITEM_A && keyCode < ITEM_6;
        }

        public static function IS_DIRECTION_KEY(keyCode:int):Boolean
        {
            return keyCode == EMPTY
				|| keyCode == GO_UP 
				|| keyCode == GO_DOWN 
				|| keyCode == GO_LEFT 
				|| keyCode == GO_RIGHT 
				|| keyCode == RUN_LEFT 
				|| keyCode == RUN_RIGHT 
				|| keyCode == STOP_UP 
				|| keyCode == STOP_DOWN 
				|| keyCode == STOP_LEFT 
				|| keyCode == STOP_RIGHT;
        }

        public static function TO_SIMPLE_VKEY(keyCode:int, flag:Boolean=false, func:Function=null):int
        {
            if (keyCode >= 1000) {
                if (flag && IS_HOT_KEY(keyCode)) {
                    if (func == null) {
                        return keyCode;
                    }
                    keyCode = func(keyCode);
                }
                keyCode = keyCode % 1000;
                if (keyCode == 0) {
                    return EMPTY;
                }
            }
            return keyCode;
        }

    }
}
