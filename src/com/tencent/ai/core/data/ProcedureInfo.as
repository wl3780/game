// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ProcedureInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_313;

    public class ProcedureInfo implements IXMLSerialize, ISerialize 
    {

        public var id:int;
        public var type:String;
        public var name:String;
        public var initialScripts:Array;
        public var events:Array;
        public var conditions:Array;
        public var scripts:Array;


        public function decode(_arg_1:XML):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_8:ScriptInfo;
            var _local_9:XMLList;
            var _local_10:TriggerEventInfo;
            var _local_11:ConditionInfo;
            this.id = int(_arg_1.@id);
            this.type = String(_arg_1.@type);
            this.name = String(_arg_1.@name);
            this.initialScripts = new Array();
            var _local_4:XMLList = _arg_1.InitialScriptInfos[0].Script;
            if (_local_4){
                _local_3 = _local_4.length();
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    _local_8 = new ScriptInfo();
                    _local_8.decode(_local_4[_local_2]);
                    this.initialScripts.push(_local_8);
                    _local_2++;
                };
            };
            this.events = [];
            var _local_5:XML = _arg_1.EventInfos[0];
            if (_local_5 != null){
                _local_9 = _local_5.EventInfo;
                _local_3 = _local_9.length();
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    _local_10 = new TriggerEventInfo();
                    _local_10.decode(_local_9[_local_2]);
                    this.events.push(_local_10);
                    _local_2++;
                };
            };
            this.conditions = new Array();
            var _local_6:XMLList = _arg_1.ConditionInfos[0].ConditionInfo;
            if (_local_6){
                _local_3 = _local_6.length();
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    _local_11 = new ConditionInfo();
                    _local_11.decode(_local_6[_local_2]);
                    this.conditions.push(_local_11);
                    _local_2++;
                };
            };
            this.scripts = new Array();
            var _local_7:XMLList = _arg_1.ScriptInfos[0].Script;
            if (_local_7){
                _local_3 = _local_7.length();
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    _local_8 = new ScriptInfo();
                    _local_8.decode(_local_7[_local_2]);
                    this.scripts.push(_local_8);
                    _local_2++;
                };
            };
        }

        public function encode()
        {
            var _local_3:ScriptInfo;
            var _local_4:XML;
            var _local_5:TriggerEventInfo;
            var _local_6:XML;
            var _local_7:ConditionInfo;
            var _local_8:XML;
            var _local_1:XML = <ProcedureInfo/>
            ;
            _local_1.@id = this.id.toString();
            _local_1.@type = this.type.toString();
            _local_1.@name = this.name;
            var _local_2:XML = <InitialScriptInfos/>
            ;
            for each (_local_3 in this.initialScripts) {
                _local_2.appendChild(XML(_local_3.encode()));
            };
            _local_1.appendChild(_local_2);
            _local_4 = <EventInfos/>
            ;
            var _local_9:int;
            var _local_10:* = this.events;
            for each (_local_5 in this.events) {
                _local_4.appendChild(_local_5.encode());
            };
            _local_1.appendChild(_local_4);
            _local_6 = <ConditionInfos/>
            ;
            for each (_local_7 in this.conditions) {
                _local_6.appendChild(_local_7.encode());
            };
            _local_1.appendChild(_local_6);
            _local_8 = <ScriptInfos/>
            ;
            for each (_local_3 in this.scripts) {
                _local_8.appendChild(XML(_local_3.encode()));
            };
            _local_1.appendChild(_local_8);
            return (_local_1);
        }

        public function clone():ProcedureInfo
        {
            var _local_2:ScriptInfo;
            var _local_3:TriggerEventInfo;
            var _local_4:ConditionInfo;
            var _local_1:ProcedureInfo = new ProcedureInfo();
            _local_1.id = this.id;
            _local_1.type = this.type;
            _local_1.name = this.name;
            _local_1.initialScripts = new Array();
            for each (_local_2 in this.initialScripts) {
                _local_1.initialScripts.push(_local_2.clone());
            };
            _local_1.events = new Array();
            for each (_local_3 in this.events) {
                _local_1.events.push(_local_3.clone());
            };
            _local_1.conditions = new Array();
            for each (_local_4 in this.conditions) {
                _local_1.conditions.push(_local_4.clone());
            };
            _local_1.scripts = new Array();
            for each (_local_2 in this.scripts) {
                _local_1.initialScripts.push(_local_2.clone());
            };
            return (_local_1);
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:ScriptInfo;
            var _local_5:TriggerEventInfo;
            var _local_6:ConditionInfo;
            this.id = _arg_1.readInt();
            this.type = XString.ReadString(_arg_1);
            this.name = XString.ReadString(_arg_1);
            this.initialScripts = new Array();
            _local_3 = _arg_1.readByte();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new ScriptInfo();
                _local_4.read(_arg_1);
                this.initialScripts.push(_local_4);
                _local_2++;
            };
            this.events = [];
            _local_3 = _arg_1.readByte();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = new TriggerEventInfo();
                _local_5.read(_arg_1);
                this.events.push(_local_5);
                _local_2++;
            };
            this.conditions = new Array();
            _local_3 = _arg_1.readByte();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_6 = new ConditionInfo();
                _local_6.read(_arg_1);
                this.conditions.push(_local_6);
                _local_2++;
            };
            this.scripts = new Array();
            _local_3 = _arg_1.readByte();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new ScriptInfo();
                _local_4.read(_arg_1);
                this.scripts.push(_local_4);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:ScriptInfo;
            var _local_5:TriggerEventInfo;
            var _local_6:ConditionInfo;
            _arg_1.writeInt(this.id);
            XString.WriteString(_arg_1, this.type);
            XString.WriteString(_arg_1, this.name);
            _local_3 = this.initialScripts.length;
            _arg_1.writeByte(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = this.initialScripts[_local_2];
                _local_4.write(_arg_1);
                _local_2++;
            };
            _local_3 = this.events.length;
            _arg_1.writeByte(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = this.events[_local_2];
                _local_5.write(_arg_1);
                _local_2++;
            };
            _local_3 = this.conditions.length;
            _arg_1.writeByte(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_6 = this.conditions[_local_2];
                _local_6.write(_arg_1);
                _local_2++;
            };
            _local_3 = this.scripts.length;
            _arg_1.writeByte(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = this.scripts[_local_2];
                _local_4.write(_arg_1);
                _local_2++;
            };
        }

        public /*  ©init. */ function _SafeStr_313()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_313 = " ProcedureInfo" (String#15038)


