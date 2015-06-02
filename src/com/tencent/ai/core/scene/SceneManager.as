package com.tencent.ai.core.scene
{
    import com.tencent.ai.core.data.SceneInfo;
    
    import flash.events.EventDispatcher;
    import flash.utils.Dictionary;

    public class SceneManager extends EventDispatcher implements ISceneManager 
    {

        protected var DefaultSceneClass:Class;
        protected var scenePrepareHash:Dictionary;
        protected var scene:Scene;
        
		private var _scenePrepare:ScenePrepare;
        private var _infosArr:Array;
        private var _totalLoaderSize:int;
        private var _totalNum:int;
        private var _curIndex:int;

        public function SceneManager(sceneClass:Class)
        {
            this.DefaultSceneClass = sceneClass;
            this.scenePrepareHash = new Dictionary();
        }

        public function prepareScene(_arg_1:Array):void
        {
            this._infosArr = _arg_1;
            this._totalNum = _arg_1.length;
            this._curIndex = 0;
            this._totalLoaderSize = 0;
            this.loadScene();
        }

        private function loadScene():void
        {
            var _local_1:ScenePrepareEvent;
            this.removePrepareEvent();
            if (this._curIndex >= this._totalNum){
                _local_1 = new ScenePrepareEvent(ScenePrepareEvent.COMPLETE);
                _local_1.bytesTotal = this._totalLoaderSize;
                dispatchEvent(_local_1);
                return;
            };
            this._scenePrepare = new ScenePrepare(this._infosArr[this._curIndex]);
            this._scenePrepare.addEventListener(ScenePrepareEvent.COMPLETE, this.onPrepareComplete);
            this._scenePrepare.addEventListener(ScenePrepareEvent.LOAD_PROESS, this.onPrepareProgress);
            this._scenePrepare.addEventListener(ScenePrepareEvent.ERROR, this.onPrepareError);
            this._scenePrepare.load();
        }

        private function removePrepareEvent():void
        {
            if (this._scenePrepare){
                this._scenePrepare.removeEventListener(ScenePrepareEvent.COMPLETE, this.onPrepareComplete);
                this._scenePrepare.removeEventListener(ScenePrepareEvent.LOAD_PROESS, this.onPrepareProgress);
                this._scenePrepare.removeEventListener(ScenePrepareEvent.ERROR, this.onPrepareError);
            };
        }

        protected function onPrepareComplete(_arg_1:ScenePrepareEvent):void
        {
            var _local_2:SceneInfo = this._infosArr[this._curIndex];
            this.scenePrepareHash[_local_2.sceneID] = this._scenePrepare;
            this._curIndex++;
            this.loadScene();
        }

        protected function onPrepareProgress(_arg_1:ScenePrepareEvent):void
        {
            var _local_2:ScenePrepareEvent = new ScenePrepareEvent(ScenePrepareEvent.LOAD_PROESS);
            var _local_3:Number = (this._scenePrepare.loadedItem / this._scenePrepare.totalItem);
            _local_3 = ((this._curIndex / this._totalNum) + (_local_3 / this._totalNum));
            _local_2.bytesTotal = int((_local_3 * 100));
            _local_2.key = _arg_1.key;
            _local_2.totalItem = this._scenePrepare.totalItem;
            _local_2.loadedItem = this._scenePrepare.loadedItem;
            this._totalLoaderSize = (this._totalLoaderSize + _arg_1.bytesTotal);
            dispatchEvent(_local_2);
        }

        protected function onPrepareError(_arg_1:ScenePrepareEvent):void
        {
            var _local_2:ScenePrepareEvent = new ScenePrepareEvent(ScenePrepareEvent.ERROR);
            _local_2.key = _arg_1.key;
            _local_2.totalItem = this._scenePrepare.totalItem;
            _local_2.loadedItem = this._scenePrepare.loadedItem;
            dispatchEvent(_local_2);
        }

        public function unprepareScene(_arg_1:Array):void
        {
            var _local_2:ScenePrepare;
            var _local_3:SceneInfo;
            for each (_local_3 in _arg_1) {
                _local_2 = this.scenePrepareHash[_local_3.sceneID];
                if (_local_2){
                    _local_2.removeEventListener(ScenePrepareEvent.COMPLETE, this.onPrepareComplete);
                    _local_2.removeEventListener(ScenePrepareEvent.LOAD_PROESS, this.onPrepareProgress);
                    _local_2.removeEventListener(ScenePrepareEvent.ERROR, this.onPrepareError);
                    _local_2.unload();
                    _local_2 = null;
                    delete this.scenePrepareHash[_local_3.sceneID];
                };
            };
        }

        public function newCurrentScene(_arg_1:int):Scene
        {
            if (null == this.scene){
                this.scene = new this.DefaultSceneClass();
            };
            this.scene.setSceneID(_arg_1);
            return (this.scene);
        }

        public function loadCurrentScene():void
        {
            this.scene.setSceneManager(this);
            var _local_1:ScenePrepare = this.scenePrepareHash[this.scene.id()];
            this.scene.load(_local_1.sceneInfo, _local_1.config["scene"]);
        }

        public function destroyCurrentScene():void
        {
            if (this.scene){
                this.scene.unload();
            };
        }

        public function getCurrentScene():Scene
        {
            return (this.scene);
        }

        public function getConfig(_arg_1:int, _arg_2:String=""):Object
        {
            var _local_3:ScenePrepare = this.scenePrepareHash[_arg_1];
            if (_arg_2){
                return (_local_3.config[_arg_2]);
            };
            return (_local_3.config);
        }

    }
}
