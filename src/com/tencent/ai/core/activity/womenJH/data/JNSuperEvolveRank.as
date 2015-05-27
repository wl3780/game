// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.activity.womenJH.data.JNSuperEvolveRank

package com.tencent.ai.core.activity.womenJH.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_25;

    public class JNSuperEvolveRank implements ISerialize 
    {

        public var player:PlayerID;
        public var name:String;
        public var idx:uint;
        public var actionTime:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.player = new PlayerID();
            this.player.read(_arg_1);
            this.name = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
            this.idx = _arg_1.readUnsignedByte();
            this.actionTime = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_25()
        {
        }


    }
}//package com.tencent.ai.core.activity.womenJH.data

// _SafeStr_25 = " JNSuperEvolveRank" (String#14183)


