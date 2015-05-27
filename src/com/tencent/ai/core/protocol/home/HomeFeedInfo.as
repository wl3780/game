// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.home.HomeFeedInfo

package com.tencent.ai.core.protocol.home
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_951;

    public class HomeFeedInfo implements ISerialize 
    {

        public var type:uint;
        public var time:uint;
        public var playerSI:HomePlayerSimpleInfo;
        public var data1:int;
        public var data2:int;
        public var data3:int;


        public function read(_arg_1:IDataInput):void
        {
            this.type = _arg_1.readUnsignedInt();
            this.time = _arg_1.readUnsignedInt();
            this.playerSI = new HomePlayerSimpleInfo();
            this.playerSI.read(_arg_1);
            this.data1 = _arg_1.readInt();
            this.data2 = _arg_1.readInt();
            this.data3 = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_951()
        {
        }


    }
}//package com.tencent.ai.core.protocol.home

// _SafeStr_951 = " HomeFeedInfo" (String#16022)


