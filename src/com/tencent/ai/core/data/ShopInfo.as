// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ShopInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_329;

    public class ShopInfo implements ISerialize 
    {

        public var list:Vector.<int>;
        public var id:int;
        public var npcID:int;
        public var type:int;


        public function read(_arg_1:IDataInput):void
        {
            this.id = _arg_1.readInt();
            this.npcID = _arg_1.readInt();
            this.type = _arg_1.readInt();
            this.list = _arg_1.readObject();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.id);
            _arg_1.writeInt(this.npcID);
            _arg_1.writeInt(this.type);
            _arg_1.writeObject(this.list);
        }

        public /*  ©init. */ function _SafeStr_329()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_329 = " ShopInfo" (String#15497)


