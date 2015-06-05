package com.tencent.ai.core.script
{
    import com.tencent.ai.core.global_script;
    
    import flash.utils.Dictionary;

    public class BaseScriptsContainer implements IScriptsContainer 
    {

        protected var m_scripts:Dictionary;
        protected var m_lastRSs:Vector.<IScript>;
        protected var m_flag:Boolean;

        public function BaseScriptsContainer()
        {
            this.m_scripts = new Dictionary();
            this.m_lastRSs = new Vector.<IScript>();
            this.m_flag = false;
        }

        public function addScript(script:IScript):void
        {
            var cmdObj:Object = script.getCmds();
            if (cmdObj is String) {
                this.m_scripts[cmdObj] = script;
            } else {
                if (cmdObj is Array) {
		            var cmdList:Array = cmdObj as Array;
		            var idx:int = 0;
                    while (idx < cmdList.length) {
                        this.m_scripts[cmdList[idx]] = script;
                        idx++;
                    }
                }
            }
        }

        public function addLastRS(script:IScript):void
        {
            if (this.m_flag) {
                if (this.m_lastRSs.indexOf(script) == -1) {
                    this.m_lastRSs.push(script);
                }
            } else {
                script.stop();
            }
        }

        public function removeLastRs(script:IScript):void
        {
            var idx:int = this.m_lastRSs.indexOf(script);
            if (idx != -1) {
                this.m_lastRSs.splice(idx, 1);
            }
        }

        public function hasScript(cmd:String):Boolean
        {
            return this.m_scripts[cmd] != null;
        }

        public function onScript(cmd:String, arg:Object=null):void
        {
            var script:IScript = this.m_scripts[cmd];
            if (script != null) {
                script.exec(cmd, arg);
            } else {
                global_script(cmd, arg, this);
            }
        }

        public function clearLastScripts():void
        {
            var len:int = this.m_lastRSs.length;
            var idx:int;
            while (idx < len) {
                this.m_lastRSs[idx].stop();
                idx++;
            }
            this.m_lastRSs.length = 0;
        }

    }
}
