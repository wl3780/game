// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.ReadIn

package com.tencent.ai.core.protocol.data
{
    import flash.utils.IDataInput;

    public function ReadIn(_arg_1:IDataInput, _arg_2:Object, _arg_3:Object):void
    {
        _arg_3.P.data = _arg_2;
        _arg_3.P.read(_arg_1);
        _arg_3.P.data = null;
    }

}//package com.tencent.ai.core.protocol.data

