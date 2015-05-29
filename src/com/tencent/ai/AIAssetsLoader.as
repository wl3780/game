package com.tencent.ai
{
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.asset.IAsset;
    import com.tencent.ai.core.asset.prepare.AssetPrepare;
    import com.tencent.ai.core.effect.IEffectManager;
    import com.tencent.ai.core.enum.AssetLoadType;
    import com.tencent.ai.core.events.AssetLoadEvent;
    import com.tencent.ai.core.interact.IInteractItemAssetManager;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.sound.ISoundAssetManager;
    import com.tencent.free.logging.debug;
    import com.tencent.free.logging.error;
    
    import flash.events.EventDispatcher;

    public class AIAssetsLoader extends EventDispatcher 
    {

        protected var m_data:IDataManager;
        protected var m_effect:IEffectManager;
        protected var m_interactItemAssetManager:IInteractItemAssetManager;
        protected var m_soundAssetManager:ISoundAssetManager;
        protected var m_assetsPrepare:AssetPrepare;
        
		private var _bar:AssetLoadingView;
        private var _showBar:Boolean;


        public function start(_arg_1:Boolean=true):void
        {
            this.m_data = AICore.data;
            this.m_effect = AICore.effect;
            this.m_interactItemAssetManager = AICore.interactItemSystem.getResource();
            this.m_soundAssetManager = AICore.sound.getResource();
            this._showBar = _arg_1;
            if (this._showBar){
                this.loadingBar.show();
                this.loadingBar.setInfo("加载必备资源中...");
            };
            var _local_2:Array = [];
            _local_2 = _local_2.concat(this.m_effect.getEffectAssets(AssetLoadType.TYPE_CITY_LOAD));
            this.assetSaveSO(_local_2);
            _local_2 = _local_2.concat(this.m_interactItemAssetManager.getInteractItemAssets(AssetLoadType.TYPE_CITY_LOAD));
            this.assetSaveSO(_local_2);
            _local_2 = _local_2.concat(this.m_soundAssetManager.getSoundAssets(AssetLoadType.TYPE_CITY_LOAD));
            this.assetSaveSO(_local_2);
            _local_2 = _local_2.concat(AICore.playerSystem.getResource().equipAssetManager.getCityRefAssets());
            this.m_assetsPrepare = new AssetPrepare();
            this.m_assetsPrepare.addEventListener(AssetLoadEvent.LOAD_PROCESS, this.onAssetLoadProcess);
            this.m_assetsPrepare.addEventListener(AssetLoadEvent.ERROR, this.onAssetLoadError);
            this.m_assetsPrepare.addEventListener(AssetLoadEvent.COMPLETE, this.onAssetLoadComplete);
            this.m_assetsPrepare.prepare(_local_2);
            this.m_assetsPrepare.start();
        }

        private function assetSaveSO(_arg_1:Array):void
        {
            var _local_2:IAsset;
            for each (_local_2 in _arg_1) {
                _local_2.saveSO = true;
            };
        }

        protected function onAssetLoadError(_arg_1:AssetLoadEvent):void
        {
            error((("[AIAssetsLoader] ######资源准备失败[" + _arg_1.message) + "]#######"));
            if (this._showBar){
                this.loadingBar.setInfo(("[错误] " + _arg_1.message));
            };
        }

        protected function onAssetLoadProcess(_arg_1:AssetLoadEvent):void
        {
            debug("[AIAssetsLoader] 资源准备进度:", _arg_1.loadedItem, _arg_1.totalItem);
            if (this._showBar){
                this.loadingBar.setProgress((_arg_1.loadedItem / _arg_1.totalItem));
            };
        }

        protected function onAssetLoadComplete(_arg_1:AssetLoadEvent):void
        {
            debug("[AIAssetsLoader] 资源准备成功");
            if (this._showBar){
                this.loadingBar.hide();
            };
            dispatchEvent(new AssetLoadEvent(AssetLoadEvent.COMPLETE));
        }

        protected function get loadingBar():AssetLoadingView
        {
            if (this._bar == null){
                this._bar = UIManager.getInstance().getLoadingView();
            };
            return (this._bar);
        }

        public /*  ©init. */ function _SafeStr_3()
        {
        }


    }
}//package com.tencent.ai

// _SafeStr_3 = " AIAssetsLoader" (String#14630)


