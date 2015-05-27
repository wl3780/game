// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.SendDef

package com.tencent.ai.core.net
{
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.NetGroupDef;
    import  ©init._SafeStr_808;

    public class SendDef 
    {

        public static var citySendFunc:Function = defaultCitySendFunc;
        public static var citySALFunc:Function = defaultCitySALFunc;
        public static var homeSALFunc:Function = defaultHomesteadSALFunc;
        public static var dupSendFunc:Function = defaultDupSendFunc;
        public static var dupSALFunc:Function = defaultDupSALFunc;


        private static function defaultCitySendFunc(_arg_1:int, _arg_2:Object):Boolean
        {
            return (AICore.net.getGroup(NetGroupDef.NG_CITY_GROUP).send(_arg_1, _arg_2));
        }

        private static function defaultCitySALFunc(_arg_1:int, _arg_2:Object, _arg_3:Object, _arg_4:int=-1):Boolean
        {
            return (AICore.net.getGroup(NetGroupDef.NG_CITY_GROUP).sendAndListen(_arg_1, _arg_2, _arg_3, _arg_4));
        }

        private static function defaultHomesteadSALFunc(_arg_1:int, _arg_2:Object, _arg_3:Object, _arg_4:int=-1):Boolean
        {
            return (AICore.net.getGroup(NetGroupDef.NG_HOMESTEAD_GROUP).sendAndListen(_arg_1, _arg_2, _arg_3, _arg_4));
        }

        private static function defaultDupSendFunc(_arg_1:int, _arg_2:Object):Boolean
        {
            return (AICore.net.getGroup(NetGroupDef.NG_DUP_GROUP).send(_arg_1, _arg_2));
        }

        private static function defaultDupSALFunc(_arg_1:int, _arg_2:Object, _arg_3:Object, _arg_4:int=-1):Boolean
        {
            return (AICore.net.getGroup(NetGroupDef.NG_DUP_GROUP).sendAndListen(_arg_1, _arg_2, _arg_3, _arg_4));
        }


        public /*  ©init. */ function _SafeStr_808()
        {
        }


    }
}//package com.tencent.ai.core.net

// _SafeStr_808 = " SendDef" (String#14531)


