package com.tencent.ai.core.manager.key
{
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.SkillGroup;
    import com.tencent.ai.core.enum.RemoteDataID;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.events.AIEvent;
    import com.tencent.ai.core.events.GameKeyEvent;
    import com.tencent.ai.core.manager.data.IDataProvider;
    import com.tencent.free.utils.CFunction;
    
    import flash.display.Stage;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.ui.Keyboard;
    import flash.utils.Dictionary;

    public class GameKeyManager extends EventDispatcher 
    {

        private static var _keyConfigs:Vector.<GameKeyConfig>;
        private static var _Current:GameKeyManager;
        private static var _REGS:Array = [];

        private var _funcks:Dictionary;
        private var _gameCodes:Dictionary;
        private var _keyboardType:int;

        public function GameKeyManager()
        {
            _gameCodes = new Dictionary();
            _keyboardType = 0;
        }

        private static function GetDefaultKeyConfig():GameKeyConfig
        {
            if (_keyConfigs == null) {
                _keyConfigs = new Vector.<GameKeyConfig>();
            	var keyCodes:Vector.<GameKeyCode> = new Vector.<GameKeyCode>();
            	var keyConfig:GameKeyConfig = new GameKeyConfig();
                keyConfig.keyCodes = keyCodes;
                keyCodes.push(new GameKeyCode(Keyboard.UP, VKeyDef.C_up, "↑ ", "", false));
                keyCodes.push(new GameKeyCode(Keyboard.DOWN, VKeyDef.C_down, "↓ ", "", false));
                keyCodes.push(new GameKeyCode(Keyboard.LEFT, VKeyDef.C_left, " ← ", "", false));
                keyCodes.push(new GameKeyCode(Keyboard.RIGHT, VKeyDef.C_right, "→", "", false));
                keyCodes.push(new GameKeyCode(90, VKeyDef.C_z, "Z", "", true));
                keyCodes.push(new GameKeyCode(88, VKeyDef.C_x, "X", "", true));
                keyCodes.push(new GameKeyCode(67, VKeyDef.C_c, "C", "", true));
                keyCodes.push(new GameKeyCode(32, VKeyDef.C_space, "SPACE", "", true));
                keyCodes.push(new GameKeyCode(65, VKeyDef.C_a, "A", "", false));
                keyCodes.push(new GameKeyCode(83, VKeyDef.C_s, "S", "", false));
                keyCodes.push(new GameKeyCode(68, VKeyDef.C_d, "D", "", false));
                keyCodes.push(new GameKeyCode(70, VKeyDef.C_f, "F", "", false));
                keyCodes.push(new GameKeyCode(71, VKeyDef.C_g, "G", "", false));
                keyCodes.push(new GameKeyCode(81, VKeyDef.C_q, "Q", "", false));
                keyCodes.push(new GameKeyCode(66, VKeyDef.C_b, "B", "", false));
                keyCodes.push(new GameKeyCode(87, VKeyDef.C_w, "W", "", false));
                keyCodes.push(new GameKeyCode(69, VKeyDef.C_e, "E", "", false));
                keyCodes.push(new GameKeyCode(82, VKeyDef.C_r, "R", "", false));
                keyCodes.push(new GameKeyCode(84, VKeyDef.C_t, "T", "", false));
                keyCodes.push(new GameKeyCode(89, VKeyDef.C_y, "Y", "", false));
                keyCodes.push(new GameKeyCode(49, VKeyDef.C_NUM_1, "1", "", false));
                keyCodes.push(new GameKeyCode(50, VKeyDef.C_NUM_2, "2", "", false));
                keyCodes.push(new GameKeyCode(51, VKeyDef.C_NUM_3, "3", "", false));
                keyCodes.push(new GameKeyCode(52, VKeyDef.C_NUM_4, "4", "", false));
                keyCodes.push(new GameKeyCode(53, VKeyDef.C_NUM_5, "5", "", false));
                keyCodes.push(new GameKeyCode(54, VKeyDef.C_NUM_6, "6", "", false));
                keyCodes.push(new GameKeyCode(72, GameKeyEvent.FK_DOWN_MAINMSN, "H", GameKeyEvent.FK_DOWN_MAINMSN, false));
                keyCodes.push(new GameKeyCode(73, GameKeyEvent.FK_DOWN_ROLE, "I", GameKeyEvent.FK_DOWN_ROLE, false));
                keyCodes.push(new GameKeyCode(74, GameKeyEvent.FK_DOWN_DAYMSN, "J", GameKeyEvent.FK_DOWN_DAYMSN, false));
                keyCodes.push(new GameKeyCode(75, GameKeyEvent.FK_DOWN_WEEKMSN, "K", GameKeyEvent.FK_DOWN_WEEKMSN, false));
                keyCodes.push(new GameKeyCode(77, GameKeyEvent.FK_DOWN_MAP, "M", GameKeyEvent.FK_DOWN_MAP, false));
                keyCodes.push(new GameKeyCode(79, GameKeyEvent.FK_DOWN_PACK, "O", GameKeyEvent.FK_DOWN_PACK, false));
                keyCodes.push(new GameKeyCode(80, GameKeyEvent.FK_DOWN_SKILL, "P", GameKeyEvent.FK_DOWN_SKILL, false));
                keyCodes.push(new GameKeyCode(13, GameKeyEvent.FK_DOWN_CHAT, "ENTER", GameKeyEvent.FK_DOWN_CHAT, false));
                keyCodes.push(new GameKeyCode(13, GameKeyEvent.FK_DOWN_NEXTPAGE, "ENTER", GameKeyEvent.FK_DOWN_NEXTPAGE, false));
                keyCodes.push(new GameKeyCode(27, GameKeyEvent.FK_DOWN_CANCEL, "ESC", GameKeyEvent.FK_DOWN_CANCEL, false));
                _keyConfigs.push(keyConfig);
                
				keyCodes = new Vector.<GameKeyCode>();
                keyConfig = new GameKeyConfig();
                keyConfig.keyCodes = keyCodes;
                keyCodes.push(new GameKeyCode(87, VKeyDef.C_up, "W", "", false));
                keyCodes.push(new GameKeyCode(83, VKeyDef.C_down, "S", "", false));
                keyCodes.push(new GameKeyCode(65, VKeyDef.C_left, "A", "", false));
                keyCodes.push(new GameKeyCode(68, VKeyDef.C_right, "D", "", false));
                keyCodes.push(new GameKeyCode(75, VKeyDef.C_z, "K", "", true));
                keyCodes.push(new GameKeyCode(74, VKeyDef.C_x, "J", "", true));
                keyCodes.push(new GameKeyCode(76, VKeyDef.C_c, "L", "", true));
                keyCodes.push(new GameKeyCode(32, VKeyDef.C_space, "SPACE", "", true));
                keyCodes.push(new GameKeyCode(72, VKeyDef.C_a, "H", "", false));
                keyCodes.push(new GameKeyCode(85, VKeyDef.C_s, "U", "", false));
                keyCodes.push(new GameKeyCode(73, VKeyDef.C_d, "I", "", false));
                keyCodes.push(new GameKeyCode(79, VKeyDef.C_f, "O", "", false));
                keyCodes.push(new GameKeyCode(80, VKeyDef.C_g, "P", "", false));
                keyCodes.push(new GameKeyCode(81, VKeyDef.C_q, "Q", "", false));
                keyCodes.push(new GameKeyCode(66, VKeyDef.C_b, "B", "", false));
                keyCodes.push(new GameKeyCode(78, VKeyDef.C_w, "N", "", false));
                keyCodes.push(new GameKeyCode(77, VKeyDef.C_e, "M", "", false));
                keyCodes.push(new GameKeyCode(188, VKeyDef.C_r, ",", "", false));
                keyCodes.push(new GameKeyCode(190, VKeyDef.C_t, ".", "", false));
                keyCodes.push(new GameKeyCode(186, VKeyDef.C_y, ";", "", false));
                keyCodes.push(new GameKeyCode(49, VKeyDef.C_NUM_1, "1", "", false));
                keyCodes.push(new GameKeyCode(50, VKeyDef.C_NUM_2, "2", "", false));
                keyCodes.push(new GameKeyCode(51, VKeyDef.C_NUM_3, "3", "", false));
                keyCodes.push(new GameKeyCode(52, VKeyDef.C_NUM_4, "4", "", false));
                keyCodes.push(new GameKeyCode(53, VKeyDef.C_NUM_5, "5", "", false));
                keyCodes.push(new GameKeyCode(54, VKeyDef.C_NUM_6, "6", "", false));
                keyCodes.push(new GameKeyCode(54, GameKeyEvent.FK_DOWN_ROLE, "6", GameKeyEvent.FK_DOWN_ROLE, false));
                keyCodes.push(new GameKeyCode(55, GameKeyEvent.FK_DOWN_PACK, "7", GameKeyEvent.FK_DOWN_PACK, false));
                keyCodes.push(new GameKeyCode(56, GameKeyEvent.FK_DOWN_SKILL, "8", GameKeyEvent.FK_DOWN_SKILL, false));
                keyCodes.push(new GameKeyCode(57, GameKeyEvent.FK_DOWN_MAINMSN, "9", GameKeyEvent.FK_DOWN_MAINMSN, false));
                keyCodes.push(new GameKeyCode(48, GameKeyEvent.FK_DOWN_DAYMSN, "0", GameKeyEvent.FK_DOWN_DAYMSN, false));
                keyCodes.push(new GameKeyCode(189, GameKeyEvent.FK_DOWN_WEEKMSN, "-", GameKeyEvent.FK_DOWN_WEEKMSN, false));
                keyCodes.push(new GameKeyCode(221, GameKeyEvent.FK_DOWN_MAP, "]", GameKeyEvent.FK_DOWN_MAP, false));
                keyCodes.push(new GameKeyCode(13, GameKeyEvent.FK_DOWN_CHAT, "ENTER", GameKeyEvent.FK_DOWN_CHAT, false));
                keyCodes.push(new GameKeyCode(13, GameKeyEvent.FK_DOWN_NEXTPAGE, "ENTER", GameKeyEvent.FK_DOWN_NEXTPAGE, false));
                keyCodes.push(new GameKeyCode(27, GameKeyEvent.FK_DOWN_CANCEL, "ESC", GameKeyEvent.FK_DOWN_CANCEL, false));
                _keyConfigs.push(keyConfig);
            }
            return _keyConfigs[0];
        }

        public static function initialize(stage:Stage=null):void
        {
            var keyConfig:GameKeyConfig = GetDefaultKeyConfig();
            KeyManager.initialize(stage, keyConfig.keyCodes);
            GameKeyManager.Current.initKeys(keyConfig);
            VKeyDef.INIT_HOT_KYES();
        }

        public static function get Current():GameKeyManager
        {
            if (_Current == null) {
                _Current = new GameKeyManager();
            }
            return _Current;
        }


        private function uinitKeys():void
        {
            if (_funcks) {
                for each (var funcKey:FunctionKey in _funcks) {
                    KeyManager.Default.removeFuncKey(funcKey);
                    funcKey.handler = null;
                }
                _funcks = null;
            }
        }

        private function onRemoteDataReady(evt:Event):void
        {
            var dp:IDataProvider = AICore.data.runtime.remoteDataProvider;
            dp.removeEventListener(Event.INIT, this.onRemoteDataReady);
            if (dp.isReady()) {
	            var keyboardType:int = dp.getInt32(RemoteDataID.KEYBOARD_TYPE);
                if (keyboardType != -1) {
                    this.setKeyboardType(keyboardType, false);
                }
            }
        }

        public function onFunckeyInovke(_arg_1:FunctionKey):Boolean
        {
            var _local_3:GameKeyEvent;
            var _local_2:String = _arg_1.keyEventType;
            if (hasEventListener(_local_2)){
                _local_3 = new GameKeyEvent(_local_2);
                _local_3.data = _arg_1;
                dispatchEvent(_local_3);
                return (false);
            };
            return (true);
        }

        public function initKeys(keyConfig:GameKeyConfig):void
        {
            this.uinitKeys();
			
            _funcks = new Dictionary();
            var keyCodes:Vector.<GameKeyCode> = keyConfig.keyCodes;
            var len:int = keyCodes.length;
            var index:int;
            while (index < len) {
	            var subKey:GameKeyCode = keyCodes[index];
                if (subKey.isFuncKey) {
		            var funcKey:FunctionKey = new FunctionKey(subKey.code, null);
                    funcKey.keyEventType = subKey.eventType;
                    funcKey.keyDes = subKey.des;
                    funcKey.handler = new CFunction(this.onFunckeyInovke, this, [funcKey]);
                    KeyManager.Default.addFuncKey(funcKey);
                    _funcks[funcKey.keyEventType] = funcKey;
                }
                _gameCodes[subKey.char] = subKey;
                index++;
            }
            KeyManager.Default.update_R_KEYS_MAP(keyCodes);
        }

        public function setKeyboardType(keyboardType:int, flag:Boolean=true):void
        {
            if (_keyboardType != keyboardType){
                _keyboardType = keyboardType;
	            var keyConfig:GameKeyConfig = _keyConfigs[_keyboardType];
                if (keyConfig != null) {
                    this.initKeys(keyConfig);
		            var event:AIEvent = new AIEvent(AIEvent.ON_GAMEKEYBOARD_CHANGE);
                    event.data = _keyboardType;
                    AICore.dispatchAIEvent(event);
                    if (flag) {
			            var dp:IDataProvider = AICore.data.runtime.remoteDataProvider;
                        dp.setInt32(RemoteDataID.KEYBOARD_TYPE, _keyboardType);
                        dp.flush();
                    }
                }
            }
        }

        public function setUserKeyBoard():void
        {
            var dp:IDataProvider = AICore.data.runtime.remoteDataProvider;
            if (dp.isReady()) {
	            var keyboardType:int = dp.getInt32(RemoteDataID.KEYBOARD_TYPE);
                if (keyboardType != -1) {
                    this.setKeyboardType(keyboardType, false);
                }
            } else {
                dp.addEventListener(Event.INIT, this.onRemoteDataReady);
            }
        }

        public function getKeyboardType():int
        {
            return _keyboardType;
        }

        public function getFunctionKey(keyEventType:String):FunctionKey
        {
            return _funcks[keyEventType];
        }

        public function getGameKeyCode(char:String):GameKeyCode
        {
            return _gameCodes[char];
        }

        public function gameKeyDown(char:String):void
        {
            var keyCode:GameKeyCode = _gameCodes[char];
            if (keyCode) {
                KeyManager.Default.directKeyDown(keyCode.code);
            }
        }

        public function gameKeyUp(char:String):void
        {
            var keyCode:GameKeyCode = _gameCodes[char];
            if (keyCode) {
                KeyManager.Default.directKeyUp(keyCode.code);
            }
        }

        public function convertInstr(instr:String):String
        {
            var ret:String = "";
            var len:int = instr.length;
            var index:int;
            while (index < len) {
	            var char:String = instr.charAt(index);
	            var keyCode:GameKeyCode = _gameCodes[char];
                if (keyCode != null) {
                    char = keyCode.des;
                }
                ret = ret + char;
                index++;
            }
            return ret;
        }

        public function convertDes(skillGroup:SkillGroup, desType:int=1):String
        {
            var des:String = desType == 1 ? skillGroup.des : skillGroup.des2;
            var instrArgs:Array = skillGroup.instrArgs;
            var len:int = instrArgs.length;
            if (len > 1) {
	            var idx:int = 1;
                while (idx < len) {
		            var str:String = this.convertInstr(instrArgs[idx]);
		            var reg:RegExp = _REGS[idx];
                    if (reg == null) {
                        reg = new RegExp("%arg" + idx + "%", "g");
                        _REGS[idx] = reg;
                    }
                    des = des.replace(reg, str);
                    idx++;
                }
            }
            return des;
        }

    }
}
