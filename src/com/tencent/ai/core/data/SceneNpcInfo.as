// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SceneNpcInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.npc.NpcModel;
    import  ©init._SafeStr_322;

    public class SceneNpcInfo implements IXMLSerialize 
    {

        public var id:int;
        public var direction:int = 1;
        public var mapPosition:MapPosition;
        public var npcModel:NpcModel;


        public function decode(_arg_1:XML):void
        {
            this.id = _arg_1.@id;
            this.mapPosition = MapPosition.DecodeXML(_arg_1);
            this.direction = ((_arg_1.hasOwnProperty("@direction")) ? int(_arg_1.@direction) : 1);
        }

        public function encode()
        {
            return (null);
        }

        public /*  ©init. */ function _SafeStr_322()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_322 = " SceneNpcInfo" (String#16172)


