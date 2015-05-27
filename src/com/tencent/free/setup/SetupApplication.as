// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.setup.SetupApplication

package com.tencent.free.setup
{
    import flash.events.EventDispatcher;
    import com.tencent.free.setup.data.SetupInfo;
    import flash.display.Sprite;
    import com.tencent.free.phase.PhaseContainer;
    import com.tencent.free.setup.ui.SetupDefaultUI;
    import flash.net.URLVariables;
    import flash.ui.ContextMenu;
    import com.tencent.free.logging.TraceAppender;
    import com.tencent.free.logging.LoggingDefine;
    import flash.external.ExternalInterface;
    import flash.display.Stage;
    import com.tencent.free.setup.events.SetupEvent;
    import flash.utils.Dictionary;
    import flash.ui.ContextMenuItem;
    import flash.events.ContextMenuEvent;
    import  ©init._SafeStr_66;

    public class SetupApplication extends EventDispatcher 
    {

        protected var m_setupInfo:SetupInfo;
        protected var m_root:Sprite;
        protected var m_globalLoader:LoaderGlobal;
        protected var m_confsLoader:LoaderConfs;
        protected var m_libsLoader:LoaderLibs;
        protected var m_phasesContainer:PhaseContainer;
        protected var m_flash_vars:Object;
        protected var m_default_ui:SetupDefaultUI;
        protected var m_isGlobalLoaded:Boolean;
        protected var m_defaultUIAutoHide:Boolean;

        public function SetupApplication(_arg_1:SetupInfo)
        {
            this.initThis(_arg_1);
        }

        protected function checkOpenDebug():void
        {
            var paramstr:String;
            var urlVars:URLVariables;
            var contextMenu:ContextMenu;
            var traceAppender:TraceAppender;
            var buffsize:int;
            var url:String;
            url = LoggingDefine.getDebuggerSO();
            if ((((url == null)) && (ExternalInterface.available))){
                url = ExternalInterface.call("window.top.location.toString");
            };
            if (((!((url == null))) && (!((url.indexOf("?") == -1))))){
                paramstr = url.split("?")[1];
                urlVars = null;
                urlVars = new URLVariables(paramstr);
                if (((!((urlVars == null))) && (urlVars.hasOwnProperty("debugger")))){
                    this.m_flash_vars["debug_setting"] = paramstr;
                    contextMenu = new ContextMenu();
                    contextMenu.hideBuiltInItems();
                    this.m_root.contextMenu = contextMenu;
                    this.addCustomItem("日志另存", TraceAppender.msgBufferSaveAs);
                    this.addCustomItem("本地打印[开/关]", TraceAppender.msgBufferPrint);
                    LoggingDefine.value = LoggingDefine.LEVEL_DEBUG;
                    traceAppender = (LoggingDefine.appender as TraceAppender);
                    if (traceAppender != null){
                        buffsize = ((urlVars.hasOwnProperty("buffsize")) ? int(urlVars["buffsize"]) : 0);
                        traceAppender.openMsgCache(this.m_root, buffsize);
                    };
                };
            };

//!!! Invalid/corrupt action data, import aborted for this method body.
        }

        protected function initThis(_arg_1:SetupInfo):void
        {
            var _local_6:Stage;
            var _local_7:Array;
            var _local_8:int;
            var _local_9:ContextMenu;
            var _local_10:Object;
            var _local_11:Object;
            var _local_12:Object;
            var _local_13:String;
            var _local_14:String;
            this.m_setupInfo = _arg_1;
            this.m_root = this.m_setupInfo.root;
            this.m_isGlobalLoaded = false;
            this.m_defaultUIAutoHide = true;
            if (this.m_root != null){
                _local_6 = this.m_root.stage;
                _local_6.scaleMode = this.m_setupInfo.stageScaleMode;
                _local_6.align = this.m_setupInfo.stageAlign;
                this.m_flash_vars = _local_6.loaderInfo.parameters;
                this.checkOpenDebug();
                _local_7 = this.m_setupInfo.contextMenuItems;
                if (_local_7 != null){
                    if (this.m_root.contextMenu == null){
                        _local_9 = new ContextMenu();
                        _local_9.hideBuiltInItems();
                        this.m_root.contextMenu = _local_9;
                    };
                    _local_8 = 0;
                    while (_local_8 < _local_7.length) {
                        _local_10 = _local_7[_local_8];
                        this.addCustomItem(_local_10.label, _local_10.handler);
                        _local_8++;
                    };
                };
            };
            if (this.m_setupInfo.defFlashVars){
                if (this.m_flash_vars == null){
                    this.m_flash_vars = {};
                };
                for each (_local_11 in this.m_setupInfo.defFlashVars) {
                    this.m_flash_vars[_local_11.key] = _local_11.value;
                };
            };
            var _local_2:Array = this.m_setupInfo.globalDefs;
            if (_local_2 != null){
                _local_8 = 0;
                while (_local_8 < _local_2.length) {
                    _local_12 = _local_2[_local_8];
                    _local_13 = _local_12.key;
                    _local_14 = _local_12.value;
                    if ((((_local_12.valueType == GLOBAL_DEF.VALUE_TYPE_FLASHVARS)) && (!((this.getFlashVars(_local_13) == null))))){
                        _local_14 = String(this.getFlashVars(_local_13));
                    };
                    GLOBAL_DEF.DEFINE(_local_13, _local_14);
                    _local_8++;
                };
            };
            var _local_3:Class = (((this.m_setupInfo.classGlobalLoader == null)) ? LoaderGlobal : this.m_setupInfo.classGlobalLoader);
            var _local_4:Class = (((this.m_setupInfo.classConfLoader == null)) ? LoaderConfs : this.m_setupInfo.classConfLoader);
            var _local_5:Class = (((this.m_setupInfo.classLibLoader == null)) ? LoaderLibs : this.m_setupInfo.classLibLoader);
            if ((((this.m_setupInfo.configValueType == GLOBAL_DEF.VALUE_TYPE_FLASHVARS)) && (this.getFlashVars(GLOBAL_DEF.FLASH_VARS_GLOBAL_URL)))){
                this.m_setupInfo.configURL = String(this.getFlashVars(GLOBAL_DEF.FLASH_VARS_GLOBAL_URL));
            };
            this.m_phasesContainer = new PhaseContainer();
            this.m_phasesContainer.errorHandler = this.error;
            this.m_phasesContainer.progressHander = this.progress;
            this.m_phasesContainer.nextHandler = this.next;
            this.m_phasesContainer.completeHandler = this.complete;
            this.m_phasesContainer.addPhase((this.m_globalLoader = new (_local_3)(this.m_setupInfo.configURL, true)));
            this.m_phasesContainer.addPhase((this.m_confsLoader = new (_local_4)(this.m_globalLoader)));
            this.m_phasesContainer.addPhase((this.m_libsLoader = new (_local_5)(this.m_globalLoader)));
        }

        protected function error(_arg_1:String):void
        {
            var _local_2:SetupEvent = new SetupEvent(SetupEvent.ERROR);
            _local_2.message = _arg_1;
            dispatchEvent(_local_2);
        }

        protected function progress(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String=""):void
        {
            var _local_5:SetupEvent = new SetupEvent(SetupEvent.PROGRESS);
            _local_5.fileTotal = _arg_3;
            _local_5.fileLoaded = _arg_2;
            _local_5.currentPercent = _arg_1;
            _local_5.message = _arg_4;
            dispatchEvent(_local_5);
        }

        protected function next():void
        {
            if (((!(this.m_isGlobalLoaded)) && (this.m_globalLoader.isCompleted()))){
                this.m_isGlobalLoaded = true;
                this.addCustomItem((("GLOBAL_VER(" + this.m_globalLoader.getVersion()) + ")"));
            };
            var _local_1:SetupEvent = new SetupEvent(SetupEvent.INFO_CHANGE);
            _local_1.message = this.m_phasesContainer.getCurrent().getMessage();
            dispatchEvent(_local_1);
        }

        protected function complete():void
        {
            var _local_1:SetupEvent = new SetupEvent(SetupEvent.SUCCESS);
            var _local_2:Dictionary = this.m_globalLoader.collection();
            _local_2[GLOBAL_DEF.CONFIG_FLASH_VARS] = this.m_flash_vars;
            _local_1.data = _local_2;
            dispatchEvent(_local_1);
        }

        protected function onThisEvent(_arg_1:SetupEvent):void
        {
            var _local_2:String = _arg_1.type;
            switch (_local_2){
                case SetupEvent.ERROR:
                    this.m_default_ui.setError(_arg_1.message);
                    return;
                case SetupEvent.INFO_CHANGE:
                    this.m_default_ui.setMessage(_arg_1.message);
                    return;
                case SetupEvent.PROGRESS:
                    this.m_default_ui.setProgress((_arg_1.fileLoaded / _arg_1.fileTotal));
                    return;
                case SetupEvent.SUCCESS:
                    removeEventListener(SetupEvent.INFO_CHANGE, this.onThisEvent);
                    removeEventListener(SetupEvent.PROGRESS, this.onThisEvent);
                    removeEventListener(SetupEvent.ERROR, this.onThisEvent);
                    removeEventListener(SetupEvent.SUCCESS, this.onThisEvent);
                    if (this.m_defaultUIAutoHide){
                        this.m_default_ui.hide();
                    };
                    return;
            };
        }

        public function addCustomItem(_arg_1:String, _arg_2:Function=null, _arg_3:int=-1):void
        {
            var _local_4:ContextMenuItem;
            if (this.m_root != null){
                _local_4 = new ContextMenuItem(_arg_1);
                if (_arg_2 != null){
                    _local_4.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, _arg_2);
                };
                if (_arg_3 == -1){
                    _arg_3 = this.m_root.contextMenu.customItems.length;
                };
                this.m_root.contextMenu.customItems.splice(_arg_3, 0, _local_4);
            };
        }

        public function getGlobalVersion():String
        {
            return (this.m_globalLoader.getVersion());
        }

        public function getGlobalAppClass():String
        {
            return (this.m_globalLoader.getAppClass());
        }

        public function setGlobalURL(_arg_1:String):void
        {
            this.m_globalLoader.setURL(_arg_1);
        }

        public function getGlobalURL():String
        {
            return (this.m_globalLoader.getURL());
        }

        public function getFlashVars(_arg_1:String):Object
        {
            if (this.m_flash_vars == null){
                return (null);
            };
            return (this.m_flash_vars[_arg_1]);
        }

        public function setupDefaultUI(_arg_1:Boolean=true):void
        {
            this.m_defaultUIAutoHide = _arg_1;
            addEventListener(SetupEvent.INFO_CHANGE, this.onThisEvent);
            addEventListener(SetupEvent.PROGRESS, this.onThisEvent);
            addEventListener(SetupEvent.ERROR, this.onThisEvent);
            addEventListener(SetupEvent.SUCCESS, this.onThisEvent);
            this.m_default_ui = new SetupDefaultUI(this.m_root, this.m_setupInfo.stageWidth, this.m_setupInfo.stageHeight);
            this.m_default_ui.show();
        }

        public function getDefaultUI():SetupDefaultUI
        {
            return (this.m_default_ui);
        }

        public function run():void
        {
            this.m_phasesContainer.start();
        }

        public /*  ©init. */ function _SafeStr_66()
        {
        }


    }
}//package com.tencent.free.setup

// _SafeStr_66 = " SetupApplication" (String#1379)


