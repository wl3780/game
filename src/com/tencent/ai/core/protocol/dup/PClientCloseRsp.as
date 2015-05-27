// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.PClientCloseRsp

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.protocol.PBaseDupProtocol;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_931;

    public class PClientCloseRsp extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589862;

        public var ret:int;
        public var playerid:PlayerID;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.ret = _arg_1.readInt();
            this.playerid = new PlayerID();
            this.playerid.read(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_931()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_931 = " PClientCloseRsp" (String#16277)


