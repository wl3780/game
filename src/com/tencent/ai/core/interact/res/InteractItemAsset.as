// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.res.InteractItemAsset

package com.tencent.ai.core.interact.res
{
    import com.tencent.ai.core.asset.BaseAsset;
    import com.tencent.ai.core.data.InteractItemStaticInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.render.LayerAsset;
    import com.tencent.ai.core.manager.moviepackage.MoviePackageLoader;
    import com.tencent.ai.core.interact.IInteractItemSystem;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.free.utils.asynInvoke;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.manager.moviepackage.IMoviePackageFile;
    import  ©init._SafeStr_577;
    import __AS3__.vec.*;

    public class InteractItemAsset extends BaseAsset 
    {

        public var assetID:int;
        public var id:int;
        public var type:int;
        public var staticInfo:InteractItemStaticInfo;
        public var interactItemLayerAssets:Vector.<LayerAsset>;
        public var url:String;
        protected var key:String;
        protected var movieLoader:MoviePackageLoader;
        protected var interactItemSys:IInteractItemSystem;

        public function InteractItemAsset(_arg_1:InteractItemStaticInfo, _arg_2:IInteractItemSystem)
        {
            this.staticInfo = _arg_1;
            this.interactItemSys = _arg_2;
            this.initThis();
        }

        protected function initThis():void
        {
            this.assetID = this.staticInfo.assetID;
            this.id = this.staticInfo.id;
            this.type = this.staticInfo.type;
            this.url = ((DEFINE.INTERACT_RES_SRC + this.assetID) + ".swf");
            this.key = this.url;
            m_isLoading = false;
            m_isLoaded = false;
        }

        protected function listen(_arg_1:Boolean):void
        {
            if (this.movieLoader == null){
                return;
            };
            var _local_2:IContent = this.movieLoader.content;
            if (!_local_2){
                return;
            };
            if (_arg_1){
                _local_2.addEventListener(TaskEvent.COMPLETE, this.onMoviePackageComplete);
                _local_2.addEventListener(TaskEvent.IO_ERROR, this.onMoviePackageError);
                _local_2.addEventListener(TaskEvent.PROGRESS, this.onMoviePackageProgress);
            } else {
                _local_2.removeEventListener(TaskEvent.COMPLETE, this.onMoviePackageComplete);
                _local_2.removeEventListener(TaskEvent.IO_ERROR, this.onMoviePackageError);
                _local_2.removeEventListener(TaskEvent.PROGRESS, this.onMoviePackageProgress);
            };
        }

        override public function load(... _args):void
        {
            if (m_isLoading){
                return;
            };
            if (this.staticInfo.assetID == 0){
                m_isLoaded = true;
            };
            if (m_isLoaded){
                asynInvoke(new CFunction(assetLoaded, this));
                return;
            };
            m_isLoading = true;
            this.movieLoader = new MoviePackageLoader(this.key);
            this.movieLoader.priority = priority;
            this.movieLoader.url = this.url;
            this.movieLoader.saveSO = this.m_bSaveSO;
            this.listen(true);
            this.movieLoader.load();
        }

        override public function unload():void
        {
            if (this.movieLoader){
                ((m_isLoading) && (this.listen(false)));
                this.movieLoader.unload();
                this.movieLoader = null;
                this.staticInfo = null;
                this.interactItemLayerAssets = null;
                this.interactItemSys = null;
            };
            super.unload();
        }

        public function onMoviePackageComplete(_arg_1:TaskEvent):void
        {
            var _local_3:LayerAsset;
            m_isLoading = false;
            m_isLoaded = true;
            this.listen(false);
            var _local_2:IMoviePackageFile = IMoviePackageFile(this.movieLoader.content);
            this.interactItemLayerAssets = new Vector.<LayerAsset>();
            motionAssets = _local_2.motionAssets;
            for each (_local_3 in _local_2.layerAssets) {
                this.interactItemLayerAssets.push(_local_3);
            };
            assetLoaded();
        }

        public function onMoviePackageError(_arg_1:TaskEvent):void
        {
            m_isLoading = false;
            this.listen(false);
            onError(this.key, -1);
        }

        public function onMoviePackageProgress(_arg_1:TaskEvent):void
        {
            onProgress(String(_arg_1.key), _arg_1.bytesLoaded, _arg_1.bytesTotal);
        }

        override public function toString():String
        {
            return ((((((("交互物件资源 { name:" + this.staticInfo.name) + ", id:") + this.id) + ", assetID:") + this.assetID) + "}"));
        }

        public /*  ©init. */ function _SafeStr_577()
        {
        }


    }
}//package com.tencent.ai.core.interact.res

// _SafeStr_577 = " InteractItemAsset" (String#14795)


