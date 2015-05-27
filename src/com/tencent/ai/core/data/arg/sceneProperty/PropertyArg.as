package com.tencent.ai.core.data.arg.sceneProperty
{
    import flash.utils.Dictionary;

    public class PropertyArg 
    {

        public static var ARG_CLS_MAP:Dictionary = new Dictionary();

        public var type:String;

        public static function newArg(propType:String):PropertyArg
        {
            var cls:Class = ARG_CLS_MAP[propType];
            if (cls == null) {
                cls = PropertyArg;
            }
            var arg:PropertyArg = new cls() as PropertyArg;
            arg.type = propType;
            return arg;
        }


        public function decode(xml:XML):void
        {
            this.type = String(xml.@type);
        }

        public function encode():XML
        {
            var xml:XML = <property/>;
            xml.@type = this.type;
            return xml;
        }

        public function clone():PropertyArg
        {
            return null;
        }

    }
}
