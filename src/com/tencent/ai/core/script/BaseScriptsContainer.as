// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.BaseScriptsContainer

package com.tencent.ai.core.script
{
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.global_script;
    import  ©init._SafeStr_1252;
    import __AS3__.vec.*;

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

        public function addScript(_arg_1:IScript):void
        {
            var _local_3:Array;
            var _local_4:int;
            var _local_2:Object = _arg_1.getCmds();
            if ((_local_2 is String)){
                this.m_scripts[_local_2] = _arg_1;
            } else {
                if ((_local_2 is Array)){
                    _local_3 = (_local_2 as Array);
                    _local_4 = 0;
                    while (_local_4 < _local_3.length) {
                        this.m_scripts[_local_3[_local_4]] = _arg_1;
                        _local_4++;
                    };
                };
            };
        }

        public function addLastRS(_arg_1:IScript):void
        {
            if (this.m_flag){
                if (this.m_lastRSs.indexOf(_arg_1) == -1){
                    this.m_lastRSs.push(_arg_1);
                };
            } else {
                _arg_1.stop();
            };
        }

        public function removeLastRs(_arg_1:IScript):void
        {
            var _local_2:int = this.m_lastRSs.indexOf(_arg_1);
            if (_local_2 != -1){
                this.m_lastRSs.splice(_local_2, 1);
            };
        }

        public function hasScript(_arg_1:String):Boolean
        {
            return (!((this.m_scripts[_arg_1] == null)));
        }

        public function onScript(_arg_1:String, _arg_2:Object=null):void
        {
            var _local_3:IScript = this.m_scripts[_arg_1];
            if (_local_3 != null){
                _local_3.exec(_arg_1, _arg_2);
            } else {
                global_script(_arg_1, _arg_2, this);
            };
        }

        public function clearLastScripts():void
        {
            var _local_1:int = this.m_lastRSs.length;
            var _local_2:int;
            while (_local_2 < _local_1) {
                this.m_lastRSs[_local_2].stop();
                _local_2++;
            };
            this.m_lastRSs.length = 0;
        }

        public /*  ©init. */ function _SafeStr_1252()
        {
        }


    }
}//package com.tencent.ai.core.script

// _SafeStr_1252 = " BaseScriptsContainer" (String#13721)


