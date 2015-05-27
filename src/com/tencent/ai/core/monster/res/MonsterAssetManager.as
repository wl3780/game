// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.res.MonsterAssetManager

package com.tencent.ai.core.monster.res
{
    import com.tencent.ai.core.monster.IMonsterAssetManager;
    import com.tencent.ai.core.monster.IMonsterSystem;
    import com.tencent.ai.core.effect.IEffectManager;
    import com.tencent.ai.core.manager.data.IDataManager;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.MonsterStaticInfo;
    import com.tencent.free.core.manager.task.Priority;
    import  ©init._SafeStr_782;

    public class MonsterAssetManager implements IMonsterAssetManager 
    {

        protected var m_monsterSys:IMonsterSystem;
        protected var m_effect:IEffectManager;
        protected var m_data:IDataManager;
        protected var m_monsterAssets:Dictionary;
        protected var m_segmentAssets:Dictionary;

        public function MonsterAssetManager(_arg_1:IMonsterSystem, _arg_2:IEffectManager, _arg_3:IDataManager)
        {
            this.m_monsterSys = _arg_1;
            this.m_effect = _arg_2;
            this.m_data = _arg_3;
        }

        public function initialize():void
        {
            this.m_monsterAssets = new Dictionary();
            this.m_segmentAssets = new Dictionary();
        }

        public function getMonsterAssets(_arg_1:int):Array
        {
            var _local_6:MonsterStaticInfo;
            var _local_2:Array = this.m_data.getAllMonsterStaticInfo();
            var _local_3:Array = [];
            var _local_4:int = _local_2.length;
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _local_2[_local_5];
                if (_local_6.loadType == _arg_1){
                    _local_3.push(this.getMonsterAsset(_local_6, this));
                };
                _local_5++;
            };
            return (_local_3);
        }

        public function getMonsterAsset(_arg_1:MonsterStaticInfo, _arg_2:Object):MonsterAsset
        {
            if (_arg_1 == null){
                return (null);
            };
            var _local_3:int = _arg_1.assetID;
            var _local_4:MonsterAsset = this.m_monsterAssets[_local_3];
            if (_local_4 == null){
                _local_4 = new MonsterAsset(_arg_1, this);
                this.m_monsterAssets[_local_3] = _local_4;
            };
            if (_arg_2 != null){
                _local_4.addRef(_arg_2);
            };
            return (_local_4);
        }

        public function returnMonsterAsset(_arg_1:MonsterAsset, _arg_2:Object):void
        {
            _arg_1.removeRef(_arg_2);
            if (_arg_1.getRefsLen() == 0){
                delete this.m_monsterAssets[_arg_1.assetID];
                _arg_1.unload();
            };
        }

        public function getSegmentAsset(_arg_1:String, _arg_2:Object):SegmentAsset
        {
            var _local_3:SegmentAsset = this.m_segmentAssets[_arg_1];
            if (_local_3 == null){
                _local_3 = new SegmentAsset(_arg_1);
                _local_3.priority = Priority.PERIORITY_NORMAL_MONSTER;
                this.m_monsterAssets[_arg_1] = _local_3;
            };
            if (_arg_2 != null){
                _local_3.addRef(_arg_2);
            };
            return (_local_3);
        }

        public function returnSegmentAsset(_arg_1:SegmentAsset, _arg_2:Object):void
        {
            _arg_1.removeRef(_arg_2);
            if (_arg_1.getRefsLen() == 0){
                delete this.m_segmentAssets[_arg_1.segURL];
                _arg_1.unload();
            };
        }

        public /*  ©init. */ function _SafeStr_782()
        {
        }


    }
}//package com.tencent.ai.core.monster.res

// _SafeStr_782 = " MonsterAssetManager" (String#17114)


