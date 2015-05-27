// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.setup.CompressConfFile

package com.tencent.free.setup
{
    import com.tencent.free.mff.MFFFile;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.ByteArray;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_61;

    public class CompressConfFile extends MFFFile 
    {

        public var key:String;
        public var text:String;

        public function CompressConfFile()
        {
            mffType = "xml";
        }

        override public function readExternal(_arg_1:IDataInput):void
        {
            super.readExternal(_arg_1);
            mffBytes.position = 0;
            this.key = XString.ReadString(mffBytes);
            this.text = XString.ReadString(mffBytes);
        }

        override public function writeExternal(_arg_1:IDataOutput):void
        {
            if (mffBytes != null){
                mffBytes.clear();
            };
            mffBytes = new ByteArray();
            XString.WriteString(mffBytes, this.key);
            XString.WriteString(mffBytes, this.text);
            super.writeExternal(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_61()
        {
        }


    }
}//package com.tencent.free.setup

// _SafeStr_61 = " CompressConfFile" (String#1433)


