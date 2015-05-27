// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SceneInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_318;
    import __AS3__.vec.*;

    public class SceneInfo implements IXMLSerialize, ISerialize 
    {

        public var sceneID:int;
        public var topID:int;
        public var sceneName:String;
        public var sceneConfig:String;
        public var friction:int;
        public var des:String;
        public var doorInfoList:Vector.<DoorInfo>;
        public var birthX:int;
        public var birthZ:int;
        public var bgMusicList:Dictionary;
        public var envMusicList:Dictionary;
        public var levelLimit:int;
        public var createAsync:Boolean;

        public function SceneInfo()
        {
            this.doorInfoList = new Vector.<DoorInfo>();
        }

        public function decode(_arg_1:XML):void
        {
            var _local_4:XML;
            var _local_5:String;
            var _local_6:DoorInfo;
            var _local_7:int;
            this.levelLimit = int(_arg_1.@levelLimit);
            this.birthX = int(_arg_1.@birthX);
            this.birthZ = int(_arg_1.@birthZ);
            this.sceneID = int(_arg_1.@id);
            this.topID = int(_arg_1.@topID);
            this.sceneName = String(_arg_1.@name);
            this.sceneConfig = String(_arg_1.@cfg);
            this.des = String(_arg_1.@des);
            this.friction = int(_arg_1.@friction);
            this.createAsync = ((_arg_1.hasOwnProperty("@createAsync")) ? (int(_arg_1.@createAsync) == 1) : false);
            if (this.friction < 100){
                this.friction = 100;
            };
            var _local_2:XMLList = _arg_1.Door;
            var _local_3:int = _local_2.length();
            if (_local_3){
                _local_7 = 0;
                while (_local_7 < _local_3) {
                    _local_6 = new DoorInfo();
                    _local_6.decode(_local_2[_local_7]);
                    this.doorInfoList[_local_7] = _local_6;
                    _local_7++;
                };
            };
            this.doorInfoList.fixed = true;
            this.bgMusicList = new Dictionary();
            this.envMusicList = new Dictionary();
            for each (_local_4 in _arg_1.BgMusic) {
                _local_5 = _local_4.toString();
                this.bgMusicList[_local_5] = _local_5;
            };
            for each (_local_4 in _arg_1.EnvMusic) {
                _local_5 = _local_4.toString();
                this.envMusicList[_local_5] = _local_5;
            };
        }

        public function encode()
        {
            var _local_3:String;
            var _local_4:XML;
            var _local_1:XML = <Scene/>
            ;
            _local_1.@levelLimit = this.levelLimit;
            _local_1.@birthX = this.birthX;
            _local_1.@birthZ = this.birthZ;
            _local_1.@id = this.sceneID;
            _local_1.@topID = this.topID;
            _local_1.@name = this.sceneName;
            _local_1.@cfg = this.sceneConfig.split(/\/|\\/g).pop();
            _local_1.@friction = this.friction;
            _local_1.@des = this.des;
            _local_1.@createAsync = ((this.createAsync) ? 1 : 0);
            var _local_2:int;
            while (_local_2 < this.doorInfoList.length) {
                _local_1.Door = (_local_1.Door + (this.doorInfoList[_local_2].encode() as XML));
                _local_2++;
            };
            for each (_local_3 in this.bgMusicList) {
                _local_4 = <BgMusic/>
                ;
                _local_4.appendChild(_local_3);
                _local_1.BgMusic = (_local_1.BgMusic + _local_4);
            };
            for each (_local_3 in this.envMusicList) {
                _local_4 = <EnvMusic/>
                ;
                _local_4.appendChild(_local_3);
                _local_1.EnvMusic = (_local_1.EnvMusic + _local_4);
            };
            return (_local_1);
        }

        public function hasBgMusic(_arg_1:String):Boolean
        {
            _arg_1 = _arg_1.replace((DEFINE.SOUND_RES_SRC + "mp3/"), "");
            return (Boolean(this.bgMusicList[_arg_1]));
        }

        public function hasEnvMusic(_arg_1:String):Boolean
        {
            return (Boolean(this.envMusicList[_arg_1]));
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_6:DoorInfo;
            var _local_7:String;
            this.levelLimit = _arg_1.readInt();
            this.birthX = _arg_1.readInt();
            this.birthZ = _arg_1.readInt();
            this.sceneID = _arg_1.readInt();
            this.topID = _arg_1.readInt();
            this.sceneName = XString.ReadString(_arg_1);
            this.sceneConfig = XString.ReadString(_arg_1);
            this.friction = _arg_1.readInt();
            this.des = XString.ReadString(_arg_1);
            var _local_2:uint = _arg_1.readInt();
            this.doorInfoList = new Vector.<DoorInfo>(_local_2, true);
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_6 = new DoorInfo();
                _local_6.read(_arg_1);
                this.doorInfoList[_local_3] = _local_6;
                _local_3++;
            };
            var _local_4:uint = _arg_1.readUnsignedInt();
            this.bgMusicList = new Dictionary();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_7 = XString.ReadString(_arg_1);
                this.bgMusicList[_local_7] = _local_7;
                _local_3++;
            };
            var _local_5:uint = _arg_1.readUnsignedInt();
            this.envMusicList = new Dictionary();
            _local_3 = 0;
            while (_local_3 < _local_5) {
                _local_7 = XString.ReadString(_arg_1);
                this.envMusicList[_local_7] = _local_7;
                _local_3++;
            };
            this.createAsync = _arg_1.readBoolean();
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_3:DoorInfo;
            var _local_4:uint;
            var _local_5:String;
            var _local_6:uint;
            var _local_7:String;
            _arg_1.writeInt(this.levelLimit);
            _arg_1.writeInt(this.birthX);
            _arg_1.writeInt(this.birthZ);
            _arg_1.writeInt(this.sceneID);
            _arg_1.writeInt(this.topID);
            XString.WriteString(_arg_1, this.sceneName);
            XString.WriteString(_arg_1, this.sceneConfig.split(/\/|\\/g).pop());
            _arg_1.writeInt(this.friction);
            XString.WriteString(_arg_1, this.des);
            var _local_2:uint = this.doorInfoList.length;
            _arg_1.writeUnsignedInt(_local_2);
            for each (_local_3 in this.doorInfoList) {
                _local_3.write(_arg_1);
            };
            _local_4 = DictionaryEx.getLength(this.bgMusicList);
            _arg_1.writeUnsignedInt(_local_4);
            for each (_local_5 in this.bgMusicList) {
                XString.WriteString(_arg_1, _local_5);
            };
            _local_6 = DictionaryEx.getLength(this.envMusicList);
            _arg_1.writeUnsignedInt(_local_6);
            for each (_local_7 in this.envMusicList) {
                XString.WriteString(_arg_1, _local_7);
            };
            _arg_1.writeBoolean(this.createAsync);
        }

        public /*  ©init. */ function _SafeStr_318()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_318 = " SceneInfo" (String#17534)


