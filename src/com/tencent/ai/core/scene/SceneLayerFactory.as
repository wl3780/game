// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.SceneLayerFactory

package com.tencent.ai.core.scene
{
    import flash.utils.Dictionary;
    import com.tencent.ai.core.scene.layers.LayerTypeEnum;
    import com.tencent.ai.core.scene.layers.InteractLayer;
    import com.tencent.ai.core.scene.layers.BackgroundLayer;
    import com.tencent.ai.core.scene.layers.ForegroundLayer;
    import com.tencent.ai.core.enum.SceneLayerDef;
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.ai.core.data.SceneLayerInfo;
    import  ©init._SafeStr_1142;

    public class SceneLayerFactory 
    {

        private var hash:Dictionary;

        public function SceneLayerFactory()
        {
            this.hash = new Dictionary();
            this.hash[LayerTypeEnum.INTERACT_LAYER] = InteractLayer;
            this.hash[LayerTypeEnum.BACKGROUND_LAYER] = BackgroundLayer;
            this.hash[LayerTypeEnum.FOREGROUND_LAYER] = ForegroundLayer;
        }

        public function getLayerTypeByID(_arg_1:int):String
        {
            var _local_2 = "";
            switch (_arg_1){
                case SceneLayerDef.LAYER_GROUND:
                    _local_2 = LayerTypeEnum.INTERACT_LAYER;
                    break;
                case SceneLayerDef.LAYER_BACKGROUND:
                    _local_2 = LayerTypeEnum.BACKGROUND_LAYER;
                    break;
                case SceneLayerDef.LAYER_FOREGROUND:
                    _local_2 = LayerTypeEnum.FOREGROUND_LAYER;
                    break;
            };
            return (_local_2);
        }

        public function createSceneLayer(_arg_1:SceneLayerInfo):BaseSceneLayer
        {
            var _local_2:Class = this.hash[_arg_1.type];
            return ((CLASS.newInstance(_local_2) as BaseSceneLayer));
        }

        public /*  ©init. */ function _SafeStr_1142()
        {
        }


    }
}//package com.tencent.ai.core.scene

// _SafeStr_1142 = " SceneLayerFactory" (String#17336)


