// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.activity.womenJH.protocol.QueryReq

package com.tencent.ai.core.activity.womenJH.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.activity.womenJH.data.XYStruct;
    import com.tencent.ai.core.activity.womenJH.data.NJStruct;
    import com.tencent.ai.core.activity.womenJH.data.JNStruct;
    import com.tencent.ai.core.activity.womenJH.enum.WomenEnum;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_32;

    public class QueryReq implements ISerialize 
    {

        public static const IN_CMD:int = 1511202;
        public static const OUT_CMD:int = 1511201;

        public var ret:int;
        public var type:uint;
        public var size:uint;
        public var typeOut:uint;
        public var dataXY:XYStruct;
        public var dataNJ:NJStruct;
        public var dataJN:JNStruct;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
            if (this.ret != 0){
                return;
            };
            this.type = _arg_1.readUnsignedByte();
            this.size = _arg_1.readUnsignedShort();
            if (this.type == WomenEnum.XY){
                this.dataXY = new XYStruct();
                this.dataXY.read(_arg_1);
            } else {
                if (this.type == WomenEnum.NJ){
                    this.dataNJ = new NJStruct();
                    this.dataNJ.read(_arg_1);
                } else {
                    if (this.type == WomenEnum.JN){
                        this.dataJN = new JNStruct();
                        this.dataJN.read(_arg_1);
                    };
                };
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.typeOut);
        }

        public /*  ©init. */ function _SafeStr_32()
        {
        }


    }
}//package com.tencent.ai.core.activity.womenJH.protocol

// _SafeStr_32 = " QueryReq" (String#17294)


