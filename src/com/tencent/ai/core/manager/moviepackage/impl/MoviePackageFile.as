// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.moviepackage.impl.MoviePackageFile

package com.tencent.ai.core.manager.moviepackage.impl
{
    import com.tencent.ai.core.manager.motionspackage.impl.MotionsPackageFile;
    import com.tencent.ai.core.manager.moviepackage.IMoviePackageFile;
    import com.tencent.ai.core.asset.config.MoviePackage;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.manager.framespackage.IFramesPackageFile;
    import com.tencent.free.core.manager.loader.ILoader;
    import com.tencent.ai.core.manager.framespackage.FramesAssetFile;
    import com.tencent.ai.core.manager.framespackage.FrameFile;
    import com.tencent.ai.core.render.LayerAsset;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.asset.config.LayerTemplate;
    import com.tencent.ai.core.asset.config.ParticleData;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.free.logging.warning;
    import com.tencent.ai.core.asset.config.MotionsPackage;
    import  ©init._SafeStr_677;

    public class MoviePackageFile extends MotionsPackageFile implements IMoviePackageFile 
    {

        protected var _moviePackage:MoviePackage;
        protected var _particleInfos:Dictionary;
        protected var _layerAssets:Dictionary;
        protected var _refFPF:IFramesPackageFile;
        protected var _useRefXMLMovie:Boolean;

        public function MoviePackageFile(_arg_1:*)
        {
            super(_arg_1);
            this._useRefXMLMovie = false;
        }

        override protected function updateInfo(_arg_1:ILoader):void
        {
            super.updateInfo(_arg_1);
            var _local_2:Object = _arg_1.loadInfo;
            if (_local_2 != null){
                this._refFPF = _local_2.refFPF;
                this._useRefXMLMovie = _local_2.useRefXMLMovie;
            };
        }

        public function get moviePackage():MoviePackage
        {
            return (this._moviePackage);
        }

        public function get particleInfos():Dictionary
        {
            return (this._particleInfos);
        }

        public function get layerAssets():Dictionary
        {
            return (this._layerAssets);
        }

        override protected function notFoundFrameFile(_arg_1:int, _arg_2:int):FrameFile
        {
            var _local_3:FramesAssetFile;
            if (this._refFPF != null){
                _local_3 = this._refFPF.framesAssetFiles[_arg_1];
                return (_local_3.getFrameFile(_arg_2));
            };
            return (null);
        }

        override protected function process():void
        {
            var _local_1:LayerAsset;
            var _local_5:XML;
            var _local_6:Vector.<LayerTemplate>;
            var _local_7:int;
            var _local_8:int;
            var _local_9:ParticleData;
            var _local_10:LayerTemplate;
            var _local_11:LayerAsset;
            _fpFile = (_fploader.content as IFramesPackageFile);
            this._moviePackage = new MoviePackage();
            this._layerAssets = new Dictionary();
            var _local_2:IFramesPackageFile = ((this._useRefXMLMovie) ? this._refFPF : _fpFile);
            var _local_3:Object = _local_2.findFile(Constants.ASSET_XMLMOVIE_NAME);
            if (_local_3 != null){
                _local_5 = new XML(_local_3);
                this._moviePackage.decode(_local_5);
                _local_6 = this._moviePackage.movieLayers;
                _local_7 = _local_6.length;
                _local_8 = 0;
                while (_local_8 < _local_7) {
                    _local_10 = _local_6[_local_8];
                    _local_11 = new LayerAsset();
                    _local_11.layerID = _local_10.id;
                    _local_11.name = _local_10.name;
                    _local_11.mainlayer = _local_10.mainlayer;
                    _local_11.motionAssets = buildMotionAssets(_local_10.motionsPackage.motionTemplates);
                    this._layerAssets[_local_11.layerID] = _local_11;
                    _local_8++;
                };
                _local_9 = this._moviePackage.particleData;
                if (_local_9 != null){
                    this._particleInfos = new Dictionary();
                    _local_7 = _local_9.particleInfos.length;
                    _local_8 = 0;
                    while (_local_8 < _local_7) {
                        this._particleInfos[_local_9.particleInfos[_local_8].id] = _local_9.particleInfos[_local_8];
                        _local_8++;
                    };
                };
            } else {
                warning(("[MoviePackageFile] 旧资源格式:" + key));
                _motionsPackage = new MotionsPackage();
                _motionsPackage.decode(new XML(_fpFile.findFile(Constants.ASSET_XMLMOTIONS_NAME)));
                _motionAssets = buildMotionAssets(_motionsPackage.motionTemplates);
                _local_1 = new LayerAsset();
                _local_1.layerID = 0;
                _local_1.motionAssets = _motionAssets;
                this._layerAssets[_local_1.layerID] = _local_1;
            };
            var _local_4:LayerAsset = this._layerAssets[0];
            _motionAssets = (((_local_4 == null)) ? null : _local_4.motionAssets);
        }

        override public function release():void
        {
            this._moviePackage = null;
            this._layerAssets = null;
            super.release();
        }

        public /*  ©init. */ function _SafeStr_677()
        {
        }


    }
}//package com.tencent.ai.core.manager.moviepackage.impl

// _namespace_4 = "com.tencent.free.core.manager.loader:ILoader"


// _SafeStr_677 = " MoviePackageFile" (String#16106)


