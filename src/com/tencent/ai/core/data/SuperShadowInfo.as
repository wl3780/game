// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SuperShadowInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_342;

    public class SuperShadowInfo implements IXMLSerialize, ISerialize 
    {

        public var id:int;
        public var name:String;
        public var title:String;
        public var dialogs:Array;
        public var btn1:String;
        public var btn2:String;
        public var btnScripts:Array;
        public var closbtnScripts:Array;


        public function decode(_arg_1:XML):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_5:ScriptInfo;
            var _local_7:SuperShadowSingleData;
            var _local_8:Array;
            var _local_9:String;
            var _local_10:XMLList;
            var _local_11:XMLList;
            var _local_12:int;
            var _local_13:XMLList;
            this.id = int(_arg_1.@id);
            this.name = String(_arg_1.@name);
            this.title = String(_arg_1.@title);
            this.dialogs = new Array();
            var _local_4:XMLList = _arg_1.Dialogs[0].Dialog;
            if (_local_4){
                _local_3 = _local_4.length();
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    _local_7 = new SuperShadowSingleData();
                    _local_7.decode(_local_4[_local_2]);
                    this.dialogs.push(_local_7);
                    _local_2++;
                };
            };
            this.btn1 = String(_arg_1.@btn1);
            this.btn2 = String(_arg_1.@btn2);
            var _local_6:XML = _arg_1.Scripts[0];
            if (_local_6){
                this.btnScripts = new Array();
                _local_2 = 0;
                while (_local_2 < 2) {
                    _local_8 = new Array();
                    _local_9 = (("Btn" + (_local_2 + 1).toString()) + "Scripts");
                    _local_10 = _local_6.child(_local_9);
                    if (((_local_10) && ((_local_10.length() > 0)))){
                        _local_11 = _local_10[0].Script;
                        if (_local_11){
                            _local_3 = _local_11.length();
                            _local_12 = 0;
                            while (_local_12 < _local_3) {
                                _local_5 = new ScriptInfo();
                                _local_5.decode(_local_11[_local_12]);
                                _local_8.push(_local_5);
                                _local_12++;
                            };
                        };
                    };
                    this.btnScripts.push(_local_8);
                    _local_2++;
                };
                if (_local_6.CloseBtnScripts[0]){
                    _local_13 = _local_6.CloseBtnScripts[0].Script;
                    this.closbtnScripts = new Array();
                    if (_local_13){
                        _local_3 = _local_13.length();
                        _local_2 = 0;
                        while (_local_2 < _local_3) {
                            _local_5 = new ScriptInfo();
                            _local_5.decode(_local_13[_local_2]);
                            this.closbtnScripts.push(_local_5);
                            _local_2++;
                        };
                    };
                };
            };
        }

        public function encode()
        {
            var _local_3:SuperShadowSingleData;
            var _local_4:XML;
            var _local_5:ScriptInfo;
            var _local_6:XML;
            var _local_7:XML;
            var _local_8:XML;
            var _local_1:XML = <SuperShadowDialog/>
            ;
            _local_1.@id = this.id;
            _local_1.@name = this.name;
            _local_1.@title = this.title;
            _local_1.@btn1 = this.btn1;
            _local_1.@btn2 = this.btn2;
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
            var _local_9:int;
            var _local_10:* = this.btnScripts[0];
            for each (_local_5 in this.btnScripts[0]) {
                _local_6.appendChild(_local_5.encode());
            };
            _local_4.appendChild(_local_6);
            _local_7 = <Btn2Scripts/>
            ;
            for each (_local_5 in this.btnScripts[1]) {
                _local_7.appendChild(_local_5.encode());
            };
            _local_4.appendChild(_local_7);
            _local_8 = <CloseBtnScripts/>
            ;
            for each (_local_5 in this.closbtnScripts) {
                _local_8.appendChild(_local_5.encode());
            };
            _local_4.appendChild(_local_8);
            _local_1.appendChild(_local_4);
            _local_1.appendChild(_local_4);
            return (_local_1);
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:ScriptInfo;
            var _local_7:SuperShadowSingleData;
            var _local_8:Array;
            this.id = _arg_1.readUnsignedInt();
            this.name = XString.ReadString(_arg_1);
            this.title = XString.ReadString(_arg_1);
            this.dialogs = new Array();
            _local_3 = _arg_1.readByte();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_7 = new SuperShadowSingleData();
                _local_7.read(_arg_1);
                this.dialogs.push(_local_7);
                _local_2++;
            };
            this.btn1 = XString.ReadString(_arg_1);
            this.btn2 = XString.ReadString(_arg_1);
            var _local_5:int = _arg_1.readByte();
            this.btnScripts = new Array();
            var _local_6:int;
            while (_local_6 < _local_5) {
                _local_8 = new Array();
                _local_3 = _arg_1.readByte();
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    _local_4 = new ScriptInfo();
                    _local_4.read(_arg_1);
                    _local_8.push(_local_4);
                    _local_2++;
                };
                this.btnScripts.push(_local_8);
                _local_6++;
            };
            _local_3 = _arg_1.readByte();
            this.closbtnScripts = new Array();
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
            var _local_7:SuperShadowSingleData;
            var _local_8:Array;
            _arg_1.writeUnsignedInt(this.id);
            XString.WriteString(_arg_1, this.name);
            XString.WriteString(_arg_1, this.title);
            _local_3 = this.dialogs.length;
            _arg_1.writeByte(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_7 = this.dialogs[_local_2];
                _local_7.write(_arg_1);
                _local_2++;
            };
            XString.WriteString(_arg_1, this.btn1);
            XString.WriteString(_arg_1, this.btn2);
            var _local_5:int = this.btnScripts.length;
            _arg_1.writeByte(_local_5);
            var _local_6:int;
            while (_local_6 < _local_5) {
                _local_8 = this.btnScripts[_local_6];
                _local_3 = _local_8.length;
                _arg_1.writeByte(_local_3);
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    _local_4 = _local_8[_local_2];
                    _local_4.write(_arg_1);
                    _local_2++;
                };
                _local_6++;
            };
            _local_3 = this.closbtnScripts.length;
            _arg_1.writeByte(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = this.closbtnScripts[_local_2];
                _local_4.write(_arg_1);
                _local_2++;
            };
        }

        public /*  ©init. */ function _SafeStr_342()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_342 = " SuperShadowInfo" (String#15389)


