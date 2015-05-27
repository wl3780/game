// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.EquipAttribPair

package com.tencent.ai.core.data
{
    import flash.utils.IExternalizable;
    import flash.utils.IDataOutput;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_246;

    public class EquipAttribPair implements IExternalizable 
    {

        public var type:int;
        public var data:int;


        public function toString():String
        {
            return ((((("{" + this.type) + ",") + this.data) + "}"));
        }

        public function writeExternal(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.type);
            _arg_1.writeInt(this.data);
        }

        public function readExternal(_arg_1:IDataInput):void
        {
            this.type = _arg_1.readInt();
            this.data = _arg_1.readInt();
        }

        public /*  ©init. */ function _SafeStr_246()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_246 = " EquipAttribPair" (String#14039)


