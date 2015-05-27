// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.element.ElementLinkList

package com.tencent.ai.core.element
{
    import  ©init._SafeStr_395;

    public class ElementLinkList 
    {

        private var _linkHead:ELinkHead;
        private var _nextPp:BaseElement;

        public function ElementLinkList()
        {
            this._linkHead = new ELinkHead();
            this._nextPp = null;
        }

        public function addElement(_arg_1:BaseElement):void
        {
            var _local_2:BaseElement;
            if (_arg_1.sPrev == null){
                _local_2 = this._linkHead.sNext;
                this._linkHead.sNext = _arg_1;
                _arg_1.sPrev = this._linkHead;
                _arg_1.sNext = _local_2;
                if (_local_2){
                    _local_2.sPrev = _arg_1;
                };
            };
        }

        public function removeElement(_arg_1:BaseElement):void
        {
            var _local_2:Object = _arg_1.sPrev;
            var _local_3:BaseElement = _arg_1.sNext;
            if (_arg_1 == this._nextPp){
                this._nextPp = _local_3;
            };
            if (_local_2){
                _local_2.sNext = _local_3;
            };
            if (_local_3){
                _local_3.sPrev = _local_2;
            };
            _arg_1.sPrev = null;
            _arg_1.sNext = null;
        }

        public function removeAllElements(_arg_1:Function=null):void
        {
            var _local_3:BaseElement;
            var _local_2:BaseElement = this._linkHead.sNext;
            while (_local_2 != null) {
                _local_3 = _local_2;
                _local_2 = _local_2.sNext;
                _local_3.sPrev = null;
                _local_3.sNext = null;
                if (_arg_1 != null){
                    (_arg_1(_local_3));
                };
            };
            this._linkHead.sNext = null;
        }

        public function render(_arg_1:int):void
        {
            var _local_2:BaseElement;
            this._nextPp = this._linkHead.sNext;
            while (this._nextPp != null) {
                _local_2 = this._nextPp;
                this._nextPp = this._nextPp.sNext;
                _local_2.render(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_395()
        {
        }


    }
}//package com.tencent.ai.core.element

import com.tencent.ai.core.element.BaseElement;
import  ©init._SafeStr_396;

class ELinkHead 
{

    public var sPrev:Object = null;
    public var sNext:BaseElement = null;

    public function ELinkHead()
    {
        super();
    }

    public /*  ©init. */ function _SafeStr_396()
    {
    }


}

// _SafeStr_395 = " ElementLinkList" (String#15434)
// _SafeStr_396 = " ELinkHead" (String#15437)


