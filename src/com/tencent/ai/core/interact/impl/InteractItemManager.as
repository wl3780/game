// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.impl.InteractItemManager

package com.tencent.ai.core.interact.impl
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.interact.IInteractItemManager;
    import com.tencent.ai.core.interact.IInteractItemSystem;
    import com.tencent.ai.core.interact.IInteractItemAssetManager;
    import com.tencent.ai.core.manager.data.IDataManager;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.interact.BaseInteractItem;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.data.InteractItemInfo;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.data.InteractItemStaticInfo;
    import com.tencent.ai.core.interact.IInteractItemFactory;
    import com.tencent.ai.core.interact.InteractItemController;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.SceneLayerDef;
    import  ©init._SafeStr_574;
    import __AS3__.vec.*;

    public class InteractItemManager extends EventDispatcher implements IInteractItemManager 
    {

        protected var interactItemSys:IInteractItemSystem;
        protected var resManager:IInteractItemAssetManager;
        protected var data:IDataManager;
        protected var interactItems:Vector.<BaseInteractItem>;
        protected var curr_scene:IScene;

        public function InteractItemManager(_arg_1:IInteractItemSystem, _arg_2:IDataManager)
        {
            this.interactItemSys = _arg_1;
            this.data = _arg_2;
            this.resManager = _arg_1.getResource();
        }

        protected function initSceneInteractItem(_arg_1:Vector.<InteractItemInfo>):void
        {
            var _local_4:InteractItemInfo;
            if (_arg_1 == null){
                return;
            };
            var _local_2:int = _arg_1.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = _arg_1[_local_3];
                (this.curr_scene.createElement(ElementType.ET_INTERACT, _local_4) as BaseInteractItem);
                _local_3++;
            };
        }

        protected function clearSceneInteractItems():void
        {
            var _local_1:int = (this.interactItems.length - 1);
            while (_local_1 >= 0) {
                this.curr_scene.destoryElement(this.interactItems[_local_1]);
                _local_1--;
            };
            this.interactItems.length = 0;
        }

        public function indexOfInteractItem(_arg_1:int):int
        {
            var _local_4:BaseInteractItem;
            if (this.interactItems == null){
                return (-1);
            };
            var _local_2:int = this.interactItems.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = this.interactItems[_local_3];
                if (_local_4.id == _arg_1){
                    return (_local_3);
                };
                _local_3++;
            };
            return (-1);
        }

        public function getInteractItemByID(_arg_1:int):BaseInteractItem
        {
            var _local_4:BaseInteractItem;
            if (this.interactItems == null){
                return (null);
            };
            var _local_2:int = this.interactItems.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = this.interactItems[_local_3];
                if (_local_4.getInteractItemInfo().interactItemID == _arg_1){
                    return (_local_4);
                };
                _local_3++;
            };
            return (null);
        }

        public function initialize(_arg_1:Object=null):void
        {
            this.interactItems = new Vector.<BaseInteractItem>();
        }

        public function bindScene(_arg_1:IScene, _arg_2:Vector.<InteractItemInfo>):void
        {
            this.curr_scene = _arg_1;
            _arg_1.registerFactory(this);
            this.initSceneInteractItem(_arg_2);
        }

        public function unbind():void
        {
            if (this.curr_scene != null){
                this.clearSceneInteractItems();
                this.curr_scene.unRegisterFactory(this.getElementType());
                this.curr_scene = null;
            };
        }

        public function clear():void
        {
        }

        public function dispose():void
        {
        }

        public function getInteractItems():Vector.<BaseInteractItem>
        {
            return (this.interactItems);
        }

        public function getElementType():String
        {
            return (ElementType.ET_INTERACT);
        }

        public function createElement(_arg_1:Object=null):BaseElement
        {
            var _local_2:InteractItemInfo = (_arg_1 as InteractItemInfo);
            var _local_3:InteractItemStaticInfo = this.data.getInteractItemStaticInfo(_local_2.interactItemID);
            if (!_local_3){
                throw (new Error((("找不到物件ID为" + _local_2.interactItemID.toString()) + "的物件")));
            };
            _local_2.setStaticInfo(_local_3);
            var _local_4:IInteractItemFactory = this.interactItemSys.getFactory(_local_2.interactItemType);
            if (!_local_4){
                throw (new Error(((("interactItemType 为 " + _local_2.interactItemType) + " 的 factory 不存在，请检查FactoryInfos.xml表。交互物件ID是：") + _local_2.interactItemID)));
            };
            var _local_5:BaseInteractItem = _local_4.newInteractItem(_local_2);
            _local_5.setResManager(this.resManager);
            _local_5.initialize(_local_2);
            var _local_6:InteractItemController = new InteractItemController(_local_5);
            _local_5.setController(_local_6);
            this.interactItems.push(_local_5);
            return (_local_5);
        }

        public function destoryElement(_arg_1:BaseElement):void
        {
            var _local_2:BaseInteractItem = (_arg_1 as BaseInteractItem);
            var _local_3:int = this.interactItems.indexOf(_local_2);
            if (_local_3 != -1){
                this.interactItems.splice(_local_3, 1);
            };
            var _local_4:int = _local_2.getItemType();
            this.interactItemSys.getFactory(_local_4).returnInteractItem(_local_2);
        }

        public function getDefaultLayerID():int
        {
            return (SceneLayerDef.LAYER_GROUND);
        }

        public function addDropItems(_arg_1:Array):void
        {
        }

        public /*  ©init. */ function _SafeStr_574()
        {
        }


    }
}//package com.tencent.ai.core.interact.impl

// _SafeStr_574 = " InteractItemManager" (String#15824)


