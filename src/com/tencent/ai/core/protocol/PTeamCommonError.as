// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PTeamCommonError

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1036;

    public class PTeamCommonError implements ISerialize 
    {

        public static const RSP:int = 524586;
        public static const CHANGE_TEAM_INFO:int = 1;
        public static const REQUEST_JOIN_TEAM:int = 2;
        public static const MEMBER_DISAGREE:int = 3;
        public static const CAPTAIN_DISAGREE:int = 4;
        public static const TEAM_COMMON_INVITE_JOIN_TEAM:int = 5;

        public var result:int;
        public var type:int;
        public var errorMessage:String;


        public function read(_arg_1:IDataInput):void
        {
            this.type = _arg_1.readUnsignedInt();
            this.result = _arg_1.readInt();
            var _local_2:int = _arg_1.readUnsignedShort();
            this.errorMessage = XString.ReadChars(_arg_1, _local_2);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1036()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1036 = " PTeamCommonError" (String#16715)


