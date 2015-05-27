// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SceneLayerInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_320;
    import __AS3__.vec.*;

    public class SceneLayerInfo implements IXMLSerialize 
    {

        public var id:int;
        public var type:String;
        public var itemList:Vector.<SceneItemInfo>;


        public function decode(_arg_1:XML):void
        {
            var _local_5:XML;
            var _local_6:SceneItemInfo;
            this.id = int(_arg_1.@id);
            this.type = String(_arg_1.@type);
            this.itemList = new Vector.<SceneItemInfo>();
            var _local_2:XMLList = _arg_1.Item;
            var _local_3:int = _local_2.length();
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = _local_2[_local_4];
                _local_6 = new SceneItemInfo();
                _local_6.decode(_local_5);
                this.itemList.push(_local_6);
                _local_4++;
            };
            this.itemList.fixed = true;
        }

        public function encode()
        {
            var _local_2:SceneItemInfo;
            var _local_1:XML = <SceneLayer/>
            ;
            _local_1.@id = this.id;
            _local_1.@type = this.type;
            var _local_3:int;
            var _local_4:* = this.itemList;
            for each (_local_2 in this.itemList) {
                _local_1.Item = (_local_1.Item + _local_2.encode());
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_320()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_320 = " SceneLayerInfo" (String#15608)


