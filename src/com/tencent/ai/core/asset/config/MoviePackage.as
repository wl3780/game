// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.config.MoviePackage

package com.tencent.ai.core.asset.config
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_60;
    import __AS3__.vec.*;

    public class MoviePackage implements IXMLSerialize 
    {

        public var particleData:ParticleData;
        public var movieLayers:Vector.<LayerTemplate>;

        public function MoviePackage()
        {
            this.movieLayers = new Vector.<LayerTemplate>();
        }

        public function decode(_arg_1:XML):void
        {
            var _local_6:LayerTemplate;
            var _local_2:XML = _arg_1.ParticleData[0];
            if (_local_2 != null){
                this.particleData = new ParticleData();
                this.particleData.decode(_local_2);
            };
            var _local_3:XMLList = _arg_1.Layer;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new LayerTemplate();
                _local_6.decode(_local_3[_local_5]);
                this.movieLayers.push(_local_6);
                _local_5++;
            };
        }

        public function encode()
        {
            var _local_1:XML = <MoviePackage/>
            ;
            if (this.particleData != null){
                _local_1.appendChild(this.particleData.encode());
            };
            var _local_2:int = this.movieLayers.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_1.appendChild(this.movieLayers[_local_3].encode());
                _local_3++;
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_60()
        {
        }


    }
}//package com.tencent.ai.core.asset.config

// _SafeStr_60 = " MoviePackage" (String#17105)


