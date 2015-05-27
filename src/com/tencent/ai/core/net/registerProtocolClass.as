// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.registerProtocolClass

package com.tencent.ai.core.net
{
    public function registerProtocolClass(_arg_1:int, _arg_2:Class):void
    {
        ProtocolHelper.M_PROTOCOL_CLASSES[_arg_1] = _arg_2;
        if (_arg_2 == null){
            delete ProtocolHelper.M_PROTOCOL_CLASSES[_arg_1];
        };
    }

}//package com.tencent.ai.core.net

