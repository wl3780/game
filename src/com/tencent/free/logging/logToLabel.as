// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.logging.logToLabel

package com.tencent.free.logging
{
    public function logToLabel(_arg_1:String, _arg_2:int=2):void
    {
        var _local_3:Function = LoggingDefine.labelAppenders[_arg_2];
        if (_local_3 != null){
            (_local_3(_arg_1));
        };
    }

}//package com.tencent.free.logging

