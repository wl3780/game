// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.crypto.ICrypto

package com.tencent.ai.core.crypto
{
    import flash.utils.ByteArray;

    public interface ICrypto 
    {

        function encrypt(_arg_1:ByteArray, _arg_2:ByteArray):ByteArray;
        function decrypt(_arg_1:ByteArray, _arg_2:ByteArray):ByteArray;

    }
}//package com.tencent.ai.core.crypto

