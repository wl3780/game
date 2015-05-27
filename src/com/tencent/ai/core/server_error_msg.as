// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.server_error_msg

package com.tencent.ai.core
{
    import com.tencent.ai.core.data.ServerErrorCodeInfo;

    public function server_error_msg(_arg_1:int):String
    {
        var _local_2:ServerErrorCodeInfo = AICore.data.getServerErrorCodeInfo(_arg_1);
        var _local_3 = "";
        if (((_local_2) && (_local_2.message))){
            _local_3 = (_local_3 + _local_2.message);
        } else {
            _local_3 = (_local_3 + "遇到电磁干扰，无法操作，请稍后重试。");
        };
        return (_local_3);
    }

}//package com.tencent.ai.core

