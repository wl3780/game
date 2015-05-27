// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.NormalItem

package com.tencent.ai.core.scene
{
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.scene.property.IPropertyTarget;
    import com.tencent.ai.core.manager.framespackage.FramesPackageLoader;
    import com.tencent.ai.core.data.SceneItemInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.scene.property.AbstractProperty;
    import flash.geom.Rectangle;
    import com.tencent.ai.core.data.SceneInfo;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.display.DisplaySystem;
    import com.tencent.ai.core.manager.framespackage.IFramesPackageFile;
    import com.tencent.ai.core.render.IBitmapDisplay;
    import flash.display.BitmapData;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_1139;
    import __AS3__.vec.*;

    public class NormalItem extends BaseElement implements IPropertyTarget 
    {

        public var layer:ISceneLayer;
        protected var m_fpLoader:FramesPackageLoader;
        protected var m_itemInfo:SceneItemInfo;
        protected var m_propertyList:Vector.<AbstractProperty>;
        protected var m_mapBounds:Rectangle;
        protected var m_loading:Boolean;
        protected var m_sceneInfo:SceneInfo;

        public function NormalItem()
        {
            super(ElementType.ET_NORMALITEM);
        }

        public function get resPath():String
        {
            return (this.m_itemInfo.resPath);
        }

        public function get className():String
        {
            return (this.m_itemInfo.className);
        }

        public function initialize(_arg_1:SceneItemInfo):Boolean
        {
            this.m_itemInfo = _arg_1;
            this.renderLevel = _arg_1.renderLevel;
            this.setMapX(this.m_itemInfo.x);
            this.setMapZ(this.m_itemInfo.z);
            this.mapDeep = this.m_itemInfo.deep;
            this.id = _arg_1.id;
            this.m_propertyList = new Vector.<AbstractProperty>();
            this.m_display = DisplaySystem.createBitmapDisplay();
            return (true);
        }

        override public function render(_arg_1:int):void
        {
            var _local_2:AbstractProperty;
            super.render(_arg_1);
            for each (_local_2 in this.m_propertyList) {
                _local_2.render();
            };
            if (((!(this.m_sceneInfo)) && (this.layer))){
                this.m_sceneInfo = this.layer.currentScene.getSceneInfo();
            };
            if (((((((this.m_sceneInfo) && (!(this.loaded)))) && (!(this.m_loading)))) && (this.m_sceneInfo.createAsync))){
                this.checkInCamera();
            };
        }

        override public function dispose():void
        {
            while (this.m_propertyList.length) {
                this.m_propertyList.pop().uninstall();
            };
            if (this.m_fpLoader){
                this.removeListener();
                this.m_fpLoader.unload();
                this.m_fpLoader = null;
            };
            this.m_display = null;
            this.m_propertyList = null;
            this.m_itemInfo = null;
            this.layer = null;
        }

        public function addProperty(_arg_1:AbstractProperty):void
        {
            if (!_arg_1){
                return;
            };
            _arg_1.install(this);
            this.m_propertyList.push(_arg_1);
        }

        public function removeProperty(_arg_1:AbstractProperty):void
        {
            if (!_arg_1){
                return;
            };
            _arg_1.uninstall();
            var _local_2:int = this.m_propertyList.indexOf(_arg_1);
            if (_local_2 > -1){
                this.m_propertyList.splice(_local_2, 1);
            };
        }

        public function getProperty():Vector.<AbstractProperty>
        {
            return (this.m_propertyList);
        }

        public function getPropertyByType(_arg_1:String):Vector.<AbstractProperty>
        {
            var _local_3:AbstractProperty;
            var _local_2:Vector.<AbstractProperty> = new Vector.<AbstractProperty>();
            for each (_local_3 in this.m_propertyList) {
                if (_local_3.getType() == _arg_1){
                    _local_2.push(_local_3);
                };
            };
            return (_local_2);
        }

        override public function setDirection(_arg_1:int):void
        {
            super.setDirection(_arg_1);
            this.m_display.scaleX = _arg_1;
        }

        public function setDirectionY(_arg_1:int):void
        {
            this.m_display.scaleY = _arg_1;
        }

        public function getInfo():SceneItemInfo
        {
            return (this.m_itemInfo);
        }

        private function onFramesPackageLoadComplete(_arg_1:TaskEvent):void
        {
            this.m_loading = false;
            this.loaded = true;
            this.setMapX(this.mapX);
            this.setMapZ(this.mapZ);
            this.mapDeep = this.m_itemInfo.deep;
            var _local_2:IFramesPackageFile = (this.m_fpLoader.content as IFramesPackageFile);
            var _local_3:IBitmapDisplay = (this.m_display as IBitmapDisplay);
            _local_3.bitmapData = (_local_2.findBitmapData(this.m_itemInfo.className) as BitmapData);
            _local_3.alpha = this.m_itemInfo.alpha;
            this.removeListener();
            var _local_4:SceneItemLoadEvent = new SceneItemLoadEvent(SceneItemLoadEvent.COMPLETE);
            this.dispatchEvent(_local_4);
        }

        private function onFramesPackageLoadError(_arg_1:TaskEvent):void
        {
            this.m_loading = false;
            var _local_2:SceneItemLoadEvent = new SceneItemLoadEvent(SceneItemLoadEvent.ERROR);
            this.dispatchEvent(_local_2);
        }

        private function onProgressFile(_arg_1:TaskEvent):void
        {
            this.dispatchEvent(_arg_1);
        }

        private function removeListener():void
        {
            this.m_fpLoader.content.removeEventListener(TaskEvent.COMPLETE, this.onFramesPackageLoadComplete);
            this.m_fpLoader.content.removeEventListener(TaskEvent.IO_ERROR, this.onFramesPackageLoadError);
            this.m_fpLoader.content.removeEventListener(TaskEvent.CHECK_ERROR, this.onFramesPackageLoadError);
            this.m_fpLoader.content.removeEventListener(TaskEvent.SECURITY_ERROR, this.onFramesPackageLoadError);
            this.m_fpLoader.content.removeEventListener(TaskEvent.PROGRESS, this.onProgressFile);
        }

        override public function getBoundsInMap():Rectangle
        {
            if (!this.m_mapBounds){
                this.m_mapBounds = new Rectangle(0, 0, this.m_itemInfo.width, this.m_itemInfo.height);
            };
            this.m_mapBounds.x = this.mapX;
            this.m_mapBounds.y = this.mapZ;
            return (this.m_mapBounds);
        }

        public function create():void
        {
            if (((this.loaded) || (this.m_loading))){
                return;
            };
            if (!this.m_itemInfo.resPath){
                this.loaded = true;
                return;
            };
            this.m_fpLoader = new FramesPackageLoader((DEFINE.G_SCENE_RES_SRC + this.m_itemInfo.resPath));
            this.m_fpLoader.content.addEventListener(TaskEvent.COMPLETE, this.onFramesPackageLoadComplete);
            this.m_fpLoader.content.addEventListener(TaskEvent.IO_ERROR, this.onFramesPackageLoadError);
            this.m_fpLoader.content.addEventListener(TaskEvent.CHECK_ERROR, this.onFramesPackageLoadError);
            this.m_fpLoader.content.addEventListener(TaskEvent.SECURITY_ERROR, this.onFramesPackageLoadError);
            this.m_fpLoader.content.addEventListener(TaskEvent.PROGRESS, this.onProgressFile);
            this.m_fpLoader.load();
            this.m_loading = true;
        }

        protected function checkInCamera():void
        {
            if (((((((this.m_sceneInfo.createAsync) && (!(this.loaded)))) && (!(this.m_loading)))) && (this.layer.currentScene.getCamera().inCamera(this.getBoundsInMap())))){
                this.create();
            };
        }

        public /*  ©init. */ function _SafeStr_1139()
        {
        }


    }
}//package com.tencent.ai.core.scene

// _SafeStr_1139 = " NormalItem" (String#14714)


