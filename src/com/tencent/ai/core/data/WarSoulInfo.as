// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.WarSoulInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.AICore;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_355;

    public class WarSoulInfo implements ISerialize 
    {

        public var sid:int;
        public var quality:int;
        public var level:int;
        public var type:int;
        public var gridIndex:int;
        public var exp:int;
        public var staticInfo:WarSoulStaticInfo;
        public var isNew:Boolean;


        public function isEmpty():Boolean
        {
            return ((this.sid <= 0));
        }

        public function read(_arg_1:IDataInput):void
        {
            this.sid = _arg_1.readUnsignedInt();
            this.quality = _arg_1.readUnsignedByte();
            this.level = _arg_1.readUnsignedByte();
            this.type = _arg_1.readUnsignedByte();
            this.gridIndex = _arg_1.readUnsignedByte();
            this.exp = _arg_1.readUnsignedInt();
            this.staticInfo = AICore.data.getWarSoulStaticInfo(this.type, this.quality, this.level);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_355()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_355 = " WarSoulInfo" (String#16139)


