// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.res.InteractItemAssetManager

package com.tencent.ai.core.interact.res
{
    import com.tencent.ai.core.interact.IInteractItemAssetManager;
    import com.tencent.ai.core.interact.IInteractItemSystem;
    import com.tencent.ai.core.effect.IEffectManager;
    import com.tencent.ai.core.manager.data.IDataManager;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.InteractItemStaticInfo;
    import com.tencent.free.core.manager.task.Priority;
    import  ©init._SafeStr_578;

    public class InteractItemAssetManager implements IInteractItemAssetManager 
    {

        protected var interactItemSys:IInteractItemSystem;
        protected var effect:IEffectManager;
        protected var data:IDataManager;
        protected var interactItemAssets:Dictionary;

        public function InteractItemAssetManager(_arg_1:IInteractItemSystem, _arg_2:IEffectManager, _arg_3:IDataManager)
        {
            this.interactItemSys = _arg_1;
            this.effect = _arg_2;
            this.data = _arg_3;
        }

        public function initialize():void
        {
            this.interactItemAssets = new Dictionary();
        }

        public function getInteractItemAssets(_arg_1:int):Array
        {
            var _local_4:InteractItemStaticInfo;
            var _local_2:Dictionary = this.data.getAllInteractItemStaticInfo();
            var _local_3:Array = [];
            for each (_local_4 in _local_2) {
                if (_local_4.loadType == _arg_1){
                    _local_3.push(this.getInteractItemAsset(_local_4, this));
                };
            };
            return (_local_3);
        }

        public function getInteractItemAssetByID(_arg_1:int, _arg_2:Object=null):InteractItemAsset
        {
            var _local_3:InteractItemStaticInfo = this.data.getInteractItemStaticInfo(_arg_1);
            return (this.getInteractItemAsset(_local_3, _arg_2));
        }

        public function getInteractItemAsset(_arg_1:InteractItemStaticInfo, _arg_2:Object=null):InteractItemAsset
        {
            if (!_arg_1){
                return (null);
            };
            var _local_3:int = _arg_1.assetID;
            var _local_4:InteractItemAsset = this.interactItemAssets[_local_3];
            if (_local_4 == null){
                _local_4 = new InteractItemAsset(_arg_1, this.interactItemSys);
                _local_4.priority = Priority.PERIORITY_NORMAL_INTERACTITEM;
                this.interactItemAssets[_local_3] = _local_4;
            };
            if (_arg_2 != null){
                _local_4.addRef(_arg_2);
            };
            return (_local_4);
        }

        public function returnInteractItemAsset(_arg_1:InteractItemAsset, _arg_2:Object=null):void
        {
            if (_arg_2 != null){
                _arg_1.removeRef(_arg_2);
                if (_arg_1.getRefsLen() == 0){
                    delete this.interactItemAssets[_arg_1.assetID];
                    _arg_1.unload();
                };
            };
        }

        public /*  ©init. */ function _SafeStr_578()
        {
        }


    }
}//package com.tencent.ai.core.interact.res

// _SafeStr_578 = " InteractItemAssetManager" (String#14300)


