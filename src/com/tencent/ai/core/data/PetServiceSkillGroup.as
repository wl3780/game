// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PetServiceSkillGroup

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_301;

    public class PetServiceSkillGroup implements IXMLSerialize, ISerialize 
    {

        public var type:int;
        public var id:int;
        public var name:String = "";
        public var des:String = "";
        public var label:String = "";
        public var scriptInfo:ScriptInfo;
        public var assetID:int;
        public var groupID:int;
        public var sortID:int;
        public var priority:int;
        public var isMallSell:Boolean;
        public var mallProductID:int;


        public function decode(_arg_1:XML):void
        {
            this.type = int(_arg_1.@type);
            this.id = int(_arg_1.@id);
            this.name = String(_arg_1.@name);
            this.assetID = int(_arg_1.@assetID);
            if (_arg_1.Des.length()){
                this.des = String(_arg_1.Des[0].toString());
            };
            var _local_2:XMLList = _arg_1.Option;
            if (_local_2.length()){
                this.label = String(_local_2[0].@label);
                this.scriptInfo = new ScriptInfo();
                if (_local_2[0].scripts.Script[0]){
                    this.scriptInfo.decode(_local_2[0].scripts.Script[0]);
                };
            };
            this.groupID = int(_arg_1.@group_id);
            this.sortID = int(_arg_1.@sort_id);
            this.priority = int(_arg_1.@priority);
            if (_arg_1.hasOwnProperty("@product_id")){
                this.mallProductID = int(_arg_1.@product_id);
                if (this.mallProductID > 0){
                    this.isMallSell = true;
                } else {
                    this.isMallSell = false;
                    this.mallProductID = 0;
                };
            } else {
                this.isMallSell = false;
                this.mallProductID = 0;
            };
        }

        public function encode()
        {
            return (null);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.type = _arg_1.readInt();
            this.id = _arg_1.readInt();
            this.assetID = _arg_1.readInt();
            this.name = XString.ReadString(_arg_1);
            this.des = XString.ReadString(_arg_1);
            this.label = XString.ReadString(_arg_1);
            this.scriptInfo = new ScriptInfo();
            this.scriptInfo.read(_arg_1);
            this.groupID = _arg_1.readInt();
            this.sortID = _arg_1.readInt();
            this.priority = _arg_1.readUnsignedShort();
            this.mallProductID = _arg_1.readUnsignedInt();
            if (this.mallProductID > 0){
                this.isMallSell = true;
            } else {
                this.isMallSell = false;
                this.mallProductID = 0;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.type);
            _arg_1.writeInt(this.id);
            _arg_1.writeInt(this.assetID);
            XString.WriteString(_arg_1, this.name);
            XString.WriteString(_arg_1, this.des);
            XString.WriteString(_arg_1, this.label);
            this.scriptInfo.write(_arg_1);
            _arg_1.writeInt(this.groupID);
            _arg_1.writeInt(this.sortID);
            _arg_1.writeShort(this.priority);
            _arg_1.writeInt(this.mallProductID);
        }

        public /*  ©init. */ function _SafeStr_301()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_301 = " PetServiceSkillGroup" (String#16121)


