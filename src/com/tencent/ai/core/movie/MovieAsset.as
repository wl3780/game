// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.movie.MovieAsset

package com.tencent.ai.core.movie
{
    import com.tencent.ai.core.asset.BaseAsset;
    import com.tencent.ai.core.data.MovieStaticInfo;
    import com.tencent.free.core.swf.ISwf;
    import com.tencent.free.core.swf.SwfFileLoader;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.free.core.events.SwfLoadEvent;
    import com.tencent.free.utils.asynInvoke;
    import com.tencent.free.utils.CFunction;
    import  ©init._SafeStr_790;

    public class MovieAsset extends BaseAsset 
    {

        public var movieInfo:MovieStaticInfo;
        public var url:String;
        public var file:ISwf;
        protected var swfloader:SwfFileLoader;

        public function MovieAsset(_arg_1:MovieStaticInfo)
        {
            this.movieInfo = _arg_1;
            if (_arg_1.fileType != 5){
                this.url = (DEFINE.MOVIE_RES_SRC + _arg_1.url);
            } else {
                this.url = _arg_1.url;
            };
        }

        protected function onSwfLoadComplete(_arg_1:SwfLoadEvent):void
        {
            m_isLoading = false;
            m_isLoaded = true;
            this.file.removeEventListener(SwfLoadEvent.PROGRESS, this.onSwfLoadProgress);
            this.file.removeEventListener(SwfLoadEvent.COMPLETE, this.onSwfLoadComplete);
            this.file.removeEventListener(SwfLoadEvent.ERROR, this.onSwfLoadError);
            if (_arg_1){
                assetLoaded();
            };
        }

        protected function onSwfLoadProgress(_arg_1:SwfLoadEvent):void
        {
            onProgress(_arg_1.key, _arg_1.bytesLoaded, _arg_1.bytesTotal);
        }

        protected function onSwfLoadError(_arg_1:SwfLoadEvent):void
        {
            this.onSwfLoadComplete(null);
            onError(_arg_1.key, _arg_1.code);
        }

        override public function load(... _args):void
        {
            if (getIsLoaded()){
                asynInvoke(new CFunction(assetLoaded, this));
                return;
            };
            if (m_isLoading){
                return;
            };
            m_isLoading = true;
            this.swfloader = new SwfFileLoader(this.url);
            this.swfloader.url = this.url;
            this.swfloader.saveSO = m_bSaveSO;
            this.file = (this.swfloader.content as ISwf);
            this.file.addEventListener(SwfLoadEvent.PROGRESS, this.onSwfLoadProgress);
            this.file.addEventListener(SwfLoadEvent.COMPLETE, this.onSwfLoadComplete);
            this.file.addEventListener(SwfLoadEvent.ERROR, this.onSwfLoadError);
            this.swfloader.load();
        }

        override public function unload():void
        {
            if (m_isLoading){
                this.onSwfLoadComplete(null);
            };
            if (this.swfloader != null){
                this.swfloader.unload();
                this.swfloader = null;
            };
            super.unload();
        }

        public /*  ©init. */ function _SafeStr_790()
        {
        }


    }
}//package com.tencent.ai.core.movie

// _SafeStr_790 = " MovieAsset" (String#17180)


