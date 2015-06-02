package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;

    public class SceneLayerInfo implements IXMLSerialize 
    {

        public var id:int;
        public var type:String;
        public var itemList:Vector.<SceneItemInfo>;

        public function decode(xml:XML):void
        {
            this.id = int(xml.@id);
            this.type = String(xml.@type);
            this.itemList = new Vector.<SceneItemInfo>();
            
			var items:XMLList = xml.Item;
            var len:int = items.length();
            var idx:int;
            while (idx < len) {
            	var sub:XML = items[idx];
            	var item:SceneItemInfo = new SceneItemInfo();
                item.decode(sub);
                this.itemList.push(item);
                idx++;
            };
            this.itemList.fixed = true;
        }

        public function encode()
        {
            var xml:XML = <SceneLayer/>;
            xml.@id = this.id;
            xml.@type = this.type;
			
            for each (var item:SceneItemInfo in this.itemList) {
                xml.Item = xml.Item + item.encode();
            }
            return xml;
        }

    }
}
