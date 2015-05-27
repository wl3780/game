// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.DupStaticInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_240;
    import __AS3__.vec.*;

    public class DupStaticInfo implements IXMLSerialize, ISerialize 
    {

        public var isHide:Boolean;
        public var isShelve:Boolean;
        public var isRaids:Boolean;
        public var id:int;
        public var name:String;
        public var level:int;
        public var type:int;
        public var p:int;
        public var description:String;
        public var diffs:Vector.<DupDiff>;
        public var loadingName:String;
        public var loadingThumbURL:String;
        public var showPet:int;


        public function decode(_arg_1:XML):void
        {
            var _local_5:DupDiff;
            this.id = int(_arg_1.@id);
            this.name = String(_arg_1.@name);
            this.level = int(_arg_1.@level);
            this.p = int(_arg_1.@p);
            this.loadingName = String(_arg_1.@loadingName);
            this.loadingThumbURL = String(_arg_1.@loadingThumbURL);
            this.type = int(_arg_1.@type);
            this.type = ((this.type) ? this.type : 1);
            this.isHide = (this.type == 2);
            this.isShelve = !((String(_arg_1.@shelve) == "0"));
            this.description = String(_arg_1.Des[0]);
            this.isRaids = Boolean(int(_arg_1.@raids));
            this.showPet = int(_arg_1.@showpet);
            this.diffs = new Vector.<DupDiff>();
            var _local_2:XMLList = _arg_1.Diff;
            var _local_3:int = _local_2.length();
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = new DupDiff();
                _local_5.decode(_local_2[_local_4]);
                this.diffs.push(_local_5);
                _local_4++;
            };
        }

        public function encode()
        {
            return (null);
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_4:DupDiff;
            this.id = _arg_1.readInt();
            this.name = XString.ReadString(_arg_1);
            this.level = _arg_1.readShort();
            this.p = _arg_1.readUnsignedByte();
            this.loadingName = XString.ReadString(_arg_1);
            this.loadingThumbURL = XString.ReadString(_arg_1);
            this.type = _arg_1.readByte();
            this.type = ((this.type) ? this.type : 1);
            this.isHide = (this.type == 2);
            this.isShelve = _arg_1.readBoolean();
            this.isRaids = _arg_1.readBoolean();
            this.showPet = _arg_1.readByte();
            this.description = XString.ReadString(_arg_1);
            this.diffs = new Vector.<DupDiff>();
            var _local_2:int = _arg_1.readUnsignedShort();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new DupDiff();
                _local_4.read(_arg_1);
                this.diffs.push(_local_4);
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.id);
            XString.WriteString(_arg_1, this.name);
            _arg_1.writeShort(this.level);
            _arg_1.writeByte(this.p);
            XString.WriteString(_arg_1, this.loadingName);
            XString.WriteString(_arg_1, this.loadingThumbURL);
            _arg_1.writeByte(this.type);
            _arg_1.writeBoolean(this.isShelve);
            _arg_1.writeBoolean(this.isRaids);
            _arg_1.writeByte(this.showPet);
            XString.WriteString(_arg_1, this.description);
            var _local_2:int = this.diffs.length;
            _arg_1.writeShort(_local_2);
            var _local_3:int;
            while (_local_3 < _local_2) {
                this.diffs[_local_3].write(_arg_1);
                _local_3++;
            };
        }

        public function clone():DupStaticInfo
        {
            var _local_1:DupStaticInfo = new DupStaticInfo();
            _local_1.isHide = this.isHide;
            _local_1.isShelve = this.isShelve;
            _local_1.isRaids = this.isRaids;
            _local_1.showPet = this.showPet;
            _local_1.id = this.id;
            _local_1.name = this.name;
            _local_1.level = this.level;
            _local_1.type = this.type;
            _local_1.p = this.p;
            _local_1.description = this.description;
            _local_1.diffs = this.diffs;
            _local_1.loadingName = this.loadingName;
            _local_1.loadingThumbURL = this.loadingThumbURL;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_240()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_240 = " DupStaticInfo" (String#15812)


