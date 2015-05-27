// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.setup.AILoaderGlobal

package com.tencent.ai.setup
{
    import com.tencent.free.setup.LoaderGlobal;
    import __AS3__.vec.Vector;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.free.setup.GLOBAL_DEF;
    import  ©init._SafeStr_1384;
    import __AS3__.vec.*;

    public class AILoaderGlobal extends LoaderGlobal 
    {

        protected var m_addContexts:Vector.<Object>;
        protected var m_initClasses:Array;

        public function AILoaderGlobal(_arg_1:String, _arg_2:Boolean=false)
        {
            super(_arg_1, _arg_2);
        }

        override public function decodeXML(_arg_1:XML):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:XML;
            var _local_5:XMLList;
            super.decodeXML(_arg_1);
            var _local_6:XML = _arg_1.AIInitClasses[0];
            if (_local_6 != null){
                this.m_initClasses = [];
                _local_5 = _local_6.ImportClass;
                _local_3 = _local_5.length();
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    _local_4 = _local_5[_local_2];
                    this.m_initClasses.push({
                        "key":String(_local_4.@key),
                        "classPath":String(_local_4.@classPath)
                    });
                    _local_2++;
                };
            };
            _local_4 = _arg_1.AddContexts[0];
            if (_local_4 != null){
                this.m_addContexts = new Vector.<Object>();
                _local_5 = _local_4.Context;
                _local_3 = _local_5.length();
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    _local_4 = _local_5[_local_2];
                    this.m_addContexts.push({
                        "name":String(_local_4.@name),
                        "label":String(_local_4.@label),
                        "className":String(_local_4.@className)
                    });
                    _local_2++;
                };
            };
        }

        override public function collection(_arg_1:Boolean=true):Dictionary
        {
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Object;
            var _local_2:Dictionary = super.collection(_arg_1);
            _local_2[Constants.CONFIG_ADD_CONTEXTS] = this.m_addContexts;
            if (((!((this.m_initClasses == null))) && ((this.m_initClasses.length > 0)))){
                _local_3 = CLASS.current.newInstance("com.tencent.ai.core.data.AIInitClasses");
                _local_4 = 0;
                while (_local_4 < this.m_initClasses.length) {
                    _local_5 = this.m_initClasses[_local_4];
                    _local_3[_local_5.key] = _local_5.classPath;
                    _local_4++;
                };
                _local_2[GLOBAL_DEF.CONFIG_CLASSES] = _local_3;
            };
            if (_arg_1){
                this.m_addContexts = null;
                this.m_initClasses = null;
            };
            return (_local_2);
        }

        public /*  ©init. */ function _SafeStr_1384()
        {
        }


    }
}//package com.tencent.ai.setup

// _SafeStr_1384 = " AILoaderGlobal" (String#16868)


