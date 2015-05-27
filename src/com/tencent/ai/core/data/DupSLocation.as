// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.DupSLocation

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_239;
    import __AS3__.vec.*;

    public class DupSLocation implements IXMLSerialize 
    {

        public static const SID_UP:int = 0;
        public static const SID_DOWN:int = 1;
        public static const SID_LEFT:int = 2;
        public static const SID_RIGHT:int = 3;

        public var sceneID:int;
        public var isBoss:Boolean;
        public var paths:Vector.<int>;

        public function DupSLocation()
        {
            this.paths = new Vector.<int>(4);
            super();
        }

        public function decode(_arg_1:XML):void
        {
            this.sceneID = int(_arg_1.@sceneID);
            this.paths[0] = int(_arg_1.@u);
            this.paths[1] = int(_arg_1.@d);
            this.paths[2] = int(_arg_1.@l);
            this.paths[3] = int(_arg_1.@r);
            this.isBoss = (String(_arg_1.@isBoss) == "true");
        }

        public function encode()
        {
            var _local_1:XML = <SceneLocation/>
            ;
            _local_1.@sceneID = this.sceneID;
            _local_1.@u = (((this.paths[0] == 0)) ? "" : this.paths[0]);
            _local_1.@d = (((this.paths[1] == 0)) ? "" : (this.paths[1]));
            _local_1.@l = (((this.paths[2] == 0)) ? "" : this.paths[2]);
            _local_1.@r = (((this.paths[3] == 0)) ? "" : this.paths[3]);
            if (this.isBoss){
                _local_1.@isBoss = "true";
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_239()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_239 = " DupSLocation" (String#14996)


