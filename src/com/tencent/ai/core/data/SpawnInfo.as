// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SpawnInfo

package com.tencent.ai.core.data
{
    import  ©init._SafeStr_335;

    public class SpawnInfo 
    {

        public static const CLIENT_PKID_MIN:uint = 10000000;

        public var pkID:uint;
        public var packID:uint;
        public var spawnType:int = 0;
        public var spawnData1:int = 0;
        public var spawnData2:int = 0;
        public var spawnData3:int = 0;
        public var local:Boolean = false;
        public var localMapPos:MapPosition;
        public var server_reslut:int = 0;

        public function SpawnInfo(_arg_1:int=0, _arg_2:uint=0, _arg_3:uint=0)
        {
            this.pkID = 0;
            this.spawnType = _arg_1;
            this.spawnData1 = _arg_3;
            this.packID = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_335()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_335 = " SpawnInfo" (String#16973)


