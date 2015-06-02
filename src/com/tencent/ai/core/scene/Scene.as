package com.tencent.ai.core.scene
{
    import com.tencent.ai.core.data.EnvironmentInfo;
    import com.tencent.ai.core.data.SceneConfigInfo;
    import com.tencent.ai.core.data.SceneInfo;
    import com.tencent.ai.core.data.SceneLayerInfo;
    import com.tencent.ai.core.data.SceneWalkData;
    import com.tencent.ai.core.debug.IProfileVisitor;
    import com.tencent.ai.core.debug.SceneProfileInfo;
    import com.tencent.ai.core.display.DisplaySystem;
    import com.tencent.ai.core.display.IDisplay;
    import com.tencent.ai.core.display.ISprite;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.enum.SceneLayerDef;
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.scene.utils.SceneStatsUtil;
    
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.geom.Rectangle;
    import flash.utils.Dictionary;

    public class Scene extends EventDispatcher2 implements IScene 
    {

        protected var _sceneInfo:SceneInfo;
        protected var _sceneLayers:Dictionary;
        protected var _sceneLayerList:Vector.<BaseSceneLayer>;
        protected var _dicFactory:Dictionary;
        protected var _camera:Camera;
        protected var _layerFactory:SceneLayerFactory;
        protected var _layerLoadedState:Boolean;
        protected var _totalNumber:int;
        protected var _loadedNumber:int;
        protected var _eInfo:EnvironmentInfo;
        protected var _sceneManager:ISceneManager;
        protected var _sceneConfigInfo:SceneConfigInfo;
        protected var m_statsUtil:SceneStatsUtil;
        protected var m_container:ISprite;
        protected var m_walkData:SceneWalkData;
        protected var m_walkDataMatrix:Vector.<Vector.<int>>;
        protected var m_renderLevel:int = 2147483647;
        
		private var _itAdd:Function;
        private var _itRemove:Function;
        private var _renderFunc:Function;
        private var _itClassID:int;
        private var _sceneID:int;

        public function Scene()
        {
            this.m_container = DisplaySystem.createSprite();
            this.m_statsUtil = new SceneStatsUtil();
            _sceneID = 0;
            _itAdd = null;
            _itRemove = null;
            _renderFunc = null;
            _itClassID = 0;
        }

        override public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            if (_arg_1 == Event.ENTER_FRAME) {
                this.m_container.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
            } else {
                super.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
            }
        }

        override public function removeEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false):void
        {
            if (_arg_1 == Event.ENTER_FRAME) {
                this.m_container.removeEventListener(_arg_1, _arg_2, _arg_3);
            } else {
                super.removeEventListener(_arg_1, _arg_2, _arg_3);
            }
        }

        protected function onLayerLoadComplete(_arg_1:Event):void
        {
            var _local_2:BaseSceneLayer;
            var _local_3:SceneLoadEvent;
            _layerLoadedState = true;
            for each (_local_2 in _sceneLayers) {
                if (((_local_2) && (!(_local_2.loadedstate)))) {
                    _layerLoadedState = false;
                    break;
                }
            }
            if (_layerLoadedState) {
                _local_3 = new SceneLoadEvent(SceneLoadEvent.COMPLETE);
                _local_3.setTarget(this);
                this.dispatchEvent(_local_3);
            }
        }

        protected function onLayerLoadProess(_arg_1:Event):void
        {
            var _local_2:BaseSceneLayer;
            var _local_3:SceneLoadEvent;
            _totalNumber = 0;
            _loadedNumber = 0;
            for each (_local_2 in _sceneLayers) {
                if (_local_2) {
                    _totalNumber = (_totalNumber + _local_2.itemNumber);
                    _loadedNumber = (_loadedNumber + _local_2.itemLoadedNumber);
                }
            }
            _local_3 = new SceneLoadEvent(SceneLoadEvent.LOAD_PROESS);
            _local_3.totalItem = _totalNumber;
            _local_3.loadedItem = _loadedNumber;
            this.dispatchEvent(_local_3);
        }

        protected function onLayerError(_arg_1:SceneLoadEvent):void
        {
            this.dispatchEvent(_arg_1);
        }

        public function get sceneName():String
        {
            return (_sceneInfo.sceneName);
        }

        public function setSceneID(_arg_1:int):void
        {
            _sceneID = _arg_1;
        }

        protected function initialize(_arg_1:SceneConfigInfo):void
        {
            var _local_5:SceneLayerInfo;
            var _local_6:BaseSceneLayer;
            var _local_7:SceneLoadEvent;
            _sceneConfigInfo = _arg_1;
            _sceneConfigInfo.walkData.scene = this;
            this.m_walkData = _sceneConfigInfo.walkData;
            this.m_walkDataMatrix = this.m_walkData.walkDataMatrix;
            _sceneLayers = new Dictionary();
            _sceneLayerList = new Vector.<BaseSceneLayer>();
            _dicFactory = new Dictionary();
            var _local_2:NormalItemFactory = new NormalItemFactory();
            _local_2.initialize();
            this.registerFactory(_local_2);
            _layerFactory = new SceneLayerFactory();
            _layerLoadedState = false;
            _totalNumber = 0;
            _loadedNumber = 0;
            var _local_3:Vector.<SceneLayerInfo> = _arg_1.layerList;
            var _local_4:int = _local_3.length;
            while (_local_4--) {
                _local_5 = _local_3[_local_4];
                _local_6 = this.createLayer(_local_5);
                _local_6.addEventListener(SceneLoadEvent.COMPLETE, this.onLayerLoadComplete);
                _local_6.addEventListener(SceneLoadEvent.LOAD_PROESS, this.onLayerLoadProess);
                _local_6.addEventListener(SceneLoadEvent.ERROR, this.onLayerError);
                _local_6.load(this, _local_5);
                _totalNumber = (_totalNumber + _local_6.itemNumber);
                _loadedNumber = (_loadedNumber + _local_6.itemLoadedNumber);
            }
            if (!_camera) {
                _camera = new Camera();
            }
            _camera.attachScene(this);
            if (_totalNumber == _loadedNumber) {
                _layerLoadedState = true;
                _local_7 = new SceneLoadEvent(SceneLoadEvent.COMPLETE);
                _local_7.setTarget(this);
                this.dispatchEvent(_local_7);
            } else {
                _layerLoadedState = false;
            }
        }

        protected function createLayer(_arg_1:SceneLayerInfo):BaseSceneLayer
        {
            var _local_2:BaseSceneLayer = _layerFactory.createSceneLayer(_arg_1);
            _sceneLayers[_arg_1.id] = _local_2;
            _sceneLayerList.push(_local_2);
            this.m_container.addDisplay(_local_2.getDisplay());
            return (_local_2);
        }

        public function getLayers():Dictionary
        {
            return (_sceneLayers);
        }

        public function createElement(type:String, _arg_2:Object, _arg_3:Boolean=true):BaseElement
        {
            var _local_4:BaseElement;
            var _local_5:IElementFactory = _dicFactory[type];
            if (_local_5) {
                _local_4 = _local_5.createElement(_arg_2);
                if (((_local_4) && (_arg_3))) {
                    this.addElementAt(_local_5.getDefaultLayerID(), _local_4);
                }
            }
            return (_local_4);
        }

        public function destoryElement(_arg_1:BaseElement, _arg_2:Boolean=true):void
        {
            var _local_3:IElementFactory = _dicFactory[_arg_1.getType()];
            if (_arg_2) {
                this.removeElementAt(_local_3.getDefaultLayerID(), _arg_1);
            }
            _local_3.destoryElement(_arg_1);
        }

        public function registerFunction(_arg_1:Function, _arg_2:Function, _arg_3:Function, _arg_4:int):void
        {
            _itAdd = _arg_1;
            _itRemove = _arg_2;
            _itClassID = _arg_4;
            _renderFunc = _arg_3;
        }

        public function registerFactory(_arg_1:IElementFactory):void
        {
            _dicFactory[_arg_1.getElementType()] = _arg_1;
        }

        public function getFactory(_arg_1:String):IElementFactory
        {
            return (_dicFactory[_arg_1]);
        }

        public function unRegisterFactory(_arg_1:String):void
        {
            delete _dicFactory[_arg_1];
        }

        public function load(_arg_1:SceneInfo, _arg_2:SceneConfigInfo):void
        {
            _eInfo = new EnvironmentInfo();
            if (_arg_1) {
                _sceneInfo = _arg_1;
                _eInfo.friction = _arg_1.friction;
            } else {
                _sceneInfo = new SceneInfo();
            }
            this.initialize(_arg_2);
            this.m_statsUtil.start();
        }

        public function unload():void
        {
            var _local_1:BaseSceneLayer;
            this.m_statsUtil.stop();
            _layerLoadedState = false;
            for each (_local_1 in _sceneLayers) {
                this.m_container.removeDisplay(_local_1.getDisplay());
                _local_1.removeEventListener(SceneLoadEvent.COMPLETE, this.onLayerLoadComplete);
                _local_1.removeEventListener(SceneLoadEvent.LOAD_PROESS, this.onLayerLoadProess);
                _local_1.removeEventListener(SceneLoadEvent.ERROR, this.onLayerError);
                _local_1.unload();
            }
            _sceneInfo = null;
            _sceneLayers = null;
            _sceneLayerList.length = 0;
            _dicFactory = null;
            _layerFactory = null;
            _eInfo = null;
            _sceneConfigInfo = null;
            _itAdd = null;
            _itRemove = null;
            _itClassID = 0;
            _renderFunc = null;
        }

        public function addElementAt(layerID:int, element:BaseElement):Boolean
        {
            var _local_3:Boolean;
            var _local_4:ISceneLayer = _sceneLayers[layerID];
            if (!element.getParentContainer()) {
                element.setParentContainer(this);
                _local_4.addElement(element);
                _local_3 = true;
            }
            if (((!((_itAdd == null))) && ((element.classID >= _itClassID)))) {
                _itAdd(element);
            }
            return (_local_3);
        }

        public function removeElementAt(layerID:int, element:BaseElement):void
        {
            var _local_3:ISceneLayer = _sceneLayers[layerID];
            _local_3.removeElement(element);
            element.setParentContainer(null);
            if (((!((_itRemove == null))) && ((element.classID >= _itClassID)))) {
                _itRemove(element);
            }
        }

        public function getLayer(_arg_1:int):ISceneLayer
        {
            return (_sceneLayers[_arg_1]);
        }

        public function getElements(_arg_1:int):Array
        {
            var _local_2:ISceneLayer = _sceneLayers[_arg_1];
            return (_local_2.getElements());
        }

        public function getCamera():ICamera
        {
            return (_camera);
        }

        public function set focus(_arg_1:BaseElement):void
        {
            _camera.setFocus(_arg_1);
        }

        public function get focus():BaseElement
        {
            return (_camera.getFocus());
        }

        public function isWalkable(_arg_1:int, _arg_2:int):Boolean
        {
            if ((((((((_arg_1 < 0)) || ((_arg_1 >= this.mapWidth)))) || ((_arg_2 < 0)))) || ((_arg_2 >= this.mapHeight)))) {
                return (false);
            }
            var _local_3:int = int((_arg_1 / Constants.WALK_SIZE));
            var _local_4:int = int((_arg_2 / Constants.WALK_SIZE));
            return ((this.m_walkDataMatrix[_local_4][_local_3] > 0));
        }

        public function id():int
        {
            return ((((_sceneInfo)!=null) ? (_sceneInfo.sceneID) : _sceneID));
        }

        public function getInfo():EnvironmentInfo
        {
            return (_eInfo);
        }

        public function render(_arg_1:int):void
        {
            if (_renderFunc != null) {
                _renderFunc(_arg_1);
            }
            _camera.update();
            var _local_2:int = _sceneLayerList.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _sceneLayerList[_local_3].render(_arg_1);
                _local_3++;
            }
            if (_sceneInfo.createAsync) {
                this.checkInCamera();
            }
        }

        public function getDisplay():IDisplay
        {
            return (this.m_container);
        }

        public function get mapWidth():int
        {
            return (_sceneConfigInfo.width);
        }

        public function get mapHeight():int
        {
            return (_sceneConfigInfo.height);
        }

        public function get configInfo():SceneConfigInfo
        {
            return (_sceneConfigInfo);
        }

        public function setSceneManager(_arg_1:ISceneManager):void
        {
            _sceneManager = _arg_1;
        }

        public function getConfig():Dictionary
        {
            if (_sceneManager) {
                return ((_sceneManager.getConfig(_sceneInfo.sceneID) as Dictionary));
            }
            return (null);
        }

        public function getSceneInfo():SceneInfo
        {
            return (_sceneInfo);
        }

        public function drawWalk(_arg_1:Boolean=false):void
        {
            var _local_6:Rectangle;
            var _local_7:Vector.<int>;
            var _local_8:int;
            var _local_9:int;
            var _local_2:Sprite = (this.getLayer(SceneLayerDef.LAYER_GROUND).getDisplay() as Sprite);
            _local_2.graphics.clear();
            if (_arg_1) {
                return;
            }
            var _local_3:Vector.<Vector.<int>> = this.m_walkData.walkDataMatrix;
            var _local_4:int = _local_3.length;
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_7 = _local_3[_local_5];
                _local_8 = _local_7.length;
                _local_9 = 0;
                while (_local_9 < _local_8) {
                    _local_2.graphics.beginFill(0xFF00, (((this.m_walkData.isWalkable2(_local_9, _local_5))>0) ? 0.3 : 0));
                    _local_2.graphics.lineStyle(1, 0xFF, 0.1);
                    _local_2.graphics.drawRect((_local_9 * Constants.WALK_SIZE), (_local_5 * Constants.WALK_SIZE), Constants.WALK_SIZE, Constants.WALK_SIZE);
                    _local_2.graphics.endFill();
                    _local_9++;
                }
                _local_5++;
            }
            for each (_local_6 in this.m_walkData.unwalkableRects) {
                _local_2.graphics.beginFill(0xFF0000, 0.3);
                _local_2.graphics.drawRect(_local_6.x, _local_6.y, _local_6.width, _local_6.height);
                _local_2.graphics.endFill();
            }
        }

        public function get loaded():Boolean
        {
            return (_layerLoadedState);
        }

        public function visit(_arg_1:IProfileVisitor):void
        {
            var _local_2:SceneProfileInfo = new SceneProfileInfo(_sceneInfo, _sceneConfigInfo, _sceneLayers);
            _arg_1.profileSceneInfo(_local_2);
        }

        public function set renderLevel(_arg_1:int):void
        {
            var _local_2:BaseSceneLayer;
            if (_arg_1 == this.m_renderLevel) {
                return;
            }
            this.m_renderLevel = _arg_1;
            var _local_3:int;
            var _local_4:* = _sceneLayerList;
            for each (_local_2 in _sceneLayerList) {
                _local_2.renderLevel = _arg_1;
            }
        }

        public function get renderLevel():int
        {
            return (this.m_renderLevel);
        }

        protected function checkInCamera():void
        {
            var _local_1:BaseSceneLayer;
            if (_sceneInfo.createAsync) {
                var _local_2:int;
                var _local_3:* = _sceneLayerList;
                for each (_local_1 in _sceneLayerList) {
                    _local_1.checkInCamera();
                }
            }
        }

        public function drawBackground(_arg_1:uint, _arg_2:int, _arg_3:int, _arg_4:Number=1):void
        {
            var _local_5:Sprite = (this.m_container as Sprite);
            _local_5.graphics.beginFill(_arg_1, _arg_4);
            _local_5.graphics.drawRect(0, 0, _arg_2, _arg_3);
            _local_5.graphics.endFill();
        }

        public function get walkData():SceneWalkData
        {
            if (_sceneConfigInfo) {
                return (_sceneConfigInfo.walkData);
            }
            return (null);
        }

    }
}
