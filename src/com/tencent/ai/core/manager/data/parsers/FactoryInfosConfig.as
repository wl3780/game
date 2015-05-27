// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.FactoryInfosConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.FactoryInfo;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_612;
    import com.tencent.ai.core.data.*;
    import __AS3__.vec.*;

    public class FactoryInfosConfig extends BaseBinaryConfig implements IConfig 
    {

        public var factoryMaps:Dictionary;

        public function FactoryInfosConfig()
        {
            this.factoryMaps = new Dictionary();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:XML;
            var _local_7:FactoryInfo;
            var _local_8:String;
            var _local_9:Vector.<FactoryInfo>;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.FactoryInfo;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _local_3[_local_5];
                _local_7 = new FactoryInfo();
                _local_7.decode(_local_6);
                _local_8 = _local_7.elementType;
                _local_9 = this.factoryMaps[_local_8];
                if (_local_9 == null){
                    _local_9 = new Vector.<FactoryInfo>();
                    this.factoryMaps[_local_8] = _local_9;
                };
                _local_9.push(_local_7);
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this.factoryMaps[_arg_1]);
        }

        public function findAll():Object
        {
            return (null);
        }

        public /*  ©init. */ function _SafeStr_612()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_612 = " FactoryInfosConfig" (String#16910)


