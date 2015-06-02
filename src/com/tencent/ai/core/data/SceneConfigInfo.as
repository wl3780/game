package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;

    public class SceneConfigInfo implements IXMLSerialize 
    {

        public var name:String;
        public var width:int;
        public var height:int;
        public var walkData:SceneWalkData;
        public var layerList:Vector.<SceneLayerInfo>;

        public function decode(xml:XML):void
        {
            this.name = String(xml.@name);
            this.width = int(xml.@w);
            this.height = int(xml.@h);
            this.walkData = new SceneWalkData();
            this.walkData.setInitWalkData(this.width, this.height, String(xml.@walkData));
            this.layerList = new Vector.<SceneLayerInfo>();
            
			var layers:XMLList = xml.SceneLayer;
            for each (var sub:XML in layers) {
	            var info:SceneLayerInfo = new SceneLayerInfo();
                info.decode(sub);
                this.layerList.push(info);
            }
            this.layerList.fixed = true;
        }

        public function encode()
        {
            var xml:XML = <Scene/>;
            xml.@name = this.name;
            xml.@w = this.width;
            xml.@h = this.height;
            xml.@walkData = this.walkData.getInitWalkData();
            for each (var info:SceneLayerInfo in this.layerList) {
                xml.SceneLayer = xml.SceneLayer + info.encode();
            }
            return xml;
        }

    }
}
