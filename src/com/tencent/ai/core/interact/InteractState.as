// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.InteractState

package com.tencent.ai.core.interact
{
    import com.tencent.ai.core.data.MultiArgsInfo;
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.utils.RectangleXML;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_583;

    public class InteractState extends MultiArgsInfo implements IXMLSerialize, ISerialize 
    {

        public var state:int;
        public var actionID:int;
        public var name:String;
        public var triggerInfo:TriggerEventInfo;
        public var nextState:int = 0;
        public var reportToServer:Boolean = false;
        public var vx:int = 0;
        public var vy:int = 0;
        public var vz:int = 0;
        public var avx:int = 0;
        public var avy:int = 0;
        public var avz:int = 0;
        public var dmg_value:int = 0;
        public var powerX:int = 0;
        public var powerY:int = 0;
        public var stiff:int = 1000;
        public var blockRect:RectangleXML;


        public function encode()
        {
            var _local_2:int;
            var _local_1:XML = <State/>
            ;
            _local_1.@id = this.state;
            _local_1.@actionID = this.actionID;
            _local_1.@name = this.name;
            if (this.triggerInfo){
                _local_1.@trigger = this.triggerInfo.type;
                if (this.triggerInfo.args){
                    _local_2 = 0;
                    while (_local_2 < this.triggerInfo.args.length) {
                        if (((this.triggerInfo.args[_local_2]) && (!((this.triggerInfo.args[_local_2] == ""))))){
                            _local_1[("@triggerArg" + _local_2)] = this.triggerInfo.args[_local_2];
                        };
                        _local_2++;
                    };
                };
            };
            if (this.nextState != 0){
                _local_1.@nextState = this.nextState;
            };
            if (this.reportToServer){
                _local_1.@reportToServer = 1;
            };
            if (this.vx != 0){
                _local_1.@vx = this.vx;
            };
            if (this.vy != 0){
                _local_1.@vy = this.vy;
            };
            if (this.vz != 0){
                _local_1.@vz = this.vz;
            };
            if (this.avx != 0){
                _local_1.@avx = this.avx;
            };
            if (this.avy != 0){
                _local_1.@avy = this.avy;
            };
            if (this.avz != 0){
                _local_1.@avz = this.avz;
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
            super.encodeXML(_local_1);
            if (((this.blockRect) && ((this.blockRect.width > 0)))){
                _local_1.appendChild(this.blockRect.encode());
            };
            return (_local_1);
        }

        public function decode(_arg_1:XML):void
        {
            var _local_3:int;
            var _local_4:String;
            var _local_5:Object;
            this.state = _arg_1.@id;
            this.actionID = _arg_1.@actionID;
            this.name = _arg_1.@name;
            var _local_2:String = _arg_1.@trigger;
            if (((_local_2) && (!((_local_2 == ""))))){
                this.triggerInfo = new TriggerEventInfo();
                this.triggerInfo.type = _arg_1.@trigger;
                this.triggerInfo.args = [];
                _local_3 = 0;
                _local_4 = ("triggerArg" + _local_3.toString());
                while (_arg_1.hasOwnProperty(("@" + _local_4))) {
                    _local_5 = _arg_1[("@" + _local_4)];
                    this.triggerInfo.args.push(String(_local_5));
                    _local_4 = ("triggerArg" + ++_local_3.toString());
                };
            };
            this.nextState = int(_arg_1.@nextState);
            if (_arg_1.@reportToServer){
                this.reportToServer = (int(_arg_1.@reportToServer) == 1);
            };
            this.vx = int(_arg_1.@vx);
            this.vy = int(_arg_1.@vy);
            this.vz = int(_arg_1.@vz);
            this.avx = int(_arg_1.@avx);
            this.avy = int(_arg_1.@avy);
            this.avz = int(_arg_1.@avz);
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
            if (_arg_1.BlockRect[0]){
                this.blockRect = new RectangleXML("BlockRect");
                this.blockRect.decode(_arg_1.BlockRect[0]);
            };
            super.decodeXML(_arg_1);
        }

        public function clone():InteractState
        {
            var _local_1:InteractState = new InteractState();
            _local_1.state = this.state;
            _local_1.actionID = this.actionID;
            _local_1.name = this.name;
            _local_1.args = this.args.slice();
            _local_1.vx = this.vx;
            _local_1.vy = this.vy;
            _local_1.vz = this.vz;
            _local_1.dmg_value = this.dmg_value;
            _local_1.powerX = this.powerX;
            _local_1.powerY = this.powerY;
            if (this.blockRect){
                _local_1.blockRect = (this.blockRect.clone() as RectangleXML);
            };
            if (this.triggerInfo){
                _local_1.triggerInfo = this.triggerInfo.clone();
            };
            _local_1.nextState = this.nextState;
            _local_1.reportToServer = this.reportToServer;
            return (_local_1);
        }

        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.state = _arg_1.readShort();
            this.actionID = _arg_1.readInt();
            this.name = XString.ReadString(_arg_1);
            var _local_2:Boolean = _arg_1.readBoolean();
            if (_local_2){
                this.triggerInfo = new TriggerEventInfo();
                this.triggerInfo.read(_arg_1);
            };
            this.nextState = _arg_1.readShort();
            this.reportToServer = _arg_1.readBoolean();
            this.vx = _arg_1.readInt();
            this.vy = _arg_1.readInt();
            this.vz = _arg_1.readInt();
            this.avx = _arg_1.readInt();
            this.avy = _arg_1.readInt();
            this.avz = _arg_1.readInt();
            this.dmg_value = _arg_1.readInt();
            this.powerX = _arg_1.readInt();
            this.powerY = _arg_1.readInt();
            this.stiff = _arg_1.readInt();
            var _local_3:Boolean = _arg_1.readBoolean();
            if (_local_3){
                this.blockRect = new RectangleXML("BlockRect");
                this.blockRect.read(_arg_1);
            };
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            _arg_1.writeShort(this.state);
            _arg_1.writeInt(this.actionID);
            XString.WriteString(_arg_1, this.name);
            _arg_1.writeBoolean(!((this.triggerInfo == null)));
            if (this.triggerInfo){
                this.triggerInfo.write(_arg_1);
            };
            _arg_1.writeShort(this.nextState);
            _arg_1.writeBoolean(this.reportToServer);
            _arg_1.writeInt(this.vx);
            _arg_1.writeInt(this.vy);
            _arg_1.writeInt(this.vz);
            _arg_1.writeInt(this.avx);
            _arg_1.writeInt(this.avy);
            _arg_1.writeInt(this.avz);
            _arg_1.writeInt(this.dmg_value);
            _arg_1.writeInt(this.powerX);
            _arg_1.writeInt(this.powerY);
            _arg_1.writeInt(this.stiff);
            _arg_1.writeBoolean(!((this.blockRect == null)));
            if (this.blockRect){
                this.blockRect.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_583()
        {
        }


    }
}//package com.tencent.ai.core.interact

// _SafeStr_583 = " InteractState" (String#15944)


