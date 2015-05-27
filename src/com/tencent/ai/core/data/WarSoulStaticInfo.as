// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.WarSoulStaticInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_356;

    public class WarSoulStaticInfo implements IXMLSerialize, ISerialize 
    {

        public var quality:int;
        public var level:int;
        public var type:int;
        public var src:String;
        public var upgradeExp:int;
        public var name:String;
        public var power:int;
        public var des:String = "";


        public function decode(_arg_1:XML):void
        {
            this.src = String(_arg_1.@src);
            this.upgradeExp = int(_arg_1.@upgrade_exp);
            this.type = int(_arg_1.@type);
            this.name = String(_arg_1.@name);
            this.power = int(_arg_1.@attr_power);
            this.des = String(_arg_1.des);
        }

        public function encode()
        {
            return (new XML((((((((((((((('<war_soul src="' + this.src) + '" upgrade_exp="') + this.upgradeExp) + '" type="') + this.type) + '" name="') + this.name) + '" attr_power="') + this.power) + '">') + "<des><![CDATA[ ") + this.des) + " ]]></des>") + "</war_soul>")));
        }

        public function toKey():String
        {
            return (((((this.type + "_") + this.quality) + "_") + this.level));
        }

        public function getID():uint
        {
            return ((((10000 * this.type) + (100 * this.quality)) + this.level));
        }

        public function read(_arg_1:IDataInput):void
        {
            this.quality = _arg_1.readUnsignedByte();
            this.level = _arg_1.readUnsignedByte();
            this.type = _arg_1.readUnsignedByte();
            this.src = XString.ReadString(_arg_1);
            this.upgradeExp = _arg_1.readUnsignedInt();
            this.name = XString.ReadString(_arg_1);
            this.power = _arg_1.readUnsignedShort();
            this.des = XString.ReadString(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.quality);
            _arg_1.writeByte(this.level);
            _arg_1.writeByte(this.type);
            XString.WriteString(_arg_1, this.src);
            _arg_1.writeUnsignedInt(this.upgradeExp);
            XString.WriteString(_arg_1, this.name);
            _arg_1.writeShort(this.power);
            XString.WriteString(_arg_1, this.des);
        }

        public /*  ©init. */ function _SafeStr_356()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_356 = " WarSoulStaticInfo" (String#17762)


