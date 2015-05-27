// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallChangeSceneArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_176;

    public class CallChangeSceneArg implements IXMLSerialize 
    {

        public var sceneID:int;
        public var posX:int;
        public var posY:int;

        public function CallChangeSceneArg(_arg_1:int=0, _arg_2:int=0, _arg_3:int=0)
        {
            this.sceneID = _arg_1;
            this.posX = _arg_2;
            this.posY = _arg_3;
        }

        public function decode(_arg_1:XML):void
        {
            this.sceneID = int(_arg_1.@sceneID);
            this.posX = int(_arg_1.@posX);
            this.posY = int(_arg_1.@posY);
        }

        public function encode()
        {
            var _local_1:XML = <PluginArg/>
            ;
            _local_1.@sceneID = this.sceneID;
            _local_1.@posX = this.posX;
            _local_1.@posY = this.posY;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_176()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_176 = " CallChangeSceneArg" (String#14768)


