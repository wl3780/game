// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.view.BaseMonsterView

package com.tencent.ai.core.monster.view
{
    import com.tencent.ai.core.actor.BaseActorView;
    import com.tencent.ai.core.monster.res.MonsterAsset;
    import flash.display.Bitmap;
    import com.tencent.ai.core.manager.icon.IconLoader;
    import com.tencent.ai.core.events.AssetLoadEvent;
    import com.tencent.free.logging.error;
    import flash.display.Sprite;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.ai.core.manager.icon.IIcon;
    import  ©init._SafeStr_785;

    public class BaseMonsterView extends BaseActorView 
    {

        protected var m_monsterAsset:MonsterAsset;
        protected var m_icon:Bitmap;
        protected var m_iconLoader:IconLoader;

        public function BaseMonsterView()
        {
            super(new BaseMonsterBody());
        }

        protected function onAssetLoadComplete(_arg_1:AssetLoadEvent):void
        {
            m_body.update(this.m_monsterAsset.monsterLayerAssets);
            setHeadText(null);
        }

        public function addAsset(_arg_1:MonsterAsset):void
        {
            if (this.m_monsterAsset != null){
                error("[BaseMonsterView] 已经存在一个MonsterAsset的实例请先用removeAsset 删除实例");
            };
            this.m_monsterAsset = _arg_1;
            if (_arg_1 != null){
                m_body.createLayers2(_arg_1.assetLayerInfos, _arg_1.mainLayerIndex);
                m_bodyMainRender = m_body.getMainLayer();
                m_body.setLayerAssets(_arg_1.monsterLayerAssets);
                _arg_1.addEventListener(AssetLoadEvent.COMPLETE, this.onAssetLoadComplete);
                setHeadText(null);
            };
        }

        public function removeAsset():MonsterAsset
        {
            var _local_1:MonsterAsset = this.m_monsterAsset;
            if (this.m_monsterAsset != null){
                this.m_monsterAsset.removeEventListener(AssetLoadEvent.COMPLETE, this.onAssetLoadComplete);
                this.m_monsterAsset = null;
            };
            return (_local_1);
        }

        public function getAsset():MonsterAsset
        {
            return (this.m_monsterAsset);
        }

        public function addCatchIcon():void
        {
            var _local_1:Sprite;
            if (!this.m_icon){
                _local_1 = (this.m_viewDisplay as Sprite);
                this.m_icon = new Bitmap();
                this.m_icon.y = (-40 - this.height);
                this.m_icon.x = -28;
                this.m_iconLoader = new IconLoader("", (DEFINE.ICON_RES_SRC + "monster/catch.png"));
                this.m_iconLoader.retryTimes = 0;
                this.m_iconLoader.content.addEventListener(TaskEvent.COMPLETE, this.onHeadIconLoaded);
                this.m_iconLoader.load();
                _local_1.addChildAt(this.m_icon, 0);
            };
        }

        public function removeCatchIcon():void
        {
            var _local_1:Sprite;
            if (this.m_icon){
                _local_1 = (this.m_viewDisplay as Sprite);
                _local_1.removeChild(this.m_icon);
                this.m_icon.bitmapData = null;
                this.m_icon = null;
            };
            if (this.m_iconLoader){
                this.m_iconLoader.content.removeEventListener(TaskEvent.COMPLETE, this.onHeadIconLoaded);
                this.m_iconLoader.unload();
                this.m_iconLoader = null;
            };
        }

        private function onHeadIconLoaded(_arg_1:TaskEvent):void
        {
            var _local_2:IIcon = (this.m_iconLoader.content as IIcon);
            if (this.m_icon){
                this.m_icon.bitmapData = _local_2.icon;
            };
        }

        override public function reset():void
        {
            this.removeCatchIcon();
            m_bodyMainRender = null;
            super.reset();
        }

        public /*  ©init. */ function _SafeStr_785()
        {
        }


    }
}//package com.tencent.ai.core.monster.view

// _SafeStr_785 = " BaseMonsterView" (String#17003)


