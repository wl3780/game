// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PTeamQuit

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1044;

    public class PTeamQuit implements ISerialize 
    {

        public static const REQ:int = 524541;
        public static const RSP:int = 524542;

        public var result:int;
        public var teamID:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            this.teamID = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.teamID);
        }

        public /*  ©init. */ function _SafeStr_1044()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1044 = " PTeamQuit" (String#14465)


