// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.ScriptDescriptionConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import com.tencent.ai.core.data.ScriptDescription;
    import  ©init._SafeStr_635;

    public class ScriptDescriptionConfig extends BaseBinaryConfig implements IConfig 
    {

        public var scriptDescriptions:Array;


        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:ScriptDescription;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.ScriptInfo;
            var _local_4:int = _local_3.length();
            this.scriptDescriptions = [];
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new ScriptDescription();
                _local_6.decode(_local_3[_local_5]);
                this.scriptDescriptions.push(_local_6);
                _local_5++;
            };
            return (true);
        }

        public function getScriptDescriptions(_arg_1:int):Array
        {
            var _local_4:ScriptDescription;
            if (_arg_1 == 0){
                return (this.scriptDescriptions);
            };
            var _local_2:Array = [];
            var _local_3:int;
            while (_local_3 < this.scriptDescriptions.length) {
                _local_4 = this.scriptDescriptions[_local_3];
                if ((_local_4.groupID & _arg_1) != 0){
                    _local_2.push(_local_4);
                };
                _local_3++;
            };
            return (_local_2);
        }

        public function find(_arg_1:*):Object
        {
            return (null);
        }

        public function findAll():Object
        {
            return (this.scriptDescriptions);
        }

        public /*  ©init. */ function _SafeStr_635()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_635 = " ScriptDescriptionConfig" (String#16112)


