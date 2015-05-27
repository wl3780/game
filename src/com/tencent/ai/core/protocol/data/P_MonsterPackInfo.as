// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_MonsterPackInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.MonsterPackInfo;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.MonsterInfo;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_898;
    import __AS3__.vec.*;

    public class P_MonsterPackInfo implements ISerialize 
    {

        public static var P:P_MonsterPackInfo = new (P_MonsterPackInfo)();

        public var data:MonsterPackInfo;


        public function read(_arg_1:IDataInput):void
        {
            if (this.data == null){
                this.data = new MonsterPackInfo();
            };
            this.data.pkID = _arg_1.readUnsignedInt();
            this.data.spawnFrame = _arg_1.readUnsignedInt();
            this.data.createOnceNum = _arg_1.readUnsignedShort();
            this.data.createInterval = _arg_1.readUnsignedShort();
            this.data.mapPos = new MapPosition();
            this.data.mapPos.read(_arg_1);
            var _local_2:int = _arg_1.readUnsignedShort();
            var _local_3:Vector.<MonsterInfo> = new Vector.<MonsterInfo>();
            var _local_4:P_MonsterAppear = new P_MonsterAppear();
            var _local_5:int;
            while (_local_5 < _local_2) {
                _local_4.data = null;
                _local_4.read(_arg_1);
                _local_3.push(_local_4.data);
                _local_5++;
            };
            this.data.monsterInfos = _local_3;
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_898()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_898 = " P_MonsterPackInfo" (String#16193)


