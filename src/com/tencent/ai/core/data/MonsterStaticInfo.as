// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.MonsterStaticInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import __AS3__.vec.Vector;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_278;
    import __AS3__.vec.*;

    public class MonsterStaticInfo implements IXMLSerialize 
    {

        public var monsterID:int;
        public var rank:int;
        public var type:int;
        public var assetID:int;
        public var assetLayerInfos:Vector.<AssetLayerInfo>;
        public var loadType:int;
        public var name:String;
        public var factory:String;
        public var materialType:int;
        public var deadEID:int;
        public var height:int;


        public function decode(_arg_1:XML):void
        {
            var _local_4:int;
            var _local_5:AssetLayerInfo;
            this.monsterID = int(_arg_1.@id);
            this.rank = int(_arg_1.@rank);
            this.assetID = int(_arg_1.@assetID);
            var _local_2:XMLList = _arg_1.AssetLayer;
            var _local_3:int = _local_2.length();
            if (_local_3 > 0){
                this.assetLayerInfos = new Vector.<AssetLayerInfo>();
                _local_4 = 0;
                while (_local_4 < _local_3) {
                    _local_5 = new AssetLayerInfo();
                    _local_5.decode(_local_2[_local_4]);
                    this.assetLayerInfos.push(_local_5);
                    _local_4++;
                };
            };
            this.loadType = int(_arg_1.@loadType);
            this.type = int(_arg_1.@type);
            this.name = String(_arg_1.@name);
            this.factory = String(_arg_1.@factory);
            this.materialType = int(_arg_1.@materialType);
            this.deadEID = int(_arg_1.@deadEID);
            this.height = int(_arg_1.@height);
            if (this.deadEID == 0){
                this.deadEID = 62000;
            };
        }

        public function encode()
        {
            return (null);
        }

        public function toString():String
        {
            return ((((((this.name + "(") + this.monsterID) + "-") + this.assetID) + ")"));
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_3:int;
            var _local_4:AssetLayerInfo;
            this.monsterID = _arg_1.readUnsignedInt();
            this.rank = _arg_1.readUnsignedByte();
            this.assetID = _arg_1.readUnsignedInt();
            var _local_2:int = _arg_1.readUnsignedByte();
            if (_local_2 > 0){
                this.assetLayerInfos = new Vector.<AssetLayerInfo>();
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_4 = new AssetLayerInfo();
                    _local_4.read(_arg_1);
                    this.assetLayerInfos.push(_local_4);
                    _local_3++;
                };
            };
            this.loadType = _arg_1.readUnsignedByte();
            this.type = _arg_1.readUnsignedByte();
            this.name = XString.ReadString(_arg_1);
            this.factory = XString.ReadString(_arg_1);
            this.materialType = _arg_1.readUnsignedByte();
            this.deadEID = _arg_1.readUnsignedInt();
            this.height = _arg_1.readUnsignedShort();
            this.deadEID = _arg_1.readUnsignedShort();
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_3:int;
            var _local_4:AssetLayerInfo;
            _arg_1.writeUnsignedInt(this.monsterID);
            _arg_1.writeByte(this.rank);
            _arg_1.writeUnsignedInt(this.assetID);
            var _local_2:int = ((this.assetLayerInfos) ? this.assetLayerInfos.length : 0);
            _arg_1.writeByte(_local_2);
            if (_local_2 > 0){
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_4 = this.assetLayerInfos[_local_3];
                    _local_4.write(_arg_1);
                    _local_3++;
                };
            };
            _arg_1.writeByte(this.loadType);
            _arg_1.writeByte(this.type);
            XString.WriteString(_arg_1, this.name);
            XString.WriteString(_arg_1, this.factory);
            _arg_1.writeByte(this.materialType);
            _arg_1.writeUnsignedInt(this.deadEID);
            _arg_1.writeShort(this.height);
            _arg_1.writeShort(this.deadEID);
        }

        public /*  ©init. */ function _SafeStr_278()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_278 = " MonsterStaticInfo" (String#17663)


