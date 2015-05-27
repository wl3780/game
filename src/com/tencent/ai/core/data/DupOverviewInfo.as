// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.DupOverviewInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_236;
    import __AS3__.vec.*;

    public class DupOverviewInfo implements IXMLSerialize 
    {

        public var id:int;
        public var name:String;
        public var dupIndex:int;
        public var libSrc:String;
        public var className:String;
        public var birthScenes:Array;
        public var sceneLocations:Vector.<DupSLocation>;
        public var sceneIDs:Array;
        public var sceneInfos:Array;
        public var monsterIDs:Vector.<int>;
        public var interactiveIDs:Vector.<int>;
        public var effectIDs:Vector.<int>;
        public var plotID:int = -1;
        public var plotScenes:Array;


        public function decode(_arg_1:XML):void
        {
            var _local_9:SceneInfo;
            var _local_10:DupSLocation;
            var _local_11:Array;
            this.birthScenes = String(_arg_1.@birthScenes).split(",");
            var _local_2:XML = _arg_1.@Lib[0];
            this.libSrc = "";
            this.className = String(_arg_1.@className);
            if (_local_2 != null){
                this.libSrc = String(_local_2.@src);
            };
            this.sceneInfos = [];
            var _local_3:XMLList = _arg_1.Scenes[0].Scene;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_9 = new SceneInfo();
                _local_9.decode(_local_3[_local_5]);
                _local_9.sceneConfig = (((((DEFINE.DUP_RES_SRC + this.id) + "/") + this.dupIndex) + "/") + _local_9.sceneConfig);
                this.sceneInfos.push(_local_9);
                _local_5++;
            };
            this.sceneIDs = [];
            var _local_6:XMLList = _arg_1.SceneLocations[0].SceneLocation;
            this.sceneLocations = new Vector.<DupSLocation>();
            _local_4 = _local_6.length();
            _local_5 = 0;
            while (_local_5 < _local_4) {
                _local_10 = new DupSLocation();
                _local_10.decode(_local_6[_local_5]);
                this.sceneLocations.push(_local_10);
                this.sceneIDs.push(_local_10.sceneID);
                _local_5++;
            };
            this.monsterIDs = new Vector.<int>();
            var _local_7:String = String(_arg_1.MonsterIDs[0].@value);
            if (_local_7){
                _local_11 = String(_arg_1.MonsterIDs[0].@value).split(",");
                _local_4 = _local_11.length;
                _local_5 = 0;
                while (_local_5 < _local_4) {
                    this.monsterIDs.push(int(_local_11[_local_5]));
                    _local_5++;
                };
            };
            this.interactiveIDs = new Vector.<int>();
            var _local_8:String = String(_arg_1.InteractiveIDs[0].@value);
            if (_local_8 != ""){
                _local_11 = _local_8.split(",");
                _local_4 = _local_11.length;
                _local_5 = 0;
                while (_local_5 < _local_4) {
                    this.interactiveIDs.push(int(_local_11[_local_5]));
                    _local_5++;
                };
            };
            this.effectIDs = new Vector.<int>();
            _local_8 = String(_arg_1.EffectIDs[0].@value);
            if (_local_8 != ""){
                _local_11 = _local_8.split(",");
                _local_4 = _local_11.length;
                _local_5 = 0;
                while (_local_5 < _local_4) {
                    this.effectIDs.push(int(_local_11[_local_5]));
                    _local_5++;
                };
            };
            if (_arg_1.Plot[0] != null){
                this.plotID = int(_arg_1.Plot[0].@value);
                this.plotScenes = String(_arg_1.Plot[0].@scene).split(",");
            } else {
                this.plotID = -1;
                this.plotScenes = null;
            };
        }

        public function encode()
        {
            var _local_9:XML;
            var _local_1:XML = <DupOverviewInfo/>
            ;
            _local_1.@className = this.className;
            _local_1.@birthScenes = this.birthScenes.join(",");
            var _local_2:XML = <Lib/>
            ;
            _local_2.@src = this.libSrc;
            _local_1.Lib = (_local_1.Lib + _local_2);
            var _local_3:XML = <SceneLocations/>
            ;
            var _local_4:int;
            while (_local_4 < this.sceneLocations.length) {
                _local_3.SceneLocation = (_local_3.SceneLocation + (this.sceneLocations[_local_4].encode() as XML));
                _local_4++;
            };
            _local_1.SceneLocations = (_local_1.SceneLocations + _local_3);
            var _local_5:XML = <Scenes/>
            ;
            _local_4 = 0;
            while (_local_4 < this.sceneInfos.length) {
                _local_5.Scene = (_local_5.Scene + ((this.sceneInfos[_local_4] as SceneInfo).encode() as XML));
                _local_4++;
            };
            _local_1.Scenes = (_local_1.Scenes + _local_5);
            var _local_6:XML = <MonsterIDs/>
            ;
            _local_6.@value = this.monsterIDs.join(",");
            _local_1.MonsterIDs = (_local_1.MonsterIDs + _local_6);
            var _local_7:XML = <InteractiveIDs/>
            ;
            _local_7.@value = this.interactiveIDs.join(",");
            _local_1.InteractiveIDs = (_local_1.InteractiveIDs + _local_7);
            var _local_8:XML = <EffectIDs/>
            ;
            _local_8.@value = this.effectIDs.join(",");
            _local_1.EffectIDs = (_local_1.EffectIDs + _local_8);
            if (this.plotScenes){
                _local_9 = <Plot/>
                ;
                _local_9.@value = this.plotID;
                _local_9.@scene = this.plotScenes.join(",");
                _local_1.Plot = (_local_1.Plot + _local_9);
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_236()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_236 = " DupOverviewInfo" (String#15377)


