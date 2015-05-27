// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.cityContext.PSceneAppearProtocol

package com.tencent.ai.core.protocol.cityContext
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_PlayerAppear;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_863;
    import __AS3__.vec.*;

    public class PSceneAppearProtocol implements ISerialize 
    {

        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_SCENE_INFO_REQ;//524309
        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_SCENE_INFO_RSP;//524310

        public var sceneID:int;
        public var playerNum:uint;
        public var arrPlayer:Vector.<P_PlayerAppear>;

        public function PSceneAppearProtocol(_arg_1:int=0)
        {
            this.sceneID = _arg_1;
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_3:P_PlayerAppear;
            this.sceneID = _arg_1.readUnsignedShort();
            this.playerNum = _arg_1.readUnsignedShort();
            this.arrPlayer = new Vector.<P_PlayerAppear>();
            var _local_2:int;
            while (_local_2 < this.playerNum) {
                _local_3 = new P_PlayerAppear();
                _local_3.read(_arg_1);
                this.arrPlayer.push(_local_3);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeShort(this.sceneID);
        }

        public /*  ©init. */ function _SafeStr_863()
        {
        }


    }
}//package com.tencent.ai.core.protocol.cityContext

// _SafeStr_863 = " PSceneAppearProtocol" (String#13994)


