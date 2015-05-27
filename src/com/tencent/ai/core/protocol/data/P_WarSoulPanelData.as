// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_WarSoulPanelData

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_926;

    public class P_WarSoulPanelData implements ISerialize 
    {

        public var currentCreateIndex:int;


        public function read(_arg_1:IDataInput):void
        {
            this.currentCreateIndex = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_926()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_926 = " P_WarSoulPanelData" (String#13961)


