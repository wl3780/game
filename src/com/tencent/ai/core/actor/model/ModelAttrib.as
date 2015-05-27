// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.model.ModelAttrib

package com.tencent.ai.core.actor.model
{
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_37;
    import __AS3__.vec.*;

    public class ModelAttrib 
    {

        public var name:String;
        protected var m_attrib:Attribute;
        protected var m_sourceValue:Object;
        protected var m_opIndexs:Array;

        public function ModelAttrib(_arg_1:Attribute, _arg_2:String)
        {
            this.name = _arg_2;
            this.m_attrib = _arg_1;
            this.m_sourceValue = _arg_1.getValueByName(_arg_2);
            this.m_opIndexs = [];
        }

        public function update():void
        {
            var _local_3:Vector.<OpAttribItem>;
            this.m_attrib.setValueByName(this.name, this.m_sourceValue);
            var _local_1:int = this.m_opIndexs.length;
            var _local_2:int;
            while (_local_2 < _local_1) {
                _local_3 = this.m_opIndexs[_local_2];
                if (((!((_local_3 == null))) && ((_local_3.length > 0)))){
                    _local_3[0].op(this.m_attrib, this.m_sourceValue);
                };
                _local_2++;
            };
        }

        public function addOpAttribItem(_arg_1:OpAttribItem):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:OpAttribItem;
            var _local_2:int = _arg_1.index;
            var _local_3:Vector.<OpAttribItem> = this.m_opIndexs[_local_2];
            if (_local_3 == null){
                _local_3 = new Vector.<OpAttribItem>();
                this.m_opIndexs[_local_2] = _local_3;
            };
            if (_local_3.indexOf(_arg_1) == -1){
                _local_4 = 0;
                _local_5 = _local_3.length;
                _local_6 = _arg_1.priority;
                _local_7 = 0;
                while (_local_4 < _local_5) {
                    _local_8 = _local_3[_local_4];
                    if (_local_6 > _local_8.priority){
                        _local_3.splice(_local_4, 0, _arg_1);
                        break;
                    };
                    _local_4++;
                };
                if (_local_4 == _local_5){
                    _local_3.push(_arg_1);
                };
                if (_local_4 == 0){
                    this.update();
                };
                return (true);
            };
            return (false);
        }

        public function removeOpAttribItem(_arg_1:OpAttribItem):Boolean
        {
            var _local_4:int;
            var _local_2:int = _arg_1.index;
            var _local_3:Vector.<OpAttribItem> = this.m_opIndexs[_local_2];
            if (_local_3 != null){
                _local_4 = _local_3.indexOf(_arg_1);
                if (_local_4 != -1){
                    _local_3.splice(_local_4, 1);
                    if (_local_4 == 0){
                        this.update();
                    };
                };
            };
            return (false);
        }

        public /*  ©init. */ function _SafeStr_37()
        {
        }


    }
}//package com.tencent.ai.core.actor.model

// _SafeStr_37 = " ModelAttrib" (String#15947)


