// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.WorldInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.SceneInfo;
    import  ©init._SafeStr_650;

    public class WorldInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _sceneInfos:Dictionary;

        public function WorldInfoConfig()
        {
            this._sceneInfos = new Dictionary();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:XML;
            var _local_7:SceneInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.Scene;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _local_3[_local_5];
                _local_7 = new SceneInfo();
                _local_7.decode(_local_6);
                this._sceneInfos[_local_7.sceneID] = _local_7;
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this._sceneInfos[_arg_1]);
        }

        public function findAll():Object
        {
            return (this._sceneInfos);
        }

        public /*  ©init. */ function _SafeStr_650()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_650 = " WorldInfoConfig" (String#16967)


