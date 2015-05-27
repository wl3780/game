// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PTeamEdit

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.TeamCreateInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1038;

    public class PTeamEdit implements ISerialize 
    {

        public static const REQ:int = 524543;

        public var teamCreateInfo:TeamCreateInfo;


        public function read(_arg_1:IDataInput):void
        {
        }

        public function write(_arg_1:IDataOutput):void
        {
            this.teamCreateInfo.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_1038()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1038 = " PTeamEdit" (String#14849)


