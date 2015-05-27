// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ServerErrorCodeInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_326;

    public class ServerErrorCodeInfo implements IXMLSerialize, ISerialize 
    {

        public var code:int;
        public var message:String;
        public var name:String;
        public var type:int;


        public function decode(_arg_1:XML):void
        {
            this.code = int(_arg_1.@code);
            this.message = String(_arg_1.@msg);
            this.name = String(_arg_1.@name);
            this.type = int(_arg_1.@type);
        }

        public function encode()
        {
            return (null);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.code = _arg_1.readInt();
            this.message = XString.ReadString(_arg_1);
            this.name = XString.ReadString(_arg_1);
            this.type = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.code);
            XString.WriteString(_arg_1, this.message);
            XString.WriteString(_arg_1, this.name);
            _arg_1.writeInt(this.type);
        }

        public /*  ©init. */ function _SafeStr_326()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_326 = " ServerErrorCodeInfo" (String#16622)


