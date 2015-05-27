// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.home.HomePlayerSimpleInfo

package com.tencent.ai.core.protocol.home
{
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_952;

    public class HomePlayerSimpleInfo 
    {

        public var playerID:PlayerID;
        public var name:String;


        public function read(_arg_1:IDataInput):void
        {
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.name = XString.ReadChars(_arg_1, 32);
        }

        public /*  ©init. */ function _SafeStr_952()
        {
        }


    }
}//package com.tencent.ai.core.protocol.home

// _SafeStr_952 = " HomePlayerSimpleInfo" (String#15731)


