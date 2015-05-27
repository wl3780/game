// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.MapDataInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_269;

    public class MapDataInfo implements IXMLSerialize 
    {

        public var id:int = 1;
        public var needLvl:int = 0;
        public var assetName:String = "";
        public var npcs:XMLList;
        public var rooms:XMLList;


        public function decode(_arg_1:XML):void
        {
            this.id = _arg_1.@id;
            this.needLvl = _arg_1.@needLvl;
            this.assetName = _arg_1.mapAssetName.toString();
            this.npcs = _arg_1.npc;
            this.rooms = _arg_1.room;
        }

        public function encode()
        {
            return (null);
        }

        public /*  ©init. */ function _SafeStr_269()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_269 = " MapDataInfo" (String#15170)


