// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.security.EnvironmentSecurity

package com.tencent.free.security
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.system.Capabilities;
    import flash.display.Stage;
    import flash.text.TextFormat;
    import flash.system.System;
    import  ©init._SafeStr_51;

    public class EnvironmentSecurity 
    {

        private var _root:Sprite;
        private var _callback:Function;
        private var _isDebug:Boolean;
        private var _otherDomain:Object;
        private var _errorMsgTxt:TextField;
        public var throwError:Boolean;
        public var throwMsg:String;
        public var pauseFP:Boolean;

        public function EnvironmentSecurity(_arg_1:Sprite, _arg_2:Function)
        {
            this._root = _arg_1;
            this._callback = _arg_2;
            this._isDebug = Capabilities.isDebugger;
            this.throwError = false;
            this.throwMsg = (("##############请勿非法调试#############" + "\n##请下载最新release版的flashplayer进行游戏##") + "\n#####################################\n");
            this.pauseFP = true;
        }

        private function errorEnvironment():void
        {
            var _local_2:int;
            var _local_1:Stage = this._root.stage;
            if ((((_local_1 == null)) || (this.throwError))){
                throw (new Error(this.throwMsg));
            };
            while (this._root.numChildren > 0) {
                this._root.removeChildAt(0);
            };
            _local_2 = (_local_1.numChildren - 1);
            while (_local_2 >= 0) {
                if (_local_1.getChildAt(_local_2) != this._root){
                    _local_1.removeChildAt(_local_2);
                };
                _local_2--;
            };
            this._errorMsgTxt = new TextField();
            this._errorMsgTxt.autoSize = "left";
            this._errorMsgTxt.defaultTextFormat = new TextFormat("Arial", 12, 0x880000);
            this._errorMsgTxt.backgroundColor = 0xAAAAAA;
            this._errorMsgTxt.background = true;
            this._errorMsgTxt.htmlText = this.throwMsg;
            _local_1.addChild(this._errorMsgTxt);
            if (((this._isDebug) && (this.pauseFP))){
                System.pause();
            };
        }

        public function run():void
        {
            var _local_1:Boolean = true;
            if (this._root.stage == null){
                this.errorEnvironment();
                _local_1 = false;
            } else {
                if (this._isDebug){
                    if (this._root.name != "root1"){
                        this.errorEnvironment();
                        _local_1 = false;
                    };
                };
            };
            this._callback(_local_1);
        }

        public /*  ©init. */ function _SafeStr_51()
        {
        }


    }
}//package com.tencent.free.security

// _SafeStr_51 = " EnvironmentSecurity" (String#1523)


