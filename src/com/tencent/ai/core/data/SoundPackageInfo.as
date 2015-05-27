// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SoundPackageInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_334;
    import __AS3__.vec.*;

    public class SoundPackageInfo implements IXMLSerialize, ISerialize 
    {

        public var id:int;
        public var type:int;
        public var loadType:int;
        public var maxPlayLimit:int;
        public var des:String;
        public var soundInfoList:Vector.<SoundInfo>;


        public function decode(xml:XML):void
        {
            var soundInfoXML:XML;
            var soundInfo:SoundInfo;
            this.id = int(xml.@id);
            this.type = int(xml.@type);
            this.loadType = int(xml.@loadType);
            this.maxPlayLimit = int(xml.@maxPlayLimit);
            this.des = String(xml.@des);
            this.soundInfoList = new Vector.<SoundInfo>();
            var len:int = xml.SoundInfo.length();
            var i:int;
            while (i < len) {
                soundInfoXML = xml.SoundInfo.(@id == i)[0];
                soundInfo = new SoundInfo();
                soundInfo.decode(soundInfoXML);
                this.soundInfoList.push(soundInfo);
                i = (i + 1);
            };
        }

        public function encode()
        {
            var _local_3:SoundInfo;
            var _local_1:XML = <SoundPackageInfo/>
            ;
            _local_1.@id = this.id;
            _local_1.@type = this.type;
            _local_1.@loadType = this.loadType;
            _local_1.@maxPlayLimit = this.maxPlayLimit;
            _local_1.@des = this.des;
            var _local_2:int;
            while (_local_2 < this.soundInfoList.length) {
                _local_3 = this.soundInfoList[_local_2];
                _local_3.id = _local_2;
                _local_1.SoundInfo = (_local_1.SoundInfo + _local_3.encode());
                _local_2++;
            };
            return (_local_1);
        }

        public function toString():String
        {
            return (((("(" + this.id) + ") ") + this.des));
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_4:SoundInfo;
            this.id = _arg_1.readInt();
            this.type = _arg_1.readInt();
            this.loadType = _arg_1.readInt();
            this.maxPlayLimit = _arg_1.readInt();
            this.des = XString.ReadString(_arg_1);
            var _local_2:uint = _arg_1.readUnsignedInt();
            this.soundInfoList = new Vector.<SoundInfo>();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new SoundInfo();
                _local_4.read(_arg_1);
                this.soundInfoList.push(_local_4);
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_4:SoundInfo;
            _arg_1.writeInt(this.id);
            _arg_1.writeInt(this.type);
            _arg_1.writeInt(this.loadType);
            _arg_1.writeInt(this.maxPlayLimit);
            XString.WriteString(_arg_1, this.des);
            var _local_2:uint = this.soundInfoList.length;
            _arg_1.writeUnsignedInt(_local_2);
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = this.soundInfoList[_local_3];
                _local_4.write(_arg_1);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_334()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_334 = " SoundPackageInfo" (String#15488)


