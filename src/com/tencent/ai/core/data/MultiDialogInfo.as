// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.MultiDialogInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_285;

    public class MultiDialogInfo implements IXMLSerialize, ISerialize 
    {

        public var id:int;
        public var name:String;
        public var dialogs:Array;
        public var btnScripts:Array;
        public var closbtnScripts:Array;


        public function decode(_arg_1:XML):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_5:ScriptInfo;
            var _local_7:SimpleDialogInfo;
            var _local_8:XMLList;
            var _local_9:Array;
            var _local_10:String;
            var _local_11:XMLList;
            var _local_12:XMLList;
            var _local_13:int;
            this.id = int(_arg_1.@id);
            this.name = String(_arg_1.@name);
            this.dialogs = new Array();
            var _local_4:XMLList = _arg_1.Dialogs[0].Dialog;
            if (_local_4){
                _local_3 = _local_4.length();
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    _local_7 = new SimpleDialogInfo();
                    _local_7.decode(_local_4[_local_2]);
                    this.dialogs.push(_local_7);
                    _local_2++;
                };
            };
            var _local_6:XML = _arg_1.Scripts[0];
            if (_local_6){
                this.btnScripts = new Array();
                _local_2 = 0;
                while (_local_2 < 4) {
                    _local_9 = new Array();
                    _local_10 = (("Btn" + (_local_2 + 1).toString()) + "Scripts");
                    _local_11 = _local_6.child(_local_10);
                    if (((_local_11) && ((_local_11.length() > 0)))){
                        _local_12 = _local_11[0].Script;
                        if (_local_12){
                            _local_3 = _local_12.length();
                            _local_13 = 0;
                            while (_local_13 < _local_3) {
                                _local_5 = new ScriptInfo();
                                _local_5.decode(_local_12[_local_13]);
                                _local_9.push(_local_5);
                                _local_13++;
                            };
                        };
                    };
                    this.btnScripts.push(_local_9);
                    _local_2++;
                };
                _local_8 = _local_6.CloseBtnScripts[0].Script;
                if (_local_8){
                    this.closbtnScripts = new Array();
                    _local_3 = _local_8.length();
                    _local_2 = 0;
                    while (_local_2 < _local_3) {
                        _local_5 = new ScriptInfo();
                        _local_5.decode(_local_8[_local_2]);
                        this.closbtnScripts.push(_local_5);
                        _local_2++;
                    };
                };
            };
        }

        public function encode()
        {
            var _local_3:SimpleDialogInfo;
            var _local_4:XML;
            var _local_5:ScriptInfo;
            var _local_6:XML;
            var _local_7:XML;
            var _local_8:XML;
            var _local_9:XML;
            var _local_10:XML;
            var _local_1:XML = <MultiDialog/>
            ;
            _local_1.@id = this.id;
            _local_1.@name = this.name;
            var _local_2:XML = <Dialogs/>
            ;
            for each (_local_3 in this.dialogs) {
                _local_2.appendChild(_local_3.encode());
            };
            _local_1.appendChild(_local_2);
            _local_4 = <Scripts/>
            ;
            _local_6 = <Btn1Scripts/>
            ;
            for each (_local_5 in this.btnScripts[0]) {
                _local_6.appendChild(_local_5.encode());
            };
            _local_4.appendChild(_local_6);
            _local_7 = <Btn2Scripts/>
            ;
            var _local_11:int;
            var _local_12:* = this.btnScripts[1];
            for each (_local_5 in this.btnScripts[1]) {
                _local_7.appendChild(_local_5.encode());
            };
            _local_4.appendChild(_local_7);
            _local_8 = <Btn3Scripts/>
            ;
            for each (_local_5 in this.btnScripts[2]) {
                _local_8.appendChild(_local_5.encode());
            };
            _local_4.appendChild(_local_8);
            _local_9 = <Btn4Scripts/>
            ;
            for each (_local_5 in this.btnScripts[3]) {
                _local_9.appendChild(_local_5.encode());
            };
            _local_4.appendChild(_local_9);
            _local_10 = <CloseBtnScripts/>
            ;
            for each (_local_5 in this.closbtnScripts) {
                _local_10.appendChild(_local_5.encode());
            };
            _local_4.appendChild(_local_10);
            _local_1.appendChild(_local_4);
            return (_local_1);
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:ScriptInfo;
            var _local_5:SimpleDialogInfo;
            var _local_8:Array;
            this.id = _arg_1.readUnsignedInt();
            this.name = XString.ReadString(_arg_1);
            this.dialogs = new Array();
            this.btnScripts = new Array();
            this.closbtnScripts = new Array();
            _local_3 = _arg_1.readShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = new SimpleDialogInfo();
                _local_5.read(_arg_1);
                this.dialogs.push(_local_5);
                _local_2++;
            };
            var _local_6:int = _arg_1.readShort();
            var _local_7:int;
            while (_local_7 < _local_6) {
                _local_8 = new Array();
                _local_3 = _arg_1.readShort();
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    _local_4 = new ScriptInfo();
                    _local_4.read(_arg_1);
                    _local_8.push(_local_4);
                    _local_2++;
                };
                this.btnScripts.push(_local_8);
                _local_7++;
            };
            _local_3 = _arg_1.readShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new ScriptInfo();
                _local_4.read(_arg_1);
                this.closbtnScripts.push(_local_4);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:ScriptInfo;
            var _local_5:SimpleDialogInfo;
            var _local_8:Array;
            _arg_1.writeUnsignedInt(this.id);
            XString.WriteString(_arg_1, this.name);
            _local_3 = this.dialogs.length;
            _arg_1.writeShort(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = this.dialogs[_local_2];
                _local_5.write(_arg_1);
                _local_2++;
            };
            var _local_6:int = this.btnScripts.length;
            _arg_1.writeShort(_local_6);
            var _local_7:int;
            while (_local_7 < _local_6) {
                _local_8 = this.btnScripts[_local_7];
                _local_3 = _local_8.length;
                _arg_1.writeShort(_local_3);
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    _local_4 = _local_8[_local_2];
                    _local_4.write(_arg_1);
                    _local_2++;
                };
                _local_7++;
            };
            _local_3 = this.closbtnScripts.length;
            _arg_1.writeShort(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = this.closbtnScripts[_local_2];
                _local_4.write(_arg_1);
                _local_2++;
            };
        }

        public /*  ©init. */ function _SafeStr_285()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_285 = " MultiDialogInfo" (String#16043)


