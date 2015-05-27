// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.extension.impl.ExtensionRegistry

package com.tencent.free.core.extension.impl
{
    import com.tencent.free.core.extension.IExtensionRegistry;
    import __AS3__.vec.Vector;
    import com.tencent.free.core.extension.IExtensionPoint;
    import flash.utils.Dictionary;
    import com.tencent.free.core.extension.IExtension;
    import  ©init._SafeStr_10;
    import __AS3__.vec.*;

    public class ExtensionRegistry implements IExtensionRegistry 
    {

        protected var m_epList:Vector.<IExtensionPoint>;
        protected var m_epMap:Dictionary;
        protected var m_extensions:Dictionary;

        public function ExtensionRegistry()
        {
            this.m_epList = new Vector.<IExtensionPoint>();
            this.m_epMap = new Dictionary();
            this.m_extensions = new Dictionary();
        }

        protected function addEP(_arg_1:IExtensionPoint):void
        {
            var _local_4:int;
            var _local_5:IExtension;
            this.m_epList.push(_arg_1);
            this.m_epMap[_arg_1.getID()] = _arg_1;
            var _local_2:String = _arg_1.getID();
            var _local_3:Array = this.m_extensions[_local_2];
            if (_local_3 != null){
                _local_4 = 0;
                while (_local_4 < _local_3.length) {
                    _local_5 = _local_3[_local_4];
                    if (_local_5 != null){
                        _arg_1.addExtension(_local_5);
                    };
                    _local_4++;
                };
                this.m_extensions[_local_2] = null;
                delete this.m_extensions[_local_2];
            };
        }

        protected function removeEP(_arg_1:IExtensionPoint):void
        {
            var _local_2:int = this.m_epList.indexOf(_arg_1);
            var _local_3:String = _arg_1.getID();
            if (_local_2 != -1){
                this.m_epList.splice(_local_2, 1);
            };
            this.m_epMap[_local_3] = null;
            delete this.m_epMap[_local_3];
        }

        public function addExtensionPoint(_arg_1:IExtensionPoint):void
        {
            if (_arg_1 == null){
                return;
            };
            var _local_2:String = _arg_1.getID();
            if (this.m_epMap[_local_2] != null){
                throw (new Error((("已经有一个ID为" + _local_2) + "的扩展点存在!")));
            };
            this.addEP(_arg_1);
        }

        public function removeExtensionPoint(_arg_1:IExtensionPoint):void
        {
            if (_arg_1 == null){
                return;
            };
            this.removeEP(_arg_1);
        }

        public function getExtensionPoint(_arg_1:String):IExtensionPoint
        {
            return (this.m_epMap[_arg_1]);
        }

        public function addExtension(_arg_1:String, _arg_2:IExtension):void
        {
            var _local_4:Array;
            var _local_3:IExtensionPoint = this.m_epMap[_arg_1];
            if (_local_3 != null){
                _local_3.addExtension(_arg_2);
            } else {
                _local_4 = this.m_extensions[_arg_1];
                if (_local_4 == null){
                    _local_4 = [];
                    this.m_extensions[_arg_1] = _local_4;
                };
                if (_local_4.indexOf(_arg_2) != -1){
                    return;
                };
                _local_4.push(_arg_2);
            };
        }

        public function removeExtension(_arg_1:String, _arg_2:IExtension):void
        {
            var _local_4:Array;
            var _local_5:int;
            var _local_3:IExtensionPoint = this.m_epMap[_arg_1];
            if (_local_3 != null){
                _local_3.removeExtension(_arg_2);
            } else {
                _local_4 = this.m_extensions[_arg_1];
                if (_local_4 == null){
                    return;
                };
                _local_5 = _local_4.indexOf(_arg_2);
                if (_local_5 != -1){
                    _local_4.splice(_local_5, 1);
                };
            };
        }

        public function getExtensionPoints():Vector.<IExtensionPoint>
        {
            return (this.m_epList);
        }

        public /*  ©init. */ function _SafeStr_10()
        {
        }


    }
}//package com.tencent.free.core.extension.impl

// _SafeStr_10 = " ExtensionRegistry" (String#1370)


