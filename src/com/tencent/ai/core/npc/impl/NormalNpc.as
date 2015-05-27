// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.npc.impl.NormalNpc

package com.tencent.ai.core.npc.impl
{
    import com.tencent.ai.core.npc.BaseNpc;
    import com.tencent.ai.core.npc.view.NormalNpcView;
    import com.tencent.ai.core.npc.INpcAssetManager;
    import com.tencent.ai.core.data.SceneNpcInfo;
    import  ©init._SafeStr_809;

    public class NormalNpc extends BaseNpc 
    {

        protected var m_view:NormalNpcView;


        override protected function initThis():void
        {
            super.initThis();
            this.m_view = new NormalNpcView(this);
            this.view = this.m_view;
            this.m_display = this.view.getDisplay();
        }

        override public function setNpcAssetManger(_arg_1:INpcAssetManager):void
        {
            super.setNpcAssetManger(_arg_1);
            this.m_view.setNpcAssetManager(_arg_1);
        }

        override public function initialize(_arg_1:SceneNpcInfo):void
        {
            super.initialize(_arg_1);
            this.m_view.loadAsset(_arg_1.id, _arg_1.npcModel.staticInfo);
        }

        override public function render(_arg_1:int):void
        {
            super.render(_arg_1);
            this.m_view.render(_arg_1);
        }

        override public function changeStatus(_arg_1:int):void
        {
            this.m_view.changeStatus(_arg_1);
        }

        override public function dispose():void
        {
            this.m_view = null;
            super.dispose();
        }

        public /*  ©init. */ function _SafeStr_809()
        {
        }


    }
}//package com.tencent.ai.core.npc.impl

// _SafeStr_809 = " NormalNpc" (String#14900)


