// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.cityContext.PSceneChangeProtocol

package com.tencent.ai.core.protocol.cityContext
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_864;

    public class PSceneChangeProtocol implements ISerialize 
    {

        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_CHANGE_SCENE_REQ;//524325
        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_CHANGE_SCENE_RSP;//524326

        public var scene_id:uint;
        public var result:int;
        public var posX:int;
        public var posY:int;

        public function PSceneChangeProtocol(_arg_1:int=0, _arg_2:int=0)
        {
            this.posX = _arg_1;
            this.posY = _arg_2;
        }

        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readUnsignedInt();
            this.scene_id = _arg_1.readUnsignedShort();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeShort(this.scene_id);
            if (this.posX < 0){
                this.posX = 0;
            };
            _arg_1.writeShort(this.posX);
            if (this.posY < 0){
                this.posY = 0;
            };
            _arg_1.writeShort(this.posY);
        }

        public /*  ©init. */ function _SafeStr_864()
        {
        }


    }
}//package com.tencent.ai.core.protocol.cityContext

// _SafeStr_864 = " PSceneChangeProtocol" (String#16853)


