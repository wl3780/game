// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.view.InteractItemBody

package com.tencent.ai.core.interact.view
{
    import com.tencent.ai.core.render.BodyViewMultiLayer;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.render.LayerAsset;
    import com.tencent.ai.core.display.DisplaySystem;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.render.ILayerRender;
    import  ©init._SafeStr_580;
    import __AS3__.vec.*;

    public class InteractItemBody extends BodyViewMultiLayer 
    {

        public function InteractItemBody(_arg_1:Vector.<LayerAsset>=null)
        {
            super(_arg_1);
        }

        override protected function createLayers():void
        {
            m_mainLayer = DisplaySystem.createLayerRender();
            m_mainLayer.layerID = 0;
            m_display.addDisplay(m_mainLayer);
            m_layerCount = 1;
            m_layerAssetsMap = new Dictionary();
            m_layerRenders = new Vector.<ILayerRender>(m_layerCount);
            m_layerRenders[0] = m_mainLayer;
        }

        public /*  ©init. */ function _SafeStr_580()
        {
        }


    }
}//package com.tencent.ai.core.interact.view

// _SafeStr_580 = " InteractItemBody" (String#15347)


