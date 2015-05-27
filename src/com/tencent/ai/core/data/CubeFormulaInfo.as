// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.CubeFormulaInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_229;

    public class CubeFormulaInfo implements IXMLSerialize, ISerialize 
    {

        public var level:int;
        public var career:int;
        public var env_type:int;
        public var other:int;
        public var item_id:int;
        public var avatar_type2:int;
        public var avatar_type3:int;


        public function decode(_arg_1:XML):void
        {
            this.level = _arg_1.@level;
            this.career = _arg_1.@career;
            this.env_type = _arg_1.@env_type;
            this.other = _arg_1.@other;
            this.item_id = _arg_1.@item_id;
            this.avatar_type2 = _arg_1.@avatar_type2;
            this.avatar_type3 = _arg_1.@avatar_type3;
        }

        public function encode()
        {
            return ("");
        }

        public function equals(_arg_1:CubeFormulaInfo):Boolean
        {
            if (this.career == _arg_1.career){
                return (true);
            };
            return (false);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.level = _arg_1.readShort();
            this.career = _arg_1.readShort();
            this.item_id = _arg_1.readUnsignedInt();
            this.avatar_type2 = _arg_1.readShort();
            this.avatar_type3 = _arg_1.readShort();
            this.env_type = _arg_1.readShort();
            this.other = _arg_1.readShort();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeShort(this.level);
            _arg_1.writeShort(this.career);
            _arg_1.writeUnsignedInt(this.item_id);
            _arg_1.writeShort(this.avatar_type2);
            _arg_1.writeShort(this.avatar_type3);
            _arg_1.writeShort(this.env_type);
            _arg_1.writeShort(this.other);
        }

        public /*  ©init. */ function _SafeStr_229()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_229 = " CubeFormulaInfo" (String#15290)


