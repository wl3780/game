// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.layers.InteractLayer

package com.tencent.ai.core.scene.layers
{
    import com.tencent.ai.core.scene.BaseSceneLayer;
    import  ©init._SafeStr_1119;

    public class InteractLayer extends BaseSceneLayer 
    {

        private static const NUM_FRAME:int = 5;

        private var currentNumFrame:int = 0;


        override public function render(_arg_1:int):void
        {
            super.render(_arg_1);
            var _local_2 = this;
            var _local_3 = (_local_2.currentNumFrame + 1);
            _local_2.currentNumFrame = _local_3;
            if (this.currentNumFrame > NUM_FRAME){
                this.sort();
                this.currentNumFrame = 0;
            };
        }

        public /*  ©init. */ function _SafeStr_1119()
        {
        }


    }
}//package com.tencent.ai.core.scene.layers

// _SafeStr_1119 = " InteractLayer" (String#13976)


