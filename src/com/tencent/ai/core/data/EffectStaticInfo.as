// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.EffectStaticInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_242;

    public class EffectStaticInfo implements IXMLSerialize 
    {

        public var id:int;
        public var name:String;
        public var effectType:int;
        public var blendMode:String;
        public var loop:Boolean;
        public var loadType:int;


        public function decode(_arg_1:XML):void
        {
            this.id = int(_arg_1.@id);
            this.name = String(_arg_1.@name);
            this.effectType = int(_arg_1.@effectType);
            this.blendMode = String(_arg_1.@blendMode);
            this.loadType = int(_arg_1.@loadType);
            this.loop = (String(_arg_1.@loop) == "true");
        }

        public function encode()
        {
            return ("");
        }

        public function toString():String
        {
            return ((((this.name + "(") + this.id) + ")"));
        }

        public function read(_arg_1:IDataInput):void
        {
            this.id = _arg_1.readInt();
            this.name = XString.ReadString(_arg_1);
            this.effectType = _arg_1.readInt();
            this.blendMode = XString.ReadString(_arg_1);
            this.loadType = _arg_1.readInt();
            this.loop = _arg_1.readBoolean();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.id);
            XString.WriteString(_arg_1, this.name);
            _arg_1.writeInt(this.effectType);
            XString.WriteString(_arg_1, this.blendMode);
            _arg_1.writeInt(this.loadType);
            _arg_1.writeBoolean(this.loop);
        }

        public /*  ©init. */ function _SafeStr_242()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_242 = " EffectStaticInfo" (String#16829)


