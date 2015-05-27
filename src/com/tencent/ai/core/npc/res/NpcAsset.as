// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.npc.res.NpcAsset

package com.tencent.ai.core.npc.res
{
    import com.tencent.ai.core.asset.BaseAsset;
    import com.tencent.ai.core.manager.moviepackage.MoviePackageLoader;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.ai.core.manager.moviepackage.IMoviePackageFile;
    import com.tencent.free.utils.asynInvoke;
    import com.tencent.free.utils.CFunction;
    import  ©init._SafeStr_814;

    public class NpcAsset extends BaseAsset 
    {

        public var npcID:int;
        public var assetURL:String;
        protected var url:String;
        protected var key:String;
        protected var mpLoader:MoviePackageLoader;

        public function NpcAsset(_arg_1:int, _arg_2:String)
        {
            this.npcID = _arg_1;
            this.key = (DEFINE.NPC_RES_SRC + _arg_2);
            this.assetURL = this.key;
            this.url = this.assetURL;
        }

        protected function listen(_arg_1:Boolean):void
        {
            if (this.mpLoader == null){
                return;
            };
            var _local_2:IContent = this.mpLoader.content;
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

        public function onMotionsPackageComplete(_arg_1:TaskEvent):void
        {
            m_isLoading = false;
            m_isLoaded = true;
            this.listen(false);
            var _local_2:IMoviePackageFile = IMoviePackageFile(this.mpLoader.content);
            motionAssets = _local_2.motionAssets;
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

        override public function load(... _args):void
        {
            if (((m_isLoading) || (m_isLoaded))){
                if (m_isLoaded){
                    asynInvoke(new CFunction(assetLoaded, this));
                };
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

        override public function toString():String
        {
            return ((((("NPC资源:id" + this.npcID) + " url: ") + this.url) + "}"));
        }

        public /*  ©init. */ function _SafeStr_814()
        {
        }


    }
}//package com.tencent.ai.core.npc.res

// _SafeStr_814 = " NpcAsset" (String#16052)


