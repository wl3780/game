// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.npc.impl.NpcManager

package com.tencent.ai.core.npc.impl
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.npc.INpcManager;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.npc.INpcAssetManager;
    import com.tencent.ai.core.npc.INpcSystem;
    import com.tencent.ai.core.scene.IScene;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.npc.BaseNpc;
    import com.tencent.ai.core.data.SceneNpcInfo;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.SceneLayerDef;
    import  ©init._SafeStr_810;
    import __AS3__.vec.*;

    public class NpcManager extends EventDispatcher implements INpcManager 
    {

        protected var dataManager:IDataManager;
        protected var npcAssetManager:INpcAssetManager;
        protected var npcsys:INpcSystem;
        protected var curr_scene:IScene;
        protected var curr_npcs:Vector.<BaseNpc>;

        public function NpcManager(_arg_1:INpcSystem, _arg_2:IDataManager)
        {
            this.npcsys = _arg_1;
            this.dataManager = _arg_2;
            this.npcAssetManager = _arg_1.getNpcAssetManager();
        }

        protected function addSceneNpcs(_arg_1:Vector.<SceneNpcInfo>):void
        {
            var _local_2:SceneNpcInfo;
            var _local_3:BaseNpc;
            if (((!(_arg_1)) || (!(_arg_1.length)))){
                return;
            };
            var _local_4:int;
            var _local_5:* = _arg_1;
            for each (_local_2 in _arg_1) {
                _local_3 = (this.curr_scene.createElement(ElementType.ET_NPC, _local_2) as BaseNpc);
            };
        }

        protected function removeSceneNpcs():void
        {
            var _local_1:int = this.curr_npcs.length;
            while (_local_1--) {
                this.curr_scene.destoryElement(this.curr_npcs[_local_1]);
            };
            this.curr_npcs.length = 0;
        }

        public function initialize(_arg_1:Object=null):void
        {
            this.curr_npcs = new Vector.<BaseNpc>();
        }

        public function bindScene(_arg_1:IScene, _arg_2:Vector.<SceneNpcInfo>):void
        {
            this.curr_scene = _arg_1;
            _arg_1.registerFactory(this);
            this.addSceneNpcs(_arg_2);
        }

        public function unbind():void
        {
            if (this.curr_scene != null){
                this.removeSceneNpcs();
                this.curr_scene.unRegisterFactory(this.getElementType());
                this.curr_scene = null;
            };
        }

        public function getNpcList():Vector.<BaseNpc>
        {
            return (this.curr_npcs);
        }

        public function getElementType():String
        {
            return (ElementType.ET_NPC);
        }

        public function createElement(_arg_1:Object=null):BaseElement
        {
            var _local_2:SceneNpcInfo = (_arg_1 as SceneNpcInfo);
            _local_2.npcModel = AICore.npcSystem.getNpcModelManager().getNpcModelByID(_local_2.id);
            var _local_3:NormalNpc = new NormalNpc();
            _local_3.setNpcAssetManger(this.npcAssetManager);
            _local_3.initialize(_local_2);
            this.curr_npcs.push(_local_3);
            return (_local_3);
        }

        public function destoryElement(_arg_1:BaseElement):void
        {
            var _local_2:BaseNpc = (_arg_1 as BaseNpc);
            if (_local_2){
                _local_2.dispose();
            };
        }

        public function getDefaultLayerID():int
        {
            return (SceneLayerDef.LAYER_GROUND);
        }

        public function getNpcBy(_arg_1:int):BaseNpc
        {
            var _local_2:BaseNpc;
            for each (_local_2 in this.curr_npcs) {
                if (_local_2.id == _arg_1){
                    return (_local_2);
                };
            };
            return (null);
        }

        public /*  ©init. */ function _SafeStr_810()
        {
        }


    }
}//package com.tencent.ai.core.npc.impl

// _SafeStr_810 = " NpcManager" (String#17582)


