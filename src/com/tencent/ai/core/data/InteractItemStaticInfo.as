// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.InteractItemStaticInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.DictionaryEx;
    import com.tencent.ai.core.interact.InteractState;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_262;

    public class InteractItemStaticInfo extends MultiArgsInfo implements IXMLSerialize, ISerialize 
    {

        public var id:int;
        public var type:int;
        public var assetID:int;
        public var groupID:int = 3;
        public var loadType:int = 0;
        public var name:String;
        public var showName:Boolean = false;
        public var text:String;
        public var blendMode:String = "";
        public var hp:int = 0;
        public var defaultState:int = 1;
        public var deepOffset:int;
        public var dmg_value:int = 0;
        public var powerX:int = 0;
        public var powerY:int = 0;
        public var stiff:int = 1000;
        public var states:DictionaryEx;
        public var followTaget:Boolean = false;
        public var excludeString:String = "";
        public var excludeItems:Array;


        public function decode(_arg_1:XML):void
        {
            var _local_3:XMLList;
            var _local_4:XML;
            var _local_5:InteractState;
            this.id = int(_arg_1.@id);
            this.assetID = int(_arg_1.@assetID);
            if (_arg_1.hasOwnProperty("@groupID")){
                this.groupID = int(_arg_1.@groupID);
            };
            this.loadType = int(_arg_1.@loadType);
            this.type = int(_arg_1.@type);
            this.name = String(_arg_1.@name);
            if (_arg_1.hasOwnProperty("@showName")){
                this.showName = (int(_arg_1.@showName) == 1);
            };
            this.text = String(_arg_1.@text);
            this.blendMode = String(_arg_1.@blendMode);
            this.hp = int(_arg_1.@hp);
            this.deepOffset = int(_arg_1.@deepOffset);
            if (_arg_1.hasOwnProperty("@dmg_value")){
                this.dmg_value = int(_arg_1.@dmg_value);
            };
            if (_arg_1.hasOwnProperty("@powerX")){
                this.powerX = int(_arg_1.@powerX);
            };
            if (_arg_1.hasOwnProperty("@powerY")){
                this.powerY = int(_arg_1.@powerY);
            };
            if (_arg_1.hasOwnProperty("@stiff")){
                this.stiff = int(_arg_1.@stiff);
            };
            super.decodeXML(_arg_1);
            if (_arg_1.hasOwnProperty("@defaultState")){
                this.defaultState = int(_arg_1.@defaultState);
            };
            if (_arg_1.hasOwnProperty("@followTaget")){
                this.followTaget = (int(_arg_1.@followTaget) == 1);
            };
            if (_arg_1.hasOwnProperty("@exclude")){
                this.excludeString = String(_arg_1.@exclude);
                if (this.excludeString != ""){
                    this.excludeItems = this.excludeString.split(",");
                };
            };
            this.states = new DictionaryEx();
            var _local_2:XML = _arg_1.Interact[0];
            if (_local_2){
                _local_3 = _local_2.State;
                if (_local_3){
                    for each (_local_4 in _local_3) {
                        _local_5 = new InteractState();
                        _local_5.decode(_local_4);
                        this.states[_local_5.state] = _local_5;
                    };
                };
            };
        }

        public function encode()
        {
            var _local_3:InteractState;
            var _local_4:XML;
            var _local_1:XML = <InteractItemStaticInfo/>
            ;
            _local_1.@id = this.id;
            _local_1.@assetID = this.assetID;
            if (this.groupID != 3){
                _local_1.@groupID = this.groupID;
            };
            _local_1.@type = this.type;
            _local_1.@name = this.name;
            if (this.showName){
                _local_1.@showName = 1;
            };
            if (this.text != ""){
                _local_1.@text = this.text;
            };
            if (this.deepOffset != 0){
                _local_1.@deepOffset = this.deepOffset;
            };
            if (this.hp != 0){
                _local_1.@hp = this.hp;
            };
            if (this.defaultState != 1){
                _local_1.@defaultState = this.defaultState;
            };
            if (this.blendMode != ""){
                _local_1.@blendMode = this.blendMode;
            };
            super.encodeXML(_local_1);
            var _local_2:XML = <Interact/>
            ;
            for each (_local_3 in this.states) {
                _local_4 = _local_3.encode();
                _local_2.appendChild(_local_4);
            };
            if (_local_2.children().length() > 0){
                _local_1.appendChild(_local_2);
            };
            if (this.loadType != 0){
                _local_1.@loadType = this.loadType;
            };
            if (this.dmg_value != 0){
                _local_1.@dmg_value = this.dmg_value;
            };
            if (this.powerX != 0){
                _local_1.@powerX = this.powerX;
            };
            if (this.powerY != 0){
                _local_1.@powerY = this.powerY;
            };
            if (this.stiff != 1000){
                _local_1.@stiff = this.stiff;
            };
            if (this.followTaget){
                _local_1.@followTaget = 1;
            };
            if (this.excludeString){
                _local_1.@exclude = this.excludeString;
            };
            return (_local_1);
        }

        public function clone():InteractItemStaticInfo
        {
            var _local_2:InteractState;
            var _local_3:InteractState;
            var _local_1:InteractItemStaticInfo = new InteractItemStaticInfo();
            _local_1.id = this.id;
            _local_1.type = this.type;
            _local_1.assetID = this.assetID;
            _local_1.groupID = this.groupID;
            _local_1.loadType = this.loadType;
            _local_1.name = this.name;
            _local_1.showName = this.showName;
            _local_1.text = this.text;
            _local_1.blendMode = this.blendMode;
            _local_1.hp = this.hp;
            _local_1.defaultState = this.defaultState;
            _local_1.deepOffset = this.deepOffset;
            _local_1.dmg_value = this.dmg_value;
            _local_1.powerX = this.powerX;
            _local_1.powerY = this.powerY;
            _local_1.stiff = this.stiff;
            _local_1.followTaget = this.followTaget;
            _local_1.excludeItems = this.excludeItems.slice();
            _local_1.excludeString = this.excludeString;
            _local_1.args = this.args.slice();
            if (this.states){
                _local_1.states = new DictionaryEx();
                for each (_local_2 in this.states) {
                    _local_3 = _local_2.clone();
                    _local_1.states[_local_3.state] = _local_3;
                };
            };
            return (_local_1);
        }

        override public function read(_arg_1:IDataInput):void
        {
            var _local_4:InteractState;
            super.read(_arg_1);
            this.id = _arg_1.readInt();
            this.assetID = _arg_1.readInt();
            this.groupID = _arg_1.readByte();
            this.loadType = _arg_1.readByte();
            this.type = _arg_1.readInt();
            this.name = XString.ReadString(_arg_1);
            this.showName = _arg_1.readBoolean();
            this.text = XString.ReadString(_arg_1);
            this.blendMode = XString.ReadString(_arg_1);
            this.hp = _arg_1.readInt();
            this.deepOffset = _arg_1.readInt();
            this.dmg_value = _arg_1.readInt();
            this.powerX = _arg_1.readInt();
            this.powerY = _arg_1.readInt();
            this.stiff = _arg_1.readInt();
            this.defaultState = _arg_1.readByte();
            this.followTaget = _arg_1.readBoolean();
            this.excludeString = XString.ReadString(_arg_1);
            if (this.excludeString != ""){
                this.excludeItems = this.excludeString.split(",");
            };
            this.states = new DictionaryEx();
            var _local_2:int = _arg_1.readByte();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new InteractState();
                _local_4.read(_arg_1);
                this.states[_local_4.state] = _local_4;
                _local_3++;
            };
        }

        override public function write(_arg_1:IDataOutput):void
        {
            var _local_3:InteractState;
            super.write(_arg_1);
            _arg_1.writeInt(this.id);
            _arg_1.writeInt(this.assetID);
            _arg_1.writeByte(this.groupID);
            _arg_1.writeByte(this.loadType);
            _arg_1.writeInt(this.type);
            XString.WriteString(_arg_1, this.name);
            _arg_1.writeBoolean(this.showName);
            XString.WriteString(_arg_1, this.text);
            XString.WriteString(_arg_1, this.blendMode);
            _arg_1.writeInt(this.hp);
            _arg_1.writeInt(this.deepOffset);
            _arg_1.writeInt(this.dmg_value);
            _arg_1.writeInt(this.powerX);
            _arg_1.writeInt(this.powerY);
            _arg_1.writeInt(this.stiff);
            _arg_1.writeByte(this.defaultState);
            _arg_1.writeBoolean(this.followTaget);
            XString.WriteString(_arg_1, this.excludeString);
            var _local_2:int = this.states.length;
            _arg_1.writeByte(_local_2);
            for each (_local_3 in this.states) {
                _local_3.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_262()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_262 = " InteractItemStaticInfo" (String#14765)


