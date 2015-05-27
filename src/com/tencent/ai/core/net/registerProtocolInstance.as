// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.registerProtocolInstance

package com.tencent.ai.core.net
{
    import com.tencent.ai.core.utils.ISerialize;

    public function registerProtocolInstance(_arg_1:int, _arg_2:ISerialize):void
    {
        ProtocolHelper.M_PROTOCOL_INSTANCES[_arg_1] = _arg_2;
        if (_arg_2 == null){
            delete ProtocolHelper.M_PROTOCOL_INSTANCES[_arg_1];
        };
    }

}//package com.tencent.ai.core.net

