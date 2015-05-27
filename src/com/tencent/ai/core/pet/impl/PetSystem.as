// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.pet.impl.PetSystem

package com.tencent.ai.core.pet.impl
{
    import com.tencent.ai.core.pet.IPetSystem;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.effect.IEffectManager;
    import com.tencent.ai.core.pet.res.PetAssetManager;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.FactoryInfo;
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.ai.core.enum.ElementType;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.AIInitClasses;
    import com.tencent.ai.core.pet.IPetAssetManager;
    import com.tencent.ai.core.pet.IPetManager;
    import com.tencent.ai.core.pet.IFollowPetModel;
    import com.tencent.ai.core.data.PetStaticInfo;
    import com.tencent.ai.core.pet.IPetFactory;
    import  ©init._SafeStr_824;

    public class PetSystem implements IPetSystem 
    {

        private var _data:IDataManager;
        private var _effect:IEffectManager;
        private var _resManager:PetAssetManager;
        private var _petFactorys:Dictionary;
        private var _modelManager:FollowPetModel;

        public function PetSystem(_arg_1:IDataManager, _arg_2:IEffectManager)
        {
            this._data = _arg_1;
            this._effect = _arg_2;
        }

        public function initialize(_arg_1:AIInitClasses):void
        {
            var _local_6:FactoryInfo;
            var _local_7:int;
            var _local_2:CLASS = CLASS.current;
            this._petFactorys = new Dictionary();
            this._resManager = new PetAssetManager(this, this._effect, this._data);
            this._resManager.initialize();
            var _local_3:Vector.<FactoryInfo> = this._data.getFactoryInfos(ElementType.ET_PET);
            var _local_4:int = _local_3.length;
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _local_3[_local_5];
                _local_7 = _local_6.itemType;
                this._petFactorys[_local_7] = _local_2.tryNewInstance(_local_6.className, [_local_7]);
                _local_5++;
            };
            this._modelManager = new FollowPetModel();
        }

        public function getResource():IPetAssetManager
        {
            return (this._resManager);
        }

        public function newManager(_arg_1:Class=null):IPetManager
        {
            if (_arg_1 == null){
                _arg_1 = PetManager;
            };
            return (new (_arg_1)(this));
        }

        public function getPetModelManager():IFollowPetModel
        {
            return (this._modelManager);
        }

        public function newFactory(_arg_1:PetStaticInfo, _arg_2:CLASS):void
        {
            var _local_3:int = _arg_1.petType;
            if (this._petFactorys[_local_3] != null){
                return;
            };
            if (_arg_2 == null){
                _arg_2 = CLASS.current;
            };
            this._petFactorys[_local_3] = _arg_2.newInstance(_arg_1.petFactory, [_local_3]);
        }

        public function getFactory(_arg_1:int):IPetFactory
        {
            return (this._petFactorys[_arg_1]);
        }

        public function disposeFactory(_arg_1:int):void
        {
        }

        public /*  ©init. */ function _SafeStr_824()
        {
        }


    }
}//package com.tencent.ai.core.pet.impl

// _SafeStr_824 = " PetSystem" (String#17021)


