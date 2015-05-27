// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.npc.res.NpcAssetManager

package com.tencent.ai.core.npc.res
{
    import com.tencent.ai.core.npc.INpcAssetManager;
    import flash.utils.Dictionary;
    import com.tencent.free.core.manager.task.Priority;
    import  ©init._SafeStr_815;

    public class NpcAssetManager implements INpcAssetManager 
    {

        protected var assetDict:Dictionary;

        public function NpcAssetManager()
        {
            this.assetDict = new Dictionary();
        }

        public function getNpcAsset(_arg_1:int, _arg_2:String):NpcAsset
        {
            var _local_3:NpcAsset = this.assetDict[_arg_2];
            if (!_local_3){
                _local_3 = new NpcAsset(_arg_1, _arg_2);
                _local_3.priority = Priority.PERIORITY_NORMAL_NPC;
                this.assetDict[_arg_2] = _local_3;
            };
            return (_local_3);
        }

        public function disposeNpcAsset(_arg_1:NpcAsset):void
        {
            delete this.assetDict[_arg_1.assetURL];
        }

        public /*  ©init. */ function _SafeStr_815()
        {
        }


    }
}//package com.tencent.ai.core.npc.res

// _SafeStr_815 = " NpcAssetManager" (String#15974)


