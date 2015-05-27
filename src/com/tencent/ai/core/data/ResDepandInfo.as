// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ResDepandInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_316;
    import __AS3__.vec.*;

    public class ResDepandInfo implements IXMLSerialize, ISerialize 
    {

        public var id:int;
        public var actionID:int;
        public var careerID:int;
        public var dpSoundIDVect:Vector.<int>;
        public var dpEffectIDVect:Vector.<int>;
        public var dpInteractIDVect:Vector.<int>;
        public var dpMonsterIDVect:Vector.<int>;

        public function ResDepandInfo()
        {
            this.dpSoundIDVect = new Vector.<int>();
            this.dpEffectIDVect = new Vector.<int>();
            this.dpInteractIDVect = new Vector.<int>();
            this.dpMonsterIDVect = new Vector.<int>();
            super();
        }

        public function decode(_arg_1:XML):void
        {
            var _local_2:String;
            this.id = _arg_1.@id;
            this.actionID = _arg_1.@actionID;
            this.careerID = _arg_1.@careerID;
            if (_arg_1.hasOwnProperty("@dpSoundID")){
                _local_2 = _arg_1.@dpSoundID;
                this.dpSoundIDVect = Vector.<int>(_local_2.split(","));
            };
            if (_arg_1.hasOwnProperty("@dpEffectID")){
                _local_2 = _arg_1.@dpEffectID;
                this.dpEffectIDVect = Vector.<int>(_local_2.split(","));
            };
            if (_arg_1.hasOwnProperty("@dpInteractID")){
                _local_2 = _arg_1.@dpInteractID;
                this.dpInteractIDVect = Vector.<int>(_local_2.split(","));
            };
            if (_arg_1.hasOwnProperty("@dpMonsterID")){
                _local_2 = _arg_1.@dpMonsterID;
                this.dpMonsterIDVect = Vector.<int>(_local_2.split(","));
            };
        }

        public function encode()
        {
            return ("");
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            this.id = _arg_1.readUnsignedInt();
            this.actionID = _arg_1.readUnsignedInt();
            this.careerID = _arg_1.readUnsignedShort();
            _local_2 = _arg_1.readShort();
            this.dpSoundIDVect = new Vector.<int>();
            _local_3 = 0;
            while (_local_3 < _local_2) {
                this.dpSoundIDVect.push(_arg_1.readUnsignedInt());
                _local_3++;
            };
            _local_2 = _arg_1.readShort();
            this.dpEffectIDVect = new Vector.<int>();
            _local_3 = 0;
            while (_local_3 < _local_2) {
                this.dpEffectIDVect.push(_arg_1.readUnsignedInt());
                _local_3++;
            };
            _local_2 = _arg_1.readShort();
            this.dpInteractIDVect = new Vector.<int>();
            _local_3 = 0;
            while (_local_3 < _local_2) {
                this.dpInteractIDVect.push(_arg_1.readUnsignedInt());
                _local_3++;
            };
            _local_2 = _arg_1.readShort();
            this.dpMonsterIDVect = new Vector.<int>();
            _local_3 = 0;
            while (_local_3 < _local_2) {
                this.dpMonsterIDVect.push(_arg_1.readUnsignedInt());
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int;
            var _local_3:int;
            _arg_1.writeUnsignedInt(this.id);
            _arg_1.writeUnsignedInt(this.actionID);
            _arg_1.writeShort(this.careerID);
            _local_2 = this.dpSoundIDVect.length;
            _arg_1.writeShort(_local_2);
            _local_3 = 0;
            while (_local_3 < _local_2) {
                _arg_1.writeUnsignedInt(this.dpSoundIDVect[_local_3]);
                _local_3++;
            };
            _local_2 = this.dpEffectIDVect.length;
            _arg_1.writeShort(_local_2);
            _local_3 = 0;
            while (_local_3 < _local_2) {
                _arg_1.writeUnsignedInt(this.dpEffectIDVect[_local_3]);
                _local_3++;
            };
            _local_2 = this.dpInteractIDVect.length;
            _arg_1.writeShort(_local_2);
            _local_3 = 0;
            while (_local_3 < _local_2) {
                _arg_1.writeUnsignedInt(this.dpInteractIDVect[_local_3]);
                _local_3++;
            };
            _local_2 = this.dpMonsterIDVect.length;
            _arg_1.writeShort(_local_2);
            _local_3 = 0;
            while (_local_3 < _local_2) {
                _arg_1.writeUnsignedInt(this.dpMonsterIDVect[_local_3]);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_316()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_316 = " ResDepandInfo" (String#16934)


