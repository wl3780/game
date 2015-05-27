// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.ai.GameAI

package com.tencent.ai.core.ai
{
    import com.tencent.ai.core.element.ILogicObject;
    import com.tencent.ai.core.components.BaseAIComponent;
    import com.tencent.ai.core.data.FrameData;
    import  ©init._SafeStr_49;

    public class GameAI implements ILogicObject 
    {

        private static var _Current:GameAI;

        private var _currentFIndex:int;
        private var _linkHead:AILinkHead;
        private var _nextPp:BaseAIComponent;
        private var _clinkHead:AILinkHead;
        private var _cnextPp:BaseAIComponent;
        private var _isRuning:Boolean;

        public function GameAI()
        {
            this.initThis();
        }

        public static function get Current():GameAI
        {
            if (_Current == null){
                _Current = new (GameAI)();
            };
            return (_Current);
        }


        private function initThis():void
        {
            this._currentFIndex = 0;
            this._linkHead = new AILinkHead();
            this._nextPp = null;
            this._clinkHead = new AILinkHead();
            this._cnextPp = null;
            this._isRuning = true;
        }

        public function addAICom(_arg_1:BaseAIComponent):void
        {
            var _local_2:BaseAIComponent;
            if (_arg_1.lPrev == null){
                _local_2 = this._linkHead.lNext;
                this._linkHead.lNext = _arg_1;
                _arg_1.lPrev = this._linkHead;
                _arg_1.lNext = _local_2;
                if (_local_2){
                    _local_2.lPrev = _arg_1;
                };
            };
        }

        public function removeAICom(_arg_1:BaseAIComponent):void
        {
            var _local_2:Object = _arg_1.lPrev;
            var _local_3:BaseAIComponent = _arg_1.lNext;
            if (_arg_1 == this._nextPp){
                this._nextPp = _local_3;
            };
            if (_local_2){
                _local_2.lNext = _local_3;
            };
            if (_local_3){
                _local_3.lPrev = _local_2;
            };
            _arg_1.lPrev = null;
            _arg_1.lNext = null;
        }

        public function removeAllComs():void
        {
            var _local_2:BaseAIComponent;
            var _local_1:BaseAIComponent = this._linkHead.lNext;
            while (_local_1 != null) {
                _local_2 = _local_1;
                _local_1 = _local_1.lNext;
                _local_2.lPrev = null;
                _local_2.lNext = null;
            };
            this._linkHead.lNext = null;
        }

        public function stopAI():void
        {
            this._isRuning = false;
        }

        public function runAI():void
        {
            this._isRuning = true;
        }

        public function get isRuning():Boolean
        {
            return (this._isRuning);
        }

        public function enterframe(_arg_1:int):void
        {
            var _local_2:BaseAIComponent;
            this._currentFIndex = _arg_1;
            if (this._isRuning){
                this._nextPp = this._linkHead.lNext;
                while (this._nextPp != null) {
                    _local_2 = this._nextPp;
                    this._nextPp = this._nextPp.lNext;
                    _local_2.enterframe(_arg_1);
                };
            };
            this._cnextPp = this._clinkHead.lNext;
            while (this._cnextPp != null) {
                _local_2 = this._cnextPp;
                this._cnextPp = this._cnextPp.lNext;
                _local_2.enterframe(_arg_1);
            };
        }

        public function setFrameData(_arg_1:FrameData):void
        {
        }

        public function getFrameData():FrameData
        {
            return (null);
        }

        public function freeze(_arg_1:int):void
        {
        }

        public function resetFreeze():void
        {
        }

        public function getCurrentFrameIndex():int
        {
            return (this._currentFIndex);
        }

        public /*  ©init. */ function _SafeStr_49()
        {
        }


    }
}//package com.tencent.ai.core.ai

import com.tencent.ai.core.components.BaseAIComponent;
import  ©init._SafeStr_50;

class AILinkHead 
{

    public var lPrev:Object;
    public var lNext:BaseAIComponent;

    public function AILinkHead()
    {
        super();
    }

    public /*  ©init. */ function _SafeStr_50()
    {
    }


}

// _SafeStr_49 = " GameAI" (String#14669)
// _SafeStr_50 = " AILinkHead" (String#14666)


