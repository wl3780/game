// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.MapDataInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.MapDataInfo;
    import  ©init._SafeStr_617;

    public class MapDataInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var mapDataInfoDicts:Dictionary;

        public function MapDataInfoConfig()
        {
            this.mapDataInfoDicts = new Dictionary();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:MapDataInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.MapData;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new MapDataInfo();
                _local_6.decode(_local_3[_local_5]);
                this.mapDataInfoDicts[_local_6.id] = _local_6;
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            if (this.mapDataInfoDicts[_arg_1] != null){
                return (this.mapDataInfoDicts[_arg_1]);
            };
            return (null);
        }

        public function findAll():Object
        {
            return (null);
        }

        public /*  ©init. */ function _SafeStr_617()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_617 = " MapDataInfoConfig" (String#15707)


