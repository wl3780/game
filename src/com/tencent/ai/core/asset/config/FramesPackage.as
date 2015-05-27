// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.config.FramesPackage

package com.tencent.ai.core.asset.config
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_56;
    import __AS3__.vec.*;

    public class FramesPackage implements IXMLSerialize 
    {

        public var key:String;
        public var name:String;
        public var bdLen:int;
        public var bds:Vector.<BD>;
        public var assetLen:int;
        public var framesAssets:Vector.<FramesAsset>;


        public function decode(_arg_1:XML):void
        {
            var _local_4:String;
            var _local_5:int;
            var _local_6:BD;
            var _local_7:FramesAsset;
            this.name = String(_arg_1.@name);
            this.key = String(_arg_1.@key);
            var _local_2:XMLList = _arg_1.BD;
            var _local_3:int = _local_2.length();
            if (_local_3 > 0){
                _local_4 = String(_arg_1.@bdPrefix);
                this.bds = new Vector.<BD>();
                _local_5 = 0;
                while (_local_5 < _local_3) {
                    _local_6 = new BD();
                    _local_6.bdPrefix = _local_4;
                    _local_6.decode(_local_2[_local_5]);
                    this.bds.push(_local_6);
                    _local_5++;
                };
                this.bdLen = this.bds.length;
            };
            _local_2 = _arg_1.FramesAsset;
            _local_3 = _local_2.length();
            if (_local_3 > 0){
                if (this.framesAssets == null){
                    this.assetLen = int(_arg_1.@assetLen);
                    this.framesAssets = new Vector.<FramesAsset>();
                };
                _local_5 = 0;
                while (_local_5 < _local_3) {
                    _local_7 = new FramesAsset();
                    _local_7.decode(_local_2[_local_5]);
                    this.framesAssets.push(_local_7);
                    _local_5++;
                };
            };
        }

        public function encode()
        {
            var _local_3:FramesAsset;
            var _local_1:XML = <FramesPackage/>
            ;
            _local_1.@name = this.name;
            _local_1.@assetLen = this.assetLen;
            var _local_2:int;
            while (_local_2 < this.bdLen) {
                _local_1.appendChild(this.bds[_local_2].encode());
                _local_2++;
            };
            _local_2 = 0;
            while (_local_2 < this.assetLen) {
                _local_3 = this.framesAssets[_local_2];
                if (_local_3 != null){
                    _local_1.appendChild(_local_3.encode());
                };
                _local_2++;
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_56()
        {
        }


    }
}//package com.tencent.ai.core.asset.config

// _SafeStr_56 = " FramesPackage" (String#15254)


