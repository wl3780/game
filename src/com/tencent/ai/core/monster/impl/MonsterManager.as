// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.impl.MonsterManager

package com.tencent.ai.core.monster.impl
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.monster.IMonsterManager;
    import com.tencent.ai.core.monster.IMonsterSystem;
    import com.tencent.ai.core.monster.IMonsterAssetManager;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.monster.BaseMonster;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.data.MonsterInfo;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.monster.IMonsterFactory;
    import com.tencent.ai.core.monster.res.MonsterAsset;
    import com.tencent.ai.core.events.MonsterEvent;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.SceneLayerDef;
    import  ©init._SafeStr_779;
    import __AS3__.vec.*;

    public class MonsterManager extends EventDispatcher implements IMonsterManager 
    {

        protected var m_monsterSys:IMonsterSystem;
        protected var m_resManager:IMonsterAssetManager;
        protected var m_monsters:Vector.<BaseMonster>;
        protected var m_currScene:IScene;
        protected var m_isAIRun:Boolean;
        private var _clearFlag:Boolean = false;

        public function MonsterManager(_arg_1:IMonsterSystem)
        {
            this.m_monsterSys = _arg_1;
            this.m_resManager = _arg_1.getResource();
            this.m_isAIRun = true;
        }

        protected function initSceneMonsters(_arg_1:Vector.<MonsterInfo>):void
        {
            var _local_2:int;
            var _local_3:int;
            if (_arg_1 != null){
                _local_2 = _arg_1.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    this.addMonster(_arg_1[_local_3]);
                    _local_3++;
                };
            };
        }

        protected function clearSceneMonsters():void
        {
            this._clearFlag = true;
            var _local_1:int = (this.m_monsters.length - 1);
            while (_local_1 >= 0) {
                this.m_currScene.destoryElement(this.m_monsters[_local_1]);
                _local_1--;
            };
            this.m_monsters.length = 0;
            this._clearFlag = false;
        }

        protected function onMonsterDisappear(_arg_1:ElementEvent):void
        {
            var _local_3:MonsterInfo;
            var _local_4:EffectInfo;
            var _local_2:BaseMonster = (_arg_1.getTarget() as BaseMonster);
            if (_local_2 != null){
                _local_3 = _local_2.getMonsterInfo();
                if (_local_3.disappearEID != 0){
                    _local_4 = new EffectInfo();
                    _local_4.eid = _local_3.disappearEID;
                    _local_4.location = _local_2.getMapPosition();
                    this.m_currScene.createElement(ElementType.ET_EFFECT, _local_4);
                };
                this.m_currScene.destoryElement(_local_2);
            };
        }

        public function set isAIRun(_arg_1:Boolean):void
        {
            var _local_2:int;
            if (this.m_isAIRun != _arg_1){
                this.m_isAIRun = _arg_1;
                _local_2 = 0;
                while (_local_2 < this.m_monsters.length) {
                    this.m_monsters[_local_2].isAIComRun = this.m_isAIRun;
                    _local_2++;
                };
            };
        }

        public function get isAIRun():Boolean
        {
            return (this.m_isAIRun);
        }

        public function serverMonsterDead(_arg_1:int):void
        {
            var _local_2:BaseMonster = this.getMonsterByID(_arg_1);
            if (_local_2 != null){
                _local_2.setIsServerDead(true);
            };
        }

        public function addMonster(_arg_1:MonsterInfo):BaseMonster
        {
            return ((this.m_currScene.createElement(ElementType.ET_MONSTER, _arg_1) as BaseMonster));
        }

        public function removeMonster(_arg_1:uint):void
        {
            var _local_2:BaseMonster = this.getMonsterByID(_arg_1);
            if (_local_2 != null){
                this.m_currScene.destoryElement(_local_2);
            };
        }

        public function indexOfMonster(_arg_1:uint):int
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:BaseMonster;
            if (this.m_monsters != null){
                _local_2 = this.m_monsters.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_4 = this.m_monsters[_local_3];
                    if (_local_4.id == _arg_1){
                        return (_local_3);
                    };
                    _local_3++;
                };
            };
            return (-1);
        }

        public function getMonsterByID(_arg_1:uint):BaseMonster
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:BaseMonster;
            if (this.m_monsters != null){
                _local_2 = this.m_monsters.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_4 = this.m_monsters[_local_3];
                    if (_local_4.id == _arg_1){
                        return (_local_4);
                    };
                    _local_3++;
                };
            };
            return (null);
        }

        public function getMonsterByMonsterID(_arg_1:uint):BaseMonster
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:BaseMonster;
            if (this.m_monsters != null){
                _local_2 = this.m_monsters.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_4 = this.m_monsters[_local_3];
                    if (((_local_4) && ((MonsterInfo(_local_4.getActorInfo()).monsterID == _arg_1)))){
                        return (_local_4);
                    };
                    _local_3++;
                };
            };
            return (null);
        }

        public function initialize(_arg_1:Object=null):void
        {
            this.m_monsters = new Vector.<BaseMonster>();
        }

        public function bindScene(_arg_1:IScene, _arg_2:Vector.<MonsterInfo>):void
        {
            this.m_currScene = _arg_1;
            _arg_1.registerFactory(this);
            this.initSceneMonsters(_arg_2);
        }

        public function getBindScene():IScene
        {
            return (this.m_currScene);
        }

        public function unbind():void
        {
            if (this.m_currScene != null){
                this.clearSceneMonsters();
                this.m_currScene.unRegisterFactory(this.getElementType());
                this.m_currScene = null;
            };
            this.m_isAIRun = true;
        }

        public function clear():void
        {
            if (this.m_currScene != null){
                this.clearSceneMonsters();
            };
        }

        public function dispose():void
        {
        }

        public function getMonsters():Vector.<BaseMonster>
        {
            return (this.m_monsters);
        }

        public function getElementType():String
        {
            return (ElementType.ET_MONSTER);
        }

        public function createElement(_arg_1:Object=null):BaseElement
        {
            var _local_2:MonsterInfo = (_arg_1 as MonsterInfo);
            var _local_3:IMonsterFactory = this.m_monsterSys.getFactory(_local_2.type);
            var _local_4:BaseMonster = _local_3.newMonster(_local_2);
            var _local_5:MonsterAsset = this.m_resManager.getMonsterAsset(_local_2.staticInfo, this);
            _local_4.getMonsterView().addAsset(_local_5);
            _local_4.initialize(_local_2);
            _local_4.isAIComRun = this.m_isAIRun;
            this.m_monsters.push(_local_4);
            _local_4.addEventListener(ElementEvent.ON_ELEMENT_DISAPPEAR, this.onMonsterDisappear);
            var _local_6:MonsterEvent = new MonsterEvent(MonsterEvent.ON_MONSTER_ADDED);
            _local_6.data = _local_2;
            dispatchEvent(_local_6);
            return (_local_4);
        }

        public function destoryElement(_arg_1:BaseElement):void
        {
            var _local_5:MonsterEvent;
            var _local_2:BaseMonster = (_arg_1 as BaseMonster);
            _local_2.removeEventListener(ElementEvent.ON_ELEMENT_DISAPPEAR, this.onMonsterDisappear);
            var _local_3:int = this.m_monsters.indexOf(_local_2);
            if (_local_3 != -1){
                this.m_monsters.splice(_local_3, 1);
            };
            var _local_4:MonsterInfo = _local_2.getMonsterInfo();
            this.m_resManager.returnMonsterAsset(_local_2.getMonsterView().removeAsset(), this);
            this.m_monsterSys.getFactory(_local_4.type).returnMonster(_local_2);
            if (!this._clearFlag){
                _local_5 = new MonsterEvent(MonsterEvent.ON_MONSTER_REMOVED);
                _local_5.data = _local_4;
                dispatchEvent(_local_5);
            };
        }

        public function removeSpcialGroupMonster(_arg_1:int, _arg_2:int):void
        {
        }

        public function getDefaultLayerID():int
        {
            return (SceneLayerDef.LAYER_GROUND);
        }

        public function isEmpty(_arg_1:int=0):Boolean
        {
            var _local_2:int = (this.m_monsters.length - 1);
            while (_local_2 >= 0) {
                if (this.m_monsters[_local_2].groupID == _arg_1){
                    return (false);
                };
                _local_2--;
            };
            return (true);
        }

        public /*  ©init. */ function _SafeStr_779()
        {
        }


    }
}//package com.tencent.ai.core.monster.impl

// _SafeStr_779 = " MonsterManager" (String#14729)


