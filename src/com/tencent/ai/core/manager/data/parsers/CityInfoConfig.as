// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.CityInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.SceneInfo;
    import com.tencent.ai.core.manager.data.DEFINE;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_595;

    public class CityInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var sceneInfoHash:Dictionary;

        public function CityInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:XML;
            var _local_7:SceneInfo;
            this.sceneInfoHash = new Dictionary();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.Scene;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _local_3[_local_5];
                _local_7 = new SceneInfo();
                _local_7.decode(_local_6);
                _local_7.sceneConfig = (DEFINE.CITY_RES_SRC + _local_7.sceneConfig);
                this.sceneInfoHash[_local_7.sceneID] = _local_7;
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this.sceneInfoHash[_arg_1]);
        }

        public function findAll():Object
        {
            return (this.sceneInfoHash);
        }

        override public function clearConfig():void
        {
            this.sceneInfoHash = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_4:SceneInfo;
            super.readConfig(_arg_1);
            this.sceneInfoHash = new Dictionary();
            var _local_2:uint = _arg_1.readUnsignedInt();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new SceneInfo();
                _local_4.read(_arg_1);
                _local_4.sceneConfig = (DEFINE.CITY_RES_SRC + _local_4.sceneConfig);
                this.sceneInfoHash[_local_4.sceneID] = _local_4;
                _local_3++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:SceneInfo;
            super.writeConfig(_arg_1);
            var _local_2:uint = DictionaryEx.getLength(this.sceneInfoHash);
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this.sceneInfoHash;
            for each (_local_3 in this.sceneInfoHash) {
                _local_3.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_595()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_595 = " CityInfoConfig" (String#15710)


