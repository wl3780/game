// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.items.MaskItem

package com.tencent.ai.core.scene.items
{
    import com.tencent.ai.core.scene.NormalItem;
    import com.tencent.ai.core.display.DisplaySystem;
    import com.tencent.ai.core.data.SceneItemInfo;
    import  ©init._SafeStr_1116;

    public class MaskItem extends NormalItem 
    {


        override public function initialize(_arg_1:SceneItemInfo):Boolean
        {
            super.initialize(_arg_1);
            this.m_display = DisplaySystem.createShape();
            return (true);
        }

        public /*  ©init. */ function _SafeStr_1116()
        {
        }


    }
}//package com.tencent.ai.core.scene.items

// _SafeStr_1116 = " MaskItem" (String#14717)


