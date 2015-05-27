// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.view.BaseMonsterBody

package com.tencent.ai.core.monster.view
{
    import com.tencent.ai.core.render.BodyViewMultiLayer;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.render.LayerAsset;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.render.ILayerRender;
    import  ©init._SafeStr_784;
    import __AS3__.vec.*;

    public class BaseMonsterBody extends BodyViewMultiLayer 
    {

        public function BaseMonsterBody(_arg_1:Vector.<LayerAsset>=null)
        {
            super(_arg_1);
        }

        override protected function createLayers():void
        {
            m_layerAssetsMap = new Dictionary();
            m_layerRenders = new Vector.<ILayerRender>();
        }

        public /*  ©init. */ function _SafeStr_784()
        {
        }


    }
}//package com.tencent.ai.core.monster.view

// _SafeStr_784 = " BaseMonsterBody" (String#16553)


