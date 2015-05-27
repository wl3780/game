// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.BaseSceneLayer

package com.tencent.ai.core.scene
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.display.ISprite;
    import com.tencent.ai.core.data.SceneLayerInfo;
    import com.tencent.ai.core.display.DisplaySystem;
    import com.tencent.ai.core.data.SceneItemInfo;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.SceneLayerDef;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.display.IDisplay;
    import com.tencent.free.logging.debug;
    import flash.geom.Rectangle;
    import  ©init._SafeStr_1138;

    public class BaseSceneLayer extends EventDispatcher implements ISceneLayer 
    {

        protected var m_arrNormalItem:Array;
        protected var m_arrSceneItem:Array;
        protected var m_arrDisplayItem:Array;
        protected var m_layerContainer:ISprite;
        protected var m_curScene:IScene;
        protected var m_camera:ICamera;
        protected var m_loadedState:Boolean;
        protected var m_totalNumber:int;
        protected var m_loadedNumber:int;
        protected var m_layerInfo:SceneLayerInfo;

        public function BaseSceneLayer()
        {
            this.m_layerContainer = DisplaySystem.createSprite();
            this.m_arrNormalItem = [];
            this.m_arrSceneItem = [];
            this.m_arrDisplayItem = [];
            this.m_loadedState = false;
        }

        public function load(_arg_1:IScene, _arg_2:SceneLayerInfo):Boolean
        {
            var _local_5:SceneItemInfo;
            var _local_6:NormalItem;
            var _local_7:BaseElement;
            var _local_3:Boolean = _arg_1.getSceneInfo().createAsync;
            this.m_curScene = _arg_1;
            this.m_layerInfo = _arg_2;
            this.m_totalNumber = 0;
            this.m_loadedNumber = 0;
            if (this.m_layerInfo.id != SceneLayerDef.LAYER_GROUND){
                this.m_layerContainer.mouseChildren = false;
                this.m_layerContainer.mouseEnabled = false;
            };
            var _local_4:Vector.<SceneItemInfo> = _arg_2.itemList;
            for each (_local_5 in _local_4) {
                _local_6 = (_arg_1.createElement(ElementType.ET_NORMALITEM, _local_5, false) as NormalItem);
                if (!_local_3){
                    _local_6.create();
                    _local_6.addEventListener(SceneItemLoadEvent.COMPLETE, this.onItemLoaded);
                    _local_6.addEventListener(SceneItemLoadEvent.ERROR, this.onItemError);
                };
                _local_6.setParentContainer(_arg_1);
                this.pushNormalItem(_local_6);
                this.m_arrSceneItem.push(_local_6);
                if (_local_6.getDisplay()){
                    this.m_arrDisplayItem.push(_local_6);
                    this.m_layerContainer.addDisplay(_local_6.getDisplay());
                };
            };
            if (((!(_local_3)) && ((this.m_arrSceneItem.length > 0)))){
                for each (_local_7 in this.m_arrSceneItem) {
                    this.m_totalNumber++;
                    if (((_local_7.loaded) || (!((_local_7 as NormalItem).resPath)))){
                        this.m_loadedNumber++;
                    } else {
                        this.m_loadedState = false;
                    };
                };
                if (this.m_totalNumber == this.m_loadedNumber){
                    this.m_loadedState = true;
                };
            } else {
                this.m_loadedState = true;
            };
            return (true);
        }

        public function unload():void
        {
            var _local_1:BaseElement;
            var _local_2:IElementFactory;
            for each (_local_1 in this.m_arrDisplayItem) {
                if (_local_1.getDisplay()){
                    this.m_layerContainer.removeDisplay(_local_1.getDisplay());
                };
            };
            this.m_arrDisplayItem.length = 0;
            for each (_local_1 in this.m_arrSceneItem) {
                _local_1.removeEventListener(SceneItemLoadEvent.COMPLETE, this.onItemLoaded);
                _local_1.removeEventListener(SceneItemLoadEvent.ERROR, this.onItemError);
                _local_2 = this.m_curScene.getFactory(_local_1.getType());
                if (_local_2){
                    _local_2.destoryElement(_local_1);
                };
                _local_1.setParentContainer(null);
            };
            this.m_arrSceneItem = null;
            this.m_arrDisplayItem = null;
            this.m_layerContainer = null;
            this.m_curScene = null;
        }

        public function getLayerID():int
        {
            return (this.m_layerInfo.id);
        }

        public function pushNormalItem(_arg_1:NormalItem):void
        {
            _arg_1.layer = this;
            this.m_arrNormalItem.push(_arg_1);
        }

        public function addElement(_arg_1:BaseElement):Boolean
        {
            var _local_2:IDisplay = _arg_1.getDisplay();
            if (_local_2){
                this.m_arrDisplayItem.push(_arg_1);
                this.m_layerContainer.addDisplay(_local_2);
            };
            this.m_arrSceneItem.push(_arg_1);
            _arg_1.mapID = (this.getMaxMapID() + 1);
            return (true);
        }

        public function removeElement(_arg_1:BaseElement):void
        {
            var _local_2:int = this.m_arrSceneItem.indexOf(_arg_1);
            if (_local_2 != -1){
                this.m_arrSceneItem.splice(_local_2, 1);
                _local_2 = this.m_arrDisplayItem.indexOf(_arg_1);
                if (_local_2 != -1){
                    this.m_arrDisplayItem.splice(_local_2, 1);
                    this.m_layerContainer.removeDisplay(_arg_1.getDisplay());
                };
            };
        }

        public function getElementByID(_arg_1:int):BaseElement
        {
            var _local_2:BaseElement;
            for each (_local_2 in this.m_arrSceneItem) {
                if (((_local_2) && ((_local_2.mapID == _arg_1)))){
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getElements():Array
        {
            return (this.m_arrSceneItem);
        }

        public function getNormalItems():Array
        {
            return (this.m_arrNormalItem);
        }

        public function render(_arg_1:int):void
        {
            var _local_3:BaseElement;
            var _local_2:int = (this.m_arrDisplayItem.length - 1);
            while (_local_2 >= 0) {
                _local_3 = this.m_arrDisplayItem[_local_2];
                _local_3.render(_arg_1);
                _local_2--;
            };
        }

        public function getDisplay():IDisplay
        {
            return (this.m_layerContainer);
        }

        protected function onItemLoaded(_arg_1:SceneItemLoadEvent):void
        {
            var _local_2:BaseElement;
            var _local_3:SceneLoadEvent;
            this.m_totalNumber = this.m_arrSceneItem.length;
            this.m_loadedNumber = 0;
            for each (_local_2 in this.m_arrSceneItem) {
                if (_local_2.loaded){
                    this.m_loadedNumber++;
                };
            };
            _local_3 = new SceneLoadEvent(SceneLoadEvent.LOAD_PROESS);
            _local_3.totalItem = this.m_totalNumber;
            _local_3.loadedItem = this.m_loadedNumber;
            this.dispatchEvent(_local_3);
            if (this.m_totalNumber == this.m_loadedNumber){
                this.m_loadedState = true;
                this.sort();
                _local_3 = new SceneLoadEvent(SceneLoadEvent.COMPLETE);
                _local_3.totalItem = this.m_totalNumber;
                _local_3.loadedItem = this.m_loadedNumber;
                this.dispatchEvent(_local_3);
            };
        }

        protected function onItemError(_arg_1:SceneItemLoadEvent):void
        {
            var _local_2:SceneLoadEvent = new SceneLoadEvent(SceneLoadEvent.ERROR);
            var _local_3:NormalItem = (_arg_1.currentTarget as NormalItem);
            _local_2.errorMessage = (((("NormalItem 加载失败: " + _local_3.resPath) + "; ") + _local_3.className) + ".");
            debug(_local_2.errorMessage);
            this.dispatchEvent(_local_2);
        }

        public function get loadedstate():Boolean
        {
            return (this.m_loadedState);
        }

        public function get itemNumber():int
        {
            return (this.m_totalNumber);
        }

        public function get itemLoadedNumber():int
        {
            return (this.m_loadedNumber);
        }

        public function get currentScene():IScene
        {
            return (this.m_curScene);
        }

        public function getMaxMapID():int
        {
            var _local_2:BaseElement;
            var _local_1:int = -1;
            for each (_local_2 in this.m_arrSceneItem) {
                if (_local_1 < _local_2.mapID){
                    _local_1 = _local_2.mapID;
                };
            };
            return (_local_1);
        }

        public function sort():void
        {
            var _local_2:BaseElement;
            var _local_3:IDisplay;
            this.m_arrDisplayItem.sort(this.sortFun);
            var _local_1:uint = this.m_arrDisplayItem.length;
            while (_local_1--) {
                _local_2 = (this.m_arrDisplayItem[_local_1] as BaseElement);
                _local_3 = _local_2.getDisplay();
                if (this.m_layerContainer.getDisplayIndex(_local_3) != _local_1){
                    this.m_layerContainer.setDisplayIndex(_local_3, _local_1);
                };
            };
        }

        protected function sortFun(_arg_1:Object, _arg_2:Object):int
        {
            if ((((_arg_1.mapDeep > _arg_2.mapDeep)) || ((((_arg_1.mapDeep == _arg_2.mapDeep)) && ((_arg_1.mapID > _arg_2.mapID)))))){
                return (1);
            };
            return (-1);
        }

        public function getNormalItemByID(_arg_1:int):NormalItem
        {
            var _local_2:NormalItem;
            for each (_local_2 in this.m_arrNormalItem) {
                if (_local_2.id == _arg_1){
                    return (_local_2);
                };
            };
            return (null);
        }

        public function set renderLevel(_arg_1:int):void
        {
            var _local_3:BaseElement;
            var _local_2:int = this.m_arrDisplayItem.length;
            while (_local_2--) {
                _local_3 = this.m_arrDisplayItem[_local_2];
                if (_local_3.renderLevel >= 0){
                    if (_local_3.renderLevel > _arg_1){
                        _local_3.getDisplay().visible = false;
                    } else {
                        _local_3.getDisplay().visible = true;
                    };
                };
            };
        }

        function checkInCamera():void
        {
            var _local_1:Rectangle;
            var _local_2:BaseElement;
            if (!this.m_camera){
                this.m_camera = this.m_curScene.getCamera();
                if (!this.m_camera){
                    return;
                };
            };
            for each (_local_2 in this.m_arrDisplayItem) {
                _local_1 = _local_2.getBoundsInMap();
                if (_local_1){
                    if (this.m_camera.inCamera(_local_1)){
                        _local_2.getDisplay().visible = true;
                    } else {
                        _local_2.getDisplay().visible = false;
                    };
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1138()
        {
        }


    }
}//package com.tencent.ai.core.scene

// _SafeStr_1138 = " BaseSceneLayer" (String#13973)


