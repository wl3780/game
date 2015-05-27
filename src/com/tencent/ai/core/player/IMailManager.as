// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IMailManager

package com.tencent.ai.core.player
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_MailData;
    import com.tencent.ai.core.data.MailID;

    public interface IMailManager 
    {

        function getMailByType(_arg_1:int):Vector.<P_MailData>;
        function removeMail(_arg_1:int, _arg_2:MailID):void;

    }
}//package com.tencent.ai.core.player

