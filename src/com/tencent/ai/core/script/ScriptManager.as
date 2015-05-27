package com.tencent.ai.core.script
{
    import flash.utils.Dictionary;

    public class ScriptManager implements IScriptManager 
    {

        public static var SCRIPT_CLS_MAP:Dictionary;
        private static var _INSTANCE:ScriptManager;
        
		static var G_SCRIPT_INSTANCE:Dictionary;
        static var M_TARGET_TYPES:Array;

        public static function getInstance():ScriptManager
        {
            if (_INSTANCE == null) {
                _INSTANCE = new ScriptManager();
            }
            return _INSTANCE;
        }


        public function initialize():void
        {
        }

        public function newScript(cmd:String):IScript
        {
            var cls:Class = SCRIPT_CLS_MAP[cmd];
            if (cls == null) {
                return null;
            }
            return new cls() as IScript;
        }

        public function executeScript(cmd:String, arg:Object=null, target:Object=null):void
        {
            var script:IScript = G_SCRIPT_INSTANCE[cmd];
            var isCache:Boolean = false;
            if (script == null) {
                script = this.newScript(cmd);
            } else {
                isCache = true;
            }
            if (script != null) {
                script.setTarget(target);
                script.exec(cmd, arg);
                if (isCache) {
                    script.setTarget(null);
                }
            }
        }

        public function buildScripts(type:int, target:IScriptsContainer, scriptList:Array=null):void
        {
            if (!scriptList && type >= 0) {
                scriptList = M_TARGET_TYPES[type];
            }
            if (scriptList != null) {
	            var script:IScript;
	            var index:int = 0;
                while (index < scriptList.length) {
                    script = this.newScript(scriptList[index]);
                    script.setTarget(target);
                    target.addScript(script);
                    index++;
                }
            }
        }

    }
}
