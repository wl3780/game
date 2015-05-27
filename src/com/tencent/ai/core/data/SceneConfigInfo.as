// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SceneConfigInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_317;
    import __AS3__.vec.*;

    public class SceneConfigInfo implements IXMLSerialize 
    {

        public var name:String;
        public var width:int;
        public var height:int;
        public var walkData:SceneWalkData;
        public var layerList:Vector.<SceneLayerInfo>;


        public function decode(_arg_1:XML):void
        {
            var _local_3:XML;
            var _local_4:SceneLayerInfo;
            this.name = String(_arg_1.@name);
            this.width = int(_arg_1.@w);
            this.height = int(_arg_1.@h);
            this.walkData = new SceneWalkData();
            this.walkData.setInitWalkData(this.width, this.height, String(_arg_1.@walkData));
            this.layerList = new Vector.<SceneLayerInfo>();
            var _local_2:XMLList = _arg_1.SceneLayer;
            for each (_local_3 in _local_2) {
                _local_4 = new SceneLayerInfo();
                _local_4.decode(_local_3);
                this.layerList.push(_local_4);
            };
            this.layerList.fixed = true;
        }

        public function encode()
        {
            var _local_2:SceneLayerInfo;
            var _local_1:XML = <Scene/>
            ;
            _local_1.@name = this.name;
            _local_1.@w = this.width;
            _local_1.@h = this.height;
            _local_1.@walkData = this.walkData.getInitWalkData();
            for each (_local_2 in this.layerList) {
                _local_1.SceneLayer = (_local_1.SceneLayer + _local_2.encode());
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_317()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_317 = " SceneConfigInfo" (String#16379)


