// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.config.LayerTemplate

package com.tencent.ai.core.asset.config
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_57;

    public class LayerTemplate implements IXMLSerialize 
    {

        public var id:int;
        public var name:String;
        public var mainlayer:Boolean;
        public var motionsPackage:MotionsPackage;


        public function decode(_arg_1:XML):void
        {
            this.id = _arg_1.@id;
            this.name = _arg_1.@name;
            this.mainlayer = (String(_arg_1.@mainlayer) == "true");
            this.motionsPackage = new MotionsPackage();
            this.motionsPackage.decode(_arg_1.MotionsPackage[0]);
        }

        public function encode()
        {
            var _local_1:XML = <Layer/>
            ;
            _local_1.@id = this.id;
            _local_1.@name = this.name;
            if (this.mainlayer){
                _local_1.@mainlayer = "true";
            };
            _local_1.appendChild(this.motionsPackage.encode());
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_57()
        {
        }


    }
}//package com.tencent.ai.core.asset.config

// _SafeStr_57 = " LayerTemplate" (String#16601)


