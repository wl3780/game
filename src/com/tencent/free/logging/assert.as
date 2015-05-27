// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.logging.assert

package com.tencent.free.logging
{
    public function assert(_arg_1:Boolean, _arg_2:String, _arg_3:int=0):void
    {
        var _local_4:Function = LoggingDefine.assertFunc;
        if (_local_4 != null){
            _local_4.call(null, _arg_1, _arg_2, _arg_3);
        };
    }

}//package com.tencent.free.logging

