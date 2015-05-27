// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PTL_GetNoCryptoCMDList

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1049;
    import __AS3__.vec.*;

    public class PTL_GetNoCryptoCMDList implements ISerialize 
    {

        public var isEncrypted:Boolean;
        public var noCryptoCmds:Vector.<int>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:uint;
            this.isEncrypted = _arg_1.readBoolean();
            this.noCryptoCmds = new Vector.<int>();
            if (this.isEncrypted){
                _local_2 = _arg_1.readShort();
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    this.noCryptoCmds.push(_arg_1.readInt());
                    _local_3++;
                };
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1049()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1049 = " PTL_GetNoCryptoCMDList" (String#14843)


