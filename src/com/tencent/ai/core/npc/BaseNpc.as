// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.npc.BaseNpc

package com.tencent.ai.core.npc
{
    import com.tencent.ai.core.element.InteractElement;
    import flash.filters.GlowFilter;
    import com.tencent.ai.core.render.IElementView;
    import com.tencent.ai.core.data.SceneNpcInfo;
    import com.tencent.ai.core.data.NpcDialogNormalInfo;
    import com.tencent.ai.core.element.shadow.ShadowElement;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.element.shadow.ShadowPools;
    import com.tencent.ai.core.element.IElementContainer;
    import com.tencent.ai.core.events.NpcModelEvent;
    import com.tencent.ai.core.data.arg.script.OpenDialogArg;
    import com.tencent.ai.core.data.NpcStaticInfo;
    import com.tencent.ai.core.global_script;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.AICore;
    import flash.events.MouseEvent;
    import com.tencent.ai.core.manager.key.KeyManager;
    import com.tencent.ai.core.display.IDisplay;
    import flash.geom.Rectangle;
    import  ©init._SafeStr_817;

    public class BaseNpc extends InteractElement 
    {

        private static const strokeFilter:GlowFilter = new GlowFilter(16777011, 1, 6, 6, 6);

        public var view:IElementView;
        public var sceneNpcInfo:SceneNpcInfo;
        protected var npcAssetManager:INpcAssetManager;
        protected var _active:Boolean;
        protected var m_dlgInfo:NpcDialogNormalInfo;
        protected var m_shadow:ShadowElement;
        protected var m_scene:IScene;

        public function BaseNpc()
        {
            super(ElementType.ET_NPC);
            this.loaded = true;
        }

        override protected function initThis():void
        {
            super.initThis();
            if (this.m_shadow == null){
                this.m_shadow = ShadowPools.createShadowElement();
            };
        }

        override public function setParentContainer(_arg_1:IElementContainer):void
        {
            super.setParentContainer(_arg_1);
            this.m_scene = (_arg_1 as IScene);
            if (this.m_shadow != null){
                this.m_shadow.setScene(this.m_scene);
            };
            if (this.view != null){
                this.view.setParentContainer(this.m_scene);
            };
        }

        public function get active():Boolean
        {
            return (this._active);
        }

        public function set active(_arg_1:Boolean):void
        {
            this._active = _arg_1;
            useClickEvent = _arg_1;
        }

        public function setNpcAssetManger(_arg_1:INpcAssetManager):void
        {
            this.npcAssetManager = _arg_1;
        }

        public function initialize(_arg_1:SceneNpcInfo):void
        {
            this.m_shadow.setTarget(this);
            this.m_shadow.initialize();
            this.id = _arg_1.id;
            this.sceneNpcInfo = _arg_1;
            this.sceneNpcInfo.npcModel.addEventListener(NpcModelEvent.CHANGE_STATUS, this.onNpcStatusChange, false, 0, true);
            this.setMapPosition(_arg_1.mapPosition);
            this.setDirection(_arg_1.direction);
            this.m_dlgInfo = new NpcDialogNormalInfo();
            this.onNpcStatusChange(null);
            this.active = true;
        }

        override protected function onDisplayClick(_arg_1:MouseEvent):void
        {
            var _local_5:String;
            super.onDisplayClick(_arg_1);
            var _local_2:OpenDialogArg = new OpenDialogArg();
            var _local_3:NpcStaticInfo = this.sceneNpcInfo.npcModel.staticInfo;
            if (_local_3.dialogMessageList.length){
                this.m_dlgInfo.message = _local_3.dialogMessageList[int((Math.random() * _local_3.dialogMessageList.length))];
            } else {
                this.m_dlgInfo.message = "我沉默~~";
            };
            _local_2.info = this.m_dlgInfo;
            global_script(this.sceneNpcInfo.npcModel.staticInfo.clickCmd, _local_2);
            var _local_4:int = this.sceneNpcInfo.npcModel.staticInfo.numTalk;
            if (_local_4){
                _local_4 = int(((Math.random() * _local_4) + 1));
                _local_5 = (((((DEFINE.SOUND_RES_SRC + "mp3/npc/") + this.sceneNpcInfo.id) + "/") + _local_4) + ".mp3");
                AICore.sound.playMp3(this, _local_5);
            };
        }

        override protected function onDisplayMouseOver(_arg_1:MouseEvent):void
        {
            this.view.getBodyDisplay().filters = [strokeFilter];
        }

        override protected function onDisplayMouseOut(_arg_1:MouseEvent):void
        {
            this.view.getBodyDisplay().filters = null;
        }

        public function click():void
        {
            this.onDisplayClick(new MouseEvent(MouseEvent.CLICK));
        }

        public function getSceneNpcInfo():SceneNpcInfo
        {
            return (this.sceneNpcInfo);
        }

        override public function reset():void
        {
            this.m_scene = null;
            this.npcAssetManager = null;
            if (this.view){
                this.view.reset();
            };
            if (this.sceneNpcInfo){
                this.sceneNpcInfo.npcModel.removeEventListener(NpcModelEvent.CHANGE_STATUS, this.onNpcStatusChange);
                this.sceneNpcInfo = null;
            };
            this.active = false;
            super.reset();
        }

        public function changeStatus(_arg_1:int):void
        {
        }

        private function callBack():void
        {
            KeyManager.setEnabled(true);
        }

        private function onNpcStatusChange(_arg_1:NpcModelEvent):void
        {
            var _local_2:NpcStaticInfo = this.sceneNpcInfo.npcModel.staticInfo;
            this.m_dlgInfo.name = _local_2.name;
            this.m_dlgInfo.rank = _local_2.rank;
            this.m_dlgInfo.npcID = this.sceneNpcInfo.id;
            this.m_dlgInfo.optionList = this.sceneNpcInfo.npcModel.getDialogOptionInfos();
            this.m_dlgInfo.mood = this.sceneNpcInfo.npcModel.mood;
            this.changeStatus(this.sceneNpcInfo.npcModel.status);
        }

        override public function dispose():void
        {
            this.reset();
            this.view.setParentContainer(null);
            this.view = null;
            this.m_shadow.reset();
            this.m_shadow = null;
            this.sceneNpcInfo = null;
            this.m_dlgInfo = null;
            AICore.sound.disposeRef(this);
            super.dispose();
        }

        override public function getBodyHeight():Number
        {
            var _local_1:IDisplay;
            var _local_2:Rectangle;
            if (this.view){
                _local_1 = this.view.getBodyDisplay();
                _local_2 = _local_1.getDisplayBounds(this.view.getDisplay());
                return (Math.abs(_local_2.top));
            };
            return (0);
        }

        override public function setDirection(_arg_1:int):void
        {
            this.view.setDirection(_arg_1);
            super.setDirection(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_817()
        {
        }


    }
}//package com.tencent.ai.core.npc

// _SafeStr_817 = " BaseNpc" (String#14897)


