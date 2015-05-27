// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.IProtocolCrypto

package com.tencent.ai.core.net
{
    import com.tencent.ai.core.crypto.ICrypto;
    import flash.utils.ByteArray;

    public interface IProtocolCrypto 
    {

        function getCrypto(_arg_1:int):ICrypto;
        function getCryptoKey(_arg_1:int):ByteArray;
        function setCrypto(_arg_1:ICrypto):void;
        function setCryptoKey(_arg_1:ByteArray):void;

    }
}//package com.tencent.ai.core.net

