// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PlotInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_312;

    public class PlotInfo implements IXMLSerialize, ISerialize 
    {

        public var id:int = -1;
        public var name:String;
        public var procedures:Array;
        public var defualActiveProcedureStr:String;
        public var defaultActiveProcedures:Array;


        public function decode(_arg_1:XML):void
        {
            var _local_3:XML;
            var _local_4:XMLList;
            var _local_5:int;
            var _local_6:int;
            var _local_7:ProcedureInfo;
            this.name = String(_arg_1.@name);
            this.id = int(_arg_1.@id);
            this.defualActiveProcedureStr = String(_arg_1.@defaultAP);
            this.defaultActiveProcedures = this.defualActiveProcedureStr.split(",");
            this.procedures = new Array();
            var _local_2:XMLList = _arg_1.ProcedureInfos;
            if (((_local_2) && ((_local_2.length() > 0)))){
                _local_3 = _local_2[0];
                _local_4 = _local_3.ProcedureInfo;
                if (_local_4){
                    _local_5 = _local_4.length();
                    _local_6 = 0;
                    while (_local_6 < _local_5) {
                        _local_7 = new ProcedureInfo();
                        _local_7.decode(_local_4[_local_6]);
                        this.procedures.push(_local_7);
                        _local_6++;
                    };
                };
            };
        }

        public function encode()
        {
            var _local_3:ProcedureInfo;
            var _local_1:XML = <PlotInfo id="0" name="0" defaultAP="0"/>
            ;
            _local_1.@id = this.id;
            _local_1.@name = this.name;
            _local_1.@defaultAP = this.defualActiveProcedureStr;
            var _local_2:XML = <ProcedureInfos/>
            ;
            for each (_local_3 in this.procedures) {
                _local_2.appendChild(_local_3.encode());
            };
            _local_1.appendChild(_local_2);
            return (_local_1);
        }

        public function clone():PlotInfo
        {
            var _local_2:ProcedureInfo;
            var _local_1:PlotInfo = new PlotInfo();
            _local_1.id = this.id;
            _local_1.name = this.name;
            _local_1.procedures = new Array();
            var _local_3:int;
            var _local_4:* = this.procedures;
            for each (_local_2 in this.procedures) {
                _local_1.procedures.push(_local_2.clone());
            };
            _local_1.defualActiveProcedureStr = this.defualActiveProcedureStr;
            return (_local_1);
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_4:ProcedureInfo;
            this.name = XString.ReadString(_arg_1);
            this.id = _arg_1.readInt();
            this.defualActiveProcedureStr = XString.ReadString(_arg_1);
            this.defaultActiveProcedures = this.defualActiveProcedureStr.split(",");
            this.procedures = new Array();
            var _local_2:int = _arg_1.readByte();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new ProcedureInfo();
                _local_4.read(_arg_1);
                this.procedures.push(_local_4);
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_4:ProcedureInfo;
            XString.WriteString(_arg_1, this.name);
            _arg_1.writeInt(this.id);
            XString.WriteString(_arg_1, this.defualActiveProcedureStr);
            var _local_2:int = this.procedures.length;
            _arg_1.writeByte(_local_2);
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = this.procedures[_local_3];
                _local_4.write(_arg_1);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_312()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_312 = " PlotInfo" (String#15809)


