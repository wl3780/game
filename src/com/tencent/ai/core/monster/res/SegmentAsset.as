// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.res.SegmentAsset

package com.tencent.ai.core.monster.res
{
    import com.tencent.ai.core.asset.BaseAsset;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.manager.moviepackage.MoviePackageLoader;
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.ai.core.manager.moviepackage.IMoviePackageFile;
    import com.tencent.free.utils.asynInvoke;
    import com.tencent.free.utils.CFunction;
    import  ©init._SafeStr_783;

    public class SegmentAsset extends BaseAsset 
    {

        public var segURL:String;
        public var layerAssetsDict:Dictionary;
        private var _key:String;
        private var _movieLoader:MoviePackageLoader;

        public function SegmentAsset(_arg_1:String)
        {
            this.segURL = _arg_1;
            this.initThis();
        }

        private function initThis():void
        {
            this._key = this.segURL;
            m_isLoading = false;
            m_isLoaded = false;
        }

        private function listen(_arg_1:Boolean):void
        {
            var _local_2:IContent;
            if (this._movieLoader != null){
                _local_2 = this._movieLoader.content;
                if (_local_2 != null){
                    if (_arg_1){
                        _local_2.addEventListener(TaskEvent.COMPLETE, this.onMoviePackageComplete);
                        _local_2.addEventListener(TaskEvent.IO_ERROR, this.onMoviePackageError);
                        _local_2.addEventListener(TaskEvent.PROGRESS, this.onMoviePackageProgress);
                    } else {
                        _local_2.removeEventListener(TaskEvent.COMPLETE, this.onMoviePackageComplete);
                        _local_2.removeEventListener(TaskEvent.IO_ERROR, this.onMoviePackageError);
                        _local_2.removeEventListener(TaskEvent.PROGRESS, this.onMoviePackageProgress);
                    };
                };
            };
        }

        private function onMoviePackageComplete(_arg_1:TaskEvent):void
        {
            m_isLoading = false;
            m_isLoaded = true;
            this.listen(false);
            var _local_2:IMoviePackageFile = IMoviePackageFile(this._movieLoader.content);
            motionAssets = _local_2.motionAssets;
            this.layerAssetsDict = _local_2.layerAssets;
            assetLoaded();
        }

        private function onMoviePackageError(_arg_1:TaskEvent):void
        {
            m_isLoading = false;
            this.listen(false);
            if (this._movieLoader != null){
                this._movieLoader.unload();
                this._movieLoader = null;
            };
            onError(this._key, -1);
        }

        private function onMoviePackageProgress(_arg_1:TaskEvent):void
        {
            onProgress(String(_arg_1.key), _arg_1.bytesLoaded, _arg_1.bytesTotal);
        }

        override public function load(... _args):void
        {
            if (m_isLoading){
                return;
            };
            if (m_isLoaded){
                asynInvoke(new CFunction(assetLoaded, this));
                return;
            };
            m_isLoading = true;
            this._movieLoader = new MoviePackageLoader(this._key);
            this._movieLoader.priority = priority;
            this._movieLoader.url = this.segURL;
            this._movieLoader.saveSO = this.m_bSaveSO;
            this.listen(true);
            this._movieLoader.load();
        }

        override public function unload():void
        {
            this.listen(false);
            if (this._movieLoader != null){
                this._movieLoader.unload();
                this._movieLoader = null;
            };
            this.layerAssetsDict = null;
            super.unload();
        }

        public /*  ©init. */ function _SafeStr_783()
        {
        }


    }
}//package com.tencent.ai.core.monster.res

// _SafeStr_783 = " SegmentAsset" (String#17186)


