// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.AssetLayerInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_210;

    public class AssetLayerInfo implements IXMLSerialize 
    {

        public var mainlayer:Boolean;
        public var assetID:int;
        public var layerID:int;


        public function decode(_arg_1:XML):void
        {
            this.mainlayer = (String(_arg_1.@mainlayer) == "true");
            this.assetID = int(_arg_1.@assetID);
            this.layerID = int(_arg_1.@layerID);
        }

        public function encode()
        {
            return (null);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.mainlayer = _arg_1.readBoolean();
            this.assetID = _arg_1.readUnsignedInt();
            this.layerID = _arg_1.readByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeBoolean(this.mainlayer);
            _arg_1.writeUnsignedInt(this.assetID);
            _arg_1.writeByte(this.layerID);
        }

        public /*  ©init. */ function _SafeStr_210()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_210 = " AssetLayerInfo" (String#16940)


