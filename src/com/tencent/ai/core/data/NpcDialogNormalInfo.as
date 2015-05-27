// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.NpcDialogNormalInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_287;
    import __AS3__.vec.*;

    public class NpcDialogNormalInfo implements IXMLSerialize 
    {

        public var rank:String;
        public var name:String;
        public var npcID:int;
        public var mood:int = 0;
        public var message:String;
        public var optionList:Vector.<NpcDialogOptionInfo>;


        public function decode(_arg_1:XML):void
        {
            this.rank = String(_arg_1.@rank);
            this.name = String(_arg_1.@rank);
            this.npcID = int(_arg_1.@rank);
            this.mood = int(_arg_1.@mood);
            this.message = _arg_1.@msg;
            this.optionList = new Vector.<NpcDialogOptionInfo>();
            this.optionList[0] = new NpcDialogOptionInfo();
            this.optionList[0].label = "testbtn";
        }

        public function encode()
        {
            return (null);
        }

        public /*  ©init. */ function _SafeStr_287()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_287 = " NpcDialogNormalInfo" (String#17732)


