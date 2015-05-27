// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.config.ParticleData

package com.tencent.ai.core.asset.config
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_61;
    import __AS3__.vec.*;

    public class ParticleData implements IXMLSerialize 
    {

        public var particleInfos:Vector.<ParticleInfo>;

        public function ParticleData()
        {
            this.particleInfos = new Vector.<ParticleInfo>();
        }

        public function decode(_arg_1:XML):void
        {
            var _local_5:ParticleInfo;
            this.particleInfos.splice(0, this.particleInfos.length);
            var _local_2:XMLList = _arg_1.ParticleInfo;
            var _local_3:int = _local_2.length();
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = new ParticleInfo();
                _local_5.id = int(_local_2[_local_4].@id);
                _local_5.name = _local_2[_local_4].@name.toString();
                _local_5.decode(_local_2[_local_4]);
                this.particleInfos.push(_local_5);
                _local_4++;
            };
        }

        public function encode()
        {
            var _local_1:XML = <ParticleData/>
            ;
            var _local_2:int = this.particleInfos.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_1.appendChild(this.particleInfos[_local_3].encode());
                _local_3++;
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_61()
        {
        }


    }
}//package com.tencent.ai.core.asset.config

// _SafeStr_61 = " ParticleData" (String#14312)


