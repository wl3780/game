package com.tencent.ai.core.manager.key
{
	import com.tencent.ai.core.enum.VKeyDef;
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.IMEEvent;
	import flash.events.KeyboardEvent;
	import flash.system.IME;
	import flash.system.IMEConversionMode;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;

	public class KeyManager implements IKeyboard 
	{

		private static var __instance:KeyManager;

		protected var m_stage:Stage;
		protected var m_lock:Boolean;
		protected var m_enabled:Boolean;
		protected var m_funcKeyEnabled:Boolean;
		
		protected var m_keyGroups:Dictionary;
		protected var m_enabledGroup:int = -1;
		protected var m_currentGroup:KeyGroup;
		protected var m_keyDownMap:Dictionary;
		/** CD列表（isRepeat的键才有） */
		protected var m_keyCTimeCache:Dictionary;
		protected var m_maxCTime:int = 100;
		/** code 2 char */
		protected var m_R_KEYS_MAP:Dictionary;
		/** 功能键列表 */
		protected var m_funckeys:Vector.<FunctionKey>;

		public function KeyManager(stage:Stage, keyCodes:Vector.<GameKeyCode>)
		{
			this.m_stage = stage;
			this.initThis(keyCodes);
		}

		public static function initialize(stage:Stage=null, keyCodes:Vector.<GameKeyCode>=null):void
		{
			if (__instance == null) {
				__instance = new KeyManager(stage, keyCodes);
			}
		}

		public static function NEW_HOT_KEY_2_HANDLER(handler:Function, target:Object):void
		{
			var list:Array = VKeyDef.V_HOT_KEY_2;
			var index:int = 1;
			while (index < list.length) {
				StrKF(list[index]).newHandler(handler, target);
				index++;
			}
		}

		public static function INVOKE_HOT_KEY(index:int, type:int=1):void
		{
			var list:Array = type == 1 ? VKeyDef.V_HOT_KEY_1 : VKeyDef.V_HOT_KEY_2;
			var filter:StrKF = list[index];
			if (filter != null) {
				filter.invokeHandler();
			}
		}

		public static function get Default():KeyManager
		{
			return __instance;
		}

		public static function add(filter:IKeyFilter):void
		{
			__instance.addKeyFilter(filter);
		}
		public static function remove(filter:IKeyFilter):void
		{
			__instance.removeKeyFilter(filter);
		}

		public static function useGroup(groupID:int):void
		{
			__instance.useGroup(groupID);
			__instance.setEnabled(true);
		}

		public static function setLock(value:Boolean):void
		{
			__instance.setLock(value);
		}

		public static function setEnabled(value:Boolean):void
		{
			__instance.setEnabled(value);
		}
		public static function getEnabled():Boolean
		{
			return __instance.getEnabled();
		}

		public static function setFuncKeyEnabled(enable:Boolean):void
		{
			__instance.setFuncKeyEnabled(enable);
		}

		public static function addFuncKey(funcKey:FunctionKey):void
		{
			__instance.addFuncKey(funcKey);
		}
		public static function removeFuncKey(funcKey:FunctionKey):void
		{
			__instance.removeFuncKey(funcKey);
		}

		public static function set IME_Enabled(value:Boolean):void
		{
			IME.enabled = value;
		}
		public static function get IME_Enabled():Boolean
		{
			return IME.enabled;
		}

		public static function set IME_ConversionMode(value:String):void
		{
			if (IME.enabled) {
				IME.conversionMode = value;
			}
		}
		public static function get IME_ConversionMode():String
		{
			return IME.conversionMode;
		}


		protected function initThis(keyCodes:Vector.<GameKeyCode>):void
		{
			this.m_keyGroups = new Dictionary();
			this.m_keyDownMap = new Dictionary();
			this.m_keyCTimeCache = new Dictionary();
			this.m_funckeys = new Vector.<FunctionKey>();
			
			var len:uint = keyCodes.length;
			var idx:int;
			while (idx < len) {
				var keyCode:GameKeyCode = keyCodes[idx];
				if (!keyCode.isFuncKey) {
					StrKF.addChar(keyCode.char, keyCode.code);
					if (keyCode.isRepeat) {
						this.m_keyCTimeCache[StrKF.getCode(keyCode.char)] = 1;
					}
				}
				idx++;
			}
			
			this.m_stage.addEventListener(Event.DEACTIVATE, onStageDeactivate);
			this.m_lock = false;
			this.m_enabled = false;
			this.m_funcKeyEnabled = false;
			this.setFuncKeyEnabled(true);
			this.onIMEChange(null);
		}

		protected function onIMEChange(event:IMEEvent):void
		{
			IME_ConversionMode = IMEConversionMode.ALPHANUMERIC_HALF;
			IME_Enabled = false;
		}

		protected function onStageDeactivate(evt:Event):void
		{
			this.allKeysUP();
		}

		protected function onGameKeyDown(evt:KeyboardEvent):void
		{
			var realCode:int = this.m_R_KEYS_MAP[evt.keyCode];
			var isDown:Boolean = this.m_keyDownMap[realCode];
			var nowTime:int = getTimer();
			var lastTime:int = this.m_keyCTimeCache[realCode];
			if (isDown && (lastTime == 0 || (nowTime - lastTime) < this.m_maxCTime)) {
				return;
			}
			if (lastTime != 0) {
				this.m_keyCTimeCache[realCode] = nowTime;
			}
			this.m_keyDownMap[realCode] = true;
			if (this.m_currentGroup != null) {
				this.m_currentGroup.onKeyDown(realCode, nowTime, this);
			}
		}

		protected function onGameKeyUp(evt:KeyboardEvent):void
		{
			var realCode:int = this.m_R_KEYS_MAP[evt.keyCode];
			var isDown:Boolean = this.m_keyDownMap[realCode];
			if (isDown) {
				this.m_keyDownMap[realCode] = false;
				if (this.m_currentGroup != null) {
					this.m_currentGroup.onKeyUp(realCode, getTimer(), this);
				}
			}
		}

		protected function allKeysUP():void
		{
			for (var code:Object in this.m_keyDownMap) {
				this.directKeyUp(code as int, false);
			}
			this.m_keyDownMap = new Dictionary();
		}

		protected function onFuncKeyDown(evt:KeyboardEvent):void
		{
			var idx:int = this.m_funckeys.length - 1;
			while (idx >= 0) {
				if (idx < this.m_funckeys.length) {
					if (!this.m_funckeys[idx].checkKeyDown(evt)) {
						break;
					}
				}
				idx--;
			}
		}

		function directKeyDown(code:int, isDirect:Boolean=true):void
		{
			if (this.m_currentGroup != null) {
				if (isDirect) {
					code = this.m_R_KEYS_MAP[code];
				}
				this.m_currentGroup.onKeyDown(code, getTimer(), this);
			}
		}

		function directKeyUp(code:int, isDirect:Boolean=true):void
		{
			if (isDirect) {
				code = this.m_R_KEYS_MAP[code];
			}
			var isDown:Boolean = this.m_keyDownMap[code];
			if (isDown) {
				this.m_keyDownMap[code] = false;
				if (this.m_currentGroup != null) {
					this.m_currentGroup.onKeyUp(code, getTimer(), this);
				}
			}
		}

		public function update_R_KEYS_MAP(keyList:Vector.<GameKeyCode>):void
		{
			this.m_R_KEYS_MAP = new Dictionary();
			var len:uint = keyList.length;
			var idx:int;
			while (idx < len) {
				var keyCode:GameKeyCode = keyList[idx];
				if (!keyCode.isFuncKey) {
					this.m_R_KEYS_MAP[keyCode.code] = StrKF.getCode(keyCode.char);
				}
				idx++;
			}
		}

		public function addKeyFilter(filter:IKeyFilter):void
		{
			if (filter == null) {
				return;
			}
			var groupID:int = filter.getGroupID();
			var keyGroup:KeyGroup = this.m_keyGroups[groupID];
			if (keyGroup == null) {
				keyGroup = new KeyGroup(groupID);
				this.m_keyGroups[groupID] = keyGroup;
			}
			keyGroup.addKeyFilter(filter);
		}

		public function removeKeyFilter(filter:IKeyFilter):void
		{
			if (filter == null) {
				return;
			}
			var groupID:int = filter.getGroupID();
			var keyGroup:KeyGroup = this.m_keyGroups[groupID];
			if (keyGroup != null) {
				keyGroup.removeKeyFilter(filter);
			}
		}

		public function useGroup(groupID:int):void
		{
			this.m_enabledGroup = groupID;
			this.m_currentGroup = this.m_keyGroups[this.m_enabledGroup];
		}

		public function addKeyGroup(keyGroup:KeyGroup):void
		{
			if (keyGroup == null) {
				return;
			}
			this.m_keyGroups[keyGroup.groupID] = keyGroup;
		}
		
		public function clearGroupFilters(groupID:int):void
		{
			if (this.m_enabledGroup == groupID) {
				this.m_enabledGroup = -1;
				this.m_currentGroup = null;
			}
			delete this.m_keyGroups[groupID];
		}

		public function setLock(value:Boolean):void
		{
			this.m_lock = value;
		}

		public function setEnabled(value:Boolean):void
		{
			if (this.m_lock) {
				return;
			}
			if (value) {
				this.m_stage.addEventListener(KeyboardEvent.KEY_DOWN, onGameKeyDown);
				this.m_stage.addEventListener(KeyboardEvent.KEY_UP, onGameKeyUp);
				this.m_enabled = true;
			} else {
				this.allKeysUP();
				this.m_stage.removeEventListener(KeyboardEvent.KEY_DOWN, onGameKeyDown);
				this.m_stage.removeEventListener(KeyboardEvent.KEY_UP, onGameKeyUp);
				this.m_enabled = false;
			}
		}
		public function getEnabled():Boolean
		{
			return this.m_enabled;
		}

		public function addFuncKey(funcKey:FunctionKey):void
		{
			if (funcKey != null) {
				if (this.m_funckeys.indexOf(funcKey) == -1){
					this.m_funckeys.push(funcKey);
				}
			}
		}
		public function removeFuncKey(funcKey:FunctionKey):void
		{
			var index:int = this.m_funckeys.indexOf(funcKey);
			if (index != -1) {
				this.m_funckeys.splice(index, 1);
			}
		}

		public function setFuncKeyEnabled(value:Boolean):void
		{
			if (value) {
				this.m_stage.addEventListener(KeyboardEvent.KEY_DOWN, onFuncKeyDown);
				this.m_funcKeyEnabled = true;
			} else {
				this.m_stage.removeEventListener(KeyboardEvent.KEY_DOWN, onFuncKeyDown);
				this.m_funcKeyEnabled = false;
			}
		}
		public function getFuncKeyEnabled():Boolean
		{
			return this.m_funcKeyEnabled;
		}

		public function isKeyDown(keyCode:int):Boolean
		{
			return this.m_keyDownMap[keyCode] == true;
		}

	}
}
