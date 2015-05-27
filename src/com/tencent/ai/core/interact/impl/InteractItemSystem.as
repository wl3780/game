// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.impl.InteractItemSystem

package com.tencent.ai.core.interact.impl
{
    import com.tencent.ai.core.interact.IInteractItemSystem;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.effect.IEffectManager;
    import com.tencent.ai.core.interact.res.InteractItemAssetManager;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.FactoryInfo;
    import com.tencent.ai.core.enum.ElementType;
    import __AS3__.vec.Vector;
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.ai.core.data.InteractItemStaticInfo;
    import com.tencent.ai.core.interact.IInteractItemFactory;
    import com.tencent.ai.core.interact.IInteractItemAssetManager;
    import com.tencent.ai.core.interact.IInteractItemManager;
    import  ©init._SafeStr_576;

    public class InteractItemSystem implements IInteractItemSystem 
    {

        protected var data:IDataManager;
        protected var effect:IEffectManager;
        protected var resManager:InteractItemAssetManager;
        protected var interactItemFactorys:Dictionary;

        public function InteractItemSystem(_arg_1:IDataManager, _arg_2:IEffectManager)
        {
            this.data = _arg_1;
            this.effect = _arg_2;
        }

        public function initialize():void
        {
            var _local_5:FactoryInfo;
            var _local_6:int;
            this.interactItemFactorys = new Dictionary();
            this.resManager = new InteractItemAssetManager(this, this.effect, this.data);
            this.resManager.initialize();
            var _local_1:Vector.<FactoryInfo> = this.data.getFactoryInfos(ElementType.ET_INTERACT);
            var _local_2:int = _local_1.length;
            var _local_3:CLASS = CLASS.current;
            var _local_4:int;
            while (_local_4 < _local_2) {
                _local_5 = _local_1[_local_4];
                _local_6 = _local_5.itemType;
                this.interactItemFactorys[_local_6] = _local_3.tryNewInstance(_local_5.className, [_local_6]);
                _local_4++;
            };
        }

        public function newFactory(_arg_1:InteractItemStaticInfo, _arg_2:CLASS):void
        {
            var _local_3:int = _arg_1.type;
            if (this.interactItemFactorys[_local_3] != null){
                return;
            };
            if (_arg_2 == null){
                _arg_2 = CLASS.current;
            };
            this.interactItemFactorys[_local_3] = _arg_2.newInstance("", [_local_3]);
        }

        public function getFactory(_arg_1:int):IInteractItemFactory
        {
            return (this.interactItemFactorys[_arg_1]);
        }

        public function disposeFactory(_arg_1:int):void
        {
        }

        public function getResource():IInteractItemAssetManager
        {
            return (this.resManager);
        }

        public function newManager(_arg_1:Class=null):IInteractItemManager
        {
            if (_arg_1 == null){
                _arg_1 = InteractItemManager;
            };
            return (new (_arg_1)(this, this.data));
        }

        public /*  ©init. */ function _SafeStr_576()
        {
        }


    }
}//package com.tencent.ai.core.interact.impl

// _SafeStr_576 = " InteractItemSystem" (String#13925)


