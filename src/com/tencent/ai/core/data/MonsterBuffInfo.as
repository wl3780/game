// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.MonsterBuffInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_275;

    public class MonsterBuffInfo implements IXMLSerialize, ISerialize 
    {

        public var actionID:int;
        public var timer:int;


        public function decode(_arg_1:XML):void
        {
            this.actionID = int(_arg_1.@aID);
            this.timer = int(_arg_1.@tTime);
        }

        public function encode()
        {
            return (null);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.actionID = _arg_1.readShort();
            this.timer = _arg_1.readShort();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeShort(this.actionID);
            _arg_1.writeShort(this.timer);
        }

        public /*  ©init. */ function _SafeStr_275()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_275 = " MonsterBuffInfo" (String#14606)


