// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.EffectAsset

package com.tencent.ai.core.effect
{
    import com.tencent.ai.core.asset.BaseAsset;
    import com.tencent.ai.core.data.EffectStaticInfo;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.manager.moviepackage.MoviePackageLoader;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.AssetPart;
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.free.utils.asynInvoke;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.manager.moviepackage.impl.MoviePackageFile;
    import  ©init._SafeStr_388;

    public class EffectAsset extends BaseAsset 
    {

        public var id:int;
        public var info:EffectStaticInfo;
        public var url:String;
        protected var key:String;
        public var particleInfos:Dictionary;
        protected var mpLoader:MoviePackageLoader;

        public function EffectAsset(_arg_1:EffectStaticInfo)
        {
            this.id = _arg_1.id;
            this.url = ((DEFINE.ASSET_EFFECT_SRC + this.id) + AssetPart.BASE_URL);
            this.key = this.url;
            this.info = _arg_1;
        }

        protected function listen(_arg_1:Boolean):void
        {
            if (this.mpLoader == null){
                return;
            };
            var _local_2:IContent = this.mpLoader.content;
            if (!_local_2){
                return;
            };
            if (_arg_1){
                _local_2.addEventListener(TaskEvent.COMPLETE, this.onMotionsPackageComplete);
                _local_2.addEventListener(TaskEvent.IO_ERROR, this.onMotionsPackageError);
                _local_2.addEventListener(TaskEvent.PROGRESS, this.onMotionsPackageProgress);
            } else {
                _local_2.removeEventListener(TaskEvent.COMPLETE, this.onMotionsPackageComplete);
                _local_2.removeEventListener(TaskEvent.IO_ERROR, this.onMotionsPackageError);
                _local_2.removeEventListener(TaskEvent.PROGRESS, this.onMotionsPackageProgress);
            };
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
            this.mpLoader = new MoviePackageLoader(this.key);
            this.mpLoader.priority = priority;
            this.mpLoader.url = this.url;
            this.mpLoader.saveSO = this.m_bSaveSO;
            this.listen(true);
            this.mpLoader.load();
        }

        override public function unload():void
        {
            ((m_isLoading) && (this.listen(false)));
            if (this.mpLoader != null){
                this.mpLoader.unload();
                this.mpLoader = null;
            };
            this.info = null;
            super.unload();
        }

        public function onMotionsPackageComplete(_arg_1:TaskEvent):void
        {
            m_isLoading = false;
            m_isLoaded = true;
            this.listen(false);
            motionAssets = MoviePackageFile(this.mpLoader.content).motionAssets;
            this.particleInfos = MoviePackageFile(this.mpLoader.content).particleInfos;
            assetLoaded();
        }

        public function onMotionsPackageError(_arg_1:TaskEvent):void
        {
            m_isLoading = false;
            this.listen(false);
            onError(this.key, -1);
        }

        public function onMotionsPackageProgress(_arg_1:TaskEvent):void
        {
            onProgress(String(_arg_1.key), _arg_1.bytesLoaded, _arg_1.bytesTotal);
        }

        override public function toString():String
        {
            return ((((("特效资源 { name:" + this.info.name) + ", ID:") + this.id) + "}"));
        }

        public /*  ©init. */ function _SafeStr_388()
        {
        }


    }
}//package com.tencent.ai.core.effect

// _SafeStr_388 = " EffectAsset" (String#14591)


