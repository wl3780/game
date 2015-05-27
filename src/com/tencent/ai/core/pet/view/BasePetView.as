// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.pet.view.BasePetView

package com.tencent.ai.core.pet.view
{
    import com.tencent.ai.core.actor.BaseActorView;
    import com.tencent.ai.core.monster.res.MonsterAsset;
    import com.tencent.ai.core.monster.view.BaseMonsterBody;
    import com.tencent.ai.core.events.AssetLoadEvent;
    import com.tencent.free.logging.error;
    import com.tencent.ai.core.enum.VisibleValueDef;
    import  ©init._SafeStr_826;

    public class BasePetView extends BaseActorView 
    {

        protected var m_petAsset:MonsterAsset;
        protected var m_visibleValue:int;

        public function BasePetView()
        {
            super(new BaseMonsterBody());
        }

        protected function onAssetLoadComplete(_arg_1:AssetLoadEvent):void
        {
            m_body.update(this.m_petAsset.monsterLayerAssets);
            setHeadText(null);
        }

        public function addAsset(_arg_1:MonsterAsset):void
        {
            if (this.m_petAsset != null){
                error("[BasePetView] 已经存在一个PetAsset的实例请先用removeAsset 删除实例");
            };
            this.m_petAsset = _arg_1;
            if (_arg_1 != null){
                m_body.createLayers2(this.m_petAsset.assetLayerInfos, this.m_petAsset.mainLayerIndex);
                m_bodyMainRender = m_body.getMainLayer();
                m_body.setLayerAssets(this.m_petAsset.monsterLayerAssets);
                _arg_1.addEventListener(AssetLoadEvent.COMPLETE, this.onAssetLoadComplete);
                setHeadText(null);
            };
        }

        public function removeAsset():MonsterAsset
        {
            var _local_1:MonsterAsset = this.m_petAsset;
            if (this.m_petAsset != null){
                this.m_petAsset.removeEventListener(AssetLoadEvent.COMPLETE, this.onAssetLoadComplete);
                this.m_petAsset = null;
            };
            return (_local_1);
        }

        public function getAsset():MonsterAsset
        {
            return (this.m_petAsset);
        }

        public function setVisibleValue(_arg_1:int):void
        {
            if (this.m_visibleValue != _arg_1){
                this.m_visibleValue = _arg_1;
                if (this.m_visibleValue == VisibleValueDef.HEAD_VISIBLE){
                    m_viewDisplay.visible = true;
                    m_bodyDisplay.visible = false;
                } else {
                    if (this.m_visibleValue == VisibleValueDef.NOTHING_VISIBLE){
                        m_viewDisplay.visible = false;
                        m_bodyDisplay.visible = true;
                    } else {
                        m_viewDisplay.visible = true;
                        m_bodyDisplay.visible = true;
                    };
                };
            };
        }

        public function getVisibleValue():int
        {
            return (this.m_visibleValue);
        }

        public /*  ©init. */ function _SafeStr_826()
        {
        }


    }
}//package com.tencent.ai.core.pet.view

// _SafeStr_826 = " BasePetView" (String#14063)


