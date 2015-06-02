package com.tencent.ai.core.data
{
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.utils.IXMLSerialize;

    public class SceneItemInfo implements IXMLSerialize 
    {

        public var id:int;
        public var deep:int;
        public var x:int;
        public var z:int;
        public var resPath:String;
        public var className:String;
        public var propertyArgList:Vector.<PropertyArg>;
        public var type:String;
        public var alpha:Number = 1;
        public var renderLevel:int = -1;
        public var width:int;
        public var height:int;

        public function decode(xml:XML):void
        {
            this.id = int(xml.@id);
            this.deep = int(xml.@deep);
            this.x = int(xml.@x);
            this.z = int(xml.@z);
            this.resPath = String(xml.@resPath);
            this.className = String(xml.@className);
            this.type = String(xml.@type);
            this.alpha = xml.hasOwnProperty("@alpha") ? Number(xml.@alpha) : 1;
            this.renderLevel = xml.hasOwnProperty("@renderLevel") ? Number(xml.@renderLevel) : -1;
            this.width = xml.hasOwnProperty("@w") ? Number(xml.@w) : 0;
            this.height = xml.hasOwnProperty("@h") ? Number(xml.@h) : 0;
            
            this.propertyArgList = new Vector.<PropertyArg>();
            for each (var prop:XML in xml.property) {
	            var arg:PropertyArg = PropertyArg.newArg(prop.@type);
                arg.decode(prop);
                this.propertyArgList.push(arg);
            }
        }

        public function encode()
        {
            var xml:XML = <Item/>;
            xml.@id = this.id;
            xml.@deep = this.deep;
            xml.@x = this.x;
            xml.@z = this.z;
            xml.@resPath = this.resPath;
            xml.@className = this.className;
            xml.@type = this.type;
            xml.@alpha = this.alpha;
            xml.@renderLevel = this.renderLevel;
            xml.@w = this.width;
            xml.@h = this.height;
			
            for each (var arg:PropertyArg in this.propertyArgList) {
                xml.property = xml.property + arg.encode();
            }
            return xml;
        }

        public function clone():SceneItemInfo
        {
            var itemInfo:SceneItemInfo = new SceneItemInfo();
            itemInfo.id = -1;
            itemInfo.deep = this.deep;
            itemInfo.x = this.x;
            itemInfo.z = this.z;
            itemInfo.resPath = this.resPath;
            itemInfo.className = this.className;
            itemInfo.type = this.type;
            itemInfo.alpha = this.alpha;
            itemInfo.renderLevel = this.renderLevel;
			
            itemInfo.propertyArgList = new Vector.<PropertyArg>();
            for each (var arg:PropertyArg in this.propertyArgList) {
                itemInfo.propertyArgList.push(arg.clone());
            }
            return itemInfo;
        }

        public function removeProperty(pType:String):void
        {
            var idx:int = this.propertyArgList.length;
            while (idx--) {
                if (this.propertyArgList[idx].type == pType) {
                    this.propertyArgList.splice(idx, 1);
                }
            }
        }

    }
}
