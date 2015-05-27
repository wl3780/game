// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.crypto.ICryptoManager

package com.tencent.ai.core.crypto
{
    import flash.utils.ByteArray;

    public interface ICryptoManager 
    {

        function getCrypto(_arg_1:int):ICrypto;
        function getCryptoKey(_arg_1:String):ByteArray;

    }
}//package com.tencent.ai.core.crypto

