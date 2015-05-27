// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.BaseAsset

package com.tencent.ai.core.asset
{
    import flash.events.EventDispatcher;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.events.AssetLoadEvent;
    import  ©init._SafeStr_70;

    public class BaseAsset extends EventDispatcher implements IAsset 
    {

        public var motionAssets:Dictionary;
        public var totalBytes:int;
        protected var m_isLoading:Boolean;
        protected var m_isLoaded:Boolean;
        protected var m_refs:Array;
        protected var m_loadArg:Object;
        protected var m_bSaveSO:Boolean = false;
        private var _baseKey:String;
        protected var _priority:int;

        public function BaseAsset()
        {
            this.reset();
        }

        public function get priority():int
        {
            return (this._priority);
        }

        public function set priority(_arg_1:int):void
        {
            this._priority = _arg_1;
        }

        protected function assetLoaded():void
        {
            var _local_1:AssetLoadEvent = new AssetLoadEvent(AssetLoadEvent.COMPLETE);
            _local_1.bytesTotal = this.totalBytes;
            _local_1.key = this._baseKey;
            dispatchEvent(_local_1);
        }

        protected function onProgress(_arg_1:String, _arg_2:int, _arg_3:int):void
        {
            var _local_4:AssetLoadEvent = new AssetLoadEvent(AssetLoadEvent.LOAD_PROCESS);
            _local_4.key = (this._baseKey = _arg_1);
            _local_4.bytesLoaded = _arg_2;
            _local_4.bytesTotal = (this.totalBytes = _arg_3);
            dispatchEvent(_local_4);
        }

        protected function onError(_arg_1:String, _arg_2:int):void
        {
            var _local_3:AssetLoadEvent = new AssetLoadEvent(AssetLoadEvent.ERROR);
            _local_3.key = _arg_1;
            _local_3.code = _arg_2;
            _local_3.message = (((_arg_1 + "加载失败(") + _arg_2) + ")");
            dispatchEvent(_local_3);
        }

        public function reset():void
        {
            this.m_isLoading = false;
            this.m_isLoaded = false;
            this.m_refs = new Array();
            this.m_bSaveSO = false;
        }

        public function addRef(_arg_1:Object):void
        {
            this.m_refs.push(_arg_1);
        }

        public function removeRef(_arg_1:Object):void
        {
            var _local_2:int = this.m_refs.indexOf(_arg_1);
            if (-1 != _local_2){
                this.m_refs.splice(_local_2, 1);
            };
        }

        public function getRefsLen():int
        {
            return (this.m_refs.length);
        }

        public function load(... _args):void
        {
        }

        public function unload():void
        {
            this.m_loadArg = null;
            this.m_isLoading = false;
            this.m_isLoaded = false;
            this.motionAssets = null;
        }

        public function stopLoad():void
        {
        }

        public function set loadArg(_arg_1:Object):void
        {
            this.m_loadArg = _arg_1;
        }

        public function get loadArg():Object
        {
            return (this.m_loadArg);
        }

        public function getIsLoaded():Boolean
        {
            return (((this.m_isLoaded) && ((this.m_isLoading == false))));
        }

        public function set saveSO(_arg_1:Boolean):void
        {
            this.m_bSaveSO = _arg_1;
        }

        public function get saveSO():Boolean
        {
            return (this.m_bSaveSO);
        }

        public /*  ©init. */ function _SafeStr_70()
        {
        }


    }
}//package com.tencent.ai.core.asset

// _SafeStr_70 = " BaseAsset" (String#13835)


